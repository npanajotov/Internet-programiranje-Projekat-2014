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

@WebServlet(name = "DodajArtikal", urlPatterns = {"/DodajArtikal"})
public class DodajArtikal extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String naziv = request.getParameter("naziv");
        String model = request.getParameter("model");
        int evbroj =  Integer.parseInt(request.getParameter("evbroj"));
        String garancija = request.getParameter("dagumgar");
        int kompanija = Integer.parseInt(request.getParameter("kompanija"));
        String nabavka = request.getParameter("datumnab");
        int vrednostdin = Integer.parseInt(request.getParameter("vrednostdin"));
        int vrednoste = vrednostdin / 115;
        int idlabaratorije = Integer.parseInt(request.getParameter("idlabaratorije"));
        String status = "Ispravno";
        String kategorija = request.getParameter("kategorija");
         
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection konekcija = DriverManager.getConnection("jdbc:mysql://localhost:3306/ip-isl", "root", "");
            if (naziv.equals("") && kategorija.equals("") && vrednostdin == 0) {
                String daGreska = "";
                daGreska = "<div class=\"infoPop obavestenje\"><h5>Molimo unesite sva polja!</h5></div>";
                request.setAttribute("daGreska", daGreska);
                RequestDispatcher rd = request.getRequestDispatcher("dodajArtikal.jsp");
                rd.forward(request, response);
            } else {
                Statement iskaz = konekcija.createStatement();
                iskaz.executeUpdate("INSERT INTO artikal(naziv,model,evbroj,datumgarancije,idkompanije,datumnabavke,vrednoste,vrednostdin,idlabaratorije,status,kategorija) " + "VALUES('" + naziv + "','" + model + "','" + evbroj + "','" + garancija + "','" + kompanija + "','" + nabavka + "','" + vrednostdin + "','" + vrednoste + "','" + idlabaratorije + "','" + status + "','" + kategorija + "')");
                String daUspeh = "";
                daUspeh = "<div class=\"infoPop obavestenje\"><h5>Uspesno ste dodali artikal!</h5></div>";
                request.setAttribute("daUspeh", daUspeh);
                RequestDispatcher rd = request.getRequestDispatcher("dodajArtikal.jsp");
                rd.forward(request, response);
            }
        }catch (SQLException | ClassNotFoundException ex) {
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
