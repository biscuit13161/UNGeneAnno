library(jsonlite)
library(XML)
library(methods)


#' Query Ensembl using Ensembl IDs to find Gene Name
#'
#' \code{getEnsembleList} contacts the Ensembl Rest API, querying the presence
#' of an Ensembl ID in the active database.
#' Should the ID not be found in the active database, \code{checkEnsemblArchive()}
#' is called to check whether it is archived.
#'
#' @param query a string containing the ID to be queried.
#' @return A list detailing the entry in the Ensembl database... or "archived" if present in the archive.
#' @importFrom methods setGeneric setMethod
#' @importFrom jsonlite fromJSON
#' @examples
#' query <- "ENSG00000157764"
#' ret <- getEnsembleList(query)
#' ret$display_name
#' @export
#'
setGeneric("getEnsembleList", function(query) {
    standardGeneric("getEnsembleList")
})

#' @describeIn getEnsembleList as above.
setMethod("getEnsembleList","character", function(query) {
    #name <- c("ENSG00000174501","ENSG00000215407","ENSG00000093100","ENSG00000121031")

    ret <- tryCatch({fromJSON(sprintf("http://rest.ensembl.org/lookup/id/%s?content-type=application/json",query))},
        error = function(err) {
            if (grepl(400,err)) {
                checkEnsemblArchive(query)
            } else {
                print(sprintf("%s: %s",query,err))
            }
        }
    )
    return(ret)
}
)

#' Query Ensembl Archive using Ensembl IDs to confirm whether ID is archived
#'
#' \code{checkEnsemblArchive} contacts the Ensembl Rest API, querying the presence
#' of an Ensembl ID in the archive database.
#'
#' @param query a string containing the ID to be queried.
#' @return "archived" if successful (ID present in Archive), else errors out.
#' @importFrom methods setGeneric setMethod
#' @importFrom jsonlite fromJSON
#' @examples
#' query <- "ENSG00000121031"
#' ret <- checkEnsemblArchive(query)
#' @export
#'
setGeneric("checkEnsemblArchive", function(query) {
    standardGeneric("checkEnsemblArchive")
})

#' @describeIn checkEnsemblArchive as above.
setMethod("checkEnsemblArchive","character", function(query) {
    ret <- tryCatch({fromJSON(sprintf("http://rest.ensembl.org/archive/id/%s?content-type=application/json",query))},
        error = function(err) {
            if (grepl(400,err)) {
                print(sprintf("%s: is not found in Ensembl",query))
            } else {
                print(sprintf("%s: %s",query,err))
            }
        }
    )
    return(ret)
}
)
