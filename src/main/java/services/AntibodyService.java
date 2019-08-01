package services;

import dao.AntibodyDao;
import dao.DaoException;
import domain.Antibody;

import java.util.List;

public class AntibodyService {
    private AntibodyDao antibodyDao = new AntibodyDao();


    public List<Antibody> getAllAntibodies() {
        List<Antibody> antibodyList = null;
        try {
            antibodyList = antibodyDao.getAll();
        } catch (DaoException e) {
            e.printStackTrace();
        }
        return antibodyList;
    }

    public void deleteAntibody(Antibody antibody) {
        try {
            antibodyDao.delete(antibody);
        } catch (DaoException e) {
            e.printStackTrace();
        }
    }
}
