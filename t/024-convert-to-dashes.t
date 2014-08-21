#!/usr/bin/perl
use strict;
use warnings;
use 5.014;

use Test::More;

use DPHYS::MacAddress;

is( DPHYS::MacAddress->new('012345')->dashes(), '30-31-32-33-34-35',
    'binary 012345 is cisco 30-31-32-33-34-35');

is( DPHYS::MacAddress->new('abcXYZ')->dashes(), '61-62-63-58-59-5A',
    'binary abcXYZ is cisco 61-62-63-58-59-5A');

# dashes are used mostly with uppercase letters by convention
is( DPHYS::MacAddress->new('ab-cd-ef-AB-CD-EF')->dashes(), 'AB-CD-EF-AB-CD-EF',
    'binary ab-cd-ef-AB-CD-EF is cisco AB-CD-EF-AB-CD-EF');

done_testing();
