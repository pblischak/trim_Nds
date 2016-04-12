# trim_Nds: 


# Source in utility functions
source("trim_utils.R")

trim_Nds <- function(in_fasta_file, out_fasta_file){

  # Read in fasta file
  in_seqs <- ape::read.dna(in_fasta_file,
                           format="fasta",
                           as.character=T)
  
  # check for sequences that only have N's or ?'s and remove
  good_seqs <- lapply(in_seqs, check_seq)
  seqs_to_trim <- in_seqs[as.logical(good_seqs)]
  
  # trim sequences
  out_seqs <- lapply(seqs_to_trim, trim_seq)

  # change letters to upper case
  upper_out_seqs <- lapply(out_seqs, toupper)

  # write output file with 80 characters per line
  ape::write.dna(upper_out_seqs, out_fasta_file, format="fasta",
                 nbcol=8, colsep="", colw=10)

}
