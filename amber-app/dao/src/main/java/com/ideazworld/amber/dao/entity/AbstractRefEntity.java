package com.ideazworld.amber.dao.entity;

import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.MappedSuperclass;

import com.amber.ideazworld.schema.beans.core.RefType;

@MappedSuperclass
@SuppressWarnings("serial")
public abstract class AbstractRefEntity extends AbstractEntity {

	private String name;
    private String ref;
    @Enumerated(EnumType.STRING)
    private RefType refType;
	
    public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getRef() {
		return ref;
	}
	public void setRef(String ref) {
		this.ref = ref;
	}
	public RefType getRefType() {
		return refType;
	}
	public void setRefType(RefType refType) {
		this.refType = refType;
	}
}
