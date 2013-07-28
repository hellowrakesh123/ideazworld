function initChzn() {
	var config = {
		'.chzn-select' : {},
		'.chzn-select-deselect' : {
			allow_single_deselect : true
		},
		'.chzn-select-no-single' : {
			disable_search_threshold : 10
		},
		'.chzn-select-no-results' : {
			no_results_text : 'Oops, nothing found!'
		},
		'.chzn-select-width' : {
			width : "95%"
		}
	};
	for ( var selector in config) {
		$(selector).chosen(config[selector]);
	}
}

function getStatesMap(refresh) {
	var states_map = window.STATES_MAP;
	states_map = typeof states_map != 'undefined' ? states_map : null;
	if(states_map == null || refresh) {
		states_map = {};
		var states = stringToJson(getUrlApi(BASE_URL + "/data/locales/country/india/all_states.json"));
		for(var index=0;index<states.length;index++){
			var state = states[index]['Name'];
			state = state.trim();
			state = state.replace(/\s/g, '_');
			state = state.replace(/\*/g, '');
			var cities = stringToJson(getUrlApi(BASE_URL + "/data/locales/country/india/" + state + ".json"));
			states_map[state] = cities;
		}
		window.STATES_MAP = states_map;
	}
	return states_map;
}

function buildCountryStatesElement(element) {
	var states_map = getStatesMap();
	for (var state in states_map){
		var cities = states_map[state];
		var optGroup = document.createElement("optgroup");
		optGroup.label = state;
		for(var i=0;i<cities['cities'].length;i++){
			var city = cities['cities'][i];
			var id = state + "," + city['city'];
			optGroup.appendChild(new Option(city['city'], id, "", false));
		}
		element.appendChild(optGroup);
	}
}

function buildLocalityElement(element) {
	var user_saved_location = getCookie(USER_PREFERRED_LOCATION);
	user_saved_location = typeof user_saved_location != 'undefined' ? user_saved_location : null;
	if(user_saved_location == null) {
		return;
	}
	var states_map = getStatesMap();
	var cityCodeArray = user_saved_location.split(",");
	var state = cityCodeArray[0];
	var city = cityCodeArray[1];
	var cities = states_map[state]['cities'];
	for(var i=0;i<cities.length;i++){
		var cityObj = cities[i];
		if(cityObj['city'] == city) {
			var localityList = cityObj['localities'];
			if(localityList.length < 1) {
				var cityName = city + " (Pincode - 000000)";
				element.appendChild(new Option(cityName, cityName, "", false));
			} else {
				for(var i=0;i<localityList.length;i++){
					var locality = localityList[i];
					var localityName = locality['Locality'] + " (Pincode - " + locality['Zipcode'] + ")";
					element.appendChild(new Option(localityName, locality['Locality'] + "," + locality['Zipcode'], "", false));
				}	
			}
			break;
		}
	}
}

function buildCategoryElement(element) {
	var responseJson = getServiceResponse('metadata.category');
	for(var index=0;index<responseJson.length;index++){
		var obj = responseJson[index];
		var optGroup = document.createElement("optgroup");
		optGroup.label = obj.name;
		for(var i=0;i<obj.children.length;i++){
			var val = obj.children[i];
			optGroup.appendChild(new Option(val.name, obj.name + "," + val.id, "", false));
		}
		element.appendChild(optGroup);
	}
}

function buildLanguagesElement(element) {
	var languages = stringToJson(getUrlApi(BASE_URL + "/data/books/language.json"));
	for(var index=0;index<languages.length;index++){
		element.appendChild(new Option(languages[index], languages[index], "", false));
	}
}

function buildConditionElement(element) {
	var responseJson = getServiceResponse('types.item-condition');
	for(var index=0;index<responseJson.length;index++){
		var obj = responseJson[index];
		element.appendChild(new Option(obj, obj, "", false));
	}
}