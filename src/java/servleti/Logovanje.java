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
import java.sql.Statement;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;

public class Logovanje extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String username = request.getParameter("korime");
        HttpSession sesija = request.getSession();
        sesija.setAttribute("korime",username);
        String password = request.getParameter("lozin");
        Korisnik k = new Korisnik();
        k.setKorisnickoime(username);
        k.setLozinka(password);
        try { 
            Class.forName("com.mysql.jdbc.Driver");
            Connection konekcija = 
                       DriverManager.getConnection("jdbc:mysql://localhost:3306/ip-isl", "root", "");
            Statement iskaz = konekcija.createStatement();
            if(username!="" && password!=""){
                String upit = "SELECT * FROM korisnici WHERE korisnickoime='"+username+"' AND lozinka='"+password+"'";
                ResultSet rezultat = iskaz.executeQuery(upit);
                if(rezultat.next()){
                        String korisnickoime = rezultat.getString(4);
                        String ime = rezultat.getString(2);
                        String prezime = rezultat.getString(3);
                        String mejl = rezultat.getString(7);
                        Integer status = rezultat.getInt(9);
                        Integer nivopristupa = rezultat.getInt(10); 
                        
                        k.setKorisnickoime(korisnickoime);
                        k.setIme(ime);
                        k.setPrezime(prezime);
                        k.setMejl(mejl);
                        k.setNivopristupa(nivopristupa);
                    
                    sesija.setAttribute("osoba", k);
                    
                    if((nivopristupa == 3) && (status == 1)){
                        RequestDispatcher r = request.getRequestDispatcher("admin.jsp");
                        r.forward(request, response);
                    }
                    if((nivopristupa == 2) && (status == 1)){
                        RequestDispatcher r = request.getRequestDispatcher("labaratorije.jsp");
                        r.forward(request, response);
                    }
                    if((nivopristupa == 1) && (status == 1)){
                    RequestDispatcher r = request.getRequestDispatcher("labaratorije-sef.jsp");
                        r.forward(request, response);
                    }
                    else {
                    String logGreska = "";
                    logGreska = "<div class=\"infoPop obavestenje\"><h5>Nemate pravo pristupa!</h5></div>";
                    request.setAttribute("logGreska", logGreska);
                    RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
                    rd.forward(request, response);
                    }
                }
                else{
                String pogLoz = "";
                    pogLoz = "<div class=\"infoPop obavestenje\"><h5>Pogresna lozinka!</h5></div>";
                    request.setAttribute("pogLoz", pogLoz);
                    RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
                    rd.forward(request, response);
                }
            }
            
        } 
        catch(Exception e) {            
            out.println("Greska: " + e);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
