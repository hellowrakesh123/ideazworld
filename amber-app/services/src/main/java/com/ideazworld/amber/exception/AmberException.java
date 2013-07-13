package com.ideazworld.amber.exception;

public class AmberException extends RuntimeException {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1247786708379279116L;

	public AmberException(String message) {
		super(message);
	}

	public AmberException(String message, Throwable throwable) {
		super(message, throwable);
	}

	public AmberException(Throwable throwable) {
		super(throwable);
	}

}
