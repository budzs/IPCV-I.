abstract class Operator implements Component {
    //I'm not sure whether this abstract class is necessary 
    private Component left;
    private Component right;

    Operator(Component l, Component r) {
        this.left = l;
        this.right = r;
    }

    public boolean isLeaf() {
        return false;
    }


    public Component getLeft() {
        return left;
    }

    public Component getRight() {
        return right;
    }
    public void setLeft(Component left) {
        this.left = left;
    }
    public void setRight(Component right) {
        this.right = right;
    }
}