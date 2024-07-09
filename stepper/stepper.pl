use strict;
use 5.10.0;

foreach my $fn (@ARGV){
	open (INF, $fn);
	while(<INF>){
		next if /^$/;
		next if /^#/;
		s/## .*//;
		say "$1: $fn"
			if (/save\([a-z=]*['"]([^'"]*)/);
	}
	close(INF);
}

