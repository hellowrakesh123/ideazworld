<!doctype html>
<html>
<head>
	<%@ include file="../pages/includes.html" %>
	<script>
		var localeJson = {};
		function findAllStates() {
			var responseJson = getServiceResponse('types', "/external-api/state/value");
			for(var index=0;index<responseJson.length;index++){
				var obj = responseJson[index];
				obj['cities'] = findAllCities(obj.ID);
				for(var idx=0;idx<obj['cities'].length;idx++){
					var city = obj['cities'][idx];
					var locales = findAllLocales(city.city);
					city['locals'] = locales;
				}
			}
			postServiceResponse('types', "/save-file/india.json", jsonToString(responseJson));
		}
	
		function findAllCities(stateId) {
			var responseJson = getServiceResponse('types', "/external-api/city/" + stateId);
			return responseJson;
		}
	
		function findAllLocales(city) {
			var responseJson = getServiceResponse('types', "/external-api/local/" + city);
			return responseJson;
		}
		
		function init() {
			findAllStates();
		}
	</script>
</head>
<body onLoad="init()">
</body>
</html>