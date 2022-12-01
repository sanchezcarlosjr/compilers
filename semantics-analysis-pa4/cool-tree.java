// -*- mode: java -*- 
//
// file: cool-tree.m4
//
// This file defines the AST
//
//////////////////////////////////////////////////////////


import com.sun.source.tree.Tree;

import java.io.PrintStream;
import java.util.*;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicInteger;


/**
 * Defines simple phylum Program
 */
abstract class Program extends TreeNode {
    protected Program(int lineNumber) {
        super(lineNumber);
    }

    public abstract void dump_with_types(PrintStream out, int n);

    public abstract void semant();

}


/**
 * Defines simple phylum Class_
 */
abstract class Class_ extends TreeNode {
    protected Class_(int lineNumber) {
        super(lineNumber);
    }

    public abstract void dump_with_types(PrintStream out, int n);

    public abstract AbstractSymbol getName();

    public abstract AbstractSymbol getParent();

    public abstract AbstractSymbol getFilename();

    public abstract Features getFeatures();

}


/**
 * Defines list phylum Classes
 * <p>
 * See <a href="ListNode.html">ListNode</a> for full documentation.
 */
class Classes extends ListNode {
    public final static Class elementClass = Class_.class;

    protected Classes(int lineNumber, Vector elements) {
        super(lineNumber, elements);
    }

    /**
     * Creates an empty "Classes" list
     */
    public Classes(int lineNumber) {
        super(lineNumber);
    }

    /**
     * Returns class of this lists's elements
     */
    public Class getElementClass() {
        return elementClass;
    }

    /**
     * Appends "Class_" element to this list
     */
    public Classes appendElement(TreeNode elem) {
        addElement(elem);
        return this;
    }

    public TreeNode copy() {
        return new Classes(lineNumber, copyElements());
    }
}


/**
 * Defines simple phylum Feature
 */
abstract class Feature extends TreeNode {
    protected Feature(int lineNumber) {
        super(lineNumber);
    }

    public abstract void dump_with_types(PrintStream out, int n);

    public void buildSymbolTable(SemanticsAnalysis semanticsAnalysis) {
    }
    public abstract AbstractSymbol getName();

    public abstract void error_by_multiple_definitions(PrintStream stream);

    public abstract void inferType(SemanticsAnalysis semanticsAnalysis);
}


/**
 * Defines list phylum Features
 * <p>
 * See <a href="ListNode.html">ListNode</a> for full documentation.
 */
class Features extends ListNode {
    public final static Class elementClass = Feature.class;
    private final Hashtable<AbstractSymbol, method> methods = new Hashtable<>();
    private final Hashtable<AbstractSymbol, attr> attributes = new Hashtable<>();

    protected Features(int lineNumber, Vector<TreeNode> elements) {
        super(lineNumber, elements);
    }

    /**
     * Creates an empty "Features" list
     */
    public Features(int lineNumber) {
        super(lineNumber);
    }

    /**
     * Returns class of this lists's elements
     */
    public Class getElementClass() {
        return elementClass;
    }

    /**
     * Appends "Feature" element to this list
     */
    public Features appendElement(TreeNode elem) {
        addElement(elem);
        return this;
    }

    public TreeNode copy() {
        return new Features(lineNumber, copyElements());
    }
    public void save(method feature, SemanticsAnalysis semanticsAnalysis) {
        if (methods.containsKey(feature.getName())) {
            feature.error_by_multiple_definitions(semanticsAnalysis.semantError(feature));
            return;
        }
        methods.put(feature.getName(), feature);
    }

    public void save(attr feature, SemanticsAnalysis semanticsAnalysis) {
        if (attributes.containsKey(feature.getName())) {
            feature.error_by_multiple_definitions(semanticsAnalysis.semantError(feature));
            return;
        }
        attributes.put(feature.getName(), feature);
    }

    public void buildSymbolTable(SemanticsAnalysis semanticsAnalysis) {
        children().forEach((child) -> {
            ((Feature) child).buildSymbolTable(semanticsAnalysis);
        });
    }
    public boolean hasMethod(AbstractSymbol feature) {
        return this.methods.containsKey(feature);
    }

    public boolean hasAttribute(AbstractSymbol feature) {
        return this.attributes.containsKey(feature);
    }

    public Optional<Feature> probe(AbstractSymbol feature) {
        if (hasAttribute(feature))
            return Optional.of(this.attributes.get(feature));
        if (hasMethod(feature))
            return  Optional.of(methods.get(feature));
        return Optional.empty();
    }

    public void inferType(SemanticsAnalysis semanticsAnalysis) {
        children().forEach((child) -> {
            ((Feature) child).inferType(semanticsAnalysis);
        });
    }

    public boolean hasFeature(AbstractSymbol name) {
        return hasMethod(name) || hasAttribute(name);
    }

}


/**
 * Defines simple phylum Formal
 */
abstract class Formal extends TreeNode {
    protected Formal(int lineNumber) {
        super(lineNumber);
    }

    public abstract void dump_with_types(PrintStream out, int n);

}


/**
 * Defines list phylum Formals
 * <p>
 * See <a href="ListNode.html">ListNode</a> for full documentation.
 */
class Formals extends ListNode {
    public final static Class elementClass = Formal.class;

    protected Formals(int lineNumber, Vector elements) {
        super(lineNumber, elements);
    }

    /**
     * Creates an empty "Formals" list
     */
    public Formals(int lineNumber) {
        super(lineNumber);
    }

    /**
     * Returns class of this lists's elements
     */
    public Class getElementClass() {
        return elementClass;
    }

    /**
     * Appends "Formal" element to this list
     */
    public Formals appendElement(TreeNode elem) {
        addElement(elem);
        return this;
    }

    public TreeNode copy() {
        return new Formals(lineNumber, copyElements());
    }
}


/**
 * Defines simple phylum Expression
 */
abstract class Expression extends TreeNode {
    protected Expression(int lineNumber) {
        super(lineNumber);
    }

    public abstract void dump_with_types(PrintStream out, int n);

    public void dump_type(PrintStream out, int n) {
        if (get_type() != null) {
            out.println(Utilities.pad(n) + ": " + get_type().getString());
        } else {
            out.println(Utilities.pad(n) + ": _no_type");
        }
    }

    public abstract void inferType(SemanticsAnalysis semanticsAnalysis);
}


/**
 * Defines list phylum Expressions
 * <p>
 * See <a href="ListNode.html">ListNode</a> for full documentation.
 */
class Expressions extends ListNode {
    public final static Class elementClass = Expression.class;

    protected Expressions(int lineNumber, Vector elements) {
        super(lineNumber, elements);
    }

    /**
     * Creates an empty "Expressions" list
     */
    public Expressions(int lineNumber) {
        super(lineNumber);
    }

    /**
     * Returns class of this lists's elements
     */
    public Class getElementClass() {
        return elementClass;
    }

    /**
     * Appends "Expression" element to this list
     */
    public Expressions appendElement(TreeNode elem) {
        addElement(elem);
        return this;
    }

    public TreeNode copy() {
        return new Expressions(lineNumber, copyElements());
    }
}


/**
 * Defines simple phylum Case
 */
abstract class Case extends TreeNode {
    protected Case(int lineNumber) {
        super(lineNumber);
    }

    public abstract void dump_with_types(PrintStream out, int n);

}


/**
 * Defines list phylum Cases
 * <p>
 * See <a href="ListNode.html">ListNode</a> for full documentation.
 */
class Cases extends ListNode {
    public final static Class elementClass = Case.class;

    protected Cases(int lineNumber, Vector elements) {
        super(lineNumber, elements);
    }

    /**
     * Creates an empty "Cases" list
     */
    public Cases(int lineNumber) {
        super(lineNumber);
    }

    /**
     * Returns class of this lists's elements
     */
    public Class getElementClass() {
        return elementClass;
    }

    /**
     * Appends "Case" element to this list
     */
    public Cases appendElement(TreeNode elem) {
        addElement(elem);
        return this;
    }

    public TreeNode copy() {
        return new Cases(lineNumber, copyElements());
    }
}


/**
 * Defines AST constructor 'programc'.
 * <p>
 * See <a href="TreeNode.html">TreeNode</a> for full documentation.
 */
class programc extends Program {
    protected Classes classes;

    /**
     * Creates "programc" AST node.
     *
     * @param lineNumber the line in the source file from which this node came.
     * @param a1         initial value for classes
     */
    public programc(int lineNumber, Classes a1) {
        super(lineNumber);
        classes = a1;
    }

    public TreeNode copy() {
        return new programc(lineNumber, (Classes) classes.copy());
    }

    public void dump(PrintStream out, int n) {
        out.print(Utilities.pad(n) + "programc\n");
        classes.dump(out, n + 2);
    }


    public void dump_with_types(PrintStream out, int n) {
        dump_line(out, n);
        out.println(Utilities.pad(n) + "_program");
        for (Enumeration e = classes.getElements(); e.hasMoreElements(); ) {
            ((Class_) e.nextElement()).dump_with_types(out, n + 2);
        }
    }

    /**
     * This method is the entry point to the semantic checker.  You will
     * need to complete it in programming assignment 4.
     * <p>
     * Your checker should do the following two things:
     * <ol>
     * <li>Check that the program is semantically correct
     * <li>Decorate the abstract syntax tree with type information
     * by setting the type field in each Expression node.
     * (see tree.h)
     * </ol>
     * <p>
     * You are free to first do (1) and make sure you catch all semantic
     * errors. Part (2) can be done in a second stage when you want
     * to test the complete compiler.
     */
    public void semant() {
        SemanticsAnalysis semanticsAnalysis = new SemanticsAnalysis(classes);
        /* Semantic analysis. Order is important! */
        semanticsAnalysis.buildSymbolTable();
        semanticsAnalysis.checkThatTheInheritanceGraphIsWellFormed();
        semanticsAnalysis.checkEntrypoint();
        semanticsAnalysis.throwErrorIfThereIsSomeone();
        semanticsAnalysis.inferType();
        semanticsAnalysis.throwErrorIfThereIsSomeone();
    }

}


/**
 * Defines AST constructor 'class_c'.
 * <p>
 * See <a href="TreeNode.html">TreeNode</a> for full documentation.
 */
class class_c extends Class_ {
    protected AbstractSymbol name;
    protected AbstractSymbol parent;
    protected Features features;
    protected AbstractSymbol filename;

    /**
     * Creates "class_c" AST node.
     *
     * @param lineNumber the line in the source file from which this node came.
     * @param a1         initial value for name
     * @param a2         initial value for parent
     * @param a3         initial value for features
     * @param a4         initial value for filename
     */
    public class_c(int lineNumber, AbstractSymbol a1, AbstractSymbol a2, Features a3, AbstractSymbol a4) {
        super(lineNumber);
        name = a1;
        parent = a2;
        features = a3;
        filename = a4;
    }

    public TreeNode copy() {
        return new class_c(lineNumber, copy_AbstractSymbol(name), copy_AbstractSymbol(parent), (Features) features.copy(), copy_AbstractSymbol(filename));
    }

    public void dump(PrintStream out, int n) {
        out.print(Utilities.pad(n) + "class_c\n");
        dump_AbstractSymbol(out, n + 2, name);
        dump_AbstractSymbol(out, n + 2, parent);
        features.dump(out, n + 2);
        dump_AbstractSymbol(out, n + 2, filename);
    }


    public void dump_with_types(PrintStream out, int n) {
        dump_line(out, n);
        out.println(Utilities.pad(n) + "_class");
        dump_AbstractSymbol(out, n + 2, name);
        dump_AbstractSymbol(out, n + 2, parent);
        out.print(Utilities.pad(n + 2) + "\"");
        Utilities.printEscapedString(out, filename.getString());
        out.println("\"\n" + Utilities.pad(n + 2) + "(");
        for (Enumeration e = features.getElements(); e.hasMoreElements(); ) {
            ((Feature) e.nextElement()).dump_with_types(out, n + 2);
        }
        out.println(Utilities.pad(n + 2) + ")");
    }

    public AbstractSymbol getName() {
        return name;
    }

    public AbstractSymbol getParent() {
        return parent;
    }

    public AbstractSymbol getFilename() {
        return filename;
    }

    public Features getFeatures() {
        return features;
    }
    public void buildSymbolTable(SemanticsAnalysis semanticsAnalysis) {
        if (name == TreeConstants.SELF_TYPE) {
            semanticsAnalysis.semantError(this).println("TreeConstants.SELF_TYPE cannot be class name!");
        }
        semanticsAnalysis.insertSymbolOnCurrentScope(this);
        this.features.buildSymbolTable(semanticsAnalysis);
    }
    public void error_by_multiple_definitions(PrintStream stream) {
        stream.printf("Class %s was previously defined.\n", name);
    }

    public void inferType(SemanticsAnalysis semanticsAnalysis) {
        this.features.inferType(semanticsAnalysis);
    }
}


/**
 * Defines AST constructor 'method'.
 * <p>
 * See <a href="TreeNode.html">TreeNode</a> for full documentation.
 */
class method extends Feature {
    protected AbstractSymbol name;
    protected Formals formals;
    protected AbstractSymbol return_type;
    protected Expression expr;

    /**
     * Creates "method" AST node.
     *
     * @param lineNumber the line in the source file from which this node came.
     * @param a1         initial value for name
     * @param a2         initial value for formals
     * @param a2         initial value for return_type
     * @param a3         initial value for expr
     */
    public method(int lineNumber, AbstractSymbol a1, Formals a2, AbstractSymbol a3, Expression a4) {
        super(lineNumber);
        name = a1;
        formals = a2;
        return_type = a3;
        expr = a4;
        set_type(return_type);
    }

    public TreeNode copy() {
        return new method(lineNumber, copy_AbstractSymbol(name), (Formals) formals.copy(), copy_AbstractSymbol(return_type), (Expression) expr.copy());
    }

    public void dump(PrintStream out, int n) {
        out.print(Utilities.pad(n) + "method\n");
        dump_AbstractSymbol(out, n + 2, name);
        formals.dump(out, n + 2);
        dump_AbstractSymbol(out, n + 2, return_type);
        expr.dump(out, n + 2);
    }

    public void buildSymbolTable(SemanticsAnalysis semanticsAnalysis) {
        semanticsAnalysis.save(this);
    }

    public void dump_with_types(PrintStream out, int n) {
        dump_line(out, n);
        out.println(Utilities.pad(n) + "_method");
        dump_AbstractSymbol(out, n + 2, name);
        for (Enumeration e = formals.getElements(); e.hasMoreElements(); ) {
            ((Formal) e.nextElement()).dump_with_types(out, n + 2);
        }
        dump_AbstractSymbol(out, n + 2, return_type);
        expr.dump_with_types(out, n + 2);
    }

    @Override
    public AbstractSymbol getName() {
        return this.name;
    }

    @Override
    public void error_by_multiple_definitions(PrintStream stream) {
        stream.printf("Method %s is multiply defined.\n", name);
    }

    @Override
    public void inferType(SemanticsAnalysis semanticsAnalysis) {
        semanticsAnalysis.enterScope();
        checkFormals(semanticsAnalysis);
        checkReturnType(semanticsAnalysis);
        expr.inferType(semanticsAnalysis);
        if (!semanticsAnalysis.conformance(expr.get_type(),get_type())) {
            semanticsAnalysis.semantError(expr)
                    .printf("Inferred return type %s of method %s does not conform to declared return type %s.\n", expr.get_type(), getName(), get_type());
        }
        semanticsAnalysis.exitScope();
    }

    private void checkReturnType(SemanticsAnalysis semanticsAnalysis) {
        if (!semanticsAnalysis.existsType(this.return_type)) {
            semanticsAnalysis.semantError(this).printf("Undefined return type %s in method %s.\n", this.return_type, this.name);
        }
    }

    private void checkFormals(SemanticsAnalysis semanticsAnalysis) {
        formals.children().forEach((formal) -> {
            formalc formalc = (formalc) formal;
            formalc.checkType(semanticsAnalysis);
            if (semanticsAnalysis.isPresentInCurrentScope(formalc.name)) {
                semanticsAnalysis.semantError(formalc).printf("Formal parameter %s is multiply defined.\n", formalc.name);
            }
            semanticsAnalysis.addIdToCurrentScope(formalc.name, formalc);
        });
    }

    public Optional<AbstractSymbol> checkParams(SemanticsAnalysis semanticsAnalysis, TreeNode node, Expressions params) {
        if (params.getLength() != formals.getLength()) {
            semanticsAnalysis.semantError(node).printf("Method %s invoked with wrong number of arguments.\n", name);
            return Optional.empty();
        }
        AtomicBoolean someError = new AtomicBoolean(false);
        AtomicInteger i = new AtomicInteger();
        params.children().forEach((param) -> {
            ((Expression) param).inferType(semanticsAnalysis);
            formalc formalc = (formalc) formals.getNth(i.get());
            if (!semanticsAnalysis.conformance(param.get_type(), formalc.get_type())) {
                semanticsAnalysis.semantError(node)
                        .printf("In call of method %s, type %s of parameter %s does not conform to declared type %s.\n", name, param.get_type(), formalc.name, formalc.type_decl);
                someError.set(true);
            }
            i.getAndIncrement();
        });
        if (someError.get()) {
            return Optional.empty();
        }
        if (return_type == TreeConstants.SELF_TYPE) {
            return Optional.of(TreeConstants.SELF_TYPE);
        }
        return Optional.of(return_type);
    }
}


/**
 * Defines AST constructor 'attr'.
 * <p>
 * See <a href="TreeNode.html">TreeNode</a> for full documentation.
 */
class attr extends Feature {
    protected AbstractSymbol name;
    protected AbstractSymbol type_decl;
    protected Expression init;

    /**
     * Creates "attr" AST node.
     *
     * @param lineNumber the line in the source file from which this node came.
     * @param a1         initial value for name
     * @param a2         initial value for type_decl
     * @param a2         initial value for init
     */
    public attr(int lineNumber, AbstractSymbol a1, AbstractSymbol a2, Expression a3) {
        super(lineNumber);
        name = a1;
        type_decl = a2;
        init = a3;
        set_type(type_decl);
    }

    public TreeNode copy() {
        return new attr(lineNumber, copy_AbstractSymbol(name), copy_AbstractSymbol(type_decl), (Expression) init.copy());
    }

    public void dump(PrintStream out, int n) {
        out.print(Utilities.pad(n) + "attr\n");
        dump_AbstractSymbol(out, n + 2, name);
        dump_AbstractSymbol(out, n + 2, type_decl);
        init.dump(out, n + 2);
    }

    public void buildSymbolTable(SemanticsAnalysis semanticsAnalysis) {
        semanticsAnalysis.save(this);
    }
    public void dump_with_types(PrintStream out, int n) {
        dump_line(out, n);
        out.println(Utilities.pad(n) + "_attr");
        dump_AbstractSymbol(out, n + 2, name);
        dump_AbstractSymbol(out, n + 2, type_decl);
        init.dump_with_types(out, n + 2);
    }
    @Override
    public AbstractSymbol getName() {
        return this.name;
    }

    @Override
    public void error_by_multiple_definitions(PrintStream stream) {
        stream.printf("Attribute %s is multiply defined in class.\n", name);
    }

    @Override
    public void inferType(SemanticsAnalysis semanticsAnalysis) {
        if (!semanticsAnalysis.existsType(this.get_type())) {
            semanticsAnalysis.semantError(this).printf("Undefined type %s in attribute %s.\n", this.get_type(), this.name);
        }
        init.inferType(semanticsAnalysis);
        if (!semanticsAnalysis.conformance(init.get_type(),get_type())) {
            semanticsAnalysis.semantError(this)
                    .printf("Inferred type %s of initialization of attribute %s does not conform to declared type %s.\n", init.get_type(), getName(), get_type());
        }
    }

}


/**
 * Defines AST constructor 'formalc'.
 * <p>
 * See <a href="TreeNode.html">TreeNode</a> for full documentation.
 */
class formalc extends Formal {
    protected AbstractSymbol name;
    protected AbstractSymbol type_decl;

    /**
     * Creates "formalc" AST node.
     *
     * @param lineNumber the line in the source file from which this node came.
     * @param a1         initial value for name
     * @param a2         initial value for type_decl
     */
    public formalc(int lineNumber, AbstractSymbol a1, AbstractSymbol a2) {
        super(lineNumber);
        name = a1;
        type_decl = a2;
        set_type(type_decl);
    }

    public TreeNode copy() {
        return new formalc(lineNumber, copy_AbstractSymbol(name), copy_AbstractSymbol(type_decl));
    }

    public void dump(PrintStream out, int n) {
        out.print(Utilities.pad(n) + "formalc\n");
        dump_AbstractSymbol(out, n + 2, name);
        dump_AbstractSymbol(out, n + 2, type_decl);
    }


    public void dump_with_types(PrintStream out, int n) {
        dump_line(out, n);
        out.println(Utilities.pad(n) + "_formal");
        dump_AbstractSymbol(out, n + 2, name);
        dump_AbstractSymbol(out, n + 2, type_decl);
    }

    public void checkType(SemanticsAnalysis semanticsAnalysis) {
        if (type_decl == TreeConstants.SELF_TYPE) {
            semanticsAnalysis.semantError(this).printf("Formal parameter %s cannot have type TreeConstants.SELF_TYPE.\n", name);
            return;
        }
        if (!semanticsAnalysis.existsType(this.get_type())) {
            semanticsAnalysis.semantError(this).printf("Class %s of formal parameter %s is undefined.\n", this.get_type(), this.name);
        }
    }
}


/**
 * Defines AST constructor 'branch'.
 * <p>
 * See <a href="TreeNode.html">TreeNode</a> for full documentation.
 */
class branch extends Case {
    protected AbstractSymbol name;
    protected AbstractSymbol type_decl;
    protected Expression expr;

    /**
     * Creates "branch" AST node.
     *
     * @param lineNumber the line in the source file from which this node came.
     * @param a1         initial value for name
     * @param a2         initial value for type_decl
     * @param a2         initial value for expr
     */
    public branch(int lineNumber, AbstractSymbol a1, AbstractSymbol a2, Expression a3) {
        super(lineNumber);
        name = a1;
        type_decl = a2;
        expr = a3;
        set_type(type_decl);
    }

    public TreeNode copy() {
        return new branch(lineNumber, copy_AbstractSymbol(name), copy_AbstractSymbol(type_decl), (Expression) expr.copy());
    }

    public void dump(PrintStream out, int n) {
        out.print(Utilities.pad(n) + "branch\n");
        dump_AbstractSymbol(out, n + 2, name);
        dump_AbstractSymbol(out, n + 2, type_decl);
        expr.dump(out, n + 2);
    }


    public void dump_with_types(PrintStream out, int n) {
        dump_line(out, n);
        out.println(Utilities.pad(n) + "_branch");
        dump_AbstractSymbol(out, n + 2, name);
        dump_AbstractSymbol(out, n + 2, type_decl);
        expr.dump_with_types(out, n + 2);
    }

}


/**
 * Defines AST constructor 'assign'.
 * <p>
 * See <a href="TreeNode.html">TreeNode</a> for full documentation.
 */
class assign extends Expression {
    protected AbstractSymbol name;
    protected Expression expr;

    /**
     * Creates "assign" AST node.
     *
     * @param lineNumber the line in the source file from which this node came.
     * @param a1         initial value for name
     * @param a2         initial value for expr
     */
    public assign(int lineNumber, AbstractSymbol a1, Expression a2) {
        super(lineNumber);
        name = a1;
        expr = a2;
    }

    public TreeNode copy() {
        return new assign(lineNumber, copy_AbstractSymbol(name), (Expression) expr.copy());
    }

    public void dump(PrintStream out, int n) {
        out.print(Utilities.pad(n) + "assign\n");
        dump_AbstractSymbol(out, n + 2, name);
        expr.dump(out, n + 2);
    }


    public void dump_with_types(PrintStream out, int n) {
        dump_line(out, n);
        out.println(Utilities.pad(n) + "_assign");
        dump_AbstractSymbol(out, n + 2, name);
        expr.dump_with_types(out, n + 2);
        dump_type(out, n);
    }

    @Override
    public void inferType(SemanticsAnalysis semanticsAnalysis) {
        Optional<AbstractSymbol> type = semanticsAnalysis.lookupType(name);
        if(type.isEmpty()) {
            semanticsAnalysis.semantError(this).printf("Undeclared identifier %s.\n", name);
        }
        set_type(type.get());
        expr.inferType(semanticsAnalysis);
        if (!semanticsAnalysis.conformance(expr.get_type(),get_type())) {
            semanticsAnalysis.semantError(this)
                    .printf("Inferred type %s of initialization of attribute %s does not conform to declared type %s.\n", expr.get_type(), name, get_type());
        }
    }

}


/**
 * Defines AST constructor 'static_dispatch'.
 * <p>
 * See <a href="TreeNode.html">TreeNode</a> for full documentation.
 */
class static_dispatch extends Expression {
    protected Expression expr;
    protected AbstractSymbol type_name;
    protected AbstractSymbol method_name;
    protected Expressions params;

    /**
     * Creates "static_dispatch" AST node.
     *
     * @param lineNumber the line in the source file from which this node came.
     * @param a1         initial value for expr
     * @param a2         initial value for type_name
     * @param a3         initial value for name
     * @param a4         initial value for params
     */
    public static_dispatch(int lineNumber, Expression a1, AbstractSymbol a2, AbstractSymbol a3, Expressions a4) {
        super(lineNumber);
        expr = a1;
        type_name = a2;
        method_name = a3;
        params = a4;
    }

    public TreeNode copy() {
        return new static_dispatch(lineNumber, (Expression) expr.copy(), copy_AbstractSymbol(type_name), copy_AbstractSymbol(method_name), (Expressions) params.copy());
    }

    public void dump(PrintStream out, int n) {
        out.print(Utilities.pad(n) + "static_dispatch\n");
        expr.dump(out, n + 2);
        dump_AbstractSymbol(out, n + 2, type_name);
        dump_AbstractSymbol(out, n + 2, method_name);
        params.dump(out, n + 2);
    }


    public void dump_with_types(PrintStream out, int n) {
        dump_line(out, n);
        out.println(Utilities.pad(n) + "_static_dispatch");
        expr.dump_with_types(out, n + 2);
        dump_AbstractSymbol(out, n + 2, type_name);
        dump_AbstractSymbol(out, n + 2, method_name);
        out.println(Utilities.pad(n + 2) + "(");
        for (Enumeration e = params.getElements(); e.hasMoreElements(); ) {
            ((Expression) e.nextElement()).dump_with_types(out, n + 2);
        }
        out.println(Utilities.pad(n + 2) + ")");
        dump_type(out, n);
    }

    @Override
    public void inferType(SemanticsAnalysis semanticsAnalysis) {
        if (!semanticsAnalysis.existsTypeButNotSelfType(type_name)) {
            semanticsAnalysis.semantError(this)
                    .printf("Static dispatch to undefined class %s.\n", type_name);
            return;
        }
        if (type_name == TreeConstants.SELF_TYPE) {
            semanticsAnalysis.semantError(this).println("Static dispatch to TreeConstants.SELF_TYPE.");
            return;
        }
        expr.inferType(semanticsAnalysis);
        if(!semanticsAnalysis.conformance(expr.get_type(), type_name))
            semanticsAnalysis.semantError(this)
                    .printf("Expression type %s does not conform to declared static dispatch type %s.\n", expr.get_type(), type_name);
        class_c class_c = semanticsAnalysis.findType(type_name);
        Optional<method> method = semanticsAnalysis.lookupMethod(class_c, method_name);
        if (method.isEmpty()) {
            semanticsAnalysis.semantError(this).printf("Static dispatch to undefined method %s.\n", method_name);
            return;
        }
        Optional<AbstractSymbol> symbol = method.get().checkParams(semanticsAnalysis, this, params);
        if (symbol.isEmpty()) {
            return;
        }
        if (symbol.get() == TreeConstants.SELF_TYPE) {
            set_type(expr.get_type());
            return;
        }
        set_type(symbol.get());
    }
}


/**
 * Defines AST constructor 'dispatch'.
 * <p>
 * See <a href="TreeNode.html">TreeNode</a> for full documentation.
 */
class dispatch extends Expression {
    protected Expression expr;
    protected AbstractSymbol method_name;
    protected Expressions params;

    /**
     * Creates "dispatch" AST node.
     *
     * @param lineNumber the line in the source file from which this node came.
     * @param a1         initial value for expr
     * @param a2         initial value for name
     * @param a2         initial value for actual
     */
    public dispatch(int lineNumber, Expression a1, AbstractSymbol a2, Expressions a3) {
        super(lineNumber);
        expr = a1;
        method_name = a2;
        params = a3;
    }

    public TreeNode copy() {
        return new dispatch(lineNumber, (Expression) expr.copy(), copy_AbstractSymbol(method_name), (Expressions) params.copy());
    }

    public void dump(PrintStream out, int n) {
        out.print(Utilities.pad(n) + "dispatch\n");
        expr.dump(out, n + 2);
        dump_AbstractSymbol(out, n + 2, method_name);
        params.dump(out, n + 2);
    }


    public void dump_with_types(PrintStream out, int n) {
        dump_line(out, n);
        out.println(Utilities.pad(n) + "_dispatch");
        expr.dump_with_types(out, n + 2);
        dump_AbstractSymbol(out, n + 2, method_name);
        out.println(Utilities.pad(n + 2) + "(");
        for (Enumeration e = params.getElements(); e.hasMoreElements(); ) {
            ((Expression) e.nextElement()).dump_with_types(out, n + 2);
        }
        out.println(Utilities.pad(n + 2) + ")");
        dump_type(out, n);
    }

    @Override
    public void inferType(SemanticsAnalysis semanticsAnalysis) {
        expr.inferType(semanticsAnalysis);
        if (!semanticsAnalysis.existsType(expr.get_type()))
            return;
        Optional<method> method = semanticsAnalysis.lookupMethod(semanticsAnalysis.findType(expr.get_type()), method_name);
        if (method.isEmpty()) {
            semanticsAnalysis.semantError(this).printf("Dispatch to undefined method %s.\n", method_name);
            return;
        }
        Optional<AbstractSymbol> symbol = method.get().checkParams(semanticsAnalysis, this, params);
        if (symbol.isEmpty()) {
            return;
        }
        if (symbol.get() == TreeConstants.SELF_TYPE) {
            set_type(expr.get_type());
            return;
        }
        set_type(symbol.get());
    }

}


/**
 * Defines AST constructor 'cond'.
 * <p>
 * See <a href="TreeNode.html">TreeNode</a> for full documentation.
 */
class cond extends Expression {
    protected Expression pred;
    protected Expression then_exp;
    protected Expression else_exp;

    /**
     * Creates "cond" AST node.
     *
     * @param lineNumber the line in the source file from which this node came.
     * @param a1         initial value for pred
     * @param a2         initial value for then_exp
     * @param a2         initial value for else_exp
     */
    public cond(int lineNumber, Expression a1, Expression a2, Expression a3) {
        super(lineNumber);
        pred = a1;
        then_exp = a2;
        else_exp = a3;
    }

    public TreeNode copy() {
        return new cond(lineNumber, (Expression) pred.copy(), (Expression) then_exp.copy(), (Expression) else_exp.copy());
    }

    public void dump(PrintStream out, int n) {
        out.print(Utilities.pad(n) + "cond\n");
        pred.dump(out, n + 2);
        then_exp.dump(out, n + 2);
        else_exp.dump(out, n + 2);
    }


    public void dump_with_types(PrintStream out, int n) {
        dump_line(out, n);
        out.println(Utilities.pad(n) + "_cond");
        pred.dump_with_types(out, n + 2);
        then_exp.dump_with_types(out, n + 2);
        else_exp.dump_with_types(out, n + 2);
        dump_type(out, n);
    }

    @Override
    public void inferType(SemanticsAnalysis semanticsAnalysis) {

    }

}


/**
 * Defines AST constructor 'loop'.
 * <p>
 * See <a href="TreeNode.html">TreeNode</a> for full documentation.
 */
class loop extends Expression {
    protected Expression predicate;
    protected Expression body;

    /**
     * Creates "loop" AST node.
     *
     * @param lineNumber the line in the source file from which this node came.
     * @param a1         initial value for pred
     * @param a2         initial value for body
     */
    public loop(int lineNumber, Expression a1, Expression a2) {
        super(lineNumber);
        predicate = a1;
        body = a2;
    }

    public TreeNode copy() {
        return new loop(lineNumber, (Expression) predicate.copy(), (Expression) body.copy());
    }

    public void dump(PrintStream out, int n) {
        out.print(Utilities.pad(n) + "loop\n");
        predicate.dump(out, n + 2);
        body.dump(out, n + 2);
    }


    public void dump_with_types(PrintStream out, int n) {
        dump_line(out, n);
        out.println(Utilities.pad(n) + "_loop");
        predicate.dump_with_types(out, n + 2);
        body.dump_with_types(out, n + 2);
        dump_type(out, n);
    }

    @Override
    public void inferType(SemanticsAnalysis semanticsAnalysis) {
        predicate.inferType(semanticsAnalysis);
        if (predicate.get_type() != TreeConstants.Bool) {
            semanticsAnalysis.semantError(this).println("Loop condition does not have type Bool.");
        }
        body.inferType(semanticsAnalysis);
        set_type(TreeConstants.Object_);
    }

}


/**
 * Defines AST constructor 'typcase'.
 * <p>
 * See <a href="TreeNode.html">TreeNode</a> for full documentation.
 */
class typcase extends Expression {
    protected Expression expr;
    protected Cases cases;

    /**
     * Creates "typcase" AST node.
     *
     * @param lineNumber the line in the source file from which this node came.
     * @param a1         initial value for expr
     * @param a2         initial value for cases
     */
    public typcase(int lineNumber, Expression a1, Cases a2) {
        super(lineNumber);
        expr = a1;
        cases = a2;
    }

    public TreeNode copy() {
        return new typcase(lineNumber, (Expression) expr.copy(), (Cases) cases.copy());
    }

    public void dump(PrintStream out, int n) {
        out.print(Utilities.pad(n) + "typcase\n");
        expr.dump(out, n + 2);
        cases.dump(out, n + 2);
    }


    public void dump_with_types(PrintStream out, int n) {
        dump_line(out, n);
        out.println(Utilities.pad(n) + "_typcase");
        expr.dump_with_types(out, n + 2);
        for (Enumeration e = cases.getElements(); e.hasMoreElements(); ) {
            ((Case) e.nextElement()).dump_with_types(out, n + 2);
        }
        dump_type(out, n);
    }

    @Override
    public void inferType(SemanticsAnalysis semanticsAnalysis) {

    }

}


/**
 * Defines AST constructor 'block'.
 * <p>
 * See <a href="TreeNode.html">TreeNode</a> for full documentation.
 */
class block extends Expression {
    protected Expressions body;

    /**
     * Creates "block" AST node.
     *
     * @param lineNumber the line in the source file from which this node came.
     * @param a1         initial value for body
     */
    public block(int lineNumber, Expressions a1) {
        super(lineNumber);
        body = a1;
    }

    public TreeNode copy() {
        return new block(lineNumber, (Expressions) body.copy());
    }

    public void dump(PrintStream out, int n) {
        out.print(Utilities.pad(n) + "block\n");
        body.dump(out, n + 2);
    }


    public void dump_with_types(PrintStream out, int n) {
        dump_line(out, n);
        out.println(Utilities.pad(n) + "_block");
        for (Enumeration e = body.getElements(); e.hasMoreElements(); ) {
            ((Expression) e.nextElement()).dump_with_types(out, n + 2);
        }
        dump_type(out, n);
    }

    @Override
    public void inferType(SemanticsAnalysis semanticsAnalysis) {

    }

}


/**
 * Defines AST constructor 'let'.
 * <p>
 * See <a href="TreeNode.html">TreeNode</a> for full documentation.
 */
class let extends Expression {
    protected AbstractSymbol identifier;
    protected AbstractSymbol type_decl;
    protected Expression init;
    protected Expression body;

    /**
     * Creates "let" AST node.
     *
     * @param lineNumber the line in the source file from which this node came.
     * @param a1         initial value for identifier
     * @param a2         initial value for type_decl
     * @param a2         initial value for init
     * @param a3         initial value for body
     */
    public let(int lineNumber, AbstractSymbol a1, AbstractSymbol a2, Expression a3, Expression a4) {
        super(lineNumber);
        identifier = a1;
        type_decl = a2;
        init = a3;
        body = a4;
    }

    public TreeNode copy() {
        return new let(lineNumber, copy_AbstractSymbol(identifier), copy_AbstractSymbol(type_decl), (Expression) init.copy(), (Expression) body.copy());
    }

    public void dump(PrintStream out, int n) {
        out.print(Utilities.pad(n) + "let\n");
        dump_AbstractSymbol(out, n + 2, identifier);
        dump_AbstractSymbol(out, n + 2, type_decl);
        init.dump(out, n + 2);
        body.dump(out, n + 2);
    }


    public void dump_with_types(PrintStream out, int n) {
        dump_line(out, n);
        out.println(Utilities.pad(n) + "_let");
        dump_AbstractSymbol(out, n + 2, identifier);
        dump_AbstractSymbol(out, n + 2, type_decl);
        init.dump_with_types(out, n + 2);
        body.dump_with_types(out, n + 2);
        dump_type(out, n);
    }

    @Override
    public void inferType(SemanticsAnalysis semanticsAnalysis) {

    }

}
abstract class Operator extends  Expression {
    protected Expression e1;
    protected Expression e2;
    protected String operator;

    public Operator(int lineNumber, Expression a1, Expression a2, String op) {
        super(lineNumber);
        e1 = a1;
        e2 = a2;
        operator = op;
    }

    @Override
    public void inferType(SemanticsAnalysis semanticsAnalysis) {
        e1.inferType(semanticsAnalysis);
        e2.inferType(semanticsAnalysis);
        if (e1.get_type() != TreeConstants.Int) {
            semanticsAnalysis.semantError(this).printf("Non-TreeConstants.Int arguments: %s %s %s.\n", e1.get_type(), operator, e2.get_type());
        }
        set_type(TreeConstants.Int);
    }
}

/**
 * Defines AST constructor 'plus'.
 * <p>
 * See <a href="TreeNode.html">TreeNode</a> for full documentation.
 */
class plus extends Operator {
    /**
     * Creates "plus" AST node.
     *
     * @param lineNumber the line in the source file from which this node came.
     * @param a1         initial value for e1
     * @param a1         initial value for e2
     */
    public plus(int lineNumber, Expression a1, Expression a2) {
        super(lineNumber, a1, a2, "+");
    }

    public TreeNode copy() {
        return new plus(lineNumber, (Expression) e1.copy(), (Expression) e2.copy());
    }

    public void dump(PrintStream out, int n) {
        out.print(Utilities.pad(n) + "plus\n");
        e1.dump(out, n + 2);
        e2.dump(out, n + 2);
    }


    public void dump_with_types(PrintStream out, int n) {
        dump_line(out, n);
        out.println(Utilities.pad(n) + "_plus");
        e1.dump_with_types(out, n + 2);
        e2.dump_with_types(out, n + 2);
        dump_type(out, n);
    }
}


/**
 * Defines AST constructor 'sub'.
 * <p>
 * See <a href="TreeNode.html">TreeNode</a> for full documentation.
 */
class sub extends Operator {
    /**
     * Creates "sub" AST node.
     *
     * @param lineNumber the line in the source file from which this node came.
     * @param a1         initial value for e1
     * @param a1         initial value for e2
     */
    public sub(int lineNumber, Expression a1, Expression a2) {
        super(lineNumber, a1, a2, "-");
    }

    public TreeNode copy() {
        return new sub(lineNumber, (Expression) e1.copy(), (Expression) e2.copy());
    }

    public void dump(PrintStream out, int n) {
        out.print(Utilities.pad(n) + "sub\n");
        e1.dump(out, n + 2);
        e2.dump(out, n + 2);
    }


    public void dump_with_types(PrintStream out, int n) {
        dump_line(out, n);
        out.println(Utilities.pad(n) + "_sub");
        e1.dump_with_types(out, n + 2);
        e2.dump_with_types(out, n + 2);
        dump_type(out, n);
    }
}


/**
 * Defines AST constructor 'mul'.
 * <p>
 * See <a href="TreeNode.html">TreeNode</a> for full documentation.
 */
class mul extends Operator {
    /**
     * Creates "mul" AST node.
     *
     * @param lineNumber the line in the source file from which this node came.
     * @param a1         initial value for e1
     * @param a1         initial value for e2
     */
    public mul(int lineNumber, Expression a1, Expression a2) {
        super(lineNumber, a1, a2, "*");
    }

    public TreeNode copy() {
        return new mul(lineNumber, (Expression) e1.copy(), (Expression) e2.copy());
    }

    public void dump(PrintStream out, int n) {
        out.print(Utilities.pad(n) + "mul\n");
        e1.dump(out, n + 2);
        e2.dump(out, n + 2);
    }


    public void dump_with_types(PrintStream out, int n) {
        dump_line(out, n);
        out.println(Utilities.pad(n) + "_mul");
        e1.dump_with_types(out, n + 2);
        e2.dump_with_types(out, n + 2);
        dump_type(out, n);
    }

}


/**
 * Defines AST constructor 'divide'.
 * <p>
 * See <a href="TreeNode.html">TreeNode</a> for full documentation.
 */
class divide extends Operator {
    /**
     * Creates "divide" AST node.
     *
     * @param lineNumber the line in the source file from which this node came.
     * @param a1         initial value for e1
     * @param a1         initial value for e2
     */
    public divide(int lineNumber, Expression a1, Expression a2) {
        super(lineNumber, a1, a2, "/");
    }

    public TreeNode copy() {
        return new divide(lineNumber, (Expression) e1.copy(), (Expression) e2.copy());
    }

    public void dump(PrintStream out, int n) {
        out.print(Utilities.pad(n) + "divide\n");
        e1.dump(out, n + 2);
        e2.dump(out, n + 2);
    }


    public void dump_with_types(PrintStream out, int n) {
        dump_line(out, n);
        out.println(Utilities.pad(n) + "_divide");
        e1.dump_with_types(out, n + 2);
        e2.dump_with_types(out, n + 2);
        dump_type(out, n);
    }
}


/**
 * Defines AST constructor 'neg'.
 * <p>
 * See <a href="TreeNode.html">TreeNode</a> for full documentation.
 */
class neg extends Expression {
    protected Expression e1;

    /**
     * Creates "neg" AST node.
     *
     * @param lineNumber the line in the source file from which this node came.
     * @param a1         initial value for e1
     */
    public neg(int lineNumber, Expression a1) {
        super(lineNumber);
        e1 = a1;
    }

    public TreeNode copy() {
        return new neg(lineNumber, (Expression) e1.copy());
    }

    public void dump(PrintStream out, int n) {
        out.print(Utilities.pad(n) + "neg\n");
        e1.dump(out, n + 2);
    }


    public void dump_with_types(PrintStream out, int n) {
        dump_line(out, n);
        out.println(Utilities.pad(n) + "_neg");
        e1.dump_with_types(out, n + 2);
        dump_type(out, n);
    }

    @Override
    public void inferType(SemanticsAnalysis semanticsAnalysis) {
        e1.inferType(semanticsAnalysis);
        if (e1.get_type() != TreeConstants.Int)
            semanticsAnalysis.semantError(e1).printf("");
        set_type(TreeConstants.Int);
    }

}


/**
 * Defines AST constructor 'lt'.
 * <p>
 * See <a href="TreeNode.html">TreeNode</a> for full documentation.
 */
class lt extends Expression {
    protected Expression e1;
    protected Expression e2;

    /**
     * Creates "lt" AST node.
     *
     * @param lineNumber the line in the source file from which this node came.
     * @param a1         initial value for e1
     * @param a1         initial value for e2
     */
    public lt(int lineNumber, Expression a1, Expression a2) {
        super(lineNumber);
        e1 = a1;
        e2 = a2;
    }

    public TreeNode copy() {
        return new lt(lineNumber, (Expression) e1.copy(), (Expression) e2.copy());
    }

    public void dump(PrintStream out, int n) {
        out.print(Utilities.pad(n) + "lt\n");
        e1.dump(out, n + 2);
        e2.dump(out, n + 2);
    }


    public void dump_with_types(PrintStream out, int n) {
        dump_line(out, n);
        out.println(Utilities.pad(n) + "_lt");
        e1.dump_with_types(out, n + 2);
        e2.dump_with_types(out, n + 2);
        dump_type(out, n);
    }

    @Override
    public void inferType(SemanticsAnalysis semanticsAnalysis) {

    }

}


/**
 * Defines AST constructor 'eq'.
 * <p>
 * See <a href="TreeNode.html">TreeNode</a> for full documentation.
 */
class eq extends Expression {
    protected Expression e1;
    protected Expression e2;

    /**
     * Creates "eq" AST node.
     *
     * @param lineNumber the line in the source file from which this node came.
     * @param a1         initial value for e1
     * @param a1         initial value for e2
     */
    public eq(int lineNumber, Expression a1, Expression a2) {
        super(lineNumber);
        e1 = a1;
        e2 = a2;
    }

    public TreeNode copy() {
        return new eq(lineNumber, (Expression) e1.copy(), (Expression) e2.copy());
    }

    public void dump(PrintStream out, int n) {
        out.print(Utilities.pad(n) + "eq\n");
        e1.dump(out, n + 2);
        e2.dump(out, n + 2);
    }


    public void dump_with_types(PrintStream out, int n) {
        dump_line(out, n);
        out.println(Utilities.pad(n) + "_eq");
        e1.dump_with_types(out, n + 2);
        e2.dump_with_types(out, n + 2);
        dump_type(out, n);
    }

    @Override
    public void inferType(SemanticsAnalysis semanticsAnalysis) {

    }

}


/**
 * Defines AST constructor 'leq'.
 * <p>
 * See <a href="TreeNode.html">TreeNode</a> for full documentation.
 */
class leq extends Expression {
    protected Expression e1;
    protected Expression e2;

    /**
     * Creates "leq" AST node.
     *
     * @param lineNumber the line in the source file from which this node came.
     * @param a1         initial value for e1
     * @param a1         initial value for e2
     */
    public leq(int lineNumber, Expression a1, Expression a2) {
        super(lineNumber);
        e1 = a1;
        e2 = a2;
    }

    public TreeNode copy() {
        return new leq(lineNumber, (Expression) e1.copy(), (Expression) e2.copy());
    }

    public void dump(PrintStream out, int n) {
        out.print(Utilities.pad(n) + "leq\n");
        e1.dump(out, n + 2);
        e2.dump(out, n + 2);
    }


    public void dump_with_types(PrintStream out, int n) {
        dump_line(out, n);
        out.println(Utilities.pad(n) + "_leq");
        e1.dump_with_types(out, n + 2);
        e2.dump_with_types(out, n + 2);
        dump_type(out, n);
    }

    @Override
    public void inferType(SemanticsAnalysis semanticsAnalysis) {

    }

}


/**
 * Defines AST constructor 'comp'.
 * <p>
 * See <a href="TreeNode.html">TreeNode</a> for full documentation.
 */
class comp extends Expression {
    protected Expression e1;

    /**
     * Creates "comp" AST node.
     *
     * @param lineNumber the line in the source file from which this node came.
     * @param a1         initial value for e1
     */
    public comp(int lineNumber, Expression a1) {
        super(lineNumber);
        e1 = a1;
    }

    public TreeNode copy() {
        return new comp(lineNumber, (Expression) e1.copy());
    }

    public void dump(PrintStream out, int n) {
        out.print(Utilities.pad(n) + "comp\n");
        e1.dump(out, n + 2);
    }


    public void dump_with_types(PrintStream out, int n) {
        dump_line(out, n);
        out.println(Utilities.pad(n) + "_comp");
        e1.dump_with_types(out, n + 2);
        dump_type(out, n);
    }

    @Override
    public void inferType(SemanticsAnalysis semanticsAnalysis) {

    }

}


/**
 * Defines AST constructor 'int_const'.
 * <p>
 * See <a href="TreeNode.html">TreeNode</a> for full documentation.
 */
class int_const extends Expression {
    protected AbstractSymbol token;

    /**
     * Creates "int_const" AST node.
     *
     * @param lineNumber the line in the source file from which this node came.
     * @param a1         initial value for token
     */
    public int_const(int lineNumber, AbstractSymbol a1) {
        super(lineNumber);
        token = a1;
    }

    public TreeNode copy() {
        return new int_const(lineNumber, copy_AbstractSymbol(token));
    }

    public void dump(PrintStream out, int n) {
        out.print(Utilities.pad(n) + "int_const\n");
        dump_AbstractSymbol(out, n + 2, token);
    }


    public void dump_with_types(PrintStream out, int n) {
        dump_line(out, n);
        out.println(Utilities.pad(n) + "_int");
        dump_AbstractSymbol(out, n + 2, token);
        dump_type(out, n);
    }

    @Override
    public void inferType(SemanticsAnalysis semanticsAnalysis) {
       this.set_type(TreeConstants.Int);
    }

}


/**
 * Defines AST constructor 'bool_const'.
 * <p>
 * See <a href="TreeNode.html">TreeNode</a> for full documentation.
 */
class bool_const extends Expression {
    protected Boolean val;

    /**
     * Creates "bool_const" AST node.
     *
     * @param lineNumber the line in the source file from which this node came.
     * @param a1         initial value for val
     */
    public bool_const(int lineNumber, Boolean a1) {
        super(lineNumber);
        val = a1;
    }

    public TreeNode copy() {
        return new bool_const(lineNumber, copy_Boolean(val));
    }

    public void dump(PrintStream out, int n) {
        out.print(Utilities.pad(n) + "bool_const\n");
        dump_Boolean(out, n + 2, val);
    }


    public void dump_with_types(PrintStream out, int n) {
        dump_line(out, n);
        out.println(Utilities.pad(n) + "_bool");
        dump_Boolean(out, n + 2, val);
        dump_type(out, n);
    }

    @Override
    public void inferType(SemanticsAnalysis semanticsAnalysis) {
        this.set_type(TreeConstants.Bool);
    }

}


/**
 * Defines AST constructor 'string_const'.
 * <p>
 * See <a href="TreeNode.html">TreeNode</a> for full documentation.
 */
class string_const extends Expression {
    protected AbstractSymbol token;

    /**
     * Creates "string_const" AST node.
     *
     * @param lineNumber the line in the source file from which this node came.
     * @param a1         initial value for token
     */
    public string_const(int lineNumber, AbstractSymbol a1) {
        super(lineNumber);
        token = a1;
    }

    public TreeNode copy() {
        return new string_const(lineNumber, copy_AbstractSymbol(token));
    }

    public void dump(PrintStream out, int n) {
        out.print(Utilities.pad(n) + "string_const\n");
        dump_AbstractSymbol(out, n + 2, token);
    }


    public void dump_with_types(PrintStream out, int n) {
        dump_line(out, n);
        out.println(Utilities.pad(n) + "_string");
        out.print(Utilities.pad(n + 2) + "\"");
        Utilities.printEscapedString(out, token.getString());
        out.println("\"");
        dump_type(out, n);
    }

    @Override
    public void inferType(SemanticsAnalysis semanticsAnalysis) {
        set_type(TreeConstants.Str);
    }

}


/**
 * Defines AST constructor 'new_'.
 * <p>
 * See <a href="TreeNode.html">TreeNode</a> for full documentation.
 */
class new_ extends Expression {
    protected AbstractSymbol type_name;

    /**
     * Creates "new_" AST node.
     *
     * @param lineNumber the line in the source file from which this node came.
     * @param a1         initial value for type_name
     */
    public new_(int lineNumber, AbstractSymbol a1) {
        super(lineNumber);
        type_name = a1;
        set_type(type_name);
    }

    public TreeNode copy() {
        return new new_(lineNumber, copy_AbstractSymbol(type_name));
    }

    public void dump(PrintStream out, int n) {
        out.print(Utilities.pad(n) + "new_\n");
        dump_AbstractSymbol(out, n + 2, type_name);
    }


    public void dump_with_types(PrintStream out, int n) {
        dump_line(out, n);
        out.println(Utilities.pad(n) + "_new");
        dump_AbstractSymbol(out, n + 2, type_name);
        dump_type(out, n);
    }

    @Override
    public void inferType(SemanticsAnalysis semanticsAnalysis) {
        if (!semanticsAnalysis.existsType(this.get_type())) {
            semanticsAnalysis.semantError(this).printf("'new' used with undefined class %s.\n", this.get_type());
        }
    }

}


/**
 * Defines AST constructor 'isvoid'.
 * <p>
 * See <a href="TreeNode.html">TreeNode</a> for full documentation.
 */
class isvoid extends Expression {
    protected Expression e1;

    /**
     * Creates "isvoid" AST node.
     *
     * @param lineNumber the line in the source file from which this node came.
     * @param a1         initial value for e1
     */
    public isvoid(int lineNumber, Expression a1) {
        super(lineNumber);
        e1 = a1;
    }

    public TreeNode copy() {
        return new isvoid(lineNumber, (Expression) e1.copy());
    }

    public void dump(PrintStream out, int n) {
        out.print(Utilities.pad(n) + "isvoid\n");
        e1.dump(out, n + 2);
    }


    public void dump_with_types(PrintStream out, int n) {
        dump_line(out, n);
        out.println(Utilities.pad(n) + "_isvoid");
        e1.dump_with_types(out, n + 2);
        dump_type(out, n);
    }

    @Override
    public void inferType(SemanticsAnalysis semanticsAnalysis) {
        set_type(TreeConstants.Bool);
    }

}


/**
 * Defines AST constructor 'no_expr'.
 * <p>
 * See <a href="TreeNode.html">TreeNode</a> for full documentation.
 */
class no_expr extends Expression {
    /**
     * Creates "no_expr" AST node.
     *
     * @param lineNumber the line in the source file from which this node came.
     */
    public no_expr(int lineNumber) {
        super(lineNumber);
    }

    public TreeNode copy() {
        return new no_expr(lineNumber);
    }

    public void dump(PrintStream out, int n) {
        out.print(Utilities.pad(n) + "no_expr\n");
    }


    public void dump_with_types(PrintStream out, int n) {
        dump_line(out, n);
        out.println(Utilities.pad(n) + "_no_expr");
        dump_type(out, n);
    }

    @Override
    public void inferType(SemanticsAnalysis semanticsAnalysis) {
        set_type(TreeConstants.No_type);
    }

}


/**
 * Defines AST constructor 'object'.
 * <p>
 * See <a href="TreeNode.html">TreeNode</a> for full documentation.
 */
class object extends Expression {
    protected AbstractSymbol name;

    /**
     * Creates "object" AST node.
     *
     * @param lineNumber the line in the source file from which this node came.
     * @param a1         initial value for name
     */
    public object(int lineNumber, AbstractSymbol a1) {
        super(lineNumber);
        name = a1;
    }

    public TreeNode copy() {
        return new object(lineNumber, copy_AbstractSymbol(name));
    }

    public void dump(PrintStream out, int n) {
        out.print(Utilities.pad(n) + "object\n");
        dump_AbstractSymbol(out, n + 2, name);
    }


    public void dump_with_types(PrintStream out, int n) {
        dump_line(out, n);
        out.println(Utilities.pad(n) + "_object");
        dump_AbstractSymbol(out, n + 2, name);
        dump_type(out, n);
    }

    @Override
    public void inferType(SemanticsAnalysis semanticsAnalysis) {
        Optional<AbstractSymbol> type = semanticsAnalysis.lookupType(name);
        if(type.isEmpty()) {
            semanticsAnalysis.semantError(this).printf("Undeclared identifier %s.\n", name);
            return;
        }
        set_type(type.get());
    }

}