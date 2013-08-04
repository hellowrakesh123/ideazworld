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
				linkElement.href = "javascript: showSelectedBook('" + obj['ref']['ref-id'] + "')";
				linkElement.innerHTML = obj.name + " &nbsp;&nbsp;<span>(" + obj['item-condition'] + ")</span>";
				searchElement.appendChild(linkElement);
				searchResultsElement.appendChild(searchElement);
				document.getElementById("mainleft").style.display = "block";
			}
		}
		
		function showSelectedBook(ref) {
			var bookObj = getServiceResponse('books.ref', "/" + ref);
			var mainContentDiv = document.getElementById("mainright");
			mainContentDiv.innerHTML = "";
			var bookDetailsDiv = document.createElement("div");
			bookDetailsDiv.id = "book-details-div";
			var wrapperDiv = document.createElement("div");
			wrapperDiv.className = "wrapper";
			var bookSummaryHTML = "<h3><a href=#>" + bookObj['name'] + "</a></h3>";
			bookSummaryHTML = bookSummaryHTML + "<h4>Price: INR " + bookObj['expected-price'] + "</h4>";
			bookSummaryHTML = bookSummaryHTML + "<p>";
			bookSummaryHTML = bookSummaryHTML + "Subject: <strong>" + bookObj['category'] + " | " + bookObj['sub-category'] + "</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
			bookSummaryHTML = bookSummaryHTML + "Language: <strong>" + bookObj['language'] + "</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
			bookSummaryHTML = bookSummaryHTML + "</p>";
			wrapperDiv.innerHTML = bookSummaryHTML;
			bookDetailsDiv.appendChild(wrapperDiv);
			var blockquote = document.createElement("blockquote");
			blockquote.innerHTML = bookObj['description'];
			bookDetailsDiv.appendChild(blockquote);
			var sendMessageDiv = document.createElement("div");
			sendMessageDiv.id = "send-message-div";
			var textElement = document.createElement("span");
			textElement.setAttribute("style", "color: #777; font-size: 12px;");
			textElement.innerHTML = "Contact the seller";
			sendMessageDiv.appendChild(textElement);
			var figureElement = document.createElement("figure");
			figureElement.setAttribute("style", "float: right; margin-right: -2%; margin-top: -2.5%;");
			figureElement.innerHTML = "<a href='#'><img src='../images/button.png' /></a>";
			sendMessageDiv.appendChild(figureElement);
			bookDetailsDiv.appendChild(sendMessageDiv);
			mainContentDiv.appendChild(bookDetailsDiv);
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
			<div id="mainleft" style="width: 370px;display: none">
				<h3>Book search results</h3>
				<div style="height: 500px; overflow-x: hidden; overflow-y: scroll;">
					<ul id="book-search-results" class="sidemenu">
					</ul>
				</div>
			</div>
			<div id="mainright">
			</div>
		</div>
	</div>
	<%@ include file="footer.html" %>
</body>
</html>