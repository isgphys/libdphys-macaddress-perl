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

sub colons {
    my ( $self ) = @_;
    return join(':', unpack('H2' x 6, $self->binary()));
}

sub cisco {
    my ( $self ) = @_;
    return join('.', unpack('H4' x 3, $self->binary()));
}

sub dashes {
    my ( $self ) = @_;
    return uc(join('-', unpack('H2' x 6, $self->binary())));
}

sub is_multicast {
    my ( $self ) = @_;
    return !! vec($self->binary(), 0, 1);
}

sub is_local {
    my ( $self ) = @_;
    return !! vec($self->binary(), 1, 1);
}

use overload q("") => sub {shift->colons};


use overload q(<=>) => sub { my ($x, $y) = @_; return "$x" cmp "$y"; };
use overload q(cmp) => sub { my ($x, $y) = @_; return "$x" cmp "$y"; };

1;

__END__

=head1 SYNOPSIS

  use DPHYS::MacAddress

  my $mac = DPHYS::MacAddress->new('01:23:45:67:89:AB');
  say $mac->colons();  # 01:23:45:67:89:ab
  say $mac->cisco();   # 0123.4567.89ab

  say DPHYS::MacAddress->new('XYZXYZ')->colons(); # 58:59:5A:58:59:5A

  DPHYS::MacAddress->new('FOO'); # throws error, invalid MAC address

  DPHYS::MacAddress::is_valid('0123456789ab');  # true
  DPHYS::MacAddress::is_valid('FOO');           # false

=head1 DESCRIPTION

The Moo Class DPHYS::MacAddress represents valid MAC addresses.  The
constructor accepts either a string of 6 bytes (48 bits) as the binary
representation of the MAC address or any of a number of string representations.

In the first example given the constructor is called with a typical colon
separated string of hex digits.  The output shows the same string again
(converted to lower case) and alternatively in the format used by CISCO three
groups of four hex digits separated by dots.

If given a string of 6 bytes it is assumed to represent the MAC address
literally.  Such strings are not typically composed of printable characters.
They may however occur naturally as parts of network data.

If given a invalid MAC address the constructor throws an exception.

=method is_valid

The class function DPHYS::MacAddress::is_valid can be used to test the validity
of a MAC address underneath it is the same function used in the constructor to
reject invalid arguments.  Unlike the constructor it does not throw an
exception when given an invalid MAC address and just returns false.

=method new

C<$mac = DPHYS::MacAddress->new('01:23:45:67:89:ab')> constructs a new
C<DPHYS::MacAddress> object.  These objects have a number of methods available.

=method colons

C<$mac->colons()> returns the MAC address in colon separated for with pairs of
hex digits.
