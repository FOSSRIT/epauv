<%inherit file="master.mak"/>
<div class="page">
	<div class="grid-100">
		<h2>UV data for ${zipcode}</h2>
		<p>${data}</p>
	</div>
	<div class="grid-100">
	<ul style="list-style:none">
	% for hour in data:
		<% 
			from datetime import datetime

			date = datetime.strptime(hour['DATE_TIME'], "%b/%d/%Y %I %p")
			date = date.strftime("%I %p")
		%>
		% if hour['UV_VALUE'] == 0:
			<h1 style="color:#006400;height:30%;">${date} - ${hour["UV_VALUE"]}</h1>
			<p>Minutes to Skin Damage: <strong
			style="color:#006400">60+</strong></p> 
			<p>You can safely enjoy being outside. Wear sunglasses on bright days.
			If you burn easily, cover up and use sunscreen SPF 30+.<br/> In winter,
			reflection off snow can nearly double UV strength. 
			</p>

		% elif hour['UV_VALUE'] == 1:
			<h1 style="color:#008000">${date} - ${hour["UV_VALUE"]}</h1>
			<p>Minutes to Skin Damage: <strong style="color:#008000">60+</strong></p> 
			<p>You can safely enjoy being outside. Wear sunglasses on bright days.
			If you burn easily, cover up and use sunscreen SPF 30+.<br/> In winter,
			reflection off snow can nearly double UV strength.</p>

		% elif hour['UV_VALUE'] == 2:
			<h1 style="color:#7CFC00">${date} - ${hour["UV_VALUE"]}</h1>
			<p>Minutes to Skin Damage: <strong style="color:#7CFC00">60+</strong></p> 
			<p>You can safely enjoy being outside. Wear sunglasses on bright days.
			If you burn easily, cover up and use sunscreen SPF 30+.<br/> In winter,
			reflection off snow can nearly double UV strength.</p>

		% elif hour['UV_VALUE'] == 3:
			<h1 style="color:#FFFF00">${date} - ${hour["UV_VALUE"]}</h1>
			<p>Minutes to Skin Damage: <strong style="color:#FFFF00">45</strong></p> 
			<p>Take precautions if you will be outside, such as wearing a hat and
			sunglasses and using sunscreen SPF 30+. Reduce your exposure to the sun\'s
			most intense UV radiation by seeking shade during midday hours.
</p>

		% elif hour['UV_VALUE'] == 4:
			<h1 style="color:#FFD700">${date} - ${hour["UV_VALUE"]}</h1>
			<p>Minutes to Skin Damage: <strong style="color:#FFD700">45</strong></p> 
			<p>Take precautions if you will be outside, such as wearing a hat and
			sunglasses and using sunscreen SPF 30+. Reduce your exposure to the sun\'s
			most intense UV radiation by seeking shade during midday hours.
			</p>

		% elif hour['UV_VALUE'] == 5:
			<h1 style="color:#FFA500">${date} - ${hour["UV_VALUE"]}</h1>
			<p>Minutes to Skin Damage: <strong style="color:#FFA500">45</strong></p> 
			<p>Take precautions if you will be outside, such as wearing a hat and
			sunglasses and using sunscreen SPF 30+. Reduce your exposure to the sun\'s
			most intense UV radiation by seeking shade during midday hours.
</p>

		% elif hour['UV_VALUE'] == 6:
			<h1 style="color:#FF8C00">${date} - ${hour["UV_VALUE"]}</h1>
			<p>Minutes to Skin Damage: <strong style="color:#FF8C00">30</strong></p> 
			<p>Protection against sun damage is needed. Wear a wide-brimmed hat and
    sunglasses, use sunscreen SPF 30+ and wear a long-sleeved shirt and pants
    when practical. Reduce your exposure to the sun's most intense UV radiation
    by seeking shade during midday hours.
</p>

		% elif hour['UV_VALUE'] == 7:
			<h1 style="color:#FF4500">${date} - ${hour["UV_VALUE"]}</h1>
			<p>Minutes to Skin Damage: <strong style="color:#FF4500">30</strong></p> 
			<p>Protection against sun damage is needed. Wear a wide-brimmed hat and
    sunglasses, use sunscreen SPF 30+ and wear a long-sleeved shirt and pants
    when practical. Reduce your exposure to the sun's most intense UV radiation
    by seeking shade during midday hours.
</p>

		% elif hour['UV_VALUE'] == 8:
			<h1 style="color:#DC143C">${date} - ${hour["UV_VALUE"]}</h1>
			<p>Minutes to Skin Damage: <strong style="color:#DC143C">15</strong></p> 
			<p>Protection against sun damage is needed. If you need to be
			outside during midday hours between 10 a.m. and 4 p.m., take steps to reduce
			sun exposure. A shirt, hat and sunscreen are a must, and be sure
			you seek shade.<br/>

			Beachgoers should know that white sand and other bright surfaces
			reflect UV and can double UV exposure.</p>

		% elif hour['UV_VALUE'] ==  9:
			<h1 style="color:#C71585">${date} - ${hour["UV_VALUE"]}</h1>
			<p>Minutes to Skin Damage: <strong style="color:#C71585">15</strong></p> 
			<p>Protection against sun damage is needed. If you need to be
			outside during midday hours between 10 a.m. and 4 p.m., take steps
			to reduce sun exposure.  A shirt, hat and sunscreen are a must, and
			be sure you seek shade.<br/>

			Beachgoers should know that white sand and other bright surfaces
			reflect UV and can double UV exposure.</p>

		% elif hour['UV_VALUE'] == 10:
			<h1 style="color:#FF1493">${date} - ${hour["UV_VALUE"]}</h1>
			<p>Minutes to Skin Damage: <strong style="color:#FF1493">15</strong></p> 
			<p>Protection against sun damage is needed. If you need to be
			outside during midday hours between 10 a.m. and 4 p.m., take steps
			to reduce sun exposure. A shirt, hat and sunscreen are a must, and
			be sure you seek shade.<br/>

			Beachgoers should know that white sand and other bright surfaces
			reflect UV and can double UV exposure.</p>

		% elif hour['UV_VALUE'] >= 11:
			<h1 style="color:#7FFFD4">${date} - ${hour["UV_VALUE"]}</h1>
			<p>Minutes to Skin Damage: <strong style="color:#7FFFD4"><10</strong></p> 
			<p>Protection against sun damage is needed. If you need to be
			outside during midday hours between 10 a.m. and 4 p.m., take steps
			to reduce sun exposure. A shirt, hat and sunscreen are a must, and
			be sure you seek shade.<br/>

			Beachgoers should know that white sand and other bright surfaces
			reflect UV and can double UV exposure.  </p>
		% else:
			<p>${hour["UV_VALUE"]}</p>
		% endif
		##<li>${hour["DATE_TIME"]}:  ${hour["UV_VALUE"]}</li>
	% endfor
	</ul>
    
	<div class="clear spacer"></div>
	</div>