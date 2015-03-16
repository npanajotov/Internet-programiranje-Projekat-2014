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
                        <li class="active"><a href="artikli-sef.jsp">Artikli</a></li>
                        <li><a href="pretraga-sef.jsp">Pretraga</a></li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
</header>
<div class="container sadrzaj">
    <div class="sixteen columns">   
        <h2> Lista artikala u labaratorijama gde ste šef</h2>
       

        <div id="center">
            <div class="three-thirds column" id="">
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
                            <th>Kategorija</th> 
                            <th>Izmeni</th>
                        </tr>
                    </thead>
                    <%  Class.forName("com.mysql.jdbc.Driver");
                        Connection konekcijad
                                = DriverManager.getConnection("jdbc:mysql://localhost:3306/ip-isl", "root", "");
                        Statement iskazd = konekcijad.createStatement();

                        String upitd = "SELECT * FROM artikal INNER JOIN sef_labaratorije ON artikal.idlabaratorije=sef_labaratorije.idlabaratorije WHERE korisnickoime='" + korisnickoIme + "'";
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
                            izmeni = "<a href=\"izmeniArtikal-sef.jsp?id=" + ID + "\" class=\"deaktiviraj\" title=\"Izmeni\"><img src=\"images/edit.gif\" class=\"rotiraj90\"></a>";
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
                             <td><%=kategorija%></td> 
                            <td><%=izmeni%></td> 

                        </tr> 
                    </tbody>
                    <%
                        } }}%>
                </table>

            </div>
        </div>

        <a href="zatraziArtikal-sef.jsp"><input type="submit" class="full-width100" style="margin-bottom:10px;" value="Zatrazi artikl!"></a>

    </div>
</div>
</body>
</html>
