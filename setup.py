import os

from setuptools import setup, find_packages

here = os.path.abspath(os.path.dirname(__file__))
README = open(os.path.join(here, 'README.rst')).read()
CHANGES = open(os.path.join(here, 'CHANGES.rst')).read()

requires = [
    'pyramid',
    'SQLAlchemy',
    'transaction',
    'pyramid_tm',
    'pyramid_debugtoolbar',
    'zope.sqlalchemy',
    'waitress',
    ]

setup(name='EPAUV',
      version='0.0',
      description='EPAUV',
      long_description=README + '\n\n' + CHANGES,
      classifiers=[
        "Programming Language :: Python",
        "Framework :: Pyramid",
        "Topic :: Internet :: WWW/HTTP",
        "Topic :: Internet :: WWW/HTTP :: WSGI :: Application",
        ],
      author='Nate Case, Remy DeCausemaker, David Gay',
      author_email='decause@gmail.com',
      url='https://github.com/FOSSRIT/ndoch-epa',
      keywords='web wsgi bfg pylons pyramid ndoch epa uv index data',
      packages=find_packages(),
      include_package_data=True,
      zip_safe=False,
      test_suite='epauv',
      install_requires=requires,
      entry_points="""\
      [paste.app_factory]
      main = epauv:main
      [console_scripts]
      initialize_EPAUV_db = epauv.scripts.initializedb:main
      """,
      )
