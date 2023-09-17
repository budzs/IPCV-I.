import java.util.ArrayList;

public class singleCentralDispatcher {
    protected Topic firstTopic;
    protected Topic secondTopic;
    protected Topic thirdTopic;

    public static singleCentralDispatcher global_ptr = null;
    private ArrayList<Topic> topics = new ArrayList<>();

    private singleCentralDispatcher() {
        firstTopic = new Topic("firstT", " ");
        topics.add(firstTopic);
        secondTopic = new Topic("secondT", " ");
        topics.add(secondTopic);
        thirdTopic = new Topic("thirdT", " ");
        topics.add(thirdTopic);

    }

    public static singleCentralDispatcher getInstance() {
        if (global_ptr == null) {
            global_ptr = new singleCentralDispatcher();
        }
        return global_ptr;
    }

    public Topic getTopic(String topicId) {
        for (Topic i : topics) {
            if (i.getTopicName() == topicId) {
                return i;
            }
        }
        return null;
    }

    public void setMsgTopic(String topicId, String msg) {
        for (Topic i : topics) {
            if (i.getTopicName() == topicId) {
                i.setTopicMsg(msg);
                break;
            }
        }
    }

    public String getMsgTopic(String topicId) {
        for (Topic i : topics) {
            if (i.getTopicName() == topicId) {
                return i.getTopicMsg();
            }
        }
        return null;

    }

}
