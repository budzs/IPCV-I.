public class Employee {
    private String id;
    private Rules rules;
    AccessProvider accessProvider = new AccessProxy();

    public Employee(String id){
        this.id=id;
    }

    public void setRules(Rules rules) {
        this.rules = rules;
    }

    public Rules getRules() {
        return rules;
    }

    public void addRule(String url){
        this.rules.add(url);
    }
    

    public void open(String string) {
        System.out.println(id + " trying to open " + string );
        this.accessProvider.request(string, this.rules);
    } 
}

