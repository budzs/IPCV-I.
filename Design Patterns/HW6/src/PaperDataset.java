import java.util.ArrayList;

public class PaperDataset {
    ArrayList<String> dataset;

    public PaperDataset() {
        this.dataset  = new ArrayList<String>();
    }
    public String find(String s){
        
       /*  String str = "";
        for (int index = 0; index < this.dataset.size(); index++) {
            String [] temp = dataset.get(index).split("\\|");
            
            if (temp[0].equals(s) || temp[1].equals(s)) {
                str = str + temp[2] + " ,";
            }
        }
        if (str.equals("")){
            return "There is no such book in the modern database";
        }
        else{
            if (str.substring(str.length() - 1).equals(",")){
                str = str.substring(0, str.length() - 1);
            }
            return str;
        }
    } */
    for (int index = 0; index < this.dataset.size(); index++) {
        if(dataset.get(index).indexOf(s) != -1){
            int ind = dataset.get(index).lastIndexOf("|")+1;
            return dataset.get(index).substring(ind, dataset.get(index).length() );
        }
    }
    //return "There is no such book in the modern database";
    return "";
}

    public void add(String s){
        this.dataset.add(s);
    }
}
