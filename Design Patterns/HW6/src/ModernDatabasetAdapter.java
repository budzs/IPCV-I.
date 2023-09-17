public class ModernDatabasetAdapter implements Search {
    PaperDataset pd;
    ModernDatabaset md;

    public ModernDatabasetAdapter(PaperDataset pd, ModernDatabaset md) {
        this.pd = pd;
        this.md = md;
    }

    @Override
    public String find(String s) {
        String s1 = md.find(s);

        //author|title|location
        String s2 = pd.find(s);
        if(s2.equals("") && s1.equals("")){
            return "There is no such book in the modern database";
        }
        else{
            if(!s2.equals("") && !s1.equals("")){
                if(!s2.equals(s1) && !s1.contains(s2)){
                    return s1+ ", " +s2;
                }
                return s1;
            }
            if(s2.equals("")){
                return s1;
            }else{
                return s2;
            }

        }        
    }
    
}
