/*
 *  git2r, R bindings to the libgit2 library.
 *  Copyright (C) 2013-2014 The git2r contributors
 *
 *  This program is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License, version 2,
 *  as published by the Free Software Foundation.
 *
 *  git2r is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License along
 *  with this program; if not, write to the Free Software Foundation, Inc.,
 *  51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 */

#ifndef INCLUDE_git2r_commit_h
#define INCLUDE_git2r_commit_h

#include <R.h>
#include <Rinternals.h>

#include "git2.h"

SEXP git2r_commit(SEXP repo, SEXP message, SEXP author, SEXP committer, SEXP parent_list);
SEXP git2r_commit_tree(SEXP commit);
SEXP git2r_descendant_of(SEXP commit, SEXP ancestor);
void git2r_init_commit(git_commit *source, SEXP repo, SEXP dest);
SEXP git2r_parents(SEXP commit);

#endif
