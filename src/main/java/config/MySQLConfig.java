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

public class MySQLConfig {
    public static Connection getConnection() {

        Connection connection = null;

        try {
            // Lấy thông tin từ biến môi trường
            String host = System.getenv("MYSQLHOST");       // RAILWAY_PRIVATE_DOMAIN
            String port = System.getenv("MYSQLPORT");       // 3306
            String database = System.getenv("MYSQLDATABASE"); // railway
            String username = System.getenv("MYSQLUSER");   // root
            String password = System.getenv("MYSQLPASSWORD"); // OszVjuKBuFnKUFBrNHdkBJHOVLyFOziy

            // JDBC URL chuẩn MySQL
            String url = "jdbc:mysql://" + host + ":" + port + "/" + database +
                         "?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";

            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(url, username, password);

        } catch (Exception e) {
            System.out.println("Lỗi kết nối: " + e.getMessage());
        }

        return connection;
    }
}


