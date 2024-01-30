<%-- 
    Document   : admin
    Created on : 01-06-2023, 13:59:23
    Author     : subih
--%>

<%@page import="Product.ProductDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="users.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ADMIN Page</title>

        <!-- Font size -->
        <link rel="preconnect" href="https://f...content-available-to-author-only...s.com" />
        <link rel="preconnect" href="https://f...content-available-to-author-only...c.com" crossorigin />
        <link
            href="https://f...content-available-to-author-only...s.com/css2?family=Poppins:ital,wght@0,200;0,600;0,700;1,100&display=swap"
            rel="stylesheet"
            />

        <!-- CSS -->
        <link rel="stylesheet" href="./css/admin.css" />
    </head>
    <style>
        a{
            text-decoration: none;
            color: #000;

        }
        .index {
            margin-top: 20px;
            display: flex;
            align-items: center;
            gap: 30px;
        }

        .index a {
            padding: 3px;
            background: #ccc;
        }

        .index a.active {
            background: #000;
            color: #fff;
        }

        .list-icon:hover svg{
            color: #fff;
        }
    </style>
    <body>

        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");

            if (loginUser == null || !"AD".equals(loginUser.getRoleID())) {
                response.sendRedirect("admin.jsp");
                return;
            }
            String search = request.getParameter("search");
            String SearchProduct = request.getParameter("SearchProduct");
            if (search == null) {
                search = "";
            }
        %>
        <main>
            <!-- Sidebar start -->
            <section class="sidebar">
                <span class="sidebar_name">Admin</span>

                <!-- List manage -->
                <ul class="list-manage">
                    <li class="manage-item" id="user">
                        <form action="MainController" class="list-icon" id="formUser">
                            <svg
                                class="icon-item icon-none"
                                xmlns="http://w...content-available-to-author-only...3.org/2000/svg"
                                width="16"
                                height="16"
                                fill="currentColor"
                                class="bi bi-person"
                                viewBox="0 0 16 16"
                                >
                            <path
                                d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6Zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0Zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4Zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10Z"
                                />
                            </svg>
                            <svg
                                class="icon-item icon-fill"
                                xmlns="http://w...content-available-to-author-only...3.org/2000/svg"
                                width="16"
                                height="16"
                                fill="currentColor"
                                class="bi bi-person-fill"
                                viewBox="0 0 16 16"
                                >
                            <path
                                d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3Zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6Z"
                                />
                            </svg>
                            <input
                                type="hidden"
                                name=""
                                id="search-value"
                                autocomplete="off"
                                placeholder="What do you want to search?"
                                value="<%=search%>"
                                />
                            <input type="hidden" name="action" value="User" class="submit-search"/>
                            <span class="name-item">User</span>
                        </form>


                    </li>
                    <li class="manage-item" id="product">
                        <form action="MainController" class="list-icon" id="formProduct">
                            <svg
                                class="icon-item icon-none"
                                xmlns="http://w...content-available-to-author-only...3.org/2000/svg"
                                width="16"
                                height="16"
                                fill="currentColor"
                                class="bi bi-cart"
                                viewBox="0 0 16 16"
                                >
                            <path
                                d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l1.313 7h8.17l1.313-7H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"
                                />
                            </svg>
                            <svg
                                class="icon-item icon-fill"
                                xmlns="http://w...content-available-to-author-only...3.org/2000/svg"
                                width="16"
                                height="16"
                                fill="currentColor"
                                class="bi bi-cart-fill"
                                viewBox="0 0 16 16"
                                >
                            <path
                                d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"
                                />
                            </svg>
                            <input
                                type="hidden"
                                name=""

                                id="search-value"
                                autocomplete="off"
                                placeholder="What do you want to search?"
                                value="<%=search%>"
                                />
                            <input type="hidden" name="action" value="Product" class="submit-search"/>
                            <span class="name-item">Product</span>
                        </form>
                    </li>
                </ul>
                <!--List end-->
                <div class="logout">
                    <span class="icon"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-power" viewBox="0 0 16 16">
                        <path d="M7.5 1v7h1V1h-1z"/>
                        <path d="M3 8.812a4.999 4.999 0 0 1 2.578-4.375l-.485-.874A6 6 0 1 0 11 3.616l-.501.865A5 5 0 1 1 3 8.812z"/>
                        </svg>
                    </span>

                    <form action="MainController" method="POST">
                        <input type="submit" name="action" value="Logout"/>
                    </form>
                </div>
            </section>
            <!-- Sidebar end -->

            <!-- Container start -->
            <section class="container">
                <header class="header">
                    <div class="search">
                        <span class="icon">
                            <svg
                                class="icon-search"
                                xmlns="http://w...content-available-to-author-only...3.org/2000/svg"
                                width="16"
                                height="16"
                                fill="currentColor"
                                class="bi bi-search"
                                viewBox="0 0 16 16"
                                >
                            <path
                                d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"
                                />
                            </svg>
                        </span>
                        <c:if test="${listAccount.size()>0}" >
                            <form action="MainController?action=User" class="form" method="POST">
                                <input
                                    type="text"
                                    name="search"
                                    id="search-value"
                                    autocomplete="off"
                                    placeholder="What do you want to search?"
                                    value="<%=search%>"
                                    />
                                <!--<input type="hidden" name="action" value="User" class="submit-search"/>-->
                                <input type="submit" name="action" value="Search" class="submit-search"/>
                            </form>
                        </c:if>
                        <c:if test="${listProduct.size()>0}" >
                            <form action="MainController?action=Product" class="form" method="POST">
                                <input
                                    type="text"
                                    name="search"
                                    id="search-value"
                                    autocomplete="off"
                                    placeholder="What do you want to search?"
                                    value="<%=search%>"
                                    />
                                <!--<input type="hidden" name="action" value="User" class="submit-search"/>-->
                                <input type="submit" name="action" value="Search" class="submit-search"/>
                            </form>
                        </c:if>
                    </div>
                    <div class="avatart"><%= loginUser.getFullName()%>   
                </header>
                <section class="table">
                    <c:if test = "${listAccount.size()>0}">
                        <table>
                            <thead>
                                <tr>
                                    <th class="number">#</th>
                                    <th class="userID">UserID</th>
                                    <th class="fullname">FullName</th>
                                    <th class="password">RoleID</th>
                                    <th class="roleID">Password</th>
                                    <th class="update">Update</th>
                                    <th class="delete">Delete</th>
                                </tr>
                            </thead>

                            <tbody>
                                <%
                                    int count = 1;
                                %>
                                <c:forEach items="${listAccount}" var="o">
                                <form action="MainController" method="POST">
                                    <tr>
                                        <td><%= count++%></td>
                                        <td>
                                            <input type="text" name="userID" value="${o.userID}" readonly=""/>
                                        </td>
                                        <td>
                                            <input type="text" name="fullName" value="${o.fullName}" required=""/>
                                        </td>
                                        <td>
                                            <input type="text" name="roleID" value="${o.roleID}" required=""/>
                                        </td>
                                        <td>
                                            ***
                                        </td>

                                        <!--update o day-->
                                        <td>
                                            <input type="submit" name="action" value="Update"/>
                                            <input type="hidden" name="search" value="${param.search}"/>
                                        </td>

                                        <!--day la delete-->
                                        <td>
                                            <a href="MainController?search=<%= search%>&action=Delete&userID=${o.userID}">Delete</a>
                                        </td>
                                    </tr>
                                </form>
                            </c:forEach>   
                            </tbody>
                        </table>
                        <div class="index">

                            <c:forEach begin ="1" end="${endP}" var="i">
                                <a href="ListAccount?index=${i}" class="${indexPage==i?"active":""}">${i}</a>
                            </c:forEach>
                        </div>
                    </c:if>


                    <c:if test = "${listProduct.size()>0}">
                        <%
                            int count1 = 1;
                        %>
                        <table>
                            <thead>
                                <tr>
                                    <th class="number">#</th>
                                    <th class="userID">ProductID</th>
                                    <th class="fullname">Product Name</th>
                                    <th class="password">Price</th>
                                    <th class="delete">Delete</th>
                                    <th class="update">Update</th>
                                </tr>
                            </thead>

                            <tbody>
                                <c:forEach items="${listProduct}" var="o">
                                <form action="MainController" method="POST">
                                    <tr>
                                        <td class="number"><%=count1++%></td>
                                        <td>
                                            <input type="text" name="productID" value="${o.productID}" readonly=""/>
                                        </td>
                                        <td>
                                            <input type="text" name="productName" value="${o.productName}" required=""/>
                                        </td>
                                        <td>
                                            <input type="text" name="price" value="${o.price}" required=""/>
                                        </td>
                                        <!--day la delete-->
                                        <td>
                                            <a href="MainController?SearchProduct&action=DeleteProduct&productID=${o.productID}">Delete</a>
                                        </td>
                                        <td>
                                            <input type="submit" name="action" value="UpdateProduct"/>
                                           <!--<input type="hidden" name="search" value="${param.search}"/>-->
                                           <!--<button href="MainController?SearchProduct&action=UpdateProduct&productID=${o.productID}&productName=${o.productName}&price=${o.price}">Update</a>-->
                                        </td>
                                    </tr>
                                </form>
                            </c:forEach>   
                            </tbody>
                        </table>
                        <div class="index">

                            <c:forEach begin ="1" end="${endP}" var="i">
                                <a href="ListProduct?index=${i}" class="${indexPage==i?"active":""}">${i}</a>
                            </c:forEach>
                        </div>

                        <div class="addProduct">
                            <form action="MainController" class="add-product" method="POST" >
                                <div>
                                    <label for="product-id">Product ID</label>
                                    <input type="text" name="productID" id="product-id" placeholder="Enter PRODUCT ID" autocomplete="off"/>
                                </div>
                                <div>
                                    <label for="name-product">Name product</label>
                                    <input type="text" name="productName" id="name-product" placeholder="Enter PRODUCT NAME" autocomplete="off"/>
                                </div>
                                <div>
                                    <label for="price-product">Price product</label>
                                    <input type="text" name="productPrice" id="price-product" placeholder="Enter PRODUCT PRICE" autocomplete="off"/>
                                </div>
                                <div>
                                    <label for="image-product">Image product</label>
                                    <input type="text" name="productImage" id="img-product" placeholder="Enter PRODUCT IMAGE" autocomplete="off"/>
                                </div>

                                <button type="submit" name="action" value="CreateProduct" >Add Product</button>
                            </form>
                        </div>
                    </c:if>
                </section>
            </section>
            <!-- Container end -->
        </main>
        <script>
            let formUser = document.querySelector("#formUser");
            let user = document.getElementById("formUser");
            document.getElementById("user").onclick = () => {
                formUser.submit();
            };

            let formProduct = document.querySelector("#formProduct");
            document.getElementById("product").onclick = () => {
                formProduct.submit();
            };

            //            let formSubmit =  document.querySelectorAll(".manage-item");
            //            for(let index in formSubmit) {
            //               formSubmit[index].onclick = () => {
            //                   let form = formSubmit[index].querySelector("form");
            //                   form.submit();
            //               }
            //            }
        </script>
    </body>
</html>
