package energymanagesystem;

import java.sql.CallableStatement;
import java.sql.Connection;

public class testJdbc {

	public static void main(String[] args) throws Exception {
		// TODO Auto-generated method stub
		Connection conn = com.managementsystem.dbmanager.ConnectionManager
				.getConnection();
		CallableStatement cs = null;

		try {
			String sql = "UPDATE energy_water#total#month SET sum = '1231213' WHERE time = '2014-05' ";
			System.out.println("同步sqlserver的sql----" + sql);
			cs = conn.prepareCall(sql);
			cs.execute();
		} catch (Exception e) {
			throw new java.lang.RuntimeException(e);
		} finally {
			// 数据库资源释放
			if (cs != null) {
				cs.close();
			}
			if (conn != null) {
				conn.close();
			}
		}
	}

}
