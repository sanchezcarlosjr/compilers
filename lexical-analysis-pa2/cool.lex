/*
 * CS164: Spring 2004
 * Programming Assignment 2
 *
 * The scanner definition for Cool.
 *
 */

import java_cup.runtime.Symbol;

%%

/* Code enclosed in %{ %} is copied verbatim to the lexer class definition.
 * All extra variables/methods you want to use in the lexer actions go
 * here.  Don't remove anything that was here initially.  */
%{
    // Max size of string constants
    static int MAX_STR_CONST = 1024;

    // For assembling string constants
    StringBuffer string_buf = new StringBuffer();

    // For line numbers
    private int curr_lineno = 1;
    int get_curr_lineno() {
	return curr_lineno;
    }

    void count_new_line() {
        curr_lineno++;
    }

    private AbstractSymbol filename;

    void set_filename(String fname) {
	filename = AbstractTable.stringtable.addString(fname);
    }

    AbstractSymbol curr_filename() {
	return filename;
    }

    /*
     * Add extra field and methods here.
     */
%}


/*  Code enclosed in %init{ %init} is copied verbatim to the lexer
 *  class constructor, all the extra initialization you want to do should
 *  go here. */
%init{
    // empty for now
%init}

/*  Code enclosed in %eofval{ %eofval} specifies java code that is
 *  executed when end-of-file is reached.  If you use multiple lexical
 *  states and want to do something special if an EOF is encountered in
 *  one of those states, place your code in the switch statement.
 *  Ultimately, you should return the EOF symbol, or your lexer won't
 *  work. */
%eofval{
    return new Symbol(TokenConstants.EOF);
%eofval}

/* Do not modify the following two jlex directives */
%class CoolLexer
%cup
%unicode

/* This defines a new start condition for line comments.
 * .
 * Hint: You might need additional start conditions. */
%state MULTILINE_COMMENT STRING

/* Define lexical rules after the %% separator.  There is some code
 * provided for you that you may wish to use, but you may change it
 * if you like.
 * .
 * Some things you must fill-in (not necessarily a complete list):
 *   + Handle (* *) comments.  These comments should be properly nested.
 *   + Some additional multiple-character operators may be needed.  One
 *     (DARROW) is provided for you.
 *   + Handle strings.  String constants adhere to C syntax and may
 *     contain escape sequences: \c is accepted for all characters c
 *     (except for \n \t \b \f) in which case the result is c.
 * .
 * The complete Cool lexical specification is given in the Cool
 * Reference Manual (CoolAid).  Please be sure to look there. */

LineTerminator = \n
InputCharacter = [^\n]
WhiteSpace = [\s\t\r\f\v\b]
OneLineComment = "--"{InputCharacter}*
TypeId = [:uppercase:] [:jletterdigit:]*
ObjectId = [:lowercase:] [:jletterdigit:]*
Integer = [0-9][0-9]*
%%

// If Initial State lies on Line Terminator, then flex count a new line
<YYINITIAL>{LineTerminator} { count_new_line(); }

// We ignore unuseful symbols for next step.
<YYINITIAL>{WhiteSpace} {}

<YYINITIAL>{OneLineComment} {}


// Start Multiline String State
<YYINITIAL> "(*" {
   yybegin(MULTILINE_COMMENT);
}

// Error state when programmer use *) but (*
<YYINITIAL> "*)" {
   return new Symbol(TokenConstants.ERROR, "Unmatched *)");
}


// REGEX: "(*" (InputCharacter|\n)* "*)" 
<MULTILINE_COMMENT> {
   "*)" {
      yybegin(YYINITIAL);
   }
   {InputCharacter} {}
   <<EOF>>  {
      yybegin(YYINITIAL);
      return new Symbol(TokenConstants.ERROR, "EOF in comment");
   }
   {LineTerminator}  { count_new_line(); }
}

// Start String State
<YYINITIAL>\" {
   string_buf.setLength(0); 
   yybegin(STRING);
}

// "(\n|\t|\r|\|InputCharacter)*"
<STRING> {
  \" {
        yybegin(YYINITIAL);
	if (string_buf.length() > MAX_STR_CONST)
           return new Symbol(TokenConstants.ERROR, "String constant too long");
        return new Symbol(TokenConstants.STR_CONST, AbstractTable.stringtable.addString(string_buf.toString()));
     }
  \P{Letter} { string_buf.append(yytext()); }  // TODO Emojis
  {InputCharacter} { string_buf.append(yytext()); }
  \\t { string_buf.append("\t"); }
  \\n { string_buf.append("\n"); }
  \\b { string_buf.append("\b"); }
  \\f { string_buf.append("\f"); }
  \\r { string_buf.append("\r"); }
  \\0 { string_buf.append("0"); }
   <<EOF>>  {
      yybegin(YYINITIAL);
      return new Symbol(TokenConstants.ERROR, "EOF in string constant");
   }
  \\{LineTerminator} { string_buf.append("\n"); count_new_line(); }
  \\\" { string_buf.append("\""); }   
  {LineTerminator} { 
      yybegin(YYINITIAL);
      count_new_line(); 
      return new Symbol(TokenConstants.ERROR, "Unterminated string constant");
  }
  .                { /*
                    *  This should be the very last rule and will match
                    *  everything not matched by other lexical rules.
                    */
                  return new Symbol(TokenConstants.ERROR, "String contains "+yytext()+" character");
		}
}


<YYINITIAL>{Integer}  {  return new Symbol(TokenConstants.INT_CONST,
					    AbstractTable.inttable.addString(yytext())); }



<<<<<<< HEAD
// Key Words
=======
// Precendence order "=>" is higher than "=". 
>>>>>>> cba64995963fe470ac36c24072e6f551e0790c3b
<YYINITIAL>"=>"		{ return new Symbol(TokenConstants.DARROW); }


<YYINITIAL>[Cc][Aa][Ss][Ee]	{ return new Symbol(TokenConstants.CASE); }
<YYINITIAL>[Cc][Ll][Aa][Ss][Ss] { return new Symbol(TokenConstants.CLASS); }
<YYINITIAL>[Ee][Ll][Ss][Ee]  	{ return new Symbol(TokenConstants.ELSE); }
<YYINITIAL>[Ee][Ss][Aa][Cc]	{ return new Symbol(TokenConstants.ESAC); }
<YYINITIAL>f[Aa][Ll][Ss][Ee]	{ return new Symbol(TokenConstants.BOOL_CONST, Boolean.FALSE); }
<YYINITIAL>[Ff][Ii]             { return new Symbol(TokenConstants.FI); }
<YYINITIAL>[Ii][Ff]  		{ return new Symbol(TokenConstants.IF); }
<YYINITIAL>[Ii][Nn]             { return new Symbol(TokenConstants.IN); }
<YYINITIAL>[Ii][Nn][Hh][Ee][Rr][Ii][Tt][Ss] { return new Symbol(TokenConstants.INHERITS); }
<YYINITIAL>[Ii][Ss][Vv][Oo][Ii][Dd] { return new Symbol(TokenConstants.ISVOID); }
<YYINITIAL>[Ll][Ee][Tt]         { return new Symbol(TokenConstants.LET); }
<YYINITIAL>[Ll][Oo][Oo][Pp]  	{ return new Symbol(TokenConstants.LOOP); }
<YYINITIAL>[Nn][Ee][Ww]		{ return new Symbol(TokenConstants.NEW); }
<YYINITIAL>[Nn][Oo][Tt] 	{ return new Symbol(TokenConstants.NOT); }
<YYINITIAL>[Oo][Ff]		{ return new Symbol(TokenConstants.OF); }
<YYINITIAL>[Pp][Oo][Oo][Ll]  	{ return new Symbol(TokenConstants.POOL); }
<YYINITIAL>[Tt][Hh][Ee][Nn]   	{ return new Symbol(TokenConstants.THEN); }
<YYINITIAL>t[Rr][Uu][Ee]	{ return new Symbol(TokenConstants.BOOL_CONST, Boolean.TRUE); }
<YYINITIAL>[Ww][Hh][Ii][Ll][Ee] { return new Symbol(TokenConstants.WHILE); }






<YYINITIAL>"<-"			{ return new Symbol(TokenConstants.ASSIGN); }
<YYINITIAL>"+"			{ return new Symbol(TokenConstants.PLUS); }
<YYINITIAL>"/"			{ return new Symbol(TokenConstants.DIV); }
<YYINITIAL>"-"			{ return new Symbol(TokenConstants.MINUS); }
<YYINITIAL>"*"			{ return new Symbol(TokenConstants.MULT); }
<YYINITIAL>"="			{ return new Symbol(TokenConstants.EQ); }
<YYINITIAL>"<"			{ return new Symbol(TokenConstants.LT); }
<YYINITIAL>"."			{ return new Symbol(TokenConstants.DOT); }
<YYINITIAL>"~"			{ return new Symbol(TokenConstants.NEG); }
<YYINITIAL>","			{ return new Symbol(TokenConstants.COMMA); }
<YYINITIAL>";"			{ return new Symbol(TokenConstants.SEMI); }
<YYINITIAL>":"			{ return new Symbol(TokenConstants.COLON); }
<YYINITIAL>"("			{ return new Symbol(TokenConstants.LPAREN); }
<YYINITIAL>")"			{ return new Symbol(TokenConstants.RPAREN); }
<YYINITIAL>"@"			{ return new Symbol(TokenConstants.AT); }
<YYINITIAL>"}"			{ return new Symbol(TokenConstants.RBRACE); }
<YYINITIAL>"{"			{ return new Symbol(TokenConstants.LBRACE); }


// Identifiers and types
<YYINITIAL>{ObjectId}			{ return new Symbol(TokenConstants.OBJECTID,
					    AbstractTable.inttable.addString(yytext())); }

<YYINITIAL>{TypeId}			{ return new Symbol(TokenConstants.TYPEID,
					    AbstractTable.inttable.addString(yytext())); }



.                { /*
                    *  This should be the very last rule and will match
                    *  everything not matched by other lexical rules.
                    */
                  return new Symbol(TokenConstants.ERROR, yytext());
		}
