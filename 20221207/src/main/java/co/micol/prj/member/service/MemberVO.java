package co.micol.prj.member.service;

import lombok.Getter;
import lombok.Setter;

//DTO 
@Setter  //getter,setter를 만들때 source 들어가서 만들었는데 이렇게 만들면 밑에 코드 안써도됨.
@Getter
public class MemberVO {
	private String memberId;
	private String memberName;
	private String memberPassword;
	private int memberAge;
	private String memberAddress;
	private String memberTel;
	private String memberAuthor;
}
