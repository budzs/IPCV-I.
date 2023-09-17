class Product extends Operator {
    public Product(Component l, Component r) {
        super(l, r);
    }

    public void accept(Visitor visitor) {
        visitor.visit(this);
    }

}
