import java.util.ArrayList;

class PrintingVisitor implements Visitor {
    private ArrayList<String> result;

    public PrintingVisitor() {
        result = new ArrayList<String>();
    }

    public String printResult() {

        String r = "";
        for (String s : result) {
            r += s;
        }
        return r;
    }

    public void visit(Number number) {
        result.add(Double.toString(number.getValue()));
    }

    public void visit(Product product) {
        product.getLeft().accept(this);
        result.add("*");
        product.getRight().accept(this);
    }

    public void visit(Addition addition) {
        addition.getLeft().accept(this);
        result.add("+");
        addition.getRight().accept(this);
    }

}
