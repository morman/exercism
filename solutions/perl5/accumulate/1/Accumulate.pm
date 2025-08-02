package Accumulate;

use strict;
use warnings;
use feature qw<say>;

use Exporter qw<import>;
our @EXPORT_OK = qw<accumulate>;

sub accumulate {
    my ( $list, $func ) = @_;
    ## initialize results
    my @results;
    ## add to the results, transcribing subroutine function with elements from list
    push @results, $func->($_) for @$list;
    ## return the reference to the results array
    return \@results;
}

1;
