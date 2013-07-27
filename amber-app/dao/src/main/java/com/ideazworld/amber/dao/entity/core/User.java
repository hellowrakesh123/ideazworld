package com.ideazworld.amber.dao.entity.core;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import org.hibernate.annotations.Type;

import com.ideazworld.amber.dao.entity.AbstractPkEntity;

/**
 * The persistent class for the user database table.
 * 
 */
@Entity
public class User extends AbstractPkEntity {
	private static final long serialVersionUID = 1L;

	private String name;
	
	private String email;

	private String sex;
	
	private int contactNumber;

	@Type(type = "org.hibernate.type.NumericBooleanType")
	private boolean shareContact;

	// bi-directional many-to-one association to Location
	@ManyToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "location_id")
	private Location location;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public int getContactNumber() {
		return contactNumber;
	}

	public void setContactNumber(int contactNumber) {
		this.contactNumber = contactNumber;
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