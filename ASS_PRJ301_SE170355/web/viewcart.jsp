<%-- 
    Document   : viewCart
    Created on : 15/06/2023, 4:22:53 PM
    Author     : nhath
--%>

<%@page import="Product.ProductDTO"%>
<%@page import="Cart.Cart"%>
<%--<%@page import="sample.shopping.Tea"%>
<%@page import="sample.shopping.Cart"%>--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Page</title>
        <link rel="stylesheet" href="./css/viewcart.css"/>
        <!-- Google font -->
        <link rel="preconnect" href="https://f...content-available-to-author-only...s.com" />
        <link rel="preconnect" href="https://f...content-available-to-author-only...c.com" crossorigin />
        <link
            href="https://f...content-available-to-author-only...s.com/css2?family=Poppins:wght@100;300;500&display=swap"
            rel="stylesheet"
            />
    </head>
    <body>
        <header>
            <h1>SHOPPING CART</h1>
        </header>
        <%
            Cart cart = (Cart) session.getAttribute("CART");
            if (cart != null) {
                if (cart.getCart().size() > 0) {
        %>
        <div class='body'>
            <table>
                <thead>
                    <tr>
                        <th class="number">#</th>
                        <th class="userID">ProductID</th>
                        <th class="fullname">Product Name</th>
                        <th class="password">Price</th>
                        <th class="password">Quantity</th>
                        <th class="delete">Delete</th>
                        <th class="update">Update</th>
                        <th class="SubTotal">SubTotal</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        int count = 1;
                        double total = 0;
                        for (ProductDTO tea : cart.getCart().values()) {
                            total += Double.parseDouble(tea.getPrice()) * tea.getQuantity();
                    %>
                <form action="MainController" method="POST">
                    <tr>
                        <td class="number"><%= count++%></td>
                        <td>
                            <input type="text" name="id" value="<%= tea.getProductID()%>" readonly=""/>
                        </td>
                        <td><%= tea.getProductName()%></td>
                        <td><%= tea.getPrice()%>$</td>
                        <td>
                            <input type="number" value="<%= tea.getQuantity()%>" min="1" name="quantity" required=""/>
                        </td>
                        <td>
                            <input type="submit" name="action" value="Remove"/>

                        </td>
                        <td>
                            <input type="submit" name="action" value="Edit"/>

                        </td>
                        <td><%= Double.parseDouble(tea.getPrice()) * tea.getQuantity()%>$</td>
                    </tr>
                </form>
                <%
                    }
                %>   
                </tbody>
            </table>
        </div>
        <div style="display:flex; align-items: center; justify-content: space-between">

            <div class='checkout'>
                <h2 style="margin-left:100px">Check Out</h2>
                <section class='Form'>
                    <form action="MainController" method="POST" id="formCheckOut">
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
                        <input type="submit" name="action" value="CheckOut" id="SubmitCheckOut">
                    </form>

                </section>



            </div>
            <h1>Total: <%= total%>$</h1>
            <a href="ListProductUser" style="margin-right: 50px">Continue Shopping</a>

            <%
                    }
                }
            %>
        </div>
        <script>
            document.querySelector("#formCheckOut").onsubmit = () => {
                alert("Your cart is packing and on the way to you !");
            }
        </script>
    </body>
</html>