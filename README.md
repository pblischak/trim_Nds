# `trim_Nds`

**NOTE: I'm still testing this out, so use with caution. If you try it and it does not work, please consider filing and issue and I'll do my best to address it.**

`trim_Nds` is a simple R script for trimming N's and ?'s off the ends (but not the middle) of nucleotide sequences.
The input is a file of DNA sequences in FASTA format.
The script can be sourced into an R session to run the main function: `trim_Nds`. The method is not case sensitive, and prints all output in upper case letters.

## Installing dependencies

The script relies on the  R package [**ape**](https://cran.r-project.org/web/packages/ape/index.html). You can install it using the normal `install.packages` function in: `install.packages("ape")`.

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

You can also try a one-liner from the command line like this:

```bash
Rscript -e 'source("trim_Nds.R"); trim_Nds("intput.fasta", "output.fasta")'
```
