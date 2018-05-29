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
		<button class="w3-button w3-hover-none" onclick="goHome()" style="position: fixed; bottom: 10px; right: 10px; z-index: 1">
			<img src="<%=request.getContextPath() %>/icon/home.png" class="w3-hover-none"/>
		</button>
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
				<c:set var="writer" value="${article.email }"/>
				<c:set var="email" value="${sessionID }"/>
				
				<div class="w3-container w3-cell" style="width:700px;">
					<div class="w3-row">
					<c:if test="${writer eq email}">
					<div class="w3-row w3-right">
						<div class="w3-bar w3-small">
							<div class="w3-bar-item">
								<form action="updatereview">
									<input type="hidden" value="${article.boardnum }" name="boardnum"/>									
									<button type="submit" class="w3-button w3-light-grey w3-round w3-hover-none">글 수정</button>
								</form>
							</div>
							<div class="w3-bar-item">
								<form action="deletereview">
									<input type="hidden" value="${article.boardnum }" name="boardnum" />		
									<button type="submit" class="w3-button w3-light-grey w3-round w3-hover-none">글 삭제</button>
								</form>					
							</div>
						</div>
					</div>
					</c:if>
					</div>
					<div class="w3-container w3-round" style="border: 2px solid lightgrey;">
						<div class="w3-row" style="border-bottom: 1px solid lightgrey;">
							<div class="w3-panel w3-cell-row">
								<span class="w3-cell w3-text-blue w3-xlarge w3-left">
									<a href="movieinfo?movieNm=${article.movieNm }">${article.movieNm }</a>
								</span>
								<span class="w3-cell w3-text-grey w3-right">
									${article.writer }
								</span>
							</div>
						</div>
						<div class="w3-row" style="border-bottom: 1px solid lightgrey;">
							<div class="w3-panel w3-large">
								<c:if test="${article.moviescore==5 }">
									<img src="<%=request.getContextPath() %>/icon/star05.gif" />
								</c:if>
								<c:if test="${article.moviescore==4 }">
									<img src="<%=request.getContextPath() %>/icon/star04.gif" />
								</c:if>
								<c:if test="${article.moviescore==3 }">
									<img src="<%=request.getContextPath() %>/icon/star03.gif" />
								</c:if>
								<c:if test="${article.moviescore==2 }">
									<img src="<%=request.getContextPath() %>/icon/star02.gif" />
								</c:if>
								<c:if test="${article.moviescore==1 }">
									<img src="<%=request.getContextPath() %>/icon/star01.gif" />
								</c:if>
							</div>
						</div>
						<div class="w3-row" style="border-bottom: 1px solid lightgrey;">
							<div class="w3-panel w3-xlarge w3-text-black"><b>${article.subject }</b></div>
							<div class="w3-panel w3-text-grey">${article.content }</div>
						</div>
						<div class="w3-row w3-light-grey w3-section w3-padding-small" style="height: 80px;">
							<div class="w3-left">
								<button class="w3-button w3-border-0 w3-none w3-hover-none">
									<img name="wish" src="<%=request.getContextPath() %>/icon/heart-16.png" class="w3-hover-none">
								</button>
							</div>
							<div class="w3-right">
								<button class="w3-button w3-border-0 w3-none w3-hover-none">
									<img name="wish" src="<%=request.getContextPath() %>/icon/pin-16.png" class="w3-hover-none">
								</button>
							</div>
						</div>
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
	<script type="text/javascript">
	function goHome(){
		location.href='index';
	}
	</script>
</html>