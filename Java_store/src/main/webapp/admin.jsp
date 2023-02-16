<%@page import="java.util.Map"%>
<%@page import="com.mycompany.java_store.helper.Nums"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.java_store.entities.Category"%>
<%@page import="com.mycompany.java_store.dao.CategoryDao"%>
<%@page import="com.mycompany.java_store.helper.FactoryProvider"%>
<%@page import="com.mycompany.java_store.entities.User"%>
<% 
    User user = (User) session.getAttribute("current-user");
    if (user==null){
        session.setAttribute("message", "Nie jesteś zalogowany!");
        response.sendRedirect("login.jsp");
        return;
    } else {
        if (user.getUserType().equals("normal")){
            session.setAttribute("message", "Zaloguj się jako administrator aby otrzymać dostęp.");
            response.sendRedirect("login.jsp");
            return;
        }
    }
%>

 <% 
    CategoryDao cd = new CategoryDao(FactoryProvider.getFactory());
    List<Category> list = cd.getCategories();
    Map<String, Long> map = Nums.nums(FactoryProvider.getFactory());
 %>
    
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin</title>
        <%@include file="components/bootstrap_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        
        <div class="container admin">
            <div class="container-fluid mt-3">
                <%@include file="components/message.jsp" %>
            </div>
            <div class="row mt-3">
                
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width:110px;" class="img-fluid" src="images/people.png" alt="user_icon"/>
                            </div>
                            <h1><%= map.get("userNum") %></h1>
                            <h1 class="text-uppercase">Użytkownicy</h1>
                        </div>
                    </div>
                </div>
                
                <div class="col-md-4">
                    <div class="card text-center">
                        <div class="card-body">
                            <div class="container">
                                <img style="max-width:110px" class="img-fluid" src="images/categories.png" alt="category_icon"/>
                            </div>
                            <h1><%= list.size() %></h1>
                            <h1 class="text-uppercase">Kategorie</h1>
                        </div>
                    </div>
                </div>
                
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width:110px;" class="img-fluid" src="images/box.png" alt="product_icon"/>
                            </div>
                            <h1><%= map.get("prodNum") %></h1>
                            <h1 class="text-uppercase">Produkty</h1>
                        </div>
                    </div>
                </div>
                
            </div>
            
            <div class="row mt-3">
                <div class="col-md-6">
                    <div class="card" data-toggle="modal" data-target="#add-product-modal">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width:110px;" class="img-fluid" src="images/add-product.png" alt="add_product_icon"/>
                            </div>
                            <h1 class="text-uppercase">Dodaj produkt</h1>
                        </div>
                    </div>
                </div>
                
                <div class="col-md-6">
                    <div class="card" data-toggle="modal" data-target="#add-category-modal">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width:110px;" class="img-fluid" src="images/add-category.png" alt="add_category_icon"/>
                            </div>
                            <h1 class="text-uppercase">Dodaj kategorię</h1>
                        </div>
                    </div>
                </div>
            </div>
            
        </div>

        <!-- Kategorie Modal -->
        <div class="modal fade" id="add-category-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header custom_bg text-white">
                        <h5 class="modal-title" id="exampleModalLabel">Dodaj nową kategorię</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                <div class="modal-body">
                    
                    <form action="ProductOperationServlet" method="post">
                        
                        <input type="hidden" name="operation" value="addcategory">
                        
                        <div class="form-group">
                            <input type="text" class="form-control" name="categoryName" placeholder="Nazwa kategorii" required />   
                        </div>
                        
                        <div class="container text-center">
                            <button class="btn btn-primary custom_bg">Dodaj kategorię</button>
                        </div>
                    </form>
                    
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Anuluj</button>
                </div>
                </div>
            </div>
        </div>

        <!-- Produkty Modal -->
        <div class="modal fade" id="add-product-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header custom_bg text-white">
                        <h5 class="modal-title" id="exampleModalLabel">Dodaj produkt</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="ProductOperationServlet" method="post" enctype="multipart/form-data">
                            <input type="hidden" name="operation" value="addproduct">
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="Nazwa produktu" name="prodName" required/>
                            </div>
                            <div class="form-group">
                                <textarea class="form-control" placeholder="Opis produktu" name="prodDesc"></textarea>
                            </div>
                            <div class="form-group">
                                <input type="number" class="form-control" placeholder="Cena produktu" name="prodPrice" required/>
                            </div>
                            <div class="form-group">
                                <input type="number" class="form-control" placeholder="Ilość" name="prodQty" required/>
                            </div>
                            
                           
                            
                            <div class="form-group">
                                <select name="catId" class="form-control" id="">
                                    <%
                                        for (Category c:list){
                                    %>  
                                    
                                    <option value="<%= c.getCategoryId() %>"><%= c.getCategoryName() %></option>
                                    
                                    <%
                                        }
                                    %>
                                </select>
                            </div>
                            <div class="form-group">
                                <input type="file" id="prodImage" name="prodImage" required/>
                            </div>
                            <div class="container text-center">
                                <button class="btn btn-primary custom_bg">Dodaj produkt</button>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Anuluj</button>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="components/modal.jsp" %>
    </body>
</html>
