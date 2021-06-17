package com.ncu.project.validation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;
import javax.validation.Constraint;
import javax.validation.Payload;

@Constraint(validatedBy = PasswordConstraintValidator.class)
@Target({ElementType.METHOD,ElementType.FIELD})
@Retention(RetentionPolicy.RUNTIME)
public @interface Password {

	// define default value
	public String value() default "null";
		
	// define default message
	public String message() default "Enter valid Password ";
		
	// define default groups
	public Class<?>[] groups() default {};
		
	// define default payloads
	public Class<? extends Payload>[] payload() default {};

}
