 function proveraRegistracije(){
                var t = true;
                var nkIme = regForma.ime.value;
                var nkPrezime = regForma.prezime.value;
                var nkAdresa = regForma.adresa.value;
                var nkTelefon = regForma.adresa.value;
                var nkKorisnickoIme = regForma.korime.value;
                var nkLozinka = regForma.lozin.value;
                var nkLozinkaR = regForma.lozinR.value;
                var nkMejl = regForma.mejl.value;

                if (nkIme=="" || nkPrezime=="" || nkAdresa=="" || nkTelefon=="" || nkKorisnickoIme=="" || nkLozinka=="" || nkMejl=="") { 
                    document.getElementById("sifra").style.display = "block";
                    document.getElementById("sifra").innerHTML = "<h5>Niste uneli Vaše podatke!</h5>";
                    t=false; 
                }
                else if (nkLozinka != nkLozinkaR) { 
                    document.getElementById("sifra").style.display = "block";
                    document.getElementById("sifra").innerHTML = "<h5>Lozinke se ne poklapaju!</h5>"; 
                    t=false;
                }
                
                if (t) document.regForma.submit();
                
                }
                function proveraPromeneLozinke(){
                var t = true;
                var plKorisnickoIme = resForma.korime.value;
                var plLozinka = resForma.lozin.value;
                var plNovaLozinka = resForma.nlozin.value;
                var plNovaLozinkaR = resForma.nlozinR.value; 
                
                if (plKorisnickoIme=="" || plLozinka=="" || plNovaLozinka=="" || plNovaLozinkaR=="" ){
                    document.getElementById("sifra").style.display = "block";
                    document.getElementById("sifra").innerHTML = "<h5>Niste uneli Vaše podatke!</h5>";
                    t=false;
                }
                else if (plNovaLozinka != plNovaLozinkaR){
                    document.getElementById("sifra").style.display = "block";
                    document.getElementById("sifra").innerHTML = "<h5>Lozinke se ne poklapaju!</h5>"; 
                    t=false;
                }
               
                if (t) document.resForma.submit();
                 
                }
            function proveraRegistracijeAdmin(){
                var t = true;
                var nkIme = regFormaAdmin.ime.value;
                var nkPrezime = regFormaAdmin.prezime.value;
                var nkAdresa = regFormaAdmin.adresa.value;
                var nkTelefon = regFormaAdmin.adresa.value;
                var nkKorisnickoIme = regFormaAdmin.korime.value;
                var nkLozinka = regFormaAdmin.lozin.value;
                var nkLozinkaR = regFormaAdmin.lozinR.value;
                var nkMejl = regFormaAdmin.mejl.value;

                if (nkIme=="" || nkPrezime=="" || nkAdresa=="" || nkTelefon=="" || nkKorisnickoIme=="" || nkLozinka=="" || nkMejl=="") { 
                    document.getElementById("sifra").style.display = "block";
                    document.getElementById("sifra").innerHTML = "<h5>Niste uneli Vaše podatke!</h5>";
                    t=false; 
                }
                else if (nkLozinka != nkLozinkaR) { 
                    document.getElementById("sifra").style.display = "block";
                    document.getElementById("sifra").innerHTML = "<h5>Lozinke se ne poklapaju!</h5>"; 
                    t=false;
                }
                
                if (t) document.regFormaAdmin.submit();
                
                }
