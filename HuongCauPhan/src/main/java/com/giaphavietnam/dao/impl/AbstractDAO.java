package com.giaphavietnam.dao.impl;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Types;
import java.util.ArrayList;
import java.util.ResourceBundle;

import com.giaphavietnam.dao.GenericDAO;
import com.giaphavietnam.mapper.RowMapper;

public class AbstractDAO<T> implements GenericDAO<T> {
	ResourceBundle bundle = ResourceBundle.getBundle("db"); 
	
	public Connection getConnection() {
		try {
			Class.forName(bundle.getString("driverName"));
			String url = bundle.getString("url");
			String user = bundle.getString("user");
			String password = bundle.getString("password");
			return DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	@Override
	public ArrayList<T> query(String sql, RowMapper<T> rowMapper, Object... paremeters) {
		ArrayList<T> list = new ArrayList<>();
		Connection con = null;
		PreparedStatement pre = null;
		ResultSet rs = null;
		try {
			con = getConnection();
			pre = con.prepareStatement(sql);
			setParameter(pre,paremeters);
			rs = pre.executeQuery();

			while (rs.next()) {
				list.add(rowMapper.mapRow(rs));
			}
			return list;
		} catch (SQLException e) {
			return null;
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (pre != null) {
					pre.close();
				}
				if (con != null) {
					con.close();
				}
			} catch (SQLException e) {
				return null;
			}
		}
	}
	
	private void setParameter(PreparedStatement pre, Object... parameters) {
		for (int i = 0; i < parameters.length; i++) {
			Object parameter = parameters[i];
			int index = i + 1;
			try {
				if (parameter instanceof Long) {
					pre.setLong(index, (Long) parameter);
				}else if (parameter instanceof String) {
					pre.setString(index, (String) parameter);
				}else if (parameter instanceof Integer) {
					pre.setInt(index, (Integer) parameter);
				}else if (parameter instanceof Date) {
					pre.setDate(index, (Date) parameter);
				}else if (parameter == null) {
					pre.setNull(index, Types.NULL);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	@Override
	public void update(String sql, Object... parameters) {
		Connection con = null;
		PreparedStatement pre = null;
		try {
			con = getConnection();
			con.setAutoCommit(false);
			pre = con.prepareStatement(sql);
			this.setParameter(pre, parameters);
			pre.executeUpdate();
			con.commit();
		} catch (SQLException e) {
			if(con!=null) {
				try {
					con.rollback();
				} catch (SQLException e1) {
					e.printStackTrace();
				}
			}
		}finally {
			try {
				if (con != null) {
					con.close();
				}
				if (pre != null) {
					pre.close();
				}				
			} catch (SQLException e2) {
				e2.printStackTrace();;
			}
		}
		
	}

	@Override
	public Long insert(String sql, Object... parameters) {
		Connection con = null;
		PreparedStatement pre = null;
		ResultSet rs = null;
		try {
			Long id = null;
			con = getConnection();
			con.setAutoCommit(false);
			pre = con.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
			this.setParameter(pre, parameters);
			pre.executeUpdate();
			rs = pre.getGeneratedKeys();
			if(rs.next()) {
				id = rs.getLong(1);
			}
			con.commit();
			return id;
		} catch (SQLException e) {
			if(con!=null) {
				try {
					con.rollback();
				} catch (SQLException e1) {
					e1.printStackTrace();
				}
			}
		}finally {
			try {
				if (con != null) {
					con.close();
				}
				if (pre != null) {
					pre.close();
				}if (rs != null) {
					rs.close();
				}				
			} catch (SQLException e2) {
				e2.printStackTrace();
			}
		}
		return null;
	}

	@Override
	public int count(String sql, Object... parameters) {
		Connection con = null;
		PreparedStatement pre = null;
		ResultSet rs = null;
		try {
			int count = 0;
			con = getConnection();
			pre = con.prepareStatement(sql);
			setParameter(pre,parameters);
			rs = pre.executeQuery();

			while (rs.next()) {
				count = rs.getInt(1);
			}
			return count;
		} catch (SQLException e) {
			return 0;
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (pre != null) {
					pre.close();
				}
				if (con != null) {
					con.close();
				}
			} catch (SQLException e) {
				return 0;
			}
		}
	}

}
