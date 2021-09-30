
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

    #' @field overworld Character vector. The overworld in one dimension.
    overworld = rep("\U1F333", 25),

    #' @field s_loc Numeric. The location of the squirrel.
    s_loc = 13,

    #' @field n_loc Numeric. The location of the nut.
    n_loc = 7,

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
      overworld_mat <- matrix(self$overworld, nrow = 5)
      cat("\014")
      for (i in seq(nrow(overworld_mat))) {
        cat(overworld_mat[i, ], "\n")
      }
      cat("Moves:", self$moves, "\nNuts:", self$nuts)

    },

    #' @description Move the hero around the overworld.
    #' @param where Character. Which direction to move. One of \code{"up"},
    #'      \code{"down"}, \code{"left"} and \code{"right"}.
    #' @return An R6-class object.
    move = function(where = c("up", "down", "left", "right")) {

      where <- match.arg(where)

      # Stop at grid edge
      if (
        (where == "up" & self$s_loc %in% 1:5) |
        (where == "down" & self$s_loc %in% 21:25) |
        (where == "left" & self$s_loc %in% seq(1, 25, 5)) |
        (where == "right" & self$s_loc %in% seq(5, 25, 5))
      ) {
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

      # Create grid
      self$overworld <- rep("\U1F333", 25)
      self$overworld[self$n_loc] <- "\U1F330"
      self$overworld[self$s_loc] <- "\U1F43F️"
      overworld_mat <- t(matrix(self$overworld, nrow = 5))

      # Clear console, print grid
      cat("\014")
      for (row in seq(nrow(overworld_mat))) {
        cat(overworld_mat[row, ], "\n")
      }

      # Increment move tally, Print move and nut tallies
      self$moves <- self$moves + 1
      cat("Moves:", self$moves, "\nNuts:", self$nuts)

    }

  )
)
