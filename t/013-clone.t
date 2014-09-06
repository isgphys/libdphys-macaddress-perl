#!/usr/bin/perl
use strict;
use warnings;
use 5.014;

use Test::More;

use DPHYS::MacAddress;

my $mac1 = DPHYS::MacAddress->new('01:23:45:67:89:ab');
my $mac2 = DPHYS::MacAddress->new($mac1);

is( $mac1, $mac2, 'end up with an equal object when constructing from an existing one');

done_testing();
