<!doctype html>
<html>
<head>
	<%@ include file="includes.html" %>
	<script>
		var states_map = {};
		
		function initCountryStates() {
			var states_map = getStatesMap();
			var cityElement = document.getElementById("city");
			for (var state in states_map){
				var cities = states_map[state];
				var optGroup = document.createElement("optgroup");
				optGroup.label = state;
				for(var i=0;i<cities['cities'].length;i++){
					var city = cities['cities'][i];
					var id = state + "," + city['city'];
					optGroup.appendChild(new Option(city['city'], id, "", false));
				}
				cityElement.appendChild(optGroup);
			}
			initChzn();
		}
		
		function saveUserPreference() {
			var city = document.getElementById("city").value;
			setCookie(USER_PREFERRED_LOCATION, city);
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
		
		function showUserPreferenceDialog() {
			var user_saved_location = getCookie(USER_PREFERRED_LOCATION);
			user_saved_location = typeof user_saved_location != 'undefined' ? user_saved_location : null;
			if(user_saved_location == null) {
				$('#modal').reveal({ // The item which will be opened with reveal
				  	animation: 'fade',                   // fade, fadeAndPop, none
					animationspeed: 600,                       // how fast animtions are
					closeonbackgroundclick: false,              // if you click background will modal close?
					dismissmodalclass: 'close'    // the class of a button or element that will close an open modal
				});
				return true;
			}
			return false;
		}
		
		function init() {
			getStatesMap();
			var display = showUserPreferenceDialog();
			if(display) {
				initCountryStates();
			}
		}
	</script>
</head>
<body onLoad="init()">
	<div id="modal">
		<div id="modal-heading">
			Choose your City
		</div>
		<div id="modal-content">
			<p>Please select the city where you want to localize the search, this will be saved as the preferred location and next time you login, we will already know.</p>
			<div>
				<select id="city" data-placeholder="City" style="width: 200px;" class="chzn-select" onChange="saveUserPreference()">
					<option value=""></option>
				</select>
				<div id="buttons" style="display: inline">
					<input type="submit" name="submit" id="submitbtn" class="submitbtn close" style="float: none; height: 25px; display: inline" value="Select" />
				</div>
			</div>
		</div>
	</div>
	<div id="container" class="clearfix">
		<%@ include file="header.html" %>
		<div id="maincont" class="clearfix">
			<div class="ic"></div>
			<div id="mainleft" style="width: 370px">
				<h3>Nullam blandit</h3>
				<p>Vivamus mi arcu, lacinia scelerisque blandit nec, mattis non
					nibh.</p>
				<div style="height: 500px; overflow-x: hidden; overflow-y: scroll;">
					<ul class="sidemenu">
						<li><a title="" href="#">SIDE LINK 1 &nbsp;&nbsp;<span>(used)</span></a></li>
						<li><a title="" href="#">SIDE LINK 2 &nbsp;&nbsp;<span>(new)</span></a></li>
						<li><a title="" href="#">SIDE LINK 3 &nbsp;&nbsp;<span>(used)</span></a></li>
						<li><a title="" href="#">SIDE LINK 4 &nbsp;&nbsp;<span>(new)</span></a></li>
						<li><a title="" href="#">SIDE LINK 5 &nbsp;&nbsp;<span>(new)</span></a></li>
						<li><a title="" href="#">SIDE LINK 1 &nbsp;&nbsp;<span>(used)</span></a></li>
						<li><a title="" href="#">SIDE LINK 2 &nbsp;&nbsp;<span>(new)</span></a></li>
						<li><a title="" href="#">SIDE LINK 3 &nbsp;&nbsp;<span>(used)</span></a></li>
						<li><a title="" href="#">SIDE LINK 4 &nbsp;&nbsp;<span>(used)</span></a></li>
						<li><a title="" href="#">SIDE LINK 5 &nbsp;&nbsp;<span>(new)</span></a></li>
						<li><a title="" href="#">SIDE LINK 1 &nbsp;&nbsp;<span>(used)</span></a></li>
						<li><a title="" href="#">SIDE LINK 2 &nbsp;&nbsp;<span>(used)</span></a></li>
						<li><a title="" href="#">SIDE LINK 3 &nbsp;&nbsp;<span>(new)</span></a></li>
						<li><a title="" href="#">SIDE LINK 4 &nbsp;&nbsp;<span>(used)</span></a></li>
						<li><a title="" href="#">SIDE LINK 5 &nbsp;&nbsp;<span>(new)</span></a></li>
					</ul>
				</div>
			</div>
			<div id="mainright">
				<div id="page_comingSoon">
					<div class="wrapper">
						<h3>
							<a href="#">Book Title</a>
						</h3>
						<h4>Price: 200rs.</h4>
						<p>
							Author Name: <strong>xyz</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							Edition: <strong>2012</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							Condition: <strong>New</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							Place: <strong>Delhi</strong>
						</p>
					</div>
				</div>
				<blockquote>
					Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus mi
					arcu, lacinia scelerisque blandit nec, mattis non nibh. Curabitur
					quis urna at massa placerat auctor. Quisque et mauris sapien, a
					consectetur nulla. Cum sociis natoque penatibus et magnis dis
					parturient montes, nascetur ridiculus mus. Nullam pellentesque,<br><br>
							Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus mi
							arcu, lacinia scelerisque blandit nec, mattis non nibh. Curabitur
							quis urna at massa placerat auctor.<br><br>
				</blockquote>
				<p>
					<span style="color: #777; font-size: 12px;">Interested person
						please contact by message</span>
					<figure style="float: right; margin-right: -2%; margin-top: -6.5%;">
						<a href="#"><img src="../images/button.png" /></a>
					</figure>
				</p>
			</div>
		</div>
	</div>
	<%@ include file="footer.html" %>
</body>
</html>