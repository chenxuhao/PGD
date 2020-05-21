#!/bin/bash
#./pgd_4motif -f ~/datasets/Mining/patent_citations.cel
BENCHMARKS="pgd_3motif"
#BENCHMARKS="pgd_4motif"
#GRAPHS="mico patent_citations youtube"
#GRAPHS="soc-LiveJournal1"
#GRAPHS="com-Orkut"
#GRAPHS="soc-twitter-2010"
GRAPHS="twitter40"
GRAPHS="citeseer"
#friendster uk2007"
NTHREADS="56"
#BLOCKS="1"
#BLOCKS="1 2 4 8 16 32 64 128"
OUTDIR=/h2/xchen/work/PGD/outputs

for BIN in $BENCHMARKS; do
	for GRAPH in $GRAPHS; do
		for NT in $NTHREADS; do
			#for NB in $BLOCKS; do
				export OMP_NUM_THREADS=$NT
				#echo "running $BIN with $GRAPH (b=$NB,nthreads=$NT) on $(date)"
				#echo "./$BIN -f ~/datasets/Mining/$GRAPH.cel -b $NB &> $OUTDIR/$BIN-$GRAPH-$NT-$NB.log"
				#./$BIN -f ~/datasets/Mining/$GRAPH.cel -b $NB &> $OUTDIR/$BIN-$GRAPH-$NT-$NB.log
				echo "running $BIN with $GRAPH (nthreads=$NT) on $(date)" >> $OUTDIR/date.log
				echo "./$BIN -f ~/datasets/Mining/$GRAPH.cel &> $OUTDIR/$BIN-$GRAPH-$NT.log"
				./$BIN -f ~/datasets/Mining/$GRAPH.cel &> $OUTDIR/$BIN-$GRAPH-$NT.log
			#done
		done
	done
done

