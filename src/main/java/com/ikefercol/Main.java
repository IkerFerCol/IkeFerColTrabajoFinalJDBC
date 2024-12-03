package com.ikefercol;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.sql.*;

public class Main {
    public static void main(String[] args) {
        String url = "jdbc:sqlite:src/main/resources/sqlite.db";
        String sql = "src/main/resources/script.sql";

        try (Connection connection = DriverManager.getConnection(url)){
            Statement statement = connection.createStatement();
            String archivoleidosql = new String(Files.readAllBytes(Paths.get(sql)));
            statement.executeUpdate(archivoleidosql);
            System.out.println("--| Base de datos creada con sus datos insertados |--");

            ResultSet resultSet = statement.executeQuery("SELECT E.nombre AS equipo, L.nombre AS liga FROM EQUIPO E JOIN LIGA L ON E.liga_id = L.id");
            System.out.println("** Equipos y sus ligas: ");
            while (resultSet.next()) {
                System.out.println(resultSet.getString("equipo") + " " + resultSet.getString("liga"));
            }
            System.out.println();

            ResultSet resultSet2 = statement.executeQuery("SELECT J.nombre AS jugador, E.nombre AS equipo FROM JUGADOR J JOIN EQUIPO E ON J.equipo_id = E.id");
            System.out.println("** Jugadores y sus equipos: ");
            while (resultSet2.next()) {
                System.out.println(resultSet2.getString("jugador") + " " + resultSet2.getString("equipo"));
            }
            System.out.println();

            PreparedStatement preparedStatement = connection.prepareStatement(" SELECT J.nombre FROM JUGADOR J JOIN EQUIPO E ON J.equipo_id = E.id WHERE E.nombre = ?");
            preparedStatement.setString(1, "Real Madrid");
            ResultSet resultSet3 = preparedStatement.executeQuery();
            System.out.println("** Jugadores del Real Madrid: ");
            while (resultSet3.next()) {
                System.out.println(resultSet3.getString("nombre"));
            }
            System.out.println();

            PreparedStatement preparedStatement2 = connection.prepareStatement("SELECT ES.nombre AS estadio, ES.capacidad FROM ESTADIO ES WHERE ES.capacidad > ?");
            preparedStatement2.setInt(1, 90000);
            ResultSet resultSet4 = preparedStatement2.executeQuery();
            System.out.println("** Estadios con capacidad mayor a 90000:");
            while (resultSet4.next()) {
                String estadio = resultSet4.getString("estadio");
                int capacidad = resultSet4.getInt("capacidad");
                System.out.println(estadio + " (" + capacidad + ")");
            }
            System.out.println();


        } catch (SQLException | IOException e) {
            e.printStackTrace();
        }

    }
}