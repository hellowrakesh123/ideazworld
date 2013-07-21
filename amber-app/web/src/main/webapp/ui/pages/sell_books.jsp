<!doctype html>
<html>
<head>
	<%@ include file="includes.html" %>
	<script>
		function initStatus() {
			var responseJson = getServiceResponse('types', "/item-status");
			var status = document.getElementById("status");
			for(var index=0;index<responseJson.length;index++){
				var obj = responseJson[index];
				status.appendChild(new Option(obj, obj, "", false));
			}
		}
	
		function initLanguages() {
			var languages = stringToJson(getUrlApi(base_url + "/data/books/language.json"));
			var language = document.getElementById("language");
			for(var index=0;index<languages.length;index++){
				language.appendChild(new Option(languages[index], languages[index], "", false));
			}
		}
	
		function initCategory() {
			var responseJson = getServiceResponse('metadata', "/type/category");
			var category = document.getElementById("category");
			for(var index=0;index<responseJson.length;index++){
				var obj = responseJson[index];
				var optGroup = document.createElement("optgroup");
				optGroup.label = obj.name;
				for(var i=0;i<obj.children.length;i++){
					var val = obj.children[i];
					optGroup.appendChild(new Option(val.name, val.id, "", false));
				}
				category.appendChild(optGroup);
			}
		}
		
		function init() {
			initStatus();
			initLanguages();
			initCategory();
			initChzn();
		}
		
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
			}
			for ( var selector in config) {
				$(selector).chosen(config[selector]);
			}
		}
	</script>
</head>
<body onLoad="init()">
	<div id="container" class="clearfix">
		<%@ include file="header.html" %>
		<div id="maincont" class="clearfix">
			<div class="ic"></div>
			<h2>Your Book</h2>
			<form method="post" action="#" class="hongkiat-form">
				<div class="wrapping clearfix">
					<section>
						<select id="category" data-placeholder="Category" style="width: 200px;" class="chzn-select">
							<option value=""></option>
						</select>
						<select id="language" data-placeholder="Language" style="width: 160px;"
							class="chzn-select" tabindex="8">
							<option></option>
						</select>
						<select id="status" data-placeholder="Status" style="width: 160px;"
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
						<br>
						<select data-placeholder="City" style="width: 200px;" class="chzn-select">
							<option value=""></option>
							<optgroup label="NFC EAST">
								<option>Dallas Cowboys</option>
								<option>New York Giants</option>
								<option>Philadelphia Eagles</option>
								<option>Washington Redskins</option>
							</optgroup>
							<optgroup label="NFC NORTH">
								<option>Chicago Bears</option>
								<option>Detroit Lions</option>
								<option>Green Bay Packers</option>
								<option>Minnesota Vikings</option>
							</optgroup>
							<optgroup label="NFC SOUTH">
								<option>Atlanta Falcons</option>
								<option>Carolina Panthers</option>
								<option>New Orleans Saints</option>
								<option>Tampa Bay Buccaneers</option>
							</optgroup>
						</select>
						<select data-placeholder="Landmark" style="width: 350px;" class="chzn-select" tabindex="8">
							<option></option>
							<option>New</option>
							<option>Like New</option>
							<option>Used</option>
						</select>
						<input type="checkbox">Share Contact Number
						<input type="checkbox">Share Email
						<br><br>
						<textarea name="address" id="address" placeholder="Where can the book be picked from" tabindex="6" class="txtarea" style="width: 200px;height: 50px"></textarea>
						<br>
						<input type="text" name="tags" id="tags" placeholder="Tags (comma separated values)" autocomplete="off" tabindex="2" class="txtinput" style="width: 200px;" />
					</section>
				</div>
				<section id="buttons">
					<input type="reset" name="reset" id="resetbtn" class="resetbtn"
						value="Reset" /> <input type="submit" name="submit" id="submitbtn"
						class="submitbtn" tabindex="7" value="Submit this!" /> <br
						style="clear: both;" />
				</section>
			</form>
		</div>
	</div>
	<%@ include file="footer.html"%>
</body>
</html>