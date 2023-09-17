import java.util.HashMap;
import java.util.Map;

public class Observer implements MyObserver {
    private HashMap<String, String> list;
    final int ID;

    public Observer() {
        ID = hashCode();
        list = new HashMap<>();
    }

    public int getID() {
        return ID;
    }

    public HashMap<String, String> getList() {
        return list;
    }

    public void update(String name, String msg) {
        list.put(name, msg);
    }

    public void unsubscribe(String name) {
        list.remove(name);

    }

    /* (non-Javadoc)
     * @see java.lang.Object#toString()
     * source: https://beginnersbook.com/2013/12/hashmap-in-java-with-example/
     */
    @Override
    public String toString() {
        String str = "";
        str += "\n";
        for (Map.Entry<String, String> mEntry : list.entrySet()) {
            str += ("\tTopic name:  " + mEntry.getKey() + "\tmessage: ");
            str += (mEntry.getValue() + "\n");
        }
        return str;
    }

}
