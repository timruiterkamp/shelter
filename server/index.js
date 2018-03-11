'use strict'

var express = require('express')
var db = require('../db')
var helpers = require('./helpers')
var find = require('array-find');

module.exports = express()
  .set('view engine', 'ejs')
  .set('views', 'view')
  .use(express.static('static'))
  // TODO: Serve the images in `db/image` on `/image`.
  .use('/image', express.static('db/image'))
  .get('/', all)
  .get('/:id', animals)
  /* TODO: Other HTTP methods. */
  // .post('/', add)
  // .get('/:id', get)
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
    var animalId = db.has(id)
  } catch (err) {
    notFound(400, res)
  }

  if(animalId) {
    var getId = {data: db.get(id)}

    res.format({
      json: () => res.json(getId),
      html: () => res.render('detail.ejs', Object.assign({}, getId, helpers))
    })
  } else {
    notFound(404, res)
  }

}

function removeAnimal(req, res) {
 var id = req.params.id
 try {
 db.remove(id)
 res.status(204).end()
 }
 catch(err) {
   if(db.removed(id)) {
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
  res.status(error).render('error.ejs', errorObj)
}
