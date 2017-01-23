echo "\nInstalling Vim, Zsh, Tmux, Git..."
sudo apt-get install vim-gtk zsh tmux git

echo "\nAdding Symlinks..."
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/.vimrc.local ~/.vimrc.local
ln -s ~/dotfiles/.vimrc.bundles.local ~/.vimrc.bundles.local

echo "\nInstalling SPF13..."
curl https://j.mp/spf13-vim3 -L > spf13-vim.sh && sh spf13-vim.sh

echo "\nInstalling Oh My Zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
rm -f ~/.zshrc && ln -s ~/dotfiles/.zshrc ~/.zshrc

echo "\nInstalling zsh-autosuggestions..."
git clone git://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions

echo "\nInstalling fzf..."
git clone git@github.com:junegunn/fzf.git
./fzf/install

echo "\nInstalling solarized terminal theme..."
sudo apt-get install dconf-cli
git clone https://github.com/Anthony25/gnome-terminal-colors-solarized.git
cd gnome-terminal-colors-solarized
./install.sh
git clone git@github.com:seebi/dircolors-solarized.git
cd ..

echo "\nFinishing Up..."
tmux source-file ~/.tmux.conf
exec zsh

echo "Done!"
