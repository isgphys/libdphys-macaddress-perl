#!/usr/bin/perl
use strict;
use warnings;
use 5.014;

use Test::More;

use DPHYS::MacAddress;

is( DPHYS::MacAddress->new('012345')->hex(), '303132333435',
    'binary 012345 is hex 303132333435');

is( DPHYS::MacAddress->new('abcXYZ')->hex(), '61626358595a',
    'binary abcXYZ is hex 61626358595a');

done_testing();
