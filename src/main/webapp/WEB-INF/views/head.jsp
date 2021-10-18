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

    <!-- 로그인시 버튼들 처리	 -->
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
                            <a>${mem_id}님</a>
                            <ul>
                                <li><a href="/mem_myrent">나의 대출현황</a></li>
                                <li><a href="/myReserve">나의 예약현황</a></li>
                                <li><a href="/memUpdatePage">회원정보</a></li>
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

<div id="ei-slider" class="ei-slider">
    <ul class="ei-slider-large">
        <li>
            <img src="images/mainImg.jpg" alt="image10" class="responsiveslide">
            <div class="ei-title">
                <!-- <h3>도서 예약</h3> -->
            </div>
        </li>
    </ul>
</div>

<div id="subheader"
     style="height:80px; margin-left:13%; margin-right:13%; margin-bottom:1%; border-radius:20px; box-shadow:gray 0px 5px 3px 0px">
    <div class="row">
        <form action="/searchResult" method="get" style="margin-left:8%">
            <select name="type" style="width:10%; height:32px; border-radius:5px; float:left; ">
                <option value="combine">통합 검색</option>
                <option value="name"> 제 목</option>
                <option value="author"> 저 자</option>
                <option value="publisher"> 출 판 사</option>
                <option value="ISBN"> I S B N</option>
                <option value="id">책 I D</option>
            </select>
            <input type="text" name="inputValue" placeholder="책 이름을 입력해주세요."
                   style="width:70%; border-radius:5px; float:left; margin-left:1%;"></input>
            <button type="submit"
                    style="width:10%; height:32px; border-radius:8px; border:none; background: #EDFFED; margin-left:1%;">
                검색
            </button>
        </form>
    </div>
</div>
<!-- =========================ANIMATED COLUMNS =============================== -->
<div class="row">
    <div class="twelve columns">
        <ul class="ca-menu">
            <li>
                <a href="/searchResult?type=combine&inputValue=">
                    <div class="ca-content">
                        <h2 class="ca-main">도서 예약<br/></h2>
                        <h3 class="ca-sub">읽고 싶은 책을 예약하세요!</h3>
                    </div>
                </a>
            </li>
            <li>
                <a href="/myReserve">
                    <div class="ca-content">
                        <h2 class="ca-main">나의 예약<br/></h2>
                        <h3 class="ca-sub">예약 상태를 확인하세요!</h3>
                    </div>
                </a>
            </li>
            <li>
                <a href="/mem_myrent">
                    <div class="ca-content">
                        <h2 class="ca-main">나의 서재<br/></h2>
                        <h3 class="ca-sub">대출 현황을 확인하세요!</h3>
                    </div>
                </a>
            </li>
            <li>
                <a href="/memberJoinEx">
                    <div class="ca-content">
                        <h2 class="ca-main">가입 안내<br/></h2>
                        <h3 class="ca-sub">가입 절차를 안내 받으세요!</h3>
                    </div>
                </a>
            </li>
        </ul>
    </div>
</div>
<hr>