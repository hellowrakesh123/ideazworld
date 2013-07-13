package com.ideazworld.amber.dao.entity;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import org.hibernate.annotations.Type;


/**
 * The persistent class for the user database table.
 * 
 */
@Entity
public class User extends AbstractEntity {
	private static final long serialVersionUID = 1L;

	private String email;
	
	private int contactNumber;

	private String name;

	@Type(type = "org.hibernate.type.NumericBooleanType")
	private boolean shareContact;

	//bi-directional many-to-one association to Location
	@ManyToOne
	@JoinColumn(name="location_id")
	private Location location;

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getContactNumber() {
		return contactNumber;
	}

	public void setContactNumber(int contactNumber) {
		this.contactNumber = contactNumber;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public boolean isShareContact() {
		return shareContact;
	}

	public void setShareContact(boolean shareContact) {
		this.shareContact = shareContact;
	}

	public Location getLocation() {
		return location;
	}

	public void setLocation(Location location) {
		this.location = location;
	}
}