set runtimepath+=~/.vim_runtime

source ~/.vim_runtime/vimrcs/plug.vim
source ~/.vim_runtime/vimrcs/basic.vim
source ~/.vim_runtime/vimrcs/keybind.vim
source ~/.vim_runtime/vimrcs/extended.vim
source ~/.vim_runtime/vimrcs/plugins_config.vim

try
source ~/.vim_runtime/my_configs.vim
catch
endtry
