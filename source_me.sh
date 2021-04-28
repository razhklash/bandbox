#!/bin/bash

# this is used to set up our python virtual environment.

# to use: run `source source_me.sh` in your shell. this will set up the environment
# and add a prompt to let you know you're running inside.

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
export PYTHONPATH=$DIR

# install virtualenv if not present
python3 -m virtualenv --version
if [ "$?" != 0 ]; then
    pip3 install virtualenv
fi

# launch the virtualenv
venv_path="venv"
needs_pip_install=false
if [ ! -d "$venv_path" ]; then
    needs_pip_install=true
fi
python3 -m virtualenv -p /usr/bin/python3 --system-site-packages --prompt "(bandbox)" venv

# activate the virtualenv so we're running from inside of it
source $venv_path/bin/activate

# if the virtualenv directory was just created, install our pip dependencies
if [ "$needs_pip_install" = true ]; then
    pip3 install -r requirements.txt
fi
