use strict;
use warnings;
package DPHYS::MacAddress;
# ABSTRACT: represent a MAC address

use Moo;

sub is_valid {
    my ($macaddr) = @_;

    $macaddr =~ s{[-:\.]}{}xmsgi;
    return 0 unless $macaddr =~ m{\A [\d a-f]{12} \Z}xmsi;

    return 1;
}

1;
