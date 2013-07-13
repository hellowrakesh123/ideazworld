package com.ideazworld.amber.dao.entity;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.ManyToOne;


/**
 * The persistent class for the publication_brand database table.
 * 
 */
@Entity
@DiscriminatorValue("BOOK")
public class PublicationBrand extends Brand {
	private static final long serialVersionUID = 1L;

	private String author;

	//bi-directional many-to-one association to Brand
	@ManyToOne
	private Brand brand;

	public String getAuthor() {
		return this.author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public Brand getBrand() {
		return this.brand;
	}

	public void setBrand(Brand brand) {
		this.brand = brand;
	}

}