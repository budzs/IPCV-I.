abstract interface Component {
    abstract void accept(Visitor v);
	abstract boolean isLeaf();
}
