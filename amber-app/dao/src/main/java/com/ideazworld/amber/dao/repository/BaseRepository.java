package com.ideazworld.amber.dao.repository;

import java.io.Serializable;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.NoRepositoryBean;

import com.ideazworld.amber.dao.entity.AbstractPkEntity;

@NoRepositoryBean
public interface BaseRepository<E extends AbstractPkEntity, I extends Serializable>
		extends JpaRepository<E, I> {

}
