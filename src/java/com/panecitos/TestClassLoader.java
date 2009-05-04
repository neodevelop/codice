package com.panecitos;

import java.net.URL;

public class TestClassLoader {

	public static void main(String[] args) {
		
		TestClassLoader tcl = new TestClassLoader();
		URL url = tcl.getClass().getClassLoader().getResource("com/panecitos");
		
		System.out.println( url );
		
	}	
	
}
