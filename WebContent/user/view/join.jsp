<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=3">		
	</head>
	<body>		
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
	</body>
	<script type="text/javascript">			
		function checkValue(){
			var form=document.sign;
			
			if(!form.name.value){
				show('essential1');
			}else{
				hide('essential1');
			}
			
			
			if(!form.email.value){
				show('essential2');
			}else{
				hide('essential2');
			}		
			
			if(!form.password.value){
				show('essential3');
			}else{
				hide('essential3');
			}
			
			if(form.password.value == "" || form.password.value==null){
				hide('passwordcheck');
			}
			
			if(form.passwordcheck.value==null || form.passwordcheck.value==""){
				hide('passwordcheck');
			}
			
			if(form.password.value == form.passwordcheck.value){
				hide('passwordcheck');
			}else{
				show('passwordcheck');
			}
			
			function show(id){
				document.getElementById(id).style.display='block';
			}
			
			function hide(id){
				document.getElementById(id).style.display='none';
			}
		}
	</script>
</html>