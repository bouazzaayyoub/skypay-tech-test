package com.skypay.test.Entity;

import lombok.Data;
import lombok.EqualsAndHashCode;

import jakarta.persistence.*;
import java.util.Date;


@Entity
@Data
@Table(name = "VirtualCard", uniqueConstraints = @UniqueConstraint(columnNames = "CardNumber"))
public class VirtualCard {

    @Id
    @GeneratedValue
    private Long id;

    @Column(name = "CardNumber")
    private String cardNumber;
    private boolean isEnabled;
    private Date ExperationDate;
    private Date CreationDate;
    private String cvc;
    @ManyToOne
    private Account account;

}
