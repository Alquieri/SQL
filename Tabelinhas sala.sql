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
	COUNT(E.IDEvento) as 'qtd'
FROM Evento E

INNER JOIN EventoPessoa EP
	ON EP.IDEvento = E.IDEvento
INNER JOIN Pessoa P
	ON P.IDPessoa = Ep.IDPessoa 
	group by P.Nome
order by COUNT(E.IDEvento)  desc
TE,  E.DtHrInicio, E.DtHrFim) desc


