import json
import urllib2
import pygal

#from kitchen.text.converters import to_bytes

#from pygal.style import NeonStyle

data = json.load(urllib2.urlopen('http://iaspub.epa.gov/enviro/efservice/getEnvirofactsUVHOURLY/ZIP/14623/json'))
#uvindex_hourly = feedparser.parse('http://iaspub.epa.gov/enviro/efservice/getEnvirofactsUVHOURLY/ZIP/14623/rss')
print data

i = 0
uvindex = []
for item in data:
    uvindex.append(data[i]["UV_VALUE"])
    i += 1

i = 0
line_chart = pygal.Line()
line_chart.title = 'Hourly Ultra Violet Index'
line_chart.x_labels = ['07', '08', '09', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '00', '01', '02', '03']
line_chart.add("UV_INDEX", uvindex)

line_chart.render_in_browser()

#for item in data:
#    print data[i]["DATE_TIME"], data[i]["UV_VALUE"]
#    line_chart.add(data[i]["DATE_TIME"], uvindex[i])
#    i += 1



#for d in data:

#chart.x_labels = labels
#chart.add('Counts', counts)
#
#for index, item in enumerate(data.entries):
#    print item.link + " ** " + item.title + " ** " + item.published
#chart = pygal.Bar()
#for d in data:
#    chart.add(d['event'], [{'value': int(d["count"]), 'label': d['event']}])
#    labels.append(d["letter"])


#chart.x_labels = labels
#chart.add('Counts', counts)
#chart.render_in_browser()
