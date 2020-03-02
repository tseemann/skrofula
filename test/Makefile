
PREFIX=/home/tseemann/git/skrofula
INDIR=MDU
#INDIR=.
OUTDIR=tb
CPUS=36

all: 1

1:
	$(PREFIX)/bin/skrofula \
		--R1 $(INDIR)/R1.fq.gz --R2 $(INDIR)/R2.fq.gz \
		--outdir $(OUTDIR) \
		--threads $(CPUS)

2:
	$(PREFIX)/bin/skrofula \
		--R1 R1.fq.gz --R2 R2.fq.gz \
		--outdir $(OUTDIR) \
		--threads $(CPUS)

