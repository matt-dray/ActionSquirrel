
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

    #' @field x_loc Numeric. The location of the squirrel
    x_loc = ceiling(25 / 2),

    #' @field overworld Character vector. The overworld in one dimension.
    overworld = rep("\U1F333", 25),

    #' @field moves Numeric. The number of moves made by the player.
    moves = 0,

    # METHODS ----

    #' @description Create a new overworld.
    #' @param ... The dots.
    #' @return An R6-class object.
    initialize = function(...) {

      self$overworld[self$x_loc] <- "\U1F43F"
      overworld_mat <- matrix(self$overworld, nrow = 5)
      cat("\014")
      for (i in seq(nrow(overworld_mat))) {
        cat(overworld_mat[i, ], "\n")
      }
      cat("Moves:", self$moves)

    },

    #' @description Move the hero around the overworld.
    #' @param where Character. Which direction to move. One of \code{"up"},
    #'      \code{"down"}, \code{"left"} and \code{"right"}.
    #' @return An R6-class object.
    move = function(where) {

      if (
        (where == "up"    & self$x_loc %in% 1:5) |
        (where == "down"  & self$x_loc %in% 21:25) |
        (where == "left"  & self$x_loc %in% seq(1, 25, 5)) |
        (where == "right" & self$x_loc %in% seq(5, 25, 5))
      ) {
        return(cat("You reached the edge.\nTry another direction."))
      }

      if (where == "up")    { move_n <- -5}
      if (where == "down")  { move_n <- +5}
      if (where == "left")  { move_n <- -1}
      if (where == "right") { move_n <- +1}

      self$x_loc <- self$x_loc + move_n
      self$overworld <- rep("\U1F333", 25)
      self$overworld[self$x_loc] <- "\U1F43F️"
      overworld_mat <- t(matrix(self$overworld, nrow = 5))

      cat("\014")

      for (row in seq(nrow(overworld_mat))) {
        cat(overworld_mat[row, ], "\n")
      }

      self$moves <- self$moves + 1
      cat("Moves:", self$moves)

    }

  )
)
