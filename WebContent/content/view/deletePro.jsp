<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="board.model.BoardDBBean"%>
<%@ page import="java.sql.Timestamp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${check==1}">
		<script language="JavaScript">      
         alert("삭제되었습니다.");
       </script>
       <meta http-equiv="Refresh"
		content="0;url=reviewlist?pageNum=${pageNum}">
</c:if>
<c:if test="${check!=1}">
	<script language="JavaScript">      
         alert("비밀번호가 맞지 않습니다");
         history.go(-1);
       </script>
</c:if>
