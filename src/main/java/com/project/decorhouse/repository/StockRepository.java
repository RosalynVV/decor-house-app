package com.project.decorhouse.repository;

import com.project.decorhouse.model.Product;
import com.project.decorhouse.model.Stock;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface StockRepository extends JpaRepository<Stock, Long> {
    Optional<Stock> findByProduct(Product product);
}
