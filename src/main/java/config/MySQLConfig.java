// 	package config;

// import java.sql.Connection;
// import java.sql.DriverManager;

// public class MySQLConfig {
// 	public static Connection getConnection() {
		
// 		Connection connection = null;
		
// 		try {
// 			String url = "jdbc:mysql://localhost:3306/crm_app";
// 			String username = "root";
// 			String password = "admin123";
	
			
// 			Class.forName("com.mysql.cj.jdbc.Driver");
// 			return DriverManager.getConnection(url, username, password);
			
// 		} catch (Exception e) {
// 			System.out.println("Lỗi kết nối" + e.getMessage());
// 		}
		
// 		return connection;
		
// 	}
// }


package config;

import java.sql.Connection;
import java.sql.DriverManager;

public class MySQLConfig { // vẫn để tên MySQLConfig
    public static Connection getConnection() {
        Connection connection = null;

        try {
            // JDBC URL PostgreSQL (Render External URL)
            String url = "jdbc:postgresql://dpg-d2n5o27diees73c7p1ng-a.oregon-postgres.render.com:5432/crm_app_mkeh";
            String username = "root";
            String password = "ePUrn1tieWOIacI3o1W42SSjwCFudo4r";

            // PostgreSQL driver
            Class.forName("org.postgresql.Driver");

            connection = DriverManager.getConnection(url, username, password);
            System.out.println("✅ Kết nối PostgreSQL thành công!");
        } catch (Exception e) {
            System.out.println("❌ Lỗi kết nối DB: " + e.getMessage());
        }

        return connection;
    }
}
