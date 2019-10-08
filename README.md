[![Build Status](https://travis-ci.org/tseemann/skrofula.svg?branch=master)](https://travis-ci.org/tseemann/skrofula)
[![License: GPL v3](https://img.shields.io/badge/License-GPL%20v3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)
![Don't judge me](https://img.shields.io/badge/Language-Perl_5-steelblue.svg)

:warning: This software is still in early development

# skrofula

Yet another M.tuberculosis typing and resistance tool, but for the impatient
(or in-patient)

## Introduction

Skrofula will take paired-end Illumina WGS reads of your
_M.tuberculosis_ sample and infer the lineage and 
antimicrobial resistance SNPs. This is not an original tool,
but it is designed to be simple and fast. I wrote it to learn
more about _M.tb_ genomics. Other tools that may suit you better are:

* [TBProfiler](https://github.com/jodyphelan/TBProfiler)
* [MTBseq](https://github.com/ngs-fzb/MTBseq_source)
* [Mykrobe](https://github.com/Mykrobe-tools/mykrobe)
* [TGS-TB](https://gph.niid.go.jp/tgs-tb/)
* [ReSeqTB UVP](https://github.com/CPTR-ReSeqTB/UVP)

## Quick Start

```
% skrofula --version
skrofula 0.1.2

% skrofula --outdir TBdir --R1 Mtb_R1.fq.gz --R2 Mtb_R2.fq.gz --threads 8
% ls TBdir
snps.vcf lineage.txt resistome.tab
```

## Installation

### Conda
Install [Conda](https://conda.io/docs/) or [Miniconda](https://conda.io/miniconda.html):
```
conda install -c conda-forge -c bioconda -c defaults skrofula # COMING SOON
```

### Homebrew
Install [HomeBrew](http://brew.sh/) (Mac OS X) or [LinuxBrew](http://linuxbrew.sh/) (Linux).
```
brew install brewsci/bio/skrofula # COMING SOON
```

### Source
This will install the latest version direct from Github.
You'll need to add the skrofula `bin` directory to your `$PATH`,
and also ensure all the [dependencies](#Dependencies) are installed.
```
cd $HOME
git clone https://github.com/tseemann/skrofula.git
$HOME/skrofula/bin/skrofula --help
```

## Dependencies

* `perl` >= 5.26
* `mapcaller` >= 0.9.9.15
* `bcftools` >= 1.9

## Etymology

The name `skrofula` comes from
[_scrofula_](https://en.wiktionary.org/wiki/scrofula)
which is the common name for the disease
[mycobacterial cervical lymphadenitis](https://en.wikipedia.org/wiki/Mycobacterial_cervical_lymphadenitis)
related to tuberculosis.
Thank you to [Will Pitchers](https://github.com/willpitchers) for coining the name.

## License

skrofula is free software, released under the
[GPL 3.0](https://raw.githubusercontent.com/tseemann/skrofula/master/LICENSE).

## Issues

Please submit suggestions and bug reports to the
[Issue Tracker](https://github.com/tseemann/skrofula/issues)

## Authors

* [Torsten Seemann](https://tseemann.github.io/)
* [Kristy Horan](https://github.com/kristyhoran)
