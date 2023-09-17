
class Car extends Thread {
    int num = 0; // serial number of passing cars
    int min = 200;
    int max = 400;
    boolean alive;

    public int getNum() {
        return num;
    }

    boolean printed;

    public Car() {
        num = (int) (Math.random() * (max - min + 1) + min);
        printed = false;
        alive = true;
    }

    public void run() {
        System.out.println("Car " + this.getNum() + " is approaching the intersection");
        try {
            // The car drives up to the intersection, which takes 3 seconds (Thread.sleep())
            Thread.sleep(3000);
        } catch (InterruptedException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        System.out.println("Car " + this.getNum() + " arrived to the intersection");

        while (alive) {

            // If there are no cars in the intersection AND the light is green
            if (!InterSection.getCar() && !InterSection.getRed()) {
                synchronized (InterSection.o) {
                    InterSection.setCar(true);
                    try {
                        System.out.println("Car " + this.getNum() + " is IN the intersection");

                        //exits 1 seconds later
                        InterSection.o.wait(1000);
                    } catch (InterruptedException e) {
                        // TODO Auto-generated catch block
                        e.printStackTrace();
                    }
                    System.out.println("Car " + this.getNum() + " exited the intersection");
                    InterSection.setCar(false);
                    alive = false;
                    InterSection.o.notifyAll();
                }
            } else {
                if (!printed) {
                    System.out.println("Car " + this.getNum() + " waiting");
                    printed = true;
                }
                synchronized (InterSection.o) {
                    try {
                        InterSection.o.wait();
                    } catch (InterruptedException e) {
                        // TODO Auto-generated catch block
                        e.printStackTrace();
                    }
                }
            }

        }
        try {
            Thread.sleep(3000);
        } catch (InterruptedException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        System.out.println("Car " + this.getNum() + " dissapeared");

    }

}
