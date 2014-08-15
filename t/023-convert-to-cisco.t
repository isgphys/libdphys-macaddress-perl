#!/usr/bin/perl
use strict;
use warnings;
use 5.014;

use Test::More;

use DPHYS::MacAddress;

is( DPHYS::MacAddress->new('012345')->cisco(), '3031.3233.3435',
    'binary 012345 is cisco 3031.3233.3435');

is( DPHYS::MacAddress->new('abcXYZ')->cisco(), '6162.6358.595a',
    'binary abcXYZ is cisco 6162.6358.595a');

done_testing();
