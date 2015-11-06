Nand = require('../nand.js')
should = require('should')

describe 'Nand', ->
  it 'methods', ->
    Nand.should.have
      .properties('include','and','or','not','nand','nor','xor')
  it '#include', ->
    Nand.include()

    global.should.have
      .properties('and','or','not','nand','nor','xor')

    Nand.and.toString() == global.and.toString()
    Nand.or.toString() == global.or.toString()
    Nand.not.toString() == global.not.toString()
    Nand.nand.toString() == global.nand.toString()
    Nand.nor.toString() == global.nor.toString()
    Nand.xor.toString() == global.xor.toString()

    describe '#and()', ->
      it '0, 1', ->
        Nand.and(0,0).should.equal(0)
        Nand.and(0,1).should.equal(0)
        Nand.and(1,0).should.equal(0)
        Nand.and(1,1).should.equal(1)
      it '10, 11', ->
        should( Nand.and(10,10) ).equal( 10 );
        should( Nand.and(11,10) ).equal( 10 );
        should( Nand.and(10,11) ).equal( 10 );
        should( Nand.and(11,11) ).equal( 11 );
      it '100, 101', ->
        should( Nand.and(100,101) ).equal( 100 );
        should( Nand.and(101,100) ).equal( 100 );
        should( Nand.and(100,101) ).equal( 100 );
        should( Nand.and(101,101) ).equal( 101 );
