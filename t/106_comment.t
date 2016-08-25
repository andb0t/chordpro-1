#!/usr/bin/perl

use strict;
use warnings;
use utf8;
use Test::More tests => 3;

use App::Music::ChordPro::Config;
use App::Music::ChordPro::Songbook;

our $config = App::Music::ChordPro::Config::configurator;
# Prevent a dummy {body} for chord grids.
$config->{chordgrid}->{show} = 0;
my $s = App::Music::ChordPro::Songbook->new;

my $data = <<EOD;
{t Swing Low Sweet Chariot}
{c This is a comment}
{highlight This is also a comment}
{ci This is a comment_italic}
{cb This is a comment_box}
EOD

eval { $s->parsefile(\$data) } or diag("$@");

ok( scalar( @{ $s->{songs} } ) == 1, "One song" );
isa_ok( $s->{songs}->[0], 'App::Music::ChordPro::Song', "It's a song" );

my $song = {
	    'settings' => {},
	    'meta' => {
		       'title' => [
				   'Swing Low Sweet Chariot'
				  ],
		      },
	    'title' => 'Swing Low Sweet Chariot',
	    'body' => [
		       {
			'type' => 'comment',
			'context' => '',
			'text' => 'This is a comment'
		       },
		       {
			'type' => 'comment',
			'context' => '',
			'text' => 'This is also a comment'
		       },
		       {
			'context' => '',
			'type' => 'comment_italic',
			'text' => 'This is a comment_italic'
		       },
		       {
			'text' => 'This is a comment_box',
			'context' => '',
			'type' => 'comment_box'
		       }
		      ],
	    'structure' => 'linear',
	   };

is_deeply( { %{ $s->{songs}->[0] } }, $song, "Song contents" );
