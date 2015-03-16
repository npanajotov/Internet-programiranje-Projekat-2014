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
        <h2> Lista artikala</h2>
        <div id="center">
            <div class="three-thirds column" id="pomocnaDiv">
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Naziv</th>
                            <th>Model</th>
                            <th>Evid. broj</th>
                            <th>Garantni rok</th>
                            <th>ID kompanije</th>
                            <th>Datum nabavke</th>
                            <th>Vrednost din (€)</th>
                            <th>Labaratorija</th>
                            <th>Status</th> 
                        </tr>
                    </thead>
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
                                           Integer idlabaratorije = rezultatz.getInt(10);
                                        
                                %>
                                <%                                
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection konekcijaLab
                                = DriverManager.getConnection("jdbc:mysql://localhost:3306/ip-isl", "root", "");
                        Statement iskazLab = konekcijaLab.createStatement();
                        String upitLab = "SELECT * FROM labaratorija WHERE ID='" + idlabaratorije + "'";
                        ResultSet rezultatLab = iskazLab.executeQuery(upitLab);
                        while (rezultatLab.next()) {
                            String labaratorija = rezultatLab.getString(2);
                    %>
                                
                               <tbody>
                        <tr>
                            <td><%=rezultatz.getString("id")%></td>
                            <td><%=rezultatz.getString("naziv")%></td>
                            <td><%=rezultatz.getString("model")%></td>
                            <td><%=rezultatz.getString("evbroj")%></td>
                            <td><%=rezultatz.getString("datumgarancije")%></td>
                            <td><%=rezultatz.getString("idkompanije")%></td>
                            <td><%=rezultatz.getString("datumnabavke")%></td>
                            <td><%=rezultatz.getString("vrednoste")%>(<%=rezultatz.getString("vrednostdin")%>)</td>
                            <td><%=labaratorija%></td> 
                            <td><%=rezultatz.getString("status")%></td> 
                                                 </tr> 
                    </tbody>
                                <%      }
                                        }} catch (Exception ex) {
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
