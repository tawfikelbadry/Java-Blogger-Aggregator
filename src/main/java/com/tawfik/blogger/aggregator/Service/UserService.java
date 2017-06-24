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
import java.util.List;
import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

/**
 *
 * @author tito
 */
@Transactional
@Service
public class UserService {
    
    @Autowired
    private UserRepository userRepository;
    
    @Autowired
    private BlogRepository blogRepository;
    @Autowired
    private ItemRepository itemRepository;
    
    @Autowired
    private RoleRepository roleRepository;
    
    public List<User> findAll() {
        return userRepository.findAll();
    }
    
    public User findOne(int id) {
        
        return userRepository.findOne(id);
    }
    
    @Transactional
    public User findOneWithBlogs(int id) {
        User usr = findOne(id);
        List<Blog> blogs = blogRepository.findByUser(usr);
        for (Blog blog : blogs) {
            List<Item> items = itemRepository.findByBlog(blog, new PageRequest(0, 10, Sort.Direction.DESC, "publishedDate"));
            blog.setItems(items);
        }
        usr.setBlogs(blogs);
        return usr;
        
    }
    
    public void saveUser(User user) {
        user.setEnabled(true);
        
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        user.setPassword(encoder.encode(user.getPassword()));
        
        ArrayList<Role> roles = new ArrayList();
        roles.add(roleRepository.findByName("ROLE_USER"));
        user.setRoles(roles);
        
        userRepository.save(user);
    }
    
    public User findOneWithBlogs(String name) {
        User user = userRepository.findByName(name);
        
        return findOneWithBlogs(user.getId());
    }

    public void delete(int id) {
        userRepository.delete(id);
    }
    
    
}
