package com.ikefercol;

import java.io.*;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.sql.*;

public class Main {
    public static void main(String[] args) {
        String url = "jdbc:postgresql:src/main/resources/sqlite.db";

        try (Connection conn = DriverManager.getConnection(url)){
            if (conn != null) {
                System.out.println("¡Conectado a la Base de Datos!");

                String archivoSQL = new String(Files.readAllBytes(Paths.get("src/main/resources/script.sql")));

                try (Statement stmt = conn.createStatement()) {
                    stmt.execute(archivoSQL);
                    System.out.println("Tablas Creadas con sus Datos insertados.");
                }

                String consulta1 = "SELECT nombre FROM EQUIPO WHERE liga_id = 1";
                try (Statement stmt = conn.createStatement()) {
                    ResultSet rs = stmt.executeQuery(consulta1);
                    while (rs.next()) {
                        String nombre = rs.getString("nombre");
                        System.out.println("Equipo: " + nombre);
                    }
                }

                String consulta2 = "SELECT nombre FROM JUGADOR WHERE equipo_id = 1";

                try (Statement stmt = conn.createStatement();
                     ResultSet rs2 = stmt.executeQuery(consulta2)) {
                    System.out.println("Jugadores en Real Madrid:");
                    while (rs2.next()) {
                        System.out.println("Jugador: " + rs2.getString("nombre"));
                    }
                }

                String consulta3 = "SELECT J.nombre FROM JUGADOR J JOIN JUGADOR_LIGA JL ON J.id = JL.jugador_id WHERE JL.liga_id = ?";
                try (PreparedStatement pstmt = conn.prepareStatement(consulta3)) {
                    pstmt.setInt(1, 1); // Liga ID
                    try (ResultSet rs3 = pstmt.executeQuery()) {
                        System.out.println("Jugadores en LaLiga:");
                        while (rs3.next()) {
                            System.out.println("Jugador: " + rs3.getString("nombre"));
                        }
                    }
                }

                String consulta4 = "SELECT E.nombre AS equipo, EST.nombre AS estadio FROM EQUIPO E JOIN ESTADIO EST ON E.id = EST.equipo_id WHERE E.liga_id = ?";
                try (PreparedStatement pstmt = conn.prepareStatement(consulta4)) {
                    pstmt.setInt(1, 1); // Liga ID
                    try (ResultSet rs4 = pstmt.executeQuery()) {
                        System.out.println("Estadios en LaLiga:");
                        while (rs4.next()) {
                            System.out.println("Equipo: " + rs4.getString("equipo") + ", Estadio: " + rs4.getString("estadio"));
                        }
                    }
                }
            }

        } catch (SQLException | IOException e) {
            e.printStackTrace();
        }


//        Connection connection = null;
//        PreparedStatement preparedStatement = null;
//        Statement statement = null;
//        ResultSet resultSet = null;
//
//        try {
//            String url = "jdbc:sqlite:src/main/resources/sqlite.db";
//            connection = DriverManager.getConnection(url);
//            System.out.println("¡Conectado a la base de datos!");
//
//            statement = connection.createStatement();
//
//            String c1 = "SELECT J.nombre AS jugador, E.nombre AS equipo FROM JUGADOR J JOIN EQUIPO E ON J.equipo_id = E.id";
//            resultSet = statement.executeQuery(c1);
//            while (resultSet.next()) {
//                System.out.println(resultSet.getString("jugador") + " " + resultSet.getString("equipo"));
//            }
//
//
//            connection.close();
//            preparedStatement.close();
//            statement.close();
//            resultSet.close();
//
//        } catch (SQLException e) {
//            throw new RuntimeException(e);
//        }




    }
}
