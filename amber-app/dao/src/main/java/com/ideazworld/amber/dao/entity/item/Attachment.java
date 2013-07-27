package com.ideazworld.amber.dao.entity.item;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;

import com.ideazworld.amber.dao.entity.AbstractPkEntity;

/**
 * The persistent class for the attachment database table.
 * 
 */
@Entity
public class Attachment extends AbstractPkEntity {
	/**
	 * 
	 */
	private static final long serialVersionUID = 2926909529718024386L;

	private String name;
	
	private String description;

	@Lob
	@Column(columnDefinition = "blob")
	private byte[] content;

	// bi-directional many-to-one association to Item
	@ManyToOne
	@JoinColumn(name = "item_id")
	private Item item;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public byte[] getContent() {
		return content;
	}

	public void setContent(byte[] content) {
		this.content = content;
	}

	public Item getItem() {
		return item;
	}

	public void setItem(Item item) {
		this.item = item;
	}
}