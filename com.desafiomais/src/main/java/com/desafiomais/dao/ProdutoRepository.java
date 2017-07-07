package com.desafiomais.dao;

import org.springframework.data.repository.CrudRepository;

import com.desafiomais.model.Produto;

public interface ProdutoRepository extends CrudRepository<Produto, Integer>{

}
