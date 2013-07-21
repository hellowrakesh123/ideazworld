//define root url
var base_url = "/amber";
var service_base_url = base_url + "/rest-api";
var services_list = stringToJson(getUrlApi(base_url + "/data/rest-api.json"));

function getUrlApi(path) {
	xmlhttp = new XMLHttpRequest();
	xmlhttp.open("GET", path, false);
	xmlhttp.send(null);
	if(xmlhttp.status != 200 && xmlhttp.status != 204) {
		displayMessage('An error occurred while getting the data, please try again.', 'error');
	}
	return xmlhttp.responseText;
}

function getServiceResponse(serviceId, data) {
	data = typeof data != 'undefined' ? data : "";
	var responseText = getUrlApi(service_base_url + services_list[serviceId].path + data);
	var responseJson = null;
	if(responseText != "") {
		responseJson = stringToJson(responseText);
	}
	return responseJson;
}