Nand = require('../nand.js')
test = require('unit.js');
should = test.should;
object = test.object;

describe 'Nand.STree', ->
  describe 'SExpr', ->
    it 'new SExpr()', ->
      e = new Nand.STree.SExpr()
      object(e)
        .hasProperty('get')
        .hasProperty('list')
        .hasProperty('length')

      should( e.get ).be.Function
      should( e.list ).be.Array
      should( e.length ).be.Number
      should( e.length ).equal( 0 )

    it '#init(), #get() and #length', ->
      e2 = new Nand.STree.SExpr(['foo','bar'])
      should( e2.length ).equal( 2 )
      should( e2.get(0) ).equal( "foo" )
      should( e2.get(1) ).equal( "bar" )

  describe 'SDoc', ->
    it '#list, #length', ->
      doc = new Nand.STree.SDoc(["a","b"])
      object( doc )
        .hasProperty('get')
        .hasProperty('length')

      should( doc.length ).equal( 2 )
      should( doc.get(0) ).equal( "a" )
      should( doc.get(1) ).equal( "b" )

  describe 'LParen', ->
    it '#init()', ->
      lparen = new Nand.STree.LParen()
      should( lparen ).be.Object

  describe 'Id', ->
    it '#name()', ->
      id = new Nand.STree.Id("and");
      object( id ).hasProperty('name');
      should( id.name ).equal( 'and' )

  describe 'Bool', ->
    it '#value', ->
      bool = new Nand.STree.Bool(1);
      object( bool ).hasProperty('value')
      should( bool.value ).equal( 1 )

describe '#parse()', ->
  it '(and 0 1)', ->
    doc = Nand.parse('(and 0 1)')
    should( doc instanceof Nand.STree.SDoc ).be.ok

    e = doc.get(0)
    should( e instanceof Nand.STree.SExpr ).be.ok
    should( e.length ).equal( 3 )
    should( e.get(0) instanceof Nand.STree.Id ).be.ok
    should( e.get(1) instanceof Nand.STree.Bool ).be.ok
    should( e.get(2) instanceof Nand.STree.Bool ).be.ok
    should( e.get(0).name ).equal( 'and' )
    should( e.get(1).value ).equal( 0 )
    should( e.get(2).value ).equal( 1 )

describe "#interpret()", ->
  it "(and 0 1)", ->
    result = Nand.interpret("(and 0 1)")
    should( result instanceof Nand.STree.Bool ).be.ok
    should( result.value ).equal( 0 )

describe "#eval()", ->
  it "(and * *)", ->
    and_00 = Nand.eval("and 0 0")
    and_10 = Nand.eval("and 1 0")
    and_01 = Nand.eval("and 0 1")
    and_11 = Nand.eval("and 1 1")

    should( and_00 ).be.Object
    should( and_10 ).be.Object
    should( and_01 ).be.Object
    should( and_11 ).be.Object
    should( and_00 instanceof Bool ).be.ok
    should( and_10 instanceof Bool ).be.ok
    should( and_01 instanceof Bool ).be.ok
    should( and_11 instanceof Bool ).be.ok
    should( and_00.value ).equal( 0 )
    should( and_10.value ).equal( 0 )
    should( and_01.value ).equal( 0 )
    should( and_11.value ).equal( 1 )
