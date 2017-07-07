<!DOCTYPE html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Lista de Producoes JIvan">
    <meta name="author" content="Regis Zack">  
    
    <title>Lista de Produtos | Home</title>
    <link href="static/css/bootstrap.min.css" rel="stylesheet">
        
    <!--[if lt IE 9]>
		<script src="static/js/html5shiv.min.js"></script>
		<script src="static/js/respond.min.js"></script>
	<![endif]-->
</head>
<style>
img{
	width:30px;		
	heigth:30px;
	}
#logo{
	width:300px;		
	heigth:50px;
	}
#menu{
	border-color: #169dd8;
	background-color: #169dd8;
	}
</style>
<body>

	<c:choose>
		<c:when test="${mode == 'MODE_HOME'}">
			<div role="navigation">
				<div id="menu" class="navbar navbar-inverse">
					<a href="/" class="navbar-brand" style="color: #000;">Desafio MAiS</a>
					<div class="navbar-collapse collapse">
						<ul class="nav navbar-nav">
							<li><a href="produtos" style="color: #000;">Logar</a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="container text-center" id="produtoDiv">
				<a href="http://www.maispartners.com/"><img id="logo" src="http://www.maispartners.com/wp-content/uploads/2016/06/logo-mais-slogan-horizontal-433x64.png"/></a>
				<h3>Produtos</h3>
				<hr>
				<div>
					<table id="myTable" class="table table-striped table-bordered text-left">
						<thead>
							<tr>
								<th style="width: 30px;">Id</th>
								<th>Imagem</th>
								<th>Nome</th>
								<th>Descrição</th>
								<th style="width: 150px;">Data</th>
							</tr>
						</thead>
						<tbody >
							<c:forEach var="produto" items="${produtos}">
								<tr>
									<td>${produto.id_produto}</td>
									<td><img src="${produto.imagem}"/></td>
									<td>${produto.nm_produto}</td>
									<td>${produto.desc_produto}</td>
									<td><fmt:formatDate pattern="dd-MM-yyyy HH:mm:ss" value="${produto.dt_cadastro}"/></td>
									</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</c:when>
		<c:when test="${mode == 'MODE_PRODUTOS'}">
			<div role="navigation">
				<div id="menu" class="navbar navbar-inverse">
					<a href="/produtos" class="navbar-brand" style="color: #000;">Desafio MAiS</a>
					<div class="navbar-collapse collapse">
						<ul class="nav navbar-nav">
							<li><a href="novo-produto" style="color: #000;">Novo Produto</a></li>
							<li><a href="produtos" style="color: #000;">Produtos</a></li>
							<li><a href="https://mail.google.com/mail/u/0/?logout&hl=en" style="color: #000;">Sair</a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="container text-center" id="produtoDiv">
				<a href="http://www.maispartners.com/"><img id="logo" src="static/images/logo-mais.png"/></a>
				<h3>Produtos</h3>
				<hr>
				<div>
					<table  id="myTable" class="table table-striped table-bordered text-left">
						<thead>
							<tr>
								<th style="width: 30px;">Id</th>
								<th>Imagem</th>
								<th>Nome</th>
								<th>Descrição</th>
								<th style="width: 150px;">Data</th>
								<th style="width: 30px;">Editar</th>
								<th style="width: 30px;">Deletar</th>
							</tr>
						</thead>
						<tbody >
							<c:forEach var="produto" items="${produtos}">
								<tr>
									<td>${produto.id_produto}</td>
									<td><img src="${produto.imagem}"/></td>
									<td>${produto.nm_produto}</td>
									<td>${produto.desc_produto}</td>
									<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${produto.dt_cadastro}"/></td>
									<td><a href="editar-produto?id_produto=${produto.id_produto}"><span class="glyphicon glyphicon-pencil"></span></a></td>
									<td><a href="deletar-produto?id_produto=${produto.id_produto}"><span class="glyphicon glyphicon-trash"></span></a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</c:when>
		<c:when test="${mode == 'MODE_NOVO' || mode == 'MODE_EDITAR'}">
			<div class="container text-center">
				<h3>Adicionar/Editar Produto</h3>
				<hr>
				<form class="form-horizontal" method="GET" action="salvar-produto">
					<input type="hidden" name="id_produto" value="${produto.id_produto}"/>
					<div class="form-group">
						<label class="control-label col-md-3">Nome</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="nm_produto" value="${produto.nm_produto}"/>
						</div>				
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Descrição</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="desc_produto" value="${produto.desc_produto}"/>
						</div>				
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Imagem</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="imagem" value="${produto.imagem}"/>
						</div>				
					</div>		
					<div class="form-group">
						<input type="submit" class="btn btn-primary" value="Salvar"/>
						<a href="/produtos"><input type="button" class="btn btn-primary" value="Voltar"/></a>
					</div>
				</form>
			</div>
		</c:when>		
	</c:choose>
	<script src="https://apis.google.com/js/platform.js" async defer></script>
	<script src="static/js/jquery.js"></script>    
    <script src="static/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="static/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="static/js/dataTables.bootstrap.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function() {
        $('#myTable').DataTable( {
            "language": {
                "lengthMenu": "Mostrando _MENU_ linhas por página",
                "zeroRecords": "Nenhum produto encontrado!!",
                "info": "Mostrando pagina _PAGE_ de _PAGES_",
                "infoEmpty": "Nenhum registro encontrado",
                "infoFiltered": "(Filtrado de _MAX_ registros totais.)",
                "search": "Busca:",
                "paginate": {
                    "first":      "Primeiro",
                    "last":       "Último",
                    "next":       "Próximo",
                    "previous":   "Anterior"
                }
            }
        } );
    } );
    </script>
    <script>
    	
    
    </script>
    </body>
</html>
