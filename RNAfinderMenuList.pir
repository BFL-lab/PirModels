
#
# This class contain hash of Item List for each RNA model
#

- PerlClass	PirObject::RNAfinderMenuList
- InheritsFrom	PirObject
- FieldsTable

# Field name    		Sing/Array/Hash	Type		       Comments
#---------------------- ---------------	---------------	   -----------------------
name                    single          string             Name of model
Comment                 single          string             Comment for model
Order                   single          int4               In order to sort RNA for output
OriName                 single          string             Name of block in Menufile
ToFus                   array           string             For example "0,1,tRNA" means that item 0 and 1 are joined and named tRNA for make more than 1 fusion put ";" between instruction "0,1,tRNA;2,3,tRNA2"
ModulList               hash            string             Modul list for each RNA
Set                     hash            <RNAfinderItemSet> List of item block for each RNA

