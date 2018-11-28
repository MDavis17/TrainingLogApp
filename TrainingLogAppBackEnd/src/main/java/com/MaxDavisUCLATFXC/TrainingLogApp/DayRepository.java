package com.MaxDavisUCLATFXC.TrainingLogApp;

import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

import java.util.List;

@RepositoryRestResource(collectionResourceRel = "days", path="days")
public interface DayRepository extends PagingAndSortingRepository<Day, Long> {
    List<Day> findByEmail(@Param("email") String email);
}
