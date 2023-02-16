<%@page import="com.mycompany.java_store.entities.Category"%>
<%@page import="com.mycompany.java_store.dao.CategoryDao"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.java_store.entities.Product"%>
<%@page import="com.mycompany.java_store.dao.ProductDao"%>
<%@page import="com.mycompany.java_store.helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Store - Main Page</title>
        
        <%@include file="components/bootstrap_css_js.jsp" %>
    
    </head>
    <body>
        
        <%@include file="components/navbar.jsp" %>
        <div class="container-fluid">
        <div class="row mt-3 mx-2">
            <% 
                String c = request.getParameter("category");
            
                ProductDao pd = new ProductDao(FactoryProvider.getFactory());
                List<Product> list = null;
                if(c == null || c.trim().equals("all")) {
                    list = pd.getAll();
                } else {
                    int catId = Integer.parseInt(c.trim());
                    list = pd.getProdByCat(catId);
                }
               
                CategoryDao cd = new CategoryDao(FactoryProvider.getFactory());
                List<Category> catList = cd.getCategories();

            %>
            
            <div class="col-md-2">
                
                <div class="list-group mt-4">
                    <a href="index.jsp?category=all" class="list-group-item list-group-item-action active">
                        Wszystkie produkty
                    </a>
                
                
                    <%
                        for (Category category:catList){
                    
                    %>
                        
                        <a href="index.jsp?category=<%= category.getCategoryId() %>" class="list-group-item list-group-item-action"><%= category.getCategoryName() %></a>
                        
                    <%        
                        }
                    %>
                </div>
            </div>
            <div class="col-md-8">
                <div class="row mt-4">
                    <div class="col-md-12">
                        <div class="card-columns">
                            <%
                                for (Product p:list) {
                            %>
                            
                            <div class="card">
                                <div class="container text-center">
                                    <img src="images/produkty/<%= p.getProdImage() %>" style="height:400px; width:95%;" class="card-img-top m-2" alt="...">
                                </div>
                                <div class="card-body">
                                    <h5 class="card-title"><%= p.getProdName() %></h5>
                                </div>
                                <div class="card-footer">
                                    <button class="btn custom_bg text-white" onclick="add_to_cart(<%= p.getProdId() %>, '<%= p.getProdName() %>', <%= p.getProdPrice() %>)">Dodaj do koszyka</button>
                                    <button class="btn btn-outline-primary"><%= p.getProdPrice() %> PLN</button>
                                </div>
                            </div>
                            
                            <% 
                                }

                                if (list.size() == 0){
                                    out.println("<h3>Brak produktów w tej kategorii</h3>");
                                }
                            %>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
                            <%@include file="components/modal.jsp" %>
                        
    </body>
</html>
