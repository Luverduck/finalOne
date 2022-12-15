package com.kh.ahzit.service;

import java.io.File;
import java.io.IOException;

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
	
	
	
}
