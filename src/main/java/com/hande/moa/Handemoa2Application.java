package com.hande.moa;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan
@ComponentScan(basePackages = "report")
@MapperScan(basePackages = "report")
@ComponentScan(basePackages = "bookmark")
@MapperScan(basePackages = "bookmark")
@ComponentScan(basePackages = "adminreport")
@MapperScan(basePackages = "adminreport")
@ComponentScan(basePackages = "admincomment")
@MapperScan(basePackages = "admincomment")
@ComponentScan(basePackages = "admin")
@ComponentScan(basePackages = "member")
@MapperScan(basePackages = "member")
public class Handemoa2Application {

	public static void main(String[] args) {
		SpringApplication.run(Handemoa2Application.class, args);
	}

}
