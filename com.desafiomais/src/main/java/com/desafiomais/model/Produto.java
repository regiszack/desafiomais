package com.desafiomais.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


@Entity(name="produto")
public class Produto implements Serializable {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id_produto;
	private String nm_produto;
	private String desc_produto;
	@Temporal(TemporalType.TIMESTAMP)
	private Date dt_cadastro;
	private String imagem;
	
	public Produto(){}
	
	public Produto(String nm_produto, String desc_produto, String imagem, Date dt_cadastro) {
		super();
		this.nm_produto = nm_produto;
		this.desc_produto = desc_produto;
		this.dt_cadastro = dt_cadastro;
		this.imagem = imagem;
	}

	public int getId_produto() {
		return id_produto;
	}
	public void setId_produto(int id_produto) {
		this.id_produto = id_produto;
	}
	public String getNm_produto() {
		return nm_produto;
	}
	public void setNm_produto(String nm_produto) {
		this.nm_produto = nm_produto;
	}
	public String getDesc_produto() {
		return desc_produto;
	}
	public void setDesc_produto(String desc_produto) {
		this.desc_produto = desc_produto;
	}
	public Date getDt_cadastro() {
		return dt_cadastro;
	}
	public void setDt_cadastro(Date dt_cadastro) {
		this.dt_cadastro = dt_cadastro;
	}
	public String getImagem() {
		return imagem;
	}
	public void setImagem(String imagem) {
		this.imagem = imagem;
	}
	
	@Override
	public String toString() {
		return "Produto [id_produto=" + id_produto + ", nm_produto=" + nm_produto + ", desc_produto=" + desc_produto
				+ ", dt_cadastro=" + dt_cadastro + ", imagem=" + imagem + "]";
	}
	
	
	
}
