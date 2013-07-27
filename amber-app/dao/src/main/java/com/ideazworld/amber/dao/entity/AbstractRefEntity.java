package com.ideazworld.amber.dao.entity;

import java.sql.Timestamp;

import javax.persistence.MappedSuperclass;
import javax.persistence.Version;

import org.hibernate.annotations.Type;

@MappedSuperclass
public abstract class AbstractRefEntity extends AbstractPkEntity {

	/**
	 * 
	 */
	private static final long serialVersionUID = -7004788807521260451L;
	
	private String name;
	private String reference;
	private String createdBy;
	private Timestamp createdTime;
	private String updatedBy;
	private Timestamp updatedTime;
	@Version
	private int lockVersion;
	@Type(type = "org.hibernate.type.NumericBooleanType")
	private boolean active;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getReference() {
		return reference;
	}
	public void setReference(String reference) {
		this.reference = reference;
	}
	public String getCreatedBy() {
		return createdBy;
	}
	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}
	public Timestamp getCreatedTime() {
		return createdTime;
	}
	public void setCreatedTime(Timestamp createdTime) {
		this.createdTime = createdTime;
	}
	public String getUpdatedBy() {
		return updatedBy;
	}
	public void setUpdatedBy(String updatedBy) {
		this.updatedBy = updatedBy;
	}
	public Timestamp getUpdatedTime() {
		return updatedTime;
	}
	public void setUpdatedTime(Timestamp updatedTime) {
		this.updatedTime = updatedTime;
	}
	public int getLockVersion() {
		return lockVersion;
	}
	public void setLockVersion(int lockVersion) {
		this.lockVersion = lockVersion;
	}
	public boolean isActive() {
		return active;
	}
	public void setActive(boolean active) {
		this.active = active;
	}
}
