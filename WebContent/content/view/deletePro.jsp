<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="board.model.BoardDBBean"%>
<%@ page import="java.sql.Timestamp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${check==1}">
		<script language="JavaScript">      
         alert("�����Ǿ����ϴ�.");
       </script>
       <meta http-equiv="Refresh"
		content="0;url=reviewlist?pageNum=${pageNum}">
</c:if>
<c:if test="${check!=1}">
	<script language="JavaScript">      
         alert("��й�ȣ�� ���� �ʽ��ϴ�");
         history.go(-1);
       </script>
</c:if>
