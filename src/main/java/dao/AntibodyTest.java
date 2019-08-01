package dao;

import domain.Antibody;

public class AntibodyTest {

    public static void main(String[] args) {

        Antibody antibody = new Antibody("APMAP223", "Rabbit", "Sigma", "HPA064700", "-20", "7", "");
        AntibodyDao ad = new AntibodyDao();

        try {
            ad.create(antibody);
        } catch (DaoException e) {
            e.printStackTrace();
        }

        try {
            antibody = ad.read(245);
            System.out.println(antibody.toString());
        } catch (DaoException e) {
            e.printStackTrace();
        }
/*
        try {
            ad.delete(antibody);
        } catch (DaoException e) {
            e.printStackTrace();
        }


        try {
            ad.getAll();
        } catch (DaoException e) {
            e.printStackTrace();
        }

*/
    }
}
