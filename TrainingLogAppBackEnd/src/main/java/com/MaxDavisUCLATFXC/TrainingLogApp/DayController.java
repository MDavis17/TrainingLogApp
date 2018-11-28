package com.MaxDavisUCLATFXC.TrainingLogApp;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class DayController {

//    private static final String template = "Hello, %s!";
    //Day(String email, int doubleRun, boolean fuel, boolean stretch_roll)
    @RequestMapping("/addday")
    public Day days(@RequestParam(defaultValue="") String email,
                    @RequestParam(defaultValue="0") int doubleRun,
                    @RequestParam(defaultValue="false") boolean fuel,
                    @RequestParam(defaultValue="false") boolean stretch_roll) {
        return new Day(email,doubleRun,fuel,stretch_roll);
    }
}
