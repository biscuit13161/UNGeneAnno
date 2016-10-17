library(ungeneanno)

context("Test Ensembl connections")

test_that("Gets Gene Name from Ensembla",{
  #  testthat::skip("Ensembl gene skip")
  testthat::skip_on_cran()
  query <- "ENSG00000157764"
  g <- getEnsembleList(query)
  expect_match(g$display_name,"BRAF")
})

test_that("Check gene present in Ensembl Archive",{
  #  testthat::skip("Ensembl gene skip")
  testthat::skip_on_cran()
  query <- "ENSG00000215407"
  g <- checkEnsemblArchive(query)
  expect_match(g,"archived")
})

test_that("Check gene presence in Ensembl archive the long way!",{
  #  testthat::skip("Ensembl gene skip")
  testthat::skip_on_cran()
  query <- "ENSG00000121031"
  g <- getEnsembleList(query)
  expect_match(g,"archived")
})
