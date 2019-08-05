package servlets;

import dao.DaoException;
import dao.UserDao;
import domain.User;
import services.UserService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "SignInServlet", urlPatterns = {"/signin"})

public class SignInServlet extends HttpServlet {


    private String lg = "user";
    private String pwd = "password";

    private UserDao ud = new UserDao();

    @Override
    public void init() throws ServletException {
        System.out.println("Servlet initializing!");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String login = req.getParameter("login");
        String password = req.getParameter("password");

        if (login.equals(lg) && password.equals(pwd)) {

            RequestDispatcher rd = req.getRequestDispatcher("/home.html");
            rd.forward(req, resp);
        } else {
            RequestDispatcher rd = req.getRequestDispatcher("/error.html");
            rd.forward(req, resp);
        }
/*
        UserService us = new UserService();

        User currentUser = us.signIn(login, password);

        if (currentUser != null) {
            System.out.println("Homepage");
            req.setAttribute("currentUser", currentUser);
            RequestDispatcher rd = req.getRequestDispatcher("/profile.jsp");
            rd.forward(req, resp);
        } else {
            System.out.println("Return to main page");
        }*/
    }

}
