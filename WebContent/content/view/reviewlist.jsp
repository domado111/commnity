<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Open Sans">
<link rel="stylesheet" href="../../css/contentstyle.css" />
<style type="text/css">
body {
	min-width: 1920px;
	width: auto;
}

li {
	list-style: none;
}

img:hover {
	color: red;
}
</style>
<title>Write a Review</title>
</head>
<body>
	<!-- 위로가기 -->
	<button class="w3-button w3-hover-none" onclick="window.scrollTo(0,0);"
		style="position: fixed; bottom: 10px; right: 10px; z-index: 1">
		<img src="../icon/arrow-up.png" class="w3-hover-none" />
	</button>
	<button class="w3-button w3-hover-none" onclick="goHome()"
		style="position: fixed; bottom: 90px; right: 15px; z-index: 1">
		<img src="../icon/home.png" class="w3-hover-none" />
	</button>

	<!-- 글쓰기 -->
	<c:if test="${sessionID!=null }">
		<button class="w3-button w3-hover-none" onclick="showEdit()"
			style="position: fixed; bottom: 50px; right: 15px; z-index: 1">
			<img src="../icon/edit.png" class="w3-hover-none" />
		</button>
	</c:if>

	<c:if test="${sessionID==null }">
		<button class="w3-button w3-hover-none" onclick="showLogin()"
			style="position: fixed; bottom: 50px; right: 10px; z-index: 1">
			<img src="../icon/User.png" class="w3-hover-none" />
		</button>
	</c:if>
	<div id="login" class="w3-modal">
		<div class="w3-modal-content w3-animate-top">
			<div class="w3-row">
				<span class="w3-button w3-hover-none w3-display-topright"
					onclick="closeLogin()">&times;</span>
				<jsp:include page="../../user/view/login.jsp"></jsp:include>
			</div>
		</div>
	</div>

	<div id="edit" class="w3-modal">
		<div class="w3-modal-content w3-animate-top">
			<div class="w3-row">
				<span
					class="w3-button w3-none w3-hover-none w3-border-none w3-hover-border-none w3-display-topright"
					onclick="closeEdit()">&times;</span>
				<jsp:include page="writereview.jsp"></jsp:include>
			</div>
		</div>
	</div>

	<jsp:include page="../../common/searchbar.jsp" />
	<div class="w3-container w3-margin-top"
		style="width: 1400px; margin: 0 300px;">
		<div class="w3-cell-row">
			<!-- 필터링 -->
			<div class="w3-container w3-cell"
				style="width: 250px; height: 1000px;">
				<div class="w3-container w3-round w3-light-grey"
					style="border: 2px solid lightgrey;">
					<div class="w3-row">
						<form action="movielist/search" name="f">
							<div class="w3-section">
								<div class="w3-row">
									<label class="w3-large"><b>지역</b></label>
								</div>
								<div class="w3-row">
									<select class="w3-select w3-border-0" name="repNationCd">
										<option value="">전체</option>
										<c:forEach items="${nationCd.codes}" var="code">
											<option value="${code.fullCd}">
												<c:if test="${param.repNationCd eq code.fullCd}"> 
													selected="seleted"
												</c:if> ${code.korNm}
											</option>
										</c:forEach>
									</select>
								</div>
							</div>
							<div class="w3-section">
								<div class="w3-row">
									<label>감독명</label>
								</div>
								<div class="w3-cell-row">
									<div class="w3-cell">
										<input type="text" class="w3-input w3-border-0"
											name="directorNm" value="${directorNm }">
									</div>
								</div>
							</div>
							<div class="w3-section">
								<div class="w3-row">
									<span>영화명</span>
								</div>
								<div class="w3-cell-row">
									<div class="w3-cell">
										<input type="text" class="w3-input w3-border-0" name="movieNm"
											value="${movieNm }">
									</div>
								</div>
							</div>
							<div></div>
							<div class="w3-section">
								<div class="w3-row">
									<label>개봉연도</label>
								</div>
								<div class="w3-cell-row">
									<div class="w3-cell">
										<input type="text" class="w3-input w3-border-0"
											name="openStartDt" value="${openStartDt }">
									</div>
									<span class="w3-cell"><b>~</b></span>
									<div class="w3-cell">
										<input type="text" class="w3-input w3-border-0"
											name="openEndDt" value="${openEndDt }">
									</div>
								</div>
							</div>
							<div class="w3-section">
								<div class="w3-row">
									<label>제작연도</label>
								</div>
								<div class="w3-cell-row">
									<div class="w3-cell">
										<input type="text" class="w3-input w3-border-0"
											name="prdtStartYear" value="${prdtStartYear }">
									</div>
									<span class="w3-cell"><b>~</b></span>
									<div class="w3-cell">
										<input type="text" class="w3-input w3-border-0"
											name="prdtEndYear" value="${prdtEndYear }">
									</div>
								</div>
							</div>
							<div class="w3-secion w3-center w3-margin-bottom">
								<input type="submit"
									class="w3-input w3-button w3-deep-orange w3-round w3-hover-none w3-border-0 w3-hover-orange"
									value="찾기">
							</div>
						</form>
					</div>
				</div>
			</div>
			<!-- 리뷰 -->
			<div class="w3-row w3-cell" style="width: 1000px;">
				<div class="w3-center w3-light-grey" style="height: 50px;">
					<div class="w3-bar">
						<div class="w3-bar-item">
							<a href="movielist/search?movieNm=">
								<button
									class="w3-button w3-border-0 w3-hover-none w3-hover-text-red">영화</button>
							</a>
						</div>
						<div class="w3-bar-item">
							<a href="">
								<button
									class="w3-button w3-border-0 w3-hover-none w3-hover-text-green">리뷰</button>
							</a>
						</div>
					</div>
				</div>
				<div class="w3-row" style="margin-top: 20px;">
					<div class="w3-left">
						<b>1~20</b>건을 표시/전체<b>${count }</b>건
					</div>
					<div class="w3-right">
						<c:if test="${sessionID!=null }">
							<button class="w3-button w3-text-blue w3-hover-none"
								onclick="showEdit()">리뷰 작성</button>
						</c:if>
					</div>
				</div>
				<c:forEach var="article" items="${articleList }">
					<div class="w3-row"
						style="border-top: 2px solid lightgrey; height: 300px;">
						<div class="w3-cell-row"
							style="border-bottom: 1px solid lightgrey;">
							<span
								class="w3-left w3-large w3-cell w3-margin w3-hover-border-red"
								style="border-left: 3px solid lightgrey;"> <a
								href="movieinfo?movieNm=${article.movieNm }"
								class="w3-button w3-text-blue w3-border-0 w3-hover-border-none w3-hover-none w3-hover-text-red w3-padding-small"><b>${article.movieNm }</b></a>
							</span>
							<div class="w3-right w3-cell">
								<div class="w3-cell-row w3-padding">
									<div class="w3-cell">
										<button
											class="w3-button w3-border-0 w3-none w3-hover-none w3-left">
											<img name="like" src="../icon/heart-32.png"
												class="w3-hover-none">
										</button>
									</div>
									<div class="w3-cell">
										<button
											class="w3-button w3-border-0 w3-none w3-hover-none w3-right">
											<img name="wish" src="../icon/pin-32.png"
												class="w3-hover-none">
										</button>
									</div>
								</div>
							</div>
						</div>
						<div class="w3-cell-row">
							<div class="w3-cell w3-padding" style="width: 100px;">
								<div class="w3-row">
									<div class="w3-image">
										<a href="movieinfo?movieNm=${article.movieNm }"> <img
											src="${article.poster }" width="100" height="150"
											class="w3-border w3-round w3-hover-border-red">
										</a>
									</div>
								</div>
							</div>
							<div class="w3-cell w3-padding">
								<div class="w3-row w3-small"
									style="width: 500px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">
									<a href="movieinfo?movieNm=${article.movieNm }"
										class="w3-text-dark-grey"> <b>${article.story }</b>
									</a>
								</div>
								<div class="w3-row w3-margin-top">
									<c:if test="${article.moviescore==5 }">
										<img src="../icon/star05.gif" />
									</c:if>
									<c:if test="${article.moviescore==4 }">
										<img src="../icon/star04.gif" />
									</c:if>
									<c:if test="${article.moviescore==3 }">
										<img src="../icon/star03.gif" />
									</c:if>
									<c:if test="${article.moviescore==2 }">
										<img src="../icon/star02.gif" />
									</c:if>
									<c:if test="${article.moviescore==1 }">
										<img src="../icon/star01.gif" />
									</c:if>
								</div>
								<div class="w3-row w3-margin-top w3-light-grey w3-small"
									style="height: 80px;">
									<div class="w3-panel"
										style="width: 500px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">
										<a href="reviewdetail?boardnum=${article.boardnum }"
											class="w3-text-dark-grey w3-hover-text-red"
											style="border-bottom: 1px dotted black;">
											${article.subject } </a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
				<div class="w3-center">
					<c:if test="${count>0 }">

						<c:if test="${startPage > bottomLine }">
							<a href="reviewlist?pageNum=${startPage - bottomLine}">[이전]</a>
						</c:if>


						<c:forEach var="i" begin="${startPage}" end="${endPage}">

							<a href="reviewlist?pageNum=${i}"> <c:if test="${i != currentPage}">[${i}]</c:if>
								<c:if test="${i == currentPage}">
									<font color='red'>[${i}]</font>
								</c:if></a>
						</c:forEach>

						<c:if test="${endPage < pageCount}">
							<a href="reviewlist?pageNum=${startPage+bottomLine}">[다음]</a>
						</c:if>
					</c:if>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
		function showEdit(){
			document.getElementById('edit').style.display='block';
		}
		
		function closeEdit(){
			document.getElementById('edit').style.display='none';
		}
		function showLogin(){
			document.getElementById('login').style.display='block';
		}
		
		function closeLogin(){
			document.getElementById('login').style.display='none';
		}
		
		function goHome(){
			location.href='index';
		}
	</script>
</html>