# Storage assignment

Animal shelter assignment made with express and mysql

## Installing the Repo

Fork the Animal shelter repo and change the directory to the folder.

```
npm install
npm run build # build and minify static files
npm start # runs server on `localhost:1902`
```

To get a fully working repo we need to have a database.

## Getting the database working

There are two ways to add the database, by importing a mysql file or manual adding the database.

**The importing solution**  
In the root of my repo there is a file called `animalShelterDB.sql`.  
This file can be used to upload an existing database.  
To do so, create a mysql database and in connect with it.  
In your command line you can use the following code:  
`mysql -u <username> -p <databasename> < animalShelterDB.sql`  
It will ask for your username and password, after you entered it correctly you will have a working database for the repo.  

**The manual solution**   
Create the following setup by hand:

![Database setup](https://github.com/timruiterkamp/shelter/blob/master/AnimalShelterDB.jpg "Database setup")


You can now add animals through localhost:1902/form

## Connect with the server

To connect with the server you have to use your own mysql information in the index.js (By choice i would recommend using [dotenv](https://www.npmjs.com/package/dotenv) for this).

The code that has to be changed:

```javascript
var connection = mysql.createConnection({
  host: //your database host,
  user://your mysql username,
  password: //your mysql password,
  database: //your database name
})
```

## Brief description of code

```txt
build.js - crawls new data (probably not needed)
db/data.json - raw data in json format
db/image/ - images for all animals
db/index.js - interface for accessing data
db/readme.md - docs for `db`
server/ - web server
server/helpers.js - utility functions used in the views to render animals
server/index.js - express server
src/index.css - unprocessed styles
src/index.js - unprocessed scripts
static/ - output of `src` after processing (these are sent to the browser)
view/detail.ejs - ejs template for one animal
view/list.ejs - ejs template for all animals
view/error.ejs - ejs template for errors
```

## Brief description of npm scripts

* `npm start` — Start the server (on port 1902)
* `npm test` — Tests the database
* `npm run lint` — Check browser code and node code for problems
* `npm run build` — Build browser code

## Data

Data is crawled (by `build.js`) from [nycacc][].
If you have the means to do so, you should consider becoming a foster parent,
volunteering at your local animal shelter, or donating!

## License

[MIT][] © [Titus Wormer][author]

[mit]: license
[author]: http://wooorm.com
