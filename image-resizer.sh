#Image resizer by mwaidyanatha
#Does not work with file names containing spaces, parentheses
#change the imagesize, outfile_prefix and filters in the parameters section as required

if [ $# -lt 2 ] ; then
	echo "Usage: ./script input_folder output_folder"
	exit 1
fi

##Get args##
input_folder=$1
output_folder=$2

##Parameters##
imagesize='1024x768'
outfile_prefix='1'
filter='JPG$|jpg$|jpeg$|png$'

val=`ls -b $1 | egrep $filter`

for FILE in $val
do
	input="$input_folder/$FILE"
	output="$output_folder/$outfile_prefix$FILE"
	`convert -resize $imagesize $input $output`
done
