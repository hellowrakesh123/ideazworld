package com.ideazworld.amber.service;

import java.io.Serializable;
import java.util.List;

import com.amber.ideazworld.schema.beans.core.BaseObject;
import com.ideazworld.amber.dao.entity.AbstractEntity;

public interface PersistenceService<T extends BaseObject, E extends AbstractEntity, I extends Serializable> {

	public T findById(I id);

	public List<T> findAll();

	public void save(T entity);
	
	public void saveAll(List<T> list);

	public void update(T obj);
	
	public void updateAll(List<T> list);
	
	public void delete(T entity);
}
