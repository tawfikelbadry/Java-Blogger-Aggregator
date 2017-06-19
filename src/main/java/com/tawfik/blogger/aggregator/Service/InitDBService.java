/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tawfik.blogger.aggregator.Service;

import com.tawfik.blogger.aggregator.entity.Blog;
import com.tawfik.blogger.aggregator.entity.Item;
import com.tawfik.blogger.aggregator.entity.Role;
import com.tawfik.blogger.aggregator.entity.User;
import com.tawfik.blogger.aggregator.repository.BlogRepository;
import com.tawfik.blogger.aggregator.repository.ItemRepository;
import com.tawfik.blogger.aggregator.repository.RoleRepository;
import com.tawfik.blogger.aggregator.repository.UserRepository;
import java.util.ArrayList;
import java.util.Date;
import javax.annotation.PostConstruct;
import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author tito
 */
@Transactional
@Service
public class InitDBService {
    
    

    @Autowired
    private RoleRepository roleRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private BlogRepository blogRepository;

    @Autowired
    private ItemRepository itemRepository;

    @PostConstruct
    public void init() {
        Role roleUser = new Role();
        roleUser.setName("ROLE_USER");
        roleRepository.save(roleUser);

        Role roleAdmin = new Role();
        roleAdmin.setName("ROLE_ADMIN");
        roleRepository.save(roleAdmin);

        User userAdmin = new User();
        userAdmin.setName("admin");
        userAdmin.setPassword("admin");

        ArrayList<Role> roles = new ArrayList();
        roles.add(roleUser);
        roles.add(roleAdmin);
        
        userAdmin.setRoles(roles);
        
        userRepository.save(userAdmin);
        
        
        Blog blogJavavids=new Blog();
        blogJavavids.setName("java vids");
        blogJavavids.setUrl("http://feeds.feedburner.com/javavids?format=xml");
        blogJavavids.setUser(userAdmin);
        blogRepository.save(blogJavavids);
        
        Item item1=new Item();
        item1.setBlog(blogJavavids);
        item1.setTitle("first");
        item1.setLink("http://www.javavids.com");
        item1.setPublishedDate(new Date());
        itemRepository.save(item1);
        
        Item item2=new Item();
        item2.setBlog(blogJavavids);
        item2.setTitle("second");
        item2.setLink("http://www.javavids.com");
        item2.setPublishedDate(new Date());
        itemRepository.save(item2);

    }

}
