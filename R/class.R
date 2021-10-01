
#' Generate An R6-Class 'Action Squirrel' Game
#'
#' Prints to the console a grid of emoji representing an overworld,
#' including a player character that can be controlled by the user.
#' Also provides a live tally of moves taken.
#'
#' @return Console output with \code{cat()}.
#' @export
#'
#' @examples
#'     \dontrun{
#'     x <- ActionSquirrel$new()  # generate overworld
#'     x$move("up")               # move character up
#'     x$move("right")            # move character right
#'     }
ActionSquirrel <- R6::R6Class(

  "ActionSquirrel",

  public = list(

    # FIELDS ----

    #' @field active Logcial. Is the game in play?
    active = TRUE,

    #' @field overworld Character vector. The overworld in one dimension.
    overworld = rep("\U1F333", 25),

    #' @field s_loc Numeric. The location of the squirrel.
    s_loc = 14,

    #' @field n_loc Numeric. The location of the nut.
    n_loc = 8,

    #' @field o_loc Numeric. The location of the owl.
    o_loc = 17,

    #' @field moves Numeric. The number of moves made by the player.
    moves = 0,

    #' @field nuts Numeric. The number of nuts collected by the player.
    nuts = 0,

    # METHODS ----

    #' @description Create a new overworld.
    #' @return An R6-class object.
    initialize = function() {

      self$overworld[self$n_loc] <- "\U1F330"
      self$overworld[self$s_loc] <- "\U1F43F"
      self$overworld[self$o_loc] <- "\U1F989"
      overworld_mat <- t(matrix(self$overworld, nrow = 5))
      cat("\014")
      for (i in seq(nrow(overworld_mat))) {
        cat(overworld_mat[i, ], "\n")
      }
      cat("Moves:", self$moves, "\nNuts:", self$nuts)

    },

    #' @description Pause menu with instructions.
    #' @return An R6-class object.
    pause = function() {
      cat(
        "P A U S E\n",
        "* Aim:       collect \U1F330, avoid \U1F989\n",
        "* Move:      e.g. x$move('up')\n",
        "* Chain:     e.g. x$move('u')$move('r')\n",
        "* New game:  x <- ActionSquirrel$new()\n",
        "* Info:      x$pause()\n",
        "* Source:    github.com/matt-dray/ActionSquirrel"
      )
      invisible(self)
    },

    #' @description Move the hero around the overworld.
    #' @param where Character. Which direction to move. One of \code{"up"},
    #'      \code{"down"}, \code{"left"} and \code{"right"}.
    #' @return An R6-class object.
    move = function(where = c("up", "down", "left", "right")) {

      where <- match.arg(where)

      # If game is in play
      if (self$active) {

        # Stop at grid edge
        if (
          (where == "up" & self$s_loc %in% 1:5) |
          (where == "down" & self$s_loc %in% 21:25) |
          (where == "left" & self$s_loc %in% seq(1, 25, 5)) |
          (where == "right" & self$s_loc %in% seq(5, 25, 5))
        ) {

          i <- 1
          while (i < 3) {
            sonify::sonify(1, 1, duration = 0.001)
            i <- i + 1
          }

          return(cat("You reached the edge.\nTry another direction."))

        }

        # Increment grid location
        if (where == "up")    { move_n <- -5}
        if (where == "down")  { move_n <- +5}
        if (where == "left")  { move_n <- -1}
        if (where == "right") { move_n <- +1}
        self$s_loc <- self$s_loc + move_n

        # Move sound
        if (self$s_loc != self$n_loc) {
          sonify::sonify(1, 1, duration = 0.01)
        }

        # Nut capture routine
        if (self$s_loc == self$n_loc) {
          sonify::sonify(c(1, 0), c(1, 0), duration = 0.1)
          self$nuts <- self$nuts + 1 # increment nut tally
          self$n_loc <- sample(seq(25)[-self$s_loc], 1)  # new nut location
        }

        # Owl move
        # corners
        if (self$o_loc == 1)  { o_move <- sample(c(0,  1,  5), 1) }
        if (self$o_loc == 5)  { o_move <- sample(c(0, -1,  5), 1) }
        if (self$o_loc == 21) { o_move <- sample(c(0,  1, -5), 1) }
        if (self$o_loc == 25) { o_move <- sample(c(0, -1, -5), 1) }
        # edges
        if (self$o_loc %in% 2:4)           { o_move <- sample(c(0, -1,  1,  5), 1) }
        if (self$o_loc %in% c(6, 11, 16))  { o_move <- sample(c(0,  1, -5,  5), 1) }
        if (self$o_loc %in% c(10, 15, 20)) { o_move <- sample(c(0, -1, -5,  5), 1) }
        if (self$o_loc %in% 22:24)         { o_move <- sample(c(0, -1,  1, -5), 1) }
        # middle
        if (self$o_loc %in% c(7:9, 12:14, 17:19)) {
          o_move <- sample(c(0, 1, -1, 5, -5), 1)
        }
        # increment
        self$o_loc <- self$o_loc + o_move

        # Create 1D grid
        if (self$moves == 29) {
          self$overworld <- sample(c("\U1F384", "\U26C4", "\U1F328"), 25, TRUE)
          self$overworld[1] <- "\U1F43F️"
          self$overworld[2] <- "\U1F4A4"
          self$overworld[2:self$nuts + 1] <- "\U1F330"
        } else {
          self$overworld <- rep("\U1F333", 25)
          self$overworld[self$n_loc] <- "\U1F330"
          self$overworld[self$s_loc] <- "\U1F43F️"
          self$overworld[self$o_loc] <- "\U1F989"
        }

        # Death emoji
        if (self$s_loc == self$o_loc) {
          self$overworld[self$o_loc] <- "\U1F480"
        }

        # Create 2D grid
        overworld_mat <- t(matrix(self$overworld, nrow = 5))

        # Clear console, print grid
        cat("\014")
        for (row in seq(nrow(overworld_mat))) {
          cat(overworld_mat[row, ], "\n")
        }

        # Increment move tally, print move and nut tallies
        self$moves <- self$moves + 1
        cat("Moves:", self$moves, "\nNuts:", self$nuts)

        # Owl attack routine
        if (self$s_loc == self$o_loc) {
          sonify::sonify(c(0, 2, 1), c(1, 1, 1), duration = 1)
          cat("\nY O U   D I E D !")
          self$active <- FALSE  # change active state
        }

        # End game routine
        if (self$moves == 30) {

          i <- 1
          while (i < 4) {
            i <- i + 1
            sonify::sonify(c(0, 1), rep(1, 2), duration = 0.2)
          }
          cat("\nY O U   W I N !")

          self$active <- FALSE  # change active state

        }
      }

      # If game is over
      if (!self$active) {
        cat(
          "\nG A M E   O V E R",
          "\n* New game: x <- ActionSquirrel$new()",
          "\n* Source:   github.com/matt-dray/ActionSquirrel"
        )
      }

      invisible(self)

    }

  )
)
