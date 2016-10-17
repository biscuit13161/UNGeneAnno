library(httr)
library(XML)
library(methods)

#' Gather Uniprot Data
#'
#' \code{getUniprotSummary} collates data returned from a html request to the Uniport publicly available databases to populate the gene object.
#' The query currently returns id, entry name, reviewed, protein names, genes, organism, length and "comment(FUNCTION)".
#'
#' @param x \code{gene} object
#' @param y \code{query} object (see \code{getNihQuery()})
# @param col comma-seperated string of column names to be returned from the Uniport database (see http://www.uniprot.org/help/uniprotkb_column_names). Defaults to id, entry name, reviewed, protein names, genes, organism, length and "comment(FUNCTION)"
#' @return \code{gene} object - a copy of the input object 'y', having the uniprot data added.
#' @importFrom methods setGeneric setMethod
#' @seealso \url{http://www.uniprot.org/help/uniprotkb_column_names}
#' @importFrom httr content GET
#' @importFrom methods slot<-
#' @examples
#' f <- query()
#' slot(f,"query") <- "BRAF"
#' gene <- gene()
#' slot(gene,"query") <- slot(f,"query")
#' gene <- getUniprotSummary(gene,f)
#' @export
#'
setGeneric("getUniprotSummary", function(x,y) {
    standardGeneric("getUniprotSummary")
})
# setGeneric("getUniprotSummary", function(x,y,col="id,entry name,reviewed,protein names,genes,organism,length,comment(FUNCTION)") {

#' @describeIn getUniprotSummary \code{gene} object - a copy of the input object 'y', having the uniprot data added.
setMethod("getUniprotSummary","gene", function(x,y) {
    cols = strsplit(gsub(", ",",",y@columns),",")
    q = sprintf("%s?query=%s+%s&columns=%s",slot(y,"uniprotbase"),slot(y,"query"),slot(y,"uniprotquery"),gsub(" ","%20",gsub(", ",",",slot(y,"columns"))))
    #q = sprintf("%s?query=%s+%s&columns=%s",y@uniprotbase,x@query,y@uniprotquery,gsub(" ","%20",gsub(", ",",",toString(cols[[1]]))))
    #print(q)
    r = GET(q)
    s <- content(r,"text")
    if (s == "") {}
    else {
        xname <- ifelse(identical(slot(x,"name"), character(0)), slot(x,"query"), slot(x,"name"))
        yname <- ifelse(identical(slot(y,"gene"), character(0)), slot(y,"query"), slot(y,"gene"))
        for (i in strsplit(s,"\n")[[1]]) {
            j <- strsplit(i,"\t")[[1]]
            l <- strsplit(j[which(cols[[1]] == "genes")]," ")[[1]]
            m <- strsplit(j[which(cols[[1]] == "database(EMBL)")],";")[[1]]
            if (yname %in% l || xname %in% l || yname %in% m || xname %in% m) {
                slot(x,"uniprot_summary") <- strsplit(j[which(cols[[1]] == "comment(FUNCTION)")],"FUNCTION: ")[[1]]
                slot(x,"uniprot_protein_name") <- j[which(cols[[1]] == "protein names")]
                slot(x,"uniprot_organism") <-  j[which(cols[[1]] == "organism")]
                slot(x,"uniprot_length") <-  j[which(cols[[1]] == "length")]
                slot(x,"uniprot_name") <- j[which(cols[[1]] == "genes")]
            }
        }
    }
    return(x)
  }
)

