# fzf customizations

This is really just my personal fzf customizations, packaged up into a ZSH plugin. It is pulled together from various sources including:

* [fzf wiki](https://github.com/junegunn/fzf/wiki)
* [fzf-zsh-plugin](https://github.com/unixorn/fzf-zsh-plugin)

For full functionality, I also use (and recommend) the following plugins, but it's up to you to include them in your `.zshrc`:

* [oh-my-zsh's fzf plugin](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/fzf) - Best way to install fzf
* [fzf-tab](https://github.com/Aloxaf/fzf-tab) - general tab completion
* [fzf-zsh-completions](https://github.com/chitoku-k/fzf-zsh-completions) - more `**` completions
* [fzf-alias](https://github.com/thirteen37/fzf-alias) - my plugin to search aliases
* [fzf-brew](https://github.com/thirteen37/fzf-brew) - my plugin for brew completions (aliases and `**`)

## Rationale

I like what `fzf-zsh-plugin` does for preview, but it was clunky, relying on a long single-line command. It has an advanced option that wrapped `lesspipe.sh` but I'm also not a fan of `lesspipe`'s somewhat dated defaults and primitive extension capabilities. The preview system borrows from `fzf-zsh-plugin`'s mimetype-based dispatch.

`fzf-zsh-plugin`'s detection and installation is also not as robust as `oh-my-zsh`'s fzf plugin, so that's what I used instead. It works well on MacOS with fzf installed via Homebrew. But `fzf-zsh-plugin` still has a great set of default options that I've used here.

Finally, the [ripgrep](https://github.com/BurntSushi/ripgrep)-powered search on the `fzf` wiki is still the best implementation. I've included that here as `rfv`.

## Installation

### zgenom

``` sh
zgenom load thirteen37/fzf-plus
```

### oh-my-zsh

``` sh
git clone https://github.com/thirteen37/fzf-plus.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-plus
```

Then add `fzf-plus` to `plugins=(...)` in your `.zshrc`

### Optional dependencies

The previewer uses the following optional dependencies:
* [bat](https://github.com/sharkdp/bat)
* [chafa](https://github.com/hpjansson/chafa)
* [exa](https://the.exa.website/)
* [exiftool](https://exiftool.org/)
* [imagemagick](https://imagemagick.org/index.php)'s identify
* Xpdf's [pdftotext](https://www.xpdfreader.com/pdftotext-man.html)
* [tree](https://mama.indstate.edu/users/ice/tree/)

Consult the respective sites for installation instructions on your platform.
