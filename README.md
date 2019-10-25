# Dotfiles

My personal dotfiles for X11, zsh, vim, tmux,
i3, qutebrowser and more

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
- Modify the following lines in `~/.muttrc`:

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

- Enter an email address and realname on the first two lines of each new file that was created

- Create a new file for each `my_account_n` created,
and enter the following contents, replacing 'password'
with the account's actual password:
```
set imap_pass="password"
set smtp_pass="password"
```

Then encrypt the files with gpg by executing:

```
$ gpg -er <my_gpg_user> account_passwords.txt
$ shred account_passwords.txt
$ rm account_passwords.txt
```

Replacing `<my_gpg_user>` with the value set in `~/.muttrc`

If everything was done properly, executing `mutt` should result
in a password prompt to decrypt the gpg file for `my_account_1`

Pressing F2, F3, and F4 should then changes the active account
to `my_account_1`, `my_account_2`, and `my_account_3` respectively
