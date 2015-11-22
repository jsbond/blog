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

    <!-- Add mousewheel plugin (this is optional) -->
    <script type="text/javascript" src="/static/fancy/lib/jquery.mousewheel-3.0.6.pack.js"></script>

    <script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script type="text/javascript" src="/static/js/bootstrap.min.js"></script>

    <script type="text/javascript">
        var titul = "";
        var photoString = "";
        var page = "";
        var url = '<c:out value="${baseURL}"/>' + "/admin/photos/status/title";
        function loadData() {
            if (${requestScope.isTitle == true}) {
                document.getElementById("change_status_btn").value = "Сделать выбранное обычными фото";
                document.getElementById("add_to_page_btn").value = "Прикрепить фото к странице";
                document.getElementById("a_photos").innerHTML = "Свободные фотографии";
                document.getElementById("h2").innerHTML = "Титульные фотографии";
                document.getElementById("a_photos").href = "${baseURL}/admin/photos";


                url = '<c:out value="${baseURL}"/>' + "/admin/photos/status/free";
            }
        }

        function choose(element) {
            var photo;
            var id = element.id;
            if (element.value == "Выбрать") {
                element.className = element.className.replace("btn-success", "btn-danger");
                element.value = "Отменить";
                photo = id.substring(11, id.length);
                photo = "photo_" + photo;
                document.getElementById(photo).style.backgroundColor = "#f3f3f3";
            }else {
                element.className = element.className.replace("btn-danger", "btn-success");
                element.value = "Выбрать";
                photo = id.substring(11, id.length);
                photo = "photo_" + photo;
                document.getElementById(photo).style.backgroundColor = "white";
            }
        }

        function setTitul() {
            titul = "";
            var buttons = document.getElementsByClassName("btn btn-danger photos_desc_btn_choose");

            for (i = 0; i < buttons.length; i++) {
                titul = titul + (buttons[i].id).substring(11, buttons[i].id.length) + ",";
            }
            titul = titul.substring(0, titul.length - 1);
        }

        function changeStatus() {
            setTitul();
            $.ajax({
                type: 'POST',
                url: url,
                data : {"title" : titul},
                dataType: "json",
                success: function(data) {
                    var buttons = document.getElementsByClassName("btn btn-danger photos_desc_btn_choose");

                    for (i = 0; i < buttons.length; i++) {
                        var button = buttons[i];
                        $($($(button).parent()).parent()).remove();
                    }
                }
            });
        }

        function setPhotos() {
            photoString = "";
            var photos = document.getElementsByClassName("btn btn-danger photos_desc_btn_choose");

            for (i = 0; i < photos.length; i++) {
                photoString = photoString + (photos[i].id).substring(11, photos[i].id.length) + ",";
            }
            photoString = photoString.substring(0, photoString.length - 1);
        }

        function setPage() {
            page = "";
            var pages = document.getElementsByClassName("btn btn-danger photos_desc_btn_choose");

        }

        function getPage() {
            var group = document.getElementsByName("page_button");

            for (x=0; x<group.length; x++) {
                if (group[x].checked) {
                    return (group[x].value.substring(5, group[x].value.length));
                }
            }
            return (false);
        }

        function sendPhotoData() {
            setPhotos();
            var page = getPage();
            $.ajax({
                type: 'POST',
                url: '<c:out value="${baseURL}"/>' + "/admin/pages/photos",
                data : {
                    "photos" : photoString,
                    "page" : page
                },
                dataType: "json",
                success: function(data) {
                    loadData();
                }
            });
        }
    </script>
</head>
<body onload="loadData();">
<div class="all">
    <!-- MAIN -->
    <div class="left col-md-2">
        <a href="${baseURL}/admin">Главная</a> <br/><br/>
        <a href="${baseURL}/admin/pages">Страницы</a> <br />
        <br /><br /><br />
        <a href="${baseURL}/admin/photos/titles" id = "a_photos">Титульные фото</a> <br/>

    </div>
    <div class="right col-md-10">
        <div class="row">
            <h2 id = "h2">Фотографии</h2>
        </div>
        <div class="row photos_photo well">
            <c:forEach var="page" items="${requestScope.pages}">
                <div class="col-xs-4">
                    <input type="radio" name="page_button" value="page_${page.id}" /> ${page.name}
                </div>
            </c:forEach>
            <div class="col-xs-12 photos_buttons">
                <div class="col-xs-4">
                    <input type="button" class="btn btn-success" value="Выбрать все"/><br/><br/><br/>
                </div>
                <div class="col-xs-4">
                    <input type="button" class="btn btn-success" id = "change_status_btn" value="Сделать выбранное титульными фото"
                           onclick="changeStatus();"/>
                </div>
                <div class="col-xs-4">
                    <input type="button" class="btn btn-danger" id = "add_to_page_btn" value="Добавить выбранное на страницу"
                           onclick="sendPhotoData();"/>
                </div>
            </div>
        </div>

        <c:forEach var="photo" items="${requestScope.photos}">
            <div class="row photos_photo" id="photo_${photo.id}">
                <div class="col-xs-4 photos_image">
                    <p class="photos_p_center"><img width="320px" src="/static/img/base/${photo.url}" alt=""/></p>
                </div>
                <div class="col-xs-2 photos_desc ">
                    <input class="btn btn-success photos_desc_btn_choose" type="button" id="btn_choose_${photo.id}"
                           value="Выбрать" onclick="choose(this);"/>
                </div>
                <div class="col-xs-6 photos_desc">
                    <input name="tags" value="Теги"/>
                </div>
            </div>
        </c:forEach>


    </div>
</div>
</body>
</html>
