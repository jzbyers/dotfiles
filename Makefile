all: install

install:
	mkdir -p ~/.config/alacritty
	mkdir -p ~/.config/nvim

	[ -f ~/.zshrc ] || ln -s $(PWD)/zshrc ~/.zshrc
	[ -f ~/.config/alacritty/alacritty.yml ] || ln -s $(PWD)/alacritty.yml ~/.config/alacritty/alacritty.yml
	[ -f ~/.config/nvim/init.vim ] || ln -s $(PWD)/nvim_init.vim ~/.config/nvim/init.vim
	[ -f ~/.ideavimrc ] || ln -s $(PWD)/ideavimrc ~/.ideavimrc
	[ -f ~/.tmux.conf ] || ln -s $(PWD)/tmuxconf ~/.tmux.conf
	[ -f ~/.git-prompt.sh ] || ln -s $(PWD)/git-prompt.sh ~/.git-prompt.sh
	[ -f ~/.gitconfig ] || ln -s $(PWD)/gitconfig ~/.gitconfig
	[ -f ~/.oden_aliases ] || ln -s $(PWD)/oden_aliases ~/.oden_aliases
	[ -f ~/.oden_functions ] || ln -s $(PWD)/oden_functions ~/.oden_functions

clean:
	rm -f ~/.zshrc
	rm -f ~/.config/alacritty/alacritty.yml
	rm -f ~/.config/nvim/init.vim
	rm -f ~/.ideavimrc
	rm -f ~/.tmux.conf
	rm -f ~/.git-prompt.sh
	rm -f ~/.gitconfig
	rm -f ~/.oden_aliases
	rm -f ~/.oden_functions

.PHONY: all clean sync build run kill
