/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tawfik.blogger.aggregator.repository;

import com.tawfik.blogger.aggregator.entity.Role;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 *
 * @author tito
 */


public interface RoleRepository extends JpaRepository<Role,Integer>  {

    public Role findByName(String name);
    
    
}
