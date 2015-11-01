Nand = require('../nand.js')
assert = require('assert')

describe 'Nand.STree', ->
  describe 'SExpr', ->
    it 'new SExpr()', ->
      e = new (Nand.STree.SExpr)
      assert.equal 'object', typeof e
      assert.equal 'function', typeof e.get
      assert.equal 'object', typeof e.list
      assert.equal 0, e.length

    it '#init(), #get() and #length', ->
      e = new (Nand.STree.SExpr)
      assert.equal null, e.get(0)

      e2 = new (Nand.STree.SExpr)(['foo','bar'])
      assert.equal 2, e2.length
      assert.equal 'foo', e2.get(0)
      assert.equal 'bar', e2.get(1)

  describe 'SDoc', ->
    it '#list, #length', ->
      doc = new Nand.STree.SDoc(["a","b"])
      assert.equal 2, doc.length
      assert.equal "a", doc.get(0)
      assert.equal "b", doc.get(1)

  describe 'LParen', ->
    it '#init()', ->
      lp = new Nand.STree.LParen()
      assert.equal 'object', typeof lp

  describe 'Id', ->
    it '#name()', ->
      id = new Nand.STree.Id("and");
      assert.equal 'and', id.name

  describe 'Bool', ->
    it '#value', ->
      bool = new Nand.STree.Bool(1);
      assert.equal 1, bool.value

describe '#parse()', ->
  it '(and 0 1)', ->
    doc = Nand.parse('(and 0 1)')
    assert.equal true, doc instanceof Nand.STree.SDoc

    e = doc.get(0)
    # console.log(e);
    assert.equal true, e instanceof Nand.STree.SExpr

    assert.equal true, e.get(0) instanceof Nand.STree.Id
    assert.equal true, e.get(1) instanceof Nand.STree.Bool
    assert.equal true, e.get(2) instanceof Nand.STree.Bool

    assert.equal 'and', e.get(0).name
    assert.equal 0, e.get(1).value
    assert.equal 1, e.get(2).value

describe "#interpret()", ->
  it "(and 0 1)", ->
    result = Nand.interpret("(and 0 1)")
    assert.equal true, result instanceof Nand.STree.Bool
    assert.equal "0", result.value

# describe "#eval()", ->
#   it "(and * *)", ->
#     assert.equal "0", Nand.eval("(and 0 0)")
#     assert.equal "0", Nand.eval("(and 1 0)")
#     assert.equal "0", Nand.eval("(and 0 1)")
#     assert.equal "1", Nand.eval("(and 1 1)")
