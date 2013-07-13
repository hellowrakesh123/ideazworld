package com.amber.ideazworld.commons.model;

public enum RefType {

	ITEM;

	public String value() {
		return name();
	}

	public static RefType fromValue(String v) {
		return valueOf(v);
	}

}
