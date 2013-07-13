package com.ideazworld.amber.dao.repository.item;

import com.ideazworld.amber.dao.entity.item.Item;
import com.ideazworld.amber.dao.repository.RefRepository;

public interface ItemRepository extends RefRepository<Item, Integer> {

	@Override
	public Item findByRef(String ref);
}
