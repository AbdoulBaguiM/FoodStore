package com.ensias.foodstore.dao.interfaces;

import com.ensias.foodstore.models.User;
import java.util.List;

public interface UserDaoInterface {

    List<User> getAllUsers();

    User getUserById(Long userId);

    void addUser(User utilisateur);

    void updateUser(User utilisateur);

    void deleteUser(User utilisateur);
}
