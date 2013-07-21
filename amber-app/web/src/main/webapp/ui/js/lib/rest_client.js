//define root url
var base_url = "/amber";
var service_base_url = base_url + "/rest-api";
var services_list = stringToJson(getUrlApi(base_url + "/data/rest-api.json"));

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
	var responseText = getUrlApi(service_base_url + services_list[serviceId].path + data);
	var responseJson = null;
	if(responseText != "") {
		responseJson = stringToJson(responseText);
	}
	return responseJson;
}

function postServiceResponse(serviceId, url, data) {
	postUrlApi(service_base_url + services_list[serviceId].path + url, data);
}