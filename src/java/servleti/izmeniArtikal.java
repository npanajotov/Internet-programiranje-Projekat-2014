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

@WebServlet(name = "izmeniArtikal", urlPatterns = {"/izmeniArtikal"})
public class izmeniArtikal extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        int id =  Integer.parseInt(request.getParameter("id"));
        String naziv = request.getParameter("naziv");
        String model = request.getParameter("model");
        int evbroj =  Integer.parseInt(request.getParameter("evbroj"));
        String datumgarancije = request.getParameter("datumgarancije");
        int kompanija = Integer.parseInt(request.getParameter("kompanija"));
        int labaratorija = Integer.parseInt(request.getParameter("labaratorija"));
        String status = request.getParameter("status"); 
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection konekcijaOtpisano = DriverManager.getConnection("jdbc:mysql://localhost:3306/ip-isl", "root", "");
            if (status.equals("Otpisano")) {
                 Statement iskazOtpisano = konekcijaOtpisano.createStatement();
                iskazOtpisano.executeUpdate("DELETE FROM artikal WHERE naziv='" + naziv + "'");
                String izmArtikalOtpis = "";
                izmArtikalOtpis = "<div class=\"infoPop obavestenje\"><h5>Uspesno ste otpisali artikal!</h5></div>";
                request.setAttribute("izmArtikalOtpis", izmArtikalOtpis);
                RequestDispatcher rd = request.getRequestDispatcher("artikli.jsp");
                rd.forward(request, response);
            } else {
                Statement iskaz = konekcijaOtpisano.createStatement();
                iskaz.executeUpdate("UPDATE artikal SET naziv='" + naziv + "', model='" + model + "', evbroj='" + evbroj + "', datumgarancije='" + datumgarancije + "', idkompanije='" + kompanija + "', idlabaratorije='" + labaratorija + "', status='" + status + "' WHERE id='" + id + "'");
                String izmArtikal = "";
                izmArtikal = "<div class=\"infoPop obavestenje\"><h5>Uspesno ste izmenili podatke o artiklu!</h5></div>";
                request.setAttribute("izmArtikal", izmArtikal);
                RequestDispatcher rd = request.getRequestDispatcher("artikli.jsp");
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
