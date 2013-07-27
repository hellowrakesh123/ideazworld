package com.ideazworld.amber.service.item;

import java.io.Serializable;

import com.amber.ideazworld.schema.beans.item.Item;
import com.ideazworld.amber.converter.core.LocationConverter;
import com.ideazworld.amber.converter.item.ItemConverter;
import com.ideazworld.amber.dao.entity.core.Location;
import com.ideazworld.amber.dao.repository.core.LocationRepository;
import com.ideazworld.amber.dao.repository.item.ItemRepository;
import com.ideazworld.amber.service.AbstractRefPersistenceService;

public abstract class AbstractItemService<T extends Item, E extends com.ideazworld.amber.dao.entity.item.Item, C extends ItemConverter<T, E>, I extends Serializable, R extends ItemRepository<E, I>> extends AbstractRefPersistenceService<T, C, E, I, R> {

	protected LocationRepository locationRepository;
	protected LocationConverter locationConverter;
	
	public AbstractItemService(C converter, R repository, LocationRepository locationRepository, LocationConverter locationConverter) {
		super(converter, repository);
		this.locationRepository = locationRepository;
		this.locationConverter = locationConverter;
	}
	
	@Override
	protected void doSave(T item) {
		//check if location already exists
		Location location = locationConverter.convertTo(item.getLocation());
		if(location.getId() < 1) {
			location = locationRepository.save(location);
		}
		item.setLocation(locationConverter.convertFrom(location));
		super.doSave(item);
	}
}
