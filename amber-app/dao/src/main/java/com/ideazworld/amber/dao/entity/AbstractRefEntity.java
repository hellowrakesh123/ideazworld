package com.ideazworld.amber.dao.entity;

import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.MappedSuperclass;

import com.amber.ideazworld.commons.model.RefType;

@MappedSuperclass
@SuppressWarnings("serial")
public abstract class AbstractRefEntity extends AbstractBaseEntity {

	private String ref;
	@Enumerated(EnumType.STRING)
	private RefType refType;

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
