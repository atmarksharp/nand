(function(){
  // Global
  var app = (typeof window !== 'undefined')? window : global;

  // Nand Class
  var Nand = {
    'STree': {
      'SDoc': function(list){
        this.list = list || [];
        this.type = "SDoc";
      },
      'SExpr': function(list){
        this.list = list || [];
        this.type = "SExpr";
      },
      'LParen': function(){
        this.type = "LParen";
      },
      'Id': function(name){
        this.name = name;
        this.type = "Id";
      },
      'Bool': function(value){
        this.value = value;
        this.type = "Bool";
      },
    },

    'parse': function(code){
      // Filters
      var is_id = function(s){
        var re = /^[a-zA-Z_][a-zA-Z_0-9]*$/;
        return (re.test(s));
      }
      var is_bool = function(c){
        return c === "0" || c === "1";
      }
      var is_blank = function(c){
        return /[\s]/.test(c) || c == "\n" || c == "\r";
      }

      var reg = [];
      var len = code.length;

      // Parsing
      for (var i=0; i < len; ++i){
        var c = code[i];

        if(c === "("){ // LPAREN
          reg.push( new Nand.STree.LParen() );

        }else if(c === ")"){ // RPAREN
          // construct SExpr
          var list = [];
          while(true){
            var last = reg.length-1;
            var e = reg[last];
            if(e instanceof Nand.STree.LParen){
              reg.pop();
              reg.push(new Nand.STree.SExpr(list));
              break;
            }else{
              list.unshift(reg.pop());
            }
          }

        }else if(is_id(c)){ // ID
          var s = c;
          ++i;
          while(i<len && is_id(s+code[i])){
            s += code[i];
            ++i;
          }
          --i;
          reg.push(new Nand.STree.Id(s));

        }else if(is_bool(c)){ // BOOL
          var v = (c=="0")? 0: 1;
          reg.push(new Nand.STree.Bool(v));

        }else if(is_blank(c)){ // BLANK
          continue; //skip
          
        }else{
          return null;
        }
      }
      return new Nand.STree.SDoc(reg); // End of #parse
    },

    'eval': function(code){
      var tree = Nand.parse(code);
    }
  };

  // Methods of STree

  // SExpr
  Nand.STree.SExpr.prototype.get = function(i){
    return this.list[i];
  };
  // SRoot
  Nand.STree.SDoc.prototype.get = function(i){
    return this.list[i];
  };


  // =======================
  //  DO NOT CHANGE BELOW!!
  // =======================

  if("process" in app){
    module.exports = Nand;
  }
  app["Nand"] = Nand;

})();
