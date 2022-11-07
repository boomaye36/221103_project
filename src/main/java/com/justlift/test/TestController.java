package com.justlift.test;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.justlift.test.dao.TestDAO;



@Controller
@ResponseBody
public class TestController {

    @RequestMapping("/help")
    public String helloWorld() {
        return "test/test";
    }
	@RequestMapping("/jsp")
	public String jspTest() {
		return "test/test";
	}	
	
	@Autowired
	private TestDAO testdao;
	@RequestMapping("/database")
	public List<Map<String, Object>> databaseTest() {
		return testdao.selectTestList();
	}
}
