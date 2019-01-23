<!DOCTYPE html>
<html>
    <head>
        <title>BTecMuseos CDMX</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="../Administrador/css/estilos.css">   		
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
				<li><a href="#">Visita Guiada</a></li>							
				<li><a href="buscarMuseo.php">Buscar Museo</a></li>																
			</ul>
		</nav>
        </header>				       
       <section id="seccion">		
			<article class="inicio">	
			<?php
				include('../Administrador/Php/conexionBd.php');
				$con = new conexionBd();
				$idioma = mysqli_query($con->conectar(),'SELECT * FROM idiomas') or die("Problemas en la consulta");				 
				$museo = mysqli_query($con->conectar(),'SELECT nombre_museo,id_museo FROM museos') or die("Problemas en la consulta");											
			?>			
            <p class="titulos">En esta seccion puedes registrar una visita guiada para el museo que tu desees</p><hr />
            <div class="contenedorFrom"><br />
			<form method="POST" >			
				<p>Nombre(s)</p>
					<input type="text" name="nombre" required autofocus />
				<p>Numero de visitantes</p>
					<input type="number" name="visitantes" min="5" max="20" placeholder="Se requieren minimo 5 personas y maximo 20" required />
				<p>Fecha de la Visita</p>
					<input type="date" name="fecha" required min="<?php echo date("Y-m-d");?>" max="2016-08-01" title="Ingresa una fecha valida" />
				<p>Hora</p>
					<input type="time" name="hora" min="09:00:00" max="18:00:00 value="09:00:00" step="1" required />
				<p>Idioma</p>
				<select name="idioma">
					<?php
							while( $reg = mysqli_fetch_array($idioma) ){
								echo'<option value ="'.$reg['nombre'].'">'.$reg['nombre'].'</option>';
							}
					?>
				</select>
				<p>Museo</p>
				<select name="museo" >
						<?php
							while( $reg = mysqli_fetch_array($museo) ){
								echo'<option value ="'.$reg['id_museo'].'">'.$reg['id_museo'].' - '.$reg['nombre_museo'].'</option>';
							}
						?>
				</select>								
            </div>	
			<input type="submit" value="Aceptar" name="aceptar">
			<input type="button" value="Regresar" onclick="history.back()">			
			</form>
			</article>
			<?php							
				if( isset($_REQUEST["aceptar"]) ){																														
					include('../Administrador/Php/Visita/Visita.php');					
					$llamar = new Visita();					
					$idMuseo = substr($_REQUEST['museo'], 0, 4);										
					header("Location:../Administrador/paginas/registroVisitaEncargado.php?nombre=".$_REQUEST['nombre']."&museo=".$_REQUEST['museo']."&visitantes=".$_REQUEST['visitantes']."&fecha=".$_REQUEST['fecha']."&hora=".$_REQUEST['hora']."&idioma=".$_REQUEST['idioma']);
				}
			?>
        </section>
        <footer id="pie">
            <h3>Derechos reservados &COPY;</h3>
            <a href="../Administrador/InicioSesion.php"><h5>Administrador</h5></a>
        </footer>
	</div>		
    </body>
</html><