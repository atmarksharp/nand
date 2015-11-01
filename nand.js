(function(){
  var app = (typeof window !== 'undefined')? window : global;

  var Nand = {
    'eval': function(code){}
  }

  // DO NOT CHANGE BELOW!!
  if("process" in app){
    module.exports = Nand;
  }
  app["Nand"] = Nand;

})();
