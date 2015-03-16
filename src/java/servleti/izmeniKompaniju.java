package servleti;

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

@WebServlet(name = "izmeniKompaniju", urlPatterns = {"/izmeniKompaniju"})
public class izmeniKompaniju extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        int ID = Integer.parseInt(request.getParameter("id"));
        String naziv = request.getParameter("naziv");
        String adresa = request.getParameter("adresa");
        int telefon = Integer.parseInt(request.getParameter("telefon"));
        String mejl = request.getParameter("mejl");
        int pib = Integer.parseInt(request.getParameter("pib"));
        String kosoba = request.getParameter("kosoba");
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection konekcija = DriverManager.getConnection("jdbc:mysql://localhost:3306/ip-isl", "root", "");
            if (naziv.equals("") && pib == 0) {
                String izmKGreska = "";
                izmKGreska = "<div class=\"infoPop obavestenje\"><h5>Molimo unesite sva polja!</h5></div>";
                request.setAttribute("izmKGreska", izmKGreska);
                RequestDispatcher rd = request.getRequestDispatcher("kompanije.jsp");
                rd.forward(request, response);
            } else {
                Statement iskaz = konekcija.createStatement();
                iskaz.executeUpdate("UPDATE kompanija SET naziv='" + naziv + "', adresa='" + adresa + "', telefon='" + telefon + "', mejl='" + mejl + "', pib='" + pib + "', kontaktosoba='" + kosoba + "' WHERE id='" + ID + "'");
                String izmKUspeh = "";
                izmKUspeh = "<div class=\"infoPop obavestenje\"><h5>Uspesno ste izmenili podatke o kompaniji!</h5></div>";
                request.setAttribute("izmKUspeh", izmKUspeh);
                RequestDispatcher rd = request.getRequestDispatcher("kompanije.jsp");
                rd.forward(request, response);
            }
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(izmeniKompaniju.class.getName()).log(Level.SEVERE, null, ex);
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
