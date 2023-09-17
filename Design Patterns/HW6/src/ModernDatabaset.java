import java.util.ArrayList;


public class ModernDatabaset {
    ArrayList<Book> dataset ;

    public ModernDatabaset() {
        this.dataset  = new ArrayList<Book>();
    }

    public ModernDatabaset(ArrayList<Book> dataset) {
        this.dataset = dataset;
    }

    public void addBook(Book b){
        this.dataset.add(b);
    }

    public String find(String s){
        String str ="";
        for (int index = 0; index < this.dataset.size(); index++) {
            if (this.dataset.get(index).Author.equals(s) || this.dataset.get(index).Title.equals(s)) {
                str = str +this.dataset.get(index).Location + ",";
            }
        }
        if (str.equals("")){
            //return "There is no such book in the modern database";
            return "";
        }
        else{
            if (str.substring(str.length() - 1).equals(",")){
                str = str.substring(0, str.length() - 1);
            }
            return str;
        }
    }
}
