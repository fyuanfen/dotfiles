LeaderF
=======

This plugin is mainly used for locating files, buffers, mrus, tags in large project.

 - Written in Python.
 - Support fuzzy and regex searching.
 - Manage buffers and mrus.
 - Open multiple files at once.
 - [Extensible](https://github.com/Yggdroot/LeaderF-marks).

Screenshots
-----------

![NameOnly Mode][1]

![FullPath Mode][2]

Requirements
------------

 - vim7.3 or higher. Only support vim7.4.330 or higher after [v1.01](https://github.com/Yggdroot/LeaderF/releases/tag/v1.01).
 - vim compiled with Python support, you can check by using `echo has('python')` or `echo has('python3')` to see if the result is `1`; Make sure that your python2 version is Python **2.7** or higher and python3 version is Python **3.1** or higher.

Installation
------------

To install this plugin just put the plugin files in your `~/.vim` (Linux) or `~/vimfiles` (Windows).<br>
For [Vundle][3] user, just add `Plugin 'Yggdroot/LeaderF'` to your `.vimrc`.

Performance
-----------

LeaderF is already very fast. If you want better performance, install the C extension of the fuzzy matching algorithm, which is more than 10 times faster.  
To install the C extension, follow the below:

 - On Linux/Unix/MacOS:

    First, make sure `python` and/or `python3` commands are available.  
    Then run the installation script:

    ```sh
    cd ~/.vim/bundle/LeaderF
    ./install.sh
    ```
    Uninstall the C extension:

        ./install.sh --reverse

    If you are using [vim-plug][5]:

        Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }

 - On Windows:

    First, make sure `py -2` and/or `py -3` commands are available.  
    Then run the installation script:

    ```sh
    cd ~\.vim\bundle\LeaderF
    .\install.bat
    ```
    There may be some error during the installation, please google the error messages to resolve it.  
    For example, `"error: Unable to find vcvarsall.bat"`, you can turn to [here][6] for help.

    Uninstall the C extension:

        .\install.bat --reverse

    If you are using [vim-plug][5]:

        Plug 'Yggdroot/LeaderF', { 'do': '.\install.bat' }

After running any command of LeaderF, check the value of `echo g:Lf_fuzzyMatch_C`, if the value is 1, it means the C extension is loaded sucessfully.

Usage
-----

```
usage: Leaderf[!] [-h] [--stayOpen] [--input INPUT | --cword]
                  [--top | --bottom | --left | --right | --belowright | --aboveleft | --fullScreen]
                  [--nameOnly | --fullPath | --fuzzy | --regex]
                  {file,tag,function,mru,searchHistory,cmdHistory,help,line,colorscheme,self,bufTag,buffer}
                  ...

optional arguments:
  -h, --help            show this help message and exit
  --stayOpen            do not quit LeaderF after accepting an entry
  --input INPUT         specifies INPUT as the pattern inputted in advance
  --cword               current word under cursor is inputted in advance
  --top                 the LeaderF window is at the top of the screen
  --bottom              the LeaderF window is at the bottom of the screen
  --left                the LeaderF window is at the left of the screen
  --right               the LeaderF window is at the right of the screen
  --belowright          the LeaderF window is at the belowright of the screen
  --aboveleft           the LeaderF window is at the aboveleft of the screen
  --fullScreen          the LeaderF window takes up the full screen
  --nameOnly            LeaderF is in NameOnly mode by default
  --fullPath            LeaderF is in FullPath mode by default
  --fuzzy               LeaderF is in Fuzzy mode by default
  --regex               LeaderF is in Regex mode by default

subcommands:

  {file,tag,function,mru,searchHistory,cmdHistory,help,line,colorscheme,self,bufTag,buffer}
    file                search files
    tag                 navigate tags using the tags file
    function            navigate functions or methods in the buffer
    mru                 search most recently used files
    searchHistory       execute the search command in the history
    cmdHistory          execute the command in the history
    help                navigate the help tags
    line                search a line in the buffer
    colorscheme         switch between colorschemes
    self                execute the commands of itself
    bufTag              navigate tags in the buffer
    buffer              search buffers

If [!] is given, enter normal mode directly.
```

use `:Leaderf <subcommand> -h` to get specific help of subcommand, e.g., `:Leaderf mru -h`

```
usage: Leaderf[!] mru [-h] [--cwd] [--stayOpen] [--input INPUT | --cword]
                      [--top | --bottom | --left | --right | --belowright | --aboveleft | --fullScreen]
                      [--nameOnly | --fullPath | --fuzzy | --regex]

optional arguments:
  -h, --help     show this help message and exit

specific arguments:
  --cwd          search MRU in current working directory

common arguments:
  --stayOpen     do not quit LeaderF after accepting an entry
  --input INPUT  specifies INPUT as the pattern inputted in advance
  --cword        current word under cursor is inputted in advance
  --top          the LeaderF window is at the top of the screen
  --bottom       the LeaderF window is at the bottom of the screen
  --left         the LeaderF window is at the left of the screen
  --right        the LeaderF window is at the right of the screen
  --belowright   the LeaderF window is at the belowright of the screen
  --aboveleft    the LeaderF window is at the aboveleft of the screen
  --fullScreen   the LeaderF window takes up the full screen
  --nameOnly     LeaderF is in NameOnly mode by default
  --fullPath     LeaderF is in FullPath mode by default
  --fuzzy        LeaderF is in Fuzzy mode by default
  --regex        LeaderF is in Regex mode by default

If [!] is given, enter normal mode directly.
```

Once LeaderF is launched:

| Command                    | Description
| -------                    | -----------
| `<C-C>`<br>`<ESC>`         | quit from LeaderF
| `<C-R>`                    | switch between fuzzy search mode and regex mode
| `<C-F>`                    | switch between full path search mode and name only search mode
| `<Tab>`                    | switch to normal mode
| `<C-V>`<br>`<S-Insert>`    | paste from clipboard
| `<C-U>`                    | clear the prompt
| `<C-J>`<br>`<Down>`        | move the cursor downward in the result window
| `<C-K>`<br>`<Up>`          | move the cursor upward in the result window
| `<2-LeftMouse>`<br>`<CR>`  | open the file under cursor or selected(when multiple files are selected)
| `<C-X>`                    | open in horizontal split window
| `<C-]>`                    | open in vertical split window
| `<C-T>`                    | open in new tabpage
| `<F5>`                     | refresh the cache
| `<C-LeftMouse>`<br>`<C-S>` | select multiple files
| `<S-LeftMouse>`            | select consecutive multiple files
| `<C-A>`                    | select all files
| `<C-L>`                    | clear all selections
| `<BS>`                     | delete the preceding character in the prompt
| `<Del>`                    | delete the current character in the prompt
| `<Home>`                   | move the cursor to the begin of the prompt
| `<End>`                    | move the cursor to the end of the prompt
| `<Left>`                   | move the cursor one character to the left in the prompt
| `<Right>`                  | move the cursor one character to the right in the prompt
| `<C-P>`                    | preview the result

Input formats:

 * In **NameOnly** mode (*fuzzy*)

    `'abc'` is interpreted as vim's regexp `'a.\{-}b.\{-}c'`.<br>
    If the first character you input is `';'`, then the searching will be the same as in **FullPath** mode.<br>
    If you input string as `'abc;def'`, then `'abc'` will match the file name and `'def'` will match the directory name.

 * In **FullPath** mode (*fuzzy*)

    Same as in **NameOnly** mode except that the pattern will match the full path but not the file name only.

 * In **Regexp** mode

    The input string is the same as the Vim's regexp.

Smart Case:

 * If the characters in search pattern are all lowercase, the matching is case-insensitive. If the search pattern contains uppercase characters, all lowercase characters still are matched case-insensitively, the uppercase characters can only match upper case. So uppercase characters can speed up the narrowing down of the searching result.  

    e.g., input `abcDef`，it can match the following string:
    ```
    abcDef
    AbcDef
    abcDEf
    aBcDeF
    ```
    but can not match the string such as:
    ```
    abcdef
    Abcdef
    ```
    Note: `abc` and `ef` are still case-insensitive.

Customization
-------------

 * Change key bindings

    By default, `<Tab>` is the shortcut key to switch to normal mode, if you want to change the key into `<ESC>`:

    `let g:Lf_CommandMap = {'<Tab>': ['<ESC>']}`

    for more detail, please refer to [here][7].

 * Customize the statusline

    Please refer to [here][4].

 * Change the highlight of matched string

    ```vim
    highlight Lf_hl_match gui=bold guifg=Blue cterm=bold ctermfg=21
    highlight Lf_hl_matchRefine  gui=bold guifg=Magenta cterm=bold ctermfg=201
    ```

 * Change the default mapping of searching files command

    e.g. `let g:Lf_ShortcutF = '<C-P>'`

License
-------

This plugin is released under the Apache License, Version 2.0 (the "License").


  [1]: https://github.com/Yggdroot/Images/blob/master/leaderf/leaderf_1.gif
  [2]: https://github.com/Yggdroot/Images/blob/master/leaderf/leaderf_2.gif
  [3]: https://github.com/gmarik/Vundle.vim
  [4]: https://github.com/Yggdroot/LeaderF/blob/master/doc/leaderf.txt#L189-L349
  [5]: https://github.com/junegunn/vim-plug
  [6]: https://stackoverflow.com/questions/2817869/error-unable-to-find-vcvarsall-bat
  [7]: https://github.com/Yggdroot/LeaderF/blob/master/doc/leaderf.txt#L476-L481
