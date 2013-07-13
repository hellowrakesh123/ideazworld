package com.ideazworld.amber.service.core;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.amber.ideazworld.commons.model.MetadataType;
import com.amber.ideazworld.schema.beans.core.Metadata;
import com.ideazworld.amber.converter.core.MetadataConverter;
import com.ideazworld.amber.dao.repository.core.MetadataRepository;
import com.ideazworld.amber.service.AbstractPkPersistenceService;

@Service
public class MetadataServiceImpl
		extends
		AbstractPkPersistenceService<Metadata, MetadataConverter, com.ideazworld.amber.dao.entity.core.Metadata, Integer, MetadataRepository>
		implements MetadataService {

	@Autowired
	public MetadataServiceImpl(MetadataConverter converter, MetadataRepository repository) {
		super(converter, repository);
	}
	
	@Override
	public List<Metadata> findByType(String type) {
		if(type == null) {
			return new ArrayList<>(0);
		}
		List<Metadata> metadataList = converter.convertFrom(repository.findByType(MetadataType.valueOf(type.toUpperCase())));
		return metadataList;
	}
}
