
public class Tester {
    public static void main(String[] args) {
        Observer o1 = new Observer();
        Observer o2 = new Observer();

        // Write a test code where objects subscribe and unsubscribe to various topics
        singleCentralDispatcher.getInstance().getTopic("firstT").addObserver(o1);
        singleCentralDispatcher.getInstance().getTopic("secondT").addObserver(o1);
        singleCentralDispatcher.getInstance().getTopic("firstT").addObserver(o2);

        // Allows objects to subscribe and unsusóbscribe to „topics” test
        System.out.println(o1.getID() + " list of topics suscribed : " + o1.toString());
        System.out.println(o2.getID() + " list of topics suscribed : " + o2.toString() + "\n");

        singleCentralDispatcher.getInstance().getTopic("firstT").removeObserver(o1);
        singleCentralDispatcher.getInstance().getTopic("secondT").addObserver(o2);

        // Message by the single central dispacher
        // Send messages to topics, including ones that have no subscribers
        singleCentralDispatcher.getInstance().getTopic("secondT").setTopicMsg("First message in secondT by disacher");
        singleCentralDispatcher.getInstance().getTopic("thirdT").setTopicMsg("First message in thirdT by disacher");

        // Allows objects to send message (a String) to „topics” (identified by strings)
        if (o2.getList().containsKey("firstT")) {
            singleCentralDispatcher.getInstance().getTopic("firstT")
                    .setTopicMsg(("First message in firstT by " + o2.getID()));
        }

        System.out.println("First Topic in Singleton Central Dispatcher (instance, message): "
                + singleCentralDispatcher.getInstance() + ", "
                + singleCentralDispatcher.getInstance().getMsgTopic("firstT"));
        System.out.println("Second Topic in Singleton Central Dispatcher (instance, message): "
                + singleCentralDispatcher.getInstance() + ", "
                + singleCentralDispatcher.getInstance().getMsgTopic("secondT"));
        System.out.println("Third Topic in Singleton Central Dispatcher (instance, message): "
                + singleCentralDispatcher.getInstance() + ", "
                + singleCentralDispatcher.getInstance().getMsgTopic("thirdT") + "\n");

        // Subscribers should print a unique ID, and the message
        System.out.println(o1.getID() + " list of topics suscribed : " + o1.toString());
        System.out.println(o2.getID() + " list of topics suscribed : " + o2.toString() + "\n");

    }
}
