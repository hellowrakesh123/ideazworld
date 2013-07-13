package com.ideazworld.amber.converter.core;

import org.dozer.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.amber.ideazworld.schema.beans.core.Metadata;
import com.ideazworld.amber.converter.AbstractConverter;

@Component
public class MetadataConverter extends
		AbstractConverter<Metadata, com.ideazworld.amber.dao.entity.core.Metadata> {

	@Autowired
	public MetadataConverter(Mapper mapper) {
		super(mapper, Metadata.class, com.ideazworld.amber.dao.entity.core.Metadata.class);
	}
}
