package com.ncu.project.validation;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;


public class PasswordConstraintValidator implements ConstraintValidator<Password,String>{

	private String regex;
	
	public void initialize(Password pswd) {
		regex =  pswd.value();
	}

	@Override
	public boolean isValid(String value, ConstraintValidatorContext context) {
		
		boolean result = false;
		
		regex = "^(?=.*[0-9])"+"(?=.*[a-z])(?=.*[A-Z])"+"(?=.*[@#$%^&+=])" +"(?=\\S+$).{8,20}$";
		
		Pattern p = Pattern.compile(regex);
		
		if (value.isEmpty()) {
            return result;
        }
		else {
        	Matcher m = p.matcher(value);
        	if(Character.isUpperCase(value.charAt(0)) == true && m.matches() == true) {
        		result=true;
        	}
		}
        return result;
	}

}
