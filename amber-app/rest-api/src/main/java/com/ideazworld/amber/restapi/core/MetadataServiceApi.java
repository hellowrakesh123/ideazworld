package com.ideazworld.amber.restapi.core;

import java.util.List;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.amber.ideazworld.schema.beans.core.Metadata;
import com.ideazworld.amber.restapi.AbstractServiceApi;
import com.ideazworld.amber.service.core.MetadataService;

@Path("/metadata")
@Service
public class MetadataServiceApi
		extends
		AbstractServiceApi<Metadata, com.ideazworld.amber.dao.entity.core.Metadata, Integer, MetadataService> {

	@Autowired
	public MetadataServiceApi(MetadataService service) {
		super("metadata", service);
	}
	
	@GET
	@Path("type/{type}")
	@Produces(MediaType.APPLICATION_JSON)
	public List<Metadata> findByType(@PathParam("type") String type) {
		return service.findByType(type);
	}
}