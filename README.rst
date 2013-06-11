EPAUV
=====

This is a project started by a few FOSS@RIT hackers in Rochester, NY for the
first-ever National Day of Civic Hacking. We hope to expose publicly-available
UV index data provided by the Environmental Protection Agency to create an
attractive, interesting interface to this data.


.. image:: /epauv/static/images/zipform.png
   :height: 100px
   :width: 200 px
   :align: center


.. image:: /epauv/static/images/result-desktop.png
   :height: 100px
   :width: 200 px
   :align: center


.. image:: /epauv/static/images/result-mobile.png
   :height: 100px
   :width: 200 px
   :align: center


.. image:: /epauv/static/images/result-list.png
   :height: 100px
   :width: 200 px
   :align: center


License
-------

This software is released under the GNU GPL version 3 or later.

Getting Started
---------------

We hack on this project in a virtualenv, and you should, too!

EPAUV requires that you have the ``python-lxml`` package installed.
This is used by pygal to generate coolio SVG diagrams.

-   cd <directory containing this file>

-   $venv/bin/python setup.py develop

-   $venv/bin/initialize_EPAUV_db development.ini

-   $venv/bin/pserve development.ini

Contributors
------------

-   Nate Case

-   Remy DeCausemaker

-   David Gay

