<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	</head>
	<body>
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
					<button class="w3-button w3-round-xxlarge w3-border w3-border-black w3-white w3-hover-white" onclick="showModal()" style="width: 200px;">회원가입</button>
				</div>
				<div id="join" class="w3-modal">
					<div class="w3-modal-content w3-animate-top" style="width: 370px;">
						<div class="w3-row">
							<span class="w3-button w3-hover-none w3-display-topright" onclick="closeModal()" >&times;</span>
							<jsp:include page="join.jsp"></jsp:include>
						</div>
					</div>
				</div>			
			</div>
		</div>
	</body>
	<script type="text/javascript">
		function showModal(){
			document.getElementById('join').style.display='block';
		}
		
		function closeModal(){
			document.getElementById('join').style.display='none';
		}
	</script>
</html>