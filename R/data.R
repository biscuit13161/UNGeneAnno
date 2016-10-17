#' Input Vector of Drug/Gene Data
#'
#' A mixed list of drug identifiers and gene names, as output by \code{parseInputFile()}
#' and used for input into \code{getUniqueGeneList()}, \code{getGroupGeneList()} and \code{searchPublications()}
#'
#' @return A vector of 10 drug identification numbers, intersperced with 90 Gene names.
"myinputlist"

#' Input Matrix of Drug/Gene Data
#'
#' A matrix made up of a column of drug identifiers and a column of associated gene names, as used for input into \code{getUniqueGeneList()} and
#'
#' @return A 2 column matrix where the first columns contains drug identifiers and the second column Gene names.
"mygenematrix"

#' Input Vector of Drug/Gene Data
#'
#' A mixed list of drug identifiers and gene names, based on the genematrix data, as output by \code{parseInputFile()}
#' and used for input into \code{getUniqueGeneList()}, \code{getGroupGeneList()} and \code{searchPublications()}
#'
#' @return A vector of 10 drug identification numbers, intersperced with 90 Gene names.
"mygenelist"

#' \code{geneanno} object
#'
#' A \code{geneanno} object produced by \code{getUniqueGeneList()} and provided for testing downstream functionality.
#'
#' @return A geneanno object.
"mygeneanno"

#' Vector Input Vector of Drug/Gene Data
#'
#' A mixed list of drug identifiers and gene names, based on the genematrix data, as output by \code{parseInputFile()}
#' and used for input into \code{getUniqueGeneList()}, \code{getGroupGeneList()} and \code{searchPublications()}
#'
#' @return A vector of 10 drug identification numbers, intersperced with 90 Gene names.
"mygenesummaries"

#' matrix of \code{pubmed} objects
#'
#' A matrix containing the mygenematrix identifiers and  up to 10 related journal articles returned from \code{searchPublications()}
#'
#' @return A matrix of identifiers from mygenematrix/mygenelist and vectors of \code{pubmed} objects.
"mypublications"
