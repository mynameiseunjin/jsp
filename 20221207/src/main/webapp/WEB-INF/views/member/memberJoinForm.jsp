<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<div>
			<h1>회 원 가 입</h1>
		</div>
		<div>
			<form id="frm" action="memberJoin.do" onsubmit="return formCheck()"
				method="post">
				<div>
					<table border="1">
						<tr>
							<th width="150">아이디</th>
							<td width="300"><input type="text" id="memberId"
								name="memberId"> &nbsp; <!--&nbsp; : 공백주기 -->
								<button type="button" onclick="idChk()" id="btnId" value="No">중복체크</button>
							</td>
						</tr>
						<tr>
							<th width="150">이름</th>
							<td><input type="text" id="memberName" name="memberName"
								required="required"> <!--required="required" 필수로 작성해야 하는것  -->
							</td>
						</tr>
						<tr>
							<th width="150">패스워드</th>
							<td><input type="password" id="memberPassword"
								name="memberPassword" required="required"></td>
						</tr>
						<tr>
							<th width="150">패스워드확인</th>
							<td><input type="password" id="passwordChk"
								required="required"></td>
						</tr>
						<tr>
							<th width="150">나이</th>
							<td><input type="text" id="memberAge" name="memberAge">
							</td>
						</tr>
						<tr>
							<th width="150">주소</th>
							<td><input type="text" id="memberAddress"
								name="memberAddress"></td>
						</tr>
						<tr>
							<th width="150">전화번호</th>
							<td><input type="tel" id="memberTel" name="memberTel">
							</td>
						</tr>
					</table>
				</div>
				<br> <input type="submit" value="회원가입">&nbsp;&nbsp; <input
					type="reset" value="취소">&nbsp;&nbsp; <input type="button"
					onclick="location.href='main.do'" value="홈가기">
			</form>
		</div>
	</div>
	<script type="text/javascript">
		function formCheck() {  //아이디 중복체크 및 패스워드 동일성 확인 , 만약에 클릭시 넘어가지 않는다면 아래의 formCheck를 확인해봐라.
			let pass1 = document.getElementById("memberPassword").value;
			let pass2 = document.getElementById("passwordChk").value;
			let checkId = document.getElementById("btnId").value;
			
			
			if(checkId == "No"){
				alert("아이디 중복체크를 하세요!");
				return false;
			}
			
			if(pass1 != pass2){
				alert("패스워드가 일치하지 않습니다!")
				document.getElementById("memberPassword").value="";
				document.getElementById("passwordChk").value="";
				document.getElementById("memberPassword").focus();
				return false;
			}
				return true;
		}
		function idChk() {//아이디 중복체크Ajax로 비교
			let id=document.getElementById("memberId").value;
			let url='AjaxMemberIdCheck.do?id='+id;
			fetch(url)
			.then((response)=>response.text())
			.then((data)=>idCheck(data));
		}
		
		function idCheck(str){
			if(str == '1'){
				alert("사용할 수 있는 아이디 입니다.");
				document.getElementById("btnId").value='yes';
				document.getElementById("btnId").disabled=true; //중복체크 후 비활성화.
			}else{
				alert("이미 사용중인 아이디 입니다. \n 다시 입력하세요.");
				document.getElementById("memberId").value=""; //1)value로 클리어시키고
				document.getElementById("memberId").focus(); //2)focus 처리
			}
		}  //run as에서 오류가 난다면 f12를 누르고 elements에서 마우스모양을 클릭해서 오류를 찾아라.
	</script>
</body>
</html>