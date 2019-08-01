package servlets;

import dao.AntibodyDao;
import dao.DaoException;
import domain.Antibody;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "AddNewAntiServlet", urlPatterns = {"/addantibody"})

public class AddNewAntiServlet extends HttpServlet {

    @Override
    public void init() throws ServletException {

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        Antibody antibody = new Antibody();

        antibody.setAntigen(req.getParameter("antigen"));
        antibody.setProduced(req.getParameter("produced"));
        antibody.setCompany(req.getParameter("company"));
        antibody.setCatalog(req.getParameter("catalog"));
        antibody.setLocation(req.getParameter("location"));
        antibody.setBox(req.getParameter("box"));
        antibody.setDetails(req.getParameter("comment"));

        AntibodyDao antibodyDao = new AntibodyDao();
        try {
            antibodyDao.create(antibody);
        } catch (DaoException e) {
            e.printStackTrace();
        }
        resp.sendRedirect("antibody-list.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
