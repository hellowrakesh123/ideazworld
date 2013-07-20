<%@ include file="header.html" %>
<link rel="stylesheet" type="text/css" media="screen" href="../css/hongkiat-form.css" />
<div id="maincont" class="clearfix">
	<div class="ic"></div>
	<h2>Your Book</h2>
		<form name="hongkiat" id="hongkiat-form" method="post" action="#">
			<div id="wrapping" class="clearfix">
				<section id="aligned">
					<input type="text" name="name" id="name" placeholder="Your name"
						autocomplete="off" tabindex="1" class="txtinput" /> <input
						type="email" name="email" id="email"
						placeholder="Your e-mail address" autocomplete="off" tabindex="2"
						class="txtinput" /> <input type="url" name="website" id="website"
						placeholder="Website URL" autocomplete="off" tabindex="3"
						class="txtinput" /> <input type="tel" name="telephone"
						id="telephone" placeholder="Phone number?(optional)" tabindex="4"
						class="txtinput" />
					<textarea name="message" id="message"
						placeholder="Enter a cool message..." tabindex="5"
						class="txtblock"></textarea>
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
<%@ include file="footer.html" %>