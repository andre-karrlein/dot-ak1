#!/bin/bash

if [ ! -x "$(command -v node)" ]; then
    curl --fail -LSs https://install-node.now.sh/latest | sh
    export PATH="/usr/local/bin/:$PATH"
    # Or use apt-get
    # sudo apt-get install nodejs
fi

mkdir -p ~/.config/coc/extensions
cp package.json ~/.config/coc/extensions/.

cp coc-settings.json ~/.config/nvim/.

npm install coc-snippets --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod
