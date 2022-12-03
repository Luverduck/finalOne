package com.kh.ahzit.repository;

import com.kh.ahzit.entity.CertificationDto;

public interface CertificationDao {
	
	void insert(CertificationDto certificationDto);
	boolean check(CertificationDto certificationDto);
	boolean delete(String certificationId);
	void clear();
}