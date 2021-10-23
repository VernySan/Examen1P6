DROP TABLE IF EXISTS #TipoInquilinoTemp

SELECT 
Id_TipoInquilino, Descripcion, Estado INTO #TipoInquilinoTemp
FROM (
VALUES
(1, 'Físico',1),
(2, 'Jurídico',1)
)AS TEMP (Id_TipoInquilino, Descripcion, Estado)


----ACTUALIZAR DATOS---
UPDATE P SET
  P.Descripcion = TM.Descripcion,
  P.Estado = TM.Estado
FROM Dbo.TipoInquilino P
INNER JOIN #TipoInquilinoTemp TM
    ON P.Id_TipoInquilino = TM.Id_TipoInquilino


----INSERTAR DATOS---

SET IDENTITY_INSERT dbo.TipoInquilino ON

INSERT INTO dbo.TipoInquilino(
Id_TipoInquilino, Descripcion, Estado)
SELECT
Id_TipoInquilino, Descripcion, Estado
FROM #TipoInquilinoTemp


EXCEPT
SELECT
Id_TipoInquilino, Descripcion, Estado
FROM dbo.TipoInquilino


SET IDENTITY_INSERT dbo.TipoInquilino OFF

GO