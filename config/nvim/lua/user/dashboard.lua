local g = vim.g
g.dashboard_session_directory = '~/.config/nvim/.sessions'
g.dashboard_default_executive ='telescope'
g.dashboard_custom_section = {
    a = {description = {"  Find File                 leader f f"}, command = "Telescope find_files"},
    b = {description = {"  Recently Used Files       leader f h"}, command = "Telescope oldfiles"},
    c = {description = {"  Load Last Session         leader l  "}, command = "SessionLoad"},
    d = {description = {"  Find Word                 leader f g"}, command = "Telescope live_grep"},
    e = {description = {"  New File                  leader e n"}, command = "DashboardNewFile"},
    -- e = {description = {"  Bookmarks                 leader m  "}, command = "Telescope marks"},
    f = {description = {"  Update Plugins            leader u  "}, command = "PackerUpdate"},
    g = {description = {"  Neovim Config             leader e v"}, command = "edit $MYVIMRC"},
    h = {description = {"  Exit                      leader q  "}, command = "exit"}
}

g.dashboard_custom_footer = {'“I realized that intimidation didn’t really exist if you’re in the right frame of mind."',
                             '',
                             '      - Kobe Bryant'}
vim.cmd [[
augroup dashboard_au
     autocmd! * <buffer>
     autocmd User dashboardReady let &l:stl = 'Dashboard'
     autocmd User dashboardReady nnoremap <buffer> <leader>q <cmd>exit<CR>
     autocmd User dashboardReady nnoremap <buffer> <leader>u <cmd>PackerUpdate<CR>
     autocmd User dashboardReady nnoremap <buffer> <leader>l <cmd>SessionLoad<CR>
augroup END
]]

vim.cmd [[nmap <Leader>ss :<C-u>SessionSave<CR>]]
-- g.dashboard_preview_command = 'cat'
-- g.dashboard_preview_pipeline = 'lolcat'
-- g.dashboard_preview_file = "~/.config/nvim/neovim_ascii.txt"
-- g.dashboard_preview_file_height = 8
-- g.dashboard_preview_file_width = 60

g.dashboard_custom_header = {
    '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡀⠀⠀⠀⠀⢀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ',
    '⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⡖⠁⠀⠀⠀⠀⠀⠀⠈⢲⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀ ',
    '⠀⠀⠀⠀⠀⠀⠀⠀⣼⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⣧⠀⠀⠀⠀⠀⠀⠀⠀ ',
    '⠀⠀⠀⠀⠀⠀⠀⣸⣿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣿⣇⠀⠀⠀⠀⠀⠀⠀ ',
    '⠀⠀⠀⠀⠀⠀⠀⣿⣿⡇⠀⢀⣀⣤⣤⣤⣤⣀⡀⠀⢸⣿⣿⠀⠀⠀⠀⠀⠀⠀ ',
    '⠀⠀⠀⠀⠀⠀⠀⢻⣿⣿⣔⢿⡿⠟⠛⠛⠻⢿⡿⣢⣿⣿⡟⠀⠀⠀⠀⠀⠀⠀ ',
    '⠀⠀⠀⠀⣀⣤⣶⣾⣿⣿⣿⣷⣤⣀⡀⢀⣀⣤⣾⣿⣿⣿⣷⣶⣤⡀⠀⠀⠀⠀ ',
    '⠀⠀⢠⣾⣿⡿⠿⠿⠿⣿⣿⣿⣿⡿⠏⠻⢿⣿⣿⣿⣿⠿⠿⠿⢿⣿⣷⡀⠀⠀ ',
    '⠀⢠⡿⠋⠁⠀⠀⢸⣿⡇⠉⠻⣿⠇⠀⠀⠸⣿⡿⠋⢰⣿⡇⠀⠀⠈⠙⢿⡄⠀ ',
    '⠀⡿⠁⠀⠀⠀⠀⠘⣿⣷⡀⠀⠰⣿⣶⣶⣿⡎⠀⢀⣾⣿⠇⠀⠀⠀⠀⠈⢿⠀ ',
    '⠀⡇⠀⠀⠀⠀⠀⠀⠹⣿⣷⣄⠀⣿⣿⣿⣿⠀⣠⣾⣿⠏⠀⠀⠀⠀⠀⠀⢸⠀ ',
    '⠀⠁⠀⠀⠀⠀⠀⠀⠀⠈⠻⢿⢇⣿⣿⣿⣿⡸⣿⠟⠁⠀⠀⠀⠀⠀⠀⠀⠈⠀ ',
    '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣼⣿⣿⣿⣿⣧⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ',
    '⠀⠀⠀⠐⢤⣀⣀⢀⣀⣠⣴⣿⣿⠿⠋⠙⠿⣿⣿⣦⣄⣀⠀⠀⣀⡠⠂⠀⠀⠀ ',
    '⠀⠀⠀⠀⠀⠈⠉⠛⠛⠛⠛⠉⠀⠀⠀⠀⠀⠈⠉⠛⠛⠛⠛⠋⠁⠀⠀⠀⠀⠀ ',
    }

g.dashboard_custom_header = {
    '⣿⣿⣿⣿⣿⣿⣿⣿⡿⠿⠛⠛⠛⠋⠉⠈⠉⠉⠉⠉⠛⠻⢿⣿⣿⣿⣿⣿⣿⣿',
    '⣿⣿⣿⣿⣿⡿⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠛⢿⣿⣿⣿⣿',
    '⣿⣿⣿⣿⡏⣀⠀⠀⠀⠀⠀⠀⠀⣀⣤⣤⣤⣄⡀⠀⠀⠀⠀⠀⠀⠀⠙⢿⣿⣿',
    '⣿⣿⣿⢏⣴⣿⣷⠀⠀⠀⠀⠀⢾⣿⣿⣿⣿⣿⣿⡆⠀⠀⠀⠀⠀⠀⠀⠈⣿⣿',
    '⣿⣿⣟⣾⣿⡟⠁⠀⠀⠀⠀⠀⢀⣾⣿⣿⣿⣿⣿⣷⢢⠀⠀⠀⠀⠀⠀⠀⢸⣿',
    '⣿⣿⣿⣿⣟⠀⡴⠄⠀⠀⠀⠀⠀⠀⠙⠻⣿⣿⣿⣿⣷⣄⠀⠀⠀⠀⠀⠀⠀⣿',
    '⣿⣿⣿⠟⠻⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠶⢴⣿⣿⣿⣿⣿⣧⠀⠀⠀⠀⠀⠀⣿',
    '⣿⣁⡀⠀⠀⢰⢠⣦⠀⠀⠀⠀⠀⠀⠀⠀⢀⣼⣿⣿⣿⣿⣿⡄⠀⣴⣶⣿⡄⣿',
    '⣿⡋⠀⠀⠀⠎⢸⣿⡆⠀⠀⠀⠀⠀⠀⣴⣿⣿⣿⣿⣿⣿⣿⠗⢘⣿⣟⠛⠿⣼',
    '⣿⣿⠋⢀⡌⢰⣿⡿⢿⡀⠀⠀⠀⠀⠀⠙⠿⣿⣿⣿⣿⣿⡇⠀⢸⣿⣿⣧⢀⣼',
    '⣿⣿⣷⢻⠄⠘⠛⠋⠛⠃⠀⠀⠀⠀⠀⢿⣧⠈⠉⠙⠛⠋⠀⠀⠀⣿⣿⣿⣿⣿',
    '⣿⣿⣧⠀⠈⢸⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠟⠀⠀⠀⠀⢀⢃⠀⠀⢸⣿⣿⣿⣿',
    '⣿⣿⡿⠀⠴⢗⣠⣤⣴⡶⠶⠖⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⡸⠀⣿⣿⣿⣿',
    '⣿⣿⣿⡀⢠⣾⣿⠏⠀⠠⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠛⠉⠀⣿⣿⣿⣿',
    '⣿⣿⣿⣧⠈⢹⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⣿⣿⣿⣿',
    '⣿⣿⣿⣿⡄⠈⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣴⣾⣿⣿⣿⣿⣿',
    '⣿⣿⣿⣿⣧⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿',
    '⣿⣿⣿⣿⣷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿',
    '⣿⣿⣿⣿⣿⣦⣄⣀⣀⣀⣀⠀⠀⠀⠀⠘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿',
    '⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡄⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿',
    '⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⠀⠀⠀⠙⣿⣿⡟⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿',
    '⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠇⠀⠁⠀⠀⠹⣿⠃⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿',
    '⣿⣿⣿⣿⣿⣿⣿⣿⡿⠛⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⢐⣿⣿⣿⣿⣿⣿⣿⣿⣿',
    '⣿⣿⣿⣿⠿⠛⠉⠉⠁⠀⢻⣿⡇⠀⠀⠀⠀⠀⠀⢀⠈⣿⣿⡿⠉⠛⠛⠛⠉⠉',
    '⣿⡿⠋⠁⠀⠀⢀⣀⣠⡴⣸⣿⣇⡄⠀⠀⠀⠀⢀⡿⠄⠙⠛⠀⣀⣠⣤⣤⣤⣴',
}

-- g.dashboard_custom_header = {
--     "                                      ....                                  ",
--     "                                    .'' .'''                                ",
--     "    .                             .'   :                                    ",
--     "    \\                          .:    :                                     ",
--     "     \\                        _:    :       ..----.._                      ",
--     "      \\                    .:::.....:::.. .'         ''.                   ",
--     "       \\                 .'  #-. .-######'     #        '.                 ",
--     "        \\                 '.##'/ ' ################       :                ",
--     "         \\                  #####################         :                ",
--     "          \\               ..##.-.#### .''''###'.._        :                ",
--     "           \\             :--:########:            '.    .' :               ",
--     "            \\..__...--.. :--:#######.'   '.         '.     :               ",
--     "            :     :  : : '':'-:'':'::        .         '.  .'               ",
--     "            '---'''..: :    ':    '..'''.      '.        :'                 ",
--     "               \\  :: : :     '      ''''''.     '.      .:                 ",
--     "                \\ ::  : :     '            '.      '      :                ",
--     "                 \\::   : :           ....' ..:       '     '.              ",
--     "                  \\::  : :    .....####\\ .~~.:.             :             ",
--     "                   \\':.:.:.:'#########.===. ~ |.'-.   . '''.. :            ",
--     "                    \\    .'  ########## \\ \\ _.' '. '-.       '''.          ",
--     "                    :\\  :     ########   \\ \\      '.  '-.        :         ",
--     "                   :  \\'    '   #### :    \\ \\      :.    '-.      :        ",
--     "                  :  .'\\   :'  :     :     \\ \\       :      '-.    :       ",
--     "                 : .'  .\\  '  :      :     :\\ \\       :        '.   :      ",
--     "                 ::   :  \\'  :.      :     : \\ \\      :          '. :      ",
--     "                 ::. :    \\  : :      :    ;  \\ \\     :           '.:      ",
--     "                  : ':    '\\ :  :     :     :  \\:\\     :        ..'        ",
--     "                     :    ' \\ :        :     ;  \\|      :   .'''           ",
--     "                     '.   '  \\:                         :.''               ",
--     "                      .:..... \\:       :            ..''                   ",
--     "                     '._____|'.\\......'''''''.:..'''                       ",
--     "                                \\                                          "
-- }
--

-- g.dashboard_custom_header = {
--        "            :h-                                  Nhy`               ",
--        "           -mh.                           h.    `Ndho               ",
--        "           hmh+                          oNm.   oNdhh               ",
--        "          `Nmhd`                        /NNmd  /NNhhd               ",
--        "          -NNhhy                      `hMNmmm`+NNdhhh               ",
--        "          .NNmhhs              ```....`..-:/./mNdhhh+               ",
--        "           mNNdhhh-     `.-::///+++////++//:--.`-/sd`               ",
--        "           oNNNdhhdo..://++//++++++/+++//++///++/-.`                ",
--        "      y.   `mNNNmhhhdy+/++++//+/////++//+++///++////-` `/oos:       ",
--        " .    Nmy:  :NNNNmhhhhdy+/++/+++///:.....--:////+++///:.`:s+        ",
--        " h-   dNmNmy oNNNNNdhhhhy:/+/+++/-         ---:/+++//++//.`         ",
--        " hd+` -NNNy`./dNNNNNhhhh+-://///    -+oo:`  ::-:+////++///:`        ",
--        " /Nmhs+oss-:++/dNNNmhho:--::///    /mmmmmo  ../-///++///////.       ",
--        "  oNNdhhhhhhhs//osso/:---:::///    /yyyyso  ..o+-//////////:/.      ",
--        "   /mNNNmdhhhh/://+///::://////     -:::- ..+sy+:////////::/:/.     ",
--        "     /hNNNdhhs--:/+++////++/////.      ..-/yhhs-/////////::/::/`    ",
--        "       .ooo+/-::::/+///////++++//-/ossyyhhhhs/:///////:::/::::/:    ",
--        "       -///:::::::////++///+++/////:/+ooo+/::///////.::://::---+`   ",
--        "       /////+//++++/////+////-..//////////::-:::--`.:///:---:::/:   ",
--        "       //+++//++++++////+++///::--                 .::::-------::   ",
--        "       :/++++///////////++++//////.                -:/:----::../-   ",
--        "       -/++++//++///+//////////////               .::::---:::-.+`   ",
--        "       `////////////////////////////:.            --::-----...-/    ",
--        "        -///://////////////////////::::-..      :-:-:-..-::.`.+`    ",
--        "         :/://///:///::://::://::::::/:::::::-:---::-.-....``/- -   ",
--        "           ::::://::://::::::::::::::----------..-:....`.../- -+oo/ ",
--        "            -/:::-:::::---://:-::-::::----::---.-.......`-/.      ``",
--        "           s-`::--:::------:////----:---.-:::...-.....`./:          ",
--        "          yMNy.`::-.--::..-dmmhhhs-..-.-.......`.....-/:`           ",
--        "         oMNNNh. `-::--...:NNNdhhh/.--.`..``.......:/-              ",
--        "        :dy+:`      .-::-..NNNhhd+``..`...````.-::-`                ",
--        "                        .-:mNdhh:.......--::::-`                    ",
--        "                           yNh/..------..`                          ",
--        "                                                                    ",
--        "                              N E O V I M                           ",
--        }
--


local uv = vim.loop
local api = vim.api

local open_window = function (bn)
  local width = vim.g.dashboard_preview_file_width
  local height = vim.g.dashboard_preview_file_height
  local row = math.floor(height / 5)
  local col = math.floor((vim.o.columns - width) / 2)

  local opts = {
    relative = 'editor',
    row = row,
    col = col,
    width = width,
    height =height,
    style = 'minimal'
  }

  local bufnr = bn or nil

  if not bufnr then
    bufnr = api.nvim_create_buf(false,true)
  end
  local winid = api.nvim_open_win(bufnr,true,opts)
  api.nvim_win_set_option(winid,"winhl","Normal:DashboardTerminal")
  api.nvim_command('hi DashboardTerminal guibg=NONE gui=NONE')
  return {bufnr,winid}
end

local async_preview = uv.new_async(vim.schedule_wrap(function()
  local wininfo = open_window()
  local pipline = ''
  if string.len(vim.g.preview_pipeline_command) > 0 then
    pipline = ' |' .. vim.g.preview_pipeline_command
  end
  local cmd = 'terminal '..vim.g.dashboard_command..' '..vim.g.preview_file_path ..pipline
  api.nvim_command(cmd)
  api.nvim_command('wincmd j')
  api.nvim_buf_set_option(wininfo[1],'buflisted',false)
  api.nvim_win_set_var(0,'dashboard_preview_winid',wininfo[2])
  api.nvim_command('let b:term_title ="dashboard_preview" ')
end))

local open_preview =function()
  async_preview:send()
end

return {
  open_window = open_window,
  open_preview = open_preview
}
