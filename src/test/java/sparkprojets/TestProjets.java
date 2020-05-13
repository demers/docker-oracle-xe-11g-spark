// Pour compiler sans tenir compte de l'échec des tests
// mvn -DskipTests "package"

package sparkprojets;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;

import static spark.Spark.get;
import org.json.JSONObject;

public class TestProjets {

    @Test
    public void testTest() {
        assertEquals(0, 0);
    }

}