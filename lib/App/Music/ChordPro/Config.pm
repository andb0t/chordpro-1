#! perl

package App::Music::ChordPro::Config;

use strict;
use warnings;

=head1 NAME

App::Music::ChordPro::Config - Built-in configuration

=head1 DESCRIPTION

The configurations files are 'relaxed' JSON files. This means that
they may contain comments and trailing comma's.

Currently, most settings in the configuration files are for the PDF
backend.

This is the current built-in configuration file, showing all settings.

  // Configuration for ChordPro.
  //
  // This is a relaxed JSON document, so comments are possible.
  
  {
  
      // Strings and tuning.
      // Note that using this will discard all built-in chords!
      // "tuning" : [ "E2", "A2", "D3", "G3", "B3", "E4" ],
  
      // User defined chords.
      // "base" defaults to 1.
      // "easy" defaults to 0.
      // Use 0 for an empty string, and -1 for a muted string.
      "chords" : [
          {
  	    "name"  : "Bb",
  	    "base"  : 1,
  	    "frets" : [ 1, 1, 3, 3, 3, 1 ],
  	    "easy"  : 1,
  	  },
      ],
  
      // Printing chord grids.
      // "show": prints the chords used in the song.
      // "hard": only prints the hard chords. This includes user
      // defined chords.
      // "sorted": order the chords by key.
      "chordgrid" : {
	  "show"     :  1,
	  "hard"     :  1,
	  "sorted"   :  0,
      },
  
      // Layout definitions for PDF output.
  
      "pdf" : {
  
  	// Papersize, 'a4' or [ 595, 842 ] etc.
  	"papersize" : "a4",
  
  	// Number of columns.
  	// Can be overridden with {columns} directive.
  	// "columns"   : 2,
  	// Space between columns, in pt.
  	"columnspace"  :  20,
  
  	// Page margins.
  	// Note that top/bottom exclude the head/footspace.
  	"margintop"    :  80,
  	"marginbottom" :  40,
  	"marginleft"   :  40,
  	"marginright"  :  40,
  	"headspace"    :  60,
  	"footspace"    :  20,
  
  	// Special: head on first page only, add the headspace to
	// the other pages so they become larger.
  	"head-first-only" : 0,
  
  	// Spacings.
  	// Baseline distances as a factor of the font size.
  	"spacing" : {
  	    "title"  : 1.2,
  	    "lyrics" : 1.2,
  	    "chords" : 1.2,
  	    "grid"   : 1.2,
  	    "tab"    : 1.0,
  	    "toc"    : 1.4,
	    "empty"  : 1.0,
  	},
  	// Note: By setting the font size and spacing for empty lines to
	// smaller values, you get a fine(r)-grained control over the
	// spacing between the various parts of the song.
  
  	// Style of chorus indicator.
  	"chorus-indent"     :  0,
  	// Chorus side bar. Suppress by setting offset and width to zero.
  	"chorus-bar-offset" :  8,
  	"chorus-bar-width"  :  1,
  	"chorus-bar-color"  : "black",
  
  	// Alternative songlines with chords in a side column.
  	// Value is the column position.
  	// "chordscolumn" : 400,
  	"chordscolumn" :  0,
  
  	// Suppress empty chord lines.
  	// Overrides the -a (--single-space) command line options.
  	"suppress-empty-chords" : 1,
  
	// A {titles: left} may conflict with customized formats.
	// Set to non-zero to ignore the directive.
	"titles-directive-ignore" : 0,
  
    	// Chord grids.
  	// A chord grid consists of a number of cells.
  	// Cell dimensions are specified by "width" and "height".
  	// The horizontal number of cells depends on the number of strings.
  	// The vertical number of cells is "vcells", which should
	// be 4 or larger to accomodate most chords.
  	// The horizontal distance between grids is "hspace" cells.
  	// The vertical distance is "vspace" cells.
	// "hard": only prints the hard chords. This includes user
  	// defined chords.
	// "sorted": order the chords by key.
  	"chordgrid" : {
	    "width"    :  6,
  	    "height"   :  6,
  	    "hspace"   :  3.95,
  	    "vspace"   :  3,
  	    "vcells"   :  4,
	    "hard"     :  1,
	    "sorted"   :  1,
  	},
  
  	// Even/odd pages. A value of -1 denotes odd/even pages.
  	"even-odd-pages" : 1,
  
  	// Formats.
  	"formats" : {
  	    // Titles/Footers.

  	    // Titles/footers have 3 parts, which are printed left,
  	    // centered and right.
  	    // For even/odd printing, the order is reversed.

  	    // By default, a page has:
  	    "default" : {
  	        // No title/subtitle.
  	    	"title"     : null,
  	    	"subtitle"  : null,
  		// Footer is title -- page number.
  	    	"footer"    : [ "%t", "", "%p" ],
  		// Title for ToC.
  		"toc-title" : "Table of Contents",
  	    },
  	    // The first page of a song has:
  	    "title" : {
  	        // Title and subtitle.
  	    	"title"     : [ "", "%t", "" ],
  	    	"subtitle"  : [ "", "%s", "" ],
  		// Footer with page number.
  	    	"footer"    : [ "", "", "%p" ],
  	    },
  	    // The very first output page is slightly different:
  	    "first" : {
  	    	// It has title and subtitle, like normal 'first' pages.
  		// But no footer.
  	    	"footer"    : null,
  	    },
  	},
  
  	// Fonts.
  	// Fonts can be specified by name (for the corefonts)
  	// or a filename (for TrueType/OpenType fonts).
  	// Relative filenames are looked up in the fontdir.
  	// "fontdir" : "/home/jv/.fonts",
  
  	// Fonts for chords and comments can have a background
  	// colour associated.
  	// Colours are "#RRGGBB" or predefined names like "black", "white",
  	// and lots of others.
  
  	"fonts" : {
  	    "title" : {
  		"name" : "Times-Bold",
  		"size" : 14
  	    },
  	    "text" : {
  		"name" : "Times-Roman",
  		"size" : 14
  	    },
  	    "chord" : {
  		"name" : "Helvetica-Oblique",
  		"size" : 10
  	    },
  	    "comment" : {
  		"name" : "Helvetica",
  		"size" : 12
  	    },
  	    "tab" : {
  		"name" : "Courier",
  		"size" : 10
  	    },
  	    "toc" : {
  		"name" : "Times-Roman",
  		"size" : 11
  	    },
  	},
  
  	// Fonts that can be specified, but need not.
  	// subtitle       --> text
  	// comment        --> text
  	// comment_italic --> chord
  	// comment_box    --> chord
  	// toc            --> text
  	// grid           --> comment
  	// footer         --> subtitle @ 60%
  	// empty          --> text

  	// This will show the page layout.
  	// "showlayout" : 1,
      },
  }
  // End of config.

=cut

use JSON::PP ();

sub hmerge($$);
sub clone($);

my $default_config;

sub config_defaults {

    # We cannot read DATA more than once, so cache it.
    return $default_config if $default_config;

    if ( $App::Packager::PACKAGED ) {
	my $defs = App::Packager::GetResourcePath() .
	  "/config/chordpro.json";
	open( my $fd, "<:utf8", $defs )
	  or die("$defs: $!\n");
	local $/;
	return $default_config = <$fd>;
    }

    # To avoid duplication of data, get the defaults from the POD section.

    my @lines;
    my $copy;
    my $pfx;
    seek(DATA,0,0);
    while ( <DATA> ) {
	if ( !$copy && m;^(\s+)// Configuration; ) {
	    $pfx = length($1);
	    $copy = 1;
	}
	if ( $copy ) {
	    s/[\r\n]+$//;
	    $_ = ( " " x $pfx ) . $_ if $_ =~ /^\t/;
	    push( @lines, /\W/ ? substr( $_, $pfx ) : "" );
	    last if $_ =~ m;^(\s+)// End of config\.;;
	}
    }
    close(DATA);
    return $default_config = join( "\n", @lines ) . "\n";
}

sub configurator {
    my ( $options ) = @_;

    my $backend_configurator =
      UNIVERSAL::can( $options->{backend}, "configurator" );

    my $pp = JSON::PP->new->utf8->relaxed;

    # Load defaults.
    my $cfg = $pp->decode( config_defaults() );

    # Apply config files

    my $add_config = sub {
	my ( $file ) = @_;
	warn("Config: $file\n") if $options->{verbose};
	if ( open( my $fd, "<:utf8", $file ) ) {
	    local $/;
	    $cfg = hmerge( $cfg, $pp->decode( scalar( <$fd> ) ) );
	    close($fd);
	}
	else {
	    ### Should not happen -- it's been checked in app_setup.
	    die("Cannot open $file [$!]\n");
	}
    };

    foreach my $config ( qw( sysconfig userconfig config ) ) {
	next if $options->{"no$config"};
	if ( ref($options->{$config}) eq 'ARRAY' ) {
	    $add_config->($_) foreach @{ $options->{$config} };
	}
	else {
	    $add_config->( $options->{$config} );
	}
    }

    if ( defined $options->{'easy-chord-grids'} ) {
	$cfg->{chordgrid}->{hard} = !$options->{'easy-chord-grids'};
    }
    if ( defined $options->{'chord-grids'} ) {
	$cfg->{chordgrid}->{show} = !$options->{'chord-grids'};
    }
    if ( defined $options->{'chord-grids-sorted'} ) {
	$cfg->{chordgrid}->{sorted} = $options->{'chord-grids-sorted'};
    }

    if ( $cfg->{tuning} ) {
	my $res =
	  App::Music::ChordPro::Chords::set_tuning( $cfg->{tuning} );
	warn( "Invalid tuning in config: ",
	      $res, "\n" ) if $res;
    }

    foreach ( @{ $cfg->{chords} } ) {
	my $res =
	  App::Music::ChordPro::Chords::add_config_chord
	      ( $_->{name}, $_->{base}||1, $_->{frets}, $_->{easy} );
	warn( "Invalid chord in config: ",
	      $_->{name}, ": ", $res, "\n" ) if $res;
    }

    return $cfg if $options->{'cfg-print'};

    # Backend specific configs.
    $backend_configurator->( $cfg, $options ) if $backend_configurator;

    # For convenience...
    bless( $cfg, __PACKAGE__ );;

    # Locking the hash is mainly for development.
    if ( $] >= 5.018000 ) {
	require Hash::Util;
	Hash::Util::lock_hash_recurse($cfg);
    }

    return $cfg;
}

sub config_final {
    my ( $options ) = @_;
    $options->{'cfg-print'} = 1;
    my $cfg = configurator($options);

    my $pp = JSON::PP->new->utf8->canonical->indent(4)->pretty;
    $pp->encode($cfg);
}

sub hmerge($$) {

    # Merge hashes. Right takes precedence.
    # Based on Hash::Merge::Simple by Robert Krimen.

    my ( $left, $right ) = @_;

    my %res = %$left;

    for my $key ( keys(%$right) ) {

        if ( ref($right->{$key}) eq 'HASH'
	     and
	     ref($left->{$key}) eq 'HASH' ) {

	    # Both hashes. Recurse.
            $res{$key} = hmerge( $left->{$key}, $right->{$key} );
        }
        else {
            $res{$key} = $right->{$key};
        }
    }

    return \%res;
}

=begin later

my $cloner;

sub clone($) {
    my $self = shift;

    unless ( $cloner ) {
	eval { require Clone; $cloner = \&Clone::clone }
	  or
	eval { require Clone::PP; $cloner = \&Clone::PP::clone }
    }
    my $h = $cloner->($self);
    bless( $h, ref($self) );
}

=cut

sub clone($) {
    my ( $source ) = @_;

    return if not defined($source);

    my $ref_type = ref($source);

    # Non-reference values are copied as is.
    return $source unless $ref_type;

    # Ignore blessed objects unless it's me.
    my $class;
    if ( "$source" =~ /^\Q$ref_type\E\=(\w+)\(0x[0-9a-f]+\)$/ ) {
	$class = $ref_type;
	$ref_type = $1;
	return unless $class eq __PACKAGE__;
    }

    my $copy;
    if ( $ref_type eq 'HASH' ) {
	$copy = {};
	%$copy = map { !ref($_) ? $_ : clone($_) } %$source;
    }
    elsif ( $ref_type eq 'ARRAY' ) {
	$copy = [];
	@$copy = map { !ref($_) ? $_ : clone($_) } @$source;
    }
    elsif ( $ref_type eq 'REF' or $ref_type eq 'SCALAR' ) {
	$copy = \( my $var = "" );
	$$copy = clone($$source);
    }
    else {
	# Plain copy anything else.
	$copy = $source;
    }
    bless( $copy, $class ) if $class;
    return $copy;
}

unless ( caller ) {
    print( config_defaults() );
    exit;
}

1;

__DATA__