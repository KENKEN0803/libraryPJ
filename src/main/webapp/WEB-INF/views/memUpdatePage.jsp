<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="Pack.memberBean" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 정보 수정</title>
</head>
<style>
    #jform {
        display: inline-block;
        text-align: center;
    }
</style>
<body>
<div>
    <%@include file="headClean.jsp" %>
</div>
<div id="ei-slider" class="ei-slider">
    <ul class="ei-slider-large">
        <li>
            <img src="images/mainImg.jpg" alt="image10" class="responsiveslide">
            <div class="ei-title">
                <a style="font-size: 46px; font-weight: 900; color: white; margin-left: -60px">회원 정보 수정</a>
            </div>
        </li>
    </ul>
</div>
<hr>
<div style="margin: auto; text-align: center;">
    <%
        memberBean m = new memberBean();
        m.setMem_id((String) session.getAttribute("member"));
        //System.out.println(model.getAttribute("mem_pass"));
    %>
    <div id="jform">
        <h1>회원 정보수정</h1>
        <fieldset>
            <form method=POST action="mem_update">
                <label>아이디</label><input type="text" name="mem_id" id="mem_id"
                                         value="<%=session.getAttribute("member")%>" readonly/><br>
                <label>패스워드</label><input type="text" name="mem_pass" value="${m.get(0).mem_pass}"><Br>
                <label>이름</label><input type="text" name="mem_name" id="mem_name" required
                                        value="${m.get(0).getMem_name()}" readonly onchange="nameCheck(this)"
                                        required><Br>
                <label>주민등록번호</label> <input type="text" name="mem_reg" maxlength="13" value="${m.get(0).getMem_reg()}"
                                             readonly/><Br>
                <label>핸드폰번호</label><input type="text" name="mem_tel" value="${m.get(0).getMem_tel()}" required
                                           oninput="numCheck(this)"><Br>
                <div style="display:inline;"><input type="submit" value="수정">
            </form>
            <form onsubmit="return confirm('회원탈퇴 하시겠습니까?');" method=POST action="mem_delete">
                <input type="submit" value="회원탈퇴">
    </div>
    </form>
    <a href="/logout">로그아웃</a>
    <script type="text/javascript">
        function nameCheck(obj) {
            var regExp = /^[가-힣]+$/;
            //^ : 문자열 시작, $ : 문자열 끝, + 한번이거나 한번이상
            if (!regExp.test(obj.value)) {
                alert("한글만 입력해주세요.");
                document.getElementById("mem_name").value = "";
            }
        }

        function numCheck(e) {
            e.value = e.value.replace(/[^0-9]/ig, '')
        }

        function mem_del() {
            window.open("/mem_delcheck", "mem_delcheck", "width=500 height=450")
        }
    </script>
</div>
<div>
    <%@include file="footer.jsp" %>
</div>
</body>
</html>