<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="layout/db_connect.jsp" %>
<% String sql =   "SELECT V_NAME 성명, "
                + "CASE WHEN SUBSTR(v_jumin, 7, 1) IN ('1', '2') THEN '19' ELSE '20' "
                + "END || TO_CHAR(TO_DATE(SUBSTR(v_jumin, 1, 6), 'yymmdd'), 'YY\"년\"MM\"월\"DD\"일\"') AS 생년월일, "
                + "'만' || (EXTRACT(YEAR FROM SYSDATE) - "
                + "TO_NUMBER( "
                + "CASE WHEN SUBSTR(v_jumin, 7, 1) IN ('1', '2') THEN '19' ELSE '20' "
                + "END || SUBSTR(v_jumin, 1, 2))) || '세' AS 만나이, "
                + "CASE WHEN SUBSTR(V_JUMIN, 7, 1) IN ('1', '3') THEN '남' ELSE '여' END AS 성별, "
                + "M_NO 후보번호, SUBSTR(V_TIME, 1, 2) || ':' || SUBSTR(V_TIME, 3, 2) AS 투표시간, "
                + "DECODE(UPPER(V_CONFIRM), 'Y', '확인', 'N', '미확인') AS 유권자확인 "
                + "FROM tbl_vote_202005 ORDER BY M_NO";

    PreparedStatement pstmt = conn.prepareStatement(sql);
    ResultSet rs = pstmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>지역구의원투표 프로그램</title>
    <link rel="stylesheet" type="text/css" href="./css/style.css?ver1.2">    
    </head>
<body>
    <header>
        <jsp:include page="./layout/header.jsp"></jsp:include>
    </header>
    
    <nav>
        <jsp:include page="./layout/nav.jsp"></jsp:include>
    </nav>
    
    <main class="section">
        <h2 class="title">후보조회</h2>
    	<div style="overflow-x:hidden; width: 100%; height: 400px;">
        <table class="table_line" align="center">
        <tr>
            <th>성명</th>
            <th>생년월일</th>
            <th>나이</th>
            <th>성별</th>
            <th>후보번호</th>
            <th>투표시간</th>
            <th>유권자확인</th>
        </tr>
        <% while(rs.next()) { %>
        <tr align="center">
            <td><%= rs.getString("성명") %></td>
            <td><%= rs.getString("생년월일") %></td>
            <td><%= rs.getString("만나이") %></td>
            <td><%= rs.getString("성별") %></td>
            <td><%= rs.getString("후보번호") %></td>
            <td><%= rs.getString("투표시간") %></td>
            <td><%= rs.getString("유권자확인") %></td>

        </tr>
        <% } %>
        </table>
        </div>
    </main>
    
    <footer>
        <jsp:include page="./layout/footer.jsp"></jsp:include>
    </footer>
</body>
</html>