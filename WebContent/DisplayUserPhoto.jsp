<%@ page import="com.avas.DbConnection" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.OutputStream" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Display Image</title>
</head>
<body>


<%
    String U_id = request.getParameter("U_id");
	System.out.println(U_id);
    Blob image = null;

    Connection con = null;

    byte[] imgData = null;

    Statement stmt = null;

    ResultSet rs = null;

    try {
        con = DbConnection.connect();
        stmt = con.createStatement();
        rs = stmt.executeQuery("SELECT * FROM userphoto_tbl WHERE U_id =" + U_id);

        if (rs.next()) {
            image = rs.getBlob(4);
            imgData = image.getBytes(1, (int) image.length());

            // Set the content type to image/gif
            response.setContentType("application/pdf");

            

            // Get the output stream to write image data to the response
            OutputStream o = response.getOutputStream();

            // Write the image data to the response
            o.write(imgData);
            o.flush();
            o.close();
        } else {
            out.println("Image not found for the given ID: " + U_id);
        }
    } catch (Exception e) {
        out.println("Unable To Display image: " + e.getMessage());
    } finally {
        try {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (con != null) con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>

</body>
</html>