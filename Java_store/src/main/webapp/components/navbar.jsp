<%@page import="com.mycompany.java_store.entities.User"%>
<% 
    User user1 = (User) session.getAttribute("current-user");
    
%>

<nav class="navbar navbar-expand-lg navbar-dark custom_bg">
  <a class="navbar-brand" href="#">Sneakers Store</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
      </li>
    </ul>
      <ul class="navbar-nav ml-auto">
          
          <%
              if (user1 == null){
              %>
              
                <li class="nav-item active">
                    <a class="nav-link" href="login.jsp">Logowanie</a>
                </li>
          
                <li class="nav-item active">
                    <a class="nav-link" href="register.jsp">Rejestracja</a>
                </li>
              <% 
              } else {
              %>
              
                <li class="nav-item active">
                    <a class="nav-link" href="#!" data-toggle="modal" data-target="#cart">
                        <img src="images/cart.png" class="icon">
                    </a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="<%= user1.getUserType().equals("admin") ? "admin.jsp" : "index.jsp" %>"><%= user1.getUserName() %></a>
                </li>
          
                <li class="nav-item active">
                    <a class="nav-link" href="LogoutServlet">Wyloguj</a>
                </li>
              
             <% }
          %>
      </ul>
  </div>
</nav>