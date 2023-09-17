public class RealInternetAccess implements AccessProvider {

    @Override
    public void request(String url, Rules rule) {
        System.out.println(url+" loaded \n");
    }
   
  }