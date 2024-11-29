package com.ikefercol;

import java.io.*;
import java.sql.*;

public class Main {
    public static void main(String[] args) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        Statement statement = null;
        ResultSet resultSet = null;

        try {
            String url = "jdbc:sqlite:src/main/resources/sqlite.db";
            connection = DriverManager.getConnection(url);
            System.out.println("¡Conectado a la base de datos!");

            statement = connection.createStatement();

            String c1 = "SELECT J.nombre AS jugador, E.nombre AS equipo FROM Jugador J JOIN Equipo E ON J.equipo_id = E.id";
            resultSet = statement.executeQuery(c1);
            while (resultSet.next()) {
                System.out.println(resultSet.getString("jugador") + " " + resultSet.getString("equipo"));
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


    }
}
