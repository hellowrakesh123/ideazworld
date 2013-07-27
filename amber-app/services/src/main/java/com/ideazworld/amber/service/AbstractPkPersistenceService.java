package com.ideazworld.amber.service;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.validation.constraints.NotNull;

import org.apache.commons.collections.IteratorUtils;
import org.springframework.transaction.annotation.Transactional;

import com.amber.ideazworld.schema.beans.core.IdObject;
import com.ideazworld.amber.converter.Converter;
import com.ideazworld.amber.dao.entity.AbstractPkEntity;
import com.ideazworld.amber.dao.repository.BaseRepository;
import com.ideazworld.amber.service.exception.InvalidOperationException;

@Transactional(readOnly = true)
public abstract class AbstractPkPersistenceService<T extends IdObject, C extends Converter<T, E>, E extends AbstractPkEntity, I extends Serializable, R extends BaseRepository<E, I>>
		implements PersistenceService<T, E, I> {

	protected final R repository;
	protected final Converter<T, E> converter;

	public AbstractPkPersistenceService(Converter<T, E> converter, R repository) {
		this.converter = converter;
		this.repository = repository;
	}

	@Override
	public T findById(@NotNull I id) {
		E entity = repository.findOne(id);
		return converter.convertFrom(entity);
	}

	@Override
	public List<T> findAll() {
		Iterable<E> itr = repository.findAll();
		return converter.convertFrom(toList(itr));
	}

	@Transactional(readOnly = false)
	@Override
	public T save(@NotNull T obj) {
		E entity = converter.convertTo(obj);
		entity = repository.save(entity);
		return converter.convertFrom(entity);
	}

	@Transactional(readOnly = false)
	@Override
	public List<T> saveAll(@NotNull List<T> list) {
		List<E> entities = repository.save(converter.convertTo(list));
		return converter.convertFrom(entities);
	}

	@Transactional(readOnly = false)
	@Override
	public T update(@NotNull T obj) {
		if (obj.getId() < 1) {
			throw new InvalidOperationException(
					"Error while performing update operation, only existing objects can be updated.");
		}
		return save(obj);
	}

	@Transactional(readOnly = false)
	@Override
	public List<T> updateAll(@NotNull List<T> list) {
		List<T> updatedList = new ArrayList<>();
		for (T t : list) {
			updatedList.add(update(t));
		}
		return updatedList;
	}

	@Transactional(readOnly = false)
	@Override
	public void delete(@NotNull T obj) {
		repository.delete(converter.convertTo(obj));
	}

	@SuppressWarnings("unchecked")
	protected <O> List<O> toList(Iterable<O> iterable) {
		List<O> list = null;
		if (iterable != null) {
			list = IteratorUtils.toList(iterable.iterator());
		}
		return list;
	}
}
