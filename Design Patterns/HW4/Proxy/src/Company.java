import java.util.ArrayList;

public class Company {
    private ArrayList<Employee> employees = new ArrayList<>();
    private Rules boss;
    private Rules manager;
    private Rules employee;

    public Company(){
        boss = new Rules();

        manager= new Rules();
        manager.add("www.facebook.com");

        employee= new Rules();
        employee.add("www.youtube.com");
        employee.add("www.facebook.com");
        //employee.add("www.ismycomputeronfire.com");
        employee.add("www.randomcolour.com");

    }

    public ArrayList<Employee> getEmployees() {
        return employees;
    }
    public void addEmployeeű(Employee e, String role){
        switch(role){
            case "boss":
                e.setRules(boss.clone());
                break;
            case "manager":
                e.setRules(manager.clone());
                break;
            default:
                e.setRules(employee.clone());
        }
        employees.add(e);
    }
}
