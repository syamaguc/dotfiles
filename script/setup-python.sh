#!/bin/bash

sudo apt update -y && sudo apt install -y --no-install-recommends \
    make build-essential libssl-dev zlib1g-dev libbz2-dev python3-venv\
    libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev \
    xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev

# install pyenv
if [ ! -d ~/.pyenv ]; then
    git clone https://github.com/pyenv/pyenv.git ~/.pyenv
    echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
    echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
    echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.bashrc
fi

# install virtualenv plugin
if [ ! -d $(pyenv root)/plugins/pyenv-virtualenv ]; then
    git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv
    echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.bashrc
fi

# install poetry
if [ ! -d ~/.poetry ]; then
    curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python
    poetry completions bash > /etc/bash_completion.d/poetry.bash-completion
    poetry config virtualenvs.in-project true
fi


# for neovim python2
if [ ! -d $(pyenv root)/versions/neovim2 ]; then
    pyenv install 2.7.15
    pyenv virtualenv 2.7.15 neovim2
fi
pyenv activate neovim2
pip install --upgrade pip
pip install neovim
pyenv which python

# for neovim python3
if [ ! -d $(pyenv root)/versions/neovim3 ]; then
    pyenv install 3.8.5
    pyenv virtualenv 3.8.5 neovim3
fi
pyenv activate neovim3
pip install --upgrade pip
pip install neovim
pyenv which python

exec "$SHELL"
