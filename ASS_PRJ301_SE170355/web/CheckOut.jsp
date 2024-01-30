<%-- 
    Document   : CheckOut
    Created on : 08/07/2023, 3:05:13 PM
    Author     : nhath
--%>

<%@page import="Product.ProductDTO"%>
<%@page import="Cart.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Check Out</title>
        <!-- Google font -->
        <link rel="preconnect" href="https://f...content-available-to-author-only...s.com" />
        <link rel="preconnect" href="https://f...content-available-to-author-only...c.com" crossorigin />
        <link
            href="https://f...content-available-to-author-only...s.com/css2?family=Poppins:wght@100;300;500&display=swap"
            rel="stylesheet"
            />
    </head>
    <style>
        *{
            padding: 0;
            margin: 0;
        }   

        body {
            font-family: "Poppins", sans-serif;
        }

        header {
            padding: 15px 0;
            text-align: center;
            font-size: 1rem;
            font-weight: bold;
            border-bottom: 1px solid #000;
        }

        .check{
            width: 150px;
            height: 50px;
            line-height: 1.8;

        }

        .check input[type="text"] {
            outline: none;
            border: 1px solid #000;
            width: 300px;
            height: 50px;
            line-height: 1.8;
            font-size: 1.2rem;
        }

        form {
            display: flex;
            flex-direction: column;
            gap: 50px;
            margin-left: 100px;
        }

        .check input[type="submit"] {
            width: max-content;
            outline: none;
            padding: 10px;

        }

        .Form {
            display: flex;
            align-items: flex-start;
            gap: 300px;
        }
        .total {
            margin-top: 20px;
        }
    </style>
    <body>
        <header><h1>Check Out </h1></header>
        <section class='body'>
            <section class='Form'>
                <form action='#!'>
                    <div class="check">
                        <label> Enter FullName </label>
                        <input type="text" required="">
                    </div>
                    <div class="check">
                        <label> Enter PhoneNumber </label>
                        <input type="text" required="">
                    </div >
                    <div class="check">
                        <label> Enter Address </label>
                        <input type="text" required="">
                    </div>
                    <input type='submit' value='Submit'>
                </form>
                <%
                    Cart cart = (Cart) session.getAttribute("CART");
                    if (cart != null) {
                        if (cart.getCart().size() > 0) {
                %>
                <%
                    int count = 1;
                    double total = 0;
                    for (ProductDTO tea : cart.getCart().values()) {
                        total += Double.parseDouble(tea.getPrice()) * tea.getQuantity();
                    }
                %> 
                <span class="total">TotalProduct:  <%= total%>$</span>
            </section>
        </section>
    </body>
</html>
