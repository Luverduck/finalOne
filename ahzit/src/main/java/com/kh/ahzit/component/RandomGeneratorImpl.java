package com.kh.ahzit.component;

import java.text.DecimalFormat;
import java.text.Format;
import java.util.Random;

import org.springframework.stereotype.Component;

@Component
public class RandomGeneratorImpl implements RandomGenerator{

	private Random r = new Random();
	
	@Override
	public String generatSerial(int size) {
		//Math.pow 제곱 구하는 식
		int range = (int)Math.pow(10, size);
		int number = r.nextInt(range);
		System.out.println(number);
		
		StringBuffer buffer = new StringBuffer();
		for (int i = 0; i < size; i++) {
			buffer.append("0");
		}
		Format f = new DecimalFormat(buffer.toString());
		String certificationKey = f.format(number);
		return certificationKey;
	}

}
