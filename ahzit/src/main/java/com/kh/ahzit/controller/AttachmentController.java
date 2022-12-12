package com.kh.ahzit.controller;

import java.io.File;
import java.io.IOException;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kh.ahzit.entity.AttachmentDto;
import com.kh.ahzit.error.TargetNotFoundException;
import com.kh.ahzit.repository.AttachmentDao;

@RestController
@RequestMapping("/attachment")
public class AttachmentController {

	// 의존성 주입
	@Autowired
	private AttachmentDao attachmentDao;
	
	// 자유게시판 첨부파일 다운로드 Mapping
	@GetMapping("/download/freeboard")
	public ResponseEntity<ByteArrayResource> downloadFreeboard(@RequestParam int attachmentNo) throws IOException {
		// 첨부파일 번호로 첨부파일 조회
		AttachmentDto attachmentDto = attachmentDao.selectAttachment(attachmentNo);
		// 조회 결과가 없는 경우 404 에러 반환
		if(attachmentDto == null) return ResponseEntity.notFound().build();
		// 조회 결과가 있는 경우
		// 첨부파일 다운로드 상위경로 설정
		File directory = new File("D:/upload/kh10f/freeboardAttachment");
		// 디렉토리 생성
		directory.mkdirs();
		// 첨부파일 다운로드 하위경로 설정
		File target = new File(directory, String.valueOf(attachmentNo));
		// File의 경로를 byte 배열로 읽기
		byte[] data = FileUtils.readFileToByteArray(target);
		// byte 배열로 ByteArrayInputStream 생성
		ByteArrayResource resource = new ByteArrayResource(data);
		// ResponseEntity 반환
		// - HTTP Response Header에 내용물의 인코딩 방식, 길이, 배치 방식, resource의 형식 정보를 반환
		// - HTTP Response Body에 ByteArrayResource 포함
		return ResponseEntity.ok()
				.header("Content-Encoding", "UTF-8")
				.header("Content-Length", String.valueOf(attachmentDto.getAttachmentSize()))
				.header("Content-Disposition", "attachment; filename=" + attachmentDto.getAttachmentName())
				.header("Content-Type", attachmentDto.getAttachmentType())
				.body(resource);
	}
	

	@GetMapping("/download/ahzit")
	public ResponseEntity<ByteArrayResource> downloadAhzit(@RequestParam int attachmentNo) throws IOException {
		//파일탐색
		AttachmentDto attachmentDto = attachmentDao.selectAttachment(attachmentNo);
		if(attachmentDto == null) return ResponseEntity.notFound().build();
		
		//파일생성위치
		File directory = new File("D:/upload/kh10f");
		//디렉토리 생성
		directory.mkdirs();
		
		//파일 불러오기
    File target = new File(directory, String.valueOf(attachmentNo));
		byte[] data = FileUtils.readFileToByteArray(target);
		ByteArrayResource resource = new ByteArrayResource(data);
    
    return  ResponseEntity.ok()
				.header("Content-Encoding", "UTF-8")
				.header("Content-Length", String.valueOf(attachmentDto.getAttachmentSize()))
				.header("Content-Disposition", "attachment; filename=" + attachmentDto.getAttachmentName())
				.header("Content-Type", attachmentDto.getAttachmentType())
				.body(resource);
	}

	@GetMapping("/download/inquire")
	public ResponseEntity<ByteArrayResource> downloadInquire(@RequestParam int attachmentNo) throws IOException{
		// 파일 탐색(DB)
		AttachmentDto attachmentDto = attachmentDao.selectAttachment(attachmentNo);
		if(attachmentDto == null) {//파일이 없으면
			throw new TargetNotFoundException("존재하지 않는 파일");
		}
		
		// 파일 생성 위치
		File directory = new File("D:/upload/kh10f/inquireAttachment");
		// 디렉토리 생성
		directory.mkdirs();
		
		// 파일 불러오기
		File target = new File(directory, String.valueOf(attachmentNo));
		byte[] data = FileUtils.readFileToByteArray(target);
		ByteArrayResource resource = new ByteArrayResource(data);
		
		// 응답 객체를 만들어 데이터를 전송
		return ResponseEntity.ok()
				.header("Content-Encoding", "UTF-8")
				.header("Content-Length", String.valueOf(attachmentDto.getAttachmentSize()))
				.header("Content-Disposition", "attachment; filename=" + attachmentDto.getAttachmentName())
				.header("Content-Type", attachmentDto.getAttachmentType())
				.body(resource);
	}
	
	@GetMapping("/download")
	public ResponseEntity<ByteArrayResource> download(@RequestParam int attachmentNo) throws IOException{
		// 파일 탐색(DB)
		AttachmentDto attachmentDto = attachmentDao.selectAttachment(attachmentNo);
		if(attachmentDto == null) {//파일이 없으면
			throw new TargetNotFoundException("존재하지 않는 파일");
		}
		
		// 파일 생성 위치
		File directory = new File("D:/upload/kh10f");
		// 디렉토리 생성
		directory.mkdirs();
		
		// 파일 불러오기
		File target = new File(directory, String.valueOf(attachmentNo));
		byte[] data = FileUtils.readFileToByteArray(target);
		ByteArrayResource resource = new ByteArrayResource(data);
		
		// 응답 객체를 만들어 데이터를 전송
		return ResponseEntity.ok()
				.header("Content-Encoding", "UTF-8")
				.header("Content-Length", String.valueOf(attachmentDto.getAttachmentSize()))
				.header("Content-Disposition", "attachment; filename=" + attachmentDto.getAttachmentName())
				.header("Content-Type", attachmentDto.getAttachmentType())
				.body(resource);
	}

}
