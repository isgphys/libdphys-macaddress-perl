#!/usr/bin/perl
use strict;
use warnings;
use 5.014;

use Test::More;

use DPHYS::MacAddress;

is( DPHYS::MacAddress->new('303132333435')->binary(), '012345',
    'binary 012345 is hex 303132333435 is binary 012345');

is( DPHYS::MacAddress->new('61:62:63:58:59:5a')->binary(), 'abcXYZ',
    '61:62:63:58:59:5a is binary abcXYZ');

done_testing();
