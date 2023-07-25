package com.skypay.test.Entity;

import lombok.Data;
import jakarta.persistence.*;
import java.util.Date;
import java.util.List;

@Entity
@Data
public class Account {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Column(unique = true)
    private long rib;
    private long accountNumber;
    private Date creationDate;
    private boolean isActive;
    private String agencyAddress;
    @OneToOne
    private PhysicalCard physicalcard;
    @OneToMany
    private List<VirtualCard> virtualCards;
}
