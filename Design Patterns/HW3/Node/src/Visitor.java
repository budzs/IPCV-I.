
public interface Visitor {

    void visit(Number number);
    void visit(Product product);
    void visit(Addition addition);
    String printResult();

}
