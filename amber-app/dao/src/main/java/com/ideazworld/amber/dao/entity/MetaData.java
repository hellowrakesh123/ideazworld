package com.ideazworld.amber.dao.entity;

import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;

import com.amber.ideazworld.schema.beans.core.MetaDataType;


/**
 * The persistent class for the meta_data database table.
 * 
 */
@Entity
public class MetaData extends AbstractPkEntity {
	private static final long serialVersionUID = 1L;

	private String description;

	@Enumerated(EnumType.STRING)
	private MetaDataType type;

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public MetaDataType getType() {
		return type;
	}

	public void setType(MetaDataType type) {
		this.type = type;
	}
}