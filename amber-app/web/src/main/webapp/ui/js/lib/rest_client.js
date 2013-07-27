function getUrlApi(path) {
	xmlhttp = new XMLHttpRequest();
	xmlhttp.open("GET", path, false);
	xmlhttp.send(null);
	return xmlhttp.responseText;
}

function postUrlApi(url, data) {
	$.ajax({
	  type: "POST",
	  url: url,
	  data: data,
	  dataType: "json",
	  contentType: "application/json"
	});
}

function getServiceResponse(serviceId, data) {
	data = typeof data != 'undefined' ? data : "";
	var services_map = getServicesMap();
	var serviceIdArray = serviceId.split(".");
	var service = serviceIdArray[0];
	var api = serviceIdArray[1];
	var servicePath = services_map[service].path + services_map[service].apis[api].path;
	var responseText = getUrlApi(SERVICE_BASE_URL + servicePath + data);
	var responseJson = null;
	if(responseText != "") {
		responseJson = stringToJson(responseText);
	}
	return responseJson;
}

function postServiceResponse(serviceId, data) {
	var services_map = getServicesMap();
	var serviceIdArray = serviceId.split(".");
	var service = serviceIdArray[0];
	var api = serviceIdArray[1];
	var servicePath = services_map[service].path + services_map[service].apis[api].path;
	postUrlApi(SERVICE_BASE_URL + servicePath, data);
}

function getServicesMap() {
	var services_map = window.SERVICES_MAP;
	services_map = typeof services_map != 'undefined' ? services_map : null;
	if(services_map == null) {
		services_map = stringToJson(getUrlApi(BASE_URL + "/data/rest-api.json"));
		window.SERVICES_MAP = services_map;
	}
	return services_map;
}