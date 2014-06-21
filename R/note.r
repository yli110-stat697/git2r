## git2r, R bindings to the libgit2 library.
## Copyright (C) 2013-2014 The git2r contributors
##
## This program is free software; you can redistribute it and/or modify
## it under the terms of the GNU General Public License, version 2,
## as published by the Free Software Foundation.
##
## git2r is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License along
## with this program; if not, write to the Free Software Foundation, Inc.,
## 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

##' Class \code{git_note}
##'
##' @title S4 class to handle a git note
##' @section Slots:
##' \describe{
##'   \item{hex}{
##'     40 char hexadecimal string of blob containing the message
##'   }
##'   \item{annotated}{
##'     40 char hexadecimal string of the git object being annotated
##'   }
##'   \item{message}{
##'     The note message
##'   }
##'   \item{repo}{
##'     The S4 class git_repository that contains the note
##'   }
##' }
##' @name git_note-class
##' @docType class
##' @keywords classes
##' @keywords methods
##' @include repository.r
##' @export
setClass("git_note",
         slots = c(hex       = "character",
                   annotated = "character",
                   message   = "character",
                   repo      = "git_repository"))

##' Default notes reference
##'
##' Get the default notes reference for a repository
##' @rdname note_default_ref-methods
##' @docType methods
##' @param repo The repository
##' @return Character vector of length one with name of default notes
##' reference
##' @keywords methods
setGeneric("note_default_ref",
           signature = "repo",
           function(repo)
           standardGeneric("note_default_ref"))

##' @rdname note_default_ref-methods
##' @export
setMethod("note_default_ref",
          signature = "git_repository",
          function(repo)
          {
              .Call("git2r_note_default_ref", repo)
          }
)

##' List notes
##'
##' List all the notes within a specified namespace.
##' @rdname note_list-methods
##' @docType methods
##' @param repo The repository
##' @param ref Reference to read from. Default is NULL, which uses
##' "refs/notes/commits".
##' @return list with S4 class git_note objects
##' @keywords methods
setGeneric("note_list",
           signature = "repo",
           function(repo,
                    ref = NULL)
           standardGeneric("note_list"))

##' @rdname note_list-methods
##' @export
setMethod("note_list",
          signature = "git_repository",
          function(repo, ref)
          {
              .Call("git2r_note_list", repo, ref)
          }
)
