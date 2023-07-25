package com.skypay.test.Repositoriy;

import com.skypay.test.Entity.VirtualCard;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface VirtualCardRepository extends JpaRepository<VirtualCard, Long> {
     void deleteByCardNumber(String CardNumber);

    VirtualCard findByCardNumber(String cardNumber);
}
