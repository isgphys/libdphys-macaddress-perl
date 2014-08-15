#!/usr/bin/perl
use strict;
use warnings;
use 5.014;

use Test::More;

use DPHYS::MacAddress;

is(ref(DPHYS::MacAddress->new('00:11:22:33:44:55')), 'DPHYS::MacAddress', 'DPHYS::MacAddress must be a class');

done_testing();
