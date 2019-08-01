package dao;

import domain.Antibody;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AntibodyDao extends AbstractDao<Antibody, Integer> {

    @Override
    public void update(Antibody obj1, Antibody obj2) throws DaoException {
    }

    @Override
    protected String getByKeyQuery() {
        return "SELECT * FROM list WHERE id=?";
    }

    @Override
    protected String getCreateQuery() {
        return "{CALL add_antibody(?, ?, ?, ?, ?, ?, ?)}";
    }

    @Override
    protected void fillCallableStatement(CallableStatement cs, Antibody obj) throws DaoException {

        try {
            cs.setString(1, obj.getAntigen());
            cs.setString(2, obj.getProduced());
            cs.setString(3, obj.getCompany());
            cs.setString(4, obj.getCatalog());
            cs.setString(5, obj.getLocation());
            cs.setString(6, obj.getBox());
            cs.setString(7, obj.getDetails());


        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    @Override
    protected String getSelectQuery() {
        return "SELECT * FROM list";
    }

    @Override
    protected String getDeleteQuery() {
        return "{CALL delete_antibody(?)}";
    }

    @Override
    protected void fillDeleteStatement(CallableStatement cs, Antibody obj) throws DaoException {

        try {
            cs.setInt(1, obj.getId());

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    @Override
    protected String getSelectFilteredQuery() {
        return "SELECT * FROM list WHERE id=";
    }


    @Override
    protected void fillPreparedStatement(PreparedStatement ps, Antibody obj) throws DaoException {

    }

    @Override
    protected List<Antibody> parseResultsSet(ResultSet rs) throws DaoException {
        List<Antibody> list = new ArrayList<>();

        try {
            while (rs.next()) {

                Antibody antibody = new Antibody();
                antibody.setId(rs.getInt("id"));
                antibody.setAntigen(rs.getString("antigen"));
                antibody.setProduced(rs.getString("produced_in"));
                antibody.setCompany(rs.getString("company"));
                antibody.setCatalog(rs.getString("cat_nr"));
                antibody.setLocation(rs.getString("location"));
                antibody.setBox(rs.getString("box"));
                antibody.setDetails(rs.getString("details"));

                list.add(antibody);
            }
        } catch (SQLException e) {
            throw new DaoException(e);
        }
        return list;
    }


}
