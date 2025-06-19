package com.project.decorhouse.controller;

import com.project.decorhouse.model.Role;
import com.project.decorhouse.services.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/roles")
public class RoleController {

    private final RoleService roleService;

    @Autowired
    public RoleController(RoleService roleService) {
        this.roleService = roleService;
    }

    @GetMapping("/{name}")
    public Role getRoleByName(@PathVariable String name) {
        return roleService.findByName(name);
    }
}
