CREATE PROCEDURE [dbo].[TipoInquilinoObtener]
    @Id_TipoInquilino  int= NULL
AS BEGIN
  SET NOCOUNT ON

  SELECT 
     Id_TipoInquilino,
     Descripcion,
     Estado    
    FROM dbo.TipoInquilino
    WHERE
    (@Id_TipoInquilino IS NULL OR Id_TipoInquilino=@Id_TipoInquilino)

END