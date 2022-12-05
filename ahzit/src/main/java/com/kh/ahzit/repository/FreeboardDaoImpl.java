package com.kh.ahzit.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ahzit.entity.FreeboardDto;
import com.kh.ahzit.vo.FreeboardListSeachVO;

@Repository
public class FreeboardDaoImpl implements FreeboardDao {

	// 의존성 주입
	@Autowired
	private SqlSession sqlSession;

	// 추상 메소드 오버라이딩 - 등록할 게시글 번호 반환
	@Override
	public int nextFreeboardNo() {
		return sqlSession.selectOne("freeboard.nextFreeboardNo");
	}

	// 추상 메소드 오버라이딩 - 자유게시글 등록
	@Override
	public void insertFreeboard(FreeboardDto freeboardDto) {
		// 게시글 등록
		sqlSession.insert("freeboard.insert", freeboardDto);
	}

	// 추상 메소드 오버라이딩 - 자유게시글 조회
	@Override
	public List<FreeboardDto> searchFreeboard(FreeboardListSeachVO freeboardListSeachVO) {
		// 검색 조회인지 판정
		boolean isSearch = freeboardListSeachVO.isSearch();
		if(isSearch) { // 검색 조회일 경우
			return selectSearch(freeboardListSeachVO); // 검색 조회 메소드 결과 반환
		}
		else { // 검색 조회가 아닐 경우(전체 조회일 경우)
			return selectAll(freeboardListSeachVO); // 전체 조회 메소드 결과 반환
		}
	}
	
	// 추상 메소드 오버라이딩 - 자유게시글 검색 조회
	@Override
	public List<FreeboardDto> selectSearch(FreeboardListSeachVO freeboardListSeachVO) {
		// 바인딩 변수를 저장할 Map 생성
		Map<String, String> param = new HashMap<>();
		// 바인딩 변수로 사용할 값 저장
		param.put("type", freeboardListSeachVO.getType());
		param.put("keyword", freeboardListSeachVO.getKeyword());
		param.put("rownumStart", String.valueOf(freeboardListSeachVO.rownumStart()));
		param.put("rownumEnd", String.valueOf(freeboardListSeachVO.rownumEnd()));
		// Map을 바인딩 변수로 하여 검색 조회 후 결과 반환
		return sqlSession.selectList("freeboard.searchList", param);
	}
	
	// 추상 메소드 오버라이딩 - 자유게시글 전체 조회
	@Override
	public List<FreeboardDto> selectAll(FreeboardListSeachVO freeboardListSeachVO) {
		// 바인딩 변수를 저장할 Map 생성
		Map<String, String> param = new HashMap<>();
		// 바인딩 변수로 사용할 값 저장
		param.put("rownumStart", String.valueOf(freeboardListSeachVO.rownumStart()));
		param.put("rownumEnd", String.valueOf(freeboardListSeachVO.rownumEnd()));
		// 게시글 전체 조회 후 결과 반환
		return sqlSession.selectList("freeboard.allList", param);
	}
	
	// 추상 메소드 오버라이딩 - 자유게시글 게시글 총 갯수 반환
	@Override
	public int countFreeboard(FreeboardListSeachVO freeboardListSeachVO) {
		// 검색 조회인지 여부에 따라 다른 메소드 실행
		if(freeboardListSeachVO.isSearch()) { // 검색 조회라면
			return searchCountFreeboard(freeboardListSeachVO);
		}
		else { // 전체 조회라면
			return allCountFreeboard();
		}
	}
	
	// 추상 메소드 오버라이딩 - 자유게시글 검색 조회시 게시글 총 갯수 반환
	@Override
	public int searchCountFreeboard(FreeboardListSeachVO freeboardListSeachVO) {
		// 바인딩 변수를 저장할 Map 생성
		Map<String, String> param = new HashMap<>();
		// 바인딩 변수로 사용할 값 저장
		param.put("type", freeboardListSeachVO.getType());
		param.put("keyword", freeboardListSeachVO.getKeyword());
		return sqlSession.selectOne("freeboard.searchCount", param);
	}
	
	// 추상 메소드 오버라이딩 - 자유게시글 전체 조회시 게시글 총 갯수 반환
	@Override
	public int allCountFreeboard() {
		return sqlSession.selectOne("freeboard.allCount");
	}
	
	// 추상 메소드 오버라이딩 - 자유게시글 상세 조회
	@Override
	public FreeboardDto detailFreeboard(int freeboardNo) {
		// 게시글 단일 조회 후 결과 반환
		return sqlSession.selectOne("freeboard.detail", freeboardNo);
	}
	
	// 추상 메소드 오버라이딩 - 조회수 증가
	@Override
	public void updateFreeboardRead(int freeboardNo) {
		// 조회수 증가
		sqlSession.update("freeboard.updateRead", freeboardNo);
	}
	
	// 추상 메소드 오버라이딩 - 자유게시글 수정
	@Override
	public boolean updateFreeboard(FreeboardDto freeboardDto) {
		// 게시글 수정 성공 여부 반환
		return sqlSession.update("freeboard.update", freeboardDto) > 0;
	}

	// 추상 메소드 오버라이딩 - 자유게시글 비활성화
	@Override
	public boolean inactiveFreeboard(int freeboardNo) {
		// 게시글 비활성화 성공 여부 반환
		return sqlSession.update("freeboard.inactive", freeboardNo) > 0;
	}

	// 추상 메소드 오버라이딩 - 자유게시글 삭제
	@Override
	public boolean deleteFreeboard(int freeboardNo) {
		// 게시글 삭제 성공 여부 반환
		return sqlSession.delete("freeboard.delete", freeboardNo) > 0;
	}
}
