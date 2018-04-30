# store

OnlineStore - the biggest web application here. It simulates online shopping with buyer account registration and admin account registration. 
N.B. In order to make it functional on the local machine, jdbc connection string in Spring and Hibernate config files needs to be modified, along with the location of the uploaded images on your local machine in app.images package. In addition, itext 5.0.1 jar file provided in the project list needs to be downloaded and inserted as a library so that the app may recongize classes that work with writing the report for the admin in pdf (app.pdf package).


FileRenamer - simple GUI application that renames files in a folder by picking the list of names from another file. 
The extensions of the files that are about to be changed must be left intact.

ScreenShotTaker2 - a simple GUI application that takes screenhots of your machine at the specified period entered by the user 
and saves the images to the specified location chosen by the user. It names the images according to the hours and minutes the shot
was taken. Its main purpose is for monitoring remote workers who work from home.

KrvniPritisak - a simple web application that keeps track of the blood pressure recording systolic, diastolic pressure and pulse at the time the data is inserted. Provides the list of all records. Works with a local database.
