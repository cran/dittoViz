% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/utils.R
\name{dittoExampleData}
\alias{dittoExampleData}
\title{Example Data Generation}
\value{
Running \code{example("dittoExampleData")} creates a data.frame called example_df.
}
\description{
Example Data Generation
}
\details{
This documentation point exists only to be a set source of example data for other dittoViz documentation.
Running the examples section code creates a data.frame called 'example_df' containing data of various types.
These data are randomly generated each time and simulate what a user might use as the 'data_frame' input of dittoViz visualization functions.
}
\examples{
# Generate some random data
nobs <- 120

# Fake "PCA" that we'll based some other attributes on
example_pca <- matrix(rnorm(nobs*2), nobs)

example_df <- data.frame(
        conditions = factor(rep(c("condition1", "condition2"), each=nobs/2)),
        timepoint = rep(c("d0", "d3", "d6", "d9"), each = nobs/4),
        SNP = rep(c(rep(TRUE,7),rep(FALSE,8)), nobs/15),
        groups = sample(c("A","B","C","D"), nobs, TRUE),
        score = seq_len(nobs)/2,
        gene1 = log2(rpois(nobs, 5) +1),
        gene2 = log2(rpois(nobs, 30) +1),
        gene3 = log2(rpois(nobs, 4) +1),
        gene4 = log2(rpois(nobs, 2) +1),
        gene5 = log2(rpois(nobs, 17) +1),
        PC1 = example_pca[,1],
        PC2 = example_pca[,2],
        clustering = as.character(1*(example_pca[,1]>0&example_pca[,2]>0) +
                       2*(example_pca[,1]<0&example_pca[,2]>0) +
                       3*(example_pca[,1]>0&example_pca[,2]<0) +
                       4*(example_pca[,1]<0&example_pca[,2]<0)),
        sample = rep(1:12, each = nobs/12),
        category = rep(c("A", "B"), each = nobs/2),
        subcategory = rep(as.character(rep(1:3,4)), each = nobs/12),
        row.names = paste0("obs", 1:nobs)
        )

# cleanup
rm(example_pca, nobs)

summary(example_df)
}
\author{
Daniel Bunis
}
