package com.ideazworld.amber.dao.repository;

import java.io.Serializable;

import org.springframework.data.repository.NoRepositoryBean;

import com.ideazworld.amber.dao.entity.AbstractRefEntity;

@NoRepositoryBean
public interface RefRepository<E extends AbstractRefEntity, I extends Serializable>
		extends BaseRepository<E, I> {

	public E findByRef(String ref);
}