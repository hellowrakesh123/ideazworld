package com.ideazworld.amber.restapi.core;

import java.util.Arrays;
import java.util.List;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import org.springframework.stereotype.Service;

import com.amber.ideazworld.commons.model.ItemConditionType;
import com.amber.ideazworld.commons.model.ItemStatusType;

@Path("/types")
@Service
public class TypeServiceApi {

	@GET
	@Path("/item-status")
	@Produces(MediaType.APPLICATION_JSON)
	public List<ItemStatusType> findAllItemStatus() {
		return Arrays.asList(ItemStatusType.values());
	}
	
	@GET
	@Path("/item-condition")
	@Produces(MediaType.APPLICATION_JSON)
	public List<ItemConditionType> findAllItemCondition() {
		return Arrays.asList(ItemConditionType.values());
	}
}