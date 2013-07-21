function cloneJson(originalJson) {
	return stringToJson(jsonToString(originalJson));
}

function stringToJson(stringJson) {
	return JSON.parse(stringJson);
}

function jsonToString(json) {
	return JSON.stringify(json);
}

function sortJson(jsonObject, field) {
	if(Object.keys(jsonObject).length === 0) {
		return jsonObject;
	}
	jsonObject.sort(function(a,b) {
		if(a[field] == b[field])
	        return 0;
	    if(a[field] < b[field])
	        return 1;
	    if(a[field] > b[field])
	        return -1;
	});
	return jsonObject;
}