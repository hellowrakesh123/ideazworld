<!doctype html>
<html>
<head>
	<%@ include file="includes.html" %>
	<script>
		function createBookPost() {
			var request_map = {};
			var validationErrors = new Array();
			var bookName = document.getElementById("book_name").value;
			var description = document.getElementById("description").value;
			var language = document.getElementById("language").value;
			var categoryInfo = document.getElementById("category_info").value;
			var expectedPrice = document.getElementById("expected_price").value;
			var marketPrice = document.getElementById("market_price").value;
			var itemCondition = document.getElementById("condition").value;
			var localityInfo = document.getElementById("locality").value;
			var address = document.getElementById("address").value;
			if(bookName == "") {
				var error = {};
				error['field']="Name";
				error['type']="text";
				validationErrors.push(error);
			}
			if(description == "") {
				var error = {};
				error['field']="Description";
				error['type']="text";
				validationErrors.push(error);
			}
			if(language == "") {
				var error = {};
				error['field']="Language";
				error['type']="select";
				validationErrors.push(error);
			}
			if(categoryInfo == "") {
				var error = {};
				error['field']="Category";
				error['type']="select";
				validationErrors.push(error);
			}
			if(expectedPrice == "") {
				var error = {};
				error['field']="Expected Price";
				error['type']="text";
				validationErrors.push(error);
			}
			if(itemCondition == "") {
				var error = {};
				error['field']="Condition";
				error['type']="select";
				validationErrors.push(error);
			}
			if(localityInfo == "") {
				var error = {};
				error['field']="Locality";
				error['type']="select";
				validationErrors.push(error);
			}
			if(address == "") {
				var error = {};
				error['field']="Address";
				error['type']="text";
				validationErrors.push(error);
			}
			request_map['name'] = bookName;
			request_map['language'] = language;
			request_map['description'] = description;
			var categoryArray = categoryInfo.split(",");
			request_map['category'] = categoryArray[0];
			request_map['sub-category'] = categoryArray[1];
			request_map['expected-price'] = expectedPrice;
			request_map['market-price'] = marketPrice;
			request_map['item-condition'] = itemCondition;
			var location_map = {};
			var user_saved_location = getCookie(USER_PREFERRED_LOCATION);
			user_saved_location = typeof user_saved_location != 'undefined' ? user_saved_location : null;
			if(user_saved_location == null) {
				showMessage("validation", "Please select location");
				return;
			}
			var cityCodeArray = user_saved_location.split(",");
			var state = cityCodeArray[0];
			location_map['state'] = state;
			var city = cityCodeArray[1];
			location_map['city'] = city;
			var localityArray = localityInfo.split(",");
			var locality = localityArray[0];
			location_map['locality'] = locality;
			var zip = localityArray[1];
			location_map['zip-code'] = zip;
			location_map['address'] = address;
			var country = "INDIA";
			location_map['country'] = country;
			request_map['location'] = location_map;
			postServiceResponse("books.save", jsonToString(request_map));
		}
		
		function showMessage(type, message) {
			var messageDiv=document.getElementById("messageDiv");
			messageDiv.innerHTML=message;
			messageDiv.className=type;
			messageDiv.style.display="block";
		}
		
		function saveSuccessHandler(response) {
			
		}
		
		function saveFailureHandler(response, status, message) {
			
		}
		
		function loadForm() {
			
		var form_json = stringToJson(getUrlApi(BASE_URL
					+ "/data/books/book-form.json"));
			var formElement = document.createElement("form");
			formElement.id = form_json['id'];
			formElement.name = form_json['name'];
			formElement.className = "hongkiat-form";
			var formDiv = document.getElementById("form-div");
			formDiv.appendChild(formElement);
			var sections = form_json.sections;
			for ( var sectionIndex = 0; sectionIndex < sections.length; sectionIndex++) {
				var section = sections[sectionIndex];
				var sectionElement = document.createElement("section");
				formElement.appendChild(sectionElement);
				var items = section.items;
				for ( var itemIndex = 0; itemIndex < items.length; itemIndex++) {
					var item = items[itemIndex];
					for ( var row in item) {
						var fields = item[row];
						for ( var fieldIndex = 0; fieldIndex < fields.length; fieldIndex++) {
							var field = fields[fieldIndex];
							var element;
							switch (field.type) {
								case "text": {
									element = document.createElement("input");
									element.type = field.type;
									element.id = field.id;
									sectionElement.appendChild(element);
									break;
								}
								case "select": {
									element = document.createElement(field.type);
									eval(field['builder-function'] + "(element)");
									element.id = field.id;
									element.appendChild(new Option("", "-1", "", true));
									sectionElement.appendChild(element);
									break;
								}
								case "textarea": {
									element = document.createElement(field.type);
									element.id = field.id;
									sectionElement.appendChild(element);
									break;
								}
								case "checkbox": {
									element = document.createElement("input");
									element.type = field.type;
									element.id = field.id;
									sectionElement.appendChild(element);
									element.parentNode.appendChild(document.createTextNode(field.title));
									break;
								}
							}
							var attributes = field.attributes;
							for ( var attribute in attributes) {
								element.setAttribute(attribute, attributes[attribute]);
							}
						}
						addNewLineElement(sectionElement, 2);
					}
				}
			}
		}

		function init() {
			loadForm();
			initChzn();
		}
	</script>
</head>
<body onLoad="init()">
	<div id="container" class="clearfix">
		<%@ include file="header.html" %>
		<div id="maincont" class="clearfix">
			<div class="ic"></div>
			<h2>Your Book</h2>
			<div id="form-div">
			</div>
			<section id="buttons">
				<input type="reset" name="reset" id="resetbtn" class="resetbtn"
					value="Reset" /> <input type="submit" name="submit" id="submitbtn"
					class="submitbtn" tabindex="7" value="Submit this!" onClick="createBookPost()" /> <br
					style="clear: both;" />
			</section>
		</div>
	</div>
	<%@ include file="footer.html"%>
</body>
</html>