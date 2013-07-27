package com.ideazworld.amber.service;

import java.io.Serializable;
import java.util.List;

import com.amber.ideazworld.schema.beans.core.IdObject;
import com.ideazworld.amber.dao.entity.AbstractPkEntity;

public interface PersistenceService<T extends IdObject, E extends AbstractPkEntity, I extends Serializable> {

	public T findById(I id);

	public List<T> findAll();

	public T save(T entity);

	public List<T> saveAll(List<T> list);

	public T update(T obj);

	public List<T> updateAll(List<T> list);

	public void delete(T entity);
}
