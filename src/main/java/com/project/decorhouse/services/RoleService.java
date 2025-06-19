package com.project.decorhouse.services;

import com.project.decorhouse.model.Role;

public abstract class RoleService {
    public abstract Role findByName(String name);
}
