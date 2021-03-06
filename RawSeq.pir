
#
# A structure for maintaining the information about a single
# molecular sequence that is part of a RawDiskSeqs collection
#


- PerlClass	PirObject::RawSeq
- InheritsFrom	PirObject
- FieldsTable

# Field name		Sing/Array/Hash	Type		Comments
#---------------------- ---------------	---------------	-----------------------
id                      single          string          Internal ID (usually "S0xNNNN" where NNN is hex)
fastaheader             single          string
startoffset             single          int4            Byte position in raw file
seqlength               single          int4

# The following fields are used for subregions of a genome, but not for the main genome
parentId                single          string
parentName              single          string          from fastaheader of parent
parentStart             single          int4            Start always < stop
parentStop              single          int4            Stop always > start
parentStrand            single          string          "+" or "-"

- EndFieldsTable
- Methods

our $RCS_VERSION='$Id: RawSeq.pir,v 1.4 2008/08/20 19:43:22 riouxp Exp $';
our ($VERSION) = ($RCS_VERSION =~ m#,v ([\w\.]+)#);

sub GetSubseq {
    my $self      = shift;
    my $start     = shift;
    my $len       = shift;

    my $class    = ref($self);

    die "This is an instance method.\n"  unless $class;
    die "Error: len must be positive.\n" unless $len >= 0;

    my $fh = $self->{'_tiedFh_'};
    die "Object not yet tied to a file on disk?!?\n" unless $fh;

    my $rawstart = $self->get_startoffset();
    my $rawlen   = $self->get_seqlength();

    if ($start < 0 || $start >= $rawlen) {
        die "Error: start position '$start' is outside of sequence boundaries 0 .. " . ($rawlen-1) . "\n";
    }
    if ($start+$len > $rawlen) {
        die "Error: with start '$start', length '$len' is outside of sequence boundaries 0 .. " . ($rawlen-1) . "\n";
    }

    return "" if $len == 0;

    my $realstart = $rawstart+$start;
    my $subseq = "";

    $fh->sysseek($realstart,0);
    my $found = $fh->sysread($subseq,$len);
    #print STDERR "Extracting at $realstart for $len\n";
    if (!defined($found) || $found != $len) {
        die "Error: could not read $len bytes from tied filehandle; got '" . (defined($found) ? $found : "undef") . "' bytes instead.\n";
    }

    $subseq;
}

sub GetSubseqReverse {
    my $self      = shift;
    my $start     = shift;
    my $len       = shift;

    my $class    = ref($self);

    die "This is an instance method.\n"  unless $class;
    die "Error: len must be positive.\n" unless $len > 0;

    my $seqlength = $self->get_seqlength();
    my $newstart  = $seqlength-1-$start-($len-1); # I know the +1 -1 cancels each other
    my $subseq = $self->GetSubseq($newstart,$len);
    $subseq = reverse($subseq);
    $subseq =~ tr/acgtACGT/tgcaTGCA/;
    $subseq;
}
