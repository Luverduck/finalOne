package com.kh.ahzit.repository;

import java.util.List;

import com.kh.ahzit.entity.AttachmentDto;

public interface AttachmentDao {
	
	// 추상 메소드 - 다음 첨부파일 번호 반환
	public int nextAttachmentNo();

	// 추상 메소드 - 첨부파일 등록
	public void insertAttachment(AttachmentDto attachmentDto);
	
	// 추상 메소드 - 첨부파일 목록
	public List<AttachmentDto> selectList();
	
	// 추상 메소드 - 첨부파일 조회
	public AttachmentDto selectAttachment(int attachmentNo);
	
	// 추상 메소드 - 첨부파일 삭제
	public boolean deleteAttachment(int attachmentNo);
	
	// 추상 메소드 - 자유게시글 첨부파일 등록
	public void insertFreeboardAttachment(int freeboardOriginNo, int freeboardAttachmentNo);
		
	// 추상 메소드 - 자유게시글 원본 번호에 연결된 첨부파일 전체 조회
	public List<AttachmentDto> selectFreeboardAttachment(int freeboardOriginNo);
	
	// 추상 메소드 - 자유게시글 첨부파일 삭제
	public boolean deleteFreeboardAttachment(int freeboardAttachmentNo);

	//공지게시판 첨부파일 관련(notice_attachment_view)
	List<AttachmentDto> selectNoticeAttachmentList(int noticeOriginNo);

  //소모임 프로필 이미지첨부 관련 메소드
	public void ahzitAttachment(int ahzitOriginNo, int ahzitAttachmentNo); //ahzit_attachment 테이블에 첨부파일 정보 연결
  
	//소모임 프로필 원본번호와 연결된 첨부파일 조회
	public List<AttachmentDto> selectAhzitAttachment(int ahzitOriginNo);
	
	//소모임 첨부파일 관련 메소드
	public void ahzitInAttachment(int ahzitInAttachmentNo, int ahzitInMemberNo); //ahzit_in_attachment 테이블에 첨부파일 정보 연결
	
	//소모임 내 멤버 번호와 연결된 첨부파일 조회
	public List<AttachmentDto> selectAhzitInAttachment(int memberAhzitNo);
	
	//소모임 내 첨부파일 삭제
	public boolean deleteAhzitInAttachment(int ahzitInAttachmentNo, int memberAhzitNo); 

	// 1:1 문의 게시판 첨부파일 등록
	public void insertInquireAttachment(int inquireOriginNo, int inquireAttachmentNo);
		
	//  1:1 문의 게시글 원본 번호와 연결된 첨부파일 조회
	public List<AttachmentDto> selectInquireAttachment(int inquireOriginNo);
	
	// 게시글 수정 시 첨부파일 재등록 위한 첨부파일 삭제 
	public boolean deleteInquireAttachment(int inquireAttachmentNo);
	
	//member_attachment 테이블에 첨부파일 정보 연결
	public void memberAttachment(int memberOriginNo, int memberAttachmentNo);

	
	//회원번호(member_no)로 첨부파일 검색(조회)
	public List<AttachmentDto> selectAhzitMemberAttachment(int memberOriginNo);

	// 소모임 프로필 첨부파일 삭제
	boolean deleteAhzitAttachment(int ahzitAttachmentNo);

}
