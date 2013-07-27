package com.ideazworld.amber.restapi;

import java.io.Serializable;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import com.amber.ideazworld.schema.beans.core.RefObject;
import com.ideazworld.amber.dao.entity.AbstractRefEntity;
import com.ideazworld.amber.service.RefPersistenceService;

public abstract class AbstractRefServiceApi<T extends RefObject, E extends AbstractRefEntity, I extends Serializable, S extends RefPersistenceService<T, E, I>>
		extends AbstractServiceApi<T, E, I, S> {

	protected final String resourceName;
	protected final S service;

	public AbstractRefServiceApi(String resourceName, S service) {
		super(resourceName, service);
		this.resourceName = resourceName;
		this.service = service;
	}

	@GET
	@Path("findByRef/{ref}")
	@Produces(MediaType.APPLICATION_JSON)
	public T findById(@PathParam("ref") String ref) {
		return service.findByRef(ref);
	}
}
