<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="heder.jsp" %>
        ${zatraziUspeh} ${zatraziGreska}
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
                <h2> Zatraži artikal</h2>
                <div id="center">
                    <div class="eight columns" id="">
                        <div class="formContent">
                            <form name="zatArtikl" class="myForm" method="post" action="ZatraziArtikalsef">
                                <p>Naziv artikla:</p>
                                <input type="text" name="naziv" placeholder="Naziv..." class="full-width" />
                                <p>Model:</p>
                                <input type="text" name="model" placeholder="Model..." class="full-width"/>
                                <p>Kolicina:</p>
                                <input type="text" name="kolicina" placeholder="Kolicina..." class="full-width"/>
                                <p>Kategorija:</p>
                                <select name="kategorija" class="full-width">
                                    <option value="osnovna">Osnovna oprema</option>
                                    <option value="pomocna">Pomoćna oprema</option>
                                </select>    
                                <p>Labaratorija:</p>
                                <select name="idlabaratorije" class="full-width">
                                    <%  Class.forName("com.mysql.jdbc.Driver");
                                        Connection konekcija
                                                = DriverManager.getConnection("jdbc:mysql://localhost:3306/ip-isl", "root", "");
                                        Statement iskaz = konekcija.createStatement();
                        String upit = "SELECT * FROM labaratorija INNER JOIN sef_labaratorije ON labaratorija.id=sef_labaratorije.idlabaratorije WHERE korisnickoime='" + korisnickoIme + "'";
                                        ResultSet rezultat = iskaz.executeQuery(upit);
                                        while (rezultat.next()) {
                                            int idLabaratorije = rezultat.getInt(1);
                                            String imeLabaratorije = rezultat.getString(2);
                                    %>
                                    <option value="<%=rezultat.getString(1)%>"><%=rezultat.getString(2)%>  <% }%></option>
                                </select>
                                <input type="submit" class="full-width" value="Zatraži opremu!" >
                            </form>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
