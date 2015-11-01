#!/usr/bin/env mocha

var Nand = require("./nand.js");
var assert = require('assert');

describe("SExp", function(){
  it("new SExp()", function(){
    var e = new Nand.SExp();
    assert.equal('object', typeof e);
    assert.equal('function', typeof e.get);
    assert.equal('function', typeof e.set);
    assert.equal('object', typeof e.list);
    assert.equal(0, e.list.length);
  });

  it("#get()", function(){
    var e = new Nand.SExp();
    assert.equal(null, e.get(0));

    var e2 = new Nand.SExp(["foo","bar"]);
    assert.equal(2, e2.list.length);
    assert.equal("foo", e2.get(0));
    assert.equal("bar", e2.get(1));
  });

  it("#set()", function(){
    var e = new Nand.SExp();
    e.set(0, "a");
    e.set(1, "1");
    e.set(2, "0");
    assert.equal(3, e.list.length);
    assert.equal("a", e.get(0));
    assert.equal("1", e.get(1));
    assert.equal("0", e.get(2));
  });

  it("#add()", function(){
    var e = new Nand.SExp();
    e.add("a");
    e.add("1");
    e.add("0");
    assert.equal(3, e.list.length);
    assert.equal("a", e.get(0));
    assert.equal("1", e.get(1));
    assert.equal("0", e.get(2));
  });
});

describe("#parse()", function(){
  it("and", function(){
    var e = Nand.parse("(and 0 1)")
    assert.equal("and", e.get(0));
    assert.equal("0", e.get(1));
    assert.equal("1", e.get(2));
  });
});

describe("#eval()", function(){
  it("and", function(){
    assert.equal("0", Nand.eval("(and 0 0)"));
    assert.equal("0", Nand.eval("(and 1 0)"));
    assert.equal("0", Nand.eval("(and 0 1)"));
    assert.equal("1", Nand.eval("(and 1 1)"));
  });
});
