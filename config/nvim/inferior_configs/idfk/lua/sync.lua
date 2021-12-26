local M = {}

local theme = require('lualine').get_config().options.theme
if type(theme) == 'string' then
    theme = require('lualine.themes.'..theme)
end

function M.tmuxline()
    local f = function(s)
        return '"'..string.lower(s)..'"'
    end

    local c = function(k, v)
        return string.format([[ -e 's/^\(\s*%s\s*=\s*\)\S.*/\1%s/' ]], k, v)
    end

    os.execute (
        'sed -i' ..
        c('FGL1', f(theme.normal.a.fg)) ..
        c('FGL2', f(theme.normal.c.fg)) ..
        c('FGL3', f(theme.normal.b.fg)) ..
        c('FGR1', f(theme.normal.a.fg)) ..
        c('FGR2', f(theme.normal.b.fg)) ..
        c('FGR3', f(theme.normal.c.fg)) ..
        c('FGLC', f(theme.replace.a.bg)) ..
        c('BGL1', f(theme.normal.a.bg)) ..
        c('BGL2', f(theme.normal.c.bg)) ..
        c('BGL3', f(theme.normal.b.bg)) ..
        c('BGR1', f(theme.normal.a.bg)) ..
        c('BGR2', f(theme.normal.b.bg)) ..
        '~/.tmuxline.conf &> /dev/null'
    )

    os.execute('tmux source ~/.tmuxline.conf')
end

function M.xfce4(alpha)
    alpha = tostring(alpha or 1)

    local f = function(s)
        local c = string.format('%06x', s)
        return '#'..c:sub(1,2)..c:sub(1,2)..c:sub(3,4)..c:sub(3,4)..c:sub(5,6)..c:sub(5,6)
    end

    local c = function(k, v)
        return string.format([[ -e "s/^\(\s*%s\s*=\s*\)\S.*/\1%s/" ]], k, v)
    end

    local normal = vim.api.nvim_get_hl_by_name('Normal', true)

    if normal.background then
        os.execute (
            'sed -i' ..
            c('BackgroundDarkness', alpha) ..
            c('ColorBackground', f(normal.background)) ..
            c('ColorForeground', f(normal.foreground)) ..
            c('ColorCursor', f(normal.foreground)) ..
            '~/.config/xfce4/terminal/terminalrc &> /dev/null'
        )
    else
        os.execute (
            'sed -i' ..
            c('BackgroundDarkness', alpha) ..
            '~/.config/xfce4/terminal/terminalrc &> /dev/null'
        )
    end
end

function M.alacritty(alpha)
    alpha = tostring(alpha or 1)

    local f = function(s)
        return "'0x"..string.format('%06x', s).."'"
    end

    local c = function(k, v)
        return string.format([[ -e "s/^\(\s*%s\s*:\s*\)\S.*/\1%s/" ]], k, v)
    end

    local normal = vim.api.nvim_get_hl_by_name('Normal', true)

    if normal.background then
        os.execute (
            'sed -i' ..
            c('background_opacity', alpha) ..
            c('background', f(normal.background)) ..
            c('foreground', f(normal.foreground)) ..
            c('text', f(normal.background)) ..
            c('cursor', f(normal.foreground)) ..
            '~/.config/alacritty/alacritty.yml &> /dev/null'
        )
    else
        os.execute (
            'sed -i' ..
            c('background_opacity', alpha) ..
            '~/.config/alacritty/alacritty.yml &> /dev/null'
        )
    end
end

function M.i3()
    local c = function(k, v)
        return string.format([[ -e 's/^\(\s*set\s\+\$%s\s\+\)\S.*/\1%s/' ]], k, v)
    end

    os.execute (
        'sed -i' ..
        c('FGL1', theme.normal.a.fg) ..
        c('FGL2', theme.normal.b.fg) ..
        c('FGLA', theme.visual.a.bg) ..
        c('FGR1', theme.normal.c.fg) ..
        c('FGR2', theme.normal.c.fg) ..
        c('FGRW', theme.insert.a.bg) ..
        c('FGRE', theme.replace.a.bg) ..
        c('BGL1', theme.normal.a.bg) ..
        c('BGL2', theme.normal.b.bg) ..
        c('BGL3', theme.normal.c.bg) ..
        c('BGLA', theme.normal.c.bg) ..
        '~/.config/i3/config &> /dev/null'
    )

    local f = function(s)
        return '"'..s..'"'
    end

    c = function(k, v)
        return string.format([[ -e 's/^\(\s*%s\s*=\s*\)\S.*/\1%s/' ]], k, v)
    end

    os.execute (
        'sed -i' ..
        c('color_good', f(theme.normal.a.bg)) ..
        c('color_degraded', f(theme.visual.a.bg)) ..
        c('color_bad', f(theme.replace.a.bg)) ..
        '~/.i3status.conf &> /dev/null'
    )

    os.execute('i3-msg reload')
end

function M.polybar()
    local c = function(k, v)
        return string.format([[ -e 's/^\(\s*%s\s*=\s*\)\S.*/\1%s/' ]], k, v)
    end

    os.execute (
        'sed -i' ..
            c('FGL1', theme.normal.a.fg) ..
            c('FGL2', theme.normal.b.fg) ..
            c('FGL3', theme.normal.c.fg) ..
            c('FGR1', theme.normal.a.fg) ..
            c('FGR2', theme.normal.b.fg) ..
            c('FGLC', theme.replace.a.bg) ..
            c('FGW1', theme.visual.a.fg) ..
            c('BGL1', theme.normal.a.bg) ..
            c('BGL2', theme.normal.b.bg) ..
            c('BGL3', theme.normal.c.bg) ..
            c('BGR1', theme.normal.a.bg) ..
            c('BGR2', theme.normal.b.bg) ..
            c('BGW1', theme.visual.a.bg) ..
            '~/.config/polybar/config &> /dev/null'
        )

  os.execute('bash ~/.config/polybar/launch.sh &> /dev/null')
end

function M.wallpaper()
    local f = function(s)
        return '"'..s..'"'
    end

    local c = function(k, v)
        return string.format([[ -e 's/^\(\s*%s\s*=\s*\)\S.*/\1%s/' ]], k, v)
    end

    os.execute (
        'sed -i' ..
        c('FC1', f(theme.normal.b.fg)) ..
        c('FC2', f(theme.normal.c.fg)) ..
        c('DC1', f(theme.visual.a.bg)) ..
        c('DC2', f(theme.normal.a.bg)) ..
        c('LC1', f(theme.normal.b.bg)) ..
        c('LC2', f(theme.insert.a.bg)) ..
        c('BG1', f(theme.normal.c.bg)) ..
        '~/.local/bin/wallpaper &> /dev/null'
    )

    os.execute('systemctl --user restart wallpaper')
end

function M.slip()
    local c = function(k, v)
        return string.format([[ -e 's/^\(\s*%s\s*=\s*\)\S.*/\1"%s"/' ]], k, v)
    end

    os.execute (
        'sed -i' ..
        c('FGRW', theme.insert.a.bg) ..
        c('FGRE', theme.replace.a.bg) ..
        c('BGL2', theme.normal.b.bg) ..
        '~/.config/slip/config &> /dev/null'
    )
end

function M.zathura(alpha)
    alpha = alpha or 1

    local rgba = function(c, a)
        return string.format (
            'rgba(%02d,%02d,%02d,%.2f)',
            bit.band(bit.rshift(c, 16), 0xFF),
            bit.band(bit.rshift(c,  8), 0xFF),
            bit.band(bit.rshift(c,  0), 0xFF),
            a
        )
    end

    local f = function(s)
        return '"#'..string.format('%06x', s)..'"'
    end

    local c = function(k, v)
        return string.format([[ -e 's/^\(set\s\+%s\s\+\)\S.*/\1%s/' ]], k, v)
    end

    local normal = vim.api.nvim_get_hl_by_name('Normal', true)

    if normal.background then
        os.execute (
            'sed -i' ..
            c('default-bg', rgba(normal.background, alpha)) ..
            c('default-fg', f(normal.foreground)) ..
            c('recolor-darkcolor', f(normal.foreground)) ..
            '~/.config/zathura/zathurarc &> /dev/null'
        )
    else
        os.execute (
            'sed -i' ..
            c('recolor-darkcolor', f(normal.foreground)) ..
            '~/.config/zathura/zathurarc &> /dev/null'
        )
    end
end

function M.colors(alpha)
    alpha = alpha or 1

    M.tmuxline()
    M.xfce4(alpha)
    M.alacritty(alpha)
    M.i3()
    M.polybar()
    M.wallpaper()
    M.slip()
    M.zathura(alpha)
end

return M
