<%@ taglib prefix='c' uri='http://java.sun.com/jstl/core_rt' %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <c:set var="req" value="${pageContext.request}" />
    <c:set var="baseURL" value="${req.scheme}://${req.serverName}:${req.serverPort}${req.contextPath}" />
    <!-- add style -->
    <link rel="stylesheet" href="/static/style/bootstrap.min.css"/>
    <link rel="stylesheet" href="/static/style/admin/admin.css"/>
</head>
<body>
<div class="all">
    <!-- MAIN -->
    <div class="left col-md-2">
        <a href="${baseURL}/admin/photos">Фотографии</a> <br />
        <a href="${baseURL}/admin/pages">Страницы</a> <br />

    </div>
    <div class="right col-md-10">
        <form action="${baseURL}/admin/message" method="post">
            <input type="submit"/>
        </form>
    </div>

</div>
</body>
</html>
