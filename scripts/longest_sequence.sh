#!/usr/bin/bash

cd ../Data/
#use _ as adelimiter and extract the 4th field 
longest_sequence=$(grep ">" IP-004_S38_L001_scaffolds.fasta | cut -d'_' -f4 | sort -n | tail -1)

#Extract the 4th field again
seq_length=$(grep "length_$longest_sequence" IP-004_S38_L001_scaffolds.fasta | cut -d '>' -f2 | cut -d'_' -f4)

#Extract the 6th field which contain the coverage value
coverage=$(grep "length_$longest_sequence" IP-004_S38_L001_scaffolds.fasta | cut -d'>' -f2 | cut -d'_' -f6)

#Remove the leading > symbol
sequence_id=$(grep "length_$longest_sequence" IP-004_S38_L001_scaffolds.fasta | cut -d'>' -f2 | cut -d'_' -f1,2)

touch ../results/longest_sequence.txt
echo "longest sequence: $sequence_id" > ../results/longest_sequence.txt
echo "length: $seq_length" >> ../results/longest_sequence.txt
echo "coverage: $coverage" >> ../results/longest_sequence.txt

