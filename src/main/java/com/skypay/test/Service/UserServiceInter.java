package com.skypay.test.Service;

import com.skypay.test.Entity.Account;
import com.skypay.test.Entity.User;

import java.util.Optional;
import java.util.UUID;

public interface UserServiceInter {
    Optional<User> getUserInfo(UUID id);
    Account getAccountInfo(UUID id);
    String enableCard(String cardNumber);
    String disableCard(String cardNumber);
    String createVirtualCard(UUID id);
    String deleteVirtualCard(String cardNumber);
}
