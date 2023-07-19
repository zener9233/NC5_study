package com.Boardpractice.Board.entiity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.time.LocalDateTime;

@AllArgsConstructor
@Data
@NoArgsConstructor
@Entity
public class Board {

        @Id
        @GeneratedValue(strategy = GenerationType.IDENTITY)
        private Long boardId;

        @Column(nullable = false, length = 100)
        private String BoradTitle;
        @Column(nullable = false, length = 500)
        private String boardContent;

        @Column(nullable = false)
        private String boardWriter;

        private LocalDateTime boardRegDate = LocalDateTime.now();

        private int boardView = 0;


}
