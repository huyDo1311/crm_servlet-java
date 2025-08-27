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
            String host = "crossover.proxy.rlwy.net";
            String port = "41629";
            String database = "railway";
            String username = "root";
            String password = "OszVjuKBuFnKUFBrNHdkBJHOVLyFOziy";

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


