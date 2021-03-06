
------------------------------------------------------------------------

[![Build Status](https://travis-ci.org/thiyangt/seer.svg?branch=master)](https://travis-ci.org/thiyangt/seer)

seer
====

Meta-learning how to forecast time series

Installation
------------

You can install seer from github with:

``` r
# install.packages("devtools")
devtools::install_github("thiyangt/seer")
```

Usage
-----

``` r
library(Mcomp)
#> Loading required package: forecast
library(seer)
#> 
#> Attaching package: 'seer'
#> The following object is masked from 'package:Mcomp':
#> 
#>     subset.Mcomp
library(tsfeatures)
data(M3)
yearly_m3 <- subset(M3, "yearly")
M3yearly_features <- cal_features(yearly_m3, database="M3", h=6)
head(M3yearly_features)
#>     entropy lumpiness stability     hurst     trend    spikiness
#> 1 0.7729350         0         0 0.9710509 0.9950394 2.373423e-07
#> 2 0.8374974         0         0 0.9473065 0.8687934 1.787445e-04
#> 3 0.8250352         0         0 0.9486339 0.8648297 1.933079e-04
#> 4 0.8544250         0         0 0.9486690 0.8534447 3.680533e-04
#> 5 0.8988307         0         0 0.8545574 0.5858339 1.271114e-03
#> 6 0.7977529         0         0 0.9642617 0.9637770 2.168351e-05
#>    linearity  curvature    e_acf1    y_acf1 diff1y_acf1 diff2y_acf1
#> 1  3.5830263  0.4238300 0.4124236 0.7623182  0.59742360   0.5548075
#> 2  2.0531109 -2.0844699 0.3240316 0.7507872  0.23996912   0.6282414
#> 3  1.7517512 -2.2567824 0.4571183 0.7687310  0.44612514   0.6927627
#> 4  2.8741679 -1.2533364 0.2807471 0.6921482  0.11112733   0.4256662
#> 5 -0.7651025 -1.7685713 0.1921663 0.6085203 -0.01600688   0.3834296
#> 6  3.5564698 -0.5739053 0.1810244 0.7011528  0.09666365   0.3409868
#>     y_pacf5 diff1y_pacf5 diff2y_pacf5     alpha         beta nonlinearity
#> 1 0.6152347   0.54834260    0.4776538 0.9709143 0.9709142237   2.12440536
#> 2 0.8093241   0.15658053    0.8587162 0.9998999 0.0001000064   1.99871020
#> 3 0.9173062   0.37083053    1.0034160 0.9998998 0.2635651859   1.44966392
#> 4 0.5799828   0.31074774    0.5815246 0.9686081 0.0001000084   5.93940010
#> 5 0.5019175   0.03533964    0.3831050 0.9767346 0.0001000033   8.10433256
#> 6 0.5100057   0.09475982    0.3903248 0.9999000 0.0001000512   0.08557127
#>   lmres_acf1     ur_pp   ur_kpss  N    y_acf5 diff1y_acf5 diff2y_acf5
#> 1  0.4819001  1.329299 0.1495925 14 1.0230152  0.42137737   0.3614128
#> 2  0.7227836 -3.735398 0.1461405 14 0.9855601  0.13385167   0.5582498
#> 3  0.7645834 -3.978590 0.1449998 14 1.0798980  0.36099883   0.7632291
#> 4  0.6322638 -2.516911 0.1253592 14 0.7259137  0.27099528   0.4791517
#> 5  0.5030697 -5.721996 0.1149469 14 0.6476230  0.03192893   0.2940731
#> 6  0.3791048 -1.928506 0.1315947 14 0.8320440  0.11524106   0.3031490
```

``` r
library(Mcomp)
tslist <- list(M3[[1]], M3[[2]])
fcast_accuracy(tslist=tslist,models= c("arima","ets","rw","rwd", "theta", "stlar", "nn", "snaive", "mstl"),database ="M3", cal_MASE, h=6)
#> $accuracy
#>         arima       ets       rw       rwd    theta    stlar        nn
#> [1,] 1.566974 1.5636089 7.703518 4.2035176 6.017236 1.566974 2.4282019
#> [2,] 1.698388 0.9229687 1.698388 0.6123443 1.096000 1.698388 0.2795443
#>        snaive      mstl
#> [1,] 7.703518 1.5636089
#> [2,] 1.698388 0.9229687
#> 
#> $ARIMA
#> [1] "ARIMA(0,2,0)" "ARIMA(0,1,0)"
#> 
#> $ETS
#> [1] "ETS(M,A,N)" "ETS(M,A,N)"
```
