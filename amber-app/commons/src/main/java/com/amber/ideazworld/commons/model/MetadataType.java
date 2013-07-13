package com.amber.ideazworld.commons.model;

public enum MetadataType {

	CATEGORY, SUB_CATEGORY;

	public String value() {
		return name();
	}

	public static MetadataType fromValue(String v) {
		return valueOf(v);
	}

}
