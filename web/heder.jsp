<%@page import="java.sql.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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
        <title>IP &#8362; ISL </title>
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
    <body>
        <%
            HttpSession sesija = request.getSession(true);
            String korisnickoIme = (String) sesija.getAttribute("korime");
            if (korisnickoIme == null) {
                String bezPrava = "";
                bezPrava = "<div class=\"infoPop obavestenje\"><h5>Nemate prava pristupa. Molimo Vas da se ulogujete!</h5></div>";
                request.setAttribute("bezPrava", bezPrava);
                RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
                rd.forward(request, response);
            }
            

        %>
