#!/usr/bin/perl
use strict;
use warnings;
use 5.014;

use Test::More;
use Test::Exception;

use DPHYS::MacAddress;

throws_ok( sub { DPHYS::MacAddress->new() }, qr{no MAC address});
throws_ok( sub { DPHYS::MacAddress->new(1, 2) }, qr{more than one argument});

done_testing();
