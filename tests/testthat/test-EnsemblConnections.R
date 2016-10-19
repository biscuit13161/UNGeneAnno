library(ungeneanno)

context("Test Ensembl connections")

test_that("Gets Gene Name from Ensembla",{
  #  testthat::skip("Ensembl gene skip")
  testthat::skip_on_cran()
  query <- "ENSG00000157764"
  g <- getEnsembleList(query)
  expect_match(g$display_name,"BRAF")
  expect_length(g$display_name,1)
})

test_that("Check gene present in Ensembl Archive",{
  #  testthat::skip("Ensembl gene skip")
  testthat::skip_on_cran()
  query <- "ENSG00000215407"
  g <- checkEnsemblArchive(query)
  expect_match(g$id,"ENSG00000215407")
  expect_equal(length(g$display_name),0)
})

test_that("Check gene presence in Ensembl archive the long way!",{
  #  testthat::skip("Ensembl gene skip")
  testthat::skip_on_cran()
  query <- "ENSG00000121031"
  g <- getEnsembleList(query)
  expect_match(g$id,"ENSG00000121031")
  expect_lt(length(g$display_name),1)
})
