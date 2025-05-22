package com.kosa.calculator.model;

import java.util.List;
import java.util.Map;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Setter
@Getter
public class CalculatorVo {
	private double height;
	private double weight;
	private int gender;
	private int age;
	private double active;
	private double goalWeight;
	
	private double bmr;
	private double tdee;
	private double minusTotalKcal;
	private int period;
	private List<Map<String,Object>> exerciseItems;
}
