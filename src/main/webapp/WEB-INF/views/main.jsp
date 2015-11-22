<%@ taglib prefix='c' uri='http://java.sun.com/jstl/core_rt' %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<c:set var="req" value="${pageContext.request}" />
<c:set var="baseURL" value="${req.scheme}://${req.serverName}:${req.serverPort}${req.contextPath}" />
<body>
<jsp:include page="layouts/head.jsp" />
<div class="all">
    <jsp:include page="layouts/header.jsp" />
    <!-- MAIN -->
    <div class="main">
        <div class="row">
            <div class="col-md-12 big_img">
                <img width="860px" alt="" src="/static/img/main/1p.jpg"/>
            </div>
        </div>
    </div>
    <%--<form action="${baseURL}/file" method="post" enctype="multipart/form-data">--%>
        <%--<input type="file" name="image" size="40">--%>
        <%--<input type="submit" value="Send">--%>
    <%--</form>--%>
    <jsp:include page="layouts/footer.jsp" />
</div>
</body>
</html>
