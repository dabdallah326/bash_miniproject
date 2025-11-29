#!/usr/bin/bash

cd ../Data/

min_len=10000
min_coverage=5.0


length_list=$(grep ">" IP-004_S38_L001_scaffolds.fasta | cut -d'_' -f4) # Extract the sequence lengths

for length in $length_list; do # loop through each extracted sequence length in the list
        if [ "$length" -ge "$minimum_length" ]; then # Check if the current length is grater than or equal to  minimum length
                cov=$(grep "length_$length" IP-004_S38_L001_scaffolds.fasta | cut -d'_' -f6)
		if [ -n "$cov" ] && [ $(echo "$cov >= $minimum_coverage" | bc -l) -eq 1 ]; then #compare if the coverage are greater than or equal to the minumum threshold 
			grep "length_$length" IP-004_S38_L001_scaffolds.fasta >> ../results/high_quality_scaffolds.txt
		fi
		
        fi
done

sequence_count=$(cat ../results/high_quality_scaffolds.txt | wc -l)

echo "$length_list" > results/high_quality_scaffolds.txt
