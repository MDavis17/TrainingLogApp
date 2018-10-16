package com.MaxDavisUCLATFXC.TrainingLogApp;

//import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;
import java.util.List;

@RepositoryRestResource(collectionResourceRel = "athletes", path="athletes")
public interface AthleteRepository extends PagingAndSortingRepository<Athlete, Long> {
    List<Athlete> findByLastName(@Param("name") String name);
}
