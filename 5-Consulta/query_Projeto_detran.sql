
-- CONSULTA A: Veículos do proprietário '123.456.789-00'  
SELECT * FROM VEICULO WHERE FK_PROPIETARIO_CPF = '123.456.789-00';  

-- CONSULTA B: Proprietários com nome contendo 'João'  
SELECT * FROM PROPIETARIO WHERE Nome LIKE '%João%';  


-- CONSULTA C: Infrações entre 2023-01-01 e 2023-12-31  
SELECT  
    i.ID_Infracao AS Codigo_Infracao,  
    i.Data_Hora,  
    ti.Descricao AS Tipo_Infracao,  
    ti.Valor AS Valor_Multa,  
    v.Placa,  
    v.Cor,  
    a.Nome AS Agente,
    l.Latitude,
    l.Longitude  
FROM INFRACAO i  
JOIN VEICULO v ON i.FK_VEICULO_Placa = v.Placa  
JOIN TIPO_INFRACAO ti ON i.FK_TIPO_INFRACAO_ID_Tipo = ti.ID_Tipo  
JOIN AGENTE a ON i.FK_AGENTE_Matricula = a.Matricula  
JOIN LOCAL l ON i.FK_LOCAL_Latitude = l.Latitude AND i.FK_LOCAL_Longitude = l.Longitude  
WHERE i.Data_Hora BETWEEN '2023-01-01' AND '2023-12-31';
-- CONSULTA D: Veículos por modelo (ordem decrescente)  
SELECT  
    m.Nome AS Modelo,  
    COUNT(v.Placa) AS Total_Veiculos  
FROM MODELO m  
LEFT JOIN VEICULO v ON m.ID_MODELO = v.FK_MODELO_ID  
GROUP BY m.Nome  
ORDER BY Total_Veiculos DESC;  
