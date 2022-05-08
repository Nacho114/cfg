# Cheatsheet

## Git

- git pull --prune -> todo: read on it
- git log -p -> Show more info
- git push --force-with-lease -> force push only if no new commit exists

- git rebase -i main    -> rebase current branch with main
- git rebase --continue -> continues rebase (e.g. after solving conflict)
- git rebase --abort    -> aborts ongoing rebase
- git commit --fixup=AZ -> commits changes to commit with id AZ
(can use tab for autocomplete).
- git reflog            -> reference log shows branch changes

## Pop-shell

- Super-m -> toggle between max-min size of window
- Super-enter -> Enter window adjustment mode
  - direction -> move window
  - shift+direction -> resize window
- Super-ctrl-direction -> toggle between workspace
- Super-esc -> Lock screen

## Terminal

- npm run dev | less @less @print @top

## Vim

- vs-code integration [here](https://www.barbarianmeetscoding.com/blog/boost-your-coding-fu-with-vscode-and-vim)
- Good tutorial [here](https://www.youtube.com/watch?v=wlR5gYd6um0)
- [vim as a language](https://benmccormick.org/2014/07/02/learning-vim-in-2014-vim-as-language)

## Tips

- K          -> go to vim manual for a vim keyword

## Moving

- gd         -> go down a definition
- ctrl-o     -> go to last location
- gx         -> open link (useful for .md navigation)
- ctrl-i     -> visual block
- zz         -> place current line in center of screen

## Text objects

- iw -> inner word
- it -> inner tag (content of HTML tag)
- i" -> inner quote
- ip -> inner paragraph
- as -> a sentence

example:

```ruby
    def get_down() 
        result = calculate(['what nice', 'two thing'], 2)
        result.to_json
    end
```

- yip -> will yank the whole thing!
- ci' -> changes inner quote
- ci[ -> changes inner []
- ci( -> changes inner ()

```html

<div class='users'>
    <p>Users List</p>
    <ul>
        <li>Alice</li>
        <li>Bob</li>
    </ul>
</div>
```

- cit -> changes inner tag, the cursor can be anywhere in the tag!
- dft -> delete everything including t
- dtt -> delete everything just before t

- f | t -> find with cursor position at including, excluding. (capital letters for backwards search).

example:

```ruby
    def get_down() 
        result = calculate(['what nice', 'two thing'], 2)
        result.to_json
    end
```

- yip -> will yank the whole thing!
- ci' -> changes inner quote
- ci[ -> changes inner []
- ci( -> changes inner ()

```html

<div class='users'>
    <p>Users List</p>
    <ul>
        <li>Alice</li>
        <li>Bob</li>
    </ul>
</div>
```

- cit -> changes inner tag, the cursor can be anywhere in the tag!
- dft -> delete everything including t
- dtt -> delete everything just before t

- f | t -> find with cursor position at including, excluding. (capital letters for backwards search).

### Editing

- > -> indent

### Closing

- C-w c -> closes tab

### Split

- :sp {fileName}  -> horizontal split
- :vsp {fileName} -> vertical split
- CTRL-w (hjkl)   -> move around split tab plugin
- CTRL-W s        -> horizontal split
- CTRL-W v        -> vertical split

### Copy & replace

- :%s/foo/bar/g -> search all `foo` and replace with `bar`

### Recording

- q-char -> start recording and store at char (e.g. char = a)
- q      -> stop recording
- @-char -> start macro stored at char

### Plugins

#### Telescope

- <C-x> go to file selection as a split
- <C-v> go to file selection as a vsplit

## Users

### Ubuntu

- Pop shell -> window tilling management
- Alacritty
- Firefox
    [no tabs](https://superuser.com/questions/1424478/can-i-hide-native-tabs-at-the-top-of-firefox)
    Tridactyl for vim
- Enhanced terminal comands:  https://github.com/ibraheemdev/modern-unix

