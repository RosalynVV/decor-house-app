package com.project.decorhouse.services;

import com.project.decorhouse.model.Product;
import com.project.decorhouse.repository.ProductRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductService {

    private final ProductRepository productRepository;

    // Inyección por constructor
    public ProductService(ProductRepository productRepository) {
        this.productRepository = productRepository;
    }

    public List<Product> getAllProducts() {
        return productRepository.findAll();
    }

    // Puedes agregar más métodos si necesitas crear, actualizar, borrar productos
}
