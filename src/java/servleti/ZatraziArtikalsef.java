package servleti;

import binovi.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "ZatraziArtikalsef", urlPatterns = {"/ZatraziArtikalsef"})
public class ZatraziArtikalsef extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession sesija = request.getSession();

        String str = (String)sesija.getAttribute("korime");

        String naziv = request.getParameter("naziv");
        String model = request.getParameter("model");
        int kolicina = Integer.parseInt(request.getParameter("kolicina"));
        String kategorija = request.getParameter("kategorija");   
        int idlabaratorije = Integer.parseInt(request.getParameter("idlabaratorije"));

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection konekcija = DriverManager.getConnection("jdbc:mysql://localhost:3306/ip-isl", "root", "");
            if (naziv.equals("") && model.equals("") && kolicina == 0) {
                String zatraziGreska = "";
                zatraziGreska = "<div class=\"infoPop obavestenje\"><h5>Molimo unesite sva polja!</h5></div>";
                request.setAttribute("zatraziGreska", zatraziGreska);
                RequestDispatcher rd = request.getRequestDispatcher("zatartikal.jsp");
                rd.forward(request, response);
            } else {
                Statement iskaz = konekcija.createStatement();
                iskaz.executeUpdate("INSERT INTO zahtevi(naziv,model,kolicina,kategorija,idlabaratorije,korisnickoime) " + "VALUES('" + naziv + "','" + model + "','" + kolicina + "','" + kategorija + "','" + idlabaratorije + "','" + str + "')");
                String zatraziUspeh = "";
                zatraziUspeh = "<div class=\"infoPop obavestenje\"><h5>Uspesno ste zatrazili artikal, ceka se odobrenje šefa magacina!</h5></div>";
                request.setAttribute("zatraziUspeh", zatraziUspeh);
                RequestDispatcher rd = request.getRequestDispatcher("zatraziArtikal-sef.jsp");
                rd.forward(request, response);
            }

        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(ZatraziArtikal.class.getName()).log(Level.SEVERE, null, ex);
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(ZatraziArtikal.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(ZatraziArtikal.class.getName()).log(Level.SEVERE, null, ex);
        }
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
