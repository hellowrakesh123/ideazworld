package com.ideazworld.amber.service;

import java.io.Serializable;
import java.util.List;

import javax.validation.constraints.NotNull;

import org.apache.commons.collections.IteratorUtils;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.transaction.annotation.Transactional;

import com.amber.ideazworld.schema.beans.core.BaseObject;
import com.ideazworld.amber.converter.Converter;
import com.ideazworld.amber.dao.entity.AbstractEntity;
import com.ideazworld.amber.service.exception.InvalidOperationException;

@Transactional(readOnly = true)
public abstract class AbstractPersistenceService<T extends BaseObject, C extends Converter<T, E>, E extends AbstractEntity, I extends Serializable, R extends JpaRepository<E, I>>
		implements PersistenceService<T, E, I> {

	protected final R repository;
	protected final Converter<T, E> converter;

	public AbstractPersistenceService(Converter<T, E> converter, R repository) {
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
	public void save(@NotNull T obj) {
		repository.save(converter.convertTo(obj));
	}

	@Transactional(readOnly = false)
	@Override
	public void saveAll(@NotNull List<T> list) {
		repository.save(converter.convertTo(list));
	}

	@Transactional(readOnly = false)
	@Override
	public void update(@NotNull T obj) {
		if (obj.getId() < 1) {
			throw new InvalidOperationException(
					"Error while performing update operation, only existing objects can be updated.");
		}
		repository.save(converter.convertTo(obj));
	}

	@Transactional(readOnly = false)
	@Override
	public void updateAll(@NotNull List<T> list) {
		for (T t : list) {
			update(t);
		}
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
