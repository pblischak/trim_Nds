library(ape)
library(Rcpp)
Rcpp::sourceCpp("trim_Nds.cpp")

trim_Nds <- function(in_fasta_file, out_fasta_file){

  in_seqs <- ape::read.dna(in_fasta_file,
                           format="fasta",
                           as.character=T)

  out_seqs <- lapply(in_seqs, trim_Nds_cpp)

  nonzero <- lapply(out_seqs, length) != 0

  nonzero_outseqs <- lapply(out_seqs[nonzero],
                            function(v) toupper(v))

  ape::write.dna(nonzero_outseqs, out_fasta_file, format="fasta",
                 nbcol=8, colsep="", colw=10)

}
