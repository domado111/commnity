<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
		<link rel="stylesheet" href="<%=request.getContextPath() %>/css/contentstyle.css" />
		<title>${article.subject }</title>
	</head>
	<body>				
		<jsp:include page="../../common/searchbar.jsp" />
		<div class="w3-container w3-margin-top" style="width: 1400px; margin: 0 260px;">		
			<div class="w3-cell-row">
				<!-- 필터링 -->
				<div class="w3-container w3-cell" style="width: 250px; height: 1000px;">
					<div class="w3-container w3-round w3-light-grey" style="border: 2px solid lightgrey;">
						<div class="w3-row">							
							<form action="search">
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
												</c:if>
												${code.korNm}
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
											<input type="text" class="w3-input w3-border-0" name="directorNm" value="${directorNm }">
										</div>	
									</div>
								</div>
								<div class="w3-section">
									<div class="w3-row">
										<span>영화명</span>
									</div>
									<div class="w3-cell-row">
										<div class="w3-cell">
											<input type="text" class="w3-input w3-border-0" name="movieNm" value="${movieNm }">
										</div>	
									</div>
								</div>
								<div>
									
								</div>
								<div class="w3-section">
									<div class="w3-row">
										<label>개봉연도</label>
									</div>
									<div class="w3-cell-row">
										<div class="w3-cell">
											<input type="text" class="w3-input w3-border-0" name="openStartDt" value="${openStartDt }">
										</div>
										<span class="w3-cell"><b>~</b></span> 									
										<div class="w3-cell">
											<input type="text" class="w3-input w3-border-0" name="openEndDt" value="${openEndDt }">
										</div>	
									</div>
								</div>			
								<div class="w3-section">
									<div class="w3-row">
										<label>제작연도</label>
									</div>
									<div class="w3-cell-row">
										<div class="w3-cell">
											<input type="text" class="w3-input w3-border-0" name="prdtStartYear" value="${prdtStartYear }"> 											
										</div>
										<span class="w3-cell"><b>~</b></span> 
										<div class="w3-cell">
											<input type="text" class="w3-input w3-border-0" name="prdtEndYear" value="${prdtEndYear }">									
										</div>
									</div>
								</div>
								<div class="w3-secion w3-center w3-margin-bottom">
									<input type="submit" class="w3-input w3-button w3-deep-orange w3-round w3-hover-none w3-border-0 w3-hover-orange" value="찾기">
								</div>
							</form>
						</div>
					</div>
				</div>				
				<div class="w3-container w3-cell" style="width:700px;">					
					<div class="w3-container w3-round" style="border: 2px solid lightgrey;">
					<form action="updatereviewPro" method="post">
						<input type="hidden" value="${article.boardnum }" name="boardnum"/>
						<div class="w3-row" style="border-bottom: 1px solid lightgrey;">						
							<div class="w3-panel w3-cell-row">							
								<span class="w3-cell w3-text-blue w3-xlarge w3-left">
									<input type="text" name="movieNm" class="w3-input w3-border w3-border-black w3-bar-item" value="${article.movieNm }" readonly />
								</span>
								<span class="w3-cell w3-text-grey w3-right">
									<input type="text" name="writer" class="w3-input w3-border w3-border-black w3-bar-item" value="${article.writer }" readonly />
								</span>
							</div>
						</div>
						<div class="w3-row" style="border-bottom: 1px solid lightgrey;">
							<div class="w3-panel w3-large w3-bar">
								<div class="w3-bar-item" style="padding-top: 10px;">
									<input type="radio" name="moviescore" value="5" checked><img src="../icon/star05.gif" />
								</div>
								<div class="w3-bar-item" style="padding-top: 10px;">
									<input type="radio" name="moviescore" value="4" class="w3-cell"><img src="../icon/star04.gif" />
								</div>
								<div class="w3-bar-item" style="padding-top: 10px;">
									<input type="radio" name="moviescore" value="3" class="w3-cell"><img src="../icon/star03.gif" />
								</div>
								<div class="w3-bar-item" style="padding-top: 10px;">
									<input type="radio" name="moviescore" value="2" class="w3-cell"><img src="../icon/star02.gif" />
								</div>
								<div class="w3-bar-item" style="padding-top: 10px;">
									<input type="radio" name="moviescore" value="1" class="w3-cell"><img src="../icon/star01.gif" />
								</div>
							</div>
						</div>
						<div class="w3-row" style="border-bottom: 1px solid lightgrey;">
							<div class="w3-row w3-padding-small">
								<label class="w3-text-grey">제목</label>
								<input name="subject" type="text" value="${article.subject }" class="w3-input w3-border w3-border-black"/>
							</div>
							<div class="w3-row w3-padding-small">								
								<label class="w3-text-grey">내용</label>
								<textarea name="content" class="w3-input w3-border w3-border-black" style="max-height: 400px; min-height: 250px; max-width: 850px; min-width: 850px; height: 400px;">${article.content }</textarea>							
							</div>
						</div>
						<div class="w3-row w3-section w3-padding-small" style="height: 80px;">
							<div class="w3-center w3-margin">
				    			<button type="submit" class="w3-button w3-border w3-border-black w3-hover-white w3-round-xxlarge" style="width: 200px;">글쓰기</button>
				    		</div>
						</div>
						</form>				
					</div>					
					<div class="w3-row w3-center w3-light-grey" style="height: 60px; border-top: 2px solid lightgrey; border-bottom: 2px solid lightgrey; margin-top: 30px;">
						<div class="w3-section">
							<a href="reviewlist">목록으로</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>