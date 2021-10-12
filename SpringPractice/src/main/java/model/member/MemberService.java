package model.member;

import java.util.List;

public interface MemberService {
	public List<MemberVO> getMemberList();
	public MemberVO getMember(MemberVO vo);
	public void insertMember(MemberVO vo);
	public void updateMember(MemberVO vo);
	public void deleteMember(MemberVO vo);
}
