<%
    User user = (User) session.getAttribute("current-user");
    if (user == null){
        session.setAttribute("message", "Zaloguj się aby kontynuować");
        response.sendRedirect("login.jsp");
        return;
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Finalizacja</title>
        <%@include file="components/bootstrap_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>

        <div class="container">
            <div class="row mt-5">
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-body">
                            <h3 class="text-center mb-5">Twoje produkty</h3>
                            <div class="cart-body"></div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                   <div class="card">
                        <div class="card-body">
                            <h3 class="text-center mb-5">Dane do zamówienia</h3>
                            <form action="#!">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email</label> 
                                    <input value="<%= user.getUserEmail() %>" type="email" class="form-control" id="email" aria-describedby="emailHelp" placeholder="Twój email">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Imie</label>
                                    <input value = "<%= user.getUserName() %>" type="text" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Twoje imie">
                                </div>
                                <div class="form-group">
                                    <label for="exampleFormControlTextarea1">Dane do wysyłki</label>
                                    <textarea class="form-control" id="exampleFormControlTextarea1" placeholder="Dane do wysyłki" rows="3"></textarea>
                                </div>
                                <div class="container text-center">
                                    <button class="btn btn-success">Zamów</button>
                                    <button class="btn btn-primary">Kontynuuj zakupy</button>
                                </div>
                            </form>
                        </div>
                    </div> 
                </div>
            </div>
        </div>
        
        <%@include file="components/modal.jsp" %>
    </body>
</html>
