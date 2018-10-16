package com.MaxDavisUCLATFXC.TrainingLogApp;

import javafx.application.Application;
import org.slf4j.LoggerFactory;
import org.slf4j.Logger;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

@SpringBootApplication
public class TrainingLogAppApplication {

//	private static final Logger log = LoggerFactory.getLogger(Application.class);

	public static void main(String[] args) {
		SpringApplication.run(TrainingLogAppApplication.class, args);
	}
//
//	@Bean
//	public CommandLineRunner demo(AthleteRepository repository) {
//		return (args) -> {
//			//save some Athletes
//			repository.save(new Athlete("Max","Davis","M",6));
//			repository.save(new Athlete("Cole","Smith","M",5));
//			repository.save(new Athlete("Arturo","Sotomayor","M",4));
//			repository.save(new Athlete("Garrett","Reynolds","M",3));
//
//			//fetch all Athletes
//			log.info("Athletes found with findAll():");
//			log.info("------------------------------");
//			for(Athlete athlete : repository.findAll()) {
//				log.info(athlete.toString());
//			}
//			log.info("");
//
//			// fetch an individual athlete by ID
//			repository.findById(1L).ifPresent(athlete -> {
//				log.info("Athlete found with findById(1L):");
//				log.info("--------------------------------");
//				log.info(athlete.toString());
//				log.info("");
//			});
//
//			// fetch athletes by last name
//			log.info("Athlete found eith findByLastName('Smith')");
//			log.info("------------------------------------------");
//			repository.findByLastName("Smith").forEach(smith -> {
//				log.info(smith.toString());
//			});
//			log.info("");
//		};
//	}

}
