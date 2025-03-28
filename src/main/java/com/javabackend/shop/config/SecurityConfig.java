package com.javabackend.shop.config;

import com.javabackend.shop.security.CustomOAuth2AuthenticationSuccessHandler;
import com.javabackend.shop.security.CustomSuccessHandler;
import com.javabackend.shop.service.Impl.CustomOAuth2UserService;
import com.javabackend.shop.service.Impl.CustomUserDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.Customizer;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {
    @Bean
    public UserDetailsService userDetailsService() {
        return new CustomUserDetailService();
    }

    private final CustomOAuth2UserService oauth2UserService;

    public SecurityConfig(CustomOAuth2UserService oauth2UserService) {
        this.oauth2UserService = oauth2UserService;
    }

    @Bean
    public BCryptPasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public DaoAuthenticationProvider authenticationProvider() {
        DaoAuthenticationProvider authProvider = new DaoAuthenticationProvider();
        authProvider.setUserDetailsService(userDetailsService());
        authProvider.setPasswordEncoder(passwordEncoder());
        return authProvider;
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) {
        auth.authenticationProvider(authenticationProvider());
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.csrf().disable()
                .authorizeRequests()
                .antMatchers("/admin/**").hasAnyRole("MANAGER", "STAFF", "ADMIN", "SHIPPER")
                .antMatchers("/login", "/resource/**", "/trang-chu", "/api/**").permitAll()
                .and()
                .oauth2Login()
                .userInfoEndpoint()
                .userService(oauth2UserService)
                .and()
                .successHandler(oAuthenticationSuccessHandler())
                .and()
                .formLogin()
                .loginPage("/trang-chu")
                .loginProcessingUrl("/j_spring_security_check")
                .usernameParameter("j_username")
                .passwordParameter("j_password")
                .permitAll()
                .successHandler(myAuthenticationSuccessHandler())
                .failureUrl("/login?incorrectAccount")
                .and()
                .logout()
                .logoutUrl("/logout")
                .deleteCookies("JSESSIONID")
                .and()
                .exceptionHandling()
                .accessDeniedPage("/access-denied")
                .and()
                .sessionManagement()
                .maximumSessions(1)
                .expiredUrl("/login?sessionTimeout");

    }

    @Bean
    public AuthenticationSuccessHandler myAuthenticationSuccessHandler() {
        return new CustomSuccessHandler();
    }
    @Bean
    public AuthenticationSuccessHandler oAuthenticationSuccessHandler() {
        return new CustomOAuth2AuthenticationSuccessHandler();
    }

}
