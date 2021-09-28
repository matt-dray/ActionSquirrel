
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

    #' @field x_loc Numeric. The location of the hero.
    x_loc = 13,

    #' @field overworld Character vector. The one-dimensional overworld.
    overworld = rep("🌳", 25),

    #' @field moves Numeric. The number of moves made by the player.
    moves = 0,

    # METHODS ----

    #' @description Create a new overworld.
    #' @param ... The dots.
    #' @return An R6-class object.
    initialize = function(...) {

      self$overworld[self$x_loc] <- "🐿️"
      overworld_mat <- matrix(self$overworld, nrow = sqrt(25))
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

      self$moves <- self$moves + 1

      if (where == "up")    move_n <- -sqrt(25)
      if (where == "down")  move_n <- +sqrt(25)
      if (where == "left")  move_n <- -1
      if (where == "right") move_n <- +1

      self$x_loc <- self$x_loc + move_n
      self$overworld <- rep("🌳", 25)
      self$overworld[self$x_loc] <- "🐿️"
      overworld_mat <- t(matrix(self$overworld, nrow = sqrt(25)))

      cat("\014")
      for (i in seq(nrow(overworld_mat))) {
        cat(overworld_mat[i, ], "\n")
      }
      cat("Moves:", self$moves)

    }

  )
)
