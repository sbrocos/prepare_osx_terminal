#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
# brew upgrade --all

# Install `zsh`
if ! [ -f ~/.zshrc ]
then
	brew install zsh zsh-completions
	# ohmyzsh
	curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
	# use zsh
	chsh -s /usr/local/bin/zsh
	brew install zsh zsh-completions
fi

# Install GNU core utilities (those that come with OS X are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names

# install `wget` with IRI support.
if ! [ $(which wget) ]
then
	brew install wget --with-iri
fi

# create theme folder
if ! [ -d ~/themes ]
then
	$(mkdir ~/themes)
	$(git clone https://github.com/morhetz/gruvbox-contrib.git ~/themes/gruvbox)
	$(git clone https://github.com/MartinSeeler/iterm2-material-design.git ~/themes/iterm2-material-design)
fi

# For use service of brew like mysql, postgress, etc
brew tap homebrew/services

# VIM and other tools
if ! [ -d /usr/local/Cellar/vim/ ]
then
	brew install vim --override-system-vi
fi
if [[ $(gpg)=~"command not found" ]]
then
	$(brew install gnupg)
fi

if [[ $(rvm)=~"command not found" ]]
then
	$(gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB)
	$(\curl -sSL https://get.rvm.io | bash -s stable)
fi

# Install Cask
if ! [[ $(brew cask --version)=~"Homebrew-Cask" ]]
then
	brew install caskroom/cask/brew-cask
	brew tap caskroom/versions
	brew tap caskroom/fonts
fi

# Install Iterm2
if ! [ -d ~/Applications/iTerm.app ]
then
	brew cask install --appdir="~/Applications" iterm2
fi

# Install Sublime text 3
if ! [ -d /Applications/Sublime\ Text.app ]
then
	brew cask install --appdir="/Applications" sublime-text3
fi

# Install Google Chrome
if ! [ -d /Applications/Google\ Chrome.app ]
then
	brew cask install --appdir="/Applications" google-chrome
fi

# Fonts
# Install Nerd Fonts
brew cask install font-hack-nerd-font

# Remove outdated versions from the cellar.
brew cleanup

