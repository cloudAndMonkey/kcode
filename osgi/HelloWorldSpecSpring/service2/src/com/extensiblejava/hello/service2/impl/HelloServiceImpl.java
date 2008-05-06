package com.extensiblejava.hello.service2.impl;

import java.util.Properties;
import com.extensiblejava.hello.service.HelloService;

public class HelloServiceImpl implements HelloService {

	public String sayHello() {
		return "2nd Service - Hello OSGi Spring World!! ";
	}

	public String sayGoodbye() {
		return "2nd Service - Goodbye OSGi Spring World!!";
	}
}
