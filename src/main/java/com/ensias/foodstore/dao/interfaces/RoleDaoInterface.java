package com.ensias.foodstore.dao.interfaces;

import com.ensias.foodstore.models.Role;

import java.util.List;

public interface RoleDaoInterface {

    List<Role> getAllRoles();

    Role getRoleById(Long roleId);
}
