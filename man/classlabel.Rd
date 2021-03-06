% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/classlabel.R
\name{classlabel}
\alias{classlabel}
\title{identify the best forecasting method}
\usage{
classlabel(accuracy_mat)
}
\arguments{
\item{accuracy_mat}{matrix of forecast accuracy measures (rows: time series, columns: forecasting method)}
}
\value{
a vector: best forecasting method for each series corresponding to the rows of accuracy_mat
}
\description{
identify the best forecasting method according to the forecast accuacy measure
}
\author{
Thiyanga Talagala
}
