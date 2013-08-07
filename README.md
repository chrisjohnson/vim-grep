# Grep

A utility for grepping that isn't limited to a specific program

## Installation

### Ag

You have to install [ag](https://github.com/ggreer/the_silver_searcher), of course.

Install with Homebrew:

    brew install the_silver_searcher

Add this to your `~/.vimrc`:

    let g:grepprg="ag --nogroup --column"


### Ack

You have to install [ack](https://beyondgrep.com), of course.

Install with Homebrew:

    brew install ack

Add this to your `~/.vimrc`:

    let g:grepprg="ack --nogroup --column"

### Git grep

Install git, which you probably have installed

Do nothing, git grep is the default grep command

## Usage

    :Grep [options] {pattern} [{directory}]

Search recursively in {directory} (which defaults to the current directory) for the {pattern}.

Files containing the search term will be listed in the split window, along with
the line number of the occurrence, once for each occurrence.  [Enter] on a line
in this window will open the file, and place the cursor on the matching line.

Just like where you use :grep, :grepadd, :lgrep, and :lgrepadd, you can use `:Grep`, `:GrepAdd`, `:LGrep`, and `:LGrepAdd` respectively. (See `doc/grep.txt`, or `:h Grep` for more information.) 

### Keyboard Shortcuts

In the quickfix window, you can use:

    o    to open (same as enter)
    go   to preview file (open but maintain focus on ag.vim results)
    t    to open in new tab
    T    to open in new tab silently
    v    to open in vertical split
    gv   to open in vertical split silently
    q    to close the quickfix window

This plugin is almost copy and pasted from [mileszs' ack.vim plugin](https://github.com/mileszs/ack.vim).
