(*
   Tokens by functionality
*)

class Token {
  print(list: List): Object {
    (new IO).out_string("")
  };
  evaluate(list: List): List {
   {
     (new IO).out_string("Stack was evaluated incorrecly.\n");
     abort();
     list;
   }
  };
  ensureValid(list: List): List {
   {
       list <- list.tail();
       if list.isNil() then {evaluate(list); list; } else
       if list.tail().isNil() then {evaluate(list); list; } else 
       list 
       fi fi;
   }
  }; 
  add(token: Token): Token {
   {
     (new IO).out_string("I'm not a number. Probably you're trying to add invalid tokens.\n");
     abort();
     token;
    }
  };
  get(): Int {
    {
     (new IO).out_string("I'm not a number. Probably you're trying to add invalid tokens.\n");
     abort();
     0;
    }
  };
  execute(list: List): List {
    list.cons(self)
  };
};

class Plus inherits Token {
  print(list: List): Object {
      (new IO).out_string("+")
  };
  evaluate(list: List): List {
     {
       list <- ensureValid(list); 
       list.tail().tail().cons(list.tail().head().add(list.head()));
     }
  };
};

class Exchanger inherits Token {
  print(list: List): Object {
      (new IO).out_string("s")
  }; 
  evaluate(list: List): List {
     let token: Token <- (new Token) in {
       list <- ensureValid(list); 
       token <- list.tail().head();
       list.tail().tail().cons(list.head()).cons(token);
     }
  };
};

class Evaluation inherits Token {
  print(list: List): Object {
      (new IO).out_string("e")
  };
  execute(list: List): List {
       list.head().evaluate(list)
  };
};

class Displaying inherits Token { 
  print(list: List): Object {
      if list.isNil() then (new IO).out_string("\n")
                   else {
			   list.head().print(list);
			   (new IO).out_string(" ");
			   print(list.tail());
		        }
      fi
  };
  execute(list: List): List {
    {
       print(list);
       list;
    }
  };
};

class Stopping inherits Token {
  print(list: List): Object {
      (new IO).out_string("x")
  };
};

class Number inherits Token {
  number: Int <- 0;
  atoi: A2I <- new A2I;
  print(list: List): Object {
      (new IO).out_int(number)
  };
  evaluate(list: List): List {
     list
  };
  add(token: Token): Token {
     (new Number).construct(number+token.get())
  };
  get(): Int {
     number
  };
  construct(command: Int): SELF_TYPE {
    {
      number <- command;
      self;
    }
  };
  parse(command: String): SELF_TYPE {
    {
     number <- atoi.a2i(command);
     self;
    }
  };
};


