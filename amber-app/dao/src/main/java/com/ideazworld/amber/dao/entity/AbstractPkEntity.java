package com.ideazworld.amber.dao.entity;

import static javax.persistence.GenerationType.IDENTITY;

import java.io.Serializable;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;

@MappedSuperclass
public abstract class AbstractPkEntity implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 4103721502408129883L;
	@Id
	@GeneratedValue(strategy = IDENTITY)
	private Integer id;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
}
