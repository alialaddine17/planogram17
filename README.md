==================================
Install/Setup Backend (Laravel)
===================================

Step 1 : Clone repository from github (URL : https://github.com/alialaddine17/planogram17)
Step 2 : Go to planogram17/Backend/Api directory. This directory contains all laravel source for backend and API
Step 3 : If you do not have composer install then install it and then perform "composer update" command. All dependency will be downloaded for the same
Step 4 : In root there is .env file in which database credentails needs to be updated
Step 5 : Replace constants like DB_DATABASE, DB_USERNAME, DB_PASSWORD with your respective credentials

==================================
Install/Setup Backend (Angular 8)
===================================

Step 1 : Clone repository from github (URL : https://github.com/alialaddine17/planogram17)
Step 2 : Go to planogram17/Backend/Admin directory. This directory contains all Angular 8 source
Step 3 : Perform "npm install" to install node modules (dependencies)
Step 4 : Now go to planogram17/Backend/Admin/src/environments which hase two files environment.ts and environment.prod.ts
Step 5 : To generate local build (ng build) set base url in environment.ts
Step 5 : To generate production build (ng build --prod --aot) set base url in environment.prod.ts
	
===========
Example
===========
baseUrl : 'http://abc.com/api/'

In above example 'http://abc.com/' is the base url whose virtual host for laravel is set. Add 'api' statically after it


=========================================
Steps to Run Admin Panel
==========================================

Step 1 : Change baseurl in environment.prod.ts file which is pointing to live
Step 2 : Generate build using ng build --prod --aot. Once this commands runs successfully "dist" folder will be generated on planogram17/Backend/Admin
Step 3 : Copy the folder and place it in planogram17/Backend/Api/public
Step 4 : Rename folder "dist" to "admin"
Step 5 : In admin folder there is index.html file in which base url of Laravel must be replaced


===========
Example
===========
<base href="http://abc.com/admin/">
