package com.amber.ideazworld.commons.model;

public enum ItemConditionType {

	NEW, LIKE_NEW, USED, NEVER_USED, DECENT, WORN, NOT_BAD;

	public String value() {
		return name();
	}

	public static ItemConditionType fromValue(String v) {
		return valueOf(v);
	}

}
