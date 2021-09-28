
<!-- README.md is generated from README.Rmd. Please edit that file -->

# ActionSquirrel

<!-- badges: start -->

[![Project Status: Concept – Minimal or no implementation has been done
yet, or the repository is only intended to be a limited example, demo,
or
proof-of-concept.](https://www.repostatus.org/badges/latest/concept.svg)](https://www.repostatus.org/#concept)
<!-- badges: end -->

*Action Squirrel* is a (very work-in-progress) interactive visual
experience (‘game’) in the R console, made with [the {R6}
package](https://r6.r-lib.org/).

You play as the titular Action Squirrel. Move around and collect nuts
for winter.

TODO: gamification. See [the
issues](https://github.com/matt-dray/ActionSquirrel/issues) and submit
your own ideas.

## Install

Available from GitHub only.

``` r
install.packages("remotes")  # if not installed already
remotes::install_github("matt-dray/ActionSquirrel")
```

## How to play

Start with `ActionSquirrel$new()`. This clears the console and generates
the overworld, including the player squirrel.

``` r
library(ActionSquirrel)
# Welcome to {ActionSquirrel}!
# * Start: x <- ActionSquirrel$new()
# * Move: x$move('up')
x <- ActionSquirrel$new()
# 🌳 🌳 🌳 🌳 🌳 
# 🌳 🌳 🌳 🌳 🌳 
# 🌳 🌳 🐿 🌳 🌳 
# 🌳 🌳 🌳 🌳 🌳 
# 🌳 🌳 🌳 🌳 🌳 
# Moves: 0
```

Use the `move()` method to move the squirrel.

Go up!

``` r
x$move("up")
# 🌳 🌳 🌳 🌳 🌳 
# 🌳 🌳 🐿️ 🌳 🌳 
# 🌳 🌳 🌳 🌳 🌳 
# 🌳 🌳 🌳 🌳 🌳 
# 🌳 🌳 🌳 🌳 🌳 
# Moves: 1
```

Right!

``` r
x$move("right")
# 🌳 🌳 🌳 🌳 🌳 
# 🌳 🌳 🌳 🐿️ 🌳 
# 🌳 🌳 🌳 🌳 🌳 
# 🌳 🌳 🌳 🌳 🌳 
# 🌳 🌳 🌳 🌳 🌳 
# Moves: 2
```

Down!

``` r
x$move("down")
# 🌳 🌳 🌳 🌳 🌳 
# 🌳 🌳 🌳 🌳 🌳 
# 🌳 🌳 🌳 🐿️ 🌳 
# 🌳 🌳 🌳 🌳 🌳 
# 🌳 🌳 🌳 🌳 🌳 
# Moves: 3
```

Other right!

``` r
x$move("left")
# 🌳 🌳 🌳 🌳 🌳 
# 🌳 🌳 🌳 🌳 🌳 
# 🌳 🌳 🐿️ 🌳 🌳 
# 🌳 🌳 🌳 🌳 🌳 
# 🌳 🌳 🌳 🌳 🌳 
# Moves: 4
```

Note that Action Squirrel is not as big as a tree. It’s just
perspective.

## Thanks

Inspired in part by [Tomaz’s ‘Little Useless-Useful R
Functions’](https://tomaztsql.wordpress.com/2021/09/13/little-useless-useful-r-functions-year-progress-bar/).

Thanks to Winston Chang for [the {R6} package](https://r6.r-lib.org/).

## Similar projects

I’ve done some other silly things with {R6}. You can:

-   [play a text-based version of *Pokemon Blue*’s Safari Zone in
    R](https://www.rostrum.blog/2021/01/04/safar6/)
-   [repay your loan to *Animal Crossing*’s Tom Nook with an Automatic
    Bell
    Dispenser](https://www.rostrum.blog/2020/04/04/repaying-tom-nook-with-r6/)
