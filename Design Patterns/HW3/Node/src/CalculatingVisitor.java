
public class CalculatingVisitor implements Visitor {
    private double result;

    public void visit(Number number) {
        result = number.getValue();
    }

    public void visit(Product product) {        
        
        try {
            Number left = (Number) product.getLeft();
            Number right = (Number) product.getRight();
            result = left.getValue() * right.getValue();

            // System.out.println("Mindketto level");

        } catch (Exception e) {

            try {
                // System.out.println("Bal oldalt lelep");

                product.getLeft().accept(this);
                Number right = (Number) product.getRight();
                result = right.getValue() * result;

            } catch (Exception ee) {
                try {
                    // System.out.println("Jobb oldalt lelep");

                    product.getRight().accept(this);
                    Number left = (Number) product.getLeft();
                    result = left.getValue() * result;
                } catch (Exception eee) {
                    // System.out.println("Minket oldalt lelep");

                    product.getRight().accept(this);
                    product.getLeft().accept(this);
                }
            }
        }
    }

    public void visit(Addition addition) {
        try {
            Number left = (Number) addition.getLeft();
            Number right = (Number) addition.getRight();
            result = left.getValue() + right.getValue();
            // System.out.println("Mindketto level");

        } catch (Exception e) {
            try {
                // System.out.println("Bal oldalt lelep");

                addition.getLeft().accept(this);
                Number right = (Number) addition.getRight();
                result = right.getValue() + result;

            } catch (Exception ee) {
                try {
                    // System.out.println("Jobb oldalt lelep");

                    addition.getRight().accept(this);
                    Number left = (Number) addition.getLeft();
                    result = left.getValue() + result;
                } catch (Exception eee) {
                    // System.out.println("Minket oldalt lelep");

                    addition.getRight().accept(this);
                    addition.getLeft().accept(this);
                }
            }
        }

    }

    public String printResult() {
        return Double.toString(result);
    }

}
