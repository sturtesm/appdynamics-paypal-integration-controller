#!/usr/bin/perl

use strict;

my @names = ('steve', 'mike', 'ben', 'bob', 'amanda', 'charlotte', 'alex', 'emory', 'david', 'jack', 'jeanne');
my $maxRows=1000000;
my $i=0;

for ($i=0; $i < $maxRows; $i++)
{
    my $name = $names[ rand @names ];

    print "$i, '$name', 'abcdefghigkljasdlkjasdf'\n";
}
