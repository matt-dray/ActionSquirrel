.onAttach <- function(libname, pkgname) {  # nolint
  packageStartupMessage(
    paste0(
      "Welcome to {ActionSquirrel}!\n",
      "* New game: x <- ActionSquirrel$new()\n",
      "* Move:     e.g. x$move('up')\n",
      "* Info:     x$pause()"
    )
  )
}
