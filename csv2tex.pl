#!/usr/bin/perl -w
# usage: ./csv2tex.pl allnames_0a.csv > out.tex; xelatex out.tex 
use strict;

my $linecount = 0;
my $fn;
my $ln;

my $intro = <<'EOF';
\documentclass[12pt]{article}
\usepackage{badges} %use xelatex
\usepackage{graphicx}
\begin{document}
\setlength{\unitlength}{1in}

EOF

my $startpage = <<'EOF';
\begin{picture}(8.3,9.3)
\drawbackground
\put(-0.05,4.45){
 \begin{tabular}{C{3.83in}C{3.83in}}
EOF

# \rowof{Andy}{Zed}{Leo}{Thecat}

my $endpage = <<'EOF';
 \end{tabular}
}
\end{picture}
\newpage

EOF

my $outro = "\\end{document}\n";

####

print $intro;

while(<>){
    chomp;
    $linecount++;
    $linecount = 1 if $linecount > 6;
    print $startpage if $linecount == 1;
    if (($linecount % 2) == 1) {
	($fn,$ln) = split(/,/);
    }
    else {
	my($fn2,$ln2) = split(/,/);
	print " \\rowof{$fn}{$ln}{$fn2}{$ln2}\n";
    }
    print $endpage if $linecount == 6;
}

print $endpage if $linecount != 6; # still kludgy if odd num of names
# last page is a fail anyway, because of LaTeX.

print $outro;
