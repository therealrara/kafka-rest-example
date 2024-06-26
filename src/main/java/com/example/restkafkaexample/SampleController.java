package com.example.restkafkaexample;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@Slf4j
public class SampleController {

    @GetMapping("/health")
    public String getHealth() {
        log.info("Health Check Enabled2");
        return "Welcome to the public server";
    }
}
