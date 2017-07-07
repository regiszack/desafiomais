package com.desafiomais.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;

import com.desafiomais.model.Produto;
import com.desafiomais.service.ProdutoService;

@Controller
public class MainController {
	
	@Autowired
	private ProdutoService produtoService;
	
	@GetMapping("/")
	public String home(HttpServletRequest request){
		request.setAttribute("produtos",produtoService.findAll());
		request.setAttribute("mode","MODE_HOME");
		return "index";
	}
	@GetMapping("/produtos")
	public String todosProduto(HttpServletRequest request){
		request.setAttribute("produtos",produtoService.findAll());
		request.setAttribute("mode","MODE_PRODUTOS");
		return "index";
	}
	@GetMapping("/novo-produto")
	public String novoProduto(HttpServletRequest request){
		request.setAttribute("mode","MODE_NOVO");
		return "index";
	}
	
	@GetMapping("/salvar-produto")
	public String salvarProduto(@ModelAttribute Produto produto, BindingResult bindingResult, HttpServletRequest request){
		produto.setDt_cadastro(new Date());
		produtoService.salvarProduto(produto);
		request.setAttribute("produtos",produtoService.findAll());
		request.setAttribute("mode","MODE_PRODUTOS");
		return "index";
	}
	
	@GetMapping("/editar-produto")
	public String editarProduto(@RequestParam int id_produto, HttpServletRequest request){
		request.setAttribute("produto",produtoService.getProduto(id_produto));
		request.setAttribute("mode","MODE_EDITAR");
		return "index";
	}
	@GetMapping("/deletar-produto")
	public String deletarProduto(@RequestParam int id_produto, HttpServletRequest request){
		produtoService.deletarProduto(id_produto);
		request.setAttribute("produtos",produtoService.findAll());
		request.setAttribute("mode","MODE_PRODUTOS");
		return "index";
	}
}
