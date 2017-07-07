package com.desafiomais;

import java.security.Principal;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.security.oauth2.client.EnableOAuth2Sso;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.web.bind.annotation.RequestMapping;

@SpringBootApplication
@EnableOAuth2Sso

public class Aplicacao extends WebSecurityConfigurerAdapter{

	  @RequestMapping("/index")
	  public Principal user(Principal principal) {
	    return principal;
	  }

	  public static void main(String[] args) {
	    SpringApplication.run(Aplicacao.class, args);
	  }
	  @Override
	  protected void configure(HttpSecurity http) throws Exception {
	    http
	      .antMatcher("/**")
	      .authorizeRequests()
	        .antMatchers("/", "/static/**", "/login**", "/webjars/**")
	        .permitAll()
	      .anyRequest()
	        .authenticated();
	  }
	}