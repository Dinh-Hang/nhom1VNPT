package com.example.login.Config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
public class SecurityConfig {
    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http
                .authorizeHttpRequests(authorize -> authorize
                        .anyRequest().permitAll() // Cho phép tất cả các request
                )
                .csrf(csrf -> csrf.disable()); // API mới để vô hiệu hóa CSRF

        return http.build();
    }

//    @Bean
//    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
//        http
//                .csrf(csrf -> csrf.disable())
//                .authorizeHttpRequests(authorize -> authorize
//                        .requestMatchers("/login").permitAll() // Cho phép truy cập đến trang đăng nhập
//                        .requestMatchers("/", "/api/v1/employee/login").permitAll() // Cho phép các yêu cầu không xác thực
//                        .requestMatchers("/home").authenticated() // Yêu cầu xác thực cho trang Home
//                        .anyRequest().authenticated() // Yêu cầu xác thực cho tất cả các yêu cầu khác
//                )
//                .formLogin(form -> form
//                        .loginPage("/login") // Đường dẫn đến trang đăng nhập
//                        .permitAll() // Cho phép mọi người truy cập trang đăng nhập
//                        .defaultSuccessUrl("/home", true) // Đường dẫn đến trang thành công
//                )
//                .logout(logout -> logout
//                        .permitAll() // Cho phép mọi người thực hiện logout
//                );
//
//        return http.build();
//    }


//@Bean
//public PasswordEncoder passwordEncoder() {
//    return PasswordEncoderFactories.createDelegatingPasswordEncoder();
//}

//    @Bean
//    public PasswordEncoder passwordEncoder() {
//        return PasswordEncoderFactories.createDelegatingPasswordEncoder();
//    }

//    @Bean
//    public BCryptPasswordEncoder passwordEncoder(){
//        return new BCryptPasswordEncoder(BCryptPasswordEncoder.BCryptVersion.$2A);
//    }
}
