<%-- 
    Document   : signup
    Created on : 05/07/2023, 5:27:57 AM
    Author     : nhath
--%>

<%@page import="users.UserError"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Log In</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <style>

            body {background-color: rgba(11,19,32,1);}

            .login-form {
                width: 340px;
                margin: 50px auto;
                font-size: 15px;
            }
            .login-form form {
                margin-bottom: 15px;
                background: #f7f7f7;
                box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
                padding: 30px;
            }
            .login-form h2 {
                margin: 0 0 15px;
            }

            .form-group .btn{
                text-transform: uppercase;
            }

            .form-control, .btn {
                min-height: 38px;
                border-radius: 2px;
            }
            .btn {        
                font-size: 15px;
                font-weight: bold;
                outline: none;
                border: none;
            }

            .border {
                width: 100%;
                height: 2px;
                background-color: rgba(221, 221, 221, 0.6);
            }

            .form-group.google .btn{
                background-color: #ea4335;

            }

            .text-center .no-account{
                color: rgba(204, 204, 204, 0.8);
            }

            .error {
                text-align: center;
                color: red;
            }

            .wrap{
                display: flex;
                flex-direction: column;
                gap: 10px;
            }
            
            .form-group.google, .form-group.login {
                margin-bottom: 0;
            }
           

        </style>
    </head>
    <body>
        
        <%
            UserError userError = (UserError)request.getAttribute("USER_ERROR");
            if(userError == null){
                userError = new UserError();
            }
            String error = (String) request.getAttribute("ERROR");
            if(error == null){
                error = "";
            }
        %>
        
        <div class="login-form">
            <form action="MainController" method="post" id='form'>
                <h2 class="text-center">Sign Up</h2>       
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="Username" name="userID" required="required" autocomplete="off">
                    </br><%= userError.getUserIDError() %>
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="FullName" name="fullName" required="required" autocomplete="off">
                    </br><%= userError.getFullNameError() %>
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" value="US" name="roleID" readonly="readonly" autocomplete="off">
                </div>
                <div class="form-group">
                    <input type="password" class="form-control" placeholder="Password" name="password" required="required" autocomplete="off">
                </div>
                <div class="form-group">
                    <input type="password" class="form-control" placeholder="ConfirmPassword" name="confirm" required="required" autocomplete="off">
                    </br><%= userError.getConfirmError()%>
                </div>
                <div class="wrap" id="wrap">
                    <div class="form-group login">
                        <button type="submit" name="action" value="Create" class="btn btn-primary btn-block" id='btn-submit'>Sign Up</button>
                    </div>
                    <!--border-->
                    <div class="border">
                    </div>
                </div>
                <div class='form-group error'>
                        ${requestScope.ERROR}
                </div>
            </form>
            <p class="text-center">
                <span class='no-account'>Have account?</span>
                <a href="MainController?action=LoginPage">Login Account</a>
            </p>
        </div>
    </body>
</html>