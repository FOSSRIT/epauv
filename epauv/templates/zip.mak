<%inherit file="master.mak"/>
<script>
  $(function() {
    $('#accordion').accordion();
  });
</script>
<div class="page">
    <div class="grid-100">
        <h2>UV data for ${zipcode}</h2>
        ##<p>${data}</p>
    </div>
    <div class="grid-100" id='accordion'>
    % for hour in data:
        <%
            from datetime import datetime

            date = datetime.strptime(hour['DATE_TIME'], "%b/%d/%Y %I %p")
            date = date.strftime("%I %p")
            colors = ["color:#006400", "color:#008000", "color:#7CFC00", "color:#FFFF00",
                      "color:#FFD700", "color:#FFA500", "color:#FF8C00", "color:#FF4500",
                      "color:#DC143C", "color:#C71585", "color:#FF1493", "color:#7FFFD4"]
            color = colors[hour['UV_VALUE']]
        %>
        <h3 style=${color}>${date} - ${hour["UV_VALUE"]}</h3>
        <div>
        % if hour['UV_VALUE'] in [0,1,2]:
            <p>Minutes to Skin Damage: <strong style=${color}>60+</strong></p>
            <p>You can safely enjoy being outside. Wear sunglasses on bright days.
            If you burn easily, cover up and use sunscreen SPF 30+.<br/> In winter,
            reflection off snow can nearly double UV strength.</p>

        % elif hour['UV_VALUE'] in [3,4,5]:
            <p>Minutes to Skin Damage: <strong style=${color}>45</strong></p>
            <p>Take precautions if you will be outside, such as wearing a hat and
            sunglasses and using sunscreen SPF 30+. Reduce your exposure to the sun's
            most intense UV radiation by seeking shade during midday hours.</p>

        % elif hour['UV_VALUE'] in [6,7]:
            <p>Minutes to Skin Damage: <strong style=${color}>30</strong></p>
            <p>Protection against sun damage is needed. Wear a wide-brimmed hat and
            sunglasses, use sunscreen SPF 30+ and wear a long-sleeved shirt and pants
            when practical. Reduce your exposure to the sun's most intense UV radiation
            by seeking shade during midday hours.</p>

        % elif hour['UV_VALUE'] in [8,9,10]:
            <p>Minutes to Skin Damage: <strong style=${color}>15</strong></p>
            <p>Protection against sun damage is needed. If you need to be
            outside during midday hours between 10 a.m. and 4 p.m., take steps to reduce
            sun exposure. A shirt, hat and sunscreen are a must, and be sure
            you seek shade.<br/>

            Beachgoers should know that white sand and other bright surfaces
            reflect UV and can double UV exposure.</p>

        % elif hour['UV_VALUE'] >= 11:
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
    
    <div class="clear spacer"></div>
    </div>
