import org.jdbi.v3.core.Jdbi;
import org.jdbi.v3.sqlobject.SqlObjectPlugin;

public class DBConnection {
    private static Jdbi jdbi;

    public static Jdbi getJdbi() {
        if (jdbi == null) {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");

                String url = "jdbc:mysql://localhost:3306/handmade";
                String user = "root";
                String password = "";

                jdbi = Jdbi.create(url, user, password);
                jdbi.installPlugin(new SqlObjectPlugin());
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return jdbi;
    }
}
