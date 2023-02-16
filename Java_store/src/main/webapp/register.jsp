<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Rejestracja</title>
        
        <%@include file="components/bootstrap_css_js.jsp" %>
        
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-4 offset-md-4">
                    <div class="card mt-3">
                        
                        <div class="card-header custom_bg text-white text-center">
                            <h3>Rejestracja</h3>
                        </div>
                        
                        <%@include file="components/message.jsp" %>
                        
                        <div class="card-body">
                            <form action="RegisterServlet" method="post">
                                <div class="form-group">
                                    <label for="name">Nazwa użytkownika</label>
                                    <input name="user_name" type="text" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Podaj nazwę użytkownika">
                                </div>
                                <div class="form-group">
                                    <label for="email">Email</label>
                                    <input name="user_email" type="email" class="form-control" id="email" aria-describedby="emailHelp" placeholder="Podaj email">
                                </div>
                                <div class="form-group">
                                    <label for="password">Hasło</label>
                                    <input name="user_password" type="password" class="form-control" id="password" aria-describedby="emailHelp" placeholder="Podaj hasło">
                                </div>
                                <div class="container text-center">
                                    <button class="btn btn-primary custom_bg">Zarejestruj</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
    </body>
</html>
