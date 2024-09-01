# Vi Editor Commands and Shortcuts

The `vi` editor is a powerful text editor available on Unix-based systems. Here is a guide to some of the most commonly used commands and shortcuts in `vi`.

## Opening and Closing Files

- **Open a file**: `vi filename`
- **Save changes and exit**: `:wq` or `ZZ`
- **Save without exiting**: `:w`
- **Exit without saving**: `:q!`

## Navigation

- **Move cursor left**: `h`
- **Move cursor right**: `l`
- **Move cursor up**: `k`
- **Move cursor down**: `j`
- **Move to the beginning of the line**: `0`
- **Move to the end of the line**: `$`
- **Move to the next word**: `w`
- **Move to the previous word**: `b`
- **Move to a specific line number**: `:n` (replace `n` with the line number)

## Editing

- **Insert mode**: `i`
- **Append mode**: `a`
- **Open a new line below the current line**: `o`
- **Open a new line above the current line**: `O`
- **Delete a character**: `x`
- **Delete a word**: `dw`
- **Delete a line**: `dd` `.`
- **Copy (yank) a line**: `yy`
- **Paste**: `p`
- **Undo**: `u`
- **Redo**: `Ctrl-r`

## Searching

- **Search forward**: `/pattern`
- **Search backward**: `?pattern`
- **Next occurrence**: `n`
- **Previous occurrence**: `N`

## Replace

- **Replace all occurrences in the file**: `:%s/old/new/g`
- **Replace all occurrences in the current line**: `:s/old/new/g`

## Visual Mode

- **Start visual mode**: `v`
- **Start visual line mode**: `V`
- **Start visual block mode**: `Ctrl-v`
- **Exit visual mode**: `Esc`

## Miscellaneous

- **Open a new file**: `:e filename`
- **Read a file into the current file**: `:r filename`
- **Write (save) as a new file**: `:w newfilename`
- **Set line numbers**: `:set nu`
- **Remove line numbers**: `:set nonu`

## Tips

- To switch from any mode to command mode, press `Esc`.
- You can combine commands, e.g., `d3w` deletes three words.

This guide covers the basics of using the `vi` editor. For more advanced usage, refer to the `vi` documentation or other resources.
