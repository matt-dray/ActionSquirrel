
<!-- README.md is generated from README.Rmd. Please edit that file -->

# ActionSquirrel

<!-- badges: start -->

[![Project Status: Concept – Minimal or no implementation has been done
yet, or the repository is only intended to be a limited example, demo,
or
proof-of-concept.](https://www.repostatus.org/badges/latest/concept.svg)](https://www.repostatus.org/#concept)
<!-- badges: end -->

{ActionSquirrel} is an R package containing a (very work-in-progress)
interactive visual experience (‘game’) in the R console, powered by
[{R6}](https://r6.r-lib.org/). You play as the titular Action Squirrel.
Move around and collect nuts for winter, while avoiding the predatory
owl.

## How to play

### Install

The package is available from GitHub.

``` r
install.packages("remotes")  # if not installed already
remotes::install_github("matt-dray/ActionSquirrel")
```

Attach the package for instructions.

``` r
library(ActionSquirrel)
# Welcome to {ActionSquirrel}!
# * Start: x <- ActionSquirrel$new()
# * Move: x$move('up')
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
forest and grab the nuts. Make sure not to be eaten by the owl.

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

Congratulations, your move tally has increased by one.

Did I mention there’s sound effects? You’ll have to play to find out.

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
nut!

Advanced tech: you only need the first letter of the direction, like
`x$move("r")` for right, and you can chain moves together like
`x$move("r")$move("d")` to go right then down.

Keep collecting nuts until winter arrives (30 moves). Collect as many
nuts as possible without being eaten.

``` r
x$move("left")
# 🌳 🌳 🌳 🌳 🌳 
# 🌳 💀 🌳 🌳 🌳 
# 🌳 🌳 🌳 🌳 🌳 
# 🌰 🌳 🌳 🌳 🌳 
# 🌳 🌳 🌳 🌳 🌳 
# Moves: 3 
# Nuts: 1
# D E A D !
```

Oops.

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
