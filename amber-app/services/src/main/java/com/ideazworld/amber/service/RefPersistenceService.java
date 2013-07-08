package com.ideazworld.amber.service;

import java.io.Serializable;

import com.amber.ideazworld.schema.beans.core.BaseRefObject;
import com.ideazworld.amber.dao.entity.AbstractRefEntity;

public interface RefPersistenceService<T extends BaseRefObject, E extends AbstractRefEntity, I extends Serializable>
		extends PersistenceService<T, E, I> {

	public T findByRef(String ref);
}
