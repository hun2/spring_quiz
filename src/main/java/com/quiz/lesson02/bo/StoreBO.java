package com.quiz.lesson02.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson02.dao.StoreDAO;
import com.quiz.lesson02.model.Store;

@Service
public class StoreBO {

	//순번 16, 레파지토리를 객체 소환 (의존성 주입이라고 일컫)
	
	@Autowired
	private StoreDAO storeDAO; // Dao 객체소환
	
	
	//순번 4-9 서비스 클래스 생성 후 service 어노테이션 붙여준다.
	//순번 5, 서비스 객체 생성할때  보통 관례적으로 get을 붙여줌.
	//순번 6, 서비스 객체는 다시 레파지토리한테 db를 요청함.
	//순번 7, 레파지토리를 만들러간다.
	public List<Store> getStoreList(){
		
		// 순번 17, 레파지토리 매소드 리턴해준다.
		return storeDAO.selectStoreList();
	}
	
	
}
