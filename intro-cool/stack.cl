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
