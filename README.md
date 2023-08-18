# RobotFrameworkUIAndAPI
This repository contains sets of API and UI tests, built on the Robot Framework. API tests use the RequestsLibrary in conjunction with Robot Framework
Installation
Prerequisites
Robot Framework is implemented using Python, and a precondition to install it is having Python or its alternative implementation PyPy installed. Another recommended precondition is having the pip package manager available. Robot Framework requires Python 3.6 or newer.

1. Install Robot Framework
   python3 -m pip install -U robotframework
2.Install RequestsLibrary
  python3 -m pip install -U robotframework-requests

**Installation for API tests**
For API testing installation requires Robot Framework, RequestsLibrary, JSONLibrary and DatabaseLibrary.
If you installed everything from the prerequisites, all you need to install is the JSONLibrary.

Install JSONLibrary
python3 -m pip install -U robotframework-jsonlibrary
