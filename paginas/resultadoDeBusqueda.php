<!DOCTYPE html>
<html>
    <head>
        <title>BTecMuseos CDMX</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="../css/estilos.css">   		
	</head>
    <body>
	<div id="cuerpo">
        <header id="cabezera">			
			&nbsp &nbsp &nbsp <a href="../index.html"> <img src="../imagenes/BTecMuseo.png" class="zoom"> </a>			          
			<nav>			
			<ul class="menu"> 			
				<li><a href="../index.html">Pagina de inicio</a></li>
				<li><a href="exposiciones.php">Exposiciones</a></li>
				<li><a href="salaVirtual.html">Sala virtual</a></li>
				<li><a href="visita.php">Visita Guiada</a></li>							
				<li><a href="buscarMuseo.php">Buscar Museo</a></li>				
										
			<form action="archivo.php" class="formulario">				
				&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp
				<input type="text" class="inputBusc" placeholder="  Buscar Museo">
				<button type="submit" class="botonBusc"><img src="../imagenes/search.png"></button>
			</form>	
			</ul>
		</nav>
        </header>				       
        <section id="seccion">			
			<h3>Resultados de Búsqueda</h3><br />			
        </section>
        
		<aside id="columna">
            <ul>
                <li>
					<a href="drone.html" class="img">
						<img src="../imagenes/Drone.png">
					</a>
                </li>
				<a href="visita.php" class="img">
					<img src="../imagenes/guia.png">
				</a>
            </ul>
        </aside>
		
        <footer id="pie">
            <h3>Derechos reservados &COPY;</h3>
            <a href="../Administrador/InicioSesion.php"><h5>Administrador</h5></a>
        </footer>
	</div>		
    </body>
</html>