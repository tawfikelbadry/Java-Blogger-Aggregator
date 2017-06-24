/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tawfik.blogger.aggregator.controller;

import com.tawfik.blogger.aggregator.Service.ItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author tito
 */
@Controller
public class IndexController {
    
    @Autowired
    ItemService itemService;

    @RequestMapping("")
    public String indexPage(Model model) {
        model.addAttribute("items",itemService.getItems() );
        return "index";
    }

}
