from pyramid.httpexceptions import (
    HTTPFound,
    HTTPNotFound,
    )
from pyramid.response import Response
from pyramid.view import view_config

from sqlalchemy.exc import DBAPIError

from .models import (
    DBSession,
    MyModel,
    )

from datetime import datetime
import requests


@view_config(route_name='home', renderer='home.mak')
def home(request):
    return {}


@view_config(route_name='zip', renderer='zip.mak')
def zip(request):
    # get the zipcode from the URL
    zipcode = request.matchdict.get('zipcode')
    # get the JSON from the EPA API
    url = 'http://iaspub.epa.gov/enviro/efservice/getEnvirofactsUVHOURLY/ZIP/'\
           + zipcode + '/json'
    r = requests.get(url)
    pulled_json = r.json()
    # get the current time
    now = datetime.now()
    # build data structure {hour: uv-value}
    data = dict()
    for item in pulled_json:
        date = datetime.strptime(item['DATE_TIME'], "%b/%d/%Y %I %p")
        data[date.hour] = item['UV_VALUE']
    uv_this_hour = data[now.hour]
    uv_next_hour = data[now.hour + 1]
    colors = ["color:#006400", "color:#008000", "color:#7CFC00", "color:#FFFF00",
              "color:#FFD700", "color:#FFA500", "color:#FF8C00", "color:#FF4500",
              "color:#DC143C", "color:#C71585", "color:#FF1493", "color:#7FFFD4"]
    return dict(zipcode=zipcode,
                data=data,
                min_uv=min(uv_this_hour, uv_next_hour),
                max_uv=max(uv_this_hour, uv_next_hour),
                colors=colors)


@view_config(route_name='zip_search')
def zip_search(request):
    """Redirection view for searching for a zip code."""
    zipcode = request.params['zipcode']
    if len(zipcode) == 5:
        return HTTPFound(location=request.route_url('zip', zipcode=zipcode))
    else:
        # Invalid zipcode, go back to home view
        return HTTPFound(location=request.route_url('home'))


conn_err_msg = """\
Pyramid is having a problem using your SQL database.  The problem
might be caused by one of the following things:

1.  You may need to run the "initialize_EPAUV_db" script
    to initialize your database tables.  Check your virtual 
    environment's "bin" directory for this script and try to run it.

2.  Your database server may not be running.  Check that the
    database server referred to by the "sqlalchemy.url" setting in
    your "development.ini" file is running.

After you fix the problem, please restart the Pyramid application to
try it again.
"""
