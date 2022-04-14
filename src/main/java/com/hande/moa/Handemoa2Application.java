package com.hande.moa;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan
@ComponentScan(basePackages = "admin")
@MapperScan(basePackages = "admin")
public class Handemoa2Application {

	public static void main(String[] args) {
		SpringApplication.run(Handemoa2Application.class, args);
	}

}
