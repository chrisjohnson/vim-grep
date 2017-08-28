# Grep

A utility for grepping that isn't limited to a specific program

## Selection
- `grep.vim` will try to use `rg` if available.
- If `rg` is unavailable, and the file is in a git repo, `git-grep` will be used.
- If not, it will fallback to `ag`.
- If `ag` is unavailable, `grep` will be used.

**Note** This will clobber your `g:grepprg` by overwriting it whenever `:Grep` is
called with the appropriate tool based on the file and your environment.

## Installation
Pick one of the supported alternatives: `rg`, `ag` and `git-grep`

### Rg
You have to install [rg](https://github.com/BurntSushi/ripgrep), of
course.

Install with Homebrew:

```bash
brew install rg
```

### Ag
You have to install [ag](https://github.com/ggreer/the_silver_searcher), of
course.

Install with Homebrew:

```bash
brew install the_silver_searcher
```

### Git grep
This comes with git, and will automatically be used when appropriate

## Usage
`:Grep [options] {pattern} [{directory}]`

Search recursively in {directory} (which defaults to the current directory) for
the {pattern}.

Files containing the search term will be listed in the split window, along with
the line number of the occurrence, once for each occurrence.  [Enter] on a line
in this window will open the file, and place the cursor on the matching line.

Just like where you use :grep, :grepadd, :lgrep, and :lgrepadd, you can use
`:Grep`, `:GrepAdd`, `:LGrep`, and `:LGrepAdd` respectively.

This plugin is almost copy and pasted from [mileszs' ack.vim
plugin](https://github.com/mileszs/ack.vim).

## Motion
Motions to grep for things. Works with pretty much everything, including:

```
w, W, e, E, b, B, t*, f*, i*, a*, and custom text objects
```

### Normal mode
Place your cursor somewhere, type `gr` and, then perform a text-object for what
you want to grep for.

### Visual mode
Visually select the pattern you want to grep for, type `gr`.

### Mappings
The mapping `gr` is set in both normal and visual-mode, if you want to remove it
to set your own mappings you set `g:grep_no_maps` in your `.vimrc`

If you want to use `qq` instead of `gr`:

```viml
let g:grep_no_maps = 1
nnoremap <silent> qq :set opfunc=<SID>GrepMotion<CR>g@
xnoremap <silent> qq :<C-U>call <SID>GrepMotion(visualmode())<CR>
```

# License

Copyright (c) Teo Ljungberg. Distributed under the same terms as Vim itself. See
`:help license`.
