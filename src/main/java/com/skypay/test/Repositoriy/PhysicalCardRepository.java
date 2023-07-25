package com.skypay.test.Repositoriy;

import com.skypay.test.Entity.PhysicalCard;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PhysicalCardRepository extends JpaRepository<PhysicalCard, Long> {
     PhysicalCard findByCardNumber(String cardNumber);
}
