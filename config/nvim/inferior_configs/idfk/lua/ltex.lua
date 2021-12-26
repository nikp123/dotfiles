local M = {}

function M.toggle()
    vim.cmd [[
        if index(g:coc_user_config.ltex.enabled, &filetype) < 0
            call add(g:coc_user_config.ltex.enabled, &filetype)
            silent CocRestart
            CocCommand ltex.activateExtension
        else
            call filter(g:coc_user_config.ltex.enabled, {idx, val -> val != &filetype})
            silent CocRestart
        endif
    ]]
end

return M
