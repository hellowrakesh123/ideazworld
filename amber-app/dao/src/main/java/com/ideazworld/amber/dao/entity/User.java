package com.ideazworld.amber.dao.entity;

import javax.persistence.Entity;
import javax.persistence.ManyToOne;


/**
 * The persistent class for the user database table.
 * 
 */
@Entity
public class User extends AbstractEntity {
	private static final long serialVersionUID = 1L;

	private String email;
	
	private int contactNumber;

	private int lockVersion;

	private String name;

	private byte shareContact;

	//bi-directional many-to-one association to Location
	@ManyToOne
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

	public int getLockVersion() {
		return lockVersion;
	}

	public void setLockVersion(int lockVersion) {
		this.lockVersion = lockVersion;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public byte getShareContact() {
		return shareContact;
	}

	public void setShareContact(byte shareContact) {
		this.shareContact = shareContact;
	}

	public Location getLocation() {
		return location;
	}

	public void setLocation(Location location) {
		this.location = location;
	}
}