package com.ideazworld.amber.service;

import java.io.Serializable;
import java.util.List;

import com.amber.ideazworld.schema.beans.core.IdObject;
import com.ideazworld.amber.dao.entity.AbstractPkEntity;

public interface PersistenceService<T extends IdObject, E extends AbstractPkEntity, I extends Serializable> {

	public T findById(I id);

	public List<T> findAll();

	public void save(T entity);
	
	public void saveAll(List<T> list);

	public void update(T obj);
	
	public void updateAll(List<T> list);
	
	public void delete(T entity);
}
