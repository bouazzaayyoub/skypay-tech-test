package com.skypay.test.Controller;


import com.skypay.test.Entity.Account;
import com.skypay.test.Entity.User;
import com.skypay.test.Service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.nio.file.attribute.UserPrincipalNotFoundException;
import java.util.Optional;
import java.util.UUID;

@RestController
@RequiredArgsConstructor
public class UserController {
    private final UserService userService ;

    @GetMapping("/user/{id}")
    public Optional<User> getUser(@PathVariable UUID id){
       return userService.getUserInfo(id);
    }
    @GetMapping("/account/{id}")
    public Account getAccount(@PathVariable UUID id){
        return userService.getAccountInfo(id);
    }


    @GetMapping("/{id}/addvirtualcard")
    public String createVirtualCard(@PathVariable UUID id) {
        try {
            return userService.createVirtualCard(id);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @DeleteMapping("Delete/{cardnumber}")
    public String deleteCard(@PathVariable String cardnumber){
        return userService.deleteVirtualCard(cardnumber);
    }


    @PutMapping("disablecard/{cardnumber}")
    public String disableCard(@PathVariable String cardnumber){
        return userService.disableCard(cardnumber);
    }
    @PutMapping("enablecard/{cardnumber}")
    public String enableCard(@PathVariable String cardnumber){
        return userService.enableCard(cardnumber);
    }

}
