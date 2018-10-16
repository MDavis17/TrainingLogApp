package com.MaxDavisUCLATFXC.TrainingLogApp;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.concurrent.atomic.AtomicLong;

@RestController
public class FooController {

    private static final String template = "Hello, %s!";

    @RequestMapping("/greeting")
    public Foo greeting(@RequestParam(defaultValue="max") String name) {
        return new Foo(String.format(template, name));
    }
}
