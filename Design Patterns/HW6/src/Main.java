
public class Main {

	public static void main(String[] args) {
        ModernDatabaset md = new ModernDatabaset();
        PaperDataset pd = new PaperDataset();

        Book b1 = new Book("Ernest Hemingway","The Sun Also Rises", "2/34");
        Book b2 = new Book("Agatha Christie","And Then There Were None", "12/4");
        Book b3 = new Book("George Orwell","Nineteen Eighty-Four", "22/18");
        Book b4 = new Book("Kurt Vonnegut","Cat's Cradle", "8/6");
        Book b5 = new Book("Kurt Vonnegut","Breakfast of Champions", "29/1");
        String s1 = "Ernest Hemingway|The Sun Also Rises|2/34";
        String s2 = "Agatha Christie|And Then There Were None|12/4";
        String s3 = "George Orwell|Nineteen Eighty-Four|22/18";
        String s4 = "Kurt Vonnegut|Cat's Cradle|8/6";
        String s5 = "Kurt Vonnegut|Breakfast of Champions|29/1";

        md.addBook(b1);
        md.addBook(b5);
        md.addBook(b4);
        md.addBook(b3);

        pd.add(s1);
        pd.add(s2);
        pd.add(s3);
        pd.add(s4);
        pd.add(s5);


        // System.out.println(md.find("Agatha Christie"));
        // System.out.println(md.find("George Orwell"));
        // System.out.println(md.find("Nineteen Eighty-Four"));
        // System.out.println(md.find("Kurt Vonnegut"));
        

        // System.out.println(pd.find("Agatha Christie"));
        // System.out.println(pd.find("George Orwell"));
        // System.out.println(pd.find("Nineteen Eighty-Four"));
        // System.out.println(pd.find("Kurt Vonnegut"));

        Search[] search =
	        {
	            new ModernDatabasetAdapter(pd, md )
	        };

            for (int i = 0; i < search.length; ++i){
	        	System.out.println(search[i].find("Agatha Christie"));
                System.out.println(search[i].find("Nineteen Eighty-Four"));
                System.out.println(search[i].find("Kurt Vonnegut"));
	        }

	}

}