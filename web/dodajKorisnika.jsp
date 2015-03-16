<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="heder.jsp" %>
        ${aUspeh} ${aGreska}
        <header>
            <div class="container">
                <div class="sixteen columns">
                    <a href="admin.jsp"><img src="images/logo2.png"/></a>
                    <div class="ostalo"> 
                        <div> Vi ste: ${osoba.nivopristupa}</div>                
                        <div>Poslednji put ste pristupili: <%=new Date(session.getCreationTime())%></div>
                        <div class="logout"> <a href="Logout">Izloguj se.</a> </div>

                    </div>
                    <div class="main-menu">
                        <nav class="mainnav">
                            <ul>
                                <li class="active"><a href="admin.jsp">Korisnici</a></li>
                                <li><a href="labaratorije.jsp">Labaratorije</a></li>
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
                <h2> Dodaj korisnika </h2>
                <div id="center">
                    <div class="eight columns">
                        <div class="formContent">
                            <form name="regFormaAdmin" class="myForm" method="post" action="RegistracijaAdmin">
                                <p>Ime:</p>
                                <input type="text" name="ime" placeholder="Unesite ime..." class="full-width" />
                                <p>Prezime:</p>
                                <input type="text" name="prezime" placeholder="Unesite prezime..." class="full-width"/>
                                <p>Adresa:    </p>
                                <input type="text" name="adresa" placeholder="Unesite adresu..." class="full-width"/>
                                <p>Kontakt telefon</p>
                                <input type="text" name="telefon" placeholder="Unesite kontakt telefon..." class="full-width"/>
                                <p>Korisničko ime:</p>
                                <input type="text" name="korime" placeholder="Unesite korisničko ime..." class="full-width"/>
                                <p>Lozinka:</p>
                                <input type="password" name="lozin" placeholder=" Unesite lozinku..." class="full-width"/>
                                <p>Ponovite lozinku...</p>
                                <input type="password" name="lozinR" placeholder="Unesite opet lozinku..." class="full-width"/>
                                <p>E-mail:</p>
                                <input type="text" name="mejl" placeholder="Unesite E-mail..." class="full-width"/>
                                Privilegija:
                                <select name="nivopristupa" class="full-width">
                                    <option value="1"> Šef labaratorije </option>
                                    <option value="2"> Šef magacina </option>
                                    <option value="3"> Administrator </option>
                                </select>
                                <input type="button" class="full-width" onClick="proveraRegistracijeAdmin()" value="Registruj korisnika!">
                            </form>
                        </div>	
                    </div>	
                </div>
            </div>		  
        </div>
    </body>
</html>
