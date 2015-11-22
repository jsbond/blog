<%@ taglib prefix='c' uri='http://java.sun.com/jstl/core_rt' %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <%@ page contentType="text/html; charset=UTF-8" %>
    <script type="text/javascript">
    function addPictures() {
        for (i=1; i<55; i++) {
            var text = '<a class="fancybox" rel="gallery2" href="/static/img/${category}/' + i + '.jpg" title="" ></a>';
            $('#pictures').append(text);
        }
    }
    </script>
</head>
<body>
<jsp:include page="layouts/head.jsp" />
<div class="all">
    <jsp:include page="layouts/header.jsp" />
    <!-- MAIN -->
    <div class="main">
        <div class="row">
            <div class="col-xs-12 col-md-12 big_img">
                <a class="fancybox" rel="gallery2" href="/static/img/wedding/0.jpg" title="">
                    <img class="thumbnail" rel="gallery2" width="860px" alt="" src="/static/img/wedding/0.jpg"/>
                </a>
            </div>
        </div>
        <div class="row" id="pictures">
        </div>

        <!-- SERIES -->
        <div class="row">
            <div class="col-md-12">
                <div class="col-xs-4 col-md-4">
                    <p class="pseries english">walnut_session</p>
                    <a class="pseries " href="wedding-1.html" title="">
                        <img class="thumbnail" width="280px" alt="" src="/static/img/wedding/series/1/0.jpg"/>
                    </a>
                </div>
                <div class="col-xs-4 col-md-4">
                    <p class="pseries rus ">Мария и Сергей</p>
                    <a class="pseries " href="wedding-2.html" title="">
                        <img class="thumbnail" width="280px" alt="" src="/static/img/wedding/series/2/0.jpg"/>
                    </a>
                </div>
                <div class="col-xs-4 col-md-4">
                    <p class="pseries rus">Анастасия и Роман</p>
                    <a class="pseries " href="wedding-3.html" title="">
                        <img class="thumbnail" width="280px" alt="" src="/static/img/wedding/series/3/0.jpg"/>
                    </a>
                </div>

            </div>
        </div>

        <div id="to_top"
             title="Вверх!">
            <span class="glyphicon glyphicon-arrow-up"></span>
        </div>
    </div>
    <jsp:include page="layouts/footer.jsp" />
</div>
</body>
</html>
