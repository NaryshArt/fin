package org.finProject.entity;

import jakarta.persistence.*;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Table(name = "icons")
@Entity
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Getter
public class Icon {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Setter
    @Column(nullable = false)
    private String name;

    @Setter
    @Column(nullable = false)
    private String code;

    public Icon(String name, String code) {
        this.name = name;
        this.code = code;
    }
}
