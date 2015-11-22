<%@ taglib prefix='c' uri='http://java.sun.com/jstl/core_rt' %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <c:set var="req" value="${pageContext.request}"/>
    <c:set var="baseURL" value="${req.scheme}://${req.serverName}:${req.serverPort}${req.contextPath}"/>
    <!-- add style -->
    <link rel="stylesheet" href="/static/style/bootstrap.min.css"/>
    <link rel="stylesheet" href="/static/style/admin/admin.css"/>

    <script type="text/javascript">
        function loadData() {
            var isEdit = ${requestScope.isEdit};
            if (isEdit == true) {
                document.getElementById("id").value = '${requestScope.page.id}';
                document.getElementById("name").value = '${requestScope.page.name}';
                document.getElementById("titul").src = "/static/img/base/" + '${requestScope.page.titul.url}';
                document.getElementById("titul_input").value = '${requestScope.page.titul.url}';
            }
        }
        function chooseTitul(id) {
            document.getElementById("titul").src = "/static/img/base/" + id;
            document.getElementById("titul_input").value = id;
        }
    </script>
</head>
<body onload="loadData();">
<div class="all">
    <!-- MAIN -->
    <div class="left col-xs-2">
        <a href="${baseURL}/admin">Главная</a> <br/>

        <br/>
        <a href="${baseURL}/admin/pages">Страницы</a> <br/>
    </div>
    <div class="right col-xs-10">
        <h2>Страница</h2>

        <div class="col-xs-10 photos_image">
            <form id="form" action="${baseURL}/admin/pages/save" method="post">
                <input id="id" name="id" type="hidden"/>
                <input id="titul_input" name="photo_id" type="hidden" value="0"/>

                <div class="row pages_form">
                    <div class="col-xs-4">
                        <p>Название</p>
                    </div>
                    <div class="col-xs-8 ">
                        <input style="width:90%;" class="input-lg input-group" id="name" name="name"/>
                    </div>
                </div>
                <div class="row pages_form">
                    <div class="col-xs-4 ">
                        <p>Титульное фото</p>
                    </div>
                    <div class="col-xs-8">
                        <img id="titul" width="150px" alt="" src=""/>
                    </div>
                </div>
                <div class="row pages_form">
                    <div class="col-xs-9">
                        Категория?
                        <input type="checkbox" name="category"/>
                    </div>
                    <div class="col-xs-3">
                        <input class="btn btn-success" id="submit" type="submit" value="сохранить"/>
                    </div>
                </div>
                <br/>
            </form>
            <h3>Страницы, которые можно добавить:</h3>

            <div id="pages_children">
                <c:forEach var="child" items="${requestScope.children}">
                    <div class="col-xs-4 bordered">
                        <div class="col-xs-6">
                            <input type="checkbox" id="child_${child.id}"/>
                        </div>
                        <div class="col-xs-6">
                                ${child.name}
                        </div>
                    </div>
                </c:forEach>
            </div>
            <br/>
            <br/>

            <c:if test="${requestScope.page.photos != null}">
                <div class="row col-xs-12">
                    <h3>Добавленные фотографии:</h3>

                    <c:forEach var="photo" items="${requestScope.page.photos}">
                        <div class="row photos_photo" id="photo_${photo.id}">
                            <div class="col-xs-4 photos_image">
                                <div class="escape">
                                    <input type="button" class="btn btn-xs btn-danger escape" value="->"/>
                                </div>
                                <div>
                                    <p class="photos_p_center"><img width="180px" src="/static/img/base/${photo.url}"
                                                                    alt=""/></p>
                                </div>
                            </div>
                            <div class="col-xs-8 photos_desc">
                                <input name="tags" value="Описание"/>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </c:if>
        </div>
        <div class="col-xs-2">
            <c:forEach var="photo" items="${requestScope.tituls}">
                <div id="${photo.url}" onclick="chooseTitul(this.id)">
                    <p class="photos_p_center"><img width="150px" alt="" src="/static/img/base/${photo.url}"/></p>
                </div>
            </c:forEach>
        </div>
    </div>

</div>
</body>
</html>
