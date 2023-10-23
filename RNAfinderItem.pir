
#
# This class contain hash of Item List for each RNA model
#

- PerlClass	PirObject::RNAfinderItem
- InheritsFrom	PirObject
- FieldsTable

# Field name    		Sing/Array/Hash	Type		    Comments
#---------------------- ---------------	---------------	-----------------------
erpinArg                single          string          list of erpin argument
modelFile               single          string          file name of the model erpin
cutoff                  single          string          cutoff used by erpin
Label                   single          string          used for certain RNA (Intron)
AcId                    single          int4            number of anticodon element
module                  single          string          number identification for module, can be a list of number
modTab                  array           int4            number identification for module, can be a list of number
comment                 single          string          comment for menu
erpinMaskNums           array           string          Mask number used by erpin
ModelFile               single          string          Name of file contain non redundant model
lowest                  single          int4            The lowest mask number used by erpin
erpinOut                single          string          erpin outfile
erpinErr                single          string          erpin errfile
time                    single          string          time for run erpin
gaptoend                single          string          list of elements where gaps must be placed at the end
commentForMFa           single          string          comment for MFannot
toComment               single          int4            if startline need to be in comment in Masterfile
evalueCutoff            single          string          evalue cutoff for erpin
atCutoff                single          int4            at content cutoff for erpin
