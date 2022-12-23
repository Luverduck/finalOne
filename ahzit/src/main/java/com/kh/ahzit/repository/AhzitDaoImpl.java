package com.kh.ahzit.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ahzit.entity.AhzitDto;
import com.kh.ahzit.entity.AhzitMemberDto;
import com.kh.ahzit.entity.AhzitUserDto;
import com.kh.ahzit.vo.AhzitMemberInfoRequestVO;
import com.kh.ahzit.vo.AhzitMemberInfoVO;
import com.kh.ahzit.vo.AhzitSearchListRequestVO;
import com.kh.ahzit.vo.AhzitSearchListResponseVO;
import com.kh.ahzit.vo.MyAhzitVO;


@Repository
public class AhzitDaoImpl implements AhzitDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	//소모임 시퀀스번호
	@Override
	public int sequence() {
		return sqlSession.selectOne("ahzit.sequence");
	}
	
	//소모임 등록
	@Override
	public void insert(AhzitDto ahzitDto) {
		sqlSession.insert("ahzit.insert", ahzitDto);
		
	}
	
	//소모임 목록
	@Override
	public List<AhzitDto> selectList() {
		return sqlSession.selectList("ahzit.list");
	}

	//소모임 단일조회
	@Override
	public AhzitDto selectOne(int ahzitNo) {
		return sqlSession.selectOne("ahzit.one", ahzitNo);
	}	
	
	//아지트 수정 메소드
	@Override
	public boolean update(AhzitDto ahzitDto) {
		int count = sqlSession.update("ahzit.update", ahzitDto);
		return count > 0;
	}
	
	//소모임 삭제
  @Override
	public boolean delete(int ahzitNo) {
		int count=sqlSession.delete("ahzit.delete", ahzitNo);
		return count > 0;	

	}

	//아지트생성에 개설자 자동 추가
	@Override
	public void addMember(AhzitMemberDto ahzitMemberDto) {
		Map<String, String> param = new HashMap<>();	
		param.put("memberAhzitNo", String.valueOf(ahzitMemberDto.getMemberAhzitNo()));
		param.put("memberId", ahzitMemberDto.getMemberId());
		param.put("memberNick",ahzitMemberDto.getMemberNick());
		sqlSession.insert("ahzitLeader.insert", ahzitMemberDto);
		
	}
	
	@Override
	public AhzitUserDto selectOne(String userId) {
		return sqlSession.selectOne("ahzitLeader.one", userId);
	}
	
	//아지트가입하기 메소드
	@Override
	public void insertMember(AhzitMemberDto ahzitMemberDto) {
		sqlSession.insert("ahzitMember.insert", ahzitMemberDto);
		
	}

	//아지트 가입자 증가 메소드
	@Override
	public boolean updateAhzitPerson(int ahzitNo) {
		int count = sqlSession.update("ahzitMember.update", ahzitNo);
		return count > 0;
	}

	//ahzit_member 테이블에서 아지트 번호로 count한 결과값을 인원수에 반영
	@Override
	public boolean updateAhzitHead2(int ahzitNo) {
		int count=sqlSession.update("ahzitMember.updateAhzitHead2",ahzitNo);
		return count>0;
	}
	
	@Override//일반회원 아지트(소모임) 탈퇴용 메소드
	public boolean deleteCommonMember(int memberNo) {
		int count=sqlSession.delete("ahzitMember.deleteCommonMember",memberNo);
		return count>0;
	}

	@Override
	public void insertMember2(AhzitMemberDto ahzitMemberDto) {
		sqlSession.insert("ahzitMember.insert2", ahzitMemberDto);
		
	}

	// 추상 메소드 오버라이딩 - 홈 화면 검색창 검색 : 통합 검색
	@Override
	public List<AhzitSearchListRequestVO> selectAhzit(AhzitSearchListRequestVO ahzitSearchListRequestVO) {
		if(ahzitSearchListRequestVO.getKeyword() == null){
			return allAhzit(ahzitSearchListRequestVO);
		}
		else {
			return searchAhzit(ahzitSearchListRequestVO);
		}
	}

	// 추상 메소드 오버라이딩 - 홈 화면 검색창 검색 : 전체 조회(검색어가 없는 경우)
	@Override
	public List<AhzitSearchListRequestVO> allAhzit(AhzitSearchListRequestVO ahzitSearchListRequestVO) {
		Map<String, String> param = new HashMap<>();	
		param.put("rownumStart", String.valueOf(ahzitSearchListRequestVO.rownumStart()));
		param.put("rownumEnd", String.valueOf(ahzitSearchListRequestVO.rownumEnd()));
		return sqlSession.selectList("ahzit.allAhzit", param);
	}
	
	// 추상 메소드 오버라이딩 - 홈 화면 검색창 검색 : 검색 조회(검색어가 있는 경우)
	@Override
	public List<AhzitSearchListRequestVO> searchAhzit(AhzitSearchListRequestVO ahzitSearchListRequestVO) {
		Map<String, String> param = new HashMap<>();	
		param.put("keyword", ahzitSearchListRequestVO.getKeyword());
		param.put("rownumStart", String.valueOf(ahzitSearchListRequestVO.rownumStart()));
		param.put("rownumEnd", String.valueOf(ahzitSearchListRequestVO.rownumEnd()));
		return sqlSession.selectList("ahzit.searchAhzit", param);
	}

	// 추상 메소드 오버라이딩 - 내가 가입한 소모임인지 조회
	@Override
	public boolean alreadyJoin(String userId, int ahzitNo) {
		Map<String, String> param = new HashMap<>();	
		param.put("userId", userId);
		param.put("memberAhzitNo", String.valueOf(ahzitNo));
		Integer isMember = sqlSession.selectOne("ahzit.joinAlready", param);
		if(isMember == null) {
			return false;
		} else {
			if(isMember == 0) {
				return false;
			} else {
				return true;
			}
		}
	}

	// 추상 메소드 오버라이딩 - 소모임 내 회원 통합 조회
	@Override
	public List<AhzitMemberInfoVO> selectMemberInfo(AhzitMemberInfoRequestVO ahzitMemberInfoRequestVO) {
		if(ahzitMemberInfoRequestVO.isSearch()) {
			return searchMemberInfo(ahzitMemberInfoRequestVO);
		}
		else {
			return allMemberInfo(ahzitMemberInfoRequestVO);
		}
	}

	// 추상 메소드 오버라이딩 - 소모임 내 회원 전체 조회
	@Override
	public List<AhzitMemberInfoVO> allMemberInfo(AhzitMemberInfoRequestVO ahzitMemberInfoRequestVO) {
		Map<String, String> param = new HashMap<>();	
		param.put("memberAhzitNo", String.valueOf(ahzitMemberInfoRequestVO.getAhzitNo()));
		param.put("startRow", String.valueOf(ahzitMemberInfoRequestVO.startRow()));
		param.put("endRow", String.valueOf(ahzitMemberInfoRequestVO.endRow()));
		return sqlSession.selectList("ahzit.allMember", param);
	}

	// 추상 메소드 오버라이딩 - 소모임 내 회원 검색 조회
	@Override
	public List<AhzitMemberInfoVO> searchMemberInfo(AhzitMemberInfoRequestVO ahzitMemberInfoRequestVO) {
		Map<String, String> param = new HashMap<>();	
		param.put("memberAhzitNo", String.valueOf(ahzitMemberInfoRequestVO.getAhzitNo()));
		param.put("keyword", ahzitMemberInfoRequestVO.getKeyword());
		param.put("startRow", String.valueOf(ahzitMemberInfoRequestVO.startRow()));
		param.put("endRow", String.valueOf(ahzitMemberInfoRequestVO.endRow()));
		return sqlSession.selectList("ahzit.searchMember", param);
	}
	
	// 추상 메소드 오버라이딩 - 소모임 내 회원수 조회
	@Override
	public int selectMemberCount(AhzitMemberInfoRequestVO ahzitMemberInfoRequestVO) {
		if(ahzitMemberInfoRequestVO.isSearch()) {
			return searchMemberCount(ahzitMemberInfoRequestVO.getAhzitNo(), ahzitMemberInfoRequestVO.getKeyword());
		}
		else {
			return allMemberCount(ahzitMemberInfoRequestVO.getAhzitNo());
		}
	}

	// 추상 메소드 오버라이딩 - 소모임 내 전체 회원수
	@Override
	public int allMemberCount(int ahzitNo) {
		return sqlSession.selectOne("ahzit.countallMember", ahzitNo);
	}

	// 추상 메소드 오버라이딩 - 소모임 내 회원 검색시 회원수
	@Override
	public int searchMemberCount(int ahzitNo, String keyword) {
		Map<String, String> param = new HashMap<>();	
		param.put("memberAhzitNo", String.valueOf(ahzitNo));
		param.put("keyword", keyword);
		return sqlSession.selectOne("ahzit.countsearchMember", param);
	}
	
	// 추상 메소드 - 찾기 페이지에서 소모임 조회
	@Override
	public List<AhzitSearchListResponseVO> selectSortAhzit(AhzitSearchListRequestVO ahzitSearchListRequestVO) {
		if(ahzitSearchListRequestVO.isSearch()) {
			return searchSortAhzit(ahzitSearchListRequestVO);
		}
		else {
			return allSortAhzit(ahzitSearchListRequestVO);
		}
	}
	
	// 추상 메소드 - 찾기 페이지에서 전체 소모임 조회
	@Override
	public List<AhzitSearchListResponseVO> allSortAhzit(AhzitSearchListRequestVO ahzitSearchListRequestVO) {
		Map<String, String> param = new HashMap<>();	
		param.put("rownumStart", String.valueOf(ahzitSearchListRequestVO.rownumStart()));
		param.put("rownumEnd", String.valueOf(ahzitSearchListRequestVO.rownumEnd()));
		return sqlSession.selectList("ahzit.allSort", param);
	}

	// 추상 메소드 - 찾기 페이지에서 특정 카테고리 소모임 조회
	@Override
	public List<AhzitSearchListResponseVO> searchSortAhzit(AhzitSearchListRequestVO ahzitSearchListRequestVO) {
		Map<String, String> param = new HashMap<>();	
		param.put("keyword", ahzitSearchListRequestVO.getKeyword());
		param.put("rownumStart", String.valueOf(ahzitSearchListRequestVO.rownumStart()));
		param.put("rownumEnd", String.valueOf(ahzitSearchListRequestVO.rownumEnd()));
		return sqlSession.selectList("ahzit.searchSort", param);
	}

	// 추상 메소드 오버라이딩 - 찾기 페이지에서 소모임 갯수
	@Override
	public int countselectAhzit(AhzitSearchListRequestVO ahzitSearchListRequestVO) {
		if(ahzitSearchListRequestVO.isSearch()) {
			return coutntSelectAhzit(ahzitSearchListRequestVO);
		} else {
			return countAllAhzit(ahzitSearchListRequestVO);
		}
	}
	
	// 추상 메소드 오버라이딩 - 찾기 페이지에서 전체 소모임 갯수
	@Override
	public int countAllAhzit(AhzitSearchListRequestVO ahzitSearchListRequestVO) {
		return sqlSession.selectOne("ahzit.allCount", ahzitSearchListRequestVO);
	}
	
	// 추상 메소드 오버라이딩 - 찾기 페이지에서 특정 카테고리 소모임 갯수
	@Override
	public int coutntSelectAhzit(AhzitSearchListRequestVO ahzitSearchListRequestVO) {
		return sqlSession.selectOne("ahzit.sortCount", ahzitSearchListRequestVO);
	}


	@Override
	public int searchAhzitCount(AhzitSearchListRequestVO ahzitSearchListRequestVO) {
		return sqlSession.selectOne("ahzit.searchAhzitCount", ahzitSearchListRequestVO);
	}

	@Override
	public List<MyAhzitVO> ahzitHeadCount() {
		return sqlSession.selectList("ahzit.ahzitHeadCount");
	}

	
}
