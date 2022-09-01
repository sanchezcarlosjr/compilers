(*
   The class A2I provides integer-to-string and string-to-integer
conversion routines.  To use these routines, either inherit them
in the class where needed, have a dummy variable bound to
something of type A2I, or simpl write (new A2I).method(argument).
*)


(*
   c2i   Converts a 1-character string to an integer.  Aborts
         if the string is not "0" through "9"
*)
class A2I inherits IO {

     c2i(char : String) : Int {
	if char = "0" then 0 else
	if char = "1" then 1 else
	if char = "2" then 2 else
        if char = "3" then 3 else
        if char = "4" then 4 else
        if char = "5" then 5 else
        if char = "6" then 6 else
        if char = "7" then 7 else
        if char = "8" then 8 else
        if char = "9" then 9 else
        { out_string(char.concat(" is not recognized. Each command must be an unique type. \n")); abort();  0; }  -- the 0 is needed to satisfy the typchecker
        fi fi fi fi fi fi fi fi fi fi
     };

(*
   i2c is the inverse of c2i.
*)
     i2c(i : Int) : String {
	if i = 0 then "0" else
	if i = 1 then "1" else
	if i = 2 then "2" else
	if i = 3 then "3" else
	if i = 4 then "4" else
	if i = 5 then "5" else
	if i = 6 then "6" else
	if i = 7 then "7" else
	if i = 8 then "8" else
	if i = 9 then "9" else
	{ abort(); ""; }  -- the "" is needed to satisfy the typchecker
        fi fi fi fi fi fi fi fi fi fi
     };

(*
   a2i converts an ASCII string into an integer.  The empty string
is converted to 0.  Signed and unsigned strings are handled.  The
method aborts if the string does not represent an integer.  Very
long strings of digits produce strange answers because of arithmetic 
overflow.

*)
     a2i(s : String) : Int {
        if s.length() = 0 then 0 else
	if s.substr(0,1) = "-" then ~a2i_aux(s.substr(1,s.length()-1)) else
        if s.substr(0,1) = "+" then a2i_aux(s.substr(1,s.length()-1)) else
           a2i_aux(s)
        fi fi fi
     };

(*
  a2i_aux converts the usigned portion of the string.  As a programming
example, this method is written iteratively.
*)
     a2i_aux(s : String) : Int {
	(let int : Int <- 0 in	
           {	
               (let j : Int <- s.length() in
	          (let i : Int <- 0 in
		    while i < j loop
			{
			    int <- int * 10 + c2i(s.substr(i,1));
			    i <- i + 1;
			}
		    pool
		  )
	       );
              int;
	    }
        )
     };

(*
    i2a converts an integer to a string.  Positive and negative 
numbers are handled correctly.  
*)
    i2a(i : Int) : String {
	if i = 0 then "0" else 
        if 0 < i then i2a_aux(i) else
          "-".concat(i2a_aux(i * ~1)) 
        fi fi
    };
	
(*
    i2a_aux is an example using recursion.
*)		
    i2a_aux(i : Int) : String {
        if i = 0 then "" else 
	    (let next : Int <- i / 10 in
		i2a_aux(next).concat(i2c(i - next * 10))
	    )
        fi
    };

};
(*
 *  This file shows how to implement a list data type for lists of integers.
 *  It makes use of INHERITANCE and DYNAMIC DISPATCH.
 *
 *  The List class has 4 operations defined on List objects. If 'l' is
 *  a list, then the methods dispatched on 'l' have the following effects:
 *
 *    isNil() : Bool		Returns true if 'l' is empty, false otherwise.
 *    head()  : Token		Returns the token at the head of 'l'.
 *				If 'l' is empty, execution aborts.
 *    tail()  : List		Returns the remainder of the 'l',
 *				i.e. without the first element.
 *    cons(i : Token) : List	Return a new list containing i as the
 *				first element, followed by the
 *				elements in 'l'.
 *
 *  There are 2 kinds of lists, the empty list and a non-empty
 *  list. We can think of the non-empty list as a specialization of
 *  the empty list.
 *  The class List defines the operations on empty list. The class
 *  Cons inherits from List and redefines things to handle non-empty
 *  lists.
 *)


class List {
   -- Define operations on empty lists.

   isNil() : Bool { true };

   -- Since abort() has return type Object and head() has return type
   -- Int, we need to have an Int as the result of the method body,
   -- even though abort() never returns.

   head()  : Token { { abort(); (new Token); } };

   -- As for head(), the self is just to make sure the return type of
   -- tail() is correct.

   tail()  : List { { abort(); self; } };

   -- When we cons and element onto the empty list we get a non-empty
   -- list. The (new Cons) expression creates a new list cell of class
   -- Cons, which is initialized by a dispatch to init().
   -- The result of init() is an element of class Cons, but it
   -- conforms to the return type List, because Cons is a subclass of
   -- List.

   cons(i : Token) : List {
      (new Cons).init(i, self)
   };

};


(*
 *  Cons inherits all operations from List. We can reuse only the cons
 *  method though, because adding an element to the front of an emtpy
 *  list is the same as adding it to the front of a non empty
 *  list. All other methods have to be redefined, since the behaviour
 *  for them is different from the empty list.
 *
 *  Cons needs two attributes to hold the integer of this list
 *  cell and to hold the rest of the list.
 *
 *  The init() method is used by the cons() method to initialize the
 *  cell.
 *)

class Cons inherits List {

   car : Token;	-- The element in this list cell

   cdr : List;	-- The rest of the list

   isNil() : Bool { false };

   head()  : Token { car };

   tail()  : List { cdr };

   init(i : Token, rest : List) : List {
      {
	 car <- i;
	 cdr <- rest;
	 self;
      }
   };

};



class StackMachine inherits IO {
  read() : Object {
    let command: String  <- "", token: Token <- (new Token), list: List <- (new List) in {
     while not(token.type_name() = "Stopping") loop {
      out_string("\n>");
      command <- in_string();
      token <- scan(command);
      list <- token.execute(list);
     } pool;
    }
  };
  scan(command: String): Token {
   if command = "+" then (new Plus) else 
   if command = "s" then (new Exchanger) else
   if command = "e" then (new Evaluation) else
   if command = "d" then (new Displaying) else
   if command = "x" then (new Stopping) else
   (new Number).parse(command)
   fi fi fi fi fi  
  };
};

class Main inherits IO {
  main() : Object {
     (new StackMachine).read()
  };
};
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


