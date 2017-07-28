from setuptools import setup
from setuptools import Extension
import os

def getfiles(root):
    for dirpath, _, filenames in os.walk(root):
        for filename in filenames:
            yield os.path.relpath(os.path.join(dirpath, filename))

datafiles  = list(getfiles("CITIS/skeleton"))
datafiles += list(getfiles("CITIS/public"))
datafiles  = ["/".join(x.split("/")[1:]) for x in datafiles]

setup(
    name = "CITIS",
    author = "Carl Vondrick",
    author_email = "cvondric@ics.uci.edu",
    description = "A framework for Mechanical Turk HITs",
    license = "MIT",
    version = "0.2.5",
    classifiers = ['Development Status :: 1 - Planning',
                   'Intended Audience :: Developers'],
    packages = ["CITIS"],
    scripts = ['scripts/CITIS'],
    package_dir = {"CITIS": "CITIS"},
    package_data = {"": datafiles},
    install_requires = ["setuptools", "SQLAlchemy", "wsgilog"]
)
