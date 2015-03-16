<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="heder.jsp" %>
        ${aUspeh} ${aGreska}
        <header>
            <div class="container">
                <div class="sixteen columns">
                    <a href="admin.jsp"><img src="images/logo2.png"/></a>
                    <div class="ostalo">
                        <div> Dobrodošli, ${osoba.ime}</div>
                        <div>Poslednji put ste pristupili: <%=new Date(session.getCreationTime())%></div>
                        <div class="logout"> <a href="Logout">Izloguj se.</a> </div>

                    </div>
                    <div class="main-menu">
                        <nav class="mainnav">
                            <ul>
                             
                                <li class="active"><a href="admin.jsp">Korisnici</a></li>
                                <li><a href="labaratorije.jsp">Labaratorije</a></li>
                                <li><a href="artikli.jsp">Artikli</a></li>
                                <li><a href="kompanije.jsp">Kompanije</a></li>
                                <li><a href="pretraga.jsp">Pretraga</a></li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </header>
        <div class="container sadrzaj">
            <div class="sixteen columns">
                <h2> Lista korisnika </h2>
                <table >
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Ime</th>
                            <th>Prezime</th>
                            <th>Adresa</th>
                            <th>Email</th>
                            <th>Korisničko ime</th>
                            <th>Telefon</th>
                            <th>Pristup</th>
                            <th>Status</th> 
                        </tr>
                    </thead>
                    <%                        Class.forName("com.mysql.jdbc.Driver");
                        Connection konekcija
                                = DriverManager.getConnection("jdbc:mysql://localhost:3306/ip-isl", "root", "");
                        Statement iskaz = konekcija.createStatement();

                        if (request.getParameter("idKorisnika") != null && request.getParameter("akcija") != null) {
                            int idKorisnika = Integer.parseInt(request.getParameter("idKorisnika"));
                            String akcija = request.getParameter("akcija");
                            if (akcija.equals("deaktiviraj")) {
                                iskaz.executeUpdate("UPDATE korisnici SET status=0 WHERE id=" + idKorisnika);
                            } else if (akcija.equals("aktiviraj")) {
                                iskaz.executeUpdate("UPDATE korisnici SET status=1 WHERE id=" + idKorisnika);
                            }
                        }

                        String upit = "SELECT * FROM korisnici";
                        ResultSet rezultat = iskaz.executeQuery(upit);
                        while (rezultat.next()) {
                            int id = rezultat.getInt(1);
                            int status = rezultat.getInt(9);
                            String statusFull = "";
                            int nivopristupa = rezultat.getInt(10);
                            String nivoFull = "";

                            if (nivopristupa == 3) {
                                nivoFull = "Administrator";
                            } else if (nivopristupa == 2) {
                                nivoFull = "Šef magacina";
                            } else if (nivopristupa == 1) {
                                nivoFull = "Šef labaratorije";
                            }
                            if (status == 0) {
                                statusFull = "<a href=\"admin.jsp?akcija=aktiviraj&idKorisnika=" + id + "\" class=\"aktiviraj\" title=\"Aktiviraj korisnika!\"><img src=\"images/ch.gif\"></a>";
                            } else if (status == 1) {
                                statusFull = "<a href=\"admin.jsp?akcija=deaktiviraj&idKorisnika=" + id + "\" class=\"deaktiviraj\" title=\"Deaktiviraj korisnika!\"><img src=\"images/unch.gif\"></a>";
                            }

                    %>
                    <tbody>
                        <tr>
                            <td><!-- ID --><%=rezultat.getString(1)%></td>
                            <td><!-- Ime --><%=rezultat.getString(2)%></td>
                            <td><!-- Prezime --><%=rezultat.getString(3)%></td>
                            <td><!-- Adresa --><%=rezultat.getString(6)%></td>
                            <td><!-- Email --><%=rezultat.getString(7)%></td>
                            <td><!-- Korisnickoime --><%=rezultat.getString(4)%></td>
                            <td><!-- Telefon --><%=rezultat.getInt(8)%></td>
                            <td><!-- Nivo pristupa --><%=nivoFull%></td>
                            <td><!-- Status --><%=statusFull%></td>
                        </tr>
                        <%
                            }
                        %>    
                    </tbody>
                </table>
                <a href="dodajKorisnika.jsp"> <input type="submit" class="full-width100 half-bottom" value="Dodaj novog korisnika!"></a>
            </div>		  
        </div>
    </body>
</html>
