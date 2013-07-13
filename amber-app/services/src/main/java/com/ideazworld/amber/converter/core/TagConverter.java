package com.ideazworld.amber.converter.core;

import org.dozer.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.amber.ideazworld.schema.beans.core.Tag;
import com.ideazworld.amber.converter.AbstractConverter;

@Component
public class TagConverter extends
		AbstractConverter<Tag, com.ideazworld.amber.dao.entity.core.Tag> {

	@Autowired
	public TagConverter(Mapper mapper) {
		super(mapper, Tag.class, com.ideazworld.amber.dao.entity.core.Tag.class);
	}
}
