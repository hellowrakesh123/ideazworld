package com.ideazworld.amber.service.exception;

import com.ideazworld.amber.exception.AmberException;

public class InvalidOperationException extends AmberException {

	/**
	 * 
	 */
	private static final long serialVersionUID = 9160528725435036435L;
	
	public InvalidOperationException(String message) {
		super(message);
	}
}
