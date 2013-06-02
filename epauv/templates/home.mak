<%inherit file="master.mak"/>
<div class="page">
	<!-- COLUMN 1 (Left)-->
	<div class="grid-33">
		<h2>What is this?</h2>
		<p>EPAUV leverages UV intensity data provided by the
			Environmental Protection Agency.</p>
		<p>It was created
			by Remy DeCausemaker, Nate Case, and David Gay
			for the first-ever National Day of Civic Hacking.</p>
	</div>
	<!-- COLUMN 2 (Middle)-->
	<div class="grid-33">
		<h2>Get Info</h2>
		<p>Enter your zipcode below to get UV data for your area.</p>
		<form id="zipcode-form" method="POST" action="/zip_search">
			<label for="zipcode">Zipcode:</label>
			<input type="text" size="5" name="zipcode" required autofocus/>
			<input type="submit" value="Search" />
		</form>
	</div>
	<!-- COLUMN 3 (Right)-->
	<div class="grid-33">
		<h2>Hacking</h2>
		<p>EPAUV is Python-powered software released freely under the GNU
			GPL v3+. You can hack on this project through <a
			href="https://github.com/FOSSRIT/ndoch-epa">its Git repo</a>.</p>
	</div>
    
	<div class="clear spacer"></div>
</div>
