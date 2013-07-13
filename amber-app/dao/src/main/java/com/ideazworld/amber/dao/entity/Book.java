package com.ideazworld.amber.dao.entity;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;


/**
 * The persistent class for the book database table.
 * 
 */
@DiscriminatorValue("BOOK")
@Entity
public class Book extends Item {
	private static final long serialVersionUID = 1L;

	private String isbn;

	private String language;

	private String subject;

	public String getIsbn() {
		return this.isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}

	public String getLanguage() {
		return this.language;
	}

	public void setLanguage(String language) {
		this.language = language;
	}

	public String getSubject() {
		return this.subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}
}