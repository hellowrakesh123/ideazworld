function cloneJson(originalJson) {
	return stringToJson(jsonToString(originalJson));
}

function stringToJson(stringJson) {
	return JSON.parse(stringJson);
}

function jsonToString(json) {
	return JSON.stringify(json, null, 4);
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

function getStatesMap(refresh) {
	var states_map = window.STATES_MAP;
	states_map = typeof states_map != 'undefined' ? states_map : null;
	if(states_map == null || refresh) {
		states_map = {};
		var states = stringToJson(getUrlApi(base_url + "/data/locales/country/india/all_states.json"));
		for(var index=0;index<states.length;index++){
			var state = states[index]['Name'];
			state = state.trim();
			state = state.replace(/\s/g, '_');
			state = state.replace(/\*/g, '');
			var cities = stringToJson(getUrlApi(base_url + "/data/locales/country/india/" + state + ".json"));
			states_map[state] = cities;
		}
		window.STATES_MAP = states_map;
	}
	return states_map;
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