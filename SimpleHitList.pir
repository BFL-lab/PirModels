#
# A list of hit results; not much else for the moment.
#
#    $Id: SimpleHitList.pir,v 1.1 2007/07/11 19:55:18 riouxp Exp $
#
#    $Log: SimpleHitList.pir,v $
#    Revision 1.1  2007/07/11 19:55:18  riouxp
#    New project. Initial check-in.
#
#    Added Files:
#        HMMweasel
#        HMMER2SearchEngine.pir LinStruct.pir PotentialResult.pir
#        RawDiskSeqs.pir RawSeq.pir ResultElement.pir SearchEngine.pir
#        SimpleHit.pir SimpleHitList.pir StructElem.pir
#

- PerlClass	PirObject::SimpleHitList
- InheritsFrom	PirObject
- FieldsTable

# Field name		Sing/Array/Hash	Type		Comments
#---------------------- ---------------	---------------	-----------------------
hitlist                 array           <SimpleHit>

- EndFieldsTable
- Methods

