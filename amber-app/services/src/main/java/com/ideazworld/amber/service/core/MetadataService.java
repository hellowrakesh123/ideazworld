package com.ideazworld.amber.service.core;

import java.util.List;

import com.amber.ideazworld.schema.beans.core.Metadata;
import com.ideazworld.amber.service.PersistenceService;

public interface MetadataService
		extends
		PersistenceService<Metadata, com.ideazworld.amber.dao.entity.core.Metadata, Integer> {

	public List<Metadata> findByType(String type);
}
