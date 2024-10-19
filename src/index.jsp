<%@ page import="java.util.Calendar" %>
<%
    int hour = Calendar.getInstance().get(Calendar.HOUR_OF_DAY);
    String greeting;

    if (hour < 12) {
        greeting = "Good morning, Rayyan Mohsin, Welcome to COMP367";
    } else {
        greeting = "Good afternoon, Rayyan Mohsin, Welcome to COMP367";
    }
%>
<h1><%= greeting %></h1>
