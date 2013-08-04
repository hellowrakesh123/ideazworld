<!doctype html>
<html>
<head>
	<%@ include file="includes.html" %>
	<script>
		function createBookPost() {
			var request_map = {};
			var validationErrors = new Array();
			var bookName = document.getElementById("name").value;
			var description = document.getElementById("description").value;
			var language = document.getElementById("language").value;
			var categoryInfo = document.getElementById("category").value;
			var expectedPrice = document.getElementById("expected-price").value;
			var marketPrice = document.getElementById("market-price").value;
			var itemCondition = document.getElementById("item-condition").value;
			var localityInfo = document.getElementById("locality").value;
			var address = document.getElementById("address").value;
			if(bookName == "" || bookName.length < 5) {
				validationErrors.push("Please provide the name of the book (atleast 5 characters).");
			}
			if(description == "" || description.length < 25) {
				validationErrors.push("Please write a description for the book (atleast 25 characters).");
			}
			if(language == "") {
				validationErrors.push("Choose the language");
			}
			if(categoryInfo == "") {
				validationErrors.push("Choose the subject");
			}
			if(expectedPrice == "") {
				validationErrors.push("Please provide the price you are expecting");
			} else if(isNaN(expectedPrice) || expectedPrice < 0) {
				validationErrors.push("Please provide a valid expected price");
			}
			if(marketPrice != "" && (isNaN(marketPrice) || marketPrice < 0)) {
				validationErrors.push("Please provide a valid market price");
			}
			if(itemCondition == "") {
				validationErrors.push("Choose the condition of the book");
			}
			if(localityInfo == "") {
				validationErrors.push("Choose nearby locality where the book can be collected");
			}
			if(validationErrors.length > 0) {
				showMessage("warning", validationErrors);
				return;
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
		
		function showMessage(type, message_list) {
			var messageDiv=document.getElementById("messageDiv");
			var messages = "";
			for(var index=0;index<message_list.length;index++) {
				if(messages == "") {
					messages = message_list[index];
				} else {
					messages = messages + "<br>" + message_list[index];
				}
			}
			messageDiv.innerHTML=messages;
			messageDiv.className=type;
			messageDiv.style.display="block";
		}
		
		function saveSuccessHandler(response) {
			showMessage("info", ["Successfully posted your book details."]);
			document.getElementById("book-form").innerHTML = "";
		}
		
		function saveFailureHandler(response, status, message) {
			showMessage("error", [message]);
		}
		
		function resetForm() {
			var messageDiv=document.getElementById("messageDiv");
			messageDiv.innerHTML = "";
			messageDiv.style.display="none";
		}
		
		function init() {
			var category = document.getElementById("category");
			buildCategoryElement(category);
			
			var condition = document.getElementById("item-condition");
			buildConditionElement(condition);
			
			var locality = document.getElementById("locality");
			buildLocalityElement(locality);
			
			var language = document.getElementById("language");
			buildLanguagesElement(language);
			
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
			<div id="messageDiv" style="display: none"></div>
			<form id="book-form" method="post" action="#" class="hongkiat-form">
				<div class="wrapping clearfix">
					<section>
						<select id="category" data-placeholder="Category" style="width: 200px;" class="chzn-select" tabindex="1">
							<option value=""></option>
						</select>
						<select id="language" data-placeholder="Language" style="width: 160px;" class="chzn-select" tabindex="2">
							<option></option>
						</select>
						<select id="item-condition" data-placeholder="Status" style="width: 160px;" class="chzn-select" tabindex="3">
							<option></option>
						</select>
						<br><br>
						<input type="text" id=name placeholder="Name of book" autocomplete="off" tabindex="4" class="txtinput" style="width: 300px;" />
						<input type="text" id="expected-price" placeholder="Expected Price (INR)" autocomplete="off" tabindex="5" class="txtinput" style="width: 110px;" />
						<input type="text" id="market-price" placeholder="Market Price (INR)" autocomplete="off" tabindex="6" class="txtinput" style="width: 110px;" />
						<br>	
						<textarea name="description" id="description" placeholder="Tell your potential buyers more about the book..." tabindex="7" class="txtarea" style="width: 400px; height: 100px"></textarea>
						<br>
						<div style="display: inline; border: 1px;">
						<select id="locality" data-placeholder="Locality" style="width: 350px;" class="chzn-select" tabindex="8">
							<option value=""></option>
						</select>
						<textarea name="address" id="address" placeholder="Where can the book be picked from" tabindex="9" class="txtarea" style="width: 200px;height: 50px"></textarea>
						<input id="share-contact-number" type="checkbox" tabindex="10">Share Contact Number
						<input id="share-email" type="checkbox" tabindex="11">Share Email
						</div>
						<br><br>
						<br>
						<input type="text" name="tags" id="tags" placeholder="Tags (comma separated values)" autocomplete="off" tabindex="12" class="txtinput" style="width: 200px;" />
					</section>
					<section id="buttons">
						<input type="reset" name="reset" id="resetbtn" onClick="resetForm()" class="resetbtn"
							value="Reset" /> <input type="button" name="submit" id="submitbtn"
							class="submitbtn" tabindex="7" value="Submit this!" onClick="createBookPost()" /> <br
							style="clear: both;" />
					</section>
				</div>
			</form>
		</div>
	</div>
	<%@ include file="footer.html"%>
</body>
</html>