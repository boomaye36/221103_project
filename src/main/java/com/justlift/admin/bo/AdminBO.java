package com.justlift.admin.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.justlift.admin.dao.AdminDAO;
import com.justlift.common.FileManagerService;

@Service
public class AdminBO {
	@Autowired
	private AdminDAO adminDAO;
	@Autowired
	private FileManagerService fileManagerService;
	public int addGym(String name, int categoryId, String location, String phoneNumber, String introduce, double rank, MultipartFile file) {
		String imagePath = null;
		if (file != null) {
			imagePath = fileManagerService.saveFile( file);
		}
		return adminDAO.insertGym(name, categoryId, location, phoneNumber, introduce, rank, imagePath);
	}
	
	public int addTrainer(String name, int gymId,  String phoneNumber, String introduce, double rank, MultipartFile file) {
		String imagePath = null;
		if (file != null) {
			imagePath = fileManagerService.saveFile( file);
		}
		return adminDAO.insertTrainer(name, gymId, phoneNumber, introduce, rank, imagePath);
	}

	public int addGoods(String name, String category, int price, MultipartFile file) {
		String imagePath = null;

		if (file != null) {
			imagePath = fileManagerService.saveFile( file);
		}
		return adminDAO.insertGoods(name, category, price, imagePath);
	}
}
