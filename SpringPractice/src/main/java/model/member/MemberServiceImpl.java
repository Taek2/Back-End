package model.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("memberService")
public class MemberServiceImpl implements MemberService{

	@Autowired
	MemberDAO memberDAO;
	
	@Override
	public List<MemberVO> getMemberList() {
		// TODO Auto-generated method stub
		return memberDAO.getMemberList();
	}

	@Override
	public MemberVO getMember(MemberVO vo) {
		return memberDAO.getMember(vo);
	}

	@Override
	public void insertMember(MemberVO vo) {
		memberDAO.insertMember(vo);	
	}

	@Override
	public void updateMember(MemberVO vo) {
		memberDAO.updateMember(vo);	
	}

	@Override
	public void deleteMember(MemberVO vo) {
		memberDAO.deleteMember(vo);	
	}

}
