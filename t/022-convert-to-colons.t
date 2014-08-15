#!/usr/bin/perl
use strict;
use warnings;
use 5.014;

use Test::More;

use DPHYS::MacAddress;

is( DPHYS::MacAddress->new('012345')->colons(), '30:31:32:33:34:35',
    'binary 012345 is colons 30:31:32:33:34:35');

is( DPHYS::MacAddress->new('abcXYZ')->colons(), '61:62:63:58:59:5a',
    'binary abcXYZ is colons 61:62:63:58:59:5a');

done_testing();
