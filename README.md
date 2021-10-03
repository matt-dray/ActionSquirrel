
<!-- README.md is generated from README.Rmd. Please edit that file -->

# ActionSquirrel

<!-- badges: start -->

[![Project Status: Concept – Minimal or no implementation has been done
yet, or the repository is only intended to be a limited example, demo,
or
proof-of-concept.](https://www.repostatus.org/badges/latest/concept.svg)](https://www.repostatus.org/#concept)
[![Blog
post](https://img.shields.io/badge/rostrum.blog-post-008900?labelColor=000000&logo=data%3Aimage%2Fgif%3Bbase64%2CR0lGODlhEAAQAPEAAAAAABWCBAAAAAAAACH5BAlkAAIAIf8LTkVUU0NBUEUyLjADAQAAACwAAAAAEAAQAAAC55QkISIiEoQQQgghRBBCiCAIgiAIgiAIQiAIgSAIgiAIQiAIgRAEQiAQBAQCgUAQEAQEgYAgIAgIBAKBQBAQCAKBQEAgCAgEAoFAIAgEBAKBIBAQCAQCgUAgEAgCgUBAICAgICAgIBAgEBAgEBAgEBAgECAgICAgECAQIBAQIBAgECAgICAgICAgECAQECAQICAgICAgICAgEBAgEBAgEBAgICAgICAgECAQIBAQIBAgECAgICAgIBAgECAQECAQIBAgICAgIBAgIBAgEBAgECAgECAgICAgICAgECAgECAgQIAAAQIKAAAh%2BQQJZAACACwAAAAAEAAQAAAC55QkIiESIoQQQgghhAhCBCEIgiAIgiAIQiAIgSAIgiAIQiAIgRAEQiAQBAQCgUAQEAQEgYAgIAgIBAKBQBAQCAKBQEAgCAgEAoFAIAgEBAKBIBAQCAQCgUAgEAgCgUBAICAgICAgIBAgEBAgEBAgEBAgECAgICAgECAQIBAQIBAgECAgICAgICAgECAQECAQICAgICAgICAgEBAgEBAgEBAgICAgICAgECAQIBAQIBAgECAgICAgIBAgECAQECAQIBAgICAgIBAgIBAgEBAgECAgECAgICAgICAgECAgECAgQIAAAQIKAAA7)](https://www.rostrum.blog/2021/10/03/squirrel/)
<!-- badges: end -->

{ActionSquirrel} is an R package containing an interactive audio-visual
experience (‘game’) in the R console, powered by
[{R6}](https://r6.r-lib.org/).

You play as the titular Action Squirrel. Move around the forest and
collect at least eight nuts to survive winter, which happens after 30
turns. Avoid being eaten by the owl.

Read more in [the accompanying blog
post](https://www.rostrum.blog/2021/10/03/squirrel/).

## How to play

### Install

The package is available from GitHub.

``` r
install.packages("remotes")  # if not installed already
remotes::install_github("matt-dray/ActionSquirrel")
```

Note that I’ve developed and tested this only in RStudio v1.4.1717 with
R v4.1.0 running on macOS Big Sur.

Attach the package for instructions.

``` r
library(ActionSquirrel)
# Welcome to {ActionSquirrel}!
# * New game: x <- ActionSquirrel$new()
# * Move:     e.g. x$move('up')
# * Info:     x$pause()
```

### Start

Initiate by assigning `ActionSquirrel$new()` to a name. This clears the
console and generates a forest that contains Action Squirrel. And a
delicious nut. And a scary owl!

``` r
x <- ActionSquirrel$new()
# 🌳 🌳 🌳 🌳 🌳 
# 🌳 🌳 🌰 🌳 🌳 
# 🌳 🌳 🌳 🐿 🌳 
# 🌳 🦉 🌳 🌳 🌳 
# 🌳 🌳 🌳 🌳 🌳 
# Moves: 0 
# Nuts: 0
```

Note: Action Squirrel nor the nut nor the owl are as big as a tree. It’s
just perspective.

### Move

You control Action Squirrel. Use the `move()` method to move through the
forest and grab the nuts, avoiding the owl.

``` r
x$move("up")
# 🌳 🌳 🌳 🌳 🌳 
# 🌳 🌳 🌰 🐿️ 🌳 
# 🌳 🦉 🌳 🌳 🌳 
# 🌳 🌳 🌳 🌳 🌳 
# 🌳 🌳 🌳 🌳 🌳 
# Moves: 1 
# Nuts: 0
```

Congratulations, your move tally has increased by one. Winter arrives
after 30 turns and the game will end.

To the nut!

``` r
x$move("left")
# 🌳 🌳 🌳 🌳 🌳 
# 🌳 🌳 🐿️ 🌳 🌳 
# 🌳 🦉 🌳 🌳 🌳 
# 🌰 🌳 🌳 🌳 🌳 
# 🌳 🌳 🌳 🌳 🌳 
# Moves: 2 
# Nuts: 1
```

Congratulations, your nut tally has increased by one. And there’s a new
nut! Collect at least eight, or you won’t survive winter.

Advanced tech: you only need the first letter of the direction, like
`x$move("r")` for right, and you can chain moves together like
`x$move("r")$move("d")` to go right then down.

I’ll leave it to the player to discover the consequences of being eaten,
the endscreens and the sound effects.

## Thanks

Inspired in part by [Tomaz’s ‘Little Useless-Useful R
Functions’](https://tomaztsql.wordpress.com/2021/09/13/little-useless-useful-r-functions-year-progress-bar/).

Thanks to Winston Chang for [the {R6} package](https://r6.r-lib.org/),
and Stefan Siegert and Robin Williams for
[{sonify}](https://CRAN.R-project.org/package=sonify).

## Similar projects

I’ve done some other silly things with {R6}. You can:

-   [play a text-based version of *Pokemon Blue*’s Safari Zone in
    R](https://www.rostrum.blog/2021/01/04/safar6/)
-   [repay your loan to *Animal Crossing*’s Tom Nook with an Automatic
    Bell
    Dispenser](https://www.rostrum.blog/2020/04/04/repaying-tom-nook-with-r6/)

## Code of Conduct

Add bugs or ideas to [the
issues](https://github.com/matt-dray/ActionSquirrel/issues).

Please note that the {ActionSquirrel} project is released with a
[Contributor Code of
Conduct](https://contributor-covenant.org/version/2/0/CODE_OF_CONDUCT.html).
By contributing to this project, you agree to abide by its terms.
