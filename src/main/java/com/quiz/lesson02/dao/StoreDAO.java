package com.quiz.lesson02.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.quiz.lesson02.model.Store;


//인터페이스로 만드는이유는 다형성 때문에.
@Repository
public interface StoreDAO {
	
	
	//순번 8, 레파지토리는 반드시 인터페이스로 생성
	//순번 9, 레파지토리 어노테이션 달아준다.
	//순번 10, 객체 생성시 select를 관례적으로 붙여준다.
	//순번 11, 레파지토리는 db서버에 직접적으로 셀렉트를 한다.
	// 순번 12, db서버 매핑하러 mapper로 간다.
	public List<Store> selectStoreList();
	
}
