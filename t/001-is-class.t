#!/usr/bin/perl
use strict;
use warnings;
use 5.014;

use Test::More;

use DPHYS::MacAddress;

is(ref(DPHYS::MacAddress->new()), 'DPHYS::MacAddress', 'DPHYS::MacAddress must be a class package');

done_testing();
