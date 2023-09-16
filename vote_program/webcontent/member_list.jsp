<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="layout/db_connect.jsp" %>
<%
    String sql = " select m_no, m_name, p_name,"
               + "      decode(p_school, '1', '고졸', '2', '학사', '3', '석사', '4', '박사', '???') p_school,"
               + "      substr(m_jumin, 1, 6)||'-'||substr(m_jumin, 7, 13) m_jumin, m_city,"
               + "      p_tel1||'-'||p_tel2||'-'||p_tel3 m_phone"
               + " from" 
               + "     TBL_MEMBER_202005 a, TBL_PARTY_202005 b"
               + " where a.p_code = b.p_code"
               + " order by m_no";

    PreparedStatement pstmt = conn.prepareStatement(sql);
    ResultSet rs = pstmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>지역구의원투표 프로그램</title>
    <link rel="stylesheet" type="text/css" href="./css/style.css?ver1.1">    
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
        <table class="table_line" align="center">
        <tr>
            <th>후보번호</th>
            <th>성명</th>
            <th>소속정당</th>
            <th>학력</th>
            <th>주민번호</th>
            <th>지역구</th>
            <th>대표전화</th>
        </tr>
        <% while(rs.next()) { %>
        <tr align="center">
            <td><%= rs.getString("m_no") %></td>
            <td><%= rs.getString("m_name") %></td>
            <td><%= rs.getString("p_name") %></td>
            <td><%= rs.getString("p_school") %></td>
            <td><%= rs.getString("m_jumin") %></td>
            <td><%= rs.getString("m_city") %></td>
            <td><%= rs.getString("m_phone") %></td>

        </tr>
        <% } %>
        </table>
    </main>
    
    <footer>
        <jsp:include page="./layout/footer.jsp"></jsp:include>
    </footer>
</body>
</html>