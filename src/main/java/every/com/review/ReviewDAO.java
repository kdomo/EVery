package every.com.review;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import every.com.review.ReviewDTO;

@Repository
public class ReviewDAO {
	@Autowired
	private SqlSession session;
	
	/* 댓글 등록 */
	public int insert(ReviewDTO dto) throws Exception{
		return session.insert("reviewMapper.insert", dto);
	}
	
	/* 관리자 페이지 (검색했을 때 그 결과만 가져옴) */
	public List<ReviewDTO> searchByKey(HashMap<String, Object> ranges) throws Exception{
		if(ranges.get("selected").equals("id")) {
			return session.selectList("reviewMapper.searchById", ranges);
		}else {
			return session.selectList("reviewMapper.searchByStation", ranges);
		}
	}
	
	/* 관리자 페이지 전체 댓글 불러오기 */
	public List<ReviewDTO> getAdListAll(HashMap<String, Object> ranges) throws Exception{
		return session.selectList("reviewMapper.getAdListAll", ranges);
	}
	
	/* 전체 댓글 불러오기 */
	public List<ReviewDTO> selectAll(HashMap<String, Object> ranges) throws Exception{
		return session.selectList("reviewMapper.selectAll", ranges);
	}
	
	/* 댓글 삭제 */
	public int delete(int seq_reviewSS) throws Exception{
		return session.delete("reviewMapper.delete", seq_reviewSS);
	}
	
	/* 댓글 수정 */
	public int update(int seq_reviewSS, String review) throws Exception{
		HashMap<String, Object> map = new HashMap<>();
		map.put("seq_reviewSS", seq_reviewSS);
		map.put("review", review);
		return session.update("reviewMapper.update", map);
	}
	
	/* 관리자 페이지 검색에 따른 카운팅 */
	public int searchCountAll(String searchKey, String selected) throws Exception{
		if(selected.equals("id")) {
			return session.selectOne("reviewMapper.idCountAll", searchKey);
		}else {
			return session.selectOne("reviewMapper.stationCountAll", searchKey);
		}
		
	}
	
	/* 관리자 페이지 페이징 전체 카운팅 */
	public int adCountAll() throws Exception{
		return session.selectOne("reviewMapper.adCountAll");
	}
	
	/* 각 충전소 별 페이징 카운팅 */
	public int countAll(String station) throws Exception{
		return session.selectOne("reviewMapper.countAll", station);
	}
}
