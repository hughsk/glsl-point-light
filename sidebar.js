var tweakable = require('tweakable')
var Textbox = tweakable()

module.exports = sidebar

function sidebar() {
  var el = document.createElement('div')
  var sb = {}

  header(el, 'Ambient')

  title(el, 'Red')
  sb.ar = Textbox(el)
  title(el, 'Green')
  sb.ag = Textbox(el)
  title(el, 'Blue')
  sb.ab = Textbox(el)

  header(el, 'Light 1 Color')

  title(el, 'Red')
  sb.dr = Textbox(el)
  title(el, 'Green')
  sb.dg = Textbox(el)
  title(el, 'Blue')
  sb.db = Textbox(el)

  header(el, 'Light 2 Color')

  title(el, 'Red')
  sb.br = Textbox(el)
  title(el, 'Green')
  sb.bg = Textbox(el)
  title(el, 'Blue')
  sb.bb = Textbox(el)

  process.nextTick(function() {
    sb.ar.write('20')
    sb.ag.write('0')
    sb.ab.write('20')
    sb.dr.write('255')
    sb.dg.write('100')
    sb.db.write('0')
    sb.br.write('45')
    sb.bg.write('95')
    sb.bb.write('255')
  })

  el.setAttribute('class', 'sidebar')
  document.body.appendChild(el)
  return sb
}

function title(el, text) {
  var h4 = document.createElement('h4')
  el.appendChild(h4)
  h4.innerText = text
  return h4
}

function header(el, text) {
  var h3 = document.createElement('h3')
  el.appendChild(h3)
  h3.innerText = text
  return h3
}
