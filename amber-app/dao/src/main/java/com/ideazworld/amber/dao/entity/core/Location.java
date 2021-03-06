package com.ideazworld.amber.dao.entity.core;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.Transient;

import org.hibernate.annotations.Type;

import com.ideazworld.amber.dao.entity.AbstractPkEntity;
import com.ideazworld.amber.dao.entity.item.Item;

/**
 * The persistent class for the location database table.
 * 
 */
@Entity
public class Location extends AbstractPkEntity {
	private static final long serialVersionUID = 1L;

	private String address;

	private String city;

	private String country;

	private String locality;

	private String state;

	private String zipCode;
	
	@Type(type = "org.hibernate.type.NumericBooleanType")
	private boolean publicLocation;

	// bi-directional one-to-many association to Item
	@OneToMany(mappedBy = "location", cascade = CascadeType.ALL, orphanRemoval = false)
	private List<Item> items;

	// bi-directional many-to-one association to User
	//@OneToMany(mappedBy = "location")
	@Transient
	private List<User> users;

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getLocality() {
		return locality;
	}

	public void setLocality(String locality) {
		this.locality = locality;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getZipCode() {
		return zipCode;
	}

	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}

	public boolean isPublicLocation() {
		return publicLocation;
	}

	public void setPublicLocation(boolean publicLocation) {
		this.publicLocation = publicLocation;
	}

	public List<Item> getItems() {
		return items;
	}

	public void setItems(List<Item> items) {
		this.items = items;
	}

	public List<User> getUsers() {
		return users;
	}

	public void setUsers(List<User> users) {
		this.users = users;
	}
}