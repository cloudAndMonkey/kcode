package com.extensiblejava.hello.service2.impl;
import java.util.Properties;
import com.extensiblejava.hello.service.HelloService;

public class HelloServiceImpl implements HelloService {

	public String sayHello() {
		return "From the 2nd service - Hello OSGi Spring World!! ";
	}

	public String sayGoodbye() {
		return "From the 2nd service - Goodbye OSGi Spring World!!";
	}
}
