package com.amber.ideazworld.commons.model;

public enum ItemType {

	BOOK;

	public String value() {
		return name();
	}

	public static ItemType fromValue(String v) {
		return valueOf(v);
	}

}
