package com.kh.ahzit.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ahzit.entity.AttachmentDto;

@Repository
public class AttachmentDaoImpl implements AttachmentDao {
	
	// 의존성 주입
	@Autowired
	private SqlSession sqlSession;

	// 추상 메소드 오버라이딩 - 다음 첨부파일 번호 반환
	@Override
	public int nextAttachmentNo() {
		return sqlSession.selectOne("attachment.nextAttachmentNo");
	}
	
	// 추상 메소드 오버라이딩 - 첨부파일 등록
	@Override
	public void insertAttachment(AttachmentDto attachmentDto) {
		sqlSession.insert("attachment.insertAttachment", attachmentDto);
	}
	
	// 추상 메소드 오버라이딩 - 첨부파일 목록
	@Override
	public List<AttachmentDto> selectList() {
		return sqlSession.selectList("attachment.selectAttachmentList");
	}	
	
	// 추상 메소드 오버라이딩 - 첨부파일 조회
	@Override
	public AttachmentDto selectAttachment(int attachmentNo) {
		// 첨부파일 번호로 첨부파일 조회 후 결과 반환
		return sqlSession.selectOne("attachment.selectAttachment", attachmentNo);
	}
	
	// 추상 메소드 오버라이딩 - 첨부파일 삭제
	@Override
	public boolean deleteAttachment(int attachmentNo) {
		// 첨부파일 번호로 첨부파일 정보 삭제 후 결과 반환
		return sqlSession.delete("attachment.deleteAttachment", attachmentNo) > 0;
	}
	
	// 추상 메소드 오버라이딩 - 자유게시글 첨부파일 등록
	@Override
	public void insertFreeboardAttachment(int freeboardOriginNo, int freeboardAttachmentNo) {
		// 바인딩 변수로 사용할 Map 생성
		Map<String, String> param = new HashMap<>();
		// 생성한 Map의 type과 keyword를 freeboardListSeachVO의 type과 keyword로 설정
		param.put("freeboardOriginNo", String.valueOf(freeboardOriginNo));
		param.put("freeboardAttachmentNo", String.valueOf(freeboardAttachmentNo));
		sqlSession.insert("attachment.insertFreeboardAttachment", param);
	}

	// 추상 메소드 오버라이딩 - 자유게시글 원본 번호에 연결된 첨부파일 전체 조회
	@Override
	public List<AttachmentDto> selectFreeboardAttachment(int freeboardOriginNo) {
		// 해당 게시글 번호로 첨부파일 전체 조회 후 결과 반환
		return sqlSession.selectList("attachment.selectFreeboardAttachment", freeboardOriginNo);
	}

	// 추상 메소드 - 자유게시글 첨부파일 삭제
	@Override
	public boolean deleteFreeboardAttachment(int freeboardAttachmentNo) {
		// 해당 첨부파일 번호로 자유게시글 첨부파일 정보 삭제 후 결과 반환
		return sqlSession.delete("attachment.deleteFreeboardAttachment", freeboardAttachmentNo) > 0;
	}

	//소모임 프로필
	@Override
	public void ahzitAttachment(int ahzitOriginNo, int ahzitAttachmentNo) {
		Map<String, String> param = new HashMap<>();

		param.put("ahzitOriginNo", String.valueOf(ahzitOriginNo));
		param.put("ahzitAttachmentNo", String.valueOf(ahzitAttachmentNo));
		sqlSession.insert("attachment.insertAhzitAttachment", param);
	}

	//소모임 프로필 조회 후 결과 반환
	@Override
	public List<AttachmentDto> selectAhzitAttachment(int ahzitOriginNo) {
		//소모임 번호로 첨부파일 전체 조회 후 결과 반환
		return sqlSession.selectList("attachment.selectAhzitAttachment", ahzitOriginNo);
	}
	

	@Override
	public void insertInquireAttachment(int inquireOriginNo, int inquireAttachmentNo) {
		Map<String, String> param = new HashMap<>();
		// 생성한 Map의 type과 keyword를 freeboardListSeachVO의 type과 keyword로 설정
		param.put("inquireOriginNo", String.valueOf(inquireOriginNo));
		param.put("inquireAttachmentNo", String.valueOf(inquireAttachmentNo));
		sqlSession.insert("attachment.insertInquireAttachment", param);
			}

	@Override
	public List<AttachmentDto> selectInquireAttachment(int inquireOriginNo) {
		// 해당 게시글 번호로 첨부파일 전체 조회 후 결과 반환
				return sqlSession.selectList("attachment.selectInquireAttachment", inquireOriginNo);
			}

	@Override
	public boolean deleteInquireAttachment(int inquireAttachmentNo) {
	// 해당 첨부파일 번호로 자유게시글 첨부파일 정보 삭제 후 결과 반환
		return sqlSession.delete("attachment.deleteInquireAttachment", inquireAttachmentNo) > 0;
		}

	//아지트 첨부파일
	@Override
	public void ahzitInAttachment(int ahzitInAttachmentNo, int ahzitInMemberNo) {
		Map<String, String> param = new HashMap<>();
		
		param.put("ahzitInAttachmentNo", String.valueOf(ahzitInAttachmentNo));
		param.put("ahzitInMemberNo", String.valueOf(ahzitInMemberNo));
		sqlSession.insert("attachment.InsertAhzitInAttachment", param);
		
	}

	//아지트 첨부파일 조회
	@Override
	public List<AttachmentDto> selectAhzitInAttachment(int memberAhzitNo) {
		return sqlSession.selectList("attachment.selectAhzitInAttachment",  memberAhzitNo);
	}

}
