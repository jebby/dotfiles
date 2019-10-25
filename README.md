# Dotfiles

My personal dotfiles

### File paths
| Filename | Destination |
| ------------- | --------------------- |
| flake8 | ~/.flake8 |
| gitconfig | ~/.gitconfig |
| tmux.conf | ~/.tmux.conf |
| vimrc | ~/.vimrc |
| xinitrc | ~/.xinitrc |
| xinputrc | ~/.xinputrc |
| Xresources | ~/.Xresources |
| zshrc | ~/.zshrc |
| muttrc | ~/.muttrc |


| Directory | Destination |
| ------------- | --------------------- |
| i3 | ~/.i3 |
| ipython | ~/.ipython |
| cmus | ~/.config/cmus |
| mplayer | ~/.mplayer |
| mutt | ~/.mutt |
| qutebrowser | ~/.config/qutebrowser |
| zsh | ~/.zsh |

### Mutt account setup
- Change the following lines in `~/.muttrc`:

```
set my_gpg_user = ""
set my_account_1 = ""
set my_account_2 = ""
set my_account_3 = ""
```

`my_gpg_user` should be the email address to use to encrypt / decrypt passwords

`my_account_n` is an email address to be used in mutt


- Go to `~/.mutt/accounts/` and copy an appropriate template for each
`my_account_n`, replacing 'example' with the email address to be used.

- Enter an email address and realname on the first two lines of each file
that is created
