package com.kosa.calculator.controller;

import java.net.URI;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import com.kosa.calculator.model.CalculatorVo;

@Controller
public class MainController {
	
	@GetMapping("/")
	public String home() {
		return "home";
	}
	
	@GetMapping("/result")
	public String result(CalculatorVo vo, Model model) {
		RestTemplate restTemplate = new RestTemplate();
		
		UriComponents uriComponents = UriComponentsBuilder
				 	.fromUriString("http://192.168.44.129:8080/calculator")
				 	.queryParam("height", vo.getHeight())
				 	.queryParam("weight", vo.getWeight())
				 	.queryParam("gender", vo.getGender())
				 	.queryParam("age", vo.getAge())
				 	.queryParam("goalWeight", vo.getGoalWeight())
				 	.queryParam("active", vo.getActive()).build();
				 	
		URI uri = uriComponents.toUri(); 		 	
		CalculatorVo result = restTemplate.getForObject(uri, CalculatorVo.class);
		model.addAttribute("result", result);
		return "result";
	}
	
	@GetMapping("/excersice")
	public String excersicePage(Model model) {
		RestTemplate restTemplate = new RestTemplate();
		
		JSONObject result = restTemplate.getForObject("http://192.168.44.129:8080/calculator", JSONObject.class);
		
		
		model.addAttribute("result", result);
		return "excersice";
	}
}
