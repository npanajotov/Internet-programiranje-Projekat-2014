package servleti;

import binovi.Korisnik;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class promenaLozinke extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String lUspeh = "";
        String lGreska = "";
        String username = request.getParameter("korime");
        String password = request.getParameter("lozin");
        String newpassword = request.getParameter("nlozin");  
        Korisnik k = new Korisnik();
        try{      
         Class.forName("com.mysql.jdbc.Driver");
         Connection konekcija = 
                       DriverManager.getConnection("jdbc:mysql://localhost:3306/ip-isl", "root", "");
         Statement iskaz = konekcija.createStatement();
         String upit = "SELECT * FROM korisnici WHERE korisnickoime='"+username+"' AND lozinka='"+password+"'";
         ResultSet rezultat = iskaz.executeQuery(upit);
      boolean provera = false;
      
      while(rezultat.next()){
      String korisIme = request.getParameter("korime");
      String lozinDva = request.getParameter("lozin");
      

      if(korisIme.equals(username) && lozinDva.equals(password) ){
          Statement iskazDva=konekcija.createStatement();
          iskazDva.executeUpdate("UPDATE korisnici SET lozinka='"+newpassword+"' WHERE korisnickoime='"+username+"' and lozinka='"+password+"'");
      } 
      provera = true;
      }
      if(provera == false){
      lGreska = "<div class=\"infoPop obavestenje\"><h5>Pogrešna lozinka ili korisničko ime!</h5></div>";
                        request.setAttribute("lGreska", lGreska);
        RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
                     rd.forward(request, response);
      }
          else{
      lUspeh = "<div class=\"infoPop obavestenje\"><h5>Uspešno ste promenili lozinku!</h5></div>";
                        request.setAttribute("lUspeh", lUspeh);
        RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
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
