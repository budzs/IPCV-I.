
public class Main {
    public static void main(String[] args) throws Exception {
        int n = 0;
        new InterSection().start();
        while (n < 10) {
            Car c = new Car();
            c.start();
            n++;
        }
    }
}
