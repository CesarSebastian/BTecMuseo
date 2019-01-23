<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>BTecMuseos CDMX</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="../CSS/estilos.css">
		<link rel="stylesheet" type="text/css" media="all" href="../css/sala.css" />
	</head>
    <body>
	<div id="cuerpo">
        <header id="cabezera">			
			&nbsp &nbsp &nbsp <a href="index.html"> <img src="../imagenes/BTecMuseo.png" class="zoom"> </a>			          
			<nav>			
			<ul class="menu"> 			
				<li><a href="../index.html">Pagina de inicio</a></li>
				<li><a href="#">Exposiciones</a></li>
				<li><a href="salaVirtual.html">Sala virtual</a></li>
				<li><a href="visita.php">Visita Guiada</a></li>							
				<li><a href="buscarMuseo.php">Buscar Museo</a></li>				
										
			<form class="formulario">				
				&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp
			</form>
			</ul>
		</nav>
        </header>				       
        <section id="seccion">
			<?php
				include('../Administrador/Php/conexionBd.php');
				$con = new conexionBd();		 																		
				$museo = mysqli_query($con->conectar(),'SELECT * FROM museos') or die("Problemas en la consulta");
			?>
				<p class="titulos">Lista de Museo</p>
				<form method="POST">
					<select name="museo">
						<?php
							while( $reg = mysqli_fetch_array($museo) ) {
								echo"
								<option value='" .  $reg['id_museo']. mb_convert_encoding ($reg['nombre_museo'] , "UTF-8") ."'>".  mb_convert_encoding ( $reg['nombre_museo'], 'UTF-8') ."</option>
								";
							}
						?>
					</select>
					<input type="submit" name="aceptar" value="Aceptar">
				</form>
				
			<?php
				if( isset($_REQUEST['aceptar'] ) ) {
					$nombre = substr( $_REQUEST['museo'], 4 );
					$id = substr( $_REQUEST['museo'], 0, 4 );
					$sala = mysqli_query($con->conectar(), 'SELECT * FROM salasexhibicion s, detallessalasexhibicion d 
											WHERE s.id_exhibicion = d.id_detallesSalasExhibicion 
											AND d.Museos_id_museo = "' . $id .'" ; ') or die("Problemas en la consulta de salas");
										
					 echo'			
					 <p class = "titulos">' . $nombre . ' </p> ';?>
					 <div class="contenedor_grupo">                
						 <div class="contenido">              
							 <div id="contenido_galeria">
							<?php
								$i = 0;																
								foreach ($sala as $entrada) {
									$ruta = substr( $entrada['imagen'], 3);
									echo'
									 <div id="'.$i++.'">
										 <img src="'.$ruta.'"/>	
										 <p class = "tituloSala"> '. $entrada["nombre_exhibicion"] .'</p>
										 <p class = "contenidoSala"> '.$entrada["descripcion_exhibicion"] .'</p>
									 </div>
									';		
								}
							?>
							 </div><!-- fin div contenido-galeria -->

							 <div class="jMyCarousel">
								 <ul>
									<?php
										$j = 0;
										foreach ($sala as $entrada) {
											$ruta = substr( $entrada['imagen'], 3);
											echo'																																
											<li><a href="#'.$j++.'"><img src="'.$ruta.'" alt="Salas" width="160" height="133" /></a></li>									 
											';
										}
									?>
								 </ul>
							 </div><!-- Fin div jMyCarousel -->
						</div><!-- Fin div contenido -->
					 </div>					 					
			<?php   }	
				$con->cerrar();
			?>
				<script type="text/javascript" src="../Administrador/js/jquery.js"></script>
				<script type="text/javascript" src="../Administrador/js/jMyCarousel.min.js"></script>
					<script type="text/javascript">
					  $(document).ready(function() {
						$(".jMyCarousel").jMyCarousel({ // Script de los Thumbnails
						visible: "100%",
						eltByElt: true
						});
						$(".jMyCarousel img").fadeTo(100, 0.6);
						$(".jMyCarousel a img").hover(
						function(){ //mouse over
						  $(this).fadeTo(400, 1);
						},
						function(){ //mouse out
						  $(this).fadeTo(400, 0.6);
						});
						});
					</script>
					<script type="text/javascript">
					  $(document).ready(function(){ // Script de la Galeria
					  $("#contenido_galeria div").css("position", "absolute").not(":first").hide();
					  $("#contenido_galeria div:first").addClass("aqui");
					  $(".jMyCarousel a").click(function(){
						$("#contenido_galeria div.aqui").fadeOut(400);
						$("#contenido_galeria div").removeClass("aqui").filter(this.hash).fadeIn(400).addClass("aqui");
						return false;
					  });
					  });
					</script>
					
        </section>
        
		<aside id="columna">
            <a href="drone.html" class="img">
                <img src="../imagenes/Drone.png">
            </a>
            <a href="visita.php" class="img">
                <img src="../imagenes/guia.png">
            </a>
        </aside>
		
        <footer id="pie">
            <h3>Derechos reservados &COPY;</h3>
            <a href="Administrador/InicioSesion.php"><h5>Administrador</h5></a>
        </footer>
	</div>
    </body>
</html>
