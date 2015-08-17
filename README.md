# ConfigVim
My personal vim configuration

## Installation

### clone
```shell
cd ~/.config && git clone --recursive git@github.com:Bew78LesellB/ConfigVim.git vim
```

### place config files

```shell
ln -s ~/.config/vim ~/.vim 
ln -s ~/.config/vim/vimrc ~/.vimrc
```

## Troubleshooting

### Lua indentation

If the lua indentation doesn't work properly for `else` and/or `elseif`, do the following command :
```shell
# AS ROOT

cp ~/.vim/indent/lua.vim /usr/share/vim/vim74/indent/lua.vim
```
