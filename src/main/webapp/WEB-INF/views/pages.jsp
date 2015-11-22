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
        <a href="${baseURL}/admin">Главная</a> <br />

    </div>
    <div class="right col-md-10">
        <h2>Страницы</h2>
        <table class="table">
            <th>Иконка</th>
            <th>Название</th>
            <th>Категория</th>
            <th>Кол-во фотографий</th>
            <th>Статус</th>

            <c:forEach var="page" items="${requestScope.pages}">
                <tr>
                    <td>Иконка</td>
                    <td><a href="${baseURL}/admin/pages/edit?id=${page.id}">${page.name}</a></td>
                    <td>
                    </td>
                    <td>
                        <c:choose>
                            <c:when test="${page.photos != null}">
                                ${page.photos.size()}
                            </c:when>
                            <c:otherwise>
                                0
                            </c:otherwise>
                        </c:choose>
                    </td>
                </tr>
            </c:forEach>
        </table>

        <br />
        <a href="${baseURL}/admin/pages/edit">Добавить</a>
    </div>

</div>
</body>
</html>
