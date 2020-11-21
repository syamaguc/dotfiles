set runtimepath+=~/.vim_runtime

source ~/.vim_runtime/vimrcs/coc.vim
source ~/.vim_runtime/vimrcs/basic.vim
source ~/.vim_runtime/vimrcs/keybind.vim
source ~/.vim_runtime/vimrcs/plug.vim
source ~/.vim_runtime/vimrcs/plugins_config.vim
source ~/.vim_runtime/vimrcs/extended.vim

try
    source ~/.vim_runtime/vimrcs/my_configs.vim
catch

endtry
