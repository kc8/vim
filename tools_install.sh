echo "This is a work in progress. Currently treat this as a list of things to manually do"
exit

BIN_OUT_PATH="/usr/local/bin"
#ghostty
  curl https://release.files.ghostty.org/1.2.2/Ghostty.dmg -O
#ohmyzsh
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
#tmux
  curl https://github.com/tmux/tmux/releases/download/3.5a/tmux-3.5a.tar.gz -L -O
  ./configure && make
  sudo make install
#neovim
  curl https://github.com/neovim/neovim/releases/download/stable/nvim-macos-arm64.tar.gz -L -O
  mv nvim-macos-arm64.tar.gz ./nvim.tar.gz
  tar -xzvf nvim-macos-arm64.tar.gz -C $BIN_OUT_PATH
#tfenv
  git clone --depth=1 https://github.com/tfutils/tfenv.git ~/.tfenv
#node
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
  \. "$HOME/.nvm/nvm.sh"
  nvm install 22
  # Print versions of node and npm
  node -v
  npm -v

#golang
  curl https://go.dev/dl/go1.25.3.darwin-arm64.pkg -O
#github cli, this before git + ssh because I think it can generate ssh tokens for me =)
  curl https://github.com/cli/cli/releases/download/v2.82.0/gh_2.82.0_macOS_arm64.zip -O
#git (need ssh auth)
  echo "GIT NEEDS SSH AUTH"
#jq
  curl https://github.com/jqlang/jq/releases/download/jq-1.8.1/jq-macos-arm64 -O -L
#aws vpn
  curl https://d20adtppz83p9s.cloudfront.net/OSX/latest/AWS_VPN_Client.pkg -O -L
#gnu-core-tools
  # 1. on mac os brew install coreutils grep gnu-sed gnu-tar gnu-which

#github repos cloned into ~/projects?

#firefox
#pureRef
#flameshot
#copilot cli
#auth to artifactory
#docker
#duckdb
