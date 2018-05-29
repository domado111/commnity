<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="../../css/contentstyle.css" />
<script type="text/javascript" src="/Project/ajax/httpRequest.js"></script>
<title>망했어 빨리 작성하자</title>
<script type="text/javascript">
	function showlist() {
		document.getElementById('movielist').style.display = 'block';
	}
	function closelist() {
		document.getElementById('movielist').style.display = 'none';
	}
	
	/* 영화이름을 검색합니다. */
	function toList() {
		var params = "movieNm=" + encodeURIComponent(document.ffff.movieNm.value);
		sendRequest("movielist", params, fromList, "POST");
	}
	/* 검색어가 들어간 영화 제목을 가져옵니다. */
	function fromList() {
		if (httpRequest.readyState == 4) {
			if (httpRequest.status == 200) {
				document.getElementById("movie").innerHTML = httpRequest.responseText;
			}
		}
	}
</script>
</head>
<body>
	<div id="write" class="w3-row w3-cell-row">
		<div
			class="w3-row w3-border w3-border-black w3-white w3-small w3-cell"
			style="width: 700px;">
			<div class="w3-container w3-padding"
				style="border-bottom: 1px solid black;">
				<label>리뷰 작성</label>
			</div>
			<div class="w3-container">
				<form action="writereviewPro" name="ffff" method="post">
					<input name="writer" type="hidden" value="${sessionNAME }" /> 
					<input name="email" type="hidden" value="${sessionID }" />
					<input name="boardid" type="hidden" value="1" /> 
					<input name="pageNum" type="hidden" value="1">
					<input name="boardnum" type="hidden" value="${boardnum}">
					<div class="w3-row w3-cell-row">
						<div class="w3-cell w3-padding-small">
							<label class="w3-text-grey">영화</label>
							<div class="w3-bar">
								<input id="movie_search" name="movieNm" type="text" align="left"
									class="w3-input w3-border w3-border-black w3-bar-item"
									onclick="showlist()" onchange="toList()" />
							</div>
						</div>
						<div class="w3-cell w3-padding-small">
							<label class="w3-text-grey">평점</label>
							<div class="w3-bar">
								<div class="w3-bar-item" style="padding-top: 10px;">
									<input type="radio" name="moviescore" value="5" checked><img
										src="../icon/star05.gif" />
								</div>
								<div class="w3-bar-item" style="padding-top: 10px;">
									<input type="radio" name="moviescore" value="4" class="w3-cell"><img
										src="../icon/star04.gif" />
								</div>
								<div class="w3-bar-item" style="padding-top: 10px;">
									<input type="radio" name="moviescore" value="3" class="w3-cell"><img
										src="../icon/star03.gif" />
								</div>
								<div class="w3-bar-item" style="padding-top: 10px;">
									<input type="radio" name="moviescore" value="2" class="w3-cell"><img
										src="../icon/star02.gif" />
								</div>
								<div class="w3-bar-item" style="padding-top: 10px;">
									<input type="radio" name="moviescore" value="1" class="w3-cell"><img
										src="../icon/star01.gif" />
								</div>
							</div>
						</div>
					</div>
					<div class="w3-row w3-padding-small">
						<label class="w3-text-grey">제목</label> <input name="subject"
							type="text" class="w3-input w3-border w3-border-black" />
					</div>
					<div class="w3-row w3-padding-small">
						<label class="w3-text-grey">내용</label>
						<textarea name="content"
							class="w3-input w3-border w3-border-black"
							style="max-height: 400px; min-height: 250px; max-width: 850px; min-width: 850px; height: 400px;"></textarea>
					</div>
					<div class="w3-center w3-margin">
						<button type="submit"
							class="w3-button w3-border w3-border-black w3-hover-white w3-round-xxlarge"
							style="width: 200px;">글쓰기</button>
					</div>
				</form>
			</div>
		</div>
		<div id="movielist" class="w3-cell w3-white w3-border w3-border-black"
			style="width: 400px; height: 655px; display: none;">
			<div id="movie"></div>
		</div>
	</div>
</body>

</html>