package com.mycompany.java_store.servlets;

import com.mycompany.java_store.dao.CategoryDao;
import com.mycompany.java_store.dao.ProductDao;
import com.mycompany.java_store.entities.Category;
import com.mycompany.java_store.entities.Product;
import com.mycompany.java_store.helper.FactoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import java.io.File;
import java.io.InputStream;
import java.io.FileOutputStream;

@MultipartConfig
public class ProductOperationServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
       
            String operation = request.getParameter("operation");
            if (operation.trim().equals("addcategory")) {
                
                String name = request.getParameter("categoryName");  
                Category category = new Category();
                category.setCategoryName(name);
                
                CategoryDao categoryDao = new CategoryDao(FactoryProvider.getFactory());
                int catId = categoryDao.saveCat(category);
                //out.println("Kategoria utworzona.");
                HttpSession session = request.getSession();
                session.setAttribute("message", "Kategoria utworzona pomyślnie.");
                response.sendRedirect("admin.jsp");
                return;
                
            } else if (operation.trim().equals("addproduct")) {
                String prodName = request.getParameter("prodName");
                String prodDesc = request.getParameter("prodDesc");
                int prodPrice = Integer.parseInt(request.getParameter("prodPrice"));
                int prodQty = Integer.parseInt(request.getParameter("prodQty"));
                int catId = Integer.parseInt(request.getParameter("catId"));
                Part part = request.getPart("prodImage");
                
                Product p = new Product();
                p.setProdName(prodName);
                p.setProdDesc(prodDesc);
                p.setProdPrice(prodPrice);
                p.setProdQuantity(prodQty);
                p.setProdImage(part.getSubmittedFileName());
                
                CategoryDao cd = new CategoryDao(FactoryProvider.getFactory());
                Category category = cd.getCategory(catId);
                
                p.setCategory(category);
                
                ProductDao pd = new ProductDao(FactoryProvider.getFactory());
                pd.saveProduct(p);
                
                String path = request.getRealPath("images") + File.separator + "produkty" + File.separator + part.getSubmittedFileName();
                System.out.println(path);
                
                try{
                    
                    FileOutputStream fout = new FileOutputStream(path);
                    InputStream in = part.getInputStream();
                
                    byte[] data = new byte[in.available()];
                    in.read(data);
                
                    fout.write(data);
                    fout.close();
                    
                } catch (Exception e){
                    e.printStackTrace();
                }
                
                HttpSession http = request.getSession();
                http.setAttribute("message", "Produkt dodany pomyślnie.");
                response.sendRedirect("admin.jsp");
            }
            
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
