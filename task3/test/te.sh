#!/usr/bin/env bash
    usage() { echo "Usage: $0 -f sample_R1.fastq
	    -r sample_R2.fastq 
	    -H HISAT2_REFERENCE_PATH
	    -g GTF_file
	    -s KNOWN_SPLICE_FILE
	    -b BOWTIE2_REFERENCE.fasta 
	    -R RSEM_REFERENCE 
	    -o OUTPUT_PATH 
	    [-h]" 1>&2; exit 1; }

while getopts "f:r:H:g:s:b:R:o:h" opt; do
    case "${opt}" in
        f) f="$OPTARG" ;; # sample_R1.fastq 
        r) r="$OPTARG" ;; # sample_R2_fastq
        H) hrp="$OPTARG" ;;    # HISAT2_REFERENCE_PATH
        g) g="$OPTARG" ;;        # GTF_file
        s) sp="$OPTARG" ;; # KNOWN_SPLICE_FILE
        b) b="$OPTARG" ;;        # BOWTIE2_REFERENCE
        R) rsem_path="$OPTARG" ;; #RSEM Reference path
        o) out_path="$OPTARG" ;; #Results output path
        h | [?]) usage ; exit;;
    esac
done
shift $((OPTIND-1))

echo "f = ${f}"
echo "r = ${r}"
echo "hrp = ${hrp}"
echo "g = ${g}"
echo "sp = ${sp}"
echo "b = ${b}"
echo "rsem_path = ${rsem_path}"
echo "out_path = ${out_path}"

