/*
Copyright (c) 2000 The Regents of the University of California.
All rights reserved.

Permission to use, copy, modify, and distribute this software for any
purpose, without fee, and without written agreement is hereby granted,
provided that the above copyright notice and the following two
paragraphs appear in all copies of this software.

IN NO EVENT SHALL THE UNIVERSITY OF CALIFORNIA BE LIABLE TO ANY PARTY FOR
DIRECT, INDIRECT, SPECIAL, INCIDENTAL, OR CONSEQUENTIAL DAMAGES ARISING OUT
OF THE USE OF THIS SOFTWARE AND ITS DOCUMENTATION, EVEN IF THE UNIVERSITY OF
CALIFORNIA HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

THE UNIVERSITY OF CALIFORNIA SPECIFICALLY DISCLAIMS ANY WARRANTIES,
INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY
AND FITNESS FOR A PARTICULAR PURPOSE.  THE SOFTWARE PROVIDED HEREUNDER IS
ON AN "AS IS" BASIS, AND THE UNIVERSITY OF CALIFORNIA HAS NO OBLIGATION TO
PROVIDE MAINTENANCE, SUPPORT, UPDATES, ENHANCEMENTS, OR MODIFICATIONS.
*/

// This is a project skeleton file

import java.io.PrintStream;
import java.util.*;

/**
 * This class may be used to contain the semantic information such as
 * the inheritance graph.  You may use it or not as you like: it is only
 * here to provide a container for the supplied methods.
 */
class ClassTable {
    private final Classes classes;
    private int semanticsErrors;
    private final PrintStream errorStream;
    private final HashMap<String, class_c> tableSymbol = new HashMap<String, class_c>();

    public ClassTable(Classes cls) {
        semanticsErrors = 0;
        errorStream = System.err;
        this.classes = cls;
        this.installBasicClasses();
    }

    // NOT TO BE INCLUDED IN SKELETON
    public static void main(String[] args) {
        new ClassTable(null).installBasicClasses();
    }

    public void buildSymbolTable() {
        for (Enumeration e = this.classes.getElements(); e.hasMoreElements(); ) {
            class_c class_  = (class_c) e.nextElement();
            if(tableSymbol.containsKey(class_.getName().getString())) {
                semantError(class_).println("Class "+ class_.getName().getString() + " was previously defined.");
            } else {
                tableSymbol.put(class_.getName().getString(), class_);
            }
        }
    }
    public void checkThatTheInheritanceGraphIsWellFormed() {
        HashSet<AbstractSymbol> set = new HashSet<>();
        for (Enumeration e = this.classes.getElements(); e.hasMoreElements(); ) {
            class_c class_  = (class_c) e.nextElement();
            if(!set.contains(class_.getName())) {
                bfs(class_, set);
            }
        }
    }

    public void bfs(class_c node,  HashSet<AbstractSymbol> set) {
        while(!Objects.equals(node.getName().getString(), TreeConstants.Object_.getString())) {
            set.add(node.getName());
            if(set.contains(node.getParent())) {
                semantError(node).printf("Class %s, or an ancestor of %s, is involved in an inheritance cycle.%n", node.getName(), node.getName());
                return;
            }
            if (
                    Objects.equals(node.getParent().getString(), TreeConstants.Str.getString()) ||
                            Objects.equals(node.getParent().getString(), TreeConstants.Int.getString()) ||
                            Objects.equals(node.getParent().getString(), TreeConstants.Bool.getString())
            ) {
                semantError(node).printf("Class %s cannot inherit class %s.%n", node.getName().getString(), node.getParent().getString());
                return;
            }
            if (!this.tableSymbol.containsKey(node.getParent().getString())) {
                semantError(node).printf("Class %s inherits from undefined class %s.%n", node.getName().getString(), node.getParent().getString());
                return;
            }
            node = this.tableSymbol.get(node.getParent().getString());
        }
    }

    public void checkMainClass() {
        if (!tableSymbol.containsKey("Main")) {
            AbstractSymbol filename = AbstractTable.stringtable.addString("<basic class>");
            class_c main  = new class_c(0, TreeConstants.Main, TreeConstants.No_class, new Features(0), filename);
            semantError(main).println("Class "+ main.getName().getString() + " is not defined.");
        }
    }

    /**
     * Creates data structures representing basic Cool classes (Object,
     * IO, Int, Bool, String).  Please note: as is this method does not
     * do anything useful; you will need to edit it to make if do what
     * you want.
     */
    private void installBasicClasses() {
        AbstractSymbol filename = AbstractTable.stringtable.addString("<basic class>");

        // The following demonstrates how to create dummy parse trees to
        // refer to basic Cool classes.  There's no need for method
        // bodies -- these are already built into the runtime system.

        // IMPORTANT: The results of the following expressions are
        // stored in local variables.  You will want to do something
        // with those variables at the end of this method to make this
        // code meaningful.

        // The Object class has no parent class. Its methods are
        //        cool_abort() : Object    aborts the program
        //        type_name() : Str        returns a string representation
        //                                 of class name
        //        copy() : SELF_TYPE       returns a copy of the object

        class_c Object_class = new class_c(0, TreeConstants.Object_, TreeConstants.No_class, new Features(0).appendElement(new method(0, TreeConstants.cool_abort, new Formals(0), TreeConstants.Object_, new no_expr(0))).appendElement(new method(0, TreeConstants.type_name, new Formals(0), TreeConstants.Str, new no_expr(0))).appendElement(new method(0, TreeConstants.copy, new Formals(0), TreeConstants.SELF_TYPE, new no_expr(0))), filename);

        // The IO class inherits from Object. Its methods are
        //        out_string(Str) : SELF_TYPE  writes a string to the output
        //        out_int(Int) : SELF_TYPE      "    an int    "  "     "
        //        in_string() : Str            reads a string from the input
        //        in_int() : Int                "   an int     "  "     "

        class_c IO_class = new class_c(0, TreeConstants.IO, TreeConstants.Object_, new Features(0).appendElement(new method(0, TreeConstants.out_string, new Formals(0).appendElement(new formalc(0, TreeConstants.arg, TreeConstants.Str)), TreeConstants.SELF_TYPE, new no_expr(0))).appendElement(new method(0, TreeConstants.out_int, new Formals(0).appendElement(new formalc(0, TreeConstants.arg, TreeConstants.Int)), TreeConstants.SELF_TYPE, new no_expr(0))).appendElement(new method(0, TreeConstants.in_string, new Formals(0), TreeConstants.Str, new no_expr(0))).appendElement(new method(0, TreeConstants.in_int, new Formals(0), TreeConstants.Int, new no_expr(0))), filename);

        // The Int class has no methods and only a single attribute, the
        // "val" for the integer.

        class_c Int_class = new class_c(0, TreeConstants.Int, TreeConstants.Object_, new Features(0).appendElement(new attr(0, TreeConstants.val, TreeConstants.prim_slot, new no_expr(0))), filename);

        // Bool also has only the "val" slot.
        class_c Bool_class = new class_c(0, TreeConstants.Bool, TreeConstants.Object_, new Features(0).appendElement(new attr(0, TreeConstants.val, TreeConstants.prim_slot, new no_expr(0))), filename);

        // The class Str has a number of slots and operations:
        //       val                              the length of the string
        //       str_field                        the string itself
        //       length() : Int                   returns length of the string
        //       concat(arg: Str) : Str           performs string concatenation
        //       substr(arg: Int, arg2: Int): Str substring selection

        class_c Str_class = new class_c(0, TreeConstants.Str, TreeConstants.Object_, new Features(0).appendElement(new attr(0, TreeConstants.val, TreeConstants.Int, new no_expr(0))).appendElement(new attr(0, TreeConstants.str_field, TreeConstants.prim_slot, new no_expr(0))).appendElement(new method(0, TreeConstants.length, new Formals(0), TreeConstants.Int, new no_expr(0))).appendElement(new method(0, TreeConstants.concat, new Formals(0).appendElement(new formalc(0, TreeConstants.arg, TreeConstants.Str)), TreeConstants.Str, new no_expr(0))).appendElement(new method(0, TreeConstants.substr, new Formals(0).appendElement(new formalc(0, TreeConstants.arg, TreeConstants.Int)).appendElement(new formalc(0, TreeConstants.arg2, TreeConstants.Int)), TreeConstants.Str, new no_expr(0))), filename);

	    /* Do something with Object_class, IO_class, Int_class, Bool_class, and Str_class here */

        tableSymbol.put(Str_class.getName().getString(), Str_class);
        tableSymbol.put(Bool_class.getName().getString(), Bool_class);
        tableSymbol.put(Int_class.getName().getString(), Int_class);
        tableSymbol.put(IO_class.getName().getString(), IO_class);
        tableSymbol.put(Object_class.getName().getString(), Object_class);

    }

    /**
     * Prints line number and file name of the given class.
     * <p>
     * Also increments semantic error count.
     *
     * @param c the class
     * @return a print stream to which the rest of the error message is
     * to be printed.
     */
    public PrintStream semantError(class_c c) {
        return semantError(c.getFilename(), c);
    }

    /**
     * Prints the file name and the line number of the given tree node.
     * <p>
     * Also increments semantic error count.
     *
     * @param filename the file name
     * @param t        the tree node
     * @return a print stream to which the rest of the error message is
     * to be printed.
     */
    public PrintStream semantError(AbstractSymbol filename, TreeNode t) {
        errorStream.print(filename + ":" + t.getLineNumber() + ": ");
        return semantError();
    }

    /**
     * Increments semantic error count and returns the print stream for
     * error messages.
     *
     * @return a print stream to which the error message is
     * to be printed.
     */
    public PrintStream semantError() {
        semanticsErrors++;
        return errorStream;
    }

    /**
     * Returns true if there are any static semantic errors.
     */
    public boolean errors() {
        return semanticsErrors != 0;
    }
}
			  
    
