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

    # NOT =============
    describe '#not()', ->
      it '0, 1', ->
        Nand.not(0).should.equal(1)
        Nand.not(1).should.equal(0)
      it '10, 11', ->
        Nand.not(0b10).should.equal( 0b1 );
        Nand.not(0b11).should.equal( 0b0 );
      it '100, 101, 110, 111', ->
        Nand.not(0b100).should.equal( 0b11 );
        Nand.not(0b101).should.equal( 0b10 );
        Nand.not(0b110).should.equal( 0b1 );
        Nand.not(0b111).should.equal( 0b0 );

    # AND =============
    describe '#and()', ->
      it '0, 1', ->
        Nand.and(0, 0).should.equal(0)
        Nand.and(0, 1).should.equal(0)
        Nand.and(1, 0).should.equal(0)
        Nand.and(1, 1).should.equal(1)
      it '10, 11', ->
        Nand.and(0b10, 0b10).should.equal( 0b10 );
        Nand.and(0b11, 0b10).should.equal( 0b10 );
        Nand.and(0b10, 0b11).should.equal( 0b10 );
        Nand.and(0b11, 0b11).should.equal( 0b11 );
      it '100, 101', ->
        Nand.and(0b100, 0b101).should.equal( 0b100 );
        Nand.and(0b101, 0b100).should.equal( 0b100 );
        Nand.and(0b100, 0b101).should.equal( 0b100 );
        Nand.and(0b101, 0b101).should.equal( 0b101 );

    # OR =============
    describe '#or()', ->
      it '0, 1', ->
        Nand.or(0, 0).should.equal(0)
        Nand.or(0, 1).should.equal(1)
        Nand.or(1, 0).should.equal(1)
        Nand.or(1, 1).should.equal(1)
      it '10, 11', ->
        Nand.or(0b10, 0b10).should.equal( 0b10 );
        Nand.or(0b11, 0b10).should.equal( 0b11 );
        Nand.or(0b10, 0b11).should.equal( 0b11 );
        Nand.or(0b11, 0b11).should.equal( 0b11 );
      it '100, 101', ->
        Nand.or(0b100, 0b100).should.equal( 0b100 );
        Nand.or(0b101, 0b100).should.equal( 0b101 );
        Nand.or(0b100, 0b101).should.equal( 0b101 );
        Nand.or(0b101, 0b101).should.equal( 0b101 );

    # NAND =============
    describe '#nand()', ->
      it '0, 1', ->
        Nand.nand(0, 0).should.equal(1)
        Nand.nand(0, 1).should.equal(1)
        Nand.nand(1, 0).should.equal(1)
        Nand.nand(1, 1).should.equal(0)
      it '10, 11', ->
        Nand.nand(0b10, 0b10).should.equal( 0b1 );
        Nand.nand(0b11, 0b10).should.equal( 0b1 );
        Nand.nand(0b10, 0b11).should.equal( 0b1 );
        Nand.nand(0b11, 0b11).should.equal( 0b0 );
      it '100, 101', ->
        Nand.nand(0b100, 0b101).should.equal( 0b11 );
        Nand.nand(0b101, 0b100).should.equal( 0b11 );
        Nand.nand(0b100, 0b101).should.equal( 0b11 );
        Nand.nand(0b101, 0b101).should.equal( 0b10 );

    # NOR =============
    describe '#nor()', ->
      it '0, 1', ->
        Nand.nor(0, 0).should.equal(1)
        Nand.nor(0, 1).should.equal(0)
        Nand.nor(1, 0).should.equal(0)
        Nand.nor(1, 1).should.equal(0)
      it '10, 11', ->
        Nand.nor(0b10, 0b10).should.equal( 0b1 );
        Nand.nor(0b11, 0b10).should.equal( 0b0 );
        Nand.nor(0b10, 0b11).should.equal( 0b0 );
        Nand.nor(0b11, 0b11).should.equal( 0b0 );
      it '100, 101', ->
        Nand.nor(0b100, 0b100).should.equal( 0b11 );
        Nand.nor(0b101, 0b100).should.equal( 0b10 );
        Nand.nor(0b100, 0b101).should.equal( 0b10 );
        Nand.nor(0b101, 0b101).should.equal( 0b10 );

    # XOR =============
    describe '#xor()', ->
      it '0, 1', ->
        Nand.xor(0, 0).should.equal(0)
        Nand.xor(0, 1).should.equal(1)
        Nand.xor(1, 0).should.equal(1)
        Nand.xor(1, 1).should.equal(0)
      it '10, 11', ->
        Nand.xor(0b10, 0b10).should.equal( 0b0 );
        Nand.xor(0b11, 0b10).should.equal( 0b1 );
        Nand.xor(0b10, 0b11).should.equal( 0b1 );
        Nand.xor(0b11, 0b11).should.equal( 0b0 );
      it '100, 101', ->
        Nand.xor(0b100, 0b100).should.equal( 0b0 );
        Nand.xor(0b101, 0b100).should.equal( 0b1 );
        Nand.xor(0b100, 0b101).should.equal( 0b1 );
        Nand.xor(0b101, 0b101).should.equal( 0b0 );
