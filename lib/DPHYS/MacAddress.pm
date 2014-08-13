use strict;
use warnings;
package DPHYS::MacAddress;
# ABSTRACT: represent a MAC address

use Carp;

use Moo;
use namespace::clean;

sub is_valid {
    my ($macaddr) = @_;
    croak 'DPHYS::MacAddress::is_valid is a class method only' if ref($macaddr) eq __PACKAGE__;

    $macaddr =~ s{[-:\.]}{}xmsgi;
    return 0 unless $macaddr =~ m{\A [\d a-f]{12} \Z}xmsi;

    return 1;
}

1;
