select * from Sala
 WHERE GETDATE() BETWEEN DtHrInicio AND DtHrFim

UPDATE Evento 
SET DtHrInicio = '01-08-2024 13:00',
	DtHrFim = '08-02-2025 13:00'
where IDEvento = '080Z9TPT7GFS'

SELECT
	IDEvento,
	Descricao as 'Descriçao do evento',
    CONVERT(VARCHAR(10), DtHrInicio, 103) AS 'Data Inicio',
	CONVERT(VARCHAR(5), DtHrInicio, 103) AS 'Hora Inicio',
	CONVERT(VARCHAR(10), DtHrInicio, 103) AS 'Data Fim',
    CONVERT(VARCHAR(5), DtHrFIM, 108) AS 'Hora Fim',
	S.Nome as 'Nome da sala'

from Evento E
	left Join Sala S 
	ON E.IDsala = S.IDsala
Order by Descricao





