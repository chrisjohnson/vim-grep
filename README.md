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

You have to install [ack](http://beyondgrep.com/), of course.

Install with Homebrew:

    brew install ack

Add this to your `~/.vimrc`:

    let g:grepprg="ack -H --nocolor --nogroup --column"

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

This plugin is almost copy and pasted from [mileszs' ack.vim plugin](https://github.com/mileszs/ack.vim).
