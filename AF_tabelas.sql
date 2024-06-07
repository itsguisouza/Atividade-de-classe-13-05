CREATE TABLE Alunos (
idAluno INT PRIMARY KEY,
nome VARCHAR(20),
sobrenome VARCHAR(20),
curso VARCHAR (30),
email VARCHAR(50)
);

CREATE TABLE Cursos (
idCurso INT PRIMARY KEY,
nomeCurso VARCHAR(30),
numeroAlunos INT,
duracaoSemestre INT,
area VARCHAR(30)
);

INSERT INTO Cursos (idCurso, nomeCurso, numeroAlunos, duracaoSemestre, area) VALUES
(1, 'Engenharia Civil', 200, 10, 'Engenharias'),
(2, 'Engenharia Eletrica', 150, 10, 'Engenharias'),
(3, 'Engenharia Mecanica', 180, 10, 'Engenharias'),
(4, 'Medicina', 100, 12, 'Ciências da Saúde'),
(5, 'Direito', 250, 10, 'Ciências Sociais Aplicadas'),
(6, 'Administracao', 300, 8, 'Ciências Sociais Aplicadas'),
(7, 'Contabilidade', 200, 8, 'Ciências Sociais Aplicadas'),
(8, 'Economia', 180, 8, 'Ciências Sociais Aplicadas'),
(9, 'Psicologia', 150, 10, 'Ciências Humanas'),
(10, 'Arquitetura', 160, 10, 'Engenharias'),
(11, 'Ciencia da Computacao', 200, 8, 'Ciências Exatas'),
(12, 'Sistemas de Informacao', 180, 8, 'Ciências Exatas'),
(13, 'Biologia', 140, 8, 'Ciências Biológicas'),
(14, 'Quimica', 120, 8, 'Ciências Exatas'),
(15, 'Fisica', 100, 8, 'Ciências Exatas'),
(16, 'Matematica', 130, 8, 'Ciências Exatas'),
(17, 'Geografia', 110, 8, 'Ciências Humanas'),
(18, 'Historia', 120, 8, 'Ciências Humanas'),
(19, 'Letras', 160, 8, 'Ciências Humanas'),
(20, 'Filosofia', 100, 8, 'Ciências Humanas'),
(21, 'Pedagogia', 180, 8, 'Ciências Humanas'),
(22, 'Educacao Fisica', 140, 8, 'Ciências da Saúde'),
(23, 'Nutricao', 120, 8, 'Ciências da Saúde'),
(24, 'Enfermagem', 150, 8, 'Ciências da Saúde'),
(25, 'Farmacia', 130, 8, 'Ciências da Saúde');

DELIMITER $$
CREATE PROCEDURE adicionarCurso(
	IN p_idCurso INT,
    IN p_nomeCurso VARCHAR(30),
    IN p_numeroAlunos INT,
    IN p_duracaoSemestre INT,
    IN p_area VARCHAR(30)
    )
BEGIN    
	INSERT INTO Cursos (idCurso, nomeCurso, numeroAlunos, duracaoSemestre, area)
    VALUES (p_idCurso, p_nomeCurso, p_numeroAlunos, p_duracaoSemestre, p_area);
END $$
DELIMITER ;    
-- chamada da procedure
CALL adicionarCurso (26, 'Engenharia de Software', 180, 8, 'Engenharias');

DELIMITER $$
CREATE PROCEDURE selecionarCurso()
BEGIN
	SELECT nomeCurso, area from Cursos;	
END $$
DELIMITER ;
-- chamada de procedure
CALL selecionarCurso;

DELIMITER $$
CREATE FUNCTION obterIdCurso(
	p_nomeCurso VARCHAR(30),
	p_area VARCHAR(30)
    )
RETURNS INT
BEGIN
    DECLARE v_idCurso INT;
    SELECT idCurso INTO v_idCurso FROM Cursos WHERE nomeCurso = p_nomeCurso AND area = p_area;
    RETURN v_idCurso;
END $$
DELIMITER ;    
-- chamada da function
SELECT obterIdCurso('Matematica', 'Ciencias Exatas');

