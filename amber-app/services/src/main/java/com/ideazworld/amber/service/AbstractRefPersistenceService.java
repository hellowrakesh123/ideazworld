package com.ideazworld.amber.service;

import java.io.Serializable;
import java.util.Date;

import com.amber.ideazworld.schema.beans.core.RefObject;
import com.ideazworld.amber.converter.Converter;
import com.ideazworld.amber.dao.entity.AbstractRefEntity;
import com.ideazworld.amber.dao.repository.RefRepository;

public abstract class AbstractRefPersistenceService<T extends RefObject, C extends Converter<T, E>, E extends AbstractRefEntity, I extends Serializable, R extends RefRepository<E, I>>
		extends AbstractPkPersistenceService<T, C, E, I, R> implements
		RefPersistenceService<T, E, I> {

	public AbstractRefPersistenceService(Converter<T, E> converter, R repository) {
		super(converter, repository);
	}

	@Override
	protected void doSave(T obj) {
		if (obj.getId() < 1) {
			obj.setCreatedTime(new Date());
			obj.setCreatedBy("hellowrakesh123@gmail.com");
		}
		obj.setUpdatedTime(new Date());
		obj.setUpdatedBy("hellowrakesh123@gmail.com");
	}
	
	@Override
	public T findByRef(String ref) {
		E entity = repository.findByReference(ref);
		return converter.convertFrom(entity);
	}
}
