package com.example.demo;

import org.springframework.boot.*;
import org.springframework.boot.autoconfigure.*;
import org.springframework.web.bind.annotation.*;


@SpringBootApplication
@RestController
public class App {

    @GetMapping("/")
    public String home() {
        return "Hello from Java App on Kubernetes!";
    }

    public static void main(String[] args) {
        SpringApplication.run(App.class, args);
    }
}
