<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<script>
	function Idcheck(){
		if (${member.memberId}.value == )
		
	}
	
	function Pwcheck(){
		if(${member.memberPassword}.length < 8 || ${member.memberPassword}.length > 15){
			alert("비밀번호는 8자 이상 15자 미만으로 설정하세요.")
			
		}
	}
</script>
