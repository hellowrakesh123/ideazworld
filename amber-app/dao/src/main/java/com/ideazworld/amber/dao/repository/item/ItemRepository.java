package com.ideazworld.amber.dao.repository.item;

import java.io.Serializable;

import com.ideazworld.amber.dao.entity.item.Item;
import com.ideazworld.amber.dao.repository.RefRepository;

public interface ItemRepository<E extends Item, I extends Serializable> extends RefRepository<E, I> {

}
