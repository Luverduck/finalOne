package com.kh.ahzit.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.kh.ahzit.component.RandomGenerator;
import com.kh.ahzit.entity.CertificationDto;
import com.kh.ahzit.repository.CertificationDao;

@Service
public class GmailService implements EmailService {
// GmailService -> EmailServiceImpl 과 동일한 네이밍

	@Autowired
	private RandomGenerator randomGenerator; // 랜덤번호 생성

	@Autowired
	private CertificationDao certificationDao; // DB저장

	@Autowired
	private JavaMailSender javaMailSender; // 메일발송

	@Override
	public void sendCertMail(String email) {
		// 목표 : 1) 랜덤 인증 번호 생성 -> 2) 이메일 발송 -> 3) 데이터베이스 등록 / 주석은 CreateCertTest에 적어놓음

		// 1) 랜덤 인증 번호 생성 수정 구문
		String serial = randomGenerator.generatSerial(6);

		// 2) 이메일 발송
		SimpleMailMessage message = new SimpleMailMessage();
		message.setTo(email);
		message.setSubject("[KH정보교육원] 이메일 인증 번호입니다");
		message.setText("인증번호 : " + serial);
		javaMailSender.send(message);

		// 3) 데이터베이스 등록 수정 구문
		certificationDao.delete(email);
		CertificationDto certificationDto = CertificationDto.builder().certificationId(email).certificationKey(serial).build();
		certificationDao.insert(certificationDto);

	}

	@Override
	public boolean checkCert(CertificationDto certificationDto) {
		if (certificationDao.check(certificationDto)) { // 인증성공시
			certificationDao.delete(certificationDto.getCertificationId());
			return true;
		}
		return false;
	}
}
