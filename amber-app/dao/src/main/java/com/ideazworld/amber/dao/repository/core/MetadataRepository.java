package com.ideazworld.amber.dao.repository.core;

import java.util.List;

import com.amber.ideazworld.commons.model.MetadataType;
import com.ideazworld.amber.dao.entity.core.Metadata;
import com.ideazworld.amber.dao.repository.BaseRepository;

public interface MetadataRepository extends BaseRepository<Metadata, Integer> {

	public List<Metadata> findByType(MetadataType type);
}