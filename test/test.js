#!/usr/bin/env mocha

var Nand = require("../nand.js");
var assert = require('assert');

describe("Nand.STree.SExpr", function(){
  it("new SExpr()", function(){
    var e = new Nand.STree.SExpr();
    assert.equal('object', typeof e);
    assert.equal('function', typeof e.get);
    assert.equal('function', typeof e.set);
    assert.equal('object', typeof e.list);
    assert.equal(0, e.list.length);
  });

  it("#get()", function(){
    var e = new Nand.STree.SExpr();
    assert.equal(null, e.get(0));

    var e2 = new Nand.STree.SExpr(["foo","bar"]);
    assert.equal(2, e2.list.length);
    assert.equal("foo", e2.get(0));
    assert.equal("bar", e2.get(1));
  });

  it("#set()", function(){
    var e = new Nand.STree.SExpr();
    e.set(0, "a");
    e.set(1, "1");
    e.set(2, "0");
    assert.equal(3, e.list.length);
    assert.equal("a", e.get(0));
    assert.equal("1", e.get(1));
    assert.equal("0", e.get(2));
  });

  it("#add()", function(){
    var e = new Nand.STree.SExpr();
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
    var doc = Nand.parse("(and 0 1)")
    assert.equal(true, doc instanceof Nand.STree.SRoot);

    var e = doc.get(0);
    // console.log(e);
    assert.equal(true, e instanceof Nand.STree.SExpr);
    assert.equal(true, e.get(0) instanceof Nand.STree.Id);
    assert.equal("and", e.get(0).name);
    assert.equal(true, e.get(1) instanceof Nand.STree.Bool);
    assert.equal(0, e.get(1).value);
    assert.equal(true, e.get(2) instanceof Nand.STree.Bool);
    assert.equal(1, e.get(2).value);
  });
});

// describe("#eval()", function(){
//   it("and", function(){
//     assert.equal("0", Nand.eval("(and 0 0)"));
//     assert.equal("0", Nand.eval("(and 1 0)"));
//     assert.equal("0", Nand.eval("(and 0 1)"));
//     assert.equal("1", Nand.eval("(and 1 1)"));
//   });
// });
