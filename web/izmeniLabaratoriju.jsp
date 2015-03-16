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
                <h2> Izmeni labaratoriju</h2>
                <div id="center">
                    <div class="eight columns">
                        <div class="formContent">
                            <form name="izmeniLab" class="myForm" method="post" action="izmeniLabaratoriju">
                                <%
                                    String id = request.getParameter("id");
                                    int ID = Integer.parseInt(id);
                                    try {
                                        Class.forName("com.mysql.jdbc.Driver");
                                        Connection konekcijaz = DriverManager.getConnection("jdbc:mysql://localhost:3306/ip-isl", "root", "");
                                        String upitz = "SELECT * FROM labaratorija WHERE id='" + ID + "'";
                                        Statement iskazz = konekcijaz.createStatement();
                                        ResultSet rezultatz = iskaz.executeQuery(upitz);
                                        while (rezultatz.next()) {
                                %>
                                <input type="hidden" name="id" value="<%=rezultatz.getString("id")%>" class="full-width" />
                                <p>Naziv labaratorije:</p>
                                <input type="text" name="naziv" value="<%=rezultatz.getString("naziv")%>" class="full-width" />
                                <p>Broj radnih mesta:</p>
                                <input type="text" name="brradnihmesta" value="<%=rezultatz.getInt("brojrmesta")%>" class="full-width"/>
                                <p>Kvadratura:</p>
                                <input type="text" name="kvadratura" value="<%=rezultatz.getInt("kvadratura")%>" class="full-width"/>
                                <input type="submit" class="full-width" value="Izmeni labaratoriju!" >
                                <%      }
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
