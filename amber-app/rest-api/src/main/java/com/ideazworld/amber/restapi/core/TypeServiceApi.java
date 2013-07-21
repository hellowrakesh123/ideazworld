package com.ideazworld.amber.restapi.core;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.Arrays;
import java.util.List;

import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import org.springframework.stereotype.Service;

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
	@Path("/external-api/{type}/{value}")
	@Produces(MediaType.APPLICATION_JSON)
	public String externalApi(@PathParam("type") String type, @PathParam("value") String value) {
		String url = null;
		if(type.equals("state")) {
			url = "http://www.whizapi.com/api/util/ui/in/indian-states-list.htm?appkey=JNgaPn9m";
		} else if(type.equals("city")) {
			url = "http://www.whizapi.com/api/util/ui/in/indian-city-by-state.htm?stateid=" + value + "&appkey=JNgaPn9m";
		} else if(type.equals("local")) {
			url = "http://www.whizapi.com/api/util/ui/in/indian-postal-codes.htm?search=" + value + "&appkey=JNgaPn9m";
		}
		System.out.println("url: " + url);
		StringBuilder responseBuilder = new StringBuilder();
		try {
			BufferedReader in = new BufferedReader(
	        new InputStreamReader(new URL(url).openStream()));

	        String inputLine;
	        while ((inputLine = in.readLine()) != null)
	        	responseBuilder.append(inputLine);
	        in.close();
		} catch(Exception exception) {
			exception.printStackTrace();
		}
		return responseBuilder.toString();
	}
	
	@POST
	@Path("/save-file/{filePath}")
	@Consumes(MediaType.APPLICATION_JSON)
	public void saveFile(@PathParam("filePath") String filePath, String content) {
		filePath = "/Users/sinhar/Personal/ideazworld/amber-app/web/src/main/webapp/data/locales/country/" + filePath;
		System.out.println("filePath: " + filePath + ", contents: " + content);
		try {
			File file = new File(filePath);
			// if file doesnt exists, then create it
			if (!file.exists()) {
				file.createNewFile();
			}
			FileWriter fw = new FileWriter(file.getAbsoluteFile());
			BufferedWriter bw = new BufferedWriter(fw);
			bw.write(content);
			bw.close();
			System.out.println("Done");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}