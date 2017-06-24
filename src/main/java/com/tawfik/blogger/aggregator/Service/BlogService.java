/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tawfik.blogger.aggregator.Service;

import com.tawfik.blogger.aggregator.entity.Blog;
import com.tawfik.blogger.aggregator.entity.User;
import com.tawfik.blogger.aggregator.repository.BlogRepository;
import com.tawfik.blogger.aggregator.repository.UserRepository;
import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.method.P;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Service;

/**
 *
 * @author tito
 */
@Service
@Transactional
public class BlogService {

    @Autowired
    private BlogRepository blogRepository;

    @Autowired
    private UserRepository userRepository;

    public void saveBlog(Blog blog, String name) {
        User user = userRepository.findByName(name);
        blog.setUser(user);
        blogRepository.save(blog);

    }

    @PreAuthorize("#blog.user.name == authentication.name or hasRole('ROLE_ADMIN')")
    public void deleteBlog(@P("blog")Blog blog) {
        System.out.println("before deleted" + blog.getId());

        blogRepository.delete(blog.getId());
        System.out.println("after deleted" + blog.getId());
    }

    public Blog findOne(int id) {
        System.out.println("find one blog");
        return blogRepository.findOne(id);
    }

}
