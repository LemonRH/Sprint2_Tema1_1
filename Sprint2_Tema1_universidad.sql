SELECT apellido1, apellido2, nombre FROM persona WHERE tipo = 'alumno' ORDER BY apellido1, apellido2, nombre;/*No se si es lo que pide el ejercicio exactamente*/
SELECT nombre, apellido1, apellido2 FROM persona WHERE tipo = 'alumno' AND telefono IS NULL;
SELECT nombre, apellido1, apellido2 FROM persona WHERE tipo = 'alumno' AND YEAR(fecha_nacimiento) = 1999;
SELECT nombre, apellido1, apellido2 FROM persona WHERE tipo = 'profesor' AND telefono IS NULL AND RIGHT (nif, 1) = 'K';
SELECT nombre FROM asignatura WHERE cuatrimestre = 1 AND curso = 3 AND id_grado = 7;
SELECT P.apellido1, P.apellido2, P.nombre, D.nombre AS nombre_departamento FROM persona AS P JOIN profesor AS PR ON P.id = PR.id_profesor JOIN departamento AS D ON PR.id_departamento = D.id WHERE P.tipo = 'profesor'ORDER BY P.apellido1, P.apellido2, P.nombre;
SELECT A.nombre, C.anyo_inicio, C.anyo_fin FROM alumno_se_matricula_asignatura AS AM JOIN persona AS P ON AM.id_alumno = P.id JOIN asignatura AS A ON AM.id_asignatura = A.id JOIN curso_escolar AS C ON AM.id_curso_escolar = C.id WHERE P.nif = '26902806M';
/*SELECT DISTINCT D.nombre FROM departamento AS D JOIN profesor AS PR ON D.id = PR.id_departamento JOIN asignatura AS A ON PR.idprofesor = A.id_profesor JOIN grado AS G ON A.id_grado = G.id WHERE G.nombre = 'Grado en Ingeniería Informática (Plan 2015)'; REVISAR*/
/*Revisar como hacer punto 9*/
/*Aqui comienza la segunda tanda de ejercicios con LEFT JOIN y RIGHT JOIN*/
SELECT d.nombre AS nombre_del_departamento, p.apellido1, p.apellido2, p.nombre FROM departamento AS d LEFT JOIN profesor AS pr ON d.id = pr.id_departamento RIGHT JOIN persona AS p ON pr.id_profesor = p.id ORDER BY nombre_del_departamento ASC, p.apellido1 ASC, p.apellido2 ASC, p.nombre ASC;
SELECT p.apellido1, p.apellido2, p.nombre FROM persona AS p LEFT JOIN profesor AS pr ON p.id = pr.id_profesor WHERE pr.id_departamento IS NULL;
SELECT d.nombre AS nombre_del_departamento FROM departamento AS d LEFT JOIN profesor AS pr ON d.id = pr.id_departamento WHERE pr.id_profesor IS NULL;
SELECT p.apellido1, p.apellido2, p.nombre FROM persona AS p LEFT JOIN profesor AS pr ON p.id = pr.id_profesor LEFT JOIN asignatura AS a ON pr.id_profesor = a.id_profesor WHERE a.id_profesor IS NULL;/*revisar*/
SELECT a.nombre AS nombre_de_la_asignatura FROM asignatura AS a LEFT JOIN profesor AS pr ON a.id_profesor = pr.id_profesor WHERE pr.id_profesor IS NULL;
SELECT DISTINCT d.nombre AS nombre_del_departamento FROM departamento AS d LEFT JOIN profesor AS pr ON d.id = pr.id_departamento LEFT JOIN asignatura AS a ON pr.id_profesor = a.id_profesor LEFT JOIN alumno_se_matricula_asignatura AS am ON a.id = am.id_asignatura LEFT JOIN curso_escolar AS ce ON am.id_curso_escolar = ce.id WHERE ce.id IS NULL;/*Distinct para q no se repitan los departamentos*/
/*Consultas resumen*/
SELECT COUNT(*) AS numero_de_alumnos FROM persona WHERE tipo = 'alumno';
SELECT COUNT(*) AS numero_de_alumnos_1999 FROM persona WHERE tipo = 'alumno' AND YEAR(fecha_nacimiento) = 1999;
SELECT d.nombre AS nombre_del_departamento, COUNT(p.id_profesor) AS numero_de_profesores FROM departamento d LEFT JOIN profesor p ON d.id = p.id_departamento GROUP BY d.id HAVING COUNT(p.id_profesor) > 0 ORDER BY numero_de_profesores DESC;
SELECT d.nombre AS nombre_del_departamento, COUNT(p.id_profesor) AS numero_de_profesores FROM departamento d LEFT JOIN profesor p ON d.id = p.id_departamento GROUP BY d.id;
SELECT g.nombre AS nombre_del_grado, COUNT(a.id) AS numero_de_asignaturas FROM grado g LEFT JOIN asignatura a ON g.id = a.id_grado GROUP BY g.id ORDER BY numero_de_asignaturas DESC; /*ARREGLAR?*/
SELECT g.nombre AS nombre_del_grado, COUNT(a.id) AS numero_de_asignaturas FROM grado g LEFT JOIN asignatura a ON g.id = a.id_grado GROUP BY g.id HAVING COUNT(a.id) > 40;
SELECT g.nombre AS nombre_del_grado, a.tipo AS tipo_de_asignatura, SUM(a.creditos) AS suma_de_creditos FROM grado g LEFT JOIN asignatura a ON g.id = a.id_grado GROUP BY g.id, a.tipo;
SELECT ce.anyo_inicio AS año_de_inicio_del_curso, COUNT(DISTINCT am.id_alumno) AS numero_de_alumnos_matriculados FROM curso_escolar ce LEFT JOIN alumno_se_matricula_asignatura am ON ce.id = am.id_curso_escolar GROUP BY ce.id;
SELECT * FROM persona WHERE tipo = 'alumno' ORDER BY fecha_nacimiento DESC LIMIT 1;/*devuelve una segunda fila con NULLS¿?*/
SELECT p.id AS id, p.nombre, p.apellido1, p.apellido2 FROM persona p INNER JOIN profesor pr ON p.id = pr.id_profesor LEFT JOIN ( SELECT id_profesor, COUNT(*) AS num_asignaturas FROM asignatura GROUP BY id_profesor ) a ON pr.id_profesor = a.id_profesor WHERE pr.id_departamento IS NOT NULL AND a.num_asignaturas IS NULL;
/*FIN DE TODAS LAS CONSULTAS*/

