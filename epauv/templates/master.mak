<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="${request.static_url('epauv:static/main.css')}" type="text/css" media="screen" charset="utf-8" />
	<link rel="stylesheet" href="${request.static_url('epauv:static/unsemantic-grid-responsive.css')}" />
    <script
      type="text/javascript"
      src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js">
    </script>
    <title>EPAUV from FOSS@RIT</title>
  </head>
  <body>
  	<div class="grid-container">
    <div class="header grid-100">
		<h1>EPAUV from FOSS@RIT</h1>
    </div>

	<div class="clear"></div>

	<div class="grid-100">
    </div>
    <div class="clear"></div>
    ${self.body()}
    <div class="clear"></div>
	</div> <!-- End grid-container -->
	<footer>
		You can report bugs and file issues with EPAUV on
		<a href="https://github.com/FOSSRIT/ndoch-epa/issues">
		the GitHub issues tracker</a>.
	</footer>
  </body>
</html>
