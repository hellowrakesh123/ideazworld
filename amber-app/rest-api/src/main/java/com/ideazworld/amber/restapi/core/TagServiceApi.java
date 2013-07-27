package com.ideazworld.amber.restapi.core;

import javax.ws.rs.Path;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.amber.ideazworld.schema.beans.core.Tag;
import com.ideazworld.amber.restapi.AbstractServiceApi;
import com.ideazworld.amber.service.core.TagService;

@Path("/tag")
@Service
public class TagServiceApi
		extends
		AbstractServiceApi<Tag, com.ideazworld.amber.dao.entity.core.Tag, Integer, TagService> {

	@Autowired
	public TagServiceApi(TagService service) {
		super("tag", service);
	}
}