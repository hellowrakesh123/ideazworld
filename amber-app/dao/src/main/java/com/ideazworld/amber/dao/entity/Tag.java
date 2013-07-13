package com.ideazworld.amber.dao.entity;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;


/**
 * The persistent class for the tag database table.
 * 
 */
@Entity
public class Tag extends AbstractPkEntity {
	private static final long serialVersionUID = 1L;

	//bi-directional many-to-many association to Item
	@ManyToMany
	@JoinTable(
		name="item_tags"
		, joinColumns={
			@JoinColumn(name="tag_name")
			}
		, inverseJoinColumns={
			@JoinColumn(name="item_id")
			}
		)
	private List<Item> items;

	public List<Item> getItems() {
		return this.items;
	}

	public void setItems(List<Item> items) {
		this.items = items;
	}

}