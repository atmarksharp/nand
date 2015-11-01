Nand = require('../nand.js')
assert = require('assert')

describe 'Nand.STree', ->
  describe 'SExpr', ->
    it 'new SExpr()', ->
      e = new (Nand.STree.SExpr)
      assert.equal 'object', typeof e
      assert.equal 'function', typeof e.get
      assert.equal 'object', typeof e.list
      assert.equal 0, e.list.length

    it '#init() and #get()', ->
      e = new (Nand.STree.SExpr)
      assert.equal null, e.get(0)

      e2 = new (Nand.STree.SExpr)(['foo','bar'])
      assert.equal 2, e2.list.length
      assert.equal 'foo', e2.get(0)
      assert.equal 'bar', e2.get(1)

  describe 'SDoc', ->
  describe 'LParen', ->
    it 'init', ->
      lp = new Nand.STree.LParen()
      assert.equal 'object', typeof lp
  describe 'Id', ->
  describe 'Bool', ->

describe '#parse()', ->
  it 'and', ->
    doc = Nand.parse('(and 0 1)')
    assert.equal true, doc instanceof Nand.STree.SRoot

    e = doc.get(0)
    # console.log(e);
    assert.equal true, e instanceof Nand.STree.SExpr

    assert.equal true, e.get(0) instanceof Nand.STree.Id
    assert.equal true, e.get(1) instanceof Nand.STree.Bool
    assert.equal true, e.get(2) instanceof Nand.STree.Bool

    assert.equal 'and', e.get(0).name
    assert.equal 0, e.get(1).value
    assert.equal 1, e.get(2).value

# describe("#eval()", function(){
#   it("and", function(){
#     assert.equal("0", Nand.eval("(and 0 0)"));
#     assert.equal("0", Nand.eval("(and 1 0)"));
#     assert.equal("0", Nand.eval("(and 0 1)"));
#     assert.equal("1", Nand.eval("(and 1 1)"));
#   });
# });
