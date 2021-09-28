.onAttach <- function(libname, pkgname) {  # nolint
  packageStartupMessage(
    paste0(
      "Welcome to {ActionSquirrel}!\n",
      "* Start: x <- ActionSquirrel$new()\n",
      "* Move: x$move('up')"
    )
  )
}
