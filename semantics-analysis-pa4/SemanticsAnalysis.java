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
import java.util.Enumeration;
import java.util.HashSet;
import java.util.Objects;
import java.util.Optional;

/**
 * This class may be used to contain the semantic information such as
 * the inheritance graph.  You may use it or not as you like: it is only
 * here to provide a container for the supplied methods.
 */
class SemanticsAnalysis {
    private final Classes classes;
    private final PrintStream errorStream;
    private final SymbolTable symbolTable = new SymbolTable();
    private int semanticsErrors;

    private class_c current_class;

    public SemanticsAnalysis(Classes cls) {
        semanticsErrors = 0;
        errorStream = System.err;
        symbolTable.enterScope();
        this.classes = cls;
        this.installBasicClasses();
    }

    public SymbolTable getSymbolTable() {
        return symbolTable;
    }

    public void insertSymbolOnCurrentScope(class_c class_c) {
        if (symbolTable.lookup(class_c.getName()).isPresent()) {
            class_c.error_by_multiple_definitions(semantError(class_c));
            return;
        }
        symbolTable.addId(class_c.getName(), class_c);
    }

    public void buildSymbolTable() {
        this.classes.children().forEach((child) -> {
            current_class = (class_c) child;
            current_class.buildSymbolTable(this);
        });
    }

    public void inferType() {
        this.classes.children().forEach((child) -> {
            current_class = (class_c) child;
            current_class.inferType(this);
        });
    }

    public void checkThatTheInheritanceGraphIsWellFormed() {
        HashSet<AbstractSymbol> set = new HashSet<>();
        for (Enumeration e = this.classes.getElements(); e.hasMoreElements(); ) {
            class_c class_ = (class_c) e.nextElement();
            if (!set.contains(class_.getName())) {
                bfs(class_, set);
            }
        }
    }

    public void bfs(class_c node, HashSet<AbstractSymbol> set) {
        class_c source = node;
        while (!Objects.equals(node.getName(), TreeConstants.Object_)) {
            set.add(node.getName());
            if (Objects.equals(source.name.getString(), node.getParent().getString())) {
                semantError(node).printf("Class %s, or an ancestor of %s, is involved in an inheritance cycle.%n", node.getName(), node.getName());
                return;
            }
            if (set.contains(node.getParent())) {
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
            if (this.symbolTable.lookup(node.getParent()).isEmpty()) {
                semantError(node).printf("Class %s inherits from undefined class %s.%n", node.getName().getString(), node.getParent().getString());
                return;
            }
            node = (class_c) this.symbolTable.lookup(node.getParent()).get();
        }
    }

    public boolean checkEntrypointMethod() {
        Optional<Object> optionalMain = symbolTable.lookup(TreeConstants.Main);
        if (optionalMain.isEmpty()) {
            return false;
        }
        class_c main = (class_c) optionalMain.get();
        if (!main.getFeatures().hasMethod(TreeConstants.main_meth)) {
            semantError(main).printf("No '%s' method in class %s.\n", TreeConstants.main_meth, main.getName());
        }
        return true;
    }

    public void checkEntrypoint() {
        if (checkEntrypointMethod()) {
            return;
        }
        AbstractSymbol filename = AbstractTable.stringtable.addString("<basic class>");
        class_c main = new class_c(0, TreeConstants.Main, TreeConstants.No_class, new Features(0), filename);
        semantError(main).printf("Class %s is not defined.\n", main.getName());
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

        symbolTable.addId(Str_class.getName(), Str_class);
        symbolTable.addId(Bool_class.getName(), Bool_class);
        symbolTable.addId(Int_class.getName(), Int_class);
        symbolTable.addId(IO_class.getName(), IO_class);
        symbolTable.addId(Object_class.getName(), Object_class);

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

    public PrintStream semantError(TreeNode treeNode) {
        return semantError(current_class.getFilename(), treeNode);
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

    public void throwErrorIfThereIsSomeone() {
        if (errors()) {
            System.err.println("Compilation halted due to static semantic errors.");
            System.exit(1);
        }
    }

    // NOT TO BE INCLUDED IN SKELETON
    public static void main(String[] args) {
        new SemanticsAnalysis(null).installBasicClasses();
    }

    public void save(method method) {
        current_class.getFeatures().save(method, this);
    }
    public void save(attr attributes) {
        current_class.getFeatures().save(attributes, this);
    }

    public boolean isPresentInSomeScope(AbstractSymbol type) {
        return this.symbolTable.lookup(type).isPresent();
    }

    public boolean isPresentInCurrentScope(AbstractSymbol type) {
        return this.symbolTable.probe(type).isPresent();
    }

    public void enterScope() {
        this.symbolTable.enterScope();
    }

    public void addIdToCurrentScope(AbstractSymbol abstractSymbol, TreeNode node) {
        this.symbolTable.addId(abstractSymbol, node);
    }

    public void exitScope() {
        this.symbolTable.exitScope();
    }
}
			  
    
