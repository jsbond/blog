<%@ taglib prefix='c' uri='http://java.sun.com/jstl/core_rt' %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<body>
<!-- HEADER -->
<div class="row">
    <div class="col-xs-3 col-md-3 navrow" id="" onclick="goto(this.id)">
        <%--<a class="head" href="${baseURL}/api">Home</a>--%>
        <a class="head" href="${baseURL}/">Home</a>
    </div>
    <div class="col-xs-3 col-md-3 navrow">
        <a class="dropdown-toggle head" data-toggle="dropdown" role="button" aria-expanded="false">Portfolio <span class="caret"></span></a>
        <ul class="dropdown-menu" role="menu">
            <li>
                <a class="in-head" href="${baseURL}/portfolio/wedding">
                    <span class="in-head">wedding</span>
                </a>
            </li>
            <li>
                <a class="in-head" href="${baseURL}/portfolio/portrait">
                    <span class="in-head">portrait </span>
                </a>
            </li>
            <li>
                <a class="in-head" href="${baseURL}/portfolio/beauty">
                    <span class="in-head">beauty&fashion</span>
                </a>

            </li>
            <li>
                <a class="in-head" href="${baseURL}/portfolio/lovestory.html">
                    <span class="in-head">lovestory</span>
                </a>
            </li>
            <li>
                <a class="in-head" href="${baseURL}/portfolio/family">
                    <span class="in-head">family</span>
                </a>
            </li>
        </ul>
        <!-- dropdown end  -->
    </div>
    <div class="col-xs-3 col-md-3 navrow" id="price" onclick="goto(this.id)">
        <a class="head"href="${baseURL}/price">Price</a>
    </div>
    <div class="col-xs-3 col-md-3 dropdown navrow" id="admin/contacts" onclick="goto(this.id)">
        <a class="head" href="${baseURL}/contacts">Contacts</a>
    </div>
</div>

<div class="header">
    <div class="row">
        <div class="col-md-3">
        </div>
        <div class="col-md-6 ">
            <h1 class="titul">
                <a href="${baseURL}">
                    <img src="/static/img/main/fff.png" width="320" alt=""/>
                </a>
            </h1>
        </div>
        <div class="col-md-3">
        </div>
    </div>
</div>
</body>
</html>
