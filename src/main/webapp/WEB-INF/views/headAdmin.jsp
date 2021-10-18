<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="stylesheets/styleadmin.css">
<link rel="stylesheet" href="stylesheets/skins/lilac.css">

<div class="row">
    <div class="headerlogo four columns">
        <div class="logo">
            <a href="indexAdmin">
                <img alt="logo.png" src="images/logoAdmin.png">
            </a>
        </div>
    </div>
    <%
        String admin_id = (String) session.getAttribute("admin");
        pageContext.setAttribute("admin_id", admin_id);
    %>
    <c:choose>
        <c:when test="${admin_id eq null}">
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
        <c:when test="${not empty admin_id}">
            <div class="headermenu eight columns noleftmarg">
                <nav id="nav-wrap">
                    <ul id="main-menu" class="nav-bar sf-menu">
                        <li class="current">
                        <li>
                            <a>${admin_id}</a>
                            <ul>
                                <li><a href="/memUpdatePage">관리자 정보</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="/logout">로그아웃</a>
                        </li>
                    </ul>
                </nav>
            </div>
        </c:when>
    </c:choose>
</div>
</div>


<div id="subheader">
    <div class="row">
        <div class="twelve columns">
            <ul class="ca-menu">
                <li>
                    <a href="/indexAdmin">
                        <div class="ca-content">
                            <h2 class="ca-main">대여 관리<br/></h2>
                            <h3 class="ca-sub">대여 / 반납 / 연장</h3>
                        </div>
                    </a>
                </li>
                <li>
                    <a href="/bookMgt">
                        <div class="ca-content">
                            <h2 class="ca-main">도서 관리<br/></h2>
                            <h3 class="ca-sub">검색 / 추가 / 수정</h3>
                        </div>
                    </a>
                </li>
                <li>
                    <a href="/mem_searching">
                        <div class="ca-content">
                            <h2 class="ca-main">회원 관리<br/></h2>
                            <h3 class="ca-sub">회원검색 / 수정</h3>
                        </div>
                    </a>
                </li>
                <li>
                    <a href="/bookStatus">
                        <div class="ca-content">
                            <h2 class="ca-main">전체 도서 현황<br/></h2>
                            <h3 class="ca-sub">전체 도서 현황</h3>
                        </div>
                    </a>
                </li>
            </ul>
        </div>
    </div>
</div>