#!/usr/bin/perl
use strict;
use warnings;
use 5.014;

use Test::More;
use Test::Exception;

use DPHYS::MacAddress;

# valid MAC addresses
foreach my $macaddr (qw(
    01:23:45:67:89:ab
    01:23:45:67:89:AB
    01-23-45-67-89-ab
    01-23-45-67-89-AB
    0123.4567.89ab
    0123.4567.89AB
    0123456789ab
    0123456789AB
)) {
    ok(DPHYS::MacAddress::is_valid($macaddr), "$macaddr is a valid MAC address");
}

# invalid MAC addresses
foreach my $macaddr (qw(
    01:23:45:67:89
    ab:cd:ef:gh:ij:kl
    XYZ
)) {
    ok(!DPHYS::MacAddress::is_valid($macaddr), "$macaddr is not a valid MAC address");
}

# make sure is_valid is a class method only
throws_ok(sub { DPHYS::MacAddress->new()->is_valid() }, qr{class method}, 'DPHYS::MacAddress::is_valid is a class method only');

done_testing();
