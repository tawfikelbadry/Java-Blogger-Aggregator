/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tawfik.blogger.aggregator.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author tito
 */
@Controller
public class UserController {

    @RequestMapping("/users")
    public ModelAndView users() {

        ModelAndView modelAndView = new ModelAndView("users");

        modelAndView.addObject("allUsers", "hello");

        return modelAndView;
    }

}
