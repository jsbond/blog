<%@ taglib prefix='c' uri='http://java.sun.com/jstl/core_rt' %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <%@ page contentType="text/html; charset=UTF-8" %>
    <style type="text/css">
        div.contacts {
            font-family: Cookie, serif;
            font-size: 25px;
        }
        div.header {
            margin-bottom: 45px;
        }
    </style>
</head>
<body>
<jsp:include page="layouts/head.jsp" />
<div class="all">
    <jsp:include page="layouts/header.jsp" />
    <!-- MAIN -->
    <div class="main">
        <div class="row contacts well">
            <div class="col-md-6">
                <img width="300px" src="/static/img/contacts/contacts.jpg" alt=""/>
            </div>
            <div class="col-md-6">
                <div class="row">
                    <p class="text-contacts">Свяжитесь со мной удобным для Вас способом:</p>
                </div>

                <div class="row">
                    phone: +375(29) 342-15-23
                </div>
                <div class="row">
                    mail: evatigrova23@gmail.com
                </div>
                <div class="row">
                    vk: vk.com/eva_tigrova
                </div>
            </div>
        </div>
        <div class="col-xs-2"></div>
        <div class="col-xs-8">
            <form style="border-color: gray; border-style: solid; border-width: 1px" class="form-horizontal" action="/contacts/message" method="post">
                <div class="form-group">
                    <label for="input_name" class="col-sm-2 control-label">Имя</label>
                    <div class="col-sm-10">
                        <input class="form-control" name="name" id="input_name" placeholder="Имя"/>
                    </div>
                </div>
                <div class="form-group">
                    <label for="input_email" class="col-sm-2 control-label">Email</label>
                    <div class="input-group">
                        <div class="col-sm-10">
                            <span class="input-group-addon">@</span>
                            <input class="form-control" name="email" type="email" id="input_email" placeholder="Email"/>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="input_phone" class="col-sm-2 control-label">Телефон</label>
                    <div class="col-sm-10">
                        <input class="form-control" name="phone" id="input_phone" placeholder="Телефон"/>
                   </div>
                </div>
                <div class="form-group">
                    <label for="input_text" class="col-sm-2 control-label">Сообщение</label>
                    <div class="col-sm-10">
                    <input class="form-control" name="text" id="input_text" placeholder="Сообщение"/>
                    </div>
                </div>
                <input class="btn-default" type="submit"/>
            </form>
        </div>
        <div class="col-xs-2"></div>
    </div>
</div>
</body>
</html>
