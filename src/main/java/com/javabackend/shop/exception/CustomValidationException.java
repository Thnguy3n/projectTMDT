package com.javabackend.shop.exception;

public class CustomValidationException extends RuntimeException{
    private final String fieldName;
    private final String message;

    public CustomValidationException(String fieldName, String message) {
        super(message);
        this.fieldName = fieldName;
        this.message = message;
    }

    public String getFieldName() {
        return fieldName;
    }

    @Override
    public String getMessage() {
        return message;
    }
}
