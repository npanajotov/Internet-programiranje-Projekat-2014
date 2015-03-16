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
                        <li class="active"><a href="labaratorije-sef.jsp">Labaratorije</a></li>
                        <li><a href="artikli-sef.jsp">Artikli</a></li>
                        <li><a href="pretraga-sef.jsp">Pretraga</a></li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
</header>
<div class="container sadrzaj">
    <div class="sixteen columns">
        <h2> Lista labaratorija u kojima ste šef</h2>
        <div id="center">
            <div class="three-thirds column">
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Naziv</th>
                            <th>Broj radnih mesta</th>
                            <th>Kvadratura</th>
                        </tr>
                    </thead>
                    <%                                
                    Class.forName("com.mysql.jdbc.Driver");
                        Connection konekcija
                                = DriverManager.getConnection("jdbc:mysql://localhost:3306/ip-isl", "root", "");
                        Statement iskaz = konekcija.createStatement();
                        String upit = "SELECT * FROM labaratorija INNER JOIN sef_labaratorije ON labaratorija.id=sef_labaratorije.idlabaratorije WHERE korisnickoime='" + korisnickoIme + "'";
                        ResultSet rezultat = iskaz.executeQuery(upit);
                        while (rezultat.next()) {

                    %>      
                    <tbody>
                        <tr>
                            <td><%=rezultat.getString(1)%></td>
                            <td><%=rezultat.getString(2)%></td>
                            <td><%=rezultat.getString(3)%></td>
                            <td><%=rezultat.getString(4)%></td>
                        </tr>
                    </tbody>
                    <% }%>
                </table>
            </div>
        </div>
    </div>
   
</div>
</body>
</html>
