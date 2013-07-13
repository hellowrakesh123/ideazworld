package com.ideazworld.amber.dao.entity;

import java.util.List;

import javax.persistence.DiscriminatorColumn;
import javax.persistence.DiscriminatorType;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.OneToMany;

import com.amber.ideazworld.commons.model.ItemType;


/**
 * The persistent class for the brand database table.
 * 
 */
@Inheritance(strategy = InheritanceType.JOINED)
@DiscriminatorColumn(name = "ITEM_TYPE", discriminatorType = DiscriminatorType.STRING)
@Entity
public class Brand extends AbstractPkEntity {
	private static final long serialVersionUID = 1L;

	private String name;

	private int year;
	
	@Enumerated(EnumType.STRING)
	private ItemType itemType;

	//bi-directional many-to-one association to Item
	@OneToMany(mappedBy="brand")
	private List<Item> items;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}

	public ItemType getItemType() {
		return itemType;
	}

	public void setItemType(ItemType itemType) {
		this.itemType = itemType;
	}

	public List<Item> getItems() {
		return items;
	}

	public void setItems(List<Item> items) {
		this.items = items;
	}
}