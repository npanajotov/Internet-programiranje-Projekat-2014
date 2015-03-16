<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lt IE 7 ]>
<html class="ie ie6" lang="en">
   <![endif]-->
   <!--[if IE 7 ]>
   <html class="ie ie7" lang="en">
      <![endif]-->
      <!--[if IE 8 ]>
      <html class="ie ie8" lang="en">
         <![endif]-->
         <!--[if (gte IE 9)|!(IE)]><!-->
         <html lang="sr">
            <!--<![endif]-->
            <head>
               <meta charset="utf-8">
               <title>IP | ISL - Prijava</title>
               <meta name="description" content="">
               <meta name="author" content="">
               <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
               <link rel="stylesheet" href="stylesheets/base.css">
               <link rel="stylesheet" href="stylesheets/skeleton.css">
               <link rel="stylesheet" href="stylesheets/layout.css">
               <script src="http://code.jquery.com/jquery-2.0.2.js"></script>
               <script src="http://code.jquery.com/jquery-2.0.2.min.js"></script>
               <script src="js/prijava.js"></script>
               <script src="js/provera.js"></script>
               <!--[if lt IE 9]>
               <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
               <![endif]-->
            </head>
            <body class="login-page">
                ${lGreska} ${lUspeh} ${rGreska} ${rUspeh} ${logGreska} ${pogLoz} ${Logout} ${bezPrava}
                <div id="sifra" class="infoPop">  123 </div>           
               <div class="container">
                  <div id="center">
                      <a href="index.jsp"> <img src="images/logo2.png" /></a>
                  </div>
                  <div id="center" class="login-menu">
                     <div class="six columns">
                        <div id="center">
                            <button id="prijava" class="active">Prijava</button>
                            <button id="registracija" class="">Registracija</button>
                            <button id="promena" class="">Promena lozinke</button>
                        </div>
                     </div>
                  </div>
                  <div id="center">
                     <div class="five columns login-box" id="prijavaDiv">
                        <div class="formContent">
                           <form name="logForma" action="Logovanje" class="myForm" method="post">
                              <p>Korisničko ime:</p>
                              <input type="text" name="korime" placeholder="Unesite korisnicko ime..." autofocus class="full-width"/>
                              <p>Lozinka:</p>
                              <input type="password" name="lozin" placeholder="Unesite lozinku..." class="full-width"/>
                              <button type="submit" class="full-width">Prijavi se!</button>
                           </form>
                        </div>
                     </div>
                  </div>
                  <div id="center">
                     <div class="five columns login-box" id="registracijaDiv">
                        <div class="formContent">
                           <form name="regForma" class="myForm" method="post" action="Registracija">
                              <p>Ime:</p>
                              <input type="text" name="ime" placeholder="Unesite ime..." class="full-width" />
                              <p>Prezime:</p>
                              <input type="text" name="prezime" placeholder="Unesite prezime..." class="full-width"/>
                              <p>Adresa:</p>
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
                              <small> * Sva polja su obavezna! </small>
                              <p><input type="checkbox" name="y">Prihvatam pravila i uslove korišćenja!</p>
                              <input type="button" class="full-width" value="Registruj se!" onClick="proveraRegistracije()  ">
                           </form>
                        </div>
                     </div>
                  </div>
                  <div id="center">
                     <div class="five columns login-box" id="promenaDiv">
                        <div class="formContent">
                           <form name="resForma" action="promenaLozinke" class="myForm" method="post">
                              <p>Korisničko ime:</p>
                              <input type="text" name="korime" placeholder="Unesite korisničko ime..." class="full-width" />
                              <p>Trenutna lozinka:</p>
                              <input type="password" name="lozin" placeholder="Unesite trenutnu lozinku..." class="full-width" />
                              <p>Nova lozinka:</p>
                              <input type="password" name="nlozin" placeholder="Unesite novu lozinku..." class="full-width" />
                              <p>Potvrdite novu lozinku:</p>
                              <input type="password" name="nlozinR" placeholder="Potvrdite novu lozinku..." class="full-width" />
                              <input type="button" class="full-width" value="Promeni lozinku!" onClick="proveraPromeneLozinke()  ">
                           </form>
                            
                        </div>
                     </div>
                  </div>
               </div>
               </div>
            </body>
         </html>
