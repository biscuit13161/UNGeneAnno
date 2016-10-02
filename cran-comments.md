## Test environments
* local OS X install, R 3.3.1
* Xubuntu 16.04 (on local VM), R 3.3.3
* Windows 7 (on local VM), R 3.3.1
* win-builder (devel)

## R CMD check results?
There were no ERRORs, WARNINGs or NOTEs on the local tests.
There was 1 NOTEs on winbuilder.

* checking CRAN incoming feasibility ... NOTE
Maintainer: 'I. Richard Thompson <ithompson@qf.org.qa>'

Possibly mis-spelled words in DESCRIPTION:
  NCBI (8:9, 9:26)
  Pubmed (9:31)
  Uniprot (3:42, 7:76)
  
- These are the correct names of the resources the package accesses.

## Downstream dependencies
UNGeneAnno currently has no downstream dependencies.
