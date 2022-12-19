package com.kh.ahzit.service;

import java.io.File;
import java.io.IOException;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kh.ahzit.entity.AhzitAttachmentDto;
import com.kh.ahzit.entity.AhzitDto;
import com.kh.ahzit.entity.AhzitMemberDto;
import com.kh.ahzit.entity.AhzitUserDto;
import com.kh.ahzit.entity.AttachmentDto;
import com.kh.ahzit.repository.AhzitDao;
import com.kh.ahzit.repository.AttachmentDao;

@Service
public class AhzitServiceImpl implements AhzitService{
	
	@Autowired
	private AhzitDao ahzitDao;
	
	@Autowired
	private AttachmentDao attachmentDao;
	
	@PostConstruct //최초 실행 시 딱 한번만 실행되는 메소드
	public void prepare() {
		dir.mkdirs();
	}
	
	@Autowired(required=false)
	private AhzitAttachmentDto ahzitAttachmentDto;
	
	private final File dir = new File("D:/upload/kh10f");

	@Override
	public int create(AhzitDto ahzitDto, AhzitMemberDto ahzitMemberDto, MultipartFile attachment, String memberId) throws IllegalStateException, IOException {
		//번호 미리 생성
		int ahzitNo = ahzitDao.sequence();
		ahzitDto.setAhzitNo(ahzitNo);
		
		//개설
		ahzitDao.insert(ahzitDto);
		
		//개설 후 파일이 있다면 
		//해당 파일을 등록(attachment) & 저장 
		//& 연결
		//- 첨부파일이 없어도 리스트에는 1개의 객체가 들어있음 -> isEmpty()로 검사
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
			
			//연결 테이블에 연결정보저장(아지트번호, 첨부파일번호)
			attachmentDao.ahzitAttachment(ahzitNo, attachmentNo);
		}
		
		AhzitUserDto userDto = ahzitDao.selectOne(memberId);
		
		ahzitMemberDto.setMemberAhzitNo(ahzitNo);
		ahzitMemberDto.setMemberId(memberId);
		ahzitMemberDto.setMemberNick(userDto.getUserNick());
		ahzitDao.addMember(ahzitMemberDto);
		
		return ahzitNo;
	}

}
