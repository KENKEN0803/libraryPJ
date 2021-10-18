<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="stylesheets/stylenomal.css">
<link rel="stylesheet" href="stylesheets/skins/lilac.css">

<div class="row">
    <div class="headerlogo four columns">
        <div class="logo">
            <a href="/">
                <img alt="logo.png" src="images/logo.png">
            </a>
        </div>
    </div>

    <%
        String mem_id = (String) session.getAttribute("member");
        pageContext.setAttribute("mem_id", mem_id);
    %>
    <c:choose>
        <c:when test="${mem_id eq null}">
            <div class="headermenu eight columns noleftmarg">
                <nav id="nav-wrap">
                    <ul id="main-menu" class="nav-bar sf-menu">
                        <li class="current">
                            <!-- 			style="display: none;" 를사용하세영 -->

                            <a href="/login">로그인</a>
                        </li>
                        <li>
                            <a href="/Join">회원가입</a>
                        </li>
                    </ul>
                </nav>
            </div>
        </c:when>
        <c:when test="${not empty mem_id}">
            <div class="headermenu eight columns noleftmarg">
                <nav id="nav-wrap">
                    <ul id="main-menu" class="nav-bar sf-menu">
                        <li class="current">
                        <li>
                            <a>${mem_id}</a>
                            <ul>
                                <li><a href="이동경로 넣으셈">나의 대출현황</a></li>
                                <li><a href="/myReserve">나의 예약현황</a></li>
                                <li><a href="/memUpdatePage">회원정보</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="/logout">로그아웃</a>
                        </li>
                        <li>
                            <a href="이동경로 넣으셈"></a>
                        </li>
                    </ul>
                </nav>
            </div>
        </c:when>
    </c:choose>
</div>


<div id="ei-slider" class="ei-slider">
    <ul class="ei-slider-large">
        <li>
            <img src="images/mainImg.jpg" alt="image10" class="responsiveslide">
            <div class="ei-title">
                <a style="font-size: 46px; font-weight: 900; color: white; margin-left: 0">로그인</a>
            </div>
        </li>
    </ul>
</div>
<hr>