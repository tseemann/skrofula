#!/usr/bin/env perl
use strict;
use List::Util qw(uniq);

# PYRAZINAMIDE    2288746 CG      C       Rv2043c CG496C
# streptomycin    1472362 C       T       rrs     C517T
# ETHAMBUTOL      4246734 T       G       embB    Leu74Arg
# PYRAZINAMIDE    1834852 CGCC    C       rpsA    Ala438
# para-aminosalicylic_acid        3074254 T       TGTGCTCGTG      thyA    T218TGTGCTCGTG
# PYRAZINAMIDE    2288683 T       C       pncA    Stop187Arg
# isoniazid       2155159/2155158 AG      TA      katG    Glu318Val
# isoniazid       2155738 C       CATG    katG    C374CATG
# isoniazid       2155945 TCAGCGACGGCCGGGT        T       katG    TCAGCGACGGCCGGGT167T

my %var;
while (<ARGV>) {
  chomp;
  my($drug,$pos,$ref,$alt,$gene,$change) = split m/\t/;
  next unless $pos =~ m/^(\d+)/;
  $pos = $1;
  my $type = ('ins','snp','del')[ 1 + (length($ref) <=> length($alt)) ];
  my $key = "$pos-$ref-$alt";
  $var{$key} ||= {
      POS => $pos,
      REF => $ref,
      ALT => $alt,
      GENE => $gene,
      CHANGE => $change,
      TYPE => $type,
  };
  push @{$var{$key}{DRUGS}}, lc($drug);
}

# print fixed header
print while (<DATA>);
# now variants
for my $key (sort { $var{$a}{POS} <=> $var{$b}{POS} } keys %var) {
  my $v = $var{$key};
  print join("\t",
    'Chromosome',
    $$v{POS},
    $$v{GENE}.'.'.$$v{CHANGE},
    $$v{REF},
    $$v{ALT},
    '.',    # QUAL
    'PASS', # FILTER
    'TYPE='.$$v{TYPE}.';DRUGS='.join(',', uniq(@{$v->{DRUGS}})),
    'GT',
    '1',
  ),"\n";
}

__DATA__
##fileformat=VCFv4.2
##FILTER=<ID=PASS,Description="All filters passed">
##INFO=<ID=TYPE,Number=A,Type=String,Description="Variant type: snp, ins, del.">
##INFO=<ID=DRUGS,Number=A,Type=String,Description="Confers resistance to these drugs.">
##FORMAT=<ID=GT,Number=1,Type=String,Description="Genotype">
##contig=<ID=Chromosome,length=4411532>
#CHROM	POS	ID	REF	ALT	QUAL	FILTER	INFO	FORMAT	skrofula
