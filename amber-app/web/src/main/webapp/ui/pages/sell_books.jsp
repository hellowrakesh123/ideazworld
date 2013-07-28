<!doctype html>
<html>
<head>
	<%@ include file="includes.html" %>
	<script>
		function createBookPost() {
			var request_map = {};
			var bookName = document.getElementById("book_name").value;
			request_map['name'] = bookName;
			var language = document.getElementById("language").value;
			request_map['language'] = language;
			var description = document.getElementById("description").value;
			request_map['description'] = description;
			var categoryInfo = document.getElementById("category_info").value;
			var categoryArray = categoryInfo.split(",");
			request_map['category'] = categoryArray[0];
			request_map['sub-category'] = categoryArray[1];
			var expectedPrice = document.getElementById("expected_price").value;
			request_map['expected-price'] = expectedPrice;
			var marketPrice = document.getElementById("market_price").value;
			request_map['market-price'] = marketPrice;
			var itemCondition = document.getElementById("condition").value;
			request_map['item-condition'] = itemCondition;
			var location_map = {};
			var user_saved_location = getCookie(USER_PREFERRED_LOCATION);
			user_saved_location = typeof user_saved_location != 'undefined' ? user_saved_location : null;
			if(user_saved_location == null) {
				return;
			}
			var cityCodeArray = user_saved_location.split(",");
			var state = cityCodeArray[0];
			location_map['state'] = state;
			var city = cityCodeArray[1];
			location_map['city'] = city;
			var localityInfo = document.getElementById("locality").value;
			var localityArray = localityInfo.split(",");
			var locality = localityArray[0];
			location_map['locality'] = locality;
			var zip = localityArray[1];
			location_map['zip-code'] = zip;
			var address = document.getElementById("address").value;
			location_map['address'] = address;
			var country = "INDIA";
			location_map['country'] = country;
			request_map['location'] = location_map;
			postServiceResponse("books.save", jsonToString(request_map));
		}
		
		function init() {
			var category = document.getElementById("category_info");
			buildCategoryElement(category);
			
			var condition = document.getElementById("condition");
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
			<form id="book-form" method="post" action="#" class="hongkiat-form">
				<div class="wrapping clearfix">
					<section>
						<select id="category_info" data-placeholder="Category" style="width: 200px;" class="chzn-select">
							<option value=""></option>
						</select>
						<select id="language" data-placeholder="Language" style="width: 160px;"
							class="chzn-select" tabindex="8">
							<option></option>
						</select>
						<select id="condition" data-placeholder="Status" style="width: 160px;"
							class="chzn-select" tabindex="8">
							<option></option>
						</select>
						<br><br>
						<input type="text" name="book_name" id="book_name" placeholder="Name of book" autocomplete="off" tabindex="2" class="txtinput" style="width: 300px;" />
						<input type="text" name="expected_price" id="expected_price" placeholder="Expected Price (INR)" autocomplete="off" tabindex="3" class="txtinput" style="width: 110px;" />
						<input type="text" name="market_price" id="market_price" placeholder="Market Price (INR)" autocomplete="off" tabindex="3" class="txtinput" style="width: 110px;" />
						<br>	
						<textarea name="description" id="description" placeholder="Tell your potential buyers more about the book..." tabindex="6" class="txtarea" style="width: 400px; height: 100px"></textarea>
						<br>
						<div style="display: inline; border: 1px;">
						<select id="locality" data-placeholder="Locality" style="width: 350px;" class="chzn-select" tabindex="8">
							<option value=""></option>
						</select>
						<textarea name="address" id="address" placeholder="Where can the book be picked from" tabindex="6" class="txtarea" style="width: 200px;height: 50px"></textarea>
						<input type="checkbox">Share Contact Number
						<input type="checkbox">Share Email
						</div>
						<br><br>
						<br>
						<input type="text" name="tags" id="tags" placeholder="Tags (comma separated values)" autocomplete="off" tabindex="2" class="txtinput" style="width: 200px;" />
					</section>
				</div>
			</form>
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