package com.skypay.test.Service;

import com.skypay.test.Entity.*;
import com.skypay.test.Repositoriy.AccountRepository;
import com.skypay.test.Repositoriy.PhysicalCardRepository;
import com.skypay.test.Repositoriy.UserRepository;
import com.skypay.test.Repositoriy.VirtualCardRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jakarta.transaction.Transactional;

import java.nio.file.attribute.UserPrincipalNotFoundException;
import java.time.LocalDate;
import java.util.*;

@Transactional
@Service
@RequiredArgsConstructor
public class UserService implements UserServiceInter{
    private final AccountRepository accountRepository;
    private final UserRepository userRepository;
    private final VirtualCardRepository virtualCardRepository;
    private final PhysicalCardRepository physicalCardRepository;


    public Optional<User> getUserInfo(UUID id){
        return userRepository.findById(id);
    }

    public Account getAccountInfo(UUID id) {
        User user = userRepository.findById(id).orElse(null);
        if (user == null) {
            return null;
        } else {
            return user.getAccount();
        }
    }

    public String enableCard(String cardNumber){
        VirtualCard card = virtualCardRepository.findByCardNumber(cardNumber);
        if (card == null){
            PhysicalCard card1 = physicalCardRepository.findByCardNumber(cardNumber);
            if (card1 == null) {
                return "Card does not exist ";
            }
            else {
                card1.setEnabled(true);
                physicalCardRepository.save(card1);
                return "Card is now enabled";
            }
        }
        else{
            card.setEnabled(true);
            virtualCardRepository.save(card);
            return "Card is now enabled";
        }
    }

    public String disableCard(String cardNumber){
        VirtualCard card = virtualCardRepository.findByCardNumber(cardNumber);
        if (card == null){
            PhysicalCard card1 = physicalCardRepository.findByCardNumber(cardNumber);
            if (card1 == null) {
                return "Card does not exist ";
            }
            else {
                card1.setEnabled(false);
                physicalCardRepository.save(card1);
                return "Card is now disabled";
            }
        }
        else{
            card.setEnabled(false);
            virtualCardRepository.save(card);
            return "Card is now disabled";
        }
    }
    public String createVirtualCard(UUID id){
        VirtualCard virtualCard = new VirtualCard();

        Calendar calendar = Calendar.getInstance();
        calendar.add(Calendar.YEAR, 5);

        Random random = new Random();
        int randomNum = random.nextInt(1000);
        String cvc = String.format("%03d", randomNum);

        virtualCard.setCvc(cvc);
        virtualCard.setCreationDate(new Date());
        virtualCard.setExperationDate(calendar.getTime());
        virtualCard.setEnabled(true);


        StringBuilder sb = new StringBuilder();
        do {
            for (int i = 0; i < 16; i++) {
                int digit = random.nextInt(10);
                sb.append(digit);
            }
            if(virtualCardRepository.findByCardNumber(sb.toString()) != null){
               sb.setLength(0);
            }

        }while (sb.length() == 0);

        virtualCard.setCardNumber(sb.toString());
        virtualCard.setAccount(userRepository.findById(id).get().getAccount());
        virtualCardRepository.save(virtualCard);
        return "Generated";



    }
    public String deleteVirtualCard(String cardNumber){
        virtualCardRepository.deleteByCardNumber(cardNumber);
        return "Card deleted successfully";
    }
}