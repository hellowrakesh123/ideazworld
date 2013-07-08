package com.ideazworld.amber.dao.repository;

import java.io.Serializable;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.NoRepositoryBean;

import com.ideazworld.amber.dao.entity.AbstractEntity;

@NoRepositoryBean
public interface BaseRepository<E extends AbstractEntity, I extends Serializable> extends JpaRepository<E, I> {

	public E findRef(String ref);
}
