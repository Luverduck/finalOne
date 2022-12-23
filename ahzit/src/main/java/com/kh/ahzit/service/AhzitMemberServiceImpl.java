package com.kh.ahzit.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;


import com.kh.ahzit.entity.AhzitMemberDto;
import com.kh.ahzit.entity.AttachmentDto;
import com.kh.ahzit.entity.MemberAttachmentDto;
import com.kh.ahzit.repository.AhzitDao;
import com.kh.ahzit.repository.AhzitMemberDao;
import com.kh.ahzit.repository.AttachmentDao;

@Service
public class AhzitMemberServiceImpl implements AhzitMemberService {

	@Autowired
	private AhzitMemberDao ahzitMemberDao;
	
	@Autowired
	private AhzitDao ahzitDao;
	
	@Autowired
	private AttachmentDao attachmentDao;
	
	
	@PostConstruct
	public void prepare() {
		dir.mkdirs();
	}
	
	@Autowired(required=false)
	private MemberAttachmentDto memberAttachmentDto;
	
	private final File dir = new File("D:/upload/kh10f");
	
	
	
	
	@Override
	public void insert(AhzitMemberDto ahzitMemberDto, MultipartFile attachment) throws IllegalStateException, IOException {
		int memberNo=ahzitMemberDao.sequence();//member_no 시퀀스 발행
		ahzitMemberDto.setMemberNo(memberNo);
		ahzitDao.insertMember2(ahzitMemberDto);//소모임 가입
		ahzitDao.updateAhzitHead2(ahzitMemberDto.getMemberAhzitNo());//소모임 인원수 반영
		if(!attachment.isEmpty()) {
			//DB등록
			int attachmentNo = attachmentDao.nextAttachmentNo();
			attachmentDao.insertAttachment(AttachmentDto.builder()
					.attachmentNo(attachmentNo)
					.attachmentName(attachment.getOriginalFilename())
					.attachmentType(attachment.getContentType())
					.attachmentSize(attachment.getSize())
				.build());
			
			// 디렉토리 생성
			dir.mkdirs();
			
			//파일저장
			File target = new File(dir, String.valueOf(attachmentNo));
			//저장 하위경로 설정
			attachment.transferTo(target);
			
			//연결 테이블에 연결정보저장(회원번호, 첨부파일번호)
			attachmentDao.memberAttachment(memberNo, attachmentNo);
		}
		
		
		
		
		
	}


	@Override
	public void uploadProfile(AhzitMemberDto ahzitMemberDto, MultipartFile attachment) throws IllegalStateException, IOException {
		int memberNo=ahzitMemberDto.getMemberNo();
		// member_no 회원번호로 member_attachment, attachment 조인한 테이블에서 검색
		List <AttachmentDto> memberAttachmentList=attachmentDao.selectAhzitMemberAttachment(memberNo);
		
		if(!attachment.isEmpty()) {//첨부파일이 입력됨
			if(memberAttachmentList != null && !memberAttachmentList.isEmpty()) {//프로필 이미지가 등록되어 있을 경우
				//기존 첨부파일 삭제
				for(AttachmentDto attachmentDto : memberAttachmentList) {
					// attachmentDto에서 첨부파일 번호를 반환
					int attachmentNo = attachmentDto.getAttachmentNo();
					// 첨부파일 정보 삭제
					attachmentDao.deleteAttachment(attachmentNo);
					// 자유게시판 첨부파일 정보 삭제
					//attachmentDao.deleteFreeboardAttachment(attachmentNo);
					// 삭제할 첨부파일명 반환
					String fileName = String.valueOf(attachmentDto.getAttachmentNo());
					// 삭제할 첨부파일 경로 설정
					File target = new File(dir, fileName);
					// 첨부파일 삭제
					target.delete();
				}
			}
			
			//기존 파일을 지운 뒤 새로 입력한 첨부파일을 DB등록
			int attachmentNo2 = attachmentDao.nextAttachmentNo();
			attachmentDao.insertAttachment(AttachmentDto.builder()
					.attachmentNo(attachmentNo2)
					.attachmentName(attachment.getOriginalFilename())
					.attachmentType(attachment.getContentType())
					.attachmentSize(attachment.getSize())
				.build());
			
			// 디렉토리 생성
			dir.mkdirs();
			
			//파일저장
			File target = new File(dir, String.valueOf(attachmentNo2));
			//저장 하위경로 설정
			attachment.transferTo(target);
			
			//연결 테이블에 연결정보저장(회원번호, 첨부파일번호)
			attachmentDao.memberAttachment(memberNo, attachmentNo2);
			
		}
		else {
			return;//첨부파일 입력을 건드리지 않을 경우. 삭제, 입력 아무것도 하지 않고 메소드 종료.
		}
		
	}
	
	
	
}
