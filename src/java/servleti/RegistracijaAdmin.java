package servleti;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import binovi.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;

@WebServlet(name = "RegistracijaAdmin", urlPatterns = {"/RegistracijaAdmin"})
public class RegistracijaAdmin extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String nejm = request.getParameter("ime");
        String surnejm = request.getParameter("prezime");
        String adres = request.getParameter("adresa");
        int telefon = Integer.parseInt(request.getParameter("telefon"));
        String username = request.getParameter("korime");
        String password = request.getParameter("lozin");
        String mejl = request.getParameter("mejl");
        int nivopristupa = Integer.parseInt(request.getParameter("nivopristupa"));
        String aGreska = "";
        String aUspeh = "";
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection konekcija = DriverManager.getConnection("jdbc:mysql://localhost:3306/ip-isl", "root", "");
            Statement iskaz = konekcija.createStatement();
            ResultSet upit = iskaz.executeQuery("SELECT * FROM korisnici WHERE korisnickoime='" + username + "'");
            if (upit.next()) {
                aGreska = "<div class=\"infoPop obavestenje\"><h5>Korisničko ime već postoji u bazi. Pokušajte neko drugo!</h5></div>";
                request.setAttribute("aGreska", aGreska);
                RequestDispatcher rd = request.getRequestDispatcher("admin.jsp");
                rd.forward(request, response);
            } else {
                Statement iskazDva = konekcija.createStatement();
                iskazDva.executeUpdate("INSERT INTO korisnici(ime,prezime,adresa,telefon,korisnickoime,lozinka,mejl,status,nivopristupa) " + "VALUES('" + nejm + "','" + surnejm + "','" + adres + "','" + telefon + "','" + username + "','" + password + "','" + mejl + "'," + 1 + ",'" + nivopristupa + "')");
                aUspeh = "<div class=\"infoPop obavestenje\"><h5>Uspesno ste registrovali korisnika!</h5></div>";
                request.setAttribute("aUspeh", aUspeh);
                RequestDispatcher rd = request.getRequestDispatcher("admin.jsp");
                rd.forward(request, response);
            }
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(promenaLozinke.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
