(function(){
  var app = (typeof window !== 'undefined')? window : global;

  var Nand = {
    'SExp': function(list){
      this.list = list || [];
    },
    'parse': function(code){

    },
    'eval': function(code){
      var tree = Nand.parse(code);
    }
  }

  Nand.SExp.prototype.get = function(i){
    return this.list[i];
  }
  Nand.SExp.prototype.set = function(i,v){
    return this.list[i] = v;
  }
  Nand.SExp.prototype.add = function(v){
    return this.list.push(v);
  }

  // DO NOT CHANGE BELOW!!
  if("process" in app){
    module.exports = Nand;
  }
  app["Nand"] = Nand;

})();
