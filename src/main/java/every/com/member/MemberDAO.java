package every.com.member;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {

	@Autowired
	private SqlSession session;
	
	// 중복확인(id, nickname, phone)
	public int checkMember(MemberDTO dto) throws Exception {
		return session.selectOne("memberMapper.checkMember", dto);
	}
	
//	// 중복확인(id, nickname, phone)
//	public MemberDTO checkMember(MemberDTO dto) throws Exception {
//		return session.selectOne("memberMapper.checkMember", dto);
//	}
	
	// 일반 회원가입
	public int insertMem(MemberDTO dto) throws Exception {
		return session.insert("memberMapper.insertMem", dto);
	}
	
	// 일반 로그인
	public MemberDTO isLoginOk(MemberDTO dto) throws Exception {
		return session.selectOne("memberMapper.isLoginOk", dto);
	}
	
	// 핸드폰 또는 네이버 고유값으로 해당 사용자 정보 불러오기
	public MemberDTO getMember(MemberDTO dto) throws Exception {
		return session.selectOne("memberMapper.getMember", dto);
	}
	
	// 네이버 로그인 시 이미 가입되어 있는 사용자라면 네이버 고유id값 셋팅
	public int setNaverId(MemberDTO dto) throws Exception {
		return session.update("memberMapper.setNaverId", dto);
	}
	
	// 카카오 로그인 시 이미 가입되어 있는 사용자라면 카카오 고유id값 셋팅
	public int setKakaoId(MemberDTO dto) throws Exception {
		return session.update("memberMapper.setKakaoId", dto);
	}
	
	// 회원 존재 여부
	public int getExistMember(MemberDTO dto) throws Exception {
		return session.selectOne("memberMapper.getExistMember", dto);
	}
	
	// 아이디 찾기
	public MemberDTO getMemberId(String phone) throws Exception {
		return session.selectOne("memberMapper.getMemberId", phone);
	}
	
	// 비밀번호 변경
	public int modifyPw(MemberDTO dto) throws Exception {
		return session.update("memberMapper.modifyPw", dto);
	}
	
	// 회원탈퇴
	public int getMemberWithdrawal(String id) throws Exception {
		return session.delete("memberMapper.getMemberWithdrawal", id);
	}
	
	// 닉네임 변경
	public int modifyNickname(String beforeNickname, String afterNickname) throws Exception {
		Map<String, String> map = new HashMap<>();
		map.put("beforeNickname", beforeNickname);
		map.put("afterNickname", afterNickname);
		return session.update("memberMapper.modifyNickname", map);
	}
		
	// 전화번호 변경
	public int modifyPhone(String beforePhone, String afterPhone) throws Exception {
		Map<String, String> map = new HashMap<>();
		map.put("beforePhone", beforePhone);
		map.put("afterPhone", afterPhone);
		return session.update("memberMapper.modifyPhone", map);
	}
		
	// 닉네임으로 회원정보 불러오기
	public MemberDTO getMemberByNickOrPhone(MemberDTO dto) throws Exception {
		return session.selectOne("memberMapper.getMemberByNickOrPhone", dto);
	}
		
	// 아이디와 비밀번호로 사용자 여부 체크
	public int checkMemberByIdAndPw(String id, String pw) throws Exception {
		Map<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("pw", pw);
		return session.selectOne("memberMapper.checkMemberByIdAndPw", map);
	}
	
	// 모든 회원수 불러오기
	public int countAllMember() throws Exception {
		return session.selectOne("memberMapper.countAllMember");
	}
		
	// 모든 회원 정보 불러오기
	public List<MemberDTO> getMemberList(int startRange, int endRange) throws Exception{
		System.out.println("startRange " + startRange +" endRange "+ endRange );
		Map<String, Integer> map = new HashMap<>();
		map.put("startRange", startRange);
		map.put("endRange", endRange);
		return session.selectList("memberMapper.getMemberList", map);
	}
		
	// 관리자 회원 삭제
	public int deleteMember(String[] userId) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("userId", userId);
		return session.delete("memberMapper.deleteMember", map);
	}
	
	
	/*******************태환 추가***********************/

	
	//컬럼리스트 신청
		public int columnApplication(String id) throws Exception{
			return session.update("memberMapper.columnApplication",id);
	}
		
	//컬럼리스트 신청자 목록 
	public List<MemberDTO> columnList() throws Exception{
		return session.selectList("memberMapper.columnList");
	}
	
	//승인작업
	public int approval(ArrayList<String> list) throws Exception{
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		return session.update("memberMapper.approval",map);
	}
	//거절작업
	public int reject(ArrayList<String> list) throws Exception{
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		return session.update("memberMapper.reject",map);
	}
	
	//권한해제 작업
		public int releaseOfAuthority(ArrayList<String> list) throws Exception{
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("list", list);
			return session.update("memberMapper.reject",map);
		}
	
	//닉네임 가져오기
	public String getNickname(String id) {
		return session.selectOne("memberMapper.getNickname",id);
	}
	
	//dto 가져오기
	public MemberDTO getMemberDTO (String id) {
		return session.selectOne("memberMapper.getMemberDTO",id);
	}
	//칼럼리스트 신청 취소
	public int cancelColumnList(String id) {
		return session.update("memberMapper.cancelColumnList",id);
	}
	
	//컬럼리스트 가져오기 
	public List<MemberDTO> getApprovalColumnList() throws Exception{
		return session.selectList("memberMapper.getApprovalColumnList");
	}
	/***************태환 추가*****************/
}
