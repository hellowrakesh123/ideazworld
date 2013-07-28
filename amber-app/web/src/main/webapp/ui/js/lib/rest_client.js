function getUrlApi(path) {
	xmlhttp = new XMLHttpRequest();
	xmlhttp.open("GET", path, false);
	xmlhttp.send(null);
	return xmlhttp.responseText;
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
	$.ajax({
		  type: "POST",
		  url: SERVICE_BASE_URL + servicePath,
		  data: data,
		  dataType: "json",
		  contentType: "application/json"
		})
		.done(function(data) {
			var method = api+"SuccessHandler(data);";
			try {
				eval(method);
		    } catch (e) {
		        //ignore the error
		    }
		})
		.fail(function(xhr, status, error) {
			var method = api+"FailureHandler(data);";
			try {
				eval(method);
		    } catch (e) {
		        //ignore the error
		    }
		});
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