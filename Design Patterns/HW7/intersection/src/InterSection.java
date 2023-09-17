public class InterSection extends Thread {
    private static  boolean red ;
    public static Object o = new Object();
    private static  boolean car = false;

    
    public static boolean getRed(){
        return red;
    }

    public static boolean getCar(){
        return car;
    }
    public static void setCar(boolean c){
        car = c;
    }

    public void run() {

            while (true) {
                try {
                    Thread.sleep(2500);
                } catch (InterruptedException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }
               red = !red;
               if(!red){
                System.out.println("Green");
                synchronized(InterSection.o){
                    InterSection.o.notifyAll();
                }
                
               }
               else{
                System.out.println("RED");
               }
                
            }
        }

    }

