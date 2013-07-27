package com.ideazworld.amber.converter.core;

import org.dozer.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.amber.ideazworld.schema.beans.core.Location;
import com.ideazworld.amber.converter.AbstractConverter;

@Component
public class LocationConverter extends
		AbstractConverter<Location, com.ideazworld.amber.dao.entity.core.Location> {

	@Autowired
	public LocationConverter(Mapper mapper) {
		super(mapper, Location.class, com.ideazworld.amber.dao.entity.core.Location.class);
	}
}
