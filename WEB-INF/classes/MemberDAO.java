package dao;

import java.sql.*;

import beans.Member;


public class MemberDAO {
	public Connection getConnection() {
		Connection con =null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521","test1","1234");
		}catch(Exception e) {
			e.printStackTrace();
		}
		return con;
	
	}
	
	public int insertMember(Member member) {
		
		try {
		Connection con = this.getConnection();
		PreparedStatement pstmt = con.prepareStatement("insert into member values(?,?,?,?,?)");
		pstmt.setString(1, member.getId());
		pstmt.setString(2, member.getPw());
		pstmt.setString(3, member.getName());
		pstmt.setString(4, member.getPhone());
		pstmt.setString(5, member.getAddress());
		return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
		
	}

	
}
