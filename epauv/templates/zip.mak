<%inherit file="master.mak"/>
<script>
  $(function() {
    $('#accordion').accordion();
  });
</script>
<div class="page">
    <div class="grid-100">
		<form id="go-back" action="/">
			<input type="submit" value="Back" />
		</form>
        <h2>UV data for ${zipcode}</h2>
    </div>
    <div class="grid-40">
	% if len(data) < 1:
	<p>Sorry, either zip code ${zipcode} does not exist or there is no
		data for that location at this time.</p>
	% else:
		<!-- Data for the current time -->
		<div id="current-data">
			% if min_uv == max_uv:
			<p>The UV index is currently <strong style="${colors[max_uv]}">${max_uv}</strong>.</p>
			% else:
				<p>The UV index is currently between <strong style="${colors[min_uv]}">
					${min_uv}</strong> and <strong style="${colors[max_uv]}">${max_uv}</strong>.
			% endif
			<p style="font-size: 0.6em">Click a time in the list below to get information for that hour.</p>
			<p style="font-size: 2em; margin-top: -20px">↓</p>
		</div>
	</div>
	<div class="grid-60">
		<!-- Hourly data -->
		<div class="graph">
			${chart | n}
		</div>
	</div>

	<div class="clear"></div>

	<div class="grid-100">

		<div id='accordion'>
		% for hour in data:
			<% color = colors[data[hour]] %>
			<h3 style=${color}>${hour}:00 -- UV index ${data[hour]}</h3>
			<div>
			% if data[hour] in [0,1,2]:
				<p>Minutes to Skin Damage: <strong style=${color}>60+</strong></p>
				<p>You can safely enjoy being outside. Wear sunglasses on bright days.
				If you burn easily, cover up and use sunscreen SPF 30+.<br/> In winter,
				reflection off snow can nearly double UV strength.</p>

			% elif data[hour] in [3,4,5]:
				<p>Minutes to Skin Damage: <strong style=${color}>45</strong></p>
				<p>Take precautions if you will be outside, such as wearing a hat and
				sunglasses and using sunscreen SPF 30+. Reduce your exposure to the sun's
				most intense UV radiation by seeking shade during midday hours.</p>

			% elif data[hour] in [6,7]:
				<p>Minutes to Skin Damage: <strong style=${color}>30</strong></p>
				<p>Protection against sun damage is needed. Wear a wide-brimmed hat and
				sunglasses, use sunscreen SPF 30+ and wear a long-sleeved shirt and pants
				when practical. Reduce your exposure to the sun's most intense UV radiation
				by seeking shade during midday hours.</p>

			% elif data[hour] in [8,9,10]:
				<p>Minutes to Skin Damage: <strong style=${color}>15</strong></p>
				<p>Protection against sun damage is needed. If you need to be
				outside during midday hours between 10 a.m. and 4 p.m., take steps to reduce
				sun exposure. A shirt, hat and sunscreen are a must, and be sure
				you seek shade.<br/>

				Beachgoers should know that white sand and other bright surfaces
				reflect UV and can double UV exposure.</p>

			% elif data[hour] >= 11:
				<p>Minutes to Skin Damage: <strong style=${color}><10</strong></p>
				<p>Protection against sun damage is needed. If you need to be
				outside during midday hours between 10 a.m. and 4 p.m., take steps
				to reduce sun exposure. A shirt, hat and sunscreen are a must, and
				be sure you seek shade.<br/>

				Beachgoers should know that white sand and other bright surfaces
				reflect UV and can double UV exposure.  </p>
			% else:
				<div>
					<p>${hour["UV_VALUE"]}</p>
			% endif
			</div>
		% endfor
		</div> <!-- end accordion div -->
	% endif
    
    <div class="clear spacer"></div>
    </div>
    </div>
