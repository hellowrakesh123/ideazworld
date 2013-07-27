package com.ideazworld.amber.service.item;

import java.io.Serializable;

import com.amber.ideazworld.schema.beans.item.Item;
import com.ideazworld.amber.service.RefPersistenceService;

public interface ItemService<T extends Item, E extends com.ideazworld.amber.dao.entity.item.Item, I extends Serializable> extends RefPersistenceService<T, E, I> {

}
