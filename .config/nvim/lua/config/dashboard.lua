local home= os.getenv('HOME')
local db=require('dashboard')

--
db.preview_file_path= home .. '/.config/nvim/lua/config/dashboard-headers/Frog10.jpg'
db.preview_command = 'wezterm'
db.preview_file_height=100
db.preview_file_width=100
db.custom_center= {
    {icon = '  ',
    desc = 'Recent Files',
    --action='DashboardFindHistory'},
    shortcut= '<leader> drf'},
    {icon = '  ',
    desc = 'Find File',
    --action='Telescope find_files=rg, --hidden'},
    shortcut = '<leader> ff'},
    {icon='  ',
    desc='Toggle Nvim Tree',
    action='NvimTreeToggle',
    shortcut='<leader> tt'},
    {icon='  ',
    desc='Git Status',
    action='Git status'},
    {icon='  ',
    desc='Open terminal',
    action='term'},
    {icon='  ',
    desc='Open User Dotfiles',
    action='Telescope dotfiles path=' .. home ..'/.config'},
}
