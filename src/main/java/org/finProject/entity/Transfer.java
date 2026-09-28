package org.finProject.entity;

import jakarta.persistence.*;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.math.BigDecimal;
import java.time.LocalDateTime;

@Table(name = "transfers")
@Entity
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Getter
public class Transfer {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "pay_method_from_id", nullable = false)
    private PaymentMethod payMethodFrom;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "pay_method_to_id", nullable = false)
    private PaymentMethod payMethodTo;

    @Column(nullable = false, precision = 12, scale = 2)
    private BigDecimal sum;

    @Column(nullable = false)
    private LocalDateTime transferDate = LocalDateTime.now();

    public Transfer(PaymentMethod payMethodFromId, PaymentMethod payMethodToId, BigDecimal sum, LocalDateTime transferDate) {
        this.payMethodFrom = payMethodFromId;
        this.payMethodTo = payMethodToId;
        this.sum = sum;
        this.transferDate = transferDate;
    }
}
