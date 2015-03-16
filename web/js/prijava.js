
                // Prijavna strana
                $(document).ready(function() {
                        $('button').click(function(){
                            $('button').removeClass("active");
                            $(this).addClass("active");
                        });
                });
                    
                   // * Prijava, Registracija, Promena 
                    
                $(document).ready(function() {
                  $('#prijava').click(function() {
                          $("#registracijaDiv").hide();
                          $("#promenaDiv").hide();
                          $('#prijavaDiv').slideDown("slow");
                  });
                  $('#registracija').click(function() {
                          $("#prijavaDiv").hide();
                          $("#promenaDiv").hide();
                          $('#registracijaDiv').slideDown("slow");
                  });
                  $('#promena').click(function() {
                          $("#prijavaDiv").hide();
                          $("#registracijaDiv").hide();
                          $('#promenaDiv').slideDown("slow");    
                  });
                  });
                  
                  // Obavestenja
                  
                 window.setInterval (function () {   
                          $('.infoPop').delay(3000).slideUp("slow");
                 }, 999);
                 
                 // Artikli
                  $(document).ready(function() {
                  $('#osnovna').click(function() {
                          $("#pomocnaDiv").hide();
                          $('#osnovnaDiv').slideDown("slow");
                  });
                  $('#pomocna').click(function() {
                          $("#osnovnaDiv").hide();
                          $('#pomocnaDiv').slideDown("slow");
                  });
                  });
