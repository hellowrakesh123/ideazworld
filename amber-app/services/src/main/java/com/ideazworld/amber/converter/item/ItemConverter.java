package com.ideazworld.amber.converter.item;

import org.dozer.Mapper;

import com.amber.ideazworld.schema.beans.item.Item;
import com.ideazworld.amber.converter.AbstractRefConverter;

public abstract class ItemConverter<T extends Item, V extends com.ideazworld.amber.dao.entity.item.Item> extends AbstractRefConverter<T, V> {

	public ItemConverter(Mapper mapper, Class<T> tClazz, Class<V> vClazz) {
		super(mapper, tClazz, vClazz);
	}
}
