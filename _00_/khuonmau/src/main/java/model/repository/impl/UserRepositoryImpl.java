package model.repository.impl;

import model.bean.User;
import model.repository.IUserRepository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserRepositoryImpl implements IUserRepository {

    private BaseRepository baseRepository = new BaseRepository();
    @Override
    public List<User> selectAllUsers() {
        List<User> userList = new ArrayList<>();

        try {
            PreparedStatement preparedStatement = baseRepository.getConnection().prepareStatement("select id,`name`,email,country\n" +
                    "from users");
            ResultSet resultSet = ((PreparedStatement) preparedStatement).executeQuery();

            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String country = resultSet.getString("country");
                userList.add(new User(id, name, email, country));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return userList;

    }
}
