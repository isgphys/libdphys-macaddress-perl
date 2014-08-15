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
    my $mac = DPHYS::MacAddress->new($macaddr);
    is(ref($mac), 'DPHYS::MacAddress', "generate object for $macaddr");
}

# invalid MAC addresses
foreach my $macaddr (qw(
    01:23:45:67:89
    ab:cd:ef:gh:ij:kl
    XYZ
)) {
    throws_ok(sub { DPHYS::MacAddress->new($macaddr) }, qr{invalid MAC});
}

done_testing();
