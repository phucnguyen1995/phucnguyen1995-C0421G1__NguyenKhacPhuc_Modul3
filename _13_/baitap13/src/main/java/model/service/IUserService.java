package model.service;



import model.bean.User;

import java.sql.SQLException;
import java.util.List;

public interface IUserService {
    List<User> selectAllUsers();

    boolean updateUser(User user) throws SQLException;

    boolean deleteUser(int id) throws SQLException;

    void insertUser(User user) throws SQLException;

    User selectUser(int id);

    List<User> searchByCountry(String country);

    List<User> nameSort();
}
