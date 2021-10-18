<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <style>
        a {
            text-decoration: none;
        }

        fieldset {
            width: 500px;
        }

        #jform {
            display: inline-block;
            text-align: left;
        }
    </style>
</head>
<body>
<div>
    <%@include file="head.jsp" %>
</div>
<div style="margin: auto; text-align: center;">
    <jsp:useBean id="recv" class="Pack.memberBean" scope="page"/>
    <jsp:setProperty name="recv" property="*"/>
    <%
        String gbn = recv.getMem_id();
    %>
    <h3>회원 가입</h3>
    <div id="jform">
        <fieldset>
            <form method=POST action="join_success" name="regForm">
                <label>아이디</label><input type="text" name="mem_id" style="width:300px; id=" mem_id" readonly>
                <input type="button" value="중복확인" onClick="idCheck()" style="float:right;"></button><br>
                <label>패스워드</label><input type="password" name="mem_pass" maxlength="20" required><Br>
                <label>이름</label><input type="text" id="mem_name" name="mem_name" onchange="nameCheck(this)"
                                        required><Br>
                <label>주민등록번호</label><input type="text" name="mem_reg" required pattern=".{13,13}"
                                            title="주민등록번호 13자리를 정확하게 입력하세요." maxlength="13"
                                            oninput="numCheck(this)"><Br>
                <label>핸드폰번호</label><input type="text" name="mem_tel" required pattern=".{11,11}"
                                           title="전화 번호 11자리를 숫자만 입력하세요." maxlength="11" oninput="numCheck(this)"><Br>
                <input type="submit" value="가입" style="float:center;">
                <button>
                    <a href="/login">취소</a></button>
            </form>
        </fieldset>
    </div>
</div>
<script type="text/javascript">
    function idCheck() {
        window.open("/idCheckForm", "idcheck", "width=400 height=350")
    }

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
</script>
<div>
    <%@include file="footer.jsp" %>
</div>
</body>