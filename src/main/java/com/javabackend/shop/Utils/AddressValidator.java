package com.javabackend.shop.Utils;

public class AddressValidator {
    public static String extractDetailAddress(String fullAddress) {
        if (fullAddress == null || fullAddress.trim().isEmpty()) {
            throw new IllegalArgumentException("Địa chỉ không được để trống!");
        }
        int firstCommaIndex = fullAddress.indexOf(',');
        if (firstCommaIndex == -1) {
            return fullAddress.trim();
        }
        return fullAddress.substring(0, firstCommaIndex).trim();
    }

    public static boolean isValidDetailAddress(String detailAddress) {
        return detailAddress.matches("^\\d+[A-Za-z]?[\\s\\-/]*\\s+.*");
    }
}
