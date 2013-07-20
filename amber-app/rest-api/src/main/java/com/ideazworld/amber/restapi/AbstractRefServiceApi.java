package com.ideazworld.amber.restapi;

import java.io.Serializable;
import java.util.List;

import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
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
	@Path("findById/{id}")
	@Produces(MediaType.APPLICATION_JSON)
	public T findById(@PathParam("id") I id) {
		return service.findById(id);
	}

	@GET
	@Path("findAll")
	@Produces(MediaType.APPLICATION_JSON)
	public List<T> findAll() {
		return service.findAll();
	}

	@POST
	@Path("save")
	@Consumes(MediaType.APPLICATION_JSON)
	public void save(T obj) {
		service.save(obj);
	}

	@POST
	@Path("saveAll")
	@Consumes(MediaType.APPLICATION_JSON)
	public void saveAll(List<T> list) {
		service.saveAll(list);
	}

	@PUT
	@Path("update")
	@Consumes(MediaType.APPLICATION_JSON)
	public void update(T obj) {
		service.update(obj);
	}

	@PUT
	@Path("updateAll")
	@Consumes(MediaType.APPLICATION_JSON)
	public void updateAll(List<T> list) {
		service.updateAll(list);
	}

	@DELETE
	@Path("delete")
	@Consumes(MediaType.APPLICATION_JSON)
	public void delete(T obj) {
		service.delete(obj);
	}
}