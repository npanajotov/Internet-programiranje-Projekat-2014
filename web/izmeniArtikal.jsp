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
                        <li class="active"><a href="artikli.jsp">Artikli</a></li>
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
        <h2> Lista artikala</h2>
        <div id="center">
            <div class="three-thirds column" id="pomocnaDiv">
                <table>
                    <thead>
                        <tr>
                            <th>Naziv</th>
                            <th>Model</th>
                            <th>Evid. broj</th>
                            <th>Garantni rok</th>
                            <th>ID kompanije</th>
                            <th>Datum nabavke</th>
                            <th>Vrednost din (€)</th>
                            <th>Labaratorija</th>
                            <th>Status</th> 
                            <th>Izmeni</th>
                            <th>Otpis</th>
                        </tr>
                    </thead>
                    <%  Class.forName("com.mysql.jdbc.Driver");
                        Connection konekcija
                                = DriverManager.getConnection("jdbc:mysql://localhost:3306/ip-isl", "root", "");
                        Statement iskaz = konekcija.createStatement();

                        String upit = "SELECT * FROM artikal WHERE kategorija LIKE '%osnovna%'";
                        ResultSet rezultat = iskaz.executeQuery(upit);
                        while (rezultat.next()) {
                            Integer ID = rezultat.getInt(1);
                            String naziv = rezultat.getString(2);
                            String model = rezultat.getString(3);
                            String evbroj = rezultat.getString(4);
                            String datumgarancije = rezultat.getString(5);
                            Integer IDkompanije = rezultat.getInt(6);
                            String datumnabavke = rezultat.getString(7);
                            Integer vrednoste = rezultat.getInt(8);
                            Integer vrednostdin = rezultat.getInt(9);
                            Integer IDlabaratorije = rezultat.getInt(10);
                            String status = rezultat.getString(11);
                            String kategorija = rezultat.getString(12);
                            String izmeni = "";
                            izmeni = "<a href=\"izmeniArtikal.jsp?id=" + ID + "\" class=\"deaktiviraj\" title=\"Izmeni\"><img src=\"images/edit.gif\" class=\"rotiraj90\"></a>";
%>
                        <%                                
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection konekcijaLab
                                = DriverManager.getConnection("jdbc:mysql://localhost:3306/ip-isl", "root", "");
                        Statement iskazLab = konekcijaLab.createStatement();
                        String upitLab = "SELECT * FROM labaratorija WHERE ID='" + IDlabaratorije + "'";
                        ResultSet rezultatLab = iskazLab.executeQuery(upitLab);
                        while (rezultatLab.next()) {
                            String labaratorija = rezultatLab.getString(2);
                    %>
                    <%                                
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection konekcijaKomp
                                = DriverManager.getConnection("jdbc:mysql://localhost:3306/ip-isl", "root", "");
                        Statement iskazKomp = konekcijaKomp.createStatement();
                        String upitKomp = "SELECT * FROM kompanija WHERE id='" + IDkompanije + "'";
                        ResultSet rezultatKomp = iskazKomp.executeQuery(upitKomp);
                        while (rezultatKomp.next()) {
                            String kompanija = rezultatKomp.getString(2);
                    %>
                          
                    <tbody>
                        <tr>
                            <td><%=naziv%></td>
                            <td><%=model%></td>
                            <td><%=evbroj%></td>
                            <td><%=datumgarancije%></td>
                            <td><%=kompanija%></td>
                            <td><%=datumnabavke%></td>
                            <td><%=vrednostdin%>(<%=vrednoste%>)</td>
                            <td><%=labaratorija%></td>
                             <td><%=status%></td> 
                            <td><%=izmeni%></td> 
                            <td><a href="otpisArtikla?id=<%=ID%>" class="deaktiviraj" title="Otpisi artikal!"> <img src="images/unch.gif"> </a> </td>
                        </tr> 
                    </tbody>
                    <%
                        } }}%>
                </table>
            </div>
        </div>

        <div id="center">
            <div class="three-thirds column" id="osnovnaDiv">
                <table>
                    <thead>
                        <tr>
                           <th>Naziv</th>
                            <th>Model</th>
                            <th>Evid. broj</th>
                            <th>Garantni rok</th>
                            <th>ID kompanije</th>
                            <th>Datum nabavke</th>
                            <th>Vrednost din (€)</th>
                            <th>Labaratorija</th>
                            <th>Status</th> 
                            <th>Izmeni</th>
                            <th>Otpis</th>
                        </tr>
                    </thead>
                    <%  Class.forName("com.mysql.jdbc.Driver");
                        Connection konekcijad
                                = DriverManager.getConnection("jdbc:mysql://localhost:3306/ip-isl", "root", "");
                        Statement iskazd = konekcijad.createStatement();

                        String upitd = "SELECT * FROM artikal WHERE kategorija LIKE '%pomocna%'";
                        ResultSet rezultatd = iskazd.executeQuery(upitd);
                        while (rezultatd.next()) {
                            Integer ID = rezultatd.getInt(1);
                            String naziv = rezultatd.getString(2);
                            String model = rezultatd.getString(3);
                            String evbroj = rezultatd.getString(4);
                            String datumgarancije = rezultatd.getString(5);
                            Integer IDkompanije = rezultatd.getInt(6);
                            String datumnabavke = rezultatd.getString(7);
                            Integer vrednoste = rezultatd.getInt(8);
                            Integer vrednostdin = rezultatd.getInt(9);
                            Integer IDlabaratorije = rezultatd.getInt(10);
                            String status = rezultatd.getString(11);
                            String kategorija = rezultatd.getString(12);
                            String izmeni = "";
                            izmeni = "<a href=\"izmeniArtikal.jsp?id=" + ID + "\" class=\"deaktiviraj\" title=\"Izmeni\"><img src=\"images/edit.gif\" class=\"rotiraj90\"></a>";
                    %>
<%                                
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection konekcijaLab
                                = DriverManager.getConnection("jdbc:mysql://localhost:3306/ip-isl", "root", "");
                        Statement iskazLab = konekcijaLab.createStatement();
                        String upitLab = "SELECT * FROM labaratorija WHERE ID='" + IDlabaratorije + "'";
                        ResultSet rezultatLab = iskazLab.executeQuery(upitLab);
                        while (rezultatLab.next()) {
                            String labaratorija = rezultatLab.getString(2);
                    %>
                    <%                                
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection konekcijaKomp
                                = DriverManager.getConnection("jdbc:mysql://localhost:3306/ip-isl", "root", "");
                        Statement iskazKomp = konekcijaKomp.createStatement();
                        String upitKomp = "SELECT * FROM kompanija WHERE id='" + IDkompanije + "'";
                        ResultSet rezultatKomp = iskazKomp.executeQuery(upitKomp);
                        while (rezultatKomp.next()) {
                            String kompanija = rezultatKomp.getString(2);
                    %>
                    
                    <tbody>
                        <tr>
                            <td><%=naziv%></td>
                            <td><%=model%></td>
                            <td><%=evbroj%></td>
                            <td><%=datumgarancije%></td>
                            <td><%=kompanija%></td>
                            <td><%=datumnabavke%></td>
                            <td><%=rezultatd.getString(9)%>(<%=rezultatd.getString(8)%>)</td>
                            <td><%=labaratorija%></td>
                             <td><%=status%></td> 
                            <td><%=izmeni%></td> 
                            <td><a href="otpisArtikla?id=<%=ID%>" class="deaktiviraj" title="Otpisi artikal!"> <img src="images/unch.gif"> </a> </td>

                        </tr> 
                    </tbody>
                    <%
                        } }}%>
                </table>

            </div>
        </div>

        <div id="center" class="artikli">
            <div class="six columns">
                <div id="center">
                    <button id="pomocna" class="active">Osnovna oprema</button>
                    <button id="osnovna" class="">Pomoćna oprema</button>
                </div>
            </div>
        </div>

    </div>
    <hr />
    <div class="sixteen columns">
        <h2> Izmeni artikal</h2>
        <div id="center">
            <div class="eight columns">
                <div class="formContent">
                    <form name="izmeniArt" class="myForm" method="post" action="izmeniArtikal">
                        <%
                            String id = request.getParameter("id");
                            int ID = Integer.parseInt(id);
                            try {
                                Class.forName("com.mysql.jdbc.Driver");
                                Connection konekcijaz = DriverManager.getConnection("jdbc:mysql://localhost:3306/ip-isl", "root", "");
                                String upitz = "SELECT * FROM artikal WHERE id='" + ID + "'";
                                Statement iskazz = konekcijaz.createStatement();
                                ResultSet rezultatz = iskazz.executeQuery(upitz);
                                while (rezultatz.next()) {
                                    Integer IDlabaratorije = rezultatz.getInt(10);
                        %>
                        <input type="hidden" name="id" value="<%=rezultatz.getString("id")%>" class="full-width" />
                        <p>Naziv artikla:</p>
                        <input type="text" name="naziv" value="<%=rezultatz.getString("naziv")%>" class="full-width" />
                        <p>Model:</p>
                        <input type="text" name="model" value="<%=rezultatz.getString("model")%>" class="full-width"/>
                        <p>Evidencioni broj</p>
                        <input type="text" name="evbroj" value="<%=rezultatz.getInt("evbroj")%>" class="full-width"/>
                        <p>Datum garancije</p>
                        <input type="date" name="datumgarancije" value="<%=rezultatz.getString("datumgarancije")%>" class="full-width" />
                        <p>Kompanija</p>
                        <select name="kompanija" class="full-width">
                            <%
                                Class.forName("com.mysql.jdbc.Driver");
                                Connection konekcijaKomp
                                        = DriverManager.getConnection("jdbc:mysql://localhost:3306/ip-isl", "root", "");
                                Statement iskazKomp = konekcijaKomp.createStatement();
                                String upitKomp = "SELECT * FROM kompanija";
                                ResultSet rezultatKomp = iskazKomp.executeQuery(upitKomp);
                                while (rezultatKomp.next()) {
                                    int idkompanije = rezultatKomp.getInt(1);
                                    String kompanija = rezultatKomp.getString(2);
                            %>
                            <option value="<%=idkompanije%>"><%=kompanija%>
                                <%
                                    }
                                %>
                            </option>
                        </select>
                        <p>Labaratorija:</p>
                        <select name="labaratorija" class="full-width">
                            <%                                Class.forName("com.mysql.jdbc.Driver");
                                Connection konekcijaLab
                                        = DriverManager.getConnection("jdbc:mysql://localhost:3306/ip-isl", "root", "");
                                Statement iskazLab = konekcijaLab.createStatement();
                                String upitLab = "SELECT * FROM labaratorija WHERE ID='" + IDlabaratorije + "'";
                                ResultSet rezultatLab = iskazLab.executeQuery(upitLab);
                                while (rezultatLab.next()) {
                                    String labaratorija = rezultatLab.getString(2);
                            %>

                            <%  Class.forName("com.mysql.jdbc.Driver");
                                Connection konekcijaLabs
                                        = DriverManager.getConnection("jdbc:mysql://localhost:3306/ip-isl", "root", "");
                                Statement iskazLabs = konekcijaLabs.createStatement();
                                String upitLabs = "SELECT * FROM labaratorija";
                                ResultSet rezultatLabs = iskazLabs.executeQuery(upitLabs);
                                while (rezultatLabs.next()) {
                                    int idLabaratorije = rezultatLabs.getInt(1);
                                    String imeLabaratorije = rezultatLabs.getString(2);
                                    if (IDlabaratorije == idLabaratorije) {
                                        out.println("<option value=\"" +IDlabaratorije+ "\">" + imeLabaratorije + " </option>");
                                    } else {
                            %>
                                <option value="<%=idLabaratorije%>"><%=imeLabaratorije%>  <% }
                                    }}%></option>
                        </select>
                         <p>Status</p>
                        <select name="status" class="full-width">
                            <%   Class.forName("com.mysql.jdbc.Driver");
                                Connection konekcijaSifrarnik
                                        = DriverManager.getConnection("jdbc:mysql://localhost:3306/ip-isl", "root", "");
                                Statement iskazSifrarnik = konekcijaSifrarnik.createStatement();
                                String upitSifrarnik = "SELECT * FROM sifrarnik";
                                ResultSet rezultatSifrarnik = iskazSifrarnik.executeQuery(upitSifrarnik);
                                while (rezultatSifrarnik.next()) {
                                    String status = rezultatSifrarnik.getString(2);
                                    
                            %>
                                <option value="<%=status%>"><%=status%>  <% 
                                    }%></option>
                        </select>
                        <input type="submit" class="full-width" value="Izmeni artikal!" >
                        <%      
                                }
                            } catch (Exception ex) {
                            }
                        %>
                    </form>

                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
