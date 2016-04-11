# `trim_Nds`

`trim_Nds` is a simple R/C++ script for trimming N's and ?'s off the ends (but not the middle) of nucleotide sequences.
The input is a file of DNA sequences in FASTA format.
The script can be sourced into an R session to run the main function: `trim_Nds()`.

## Installing dependencies

The script relies on two other R packages: **ape** and **Rcpp**. You can install these using the normal `install.packages()` function in R. **Rcpp** may take a little bit more work, and Windows users typically need to download and install [Rtools](https://cran.r-project.org/bin/windows/Rtools/).

```r
install.packages(c("Rcpp","ape"))
```

## Running the script

The script can be used in an R session by simply calling `source()` on it (see below). The `trim_Nds()` function takes two arguments:

 - **in_fasta_file**: the name of the input FASTA file with sequences to trim.

 - **out_fasta_file**: the name of the FASTA file that trimmed sequences will be written to.



```r
# Source the file into an R session
source("trim_Nds.R")

# Then just run the `trim_Nds` function (don't forget quotes)
trim_Nds("input.fasta", "output.fasta")
```

Or you can run a one-liner from the command line like this:

```bash
Rscript -e 'source("trim_Nds.R"); trim_Nds("intput.fasta", "output.fasta")'
```

The one-liner can be slow though because it will have to source `trim_Nds.cpp`, so using it many times in a row may be less efficient than just doing everything from within R where you only have to load everything into the workspace once. The section below explains this in a bit more detail.

## `trim_Nds.R` and `trim_Nds.cpp`

A bit of background on the actual code ---
