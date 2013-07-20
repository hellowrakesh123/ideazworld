<%@ include file="header.html"%>
<div id="maincont" class="clearfix">
	<div class="ic"></div>
	<h2>Your Book</h2>
	<form method="post" action="#" class="hongkiat-form">
		<div class="wrapping clearfix">
			<section class="aligned">
				<select data-placeholder="Category" style="width: 200px;" class="chzn-select">
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
				<input type="text" name="book_name" id="book_name" placeholder="Name of book" autocomplete="off" tabindex="2" class="txtinput" style="width: 300px;" />
				<textarea name="description" id="description" placeholder="Tell your potential buyers more about the book..." tabindex="6" class="txtarea" class="width: 200px;"></textarea>
				<select data-placeholder="Language" style="width: 160px;"
					class="chzn-select" tabindex="8">
					<option></option>
					<option>Hindi</option>
					<option>English</option>
					<option>Chinese</option>
				</select>
				<select data-placeholder="Status" style="width: 160px;"
					class="chzn-select" tabindex="8">
					<option></option>
					<option>New</option>
					<option>Like New</option>
					<option>Used</option>
				</select>
				<input type="text" name="expected_price" id="expected_price" placeholder="Expected Price (INR)" autocomplete="off" tabindex="3" class="txtinput" style="width: 110px;" />
				<input type="text" name="market_price" id="market_price" placeholder="Market Price (INR)" autocomplete="off" tabindex="3" class="txtinput" style="width: 110px;" />
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
				<textarea name="address" id="address" placeholder="Where can the book be picked from" tabindex="6" class="txtarea" style="width: 200px;height: 50px"></textarea>
				<input type="checkbox">Share Contact Details
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
<script type="text/javascript">
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
</script>
<%@ include file="footer.html"%>