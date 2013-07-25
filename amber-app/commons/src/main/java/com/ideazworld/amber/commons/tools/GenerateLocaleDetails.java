package com.ideazworld.amber.commons.tools;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jettison.json.JSONArray;
import org.codehaus.jettison.json.JSONObject;

@SuppressWarnings("all")
public class GenerateLocaleDetails {

	public static void main(String[] args) {
		try {
			JSONArray stateArray = new JSONArray();
			ObjectMapper mapper = new ObjectMapper();
			String stateDetails = getServiceData("state", null);
			List stateList = mapper.readValue(stateDetails, List.class);
			for(int index = 0; index < stateList.size(); index++) {
				JSONObject stateObject = new JSONObject();
				LinkedHashMap object = (LinkedHashMap) stateList.get(index);
				stateObject.put("ID", object.get("ID").toString());
				stateObject.put("Name", object.get("Name").toString());
				stateObject.put("Type", object.get("Type").toString());
				stateObject.put("cities", new JSONArray());
				stateArray.put(stateObject);
			}
			for(int stateIndex=0;stateIndex<stateArray.length();stateIndex++) {
				JSONObject stateObject = (JSONObject)stateArray.get(stateIndex);
				String stateId = stateObject.getString("ID");
				JSONArray cityArray = stateObject.getJSONArray("cities");
				try {
					String citiDetails = getServiceData("city", stateId);
					List cityList = mapper.readValue(citiDetails, List.class);
					for(int cityIndex = 0; cityIndex < cityList.size(); cityIndex++) {
						JSONObject cityObject = new JSONObject();
						LinkedHashMap object = (LinkedHashMap) cityList.get(cityIndex);
						cityObject.put("city", object.get("city").toString());
						JSONArray localityArray = new JSONArray();
						cityArray.put(cityObject);
						
						try {
							String localDetails = getServiceData("local", object.get("city").toString());
							try {
								List localityList = mapper.readValue(localDetails, List.class);
								for(int localityIndex = 0; localityIndex < localityList.size(); localityIndex++) {
									JSONObject localityObject = new JSONObject();
									LinkedHashMap obj = (LinkedHashMap) localityList.get(localityIndex);
									localityObject.put("Locality", obj.get("Address").toString());
									localityObject.put("Zipcode", obj.get("Pincode").toString());
									localityArray.put(localityObject);
								}
								if(localityArray.length() > 0) {
									cityObject.put("localities", localityArray);
								} else {
									cityObject.put("localities", new ArrayList<>());
								}
							} catch(JsonMappingException jsonMappingException) {
								jsonMappingException.printStackTrace();
							}
						} catch(Exception exception) {
							exception.printStackTrace();
						}
					}
					saveToFile(stateObject.toString(), stateObject.getString("Name"));
				} catch(Exception exception) {
					exception.printStackTrace();
				}
			}
			//mapper.defaultPrettyPrintingWriter().writeValue(new File("/Users/ruchipandeya/Projects/repos/ideazworld/amber-app/commons/src/main/java/india.json"), mapper.d);
		} catch(Exception exception) {
			exception.printStackTrace();
		}
		System.out.println("Done...!!!!!!!!!!!!!!!!!!!!!!!!!!!");
	}
	
	public static String getServiceData(String type, String value) {
		String url = null;
		if(type.equals("state")) {
			url = "http://www.whizapi.com/api/util/ui/in/indian-states-list.htm?appkey=JNgaPn9m";
		} else if(type.equals("city")) {
			url = "http://www.whizapi.com/api/util/ui/in/indian-city-by-state.htm?stateid=" + value + "&appkey=JNgaPn9m";
		} else if(type.equals("local")) {
			value = value.replace(" ", "+");
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
	
	public static void saveToFile(String content, String fileName) {
		fileName = fileName.trim();
		fileName = fileName.replace(" ", "_");
		fileName = fileName.replace("*", "");
		String filePath = "/Users/ruchipandeya/Projects/repos/ideazworld/amber-app/commons/india/" + fileName;
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
			
			ObjectMapper mapper = new ObjectMapper();
			Object object = mapper.readValue(file, Object.class);
			content = mapper.defaultPrettyPrintingWriter().writeValueAsString(object);
			fw = new FileWriter(file.getAbsoluteFile());
			bw = new BufferedWriter(fw);
			bw.write(content);
			bw.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
