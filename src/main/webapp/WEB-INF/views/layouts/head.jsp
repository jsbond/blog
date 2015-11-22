<%@ taglib prefix='c' uri='http://java.sun.com/jstl/core_rt' %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="imagetoolbar" content="no"/>

    <!--<meta name="viewport" content="width=device-width, initial-scale=1">-->
    <title>EvaTigrova.com</title>

    <script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script type="text/javascript" src="/static/js/bootstrap.min.js"></script>

    <!-- add style -->
    <link rel="stylesheet" href="/static/style/bootstrap.min.css"/>
    <link rel="stylesheet" href="/static/style/main/main.css"/>

    <!-- Add mousewheel plugin (this is optional) -->
    <script type="text/javascript" src="/static/fancy/lib/jquery.mousewheel-3.0.6.pack.js"></script>

    <!-- Add fancyBox -->
    <link rel="stylesheet" href="/static/fancy/source/jquery.fancybox.css?v=2.1.5" type="text/css" media="screen"/>
    <%--<link href='http://fonts.googleapis.com/css?family=Cookie' rel='stylesheet' type='text/css'>--%>
    <script type="text/javascript" src="/static/fancy/source/jquery.fancybox.pack.js?v=2.1.5"></script>

    <c:set var="req" value="${pageContext.request}" />
    <c:set var="baseURL" value="${req.scheme}://${req.serverName}:${req.serverPort}${req.contextPath}" />

    <!-- arrow to top script -->
    <script type="text/javascript">
        $("#to_top").hide();
        $(function () {
            $(window).scroll(function () {
                if ($(this).scrollTop() > 300) {
                    $("#to_top").fadeIn();
                } else {
                    $("#to_top").fadeOut();
                }
            });
            $("#to_top").click(function () {
                $("body,html").animate({scrollTop: 0}, 800);
                return false;
            });
            $("#margin").click(function () {
                $("body,html").animate({scrollTop: 0}, 800);
                return false;
            });
        });
        function goto(href) {
            location.href = ${baseURL}/ + href;
        }
    </script>

    <!-- fancy box script -->
    <script type="text/javascript">
        $(document).ready(function () {
            $(".fancybox").fancybox({
                openEffect: 'none',
                closeEffect: 'none'
            });
        });
    </script>

</head>

<body>

</body>
</html>
