<%@page import="com.mycompany.java_store.entities.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.java_store.dao.ProductDao"%>
<%@page import="com.mycompany.java_store.helper.FactoryProvider"%>
<% 
    ProductDao pd = new ProductDao(FactoryProvider.getFactory());
    List<Product> list3 = pd.getAll();
%>


<!-- Modal -->
<div class="modal fade" id="delete" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header custom_bg text-white">
        <h5 class="modal-title" id="exampleModalLabel">Zarzadzaj produktami</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <table class="table">
              <table class="table">
                <thead class="thread-light">
                    <tr>
                        <th>Nazwa produktu</th>
                        <th>Cena</th>
                        <th>Ilosc</th>
                        <th>Opcje</th>
                    </tr>
                </thead>
                <% 
                    for (Product p:list3){
                %>
                    <tr>
                        <td><%=p.getProdName()%></td>
                        <td><%=p.getProdPrice()%></td>
                        <td><%=p.getProdQuantity()%></td>
                        <td><button class="btn btn-warning btn-sm">Usun</td>
                    </tr>
                <% 
                    }
                %>
          </table>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Zamknij</button>
        <button type="button" class="btn btn-primary checkout-btn" onclick="Checkout()">Kup</button>
      </div>
    </div>
  </div>
</div>