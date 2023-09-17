public class Number implements Component {
    private double value;

    Number(Double v) {
        this.value = v;
    }

    public void accept(Visitor visitor) {
        visitor.visit(this);
    }

    public boolean isLeaf() {
        return true;
    }

    public double getValue() {
        return value;
    }
}
