package com.ideazworld.amber.exception;

public class UnsupportedOperationException extends RuntimeException {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1247786708379279116L;

	public UnsupportedOperationException(String message) {
		super(message);
	}

	public UnsupportedOperationException(String message, Throwable throwable) {
		super(message, throwable);
	}

	public UnsupportedOperationException(Throwable throwable) {
		super(throwable);
	}

}
