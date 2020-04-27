package sparkprojets;

import static spark.Spark.get;

import org.json.JSONObject;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class Projets {

    private static Connection connexion = null;

    private final static String messageDBReturnSuccess = "Connecté au compte PROJETS sur Oracle";
    private final static String messageDBReturnFailure = "NON Connecté à la base de données Oracle";


    public static String connexionDB()
    {
        String dbReturn = null;

        // On évite de recréer une connexion Oracle si elle est déjà établie...
        if (connexion == null)
        {
            //Test de connexion à la base de données
            try {

                String dbURL = "jdbc:oracle:thin:PROJETS/projets@localhost:1521:XE";
                //String dbURL = "jdbc:oracle:thin:SYSTEM/oracle@localhost:1521:XE";

                // registers Oracle JDBC driver
                Class.forName("oracle.jdbc.OracleDriver");

                connexion = DriverManager.getConnection(dbURL);

                if (connexion != null) {

                    dbReturn = messageDBReturnSuccess;
                }
                else
                {
                    dbReturn = messageDBReturnFailure;
                }

            } catch (ClassNotFoundException ex) {
                ex.printStackTrace();
                dbReturn = "ERREUR: La classe oracle.jdbc.OracleDrive est inconnue.";

            } catch (SQLException ex) {
                ex.printStackTrace();
                dbReturn = "ERREUR: requête SQL incorrect.";
            } finally {
                try {
                    if (connexion != null && !connexion.isClosed()) {
                        connexion.close();
                    }
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
        }
        else
        {
            dbReturn = messageDBReturnSuccess;
        }

        return dbReturn;
    }


    public static void main(String[] args) {


        // Définition du chemin "/" du serveur
        get("/", (request, response) -> {


        response.type("application/json");

        // Création d'un objet JSON
        JSONObject exempleJsonObj = new JSONObject();

        // Insertion d'une clé/valeur JSON
        exempleJsonObj.put("connexion", connexionDB());

        return exempleJsonObj.toString(4);

        });

    }

}