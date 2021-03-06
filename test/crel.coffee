expect = require 'expect.js'
{crel, p, div, script} = require '../src/teact'
{render} = require './helpers'

describe 'crel', ->
  it 'renders text verbatim', ->
    expect(render -> p 'foobar').to.equal '<p>foobar</p>'

  it 'renders numbers', ->
    expect(render -> p 1).to.equal '<p>1</p>'
    expect(render -> p 0).to.equal '<p>0</p>'

  it "renders undefined as ''", ->
    expect(render -> p undefined).to.equal "<p></p>"

  it 'renders empty tags', ->
    template = ->
      script src: 'js/app.js'
    expect(render template).to.equal('<script src="js/app.js"></script>')

  it 'renders text tags as strings', ->
    expect(render -> crel.text "Foo").to.equal 'Foo'

  it 'throws on undefined element types', ->
    expect(-> crel undefined, className: 'foo').to.throwException /got: undefined/
