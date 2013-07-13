package com.ideazworld.amber.service.core;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.amber.ideazworld.schema.beans.core.Tag;
import com.ideazworld.amber.converter.core.TagConverter;
import com.ideazworld.amber.dao.repository.core.TagRepository;
import com.ideazworld.amber.service.AbstractPkPersistenceService;

@Service
public class TagServiceImpl
		extends
		AbstractPkPersistenceService<Tag, TagConverter, com.ideazworld.amber.dao.entity.core.Tag, Integer, TagRepository>
		implements TagService {

	@Autowired
	public TagServiceImpl(TagConverter converter, TagRepository repository) {
		super(converter, repository);
	}
}
