<%@ taglib prefix='c' uri='http://java.sun.com/jstl/core_rt' %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <%@ page contentType="text/html; charset=UTF-8" %>
    <style type="text/css">
        td {
            font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
        }
        div {
            text-align: center;
        }
        table.table {
            text-align: left;
        }
        span.text-head {
            color: rgb(28,137,164);
        }
        div.header {
            margin-bottom: 35px;
        }
    </style>
</head>
<body>
<jsp:include page="layouts/head.jsp" />
<div class="all">
    <jsp:include page="layouts/header.jsp" />
    <!-- MAIN -->
    <div class="main">
        <div>
        <table class="table">
            <tr>
                <td>
                    <img width="200px" alt="" src="/static/img/price/1.jpg" />
                </td>
                <td>
                    <label class="label label-info">ВСЁ ВКЛЮЧЕНО </label><br />
                    Весь свадебный день (от сборов до торта, 12 часов)<br />
                    Все фотографии с художественной обработкой 550+ кадров<br />
                    Фотографии отдаются на флешке + 2 диска для родителей в авторском оформлении <br />
                    Ч/б серия (50 кадров) <br />
                    Сжатая версия для публикации в интернете<br />
                    Cлайд-шоу в подарок <br />
                    Индивидуальная консультация и предварительный подбор места и вашего образа <br />
                    А также анонс съёмки из 30 кадров в течение 14 дней <br />
                    Стоимость 470$
                </td>
            </tr>
            <tr>
                <td>
                    <img width="200px" alt="" src="/static/img/price/2.jpg" />
                </td>
                <td>
                    <label class="label label-info">ОПТИМАЛЬНЫЙ</label><br />
                    Фотосъмка в течение 8 часов ( от сборов до первого танца)<br />
                    Все фотографии с художественной обработкой 400+ кадров <br />
                    Фотографии отдаются на флешке + 2 диска для родителей в авторском оформлении <br />
                    Ч/б серия ( 40 кадров) <br />
                    Сжатая версия для публикации в интернете <br />
                    Индивидуальная консультация и предварительный подбор места и вашего образа <br />
                    А также анонс съёмки из 30 кадров в течение 14 дней <br />
                    Стоимость 370$
                </td>
            </tr>
            <tr>
                <td>
                    <img width="200px" alt="" src="/static/img/price/3.jpg" />
                </td>
                <td>
                    <label class="label label-info">СТАНДАРТНЫЙ</label><br />
                    фотосъемка в течении 6 часов <br />
                    Все фотографии с художественной обработкой 350+ <br />
                    запись на диск с дизайнерским оформлением <br />
                    Ч/б серия ( 40 кадров) <br />
                    Сжатая версия для публикации в интернете <br />
                    Индивидуальная консультация и предварительный подбор места и вашего образа <br />
                    Стоимость 290$
                </td>
            </tr>
            <tr>
                <td>
                    <img width="200px" alt="" src="/static/img/price/4.jpg" />
                </td>
                <td>
                    <label class="label label-info">ЛАЙТ</label><br />
                    фотосъемка в течении 4 часов (загс + прогулка)<br />
                    Все фотографии с художественной обработкой 250+<br />
                    Запись на диск с дизайнерским оформлением<br />
                    Сжатая версия для публикации в интернете  <br />
                    Индивидуальная консультация и предварительный подбор места и вашего образа<br />
                    Стоимость 210$
                </td>
            </tr>
        </table>
        </div>
        <div id="to_top" title="Вверх!">
            <span class="glyphicon glyphicon-arrow-up"></span>
        </div>
    </div>
    <jsp:include page="layouts/footer.jsp" />
</div>
</body>
</html>
