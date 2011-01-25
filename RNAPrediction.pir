
#
# PirObject definition file for a RNA prediction
# This object is used by RNAfinder.
#
#    $Id: RNAPrediction.pir,v 1.3 2011/01/25 21:15:51 nbeck Exp $
#
#    $Log: RNAPrediction.pir,v $
#    Revision 1.3  2011/01/25 21:15:51  nbeck
#    Removed inclusion, added comments for MFannot, changed output format.
#
#    Revision 1.2  2009/07/21 15:58:18  nbeck
#    Fusion between RNASpinner and RNAfinder.
#
#    Revision 1.1  2008/10/28 21:57:23  nbeck
#    Initial check-in.
#.
#

- PerlClass	PirObject::RNAPrediction
- InheritsFrom	PirObject
- FieldsTable

# Field name		Sing/Array/Hash	Type		Comments
#---------------------- ---------------	---------------	-----------------------
contigname              single          string          Sequence where the tRNA was found
strand                  single          string          "+" or "-"
start                   single          int4            12 (overall start)
stop                    single          int4            454 (overall stop)
evalue                  single          string          evalue giving by erpin
aacode                  single          string          "S" for serine
anticodon_start         single          int4            445
anticodon_stop          single          int4            447
anticodon_seq           single          string          anticodon "GCU" -> codon AGC (serine)
label                   single          string          Indicate label it's use for Intron
align                   single          string          A condensed alignment readable by human
commentForMFa           single          string          comment for MFannot

- EndFieldsTable

- Methods

our $RCS_VERSION='$Id: RNAPrediction.pir,v 1.3 2011/01/25 21:15:51 nbeck Exp $';
our ($VERSION) = ($RCS_VERSION =~ m#,v ([\w\.]+)#);

# None of the moment.
