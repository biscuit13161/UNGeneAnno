library(ungeneanno)

context("Test NIH connections")

test_that("connects to NIH for esearch", {
#  testthat::skip("Esearch skip")
  testthat::skip_on_cran()
  f <- getNihQuery(query(),"pubmed","19486507")
  expect_equal(f@db,"pubmed")
  expect_equal(f@querykey,"1")

  f <- getNihQuery(query(),"gene","BRAF")
  expect_equal(f@db,"gene")
  expect_equal(f@querykey,"1")
})

test_that("Gets from NCBI gene database",{
#  testthat::skip("NCBI gene skip")
  testthat::skip_on_cran()
  f <- query()
  f@gene <- "BRAF"
  query <- sprintf("Homo+sapiens[organism]+%s[gene+name]+alive[prop]",f@gene)
  f <- getNihQuery(f,"gene",query)
  g <- getNihSummary(gene(),f)
#  expect_equal_to_reference(g,"ncbi_test_gene.rds")
  expect_equal(g@symbol,"BRAF")
})

test_that("Check fails on not found",{
  #  testthat::skip("NCBI gene skip")
  testthat::skip_on_cran()
  f <- query()
  f@gene <- "AK298142"
  query <- sprintf("Homo+sapiens[organism]+AND+%s[gene+name]+AND+alive[prop]",f@gene)
  f <- getNihQuery(f,"gene",query)
  expect_equal(f@notfound,"AK298142[gene name]")
  query <- sprintf("Homo+sapiens[organism]+AND+%s+AND+alive[prop]",f@gene)
  f <- getNihQuery(f,"gene",query)
  g <- getNihSummary(gene(),f)
  expect_equal(g@symbol,"ATIC")
})
