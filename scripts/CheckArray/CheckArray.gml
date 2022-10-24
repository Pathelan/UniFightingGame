function CheckArray(array, value){
	
	// Get Variables
	array = argument0;	// Array that will be checked
	value = argument1;	// Value that will be checked
	
	// Get Length of Array
	var l = array_length(array);
	
	for (var i=0; i<l; i++) {	// Run through all values in array
		if (i == value) {
			return array[i];	// Return the value of the Array if it matches value
		}
	}
}