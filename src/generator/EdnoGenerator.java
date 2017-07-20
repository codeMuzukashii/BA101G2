package generator;

import java.io.*;
import java.sql.*;
import org.hibernate.HibernateException;
import org.hibernate.engine.SessionImplementor;
import org.hibernate.id.IdentifierGenerator;

public class EdnoGenerator implements IdentifierGenerator {

	public Serializable generate(SessionImplementor session, Object object)
			throws HibernateException {

		String prefix = "ED";
		String mdno = null;
		Connection con = session.connection();
		try {
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT lpad(to_char(edno_seq.NEXTVAL),6,'0') as nextval FROM DUAL");
			rs.next();
			String nextval = rs.getString("nextval");
			mdno = prefix + nextval;
			con.close();
		} catch (SQLException e) {
			throw new HibernateException("Unable to generate Sequence");
		}
		return mdno;
	}
}