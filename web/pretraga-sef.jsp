<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="heder.jsp" %>
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
                        <li><a href="labaratorije-sef.jsp">Labaratorije</a></li>
                        <li><a href="artikli-sef.jsp">Artikli</a></li>
                        <li class="active"><a href="pretraga-sef.jsp">Pretraga</a></li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
</header>
<div class="container sadrzaj">
    <div class="sixteen columns">   
        <h2>Pretraga</h2>
        <div id="center">
            <div class="eight columns">
                <div class="formContent">
                    <form name="pretraga" class="myForm" method="post" action="pretraga-sef.jsp">
                        <p>Naziv artikla:</p>
                        <input type="text" name="naziv" placeholder="Unesite naziv..." class="full-width" />
                        <p>Datum od:</p>
                        <input type="date" name="oddatum" class="full-width"/>
                        <p>Datum do:</p>
                        <input type="date" name="dodatum" class="full-width"/>
                       
                        <input type="submit" class="full-width" onClick="" value="Pretrazi">
                    </form></div></div></div>
        <div id="center">
            <div class="eight columns">
                <div class="formContent">
                    <h2>Rezultati pretrage</h2>
                    <table>
                        <thead>
                            <tr>
                                <th>Naziv</th>
                                <th>Datum nabavke</th>
                                <th>ID Labaratorije</th>
                                <th>Detalji </th>
                            </tr>
                        </thead>
                        <tbody> 
                            <%
                                Class.forName("com.mysql.jdbc.Driver");
                                Connection connection
                                        = DriverManager.getConnection("jdbc:mysql://localhost:3306/ip-isl", "root", "");

                                Statement statement = connection.createStatement();

                                String naziv = request.getParameter("naziv");
                                String oddatum = request.getParameter("oddatum");
                                String dodatum = request.getParameter("dodatum");
                                String idlab = request.getParameter("idlab");

                                ResultSet rezultatPretrage = statement.executeQuery("SELECT * FROM artikal INNER JOIN sef_labaratorije ON artikal.idlabaratorije=sef_labaratorije.idlabaratorije WHERE naziv LIKE '" + naziv + "' OR datumnabavke BETWEEN '" + oddatum + "' AND '" + dodatum + "' AND sef_labaratorije.korisnickoime='" + korisnickoIme + "'");
                            %>
                        <td colspan="4" class="nema"> Nema rezultata. </td>
                        <%
                            while (rezultatPretrage.next()) {
                                Integer idArtikla = rezultatPretrage.getInt(1);
                                String nazivartikla = rezultatPretrage.getString(2);
                                String datumnabavkeartikla = rezultatPretrage.getString(7);
                                Integer IDlabartikla = rezultatPretrage.getInt(10);
                        %>
                        <%
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection konekcijaLab
                                    = DriverManager.getConnection("jdbc:mysql://localhost:3306/ip-isl", "root", "");
                            Statement iskazLab = konekcijaLab.createStatement();
                            String upitLab = "SELECT * FROM labaratorija WHERE ID='" + IDlabartikla + "'";
                            ResultSet rezultatLab = iskazLab.executeQuery(upitLab);
                            while (rezultatLab.next()) {
                                String labaratorija = rezultatLab.getString(2);

                        %>

                        <style>
                            .nema{display:none;}
                        </style>
                        <tr>
                            <td> <%=nazivartikla%> </td>
                            <td> <%=datumnabavkeartikla%> </td>
                            <td> <%=labaratorija%> </td>
                            <td><a href="artikalPretraga-sef.jsp?id=<%=idArtikla%>" > Pogledaj </a> </td>
                        </tr>
                        <%
                                }
                            }
                        %>

                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
