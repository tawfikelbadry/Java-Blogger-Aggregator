/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tawfik.blogger.aggregator.controller;

import com.tawfik.blogger.aggregator.Service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author tito
 */
@Controller
@RequestMapping("/users")
public class AdminController {

    @Autowired
    private UserService userService;

    @RequestMapping
    public ModelAndView users() {

        ModelAndView modelAndView = new ModelAndView("users");

        modelAndView.addObject("allUsers", userService.findAll());

        return modelAndView;
    }

    @RequestMapping("/{id}")
    public String details(Model model, @PathVariable int id) {
        model.addAttribute("user", userService.findOneWithBlogs(id));
        return "user-details";
    }

    @RequestMapping("/remove/{id}")
    public String removeUser(@PathVariable int id) {
        userService.delete(id);
        return "redirect:/users";
    }

}
