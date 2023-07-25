package com.skypay.test.Entity;

import jakarta.persistence.*;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.Date;

@Entity
@Data
@Table(name = "PhysicalCard", uniqueConstraints = @UniqueConstraint(columnNames = "CardNumber"))
public class PhysicalCard {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    @Column(name = "CardNumber")
    private String cardNumber;
    private boolean isEnabled;
    private Date ExperationDate;
    private Date CreationDate;
    private String cvc;
}