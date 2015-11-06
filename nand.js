(function(){
  var app = (typeof window !== 'undefined')? window: global;

  var Nand = {
    'include': function(){
      app['not'] = this.not;
      app['and'] = this.and;
      app['or'] = this.or;
      app['nand'] = this.nand;
      app['nor'] = this.nor;
      app['xor'] = this.xor;
    },
    'not': function(a){
      if(a===0){
        return 1;
      }else{
        var bitsize = Math.floor(Math.log2(a)) + 1;
        return ~(a) + Math.pow(2,bitsize);
      }
    },
    'and': function(a,b){ return a & b; },
    'or': function(a,b){ return a | b; },
    'nand': function(a,b){ return this.not(this.and(a,b)); },
    'nor': function(a,b){ return this.not(this.or(a,b)); },
    'xor': function(a,b){ return a ^ b >>> 0; }
  };

  if('process' in app){
    module.exports = Nand;
  }
  app['Nand'] = Nand;

})();
