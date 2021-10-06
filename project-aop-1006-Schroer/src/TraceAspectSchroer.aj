
public aspect TraceAspectSchroer {
	
	pointcut classToTrace(): within(*App);
	pointcut methodToTrace(): classToTrace() && execution(String getName(..));
	
	before(): methodToTrace(){
		String info = "Signature: " + thisJoinPointStaticPart.getSignature() 
			+ "\nLine Number: " + thisJoinPointStaticPart.getSourceLocation().getLine();
		System.out.println(info);
	}
	
	after(): methodToTrace(){
		System.out.println("File Name: " + thisJoinPointStaticPart.getSourceLocation().getFileName());
	}

}
