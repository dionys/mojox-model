#!/usr/bin/env perl

use strict;
use warnings;

use ExtUtils::MakeMaker;


WriteMakefile(
	NAME             => 'MojoX::Model',
	AUTHOR           => 'Denis Ibaev <dionys@cpan.org>',
	VERSION_FROM     => 'lib/MojoX/Model.pm',
	ABSTRACT_FROM    => 'lib/MojoX/Model.pm',
	LICENSE          => 'perl',
	MIN_PERL_VERSION => '5.010001', # like Mojolicious
	BUILD_REQUIRES   => {
#		'Test::Deep'  => 0,
		'Test::More'  => 0,
	},
	PREREQ_PM        => {
		'Mojolicious' => 0,
	},
	META_MERGE       => {
		resources => {
			license     => 'http://dev.perl.org/licenses/',
			repository  => 'http://github.com/dionys/mojox-model',
			bugtracker  => 'http://github.com/dionys/mojox-model/issues',
		},
		no_index  => {directory => ['t']},
	},
	dist             => {COMPRESS => 'gzip -9f', SUFFIX => 'gz'},
	clean            => {FILES => 'MojoX-Model-*'},
	test             => {TESTS => 't/*.t'},
);
