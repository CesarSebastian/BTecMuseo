<!DOCTYPE html>
<html>
    <head>
        <title>BTecMuseos CDMX</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="../css/estilos.css">   		
		<style>
			img {width: 100px; height: 100px; border-radius: 15px;}			
			.imagenB{width: 150px; height: 150px; margin-left: 100px;  margin-top: 10px; border-radius: 15px; border: solid black;}
			table{width: 500px; text-align: justify; margin: auto;}
			th{font-size: 20pt; text-align: justify;}
			.fieldset1 { margin: auto; width:600px; border:4px double #0080FF;border-radius: 10px;box-shadow: 8px 8px 6px #808080;background-color: #DFF8F5;
						padding: 5px; font-family: Verdana, Geneva, sans-serif;color: #0B173B; margin-top:40px; margin-bottom:5px;
			}
			.legend1 { border:4px double #0080FF; text-align:right;padding: 0.2em 0.5em;font-weight:bold;font-size:18pt;color:#000000;text-shadow: 0px 0px 10px #6A6B6B;
			}
		</style>
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
				<li><a href="#">Buscar Museo</a></li>				
										
			<form action="archivo.php" class="formulario">				
				&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp
			</form>	
			</ul>
		</nav>
        </header>				       
        <section id="seccion">
			<?php
				include('../Administrador/Php/conexionBd.php');
				$con = new conexionBd();			 
				$conx = $con->conectar();
				$delegaciones = mysqli_query( $conx,'SELECT * FROM `museos` WHERE 1') or die("Problemas en la consulta" . mysqli_error($conx) );											
			?>	
			<p class="titulos">Lista de Museos</p>
			<form method = "POST">
			<select name="delegaciones">
			   <?php
					while( $reg = mysqli_fetch_array($delegaciones) ){
						echo'<option value ="'.$reg['id_museo'].'">'.$reg['nombre_museo'].'</option>';						
					}					
			   ?>			   
			   <?php
			   ?>
			</select>
			<input type="submit" name="aceptar" value="Buscar">
			</form>
			<?php
				if( isset( $_REQUEST['aceptar'] ) ){
					$delega = $_REQUEST['delegaciones'];
					$resultado = mysqli_query($conx, "SELECT * FROM museos m, detalle_imagenes d, imagenes i WHERE m.id_museo = d.Museos_id_museo 
												AND d.Imagenes_idImagenes = i.idImagenes AND m.id_museo ='".$delega."';" )or die("Problemas en la consulta" . mysqli_error($conx) );
					$salas = mysqli_query($conx, "SELECT * FROM museos m , detallessalasexhibicion ds, salasexhibicion s 
														WHERE ds.Museos_id_museo = m.id_museo
														AND ds.SalasExhibicion_id_exhibicion = s.id_exhibicion
														AND m.id_museo ='" . $delega . "';") or die("Problemas en la consulta" . mysqli_error($conx) );					
					
					$sala = "";
					while( $regSala = mysqli_fetch_array($salas) ){
						$sala = "<lu><li>" . $regSala['nombre_exhibicion'] . "</lu></li>" . $sala;
					}								
					while ($reg = mysqli_fetch_array($resultado) ) {						 												
						$rutaLogo = substr( $reg['rutaLogo'] , 3); 
						$rutaFoto = substr( $reg['rutaFoto'], 3);
						echo "
							<fieldset class='fieldset1'><legend  class='legend1'> Resultado de busqueda</legend>
								<table>
									<tr>
										<td> <img src='" . $rutaLogo . "'/></td>
										<th> " . $reg['nombre_museo'] . " </th>
									</tr>
									<tr>
										<td  colspan='2'><h1>Direccion</h1>
											" . $reg['direccion_museo'] .' Delegación '. $reg['Municipo/Estados_nombre_localidad'] ."
											<br />
										</td>
									</tr>
									<tr>
										<td colspan='2'> <h1> Horario</h1>
											" . $reg['Horario'] . "
											<br />
										</td>
									</tr>
									<tr>
										<td colspan='2'><h1> Costos</h1>										
											" . $reg['precio_entrada_museo'] . "
										</td>
									</tr>
									<tr>
										<td><h1>Salas</h1>
											". $sala . "
										</td>
										<td>
											<img class='imagenB' src='" . $rutaFoto . "'>
										</td>
									</tr>
								</table>				
							</fieldset>
						";
					  }
				}
			?>		
		</section>			
		<aside id="columna">            
			<a href="drone.html" class="img">
			<img src="../imagenes/Drone.png">				
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