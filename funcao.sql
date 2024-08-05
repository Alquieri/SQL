SELECT 

	P.Nome as 'Nome das pessoas responsaveis',
	E.Descricao as'Descriçao',
	CONVERT(VARCHAR(10), E.DtHrInicio, 103) AS 'Data do Evento',
	S.Nome as 'Nome Da sala'

FROM Evento E
INNER JOIN Sala S
	ON S.IDSala = E.IDSala
INNER JOIN EventoPessoa Ep
	ON E.IDEvento = Ep.IDEvento
INNER JOIN Pessoa P
	ON P.IDPessoa = Ep.IDPessoa 
	order by [Data do Evento] desc

SELECT
S.Nome as 'Nome da sala',
CONVERT(VARCHAR(10), E.DtHrInicio, 103) AS 'Data do Evento',
DATEDIFF(MINUTE,  E.DtHrInicio, E.DtHrFim) as 'Minutos'
FROM Evento E
INNER JOIN Sala S
	ON S.IDSala = E.IDSala
order by DATEDIFF(MINUTE,  E.DtHrInicio, E.DtHrFim) desc



SELECT
	S.Nome as 'Nome da sala',
	SUM(DATEDIFF(MINUTE,  E.DtHrInicio, E.DtHrFim)) as 'Minutos'
FROM Evento E

INNER JOIN Sala S
	ON S.IDSala = E.IDSala
	group by S.Nome
order by SUM(DATEDIFF(MINUTE,  E.DtHrInicio, E.DtHrFim)) desc


SELECT
	P.Nome as 'Nome Pessoa',
	COUNT(Ep.Presenca) as 'qtd'
FROM Evento E

right JOIN EventoPessoa EP
	ON EP.IDEvento = E.IDEvento
right JOIN Pessoa P
	ON P.IDPessoa = Ep.IDPessoa 
	group by P.Nome
order by COUNT(E.IDEvento)  desc



SELECT
Count (Ep.Presenca)

FROM EventoPessoa Ep
------

SELECT
	S.Nome as 'Nome da sala',
	E.Descricao as 'Nome do evento',
	S.Capacidade,
	sum(CAST(Ep.Presenca AS INT)) as 'qtd de participantes',
	COUNT(E.IDEvento) as 'suposto',
CASE
    WHEN sum(CAST(Ep.Presenca AS INT)) > S.Capacidade THEN 'Ultrapassou o limite'
	WHEN sum(CAST(Ep.Presenca AS INT)) <= S.Capacidade and count(Ep.IDPessoa) > S.Capacidade THEN 'Nao ultrapassou pois faltou gente'
    ELSE 'Limite ok'
END AS 'Avaliaçao da Capacidade'

FROM Evento E
right join Sala S
	ON S.IDSala = E.IDSala
right JOIN EventoPessoa EP
	ON EP.IDEvento = E.IDEvento
right JOIN Pessoa P
	ON P.IDPessoa = Ep.IDPessoa 

	group by E.Descricao, S.Nome, E.IDEvento,S.Capacidade
order by  [Avaliaçao da Capacidade] desc

--------------------


ALTER FUNCTION fEventoAntigo(@event varchar(100))
RETURNS TABLE AS
RETURN(SELECT
TOP 1 
	S.nome AS 'Nome da Sala',
	E.Descricao,
	CONVERT(VARCHAR(10), E.DtHrInicio, 103) AS 'Data do Evento',
	CONVERT(VARCHAR(10), E.DtHrInicio, 108) AS 'Hora do Evento'

FROM Evento E
INNER JOIN Sala S
	ON S.IDSala = E.IDSala
WHERE Descricao like '%'+@event+'%' 
ORDER BY DtHrInicio asc)

SELECT * FROM fEventoAntigo('Aula')

