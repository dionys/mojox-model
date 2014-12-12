#!/usr/bin/env perl

use strict;
use warnings;

use Test::More tests => 3;


BEGIN {
	use_ok 'MojoX::Model' or print("Bail out!\n");
	use_ok 'MojoX::Models' or print("Bail out!\n");
	use_ok 'Mojolicious::Plugin::Model' or print("Bail out!\n");
}

diag "Testing MojoX::Model $MojoX::Model::VERSION, Perl $], $^X";
