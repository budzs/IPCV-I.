import java.util.ArrayList;

public class Topic {
    private String topicName;
    private String topicMsg;

    protected ArrayList<MyObserver> list = new ArrayList<>();

    public Topic(String name, String msg) {
        this.topicName = name;
        this.topicMsg = msg;
    }

    public void notifyObservers() {
        for (MyObserver o : list) {
            o.update(topicName, topicMsg);
        }
    }

    public String getTopicMsg() {
        return topicMsg;
    }

    public String getTopicName() {
        return topicName;
    }

    public void setTopicMsg(String topicMsg) {
        this.topicMsg = topicMsg;
        notifyObservers();
    }

    public void addObserver(MyObserver o) {
        list.add(o);
        o.update(topicName, topicMsg);
    }

    public void removeObserver(MyObserver o) {
        list.remove(o);
        ((Observer) o).unsubscribe(topicName);
    }

}