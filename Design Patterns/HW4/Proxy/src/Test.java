
public class Test {
    public static void main(String[] args) {
        Company company = new Company();
        

        Employee boss01 = new Employee("Boss01");
        Employee manager01 = new Employee("Manager01");
        Employee manager02 = new Employee("Manager02");
        Employee employee01 = new Employee("Employee01");

        company.addEmployeeű(boss01,"boss");
        company.addEmployeeű(manager01,"manager");
        company.addEmployeeű(manager02,"manager");
        company.addEmployeeű(employee01,"employee");


        boss01.open("www.youtube.com");
        manager01.open("www.youtube.com");
        manager02.open("www.facebook.com");
        employee01.open("www.facebook.com");
        employee01.open("www.youtube.com");

        System.out.println("---------------------------------------");

        boss01.open("www.ismycomputeronfire.com");
        manager01.open("www.ismycomputeronfire.com");
        manager02.open("www.ismycomputeronfire.com");
        employee01.open("www.ismycomputeronfire.com");

        System.out.println("---------------------------------------");

        manager02.addRule("www.ismycomputeronfire.com");

        boss01.open("www.ismycomputeronfire.com");
        manager01.open("www.ismycomputeronfire.com");
        manager02.open("www.ismycomputeronfire.com");
        employee01.open("www.ismycomputeronfire.com");

    }
}
