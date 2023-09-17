class Addition extends Operator{
    Addition(Component l, Component r) {
        super(l, r);
    }

    public void accept(Visitor visitor) {
        visitor.visit(this);
    }
    
}
