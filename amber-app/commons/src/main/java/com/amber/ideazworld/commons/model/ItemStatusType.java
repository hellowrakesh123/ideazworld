package com.amber.ideazworld.commons.model;

public enum ItemStatusType {

	NEW, SOLD, DISABLED, BLOCKED, RETIRED;

	public String value() {
		return name();
	}

	public static ItemStatusType fromValue(String v) {
		return valueOf(v);
	}

}
