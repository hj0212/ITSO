package kh.spring.exception;

public class NotLoginException extends Exception{
	
	public NotLoginException() {
		
	}
	
	public NotLoginException(String message) {
		super(message);
	}
	
}
