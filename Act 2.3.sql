Use BluePrint
go

--YEAH!

--- hello world
--1
--COMENTARIO DE FEDE
--La cantidad de colaboradores
Select Count(ID) from Colaboradores
--2
--La cantidad de colaboradores nacidos entre 1990 y 2000.
Select Count(ID) from Colaboradores as C
where year(C.FechaNacimiento)>1990 and year(C.FechaNacimiento)<2000
--3
--El promedio de precio hora base de los tipos de tareas
select AVG(TT.PrecioHoraBase) from TiposTarea as TT
--4
--El promedio de costo de los proyectos iniciados en el año 2019.
select AVG(P.CostoEstimado) from Proyectos as P
--5
--El costo más alto entre los proyectos de clientes de tipo 'Unicornio'
select MAX(P.CostoEstimado) from Proyectos as P 
inner join Clientes as CL on P.IDCliente=CL.ID
inner join TiposCliente as TC on CL.IDTipo=TC.ID
where TC.Nombre='Unicornio'
--6
--El costo más bajo entre los proyectos de clientes del país 'Argentina'
select MIN(P.CostoEstimado) from Proyectos as P
inner join Clientes as CL on P.IDCliente=CL.ID
inner join Ciudades as C on C.ID=CL.IDCiudad
inner join Paises as Pa on Pa.ID=C.IDPais
where Pa.Nombre='Argentina'
--7
--La suma total de los costos estimados entre todos los proyectos.
select SUM(P.CostoEstimado) from Proyectos as P
--8
--Por cada ciudad, listar el nombre de la ciudad y la cantidad de clientes.
select C.Nombre, count(CL.IDCiudad) as CantidadClientes
from Ciudades as C
inner join Clientes as CL on CL.IDCiudad=C.ID
GROUP BY C.Nombre
--9
--Por cada país, listar el nombre del país y la cantidad de clientes.
select Pa.Nombre, count(C.IDPais) as CantidadClientes
from Paises as Pa
inner join Ciudades as C on C.IDPais=Pa.ID
inner join Clientes as CL on CL.IDCiudad=C.ID
GROUP BY Pa.Nombre
--10
--Por cada tipo de tarea, la cantidad de colaboraciones registradas. Indicar el tipo de tarea y la cantidad calculada.
select Ti.Nombre, count(COLA.IDTarea) as CantidadColaboraciones
from TiposTarea as Ti
inner join Tareas as T on T.IDTipo=Ti.ID
inner join Colaboraciones as COLA on COLA.IDTarea=T.ID
GROUP BY Ti.Nombre
--11 (duda)
--Por cada tipo de tarea, la cantidad de colaboradores distintos que la hayan realizado. Indicar el tipo de tarea y la cantidad calculada.
select Ti.Nombre, count(DISTINCT COL.ID) as CantidadColaboradores
from TiposTarea as Ti
inner join Tareas as T on T.IDTipo=Ti.ID
inner join Colaboraciones as COLA on COLA.IDTarea=T.ID
inner join Colaboradores as COL on COL.ID=COLA.IDColaborador
GROUP BY Ti.Nombre
--12
--Por cada módulo, la cantidad total de horas trabajadas. Indicar el ID, nombre del módulo y la cantidad totalizada. 
--Mostrar los módulos sin horas registradas con 0.
select M.ID, M.Nombre as Módulo, isnull(SUM(COLA.Tiempo), 0) as CantidadHorasTrabajadas 
from Modulos as M
left join Tareas as T on T.IDModulo=M.ID
left join Colaboraciones as COLA on COLA.IDTarea=T.ID
GROUP BY M.ID, M.Nombre
--13
--Por cada módulo y tipo de tarea, el promedio de horas trabajadas. Indicar el ID y nombre del módulo, el nombre del tipo de tarea y 
--el total calculado.
select M.ID, M.Nombre as Módulo, Ti.Nombre as TipoTarea, isnull(AVG(COLA.Tiempo), 0) as CantidadHorasTrabajadas 
from Modulos as M
inner join Tareas as T on T.IDModulo=M.ID
inner join TiposTarea as Ti on T.IDTipo=Ti.ID
inner join Colaboraciones as COLA on COLA.IDTarea=T.ID
GROUP BY M.ID, M.Nombre, Ti.Nombre 
--14
--Por cada módulo, indicar su ID, apellido y nombre del colaborador y total que se le debe abonar en concepto de colaboraciones 
--realizadas en dicho módulo.

--15
--Por cada proyecto indicar el nombre del proyecto y la cantidad de horas registradas en concepto de colaboraciones y el total que debe 
--abonar en concepto de colaboraciones.
--16
--Listar los nombres de los proyectos que hayan registrado menos de cinco colaboradores distintos y más de 100 horas total de trabajo.
--17
--Listar los nombres de los proyectos que hayan comenzado en el año 2020 que hayan registrado más de tres módulos.
--18
--Listar para cada colaborador externo, el apellido y nombres y el tiempo máximo de horas que ha trabajo en una colaboración. 
--19
--Listar para cada colaborador interno, el apellido y nombres y el promedio percibido en concepto de colaboraciones.
--20
--Listar el promedio percibido en concepto de colaboraciones para colaboradores internos y el promedio percibido en concepto de 
--colaboraciones para colaboradores externos.
--21
--Listar el nombre del proyecto y el total neto estimado. Este último valor surge del costo estimado menos los pagos que requiera hacer
--en concepto de colaboraciones.
--22
--Listar la cantidad de colaboradores distintos que hayan colaborado en alguna tarea que correspondan a proyectos de clientes de tipo
--'Unicornio'.
--23
--La cantidad de tareas realizadas por colaboradores del país 'Argentina'.
--24
--Por cada proyecto, la cantidad de módulos que se haya estimado mal la fecha de fin. Es decir, que se haya finalizado antes o después
--que la fecha estimada. Indicar el nombre del proyecto y la cantidad calculada.

