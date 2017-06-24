/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tawfik.blogger.aggregator.repository;

import com.tawfik.blogger.aggregator.entity.Blog;
import com.tawfik.blogger.aggregator.entity.Item;
import java.util.List;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 *
 * @author tito
 */
public interface ItemRepository extends JpaRepository<Item,Integer>{
    
    public List<Item> findByBlog(Blog blog,Pageable pageable);
    
}
