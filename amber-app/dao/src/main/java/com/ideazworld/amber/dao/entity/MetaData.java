package com.ideazworld.amber.dao.entity;

import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;

import com.amber.ideazworld.commons.model.MetadataType;


/**
 * The persistent class for the meta_data database table.
 * 
 */
@Entity
public class MetaData extends AbstractPkEntity {
	private static final long serialVersionUID = 1L;

	private String name;
	
	private String description;

	@Enumerated(EnumType.STRING)
	private MetadataType type;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public MetadataType getType() {
		return type;
	}

	public void setType(MetadataType type) {
		this.type = type;
	}
}