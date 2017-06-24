/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tawfik.blogger.aggregator.controller;

import com.tawfik.blogger.aggregator.Service.BlogService;
import com.tawfik.blogger.aggregator.Service.UserService;
import com.tawfik.blogger.aggregator.entity.Blog;
import com.tawfik.blogger.aggregator.entity.User;
import java.security.Principal;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author tito
 */
@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private BlogService blogService;

    @ModelAttribute("blog")
    public Blog constructBlog() {
        return new Blog();
    }

    @RequestMapping("/account")
    public String myAccount(Model model, Principal principal) {
        String name = principal.getName();
        model.addAttribute("user", userService.findOneWithBlogs(name));
        return "account";
    }

    @RequestMapping(value = "/account", method = RequestMethod.POST)
    public String doAddBlog(@Valid @ModelAttribute("blog") Blog blog, BindingResult result, Principal principal, Model model) {
        if (result.hasErrors()) {
            return myAccount(model, principal);
        }

        String name = principal.getName();
        blogService.saveBlog(blog, name);

        return "redirect:/account";
    }

    @RequestMapping("/blog/remove/{id}")
    public String removeBlog(@PathVariable int id) {
        Blog blog = blogService.findOne(id);
        System.out.println("blog id : " + blog.getId());
        blogService.deleteBlog(blog);
        return "redirect:/account";
    }

}
