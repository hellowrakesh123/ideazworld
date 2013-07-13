package com.ideazworld.amber.service;

import java.io.Serializable;
import java.util.Date;

import org.springframework.transaction.annotation.Transactional;

import com.amber.ideazworld.schema.beans.core.BaseObject;
import com.ideazworld.amber.converter.Converter;
import com.ideazworld.amber.dao.entity.AbstractBaseEntity;
import com.ideazworld.amber.dao.repository.BaseRepository;

@Transactional(readOnly = true)
public abstract class AbstractBasePersistenceService<T extends BaseObject, C extends Converter<T, E>, E extends AbstractBaseEntity, I extends Serializable, R extends BaseRepository<E, I>>
		extends AbstractPkPersistenceService<T, C, E, I, R> {

	public AbstractBasePersistenceService(Converter<T, E> converter,
			R repository) {
		super(converter, repository);
	}

	@Transactional(readOnly = false)
	@Override
	public void save(T obj) {
		if (obj.getId() < 1) {
			obj.setCreatedTime(new Date());
			obj.setCreatedBy("hellowrakesh123@gmail.com");
		} else {
			obj.setUpdatedBy("hellowrakesh123@gmail.com");
		}
		super.save(obj);
	}
}
