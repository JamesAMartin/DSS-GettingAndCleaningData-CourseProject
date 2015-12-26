################################################################################
###
###		GetFeatureLabels
###
###		This funciton loads the descriptive column names for features.  Since
###		the desctiptive names hold characters that are invalid for using
###		as column names, the function 'cleanses' the descriptions before
###		returning the data.

GetFeatureLabels <- function( filePath, colNames )
{
	###	Load the feature descriptive names and column numbers
	lbls <- read.table( filePath, col.names =  c("FeatureColumn", "FeatureName"), stringsAsFactors = FALSE )
	
	###	Cleanse the descriptive names until they can be uses as column names
	for( i in 1:nrow(lbls) )
	{
		##	Strip the invalid characters out of the feature name
		lbls[i,]$FeatureName <- as.character( gsub( "\\(", "-", lbls[i,]$FeatureName ) )
		lbls[i,]$FeatureName <- as.character( gsub( "\\)", "-", lbls[i,]$FeatureName ) )
		lbls[i,]$FeatureName <- as.character( gsub( ",", "-", lbls[i,]$FeatureName ) )
		lbls[i,]$FeatureName <- as.character( gsub( "-+", "-", lbls[i,]$FeatureName ) )
		lbls[i,]$FeatureName <- as.character( gsub( "-$", "", lbls[i,]$FeatureName ) )
	}

	###	Rename the column names to the passed in values
	names( lbls ) <- colNames
	
	###	Return the cleansed labels
	return( lbls )
}