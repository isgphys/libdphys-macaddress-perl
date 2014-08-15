use strict;
use warnings;
package DPHYS::MacAddress;
# ABSTRACT: represent a MAC address

use Carp;

use Moo;

sub _to_binary {
    my ($macaddr) = @_;
    croak 'DPHYS::MacAddress::_to_binary is a class method only' if ref($macaddr) eq __PACKAGE__;

    $macaddr =~ s{[-:\.]}{}xmsgi;
    return unless $macaddr =~ m{\A [\d a-f]{12} \Z}xmsi;

    return pack('H2' x 6, unpack('A2' x 6, $macaddr));
}

use namespace::clean;

sub is_valid {
    my ($macaddr) = @_;
    croak 'DPHYS::MacAddress::is_valid is a class method only' if ref($macaddr) eq __PACKAGE__;

    return !! _to_binary($macaddr);
}

has 'binary' => (
    is => 'ro',
);

sub BUILDARGS {
    my ( $class, $mac, @args ) = @_;
    croak 'no MAC address given' unless defined($mac);
    croak 'constructor called with more than one argument' if @args;

    return { binary => $mac->binary } if ref($mac) eq __PACKAGE__;

    $mac = _to_binary($mac) unless length($mac) == 6;
    croak 'invalid MAC address' unless $mac;
    return { binary => $mac };
};

sub hex {
    my ( $self ) = @_;
    return unpack('H12', $self->binary());
}

1;
