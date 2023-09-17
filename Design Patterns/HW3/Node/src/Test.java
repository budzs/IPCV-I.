public class Test {
	public static void main(String[] args) throws Exception {

		// 3+5*6
		Operator root= new Addition(new Number(3.0), new Product(new Number(5.0), new Number(6.0)));

		Visitor printer = new PrintingVisitor();
		root.accept(printer);
		System.out.println(printer.printResult());

		Visitor calculator = new CalculatingVisitor();
		root.accept(calculator);
		System.out.println(calculator.printResult());

	}
}
