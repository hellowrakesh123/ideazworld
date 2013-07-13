package com.ideazworld.amber.service;

import java.io.Serializable;

import org.springframework.transaction.annotation.Transactional;

import com.amber.ideazworld.schema.beans.core.BaseRefObject;
import com.ideazworld.amber.converter.Converter;
import com.ideazworld.amber.dao.entity.AbstractRefEntity;
import com.ideazworld.amber.dao.repository.RefRepository;

@Transactional(readOnly = true)
public abstract class AbstractRefPersistenceService<T extends BaseRefObject, C extends Converter<T, E>, E extends AbstractRefEntity, I extends Serializable, R extends RefRepository<E, I>>
		extends AbstractBasePersistenceService<T, C, E, I, R> implements
		RefPersistenceService<T, E, I> {

	public AbstractRefPersistenceService(Converter<T, E> converter, R repository) {
		super(converter, repository);
	}

	@Override
	public T findByRef(String ref) {
		E entity = repository.findByRef(ref);
		return converter.convertFrom(entity);
	}
}
