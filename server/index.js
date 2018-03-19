'use strict'

var express = require('express')
var bodyParser = require('body-parser')
var fs = require('fs')
var mysql = require('mysql')
var multer = require('multer')
var db = require('../db')
var helpers = require('./helpers')


require('dotenv').config()

var connection = mysql.createConnection({
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  database: process.env.DB_NAME
})

connection.connect()
var upload = multer({dest: 'static/upload/'})


module.exports = express()
  .set('view engine', 'ejs')
  .set('views', 'view')
  .use(express.static('static'))
  .use(bodyParser.urlencoded({
    extended: true
  }))
  .use(bodyParser.json())
  .use('/image', express.static('static/upload'))
  .get('/form', animalForm)
  .get('/:id', animals)
  .post('/', upload.single('image'), addAnimal)
  .delete('/:id', removeAnimal)
  .get('/', all)
  .listen(1902)

function all(req, res, next) {
  connection.query('SELECT * FROM animals', done )

  function done(err, data) {
    if(err) {
      next(err)
    } else {
      res.format({
        json: () => res.json(data),
        html: () =>  res.render('list.ejs', Object.assign({}, helpers, {data: data} ))
      })
    }
  }
}

function animals(req, res, next) {
  var id = req.params.id
  connection.query('SELECT * FROM animals LEFT JOIN shelter ON animals.place = shelter.shelterName WHERE animals.id = ?',id, done)


  function done(err, data) {
    if(err) {
      next(err)
    } else if (data.length === 0) {
    next()

    }else {
      res.format({
        json: () => res.json(data),
        html: () =>  res.render('detail.ejs',  Object.assign({}, helpers, {data: data[0]} ))
      })
    }
  }
}

function animalForm(req, res) {
  res.render('form.ejs')
}

function addAnimal(req, res, next) {
  var addAnimal

  connection.query('INSERT INTO animals SET ?',
  addAnimal = {
    name: req.body.name,
    type: req.body.type,
    place: req.body.shelter,
    shelterName: req.body.shelter,
    description: req.body.description,
    sex: req.body.sex,
    age: parseInt(req.body.age, 10),
    size: req.body.size,
    length: req.body.length,
    vaccinated: req.body.vaccinated == 1,
    declawed: req.body.declawed,
    coat: req.body.coat,
    primaryColor: req.body.primaryColor,
    secondaryColor: req.body.secondaryColor,
    weight: parseInt(req.body.weight, 10),
    intake: req.body.intake
  }, done)


  if (addAnimal.type === 'dog' || addAnimal.type === 'rabbit') {
    addAnimal.declawed = undefined
  }  else if (addAnimal.type === 'cat' || addAnimal.type != undefined) {
    addAnimal.declawed = 'true'
  } else {
    addAnimal.declawed = undefined
  }

  if (addAnimal.secondaryColor === '' || addAnimal.secondaryColor === undefined) {
    addAnimal.secondaryColor = undefined
  }

  function done(err, data) {
    if (err) {
      next(err)
    } else if (req.file) {
        fs.rename(req.file.path, 'static/upload/' + data.insertId + '.jpg', err => {
          if (err) {
            console.error(err)
          } else {
            res.redirect('/' + data.insertId)
          }
        })
    } else {
      res.redirect('/' + data.insertId)
    }
  }
}

function removeAnimal(req, res, next) {
  var id = req.params.id
  connection.query('DELETE FROM animals WHERE id = ?', id, done )

  function done(err) {
    if (err) {
      next(err)
      if (db.removed(id)) {
        notFound(410, res)
      } else {
        notFound(404, res)
      }
    } else {
      res.json({status: 'ok'})
    }
  }
}

function notFound(error, res) {
  var errorObj = {
    errors: [{
      id: error,
      title: error
    }]
  }
  res.format({
    json: () => res.status(error).json(errorObj.errors),
    html: () => res.render('error.ejs', Object.assign({}, errorObj, helpers))
  })
}
