'use strict'

var express = require('express')
var db = require('../db')
var helpers = require('./helpers')
var bodyParser = require('body-parser')
var slug = require('slug')

module.exports = express()
  .set('view engine', 'ejs')
  .set('views', 'view')
  .use(bodyParser.urlencoded({
    extended: true
  }))
  .use(bodyParser.json())
  .use(express.static('static'))
  .use('/image', express.static('db/image'))
  .get('/', all)
  .get('/form', animalForm)
  .get('/:id', animals)
  .post('/', addAnimal)
  // .put('/:id', set)
  // .patch('/:id', change)
  .delete('/:id', removeAnimal)
  .listen(1902)

function all(req, res) {
  var result = {errors: [], data: db.all()}

  /* Support both a request for JSON and a request for HTML  */
  res.format({
    json: () => res.json(result),
    html: () => res.render('list.ejs', Object.assign({}, result, helpers))
  })
}

function animals(req, res) {
  var id = req.params.id
  var animalId

  try {
    animalId = db.has(id)
  } catch (err) {
    notFound(400, res)
  }

  if (animalId) {
    var getId = {data: db.get(id)}

    res.format({
      json: () => res.json(getId),
      html: () => res.render('detail.ejs', Object.assign({}, getId, helpers))
    })
  } else {
    notFound(404, res)
  }
}

function animalForm(req, res) {
  res.render('form.ejs')
}

function addAnimal(req, res) {
 console.log(req.body)
 var id = slug(req.body.name).toLowerCase()
console.log(id)

 var newAnimal = {
   id: id,
   name: req.body.name,
   type: req.body.type,
   place: req.body.place,
   sex: req.body.sex,
   age: req.body.age,
   vaccinated: req.body.vaccinated,
   declawed: req.body.declawed,
   primaryColor: req.body.primaryColor,
   secondaryColor: req.body.secondaryColor,
   coat: req.body.coat,
   weight: req.body.weight,
   size: req.body.size,
   length: req.body.length,
   intake: req.body.intake,
   description: req.body.description,
   image: req.body.image
  }

  try {
    db.add(newAnimal)
    res.redirect('/' + id)
  } catch(err) {
    notFound(422, res)
  }
}

function removeAnimal(req, res) {
  var id = req.params.id
  try {
    db.remove(id)
    res.status(204).end()
  } catch (err) {
    if (db.removed(id)) {
      notFound(410, res)
    } else {
      notFound(404, res)
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
