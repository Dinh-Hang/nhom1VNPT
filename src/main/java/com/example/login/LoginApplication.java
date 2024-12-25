package com.example.login;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@SpringBootApplication
public class LoginApplication {

    public static void main(String[] args) {

        SpringApplication.run(LoginApplication.class, args);

        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

        String password = "password";
        String encodedPassword = passwordEncoder.encode(password);

        System.out.println();
        System.out.println("Password is         : " + password);
        System.out.println("Encoded Password is : " + encodedPassword);
    }

}
