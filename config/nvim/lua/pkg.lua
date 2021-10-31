local M = {}

M.packages = {}

M.paths = {
   packages = vim.fn.stdpath("data") .. "/site/pack/pkg/opt/",
   package_list = vim.fn.stdpath("config") .. "/packages.lua"
}

local url_patterns = {
   generic = "^([^/]+)/([^/]+)$",
   github = "^https://github.com/([^/]+)/([^/]+)$",
}

local function parse_url(url)
   for name, pattern in pairs(url_patterns) do
      local author, repo = string.match(url, pattern)

      if author and repo then
         if name == "generic" then
            url = "https://github.com/" .. url
         end

         return author, repo, url
      end
   end
end



local function ensure_file(path)
   local readable = vim.fn.filereadable(M.paths.package_list) ~= 0

   if not readable then
      local fd = vim.loop.fs_open(path, "w", tonumber("644", 8))
      readable = vim.loop.fs_write(fd, "") ~= 0
      vim.loop.fs_close(fd)
   end

   return readable
end



local git = {}

git.clone = function(package, on_success)
   -- No vim.loop here, want to make sure packages are installed
   -- on startup so we have to wait anyway. Ideally this would
   -- download stuff in parallel (much faster!) but I'm lazy and
   -- don't care :)
   vim.fn.system(
      string.format("git clone --depth=1 %s %s",
         package.url, package.dir))

   if vim.v.shell_error == 0 then
      on_success(package)
   else
      print("Failed to fetch package from " .. package.url)
   end
end

git.pull = function(package, on_success)
   vim.loop.spawn("git",
      {
         args = {
            "pull",
            "--update-shallow",
            "--ff-only",
            "--rebase=false",
            "--progress",
         },
         cwd = package.dir,
      },
      vim.schedule_wrap(
         function(code)
            if code == 0 then
               on_success(package)
            else
               print("Failed to update package "
                  .. package.dir
                  .. " from " .. package.url)
            end
         end))
end



Package = {
   url = "",
   dir = "",
   name = "",
   loaded = false,
}
Package.__index = Package

local function on_fetch(package)
   if package.hooks.fetch then
      package.hooks.fetch(package)
   end

   package:load()
end

function Package:new(url)
   local _, repo, git_url = parse_url(url)

   local o = {
      url = git_url,
      dir = M.paths.packages .. repo,
      name = repo,
      loaded = false,
      hooks = {},
   }

   setmetatable(o, Package)

   return o
end

function Package:load()
   vim.cmd("packadd! " .. self.name)

   self.loaded = true
end

function Package:update()
   if vim.fn.isdirectory(self.dir) == 0 then
      print("Installing " .. self.name)
      git.clone(self, on_fetch)
      print("Done")
   else
      git.pull(self, on_fetch)
   end
end

function Package:install()
   if vim.fn.isdirectory(self.dir) == 0 then
      print("Package " .. self.name
         .. " is registered but not installed, installing")
      git.clone(self, on_fetch)
      print("Done")
   end
end



function M.hook(url, hooks)
   local _, _, git_url = parse_url(url)
   local pkg = nil

   for _, p in pairs(M.packages) do
      if p.url == git_url then
         pkg = p
         break
      end
   end

   if pkg then
      for k, v in pairs(hooks) do
         pkg.hooks[k] = v
      end
   end
end

function M.add(url)
   local pkg = Package:new(url)
   table.insert(M.packages, pkg)
   pkg:install()

   if ensure_file(M.paths.package_list) then
      local cmd = "echo 'use { \"%s\" }' >> %s";
      cmd = string.format(cmd, pkg.url, M.paths.package_list)
      vim.fn.system(cmd)
   end

   vim.cmd("helptags ALL")
end

function M.update()
   for _, pkg in pairs(M.packages) do
      pkg:update()
   end

   vim.cmd("helptags ALL")
end

function M.init()
   vim.fn.mkdir(M.paths.packages, "p")
   vim.cmd([[
      command! -nargs=1 PkgAdd lua require("pkg").add(<f-args>)
      command! PkgUpdate lua require("pkg").update()
   ]])

   if vim.fn.filereadable(M.paths.package_list) then
      _G.use = function(options)
         local url = options[1]
         local pkg = Package:new(url)
         table.insert(M.packages, pkg)
         pkg:install()
      end

      dofile(M.paths.package_list)

      _G.use = nil
   end
end

function M.load()
   for _, pkg in pairs(M.packages) do
      pkg:load()
   end
end

function M.init_load()
   M.init()
   M.load()
end

function M.has(name)
   local _, _, git_url = parse_url(name)

   for _, p in pairs(M.packages) do
      if p.url == git_url or p.name == name then
         return true
      end
   end

   return false
end

return M

