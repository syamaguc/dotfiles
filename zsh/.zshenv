export ZDOTDIR=$HOME/.config/zsh
echo "Hello, $USER."

typeset -U path
path=(
  $HOME/.local/share/mise/shims(N-/)
  # Additional PATH
  $HOME/.local/bin(N-/)
  $HOME/bin(N-/)
  $path
)

# OS specific settings
case "$(uname -s)" in
Darwin)
  eval "$(/opt/homebrew/bin/brew shellenv)"
	;;

Linux)
	;;

CYGWIN* | MINGW32* | MSYS* | MINGW*) ;;

*) ;;

esac
