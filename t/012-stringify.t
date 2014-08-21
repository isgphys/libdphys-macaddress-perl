#!/usr/bin/perl
use strict;
use warnings;
use 5.014;

use Test::More;

use DPHYS::MacAddress;

my $mac = DPHYS::MacAddress->new('012345abCDeF');
is("stringify $mac", 'stringify 01:23:45:ab:cd:ef', 'stringify overloading');

done_testing();
