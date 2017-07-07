package com.desafiomais.service;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.desafiomais.dao.ProdutoRepository;
import com.desafiomais.model.Produto;

@Service
@Transactional
public class ProdutoService {

	private final ProdutoRepository produtoRepository;
	
	public ProdutoService(ProdutoRepository produtoRepository){
		this.produtoRepository = produtoRepository;
	}
	
	public List<Produto> findAll(){
		List<Produto> produtos = new ArrayList<>();
		for(Produto produto : produtoRepository.findAll()){
			produtos.add(produto);
		}
		return produtos;
	}
	
	public Produto getProduto(int id_produto){
		return produtoRepository.findOne(id_produto);
	}
		
	public void salvarProduto(Produto produto){
		produtoRepository.save(produto);
	}
	
	public void deletarProduto(int id_produto){
		produtoRepository.delete(id_produto);
	}
	
}
