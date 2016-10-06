library(ungeneanno)

context("Test Uniprot connections")

test_that("Gets Gene from Uniprot database",{
  #  testthat::skip("Uniprot gene skip")
  testthat::skip_on_cran()
  f <- query()
  f@query <- "BRAF"
  g <- gene()
  g@query <- f@query
  p <- getUniprotSummary(g,f)
  expect_match(p@uniprot_name,f@query)
  expect_equal(p@uniprot_length,"766")
  expect_match(p@uniprot_organism,"Human")
})

test_that("Gets Accession from Uniprot database",{
  #  testthat::skip("Uniprot gene skip")
  testthat::skip_on_cran()
  f <- query()
  f@query <- "AK298142"
  g <- gene()
  g@query <- f@query
  #  query <- sprintf("Homo+sapiens[organism]+%s[gene+name]+alive[prop]",f@gene)
  p <- getUniprotSummary(g,f)
  expect_equal(p@uniprot_name,logical(0))
  f@uniprotquery<- "AND+organism:9606&format=tab"
  p <- getUniprotSummary(g,f)
  expect_match(p@uniprot_protein_name,"PURH")
  expect_equal(p@uniprot_length,"533")
  #expect_match(p@uniprot_organism,"Human")
})
