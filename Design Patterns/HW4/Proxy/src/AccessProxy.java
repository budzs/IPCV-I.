public class AccessProxy implements AccessProvider {
  private final AccessProvider realInternetAcccess = new RealInternetAccess();

  @Override
  public void request(String url, Rules rules) {
    if (rules.permission(url)) {
      System.out.println("access to "+ url + " blocked \n");
    } 
    else{
      realInternetAcccess.request(url, rules);
    }
      
  }
}