# `trim_Nds`

**NOTE: I'm still testing this out, so use with caution. If you try it and it does not work, please consider filing and issue and I'll do my best to address it.**

`trim_Nds` is a simple R/C++ script for trimming N's and ?'s off the ends (but not the middle) of nucleotide sequences.
The input is a file of DNA sequences in FASTA format.
The script can be sourced into an R session to run the main function: `trim_Nds`. The method is not case sensitive, and prints all output in upper case letters.

## Installing dependencies

The script relies on two other R packages: [**ape**](https://cran.r-project.org/web/packages/ape/index.html) and [**Rcpp**](https://cran.r-project.org/web/packages/Rcpp/index.html). You can install these using the normal `install.packages` function in R. **Rcpp** may take a little bit more work, and Windows users typically need to download and install [Rtools](https://cran.r-project.org/bin/windows/Rtools/).

```r
install.packages(c("Rcpp","ape"))
```

## Running the script

The script can be used in an R session by simply calling `source` on the `trim_Nds.R` file. You can then use the `trim_Nds` function, which takes two arguments:

 - **in_fasta_file**: the name of the input FASTA file with sequences to trim.

 - **out_fasta_file**: the name of the FASTA file that trimmed sequences will be written to.

Running the following bit of code from within R should get the job done. I've also provided an example FASTA file that you can use to test the code ('input.fasta').

```r
# Source the file into an R session
source("trim_Nds.R")

# Then just run the `trim_Nds` function (don't forget quotes)
trim_Nds("input.fasta", "output.fasta")
```

You can also run a one-liner from the command line like this:

```bash
Rscript -e 'source("trim_Nds.R"); trim_Nds("intput.fasta", "output.fasta")'
```

The one-liner can be slow though because it will have to source `trim_Nds.cpp`, so using it many times in a row may be less efficient than just doing everything from within R where you only have to load things into the workspace once. The section below explains this in a bit more detail.

## `trim_Nds.R` and `trim_Nds.cpp`

The base trimming conducted by `trim_Nds` is accomplished using two source code files: `trim_Nds.R` and `trim_Nds.cpp`. The R code is what actually provides an interface to the function used to read in, trim, and output the FASTA files. The `trim_Nds.cpp` source file is used internally by the R code to do the actual trimming. The function in `trim_Nds.cpp` is sourced into the R script, much like we source R code into an R session. Since the trimming function is written in C++, it has to be converted into something that R can understand -- enter Rcpp. Sourcing the C++ file can take some time, but once the code is loaded into the workspace, calling the C++ function is pretty fast.
