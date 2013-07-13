package com.ideazworld.amber.dao.entity;

import javax.persistence.Entity;


/**
 * The persistent class for the tag database table.
 * 
 */
@Entity
public class Tag extends AbstractPkEntity {
	private static final long serialVersionUID = 1L;

	private String name;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
}