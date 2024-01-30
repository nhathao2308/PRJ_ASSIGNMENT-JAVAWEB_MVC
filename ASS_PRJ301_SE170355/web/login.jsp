<%-- 
    Document   : Login
    Created on : 04/07/2023, 10:04:32 PM
    Author     : nhath
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
        <div class="login-form">
            <form action="MainController" method="post" id='form'>
                <h2 class="text-center">Log in</h2>       
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="Username" name="userID" required="required" autocomplete="off">
                </div>
                <div class="form-group">
                    <input type="password" class="form-control" placeholder="Password" name="password" required="required" autocomplete="off">
                </div>

                <!--re-capcha-->
                <div class='form-group recaptcha'>
                    <div class="g-recaptcha" data-sitekey="6Lejs_UmAAAAAKwIrcVMn2PozjgaMPBV9yiVYVpN"></div>
                    <span class='error' style='text-align: center'></span>
                </div>

                <div class="wrap" id="wrap">
                    <div class="form-group login">
                        <button type="submit" name="action" value="Login" class="btn btn-primary btn-block" id='btn-submit'>Log in</button>
                    </div>
                    <!--border-->
                    <div class="border">
                    </div>
                    <div class="form-group google">
                        <button type='submit' name="action" value="login" class="btn btn-primary btn-block">Login with GOOGLE</button>
                    </div>
                </div>
                
                <div class='form-group error'>
                        ${requestScope.ERROR}
                </div>
            </form>
            <p class="text-center">
                <span class='no-account'>Don't have account?</span>
                <a href="MainController?action=SignUp" class="nav-item nav-link">Sign Up</a>
            </p>

        </div>
        <script src="https://www.google.com/recaptcha/api.js" async defer></script>
        <script>
            const $ = document.querySelector.bind(document);
            const form = $("#form");
            form.addEventListener("submit", (event) => {
                const res = grecaptcha.getResponse();
                if(res) {
                   window.open(MainController);
                }
                else {
                   event.preventDefault();
                }
            })
        </script>
    </body>
</html>
