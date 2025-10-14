#' Send a message via Keybase
#'
#' @param user The recipient's Keybase username.
#' @param message A character string message to send.
#' @param file Path to an image (optional). If supplied, the file is uploaded.
#' @return Invisibly returns TRUE if successful.
#' @export
#'
send_keybase <- function(user, message = NULL, file = NULL) {
    if (is.null(message) && is.null(file)) {
        stop("Either 'message' or 'file' must be provided")
    }
    if (grepl("#", user)) {
        user <- strsplit(user, "#")[[1]]
        user <- c(user[1], "--channel", user[2])
    }

    # Build command
    if (!is.null(file)) {
        if (!file.exists(file)) {
            warning("File does not exist: ", file)
            args <- c("chat", "send", user, paste0("[FILE NOT FOUND] ", file))
        } else {
            args <- c("chat", "upload", user, file)
        }
    } else {
        args <- c("chat", "send", user, message)
    }

    # Run keybase command
    tryCatch(
        {
            res <- processx::run("keybase", args, error_on_status = TRUE)
        },
        error = function(e) {
            stop("Keybase CLI is not installed or not found in PATH.")
        }
    )
    invisible(TRUE)
}
