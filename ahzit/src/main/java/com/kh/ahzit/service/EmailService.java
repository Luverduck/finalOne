package com.kh.ahzit.service;

import com.kh.ahzit.entity.CertificationDto;

public interface EmailService {

	void sendCertMail(String email);
	boolean checkCert(CertificationDto certificationDto);
}
