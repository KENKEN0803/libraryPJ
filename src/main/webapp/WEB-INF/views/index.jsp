<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html class="no-js" lang="en">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width"/>
    <title>DOUZONE LIBRARY</title>
    <link rel="stylesheet" href="stylesheets/style.css">
    <link rel="stylesheet" href="stylesheets/skins/lilac.css">
</head>
<body>
<div class="total">
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
                <img src="images/librarySize.jpg" alt="image10" class="responsiveslide">
                <div style="width:40%" class="ei-title">
                    <h3 style="width:50%; border-radius:20px; opacity:0.9; background-color:#4E9F3D;">BOOK &</h3>
                    <h3 style="margin-left:30%; border-radius:20px; opacity:0.9">LIFE</h3>
                </div>
            </li>
        </ul>
    </div>

    <div id="subheader"
         style="height:80px; margin-left:13%; margin-right:13%; margin-bottom:1%; border-radius:20px; box-shadow:gray 0px 5px 3px 0px">
        <div class="row">
            <form action="/searchResult" method="get" style="margin-left:8%">
                <select name="type" style="width:10%; height:34px; border-radius:5px; float:left; ">
                    <option value="combine">통합 검색</option>
                    <option value="name"> 제 목</option>
                    <option value="author"> 저 자</option>
                    <option value="publisher"> 출 판 사</option>
                    <option value="ISBN"> I S B N</option>
                    <option value="id">책 I D</option>
                </select>
                <input type="text" name="inputValue" placeholder="책 이름을 입력해주세요."
                       style="width:70%; height:33px; border-radius:5px; float:left; margin-left:1%;"/>
                <button type="submit"
                        style="width:10%; height:33px; border-radius:8px; border:none; background: #EDFFED; margin-left:1%;">
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
                    <a href="/searchResult?type=combine&inputValue="> <span class="ca-icon"><i
                            class="fa fa-book"></i></span>
                        <div class="ca-content">
                            <h2 class="ca-main">도서 예약<br/></h2>
                            <h3 class="ca-sub">읽고 싶은 책을 예약하세요!</h3>
                        </div>
                    </a>
                </li>
                <li>
                    <a href="/myReserve">
                        <span class="ca-icon"><i class="fa fa-clock-o"></i></span>
                        <div class="ca-content">
                            <h2 class="ca-main">나의 예약<br/></h2>
                            <h3 class="ca-sub">예약 상태를 확인하세요!</h3>
                        </div>
                    </a>
                </li>
                <li>
                    <a href="/mem_myrent">
                        <span class="ca-icon"><i class="fa fa-leanpub"></i></span>
                        <div class="ca-content">
                            <h2 class="ca-main">나의 서재<br/></h2>
                            <h3 class="ca-sub">대출 현황을 확인하세요!</h3>
                        </div>
                    </a>
                </li>
                <li>
                    <a href="/memberJoinEx">
                        <span class="ca-icon"><i class="fa fa-info-circle"></i></span>
                        <div class="ca-content">
                            <h2 class="ca-main">가입 안내<br/></h2>
                            <h3 class="ca-sub">가입 절차를 안내 받으세요!</h3>
                        </div>
                    </a>
                </li>
            </ul>
        </div>
    </div>
    <!-- =========================FOOOTER =============================== -->
    <div id="footer">
        <footer class="row">
            <p class="back-top floatright">
                <a href="#top"><span></span></a>
            </p>
            <div class="four columns">
                <h1>더존 도서관</h1>
                소개글 2021년에 설립되어 어쩌고 도서관 입니다.
            </div>
            <div class="four columns">
                <h1>오시는길</h1>
                <a>본관 (48080) 부산광역시 해운대구 양운로 183(좌동) 해운대도서관</a><br/>
                <a>양운로 183(좌동) 해운대도서관</a><br/>
                <a>대표번호 : 000-000-0000 팩스 : 000-000-0000</a>
            </div>
            <div class="four columns">
                <h1 class="newsmargin">개인정보처리방침</h1>
                <div class="row collapse newsletter floatright">
                    <a href="#">자세히 보기</a>
                </div>
            </div>
        </footer>
    </div>
</div>
</body>
</html>