package dal;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
public class clsdal {
//to establish connection
	public String connectionURL ="jdbc:mysql://localhost/creditcardfrauddetectiondb";
	public String classforname="com.mysql.jdbc.Driver";
	public String UID="root";
	public String pwd="";
	public Connection con;
	  public clsdal(){  
	   super();    
	}

	  public boolean connect() throws ClassNotFoundException,SQLException{ 
	  Class.forName(classforname); 
	  con = DriverManager.getConnection(connectionURL,UID,pwd); 
	    return true; 
	  } 

	  public void close() throws SQLException{ 
		  con.close(); 
	   }

	  public ResultSet execSQL(String sql) throws SQLException{
	  Statement s = con.createStatement(); 
	  ResultSet r = s.executeQuery(sql); 
	  return (r == null) ? null : r; 
	  }

	  public int updateSQL(String sql) throws SQLException{   
	     Statement s = con.createStatement();
              System.out.println(sql);
	   int r = s.executeUpdate(sql);
	   return (r == 0) ? 0 : r; 
	  }

	}