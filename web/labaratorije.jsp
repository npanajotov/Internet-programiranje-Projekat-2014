<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="heder.jsp" %>
${izmLUspeh} ${izmLGreska} ${dslUspeh} ${dslGreska}
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
                        <li class="active"><a href="labaratorije.jsp">Labaratorije</a></li>
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
        <h2> Lista labaratorija</h2>
        <div id="center">
            <div class="three-thirds column">
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Naziv</th>
                            <th>Broj radnih mesta</th>
                            <th>Kvadratura</th>
                            <th>Izmeni</th>
                        </tr>
                    </thead>
                    <%                                Class.forName("com.mysql.jdbc.Driver");
                        Connection konekcija
                                = DriverManager.getConnection("jdbc:mysql://localhost:3306/ip-isl", "root", "");
                        Statement iskaz = konekcija.createStatement();
                        String upit = "SELECT * FROM labaratorija";
                        ResultSet rezultat = iskaz.executeQuery(upit);
                        while (rezultat.next()) {
                            Integer ID = rezultat.getInt(1);
                            String naziv = rezultat.getString(2);
                            int kvadratura = rezultat.getInt(3);
                            int brRadnihMesta = rezultat.getInt(4);
                            String izmeni = "";
                            izmeni = "<a href=\"izmeniLabaratoriju.jsp?id=" + ID + "\"><img src=\"images/edit.gif\" title=\"Izmeni\"class=\"rotiraj90\"></a>";

                    %>      
                    <tbody>
                        <tr>
                            <td><%=ID%></td>
                            <td><%=naziv%></td>
                            <td><%=kvadratura%></td>
                            <td><%=brRadnihMesta%></td>
                            <td><%=izmeni%></td>
                        </tr>
                    </tbody>
                    <% }%>
                </table>
            </div>
        </div>
        <a href="dodajLabaratoriju.jsp"><input type="submit" class="full-width100 half-bottom" value="Dodaj labaratoriju!"></a>
    </div>
    <hr />
    <div class="sixteen columns">
        <h2>Šefovi labaratorija </h2>
        <div id="center">
            <div class="three-thirds column">
                <table>
                    <thead>
                        <tr>
                            <th>Labaratorija</th>
                            <th>Korisničko ime šefa labaratorije</th>
                            <th>Obriši</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%                                Class.forName("com.mysql.jdbc.Driver");
                            Connection konekcijaSefova
                                    = DriverManager.getConnection("jdbc:mysql://localhost:3306/ip-isl", "root", "");
                            Statement iskazSefova = konekcijaSefova.createStatement();

                            if (request.getParameter("idSefovi") != null && request.getParameter("akcija") != null) {
                                int idSefovi = Integer.parseInt(request.getParameter("idSefovi"));
                                String akcija = request.getParameter("akcija");
                                if (akcija.equals("obrisi")) {
                                    iskaz.executeUpdate("DELETE FROM sef_labaratorije WHERE idlabaratorije = '" + idSefovi + "'");
                                }
                            }

                            String upitSefova = "SELECT * FROM sef_labaratorije";
                            ResultSet rezultatSefova = iskazSefova.executeQuery(upitSefova);
                        %>
                    <td colspan="3" class="nema"> Trenutno niko nije šef nijedne labaratorije. </td>
                    <%
                        while (rezultatSefova.next()) {
                            Integer IDlabaratorije = rezultatSefova.getInt(1);
                            String naziv = rezultatSefova.getString(2);
                            String obrisi = "";
                            obrisi = "<a href=\"labaratorije.jsp?akcija=obrisi&idSefovi=" + IDlabaratorije + "\" class=\"aktiviraj\" title=\"Obriši\"><img src=\"images/unch.gif\"></a>";
                    %>
                    <style>
                        .nema{display:none;}
                    </style>
                    <%                                Class.forName("com.mysql.jdbc.Driver");
                        Connection konekcijaLab
                                = DriverManager.getConnection("jdbc:mysql://localhost:3306/ip-isl", "root", "");
                        Statement iskazLab = konekcijaLab.createStatement();
                        String upitLab = "SELECT * FROM labaratorija WHERE ID='" + IDlabaratorije + "'";
                        ResultSet rezultatLab = iskazLab.executeQuery(upitLab);
                        while (rezultatLab.next()) {
                            String labaratorija = rezultatLab.getString(2);
                    %>
                    <tr>
                        <td><%=labaratorija%></td>
                        <td><%=naziv%></td>
                        <td><%=obrisi%></td>
                    </tr>
                    </tbody>
                    <% }
                   }%>
                </table>
            </div>
        </div>
    </div>
    <hr />
    <div class="sixteen columns">
        <h2> Dodaj šefa labaratorije</h2>
        <div id="center">
            <div class="three-thirds column">
                <div class="formContent">
                    <form name="dodajSefa" action="DodajSefaLabaratorije" class="myForm" method="post">
                        <table>
                            <td align="right">Korisnik:</td>
                            <th align="center">
                                <select name="username">
                                    <%  Class.forName("com.mysql.jdbc.Driver");
                                        Connection konekcijaKor
                                                = DriverManager.getConnection("jdbc:mysql://localhost:3306/ip-isl", "root", "");
                                        Statement iskazKor = konekcijaKor.createStatement();
                                        String upitKor = "SELECT * FROM korisnici";
                                        ResultSet rezultatKor = iskazKor.executeQuery(upitKor);
                                        while (rezultatKor.next()) {
                                            String username = rezultatKor.getString(4);
                                    %>
                                    <option value="<%=rezultatKor.getString(4)%>"><%=rezultatKor.getString(4)%>  <% }%></option>
                                </select>
                            </th>
                            <td align="right">Labaratorija:</td>
                            <th align="center">
                                <select name="idLabaratorije">
                                    <%
                                        Class.forName("com.mysql.jdbc.Driver");
                                        Connection konekcijaLab
                                                = DriverManager.getConnection("jdbc:mysql://localhost:3306/ip-isl", "root", "");
                                        Statement iskazLab = konekcijaLab.createStatement();
                                        String upitLab = "SELECT * FROM labaratorija";
                                        ResultSet rezultatLab = iskazLab.executeQuery(upitLab);
                                        while (rezultatLab.next()) {
                                            int idLabaratorije = rezultatLab.getInt(1);
                                    %>
                                    <option value="<%=rezultatLab.getString(1)%>"><%=rezultatLab.getString(2)%>
                                        <%
                                            }
                                        %>
                                    </option>
                                </select>
                            </th>
                        </table>
                        <input type="submit" class="full-width" value="Dodaj šefa Labaratorije" >
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
