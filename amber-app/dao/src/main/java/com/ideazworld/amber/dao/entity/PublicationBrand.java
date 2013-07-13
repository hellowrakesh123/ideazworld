package com.ideazworld.amber.dao.entity;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.PrimaryKeyJoinColumn;


/**
 * The persistent class for the publication_brand database table.
 * 
 */
@DiscriminatorValue("BOOK")
@PrimaryKeyJoinColumn(name="brand_id",referencedColumnName="id")
@Entity
public class PublicationBrand extends Brand {
	private static final long serialVersionUID = 1L;

	private String author;

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}
}