package kh.spring.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.interfaces.IStylingService;

@Service
public class StylingServiceImpl implements IStylingService{

	@Autowired
	StylingDAOImpl sdao;
	
}
