<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="heder.jsp" %>
        ${daUspeh} ${daGreska}
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
                                <li class="active"><a href="kompanije.jsp">Kompanije</a></li>
                                <li><a href="pretraga.jsp">Pretraga</a></li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </header>
        <div class="container sadrzaj">
            <div class="sixteen columns">   
                <h2> Kompanije</h2>
                <div id="center">
                    <div class="three-thirds column">
                        <table>
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Naziv</th>
                                    <th>Adresa</th>
                                    <th>Telefon</th>
                                    <th>E-mail</th>
                                    <th>PIB</th>
                                    <th>Kontakt osoba</th>
                                    <th>Izmeni</th>

                                </tr>
                            </thead>
                            <%                                Class.forName("com.mysql.jdbc.Driver");
                                Connection konekcija
                                        = DriverManager.getConnection("jdbc:mysql://localhost:3306/ip-isl", "root", "");
                                Statement iskaz = konekcija.createStatement();
                                String upit = "SELECT * FROM kompanija";
                                ResultSet rezultat = iskaz.executeQuery(upit);
                                while (rezultat.next()) {
                                    Integer ID = rezultat.getInt(1);
                                    String naziv = rezultat.getString(2);
                                    String adresa = rezultat.getString(3);
                                    int telefon = rezultat.getInt(4);
                                    String mejl = rezultat.getString(5);
                                    int pib = rezultat.getInt(6);
                                    String kontaktosoba = rezultat.getString(7);
                                    String izmeni = "";
                                    izmeni = "<a href=\"izmeniKompaniju.jsp?id=" + ID + "\"><img src=\"images/edit.gif\" title=\"Izmeni\"class=\"rotiraj90\"></a>";

                            %>      
                            <tbody>
                                <tr>
                                    <td><%=ID%></td>
                                    <td><%=naziv%></td>
                                    <td><%=adresa%></td>
                                    <td><%=telefon%></td>
                                    <td><%=mejl%></td>
                                    <td><%=pib%></td>
                                    <td><%=kontaktosoba%></td>
                                    <td><%=izmeni%></td>

                                </tr> 
                            </tbody>
                            <% }%>
                        </table>
                    </div>
                </div>


                <a href="dodajKompaniju.jsp"><input type="submit" class="full-width100 half-bottom" value="Dodaj kompaniju!"></a>
            </div>
                        <hr />
            <div class="sixteen columns">
                <h2> Dodaj kompaniju</h2>
                <div id="center">
                    <div class="eight columns">
                        <div class="formContent">
                            <form name="izmeniLab" class="myForm" method="post" action="DodajKompaniju">
                                <p>Naziv kompanije:</p>
                                <input type="text" name="naziv" placeholder="Unesite naziv..." class="full-width" />
                                <p>Adresa:</p>
                                <input type="text" name="adresa" placeholder="Unesite adresu..." class="full-width"/>
                                <p>Telefon:</p>
                                <input type="text" name="telefon" placeholder="Unesite telefon" class="full-width"/>
                                <p>E-mail:</p>
                                <input type="email" name="mejl" placeholder="Unesite E-mail..." class="full-width"/>
                                <p>PIB:</p>
                                <input type="text" name="pib" placeholder="Unesite PIB" pattern=".{8}" required title="Unesite ispravan PIB" class="full-width"/>
                                <p>Kontakt osoba:</p>
                                <input type="text" name="kosoba" placeholder="Unesite ime kontakt osobe..." class="full-width"/>  
                                <input type="submit" class="full-width" value="Dodaj kompaniju!" >
                            </form>

                        </div>
                    </div>
                </div>
            </div>
            

        </div>
    </body>
</html>
