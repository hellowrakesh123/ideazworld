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

import com.amber.ideazworld.schema.beans.core.IdObject;
import com.ideazworld.amber.dao.entity.AbstractPkEntity;
import com.ideazworld.amber.service.PersistenceService;

public abstract class AbstractServiceApi<T extends IdObject, E extends AbstractPkEntity, I extends Serializable, S extends PersistenceService<T, E, I>> {

	protected final String resourceName;
	protected final S service;

	public AbstractServiceApi(String resourceName, S service) {
		this.resourceName = resourceName;
		this.service = service;
	}

	@GET
	@Path("{id}")
	@Produces(MediaType.APPLICATION_JSON)
	public T findById(@PathParam("id") I id) {
		return service.findById(id);
	}

	@GET
	@Path("")
	@Produces(MediaType.APPLICATION_JSON)
	public List<T> findAll() {
		return service.findAll();
	}

	@POST
	@Path("save")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public T save(T obj) {
		return service.save(obj);
	}

	@POST
	@Path("saveAll")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public List<T> saveAll(List<T> list) {
		return service.saveAll(list);
	}

	@PUT
	@Path("update")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public T update(T obj) {
		return service.update(obj);
	}

	@PUT
	@Path("updateAll")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public List<T> updateAll(List<T> list) {
		return service.updateAll(list);
	}

	@DELETE
	@Path("delete")
	@Consumes(MediaType.APPLICATION_JSON)
	public void delete(T obj) {
		service.delete(obj);
	}
}
