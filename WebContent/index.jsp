<%@page import="member.model.MemberDataBean"%>
<%@page import="member.model.MemberDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script type="text/javascript" src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
		<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
		<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Oswald">
		<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open Sans">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="<%=request.getContextPath() %>/css/indexstyle.css" />		
		<title>리뷰 커뮤니티</title>
	</head>
	<body>
		<!-- 위로가기 -->
		<button type="reset" class="w3-button w3-hover-none" onclick="window.scrollTo(0,0);" style="position: fixed; bottom: 10px; right: 10px; z-index: 1">
			<img src="<%=request.getContextPath() %>/icon/arrow-up.png" class="w3-hover-none"/>
		</button>
		
		<!-- 이미지 범위 -->
		<div id="background_img" class="w3-container w3-padding-large w3-small">
			<!-- 헤더 -->
			<div class="w3-margin">
				<div class="w3-bar w3-padding">								
					<!-- 좌측 메뉴 -->
				  	<div class="w3-container w3-half w3-bar-item w3-left" style="margin-left: 250px;">
					  	<ul class="w3-cell-row w3-margin">
						    <li class="w3-cell">
						    	<button class="w3-button w3-text-white w3-hover-text-white w3-hover-none w3-padding" onclick="goReview()" >Write a Review</button>
						    </li>
						    <li class="w3-margin-right w3-cell">
						    	<button class="w3-button w3-text-white w3-hover-text-white w3-hover-none w3-padding" onclick="goQnA()" >Q & A</button>
						    </li>
					    </ul>
				  	</div>
				  	
				  	<!-- 우측 메뉴 -->
				  	<div class="w3-container w3-half w3-bar-item w3-right" style="margin-right: 350px;">
				  	<c:if test="${sessionID==null }">
				  		<ul class="w3-cell-row w3-margin">
				  			<li class="w3-margin-right w3-cell">
				  				<button class="w3-button w3-text-white w3-hover-text-white w3-hover-none w3-padding" onclick="showLogin()" >Log In</button>
				  				<div id="login" class="w3-modal">
				  					<div class="w3-modal-content w3-animate-top">
				  						<div class="w3-row">
				  							<span class="w3-button w3-hover-none w3-display-topright" onclick="closeLogin()" >&times;</span>
				  							<div class="w3-border w3-border-black">
												<div class="w3-padding-large" style="border-bottom: 1px solid black;">
													<div class="w3-margin">						
														<label>기존 회원</label>
														<div>이미 등록하셨다면 로그인하십시오.</div>					
													</div>
													<div class="w3-row">
														<form action="user/loginPro" method="post" class="w3-padding-16">
															<div class="w3-row">
																<div class="w3-half w3-padding-large">
																	<label class="w3-text-grey">이메일 주소 *</label>
																	<input name="email" type="email" class="w3-input w3-border w3-border-black" />
																</div>
																<div class="w3-half w3-padding-large">
																	<div class="w3-left">
																		<label class="w3-text-grey">비밀번호 *</label>
																	</div>
																	<div class="w3-right">
																		<label class="w3-text-grey">(최소 8자 - 최대 15자)</label>
																	</div>
																	<input name="password" type="password" class="w3-input w3-border w3-border-black" />
																</div>
															</div>
															<div class="w3-section w3-center">
																<button type="submit" class="w3-button w3-round-xxlarge w3-border w3-border-black w3-white w3-hover-white" style="width: 200px;">로그인</button>
															</div>
														</form>
													</div>
												</div>
												<div class="w3-padding-large">
													<div class="w3-panel">
														신규회원
														<div>회원으로 가입하시면 다음의 혜택을 누리실 수 있습니다.</div>
													</div>
													<div class="w3-section w3-center">
														<button class="w3-button w3-round-xxlarge w3-border w3-border-black w3-white w3-hover-white" onclick="showJoin()" style="width: 200px;">회원가입</button>
													</div>
												</div>
											</div>
				  						</div>
				  					</div>
				  				</div>
				  			</li>
				  			<li class="w3-cell">
				  				<button class="w3-button w3-text-white w3-border w3-border-white w3-text-hover-grey w3-hover-white w3-round-large w3-padding" onclick="showJoin()" >Sign Up</button>
				  				<div id="sign" class="w3-modal">
				  					<div class="w3-modal-content w3-animate-top" style="width: 370px;">
				  						<div class="w3-row">
				  							<span class="w3-button w3-hover-none w3-display-topright" onclick="closeJoin()" >&times;</span>
				  							<div class="w3-row w3-cell w3-border w3-border-black">
												<div class="w3-container" style="border-bottom: 1px solid black;">
													<div class="w3-margin">신규 등록</div>
												</div>
												<div class="w3-container">
													<form name="sign" action="user/joinPro" method="post" class="w3-padding-16">
														<div class="w3-section">
															<div class="w3-container">
																<label>* 필수 항목</label>
																<div class="w3-row w3-padding-16">
																	<label>성별 *</label>								
																	<div class="w3-row w3-padding-16">
																		<input type="radio" name="gender" value="남성" checked/>남성
																		<input type="radio" name="gender" value="여성"/>여성
																	</div>
																</div>								
															</div>
														</div>
														<div class="w3-section">
															<div class="w3-container">
																<input name="name" type="text" placeholder="이름 *" class="w3-input w3-border w3-border-black" onchange="checkValue()" />						
																<label id="essential1" class="w3-text-red" style="display: none;">* 필수</label>
															</div>
														</div>
														<div class="w3-section">
															<div class="w3-container w3-margin-top">
																<input name="email" type="email" placeholder="이메일 주소 *" class="w3-input w3-border w3-border-black" onchange="checkValue()"  />								
																<label id="essential2" class="w3-text-red" style="display: none;">* 필수</label>							
															</div>
															<div class="w3-container w3-margin-top">
																<input name="emailcheck" type="email" placeholder="이메일 주소 확인 *" class="w3-input w3-border w3-border-black" onchange="checkValue()" />
																<input type="hidden" name="emailDuplication"/>
															</div>
														</div>
														<div class="w3-section w3-margin-top">
															<div class="w3-container w3-margin-top">								
																<div class="w3-right">
																	<label class="w3-text-grey">(최소 8자 - 최대 15자)</label>
																</div>
																<input name="password" type="password" placeholder="비밀번호 *" class="w3-input w3-border w3-border-black" onchange="checkValue()" />
																<label id="essential3" class="w3-text-red" style="display: none;">* 필수</label>
															</div>
															<div class="w3-container w3-margin-top">
																<input name="passwordcheck" type="password" placeholder="비밀번호 확인 *" class="w3-input w3-border w3-border-black" onchange="checkValue()" />
																<label id="passwordcheck" class="w3-text-red" style="display: none;">* 입력하신 비밀번호가 일치하지 않습니다.</label>
															</div>
														</div>						
														<div class="w3-section w3-center w3-margin">
												    		<button type="submit" class="w3-button w3-border w3-border-black w3-hover-white w3-round-xxlarge w3-margin-top" style="width: 200px;">회원가입</button>
												    	</div>
											    	</form>
												</div>
											</div>
				  						</div>
				  					</div>
				  				</div>
				  			</li>
				  		</ul>
				  	</c:if>
				  	<c:if test="${sessionID!=null }">
				  		<ul class="w3-cell-row w3-margin">
				  			<li class="w3-cell">				  				
				  				<b class="w3-text-white w3-hover-text-white w3-hover-none w3-padding">${member.name} 님</b>				  				
				  			</li>
				  			<c:if test="${sessionNAME!='관리자' }">
				  			<li class="w3-cell">
						    	<button class="w3-button w3-text-white w3-hover-text-white w3-hover-none w3-padding" onclick="showPage()" >My page</button>
				  				<div id="page" class="w3-modal">
				  					<div class="w3-modal-content w3-animate-top" style="width: 600px;">
				  						<div class="w3-row">
				  							<span class="w3-button w3-hover-none w3-display-topright" onclick="closePage()" >&times;</span>
				  							<div class="w3-row w3-border w3-border-black">
												<div class="w3-container" style="border-bottom: 1px solid black;">
													<div class="w3-panel w3-center">
														<span class="w3-text-black">개인정보</span>
													</div>
												</div>
												<div class="w3-container">
													<div class="w3-section">					
														<label>이름 : ${member.name }</label>					
													</div>
													<div class="w3-section">
														<label>이메일 주소 : ${member.email }</label>					
													</div>
													<div class="w3-section">					
														<label>비밀번호 : XXXX</label>					
													</div>
													<div class="w3-section">					
														<label>가입일 : ${member.reg_date }</label>
													</div>
												</div>
												<div class="w3-row w3-center w3-section">
													<button class="w3-button w3-round-xxlarge w3-border w3-border-black w3-white w3-hover-white" onclick="showUpdate()" style="width: 200px;">개인정보 변경</button>
													<div id="update" class="w3-modal">
														<div class="w3-modal-content w3-animate-top" style="width: 600px;">
															<div class="w3-row">
																<span class="w3-button w3-hover-none w3-display-topright" onclick="closeUpdate()" >&times;</span>
																<div class="w3-row w3-border w3-border-black">
																	<div class="w3-container" style="border-bottom: 1px solid black;">						
																		<div class="w3-panel w3-center">
																			<span class="w3-text-black">개인정보 변경</span>
																		</div>
																	</div>
																	<div class="w3-container">
																		<form action="updateinfo" method="post" class="w3-padding-16">
																			<div class="w3-section">
																				<div class="w3-section">
																					<label class="w3-text-grey w3-left">이메일 주소 *</label>							
																					<input name="email" type="email" value="${member.email }" class="w3-input w3-border w3-border-black" readonly />							
																				</div>
																				<div class="w3-section">
																					<label class="w3-text-grey w3-left">이름 *</label>
																					<input name="name" type="text" value="${member.name }" class="w3-input w3-border w3-border-black" />
																				</div>						
																				<div class="w3-section">							
																					<label class="w3-text-grey w3-left">비밀번호 *</label>							
																					<input name="password" type="password" value="${member.password }" class="w3-input w3-border w3-border-black" />
																				</div>
																			</div>
																			<div class="w3-section w3-center">
																				<button type="submit" class="w3-button w3-round-xxlarge w3-border w3-border-black w3-white w3-hover-white" style="width: 200px;">저장</button>
																			</div>
																		</form>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>			
											</div>		
				  						</div>
				  					</div>
				  				</div>
						    </li>
						    </c:if>
							<c:if test="${sessionNAME=='관리자' }">
						    <li class="w3-cell">
						    	<button class="w3-button w3-text-white w3-hover-text-white w3-hover-none w3-padding" onclick="showPage()" >Admin page</button>
				  				<div id="page" class="w3-modal">
				  					<div class="w3-modal-content w3-animate-top" style="width: 855px;">
				  						<div class="w3-row">
				  							<span class="w3-button w3-hover-none w3-display-topright" onclick="closePage()" >&times;</span>
				  							<div class="w3-row w3-border w3-border-black">
												<div class="w3-container" style="border-bottom: 1px solid black;">
													<div class="w3-panel w3-center">
														<span class="w3-text-black">회원 관리</span>
													</div>
												</div>
												<div class="w3-container w3-section" style="overflow: scroll; height: 500px;">
													<table>					
														<tr class="w3-center">
															<th style="width: 20%;">이름</th>
															<th style="width: 5%;">성별</th>
															<th style="width: 20%;">이메일</th>
															<th style="width: 10%;">비밀번호</th>
															<th style="width: 20%;">가입일자</th>
															<th colspan="2" style="width: 25%; border: none; background-color: white;">&nbsp;</th>
														</tr>					
														<c:if test="${memberlist!=null && memberlist.size()>0 }">
														<c:forEach var="member" items="${memberlist }">
														<tr>
															<td>${member.name }</td>
															<td>${member.gender }</td>
															<td>${member.email }</td>
															<td>XXXX</td>
															<td>${member.reg_date }</td>
															<td style="border: none;">
															</td>
															<td style="border: none;">
															<div class="w3-cell-row">
																<div class="w3-cell">						
																	<button class="w3-button w3-round-xxlarge w3-border w3-border-black w3-white w3-hover-white" onclick="showAupdate()" >정보 수정</button>
																	<div id="AdminUpdate" class="w3-modal">
																		<div class="w3-modal-content w3-animate-top">
																			<div class="w3-row">
																				<span class="w3-button w3-hover-none w3-display-topright" onclick="closeAupdate()" >&times;</span>
																				<div class="w3-row w3-border w3-border-black">
																					<div class="w3-container" style="border-bottom: 1px solid black;">						
																						<div class="w3-panel w3-center">
																							<span class="w3-text-black">회원정보 변경</span>
																						</div>
																					</div>
																					<div class="w3-container">
																						<form action="updateinfo" method="post" class="w3-padding-16">
																							<div class="w3-section">
																								<div class="w3-section">
																									<label class="w3-text-grey w3-left">이메일 주소 *</label>
																									<input name="email" type="email" value="${email }" class="w3-input w3-border w3-border-black" readonly />							
																								</div>
																								<div class="w3-section">
																									<label class="w3-text-grey w3-left">이름 *</label>
																									<input name="name" type="text" value="${name }" class="w3-input w3-border w3-border-black" />
																								</div>						
																								<div class="w3-section">							
																									<label class="w3-text-grey w3-left">비밀번호 *</label>							
																									<input name="password" type="password" value="${password }" class="w3-input w3-border w3-border-black" />
																								</div>
																							</div>
																							<div class="w3-section w3-center">
																								<button type="submit" class="w3-button w3-round-xxlarge w3-border w3-border-black w3-white w3-hover-white" style="width: 200px;">저장</button>
																							</div>
																						</form>
																					</div>
																				</div>
																			</div>
																		</div>
																	</div>							
																</div>
																<div class="w3-cell">
																	<form action="deletemember">
																		<input type="hidden" value="${member.email }" name="email" />
																		<button class="w3-button w3-round-xxlarge w3-border w3-border-black w3-white w3-hover-white" >회원 삭제</button>
																	</form>								
																</div>
															</div>
															</td>
														</tr>
														</c:forEach>
														</c:if>
													</table>		
													<c:if test="${memberlist==null && memberlist.size()<=0 }">
													<div class="w3-bar" style="border-bottom: 1px solid black;">
														<div class="w3-container w3-left w3-bar-item">
															회원 정보가 없습니다.
														</div>
													</div>
													</c:if>
												</div>
											</div>
				  						</div>
				  					</div>
				  				</div>
						    </li>
						    </c:if>
				  			<li class="w3-cell">				  				
			  					<button class="w3-button w3-text-white w3-border w3-border-white w3-text-hover-grey w3-hover-white w3-round-large w3-padding" onclick="logout()" >Log out</button>
				  			</li>
				  		</ul>
				  	</c:if>
				  	</div>
				</div>
			</div>
			
			<!-- 검색 -->
			<div id="search" class="w3-container" style="margin: 120px 0;">
				<div class="w3-center">
					<div class="w3-container">
						<form action="movielist/search" class="w3-block w3-bar w3-round-large">							
							<input class="w3-bar-item w3-white w3-border-0" type="text" placeholder="영화 검색" size="80" name="movieNm" style="height: 50px;"/>
							<button class="w3-bar-item w3-button w3-red w3-hover-red w3-border-0" type="submit" style="width:60px; height: 50px;">검색</button>							
						</form>						
					</div>					
				</div>
			</div>
		</div>
		<!-- 이미지 범위 -->
			
		<!-- 컨텐츠 -->
		<div class="w3-cell-row w3-padding-large" style="min-width: 1024px;">
			<!-- 좌측 컨텐츠 -->
			<div class="w3-cell w3-border-right w3-border-grey" style="width: 1010px;">
				<div class="w3-container w3-padding">
					<div class="w3-panel w3-text-red" style="border-bottom: 1px solid lightgrey;">
						<h4>최신 리뷰</h4>					
					</div>
					<c:forEach var="article" items="${articlelist }" begin="0" end="3">					
					<div class="w3-container w3-cell-row w3-margin-top">
						<!-- 프로필 -->
						<div class="w3-container w3-cell w3-left w3-center" style="width: 140px;">
							<a href="movieinfo?movieNm=${article.movieNm }" >
							<input type="hidden" value="${article.movieNm }" name="movieNm" />
								<img alt="poster" src="${article.poster }" width="100" height="150" class="w3-border w3-round w3-hover-border-red">
							</a>
							<span class="w3-small">${article.writer }</span>
						</div>						
						<!-- 리뷰글 -->
						<div class="w3-container w3-cell w3-right w3-padding w3-border w3-hover-border-red w3-round-large" style="width: 800px; height: 480px; max-height: 800px;">
							<div class="w3-bar" style="border-bottom: 1px solid lightgrey;">
								<div class="w3-bar-item w3-large">
									<a href="movieinfo?movieNm=${article.movieNm }" class="w3-hover-border-none">${article.movieNm }</a>
								</div>
								<div class="w3-bar-item" style="padding-top: 10px;">
									<c:if test="${article.moviescore==5 }">
										<img src="../icon/star05.gif" height="15"/>
									</c:if>
									<c:if test="${article.moviescore==4 }">
										<img src="../icon/star04.gif" height="15"/>
									</c:if>
									<c:if test="${article.moviescore==3 }">
										<img src="../icon/star03.gif" height="15"/>
									</c:if>
									<c:if test="${article.moviescore==2 }">
										<img src="../icon/star02.gif" height="15"/>
									</c:if>
									<c:if test="${article.moviescore==1 }">
										<img src="../icon/star01.gif" height="15"/>
									</c:if>
								</div>
							</div>							
							<div class="w3-cell-row w3-padding-small" style="height: 370px; border-bottom: 1px solid lightgrey;">								
								<div class="w3-left" style="height: 300px;">
									<div class="w3-large">
										<a href="reviewdetail?boardnum=${article.boardnum }" class="w3-text-black w3-hover-text-red" style="border-bottom: 1px dotted black; overflow:hidden; text-overflow:ellipsis; white-space: pre-line;" >
											<b>${article.subject }</b>
										</a>
									</div>
									<div style="width: 750px; height: 250px; overflow:hidden; text-overflow:ellipsis; white-space: pre-line; ">
										<h6>${article.content }</h6>
									</div>
								</div>
							</div>
							<div class="w3-row" >
								<button class="w3-button w3-border-0 w3-none w3-hover-none w3-left">
									<img name="like" src="../icon/heart-32.png" class="w3-hover-none">
								</button>
								<button class="w3-button w3-border-0 w3-none w3-hover-none w3-right">
									<img name="wish" src="../icon/pin-32.png" class="w3-hover-none">
								</button>
							</div>
						</div>						
					</div>
					</c:forEach>
				</div>
			</div>
			
			<!-- 우측 컨텐츠 -->
			<div class="w3-cell" style="width: 220px;">
				<!-- 랭킹 -->
				<div class="w3-row w3-padding" style="width: 400px;">
					<div class="w3-panel w3-text-red" style="border-bottom: 1px solid lightgrey;">
						<h6>주간 박스오피스</h6>					
					</div>
					<div class="w3-row">
						<c:if test="${not empty weeklyResult.boxOfficeResult.weeklyBoxOfficeList}">
						<c:forEach items="${weeklyResult.boxOfficeResult.weeklyBoxOfficeList}" var="boxoffice">					
							<div class="w3-row w3-padding-small w3-margin-top" style="border-bottom: 1px solid lightgrey; height: 120px;">
								<div class="w3-cell-row">
									<div class="w3-cell w3-xlarge" style="width: 30px;">
										<b class="w3-row">${boxoffice.rank }</b>
										<c:if test="${boxoffice.rankOldAndNew }">
											<img src="../icon/new.gif" width="30"/>
										</c:if>
									</div>
									<div class="w3-container w3-cell">
										<div class="w3-row w3-text-black w3-large">
											<b>${boxoffice.movieNm }</b>
										</div>
										<div class="w3-row">
											주간 관객수 : ${boxoffice.audiCnt }명
										</div>
										<div class="w3-row">
											누적 관객수 : ${boxoffice.audiAcc }명
										</div>
										<div class="w3-row">
											개봉일 : ${boxoffice.openDt }
										</div>
									</div>
								</div>								
							</div>												
						</c:forEach>
						</c:if>					
					</div>					
				</div>
			</div>
		</div>		
		<div class="w3-container w3-light-grey w3-center w3-padding-large" style="height: 200px; margin-top: 100px;">
			<c:if test="${sessionID == null }">
			<button class="w3-button w3-red w3-large w3-margin-top" onclick="showJoin()" >가입 좀 해주세요</button>
			</c:if>
		</div>		
	</body>
	<script type="text/javascript">
		function goReview(){
			location.href="reviewlist";
		}
		
		function goQnA(){
			location.href="qna";
		}
		
		function goMypage(){
			location.href="user/mypage";
		}
		
		function goAdmin(){
			location.href="admin/manager";
		}
		
		function logout(){
			location.href="user/logout";
		}
		
		function showLogin(){
			document.getElementById('login').style.display='block';
		}
		
		function closeLogin(){
			document.getElementById('login').style.display='none';
		}
		
		function showJoin(){
			document.getElementById('sign').style.display='block';
		}
		
		function closeJoin(){
			document.getElementById('sign').style.display='none';
		}
		
		function showPage(){
			document.getElementById('page').style.display='block';
		}
		
		function closePage(){
			document.getElementById('page').style.display='none';
		}
		function showUpdate(){
			document.getElementById('update').style.display='block';
		}
		
		function closeUpdate(){
			document.getElementById('update').style.display='none';
		}
		function showAupdate(){
			document.getElementById('AdminUpdate').style.display='block';
		}
		
		function closeAupdate(){
			document.getElementById('AdminUpdate').style.display='none';
		}
	</script>
</html>