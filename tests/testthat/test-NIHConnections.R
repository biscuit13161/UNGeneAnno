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

test_that("Check fails on not found 1",{
  #  testthat::skip("NCBI Not Found 1")
  testthat::skip_on_cran()
  f <- query()
  f@gene <- "AK298142"
  query <- sprintf("Homo+sapiens[organism]+AND+%s[Gene%%2FProtein+Name]+AND+alive[prop]",f@gene)
  f <- getNihQuery(f,"gene",query)
  expect_equal(f@notfound,"AK298142[Gene/Protein Name]")
  query <- sprintf("Homo+sapiens[organism]+AND+%s[Nucleotide%%2FProtein+Accession]+AND+alive[prop]",f@gene)
  f <- getNihQuery(f,"gene",query)
  g <- getNihSummary(gene(),f)
  expect_equal(g@symbol,"ATIC")
})

test_that("Check fails on not found 2",{
  #  testthat::skip("NCBI Not Found 2")
  testthat::skip_on_cran()
  f <- query()
  f@query <- "AK298142"
  query <- "Homo+sapiens%5Borganism%5D+AND(AK298142%5BGene%2FProtein+Name%5D+OR+AK298142%5BNucleotide%2FProtein+Accession%5D)"
  f <- getNihQuery(f,"gene",query)
  expect_equal(f@notfound,"AK298142[Gene/Protein Name]")
  f@query <- "BRAF"
  query <- "Homo+sapiens%5Borganism%5D+AND(BRAF%5BGene%2FProtein+Name%5D+OR+BRAF%5BNucleotide%2FProtein+Accession%5D)"
  f <- getNihQuery(f,"gene",query)
  expect_equal(f@notfound,"BRAF[Nucleotide/Protein Accession]")
})
#
