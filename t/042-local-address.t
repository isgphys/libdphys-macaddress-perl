#!/usr/bin/perl
use strict;
use warnings;
use 5.014;

use Test::More;

use DPHYS::MacAddress;

ok( not(DPHYS::MacAddress->new('00:01:02:ab:cd:ef')->is_local()),
    '00:01:02:ab:cd:ef is global (OUI by vendor)');
ok( DPHYS::MacAddress->new('03:02:03:ab:cd:ef')->is_local(),
    '03:02:03:ab:cd:ef is multicast');

done_testing();
