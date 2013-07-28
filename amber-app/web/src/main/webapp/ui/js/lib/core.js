function cloneJson(originalJson) {
	return stringToJson(jsonToString(originalJson));
}

function stringToJson(stringJson) {
	return JSON.parse(stringJson);
}

function jsonToString(json, indent) {
	indent = typeof indent != 'undefined' ? indent : 4;
	var value = "";
	if(indent == 0) {
		value = JSON.stringify(json);
	} else {
		value = JSON.stringify(json, null, indent);
	}
	return value;
}

function isValidJson(value) {
    try {
        JSON.parse(value);
    } catch (e) {
        return false;
    }
    return true;
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

function setCookie(c_name, value) {
    var exdate = new Date();
    exdate.setDate(exdate.getDate() + COOKIE_DAYS_VALIDITY);
    var c_value = escape(value) + ((COOKIE_DAYS_VALIDITY == null) ? "" : "; expires=" + exdate.toUTCString());
    document.cookie = c_name + "=" + c_value;
}

function getCookie(c_name) {
    var i, x, y, ARRcookies = document.cookie.split(";");
    for (i = 0; i < ARRcookies.length; i++) {
        x = ARRcookies[i].substr(0, ARRcookies[i].indexOf("="));
        y = ARRcookies[i].substr(ARRcookies[i].indexOf("=") + 1);
        x = x.replace(/^\s+|\s+$/g, "");
        if (x == c_name) {
            return unescape(y);
        }
    }
}