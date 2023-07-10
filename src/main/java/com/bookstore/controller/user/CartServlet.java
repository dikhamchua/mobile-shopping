/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.bookstore.controller.user;

import com.bookstore.dal.impl.AccountDAO;
import com.bookstore.dal.impl.BookDAO;
import com.bookstore.entity.Book;
import com.bookstore.entity.OrderDetails;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ADMIN
 */
public class CartServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("view/user/cart/cartDetails.jsp").forward(request, response);
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
        //GET ACtion
        String action = request.getParameter("action");
        if (action == null || action.isEmpty()) {
            response.sendRedirect("home");
        }

        switch (action) {
            case "add-product":
                addProduct(request, response);
                response.sendRedirect("cart");
                break;
            default:
                throw new AssertionError();
        }
    }

    private void addProduct(HttpServletRequest request, HttpServletResponse response) {
        BookDAO dao = new BookDAO();
        HttpSession session = request.getSession();
        //get quantity
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        //get id
        int id = Integer.parseInt(request.getParameter("id"));

        //find product by id
        Book book = dao.findOneById(id);

        //1 san pham o ben trong cart
        OrderDetails orderDetails = new OrderDetails(book, quantity);

        //get ra cart
        HashMap<Integer, OrderDetails> cart = (HashMap<Integer, OrderDetails>) session.getAttribute("cart");
        //kiem tra neu chua tung co cart
        if (cart == null) {
            cart = new HashMap<>();
        }
        //put orderdeatils vao ben trong cart
        addOrderDetails(orderDetails, cart, quantity);

        session.setAttribute("cart", cart);
        for (Map.Entry<Integer, OrderDetails> entry : cart.entrySet()) {
            Object key = entry.getKey();
            Object val = entry.getValue();
//            System.out.println(val);
//            System.out.println(cart.size());
        }
    }

    public void addOrderDetails(OrderDetails orderDetails, HashMap<Integer, OrderDetails> cart, int quantity) {
        int idProductInOrderDetails = orderDetails.getBook().getId();
        //kiem tra xem trong cart da tung co sn pham hay chua
        //neu da co san pham roi, thi + don` so luong
        if (cart.containsKey(idProductInOrderDetails)) {
            int oldQUantity = cart.get(idProductInOrderDetails).getQuantity();
            OrderDetails orderDetailsInCart = cart.get(idProductInOrderDetails);
            orderDetailsInCart.setQuantity(oldQUantity + quantity);
            //neu chua thi moi mang di put
        } else {
            cart.put(idProductInOrderDetails, orderDetails);
        }
    }

}
