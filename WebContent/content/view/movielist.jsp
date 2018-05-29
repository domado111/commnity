<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	</head>
	<body>
		<!-- 오픈API를 사용 해 검색어가 들어간 영화 제목을 표시합니다.  -->
		<c:if test="${not empty result.movieListResult.movieList}">
		<div class="w3-container" style="overflow: scroll; height: 655px;">
			<c:forEach items="${result.movieListResult.movieList}" var="movie">	
				<div class="w3-section">
					<span class="w3-text-blue w3-small"><a href="#" onclick="document.getElementById('movie_search').value='${movie.movieNm }'">${movie.movieNm }</a></span>
					<span class="w3-text-black w3-tiny">(${movie.movieNmEn },${movie.openDt })</span>
				</div>
			</c:forEach>
		</div>
		</c:if>
	</body>
</html>