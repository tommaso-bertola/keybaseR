
# keybaseR

<!-- badges: start -->
<!-- badges: end -->

The goal of keybaseR is to provide an easy way to send messgaes to Keybase chat within R.
This comes especially useful during lengthy computations to remotely inform of the status.

## Installation

You can install the development version of keybaseR from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("tommaso-bertola/keybaseR")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(keybaseR)


# sends message
send_keybase(user='username', message='test message')
send_keybase(user='team#channel', message='test message')

# sends file
send_keybase(user='username', file='/home/ubuntu/Desktop/image.png')
```
