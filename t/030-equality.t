#!/usr/bin/perl
use strict;
use warnings;
use 5.014;

use Test::More;

use DPHYS::MacAddress;

my $mac1 = DPHYS::MacAddress->new('01:23:45:ab:cd:ef');
my $mac2 = DPHYS::MacAddress->new('01:23:45:ab:cd:ef');
my $mac3 = DPHYS::MacAddress->new('00:44:88:cc:35:79');

cmp_ok( $mac1, '==', $mac1, 'same object should be equal');
cmp_ok( $mac2, '==', $mac1, 'different object with the same MAC address should be equal');
cmp_ok( $mac3, '!=', $mac1, 'different MAC will not be equal');

cmp_ok( $mac1, 'eq', $mac1, 'same object should be equal');
cmp_ok( $mac2, 'eq', $mac1, 'different object with the same MAC address should be equal');
cmp_ok( $mac3, 'ne', $mac1, 'different MAC will not be equal');

done_testing();
