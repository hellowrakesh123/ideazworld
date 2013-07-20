package com.ideazworld.amber.dao.entity.item;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.DiscriminatorColumn;
import javax.persistence.DiscriminatorType;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import org.hibernate.annotations.Type;

import com.amber.ideazworld.commons.model.ItemStatusType;
import com.amber.ideazworld.commons.model.ItemType;
import com.ideazworld.amber.dao.entity.AbstractRefEntity;
import com.ideazworld.amber.dao.entity.core.Location;
import com.ideazworld.amber.dao.entity.core.Tag;

/**
 * The persistent class for the item database table.
 * 
 */
@Inheritance(strategy = InheritanceType.JOINED)
@DiscriminatorColumn(name = "ITEM_TYPE", discriminatorType = DiscriminatorType.STRING)
@Entity
public abstract class Item extends AbstractRefEntity {
	/**
	 * 
	 */
	private static final long serialVersionUID = 8142778816915825675L;

	private String description;

	@Enumerated(EnumType.STRING)
	private ItemType itemType;

	private String category;

	private String subCategory;

	private int expectedPrice;

	private String itemCondition;

	private int marketPrice;

	@Enumerated(EnumType.STRING)
	private ItemStatusType status;

	private String statusMessage;

	@Type(type = "org.hibernate.type.NumericBooleanType")
	private byte shareContact;

	// bi-directional many-to-one association to Attachment
	@OneToMany(mappedBy = "item", cascade = CascadeType.ALL, orphanRemoval = true)
	private List<Attachment> attachments;

	// bi-directional many-to-one association to Brand
	@ManyToOne
	@JoinColumn(name = "brand_id")
	private Brand brand;

	// bi-directional many-to-one association to Location
	@ManyToOne
	@JoinColumn(name = "location_id")
	private Location location;

	@OneToMany(cascade = CascadeType.ALL, orphanRemoval = true)
	@JoinTable(name = "item_tags", joinColumns = { @JoinColumn(name = "item_id") }, inverseJoinColumns = { @JoinColumn(name = "tag_id") })
	private List<Tag> tags;

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public ItemType getItemType() {
		return itemType;
	}

	public void setItemType(ItemType itemType) {
		this.itemType = itemType;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getSubCategory() {
		return subCategory;
	}

	public void setSubCategory(String subCategory) {
		this.subCategory = subCategory;
	}

	public int getExpectedPrice() {
		return expectedPrice;
	}

	public void setExpectedPrice(int expectedPrice) {
		this.expectedPrice = expectedPrice;
	}

	public String getItemCondition() {
		return itemCondition;
	}

	public void setItemCondition(String itemCondition) {
		this.itemCondition = itemCondition;
	}

	public int getMarketPrice() {
		return marketPrice;
	}

	public void setMarketPrice(int marketPrice) {
		this.marketPrice = marketPrice;
	}

	public ItemStatusType getStatus() {
		return status;
	}

	public void setStatus(ItemStatusType status) {
		this.status = status;
	}

	public String getStatusMessage() {
		return statusMessage;
	}

	public void setStatusMessage(String statusMessage) {
		this.statusMessage = statusMessage;
	}

	public byte getShareContact() {
		return shareContact;
	}

	public void setShareContact(byte shareContact) {
		this.shareContact = shareContact;
	}

	public List<Attachment> getAttachments() {
		return attachments;
	}

	public void setAttachments(List<Attachment> attachments) {
		this.attachments = attachments;
	}

	public Brand getBrand() {
		return brand;
	}

	public void setBrand(Brand brand) {
		this.brand = brand;
	}

	public Location getLocation() {
		return location;
	}

	public void setLocation(Location location) {
		this.location = location;
	}

	public List<Tag> getTags() {
		return tags;
	}

	public void setTags(List<Tag> tags) {
		this.tags = tags;
	}
}