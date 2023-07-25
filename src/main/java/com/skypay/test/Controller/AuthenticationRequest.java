package com.skypay.test.Controller;

import lombok.Data;

@Data
public class AuthenticationRequest {
    private String phone;
    private String password;
}
