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
                        <li><a href="admin.jsp">Korisnici</a></li>
                        <li><a href="labaratorije.jsp">Labaratorije</a></li>
                        <li><a href="artikli.jsp">Artikli</a></li>
                        <li><a href="kompanije.jsp">Kompanije</a></li>
                        <li class="active"><a href="pretraga.jsp">Pretraga</a></li>
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
                    <form name="pretraga" class="myForm" method="post" action="pretraga.jsp">
                        <p>Naziv artikla:</p>
                        <input type="text" name="naziv" placeholder="Unesite naziv..." class="full-width" />
                        <p>Datum od:</p>
                        <input type="date" name="oddatum" class="full-width"/>
                        <p>Datum do:</p>
                        <input type="date" name="dodatum" class="full-width"/>
                        <p>Labaratorija:</p>
                        <select name="idlab" class="full-width">
                            <option>Sve labaratorije</option>
                            <%  Class.forName("com.mysql.jdbc.Driver");
                                Connection konekcija
                                        = DriverManager.getConnection("jdbc:mysql://localhost:3306/ip-isl", "root", "");
                                Statement iskaz = konekcija.createStatement();
                                String upit = "SELECT * FROM labaratorija";
                                ResultSet rezultat = iskaz.executeQuery(upit);
                                while (rezultat.next()) {

                            %>
                            <option value="<%=rezultat.getString(1)%>"><%=rezultat.getString(2)%>  <% }%></option>
                        </select>
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
                                String idlabaratorije = request.getParameter("idlab");

                                ResultSet rezultatPretrage = statement.executeQuery("SELECT * FROM artikal WHERE datumnabavke BETWEEN '" + oddatum + "' AND '" + dodatum + "' OR naziv LIKE '" + naziv + "' OR idlabaratorije LIKE '" + idlabaratorije + "'");
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
                            <td><a href="artikalPretraga.jsp?id=<%=idArtikla%>" > Pogledaj </a> </td>
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
