package com.milkliver.springcloud.test.testjob01.jobs;

import javax.annotation.PostConstruct;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

@Component
public class Job01 {

	private static final Logger log = LoggerFactory.getLogger(Job01.class);

	@PostConstruct
	public void run() {

		log.info("2022,05,19 14:06");
		log.info("this is java job01");

	}

}
