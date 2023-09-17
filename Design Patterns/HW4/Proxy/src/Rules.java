import java.util.ArrayList;

public class Rules implements Prototype{
    private ArrayList<String> blockedAccess = new ArrayList<>();;

    public Rules(){
        blockedAccess = new ArrayList<>();
     }

    public void setBlockedAccess(ArrayList<String> blockedAccess) {
        this.blockedAccess = blockedAccess;
    }
    
    public void add(String url){
        this.blockedAccess.add(url);
    } 

    public ArrayList<String> getBlockedAccess() {
        return blockedAccess;
    }

    public Boolean permission(String url){
        if(this.blockedAccess.contains(url)){
            return true;
        }
        return false;
    }

    public Rules clone(){
        Rules r = new Rules();
        for (String i : blockedAccess){
            r.add(i);
        }
        // if adding a new rule should be active to the hole managing level then 
        // r.setBlockedAccess(this.blockedAccess)
        return r;
    }


}
