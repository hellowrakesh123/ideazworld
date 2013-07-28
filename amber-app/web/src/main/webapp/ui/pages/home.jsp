<!doctype html>
<html>
<head>
	<%@ include file="includes.html" %>
	<script>
		function showSearchResults(search_map) {
			postServiceResponse("books.search", jsonToString(search_map));	
		}
		
		function searchSuccessHandler(response) {
			var searchResultsElement = document.getElementById("book-search-results");
			searchResultsElement.innerHTML = "";
			for(var index=0;index<response.length;index++) {
				var obj = response[index];
				var searchElement = document.createElement("li");
				var linkElement = document.createElement("a");
				linkElement.title = obj.name;
				linkElement.href = "#";
				linkElement.innerHTML = obj.name + " &nbsp;&nbsp;<span>(" + obj['item-condition'] + ")</span>";
				searchElement.appendChild(linkElement);
				searchResultsElement.appendChild(searchElement);
			}
		}
		
		function init() {
			initUserLocationPreference();
			var value = decodeURIComponent(window.location.search.substring(1));
			value = value.trim();
			if(value == "" || !isValidJson(value)) {
				return;
			}
			var search_map = stringToJson(value);
			showSearchResults(search_map);
		}
	</script>
</head>
<body onLoad="init()">
	<%@ include file="user_preference_dialog.html" %>
	<div id="container" class="clearfix">
		<%@ include file="header.html" %>
		<div id="maincont" class="clearfix">
			<div class="ic"></div>
			<div id="mainleft" style="width: 370px">
				<h3>Nullam blandit</h3>
				<div>Vivamus mi arcu, lacinia scelerisque blandit nec, mattis non
					nibh.</div>
				<div style="height: 500px; overflow-x: hidden; overflow-y: scroll;">
					<ul id="book-search-results" class="sidemenu">
						<!-- <li><a title="" href="#">SIDE LINK 1 &nbsp;&nbsp;<span>(used)</span></a></li>
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
						<li><a title="" href="#">SIDE LINK 5 &nbsp;&nbsp;<span>(new)</span></a></li> -->
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