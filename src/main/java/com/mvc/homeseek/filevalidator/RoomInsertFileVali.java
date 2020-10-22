package com.mvc.homeseek.filevalidator;

import org.springframework.stereotype.Service;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.mvc.homeseek.model.dto.RoomFileDto;

@Service
public class RoomInsertFileVali implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		
		
		return false;
	}

	@Override
	public void validate(Object target, Errors errors) {
		
		RoomFileDto fileDto = (RoomFileDto) target;
		if(fileDto.getRoom_file().getSize() == 0) {
			errors.rejectValue("room_file", "File Empty", "파일을 선택해주세요");
		}
	}

}
