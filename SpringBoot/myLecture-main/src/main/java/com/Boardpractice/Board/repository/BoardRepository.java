package com.Boardpractice.Board.repository;

import com.Boardpractice.Board.entiity.Board;
import org.springframework.data.jpa.repository.JpaRepository;

public interface BoardRepository extends JpaRepository<Board, Long> {

}
