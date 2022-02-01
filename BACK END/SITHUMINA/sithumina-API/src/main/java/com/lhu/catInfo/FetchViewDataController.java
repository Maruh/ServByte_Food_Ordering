package com.lhu.catInfo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

@CrossOrigin(origins = "http://localhost:4200")
@RestController
@RequestMapping("/sithumina-fetch-data")
public class FetchViewDataController {
	@Autowired
	private RestTemplate restTemplate;

	@RequestMapping("/getCategories")
	public Object[] getCategories() {
		System.out.println("ServByte, Inc : /getCategories");
		Object[] respose = {};
		try {	
			respose = restTemplate.getForObject("http://sithumina-fetch-data/getCategories",Object[].class);
			System.out.println("respose " +respose);
			
		}catch (Exception e) {
			System.out.println("FAILED TO GET CATEGORIES | ServByte, Inc..");
		}		
		return respose;
	}

	@RequestMapping("/getBrands")
	public Object[] getBrands() {
		System.out.println("ServByte, Inc : /getBrands");
		Object[] respose = {};
		try {	
			respose = restTemplate.getForObject("http://sithumina-fetch-data/getBrands",Object[].class);
			System.out.println("respose " +respose);
			
		}catch (Exception e) {
			System.out.println("FAILED TO GET BRANCHES | ServByte, Inc..");
		}		
		return respose;
	}
	
	@RequestMapping("/getBranches")
	public Object[] getBranches() {
		System.out.println("ServByte, Inc : /getBranches");
		Object[] respose = {};
		try {	
			respose = restTemplate.getForObject("http://sithumina-fetch-data/getBranches",Object[].class);
			System.out.println("respose " +respose);
			
		}catch (Exception e) {
			System.out.println("FAILED TO GET BRANCHES | ServByte, Inc..");
		}		
		return respose;
	}
	
	@RequestMapping("/getItems")
	//@Consumes({MediaType.APPLICATION_JSON})
	public Object[] getItems() {
		System.out.println("ServByte, Inc : /getItems");
		Object[] respose = {};
		try {	
			respose = restTemplate.getForObject("http://sithumina-fetch-data/getItems",Object[].class);
			System.out.println("respose " +respose);
			
		}catch (Exception e) {
			System.out.println("FAILED TO GET ITEMS | ServByte, Inc..");
		}		
		return respose;
	}
	
	@RequestMapping("/getItemsByCategory/{categoryId}")
	public Object[] getItemByCategory(@PathVariable("categoryId") int categoryId) {
		System.out.println("ServByte, Inc : /getItemsByCategory/{categoryId}");
		Object[] respose = {};
		try {	
			respose = restTemplate.getForObject("http://sithumina-fetch-data/getItemsByCategory/"+categoryId,Object[].class);
			System.out.println("respose " +respose);
			
		}catch (Exception e) {
			System.out.println("FAILED TO GET BRANDS | ServByte, Inc..");
		}		
		return respose;
	}
	
	@RequestMapping("/getItemsByBrand/{brandId}")
	public Object[] getItemByBrand(@PathVariable("brandId") int brandId) {
		System.out.println("ServByte, Inc : /getItemsByBrand/{brandId}");
		Object[] respose = {};
		try {	
			respose = restTemplate.getForObject("http://sithumina-fetch-data/getItemsByBrand/"+brandId,Object[].class);
			System.out.println("respose " +respose);
			
		}catch (Exception e) {
			System.out.println("FAILED TO GET ITEM BY BRANDS | ServByte, Inc..");
		}		
		return respose;
	}
	
	@RequestMapping("/getItemsByBranch/{branchId}")
	public Object[] getItemByBranch(@PathVariable("branchId") int branchId) {
		System.out.println("ServByte, Inc : /getItemsByBrand/{brandId}");
		Object[] respose = {};
		try {	
			respose = restTemplate.getForObject("http://sithumina-fetch-data/getItemsByBranch/"+branchId,Object[].class);
			System.out.println("respose " +respose);
			
		}catch (Exception e) {
			System.out.println("FAILED TO GET ITEM BY BRANCHES | ServByte, Inc..");
		}		
		return respose;
	}

	@RequestMapping("/getItem/{itemId}")
	public Object getItemByItemId(@PathVariable("itemId") int itemId) {
		System.out.println("ServByte, Inc : /getItem/{itemId}");
		Object respose = new Object();
		try {	
			respose = restTemplate.getForObject("http://sithumina-fetch-data/getItem/"+itemId,Object.class);
			System.out.println("respose " +respose);
			
		}catch (Exception e) {
			System.out.println("FAILED TO GET ITEM BY ITEM_ID | ServByte, Inc..");
		}		
		return respose;
	}


}
