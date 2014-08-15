#!/usr/bin/perl
use strict;
use warnings;
use 5.014;

use Test::More;

use DPHYS::MacAddress;

is( DPHYS::MacAddress->new('01:23:45:ab:cd:ef')->cisco(), '0123.45ab.cdef',
    'colons 01:23:45:ab:cd:ef is cisco 0123.45ab.cdef');

is( DPHYS::MacAddress->new('01-23-45-AB-CD-EF')->cisco(), '0123.45ab.cdef',
    'binary 01-23-45-AB-CD-EF is cisco 0123.45ab.cdef');

done_testing();
