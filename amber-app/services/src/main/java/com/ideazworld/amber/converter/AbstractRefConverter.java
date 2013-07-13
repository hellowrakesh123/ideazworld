package com.ideazworld.amber.converter;

import java.util.UUID;

import org.dozer.Mapper;

import com.amber.ideazworld.commons.model.RefType;
import com.amber.ideazworld.schema.beans.core.BaseRefObject;
import com.amber.ideazworld.schema.beans.core.Ref;
import com.ideazworld.amber.dao.entity.AbstractRefEntity;

public abstract class AbstractRefConverter<T extends BaseRefObject, V extends AbstractRefEntity>
		extends AbstractConverter<T, V> {

	private Mapper mapper;
	private Class<T> tClazz;
	private Class<V> vClazz;

	public AbstractRefConverter(Mapper mapper, Class<T> tClazz, Class<V> vClazz) {
		super(mapper, tClazz, vClazz);
		this.mapper = mapper;
		this.tClazz = tClazz;
		this.vClazz = vClazz;
	}

	@Override
	public V convertTo(T t) {
		V v = null;
		if (t != null) {
			v = mapper.map(t, vClazz);
			if (t.getRef() != null) {
				Ref ref = t.getRef();
				v.setRef(ref.getRefId());
				v.setRefType(ref.getRefType());
			} else {
				v.setRef(UUID.randomUUID().toString());
				v.setRefType(RefType.valueOf(t.getClass().getSimpleName()
						.toUpperCase()));
			}
		}
		return v;
	}

	@Override
	public T convertFrom(V v) {
		T t = null;
		if (v != null) {
			t = mapper.map(v, tClazz);
			Ref ref = new Ref();
			ref.setRefId(v.getRef());
			ref.setRefType(v.getRefType());
			t.setRef(ref);
		}
		return t;
	}
}
