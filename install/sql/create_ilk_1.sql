/****** Object:  Schema [snlg_V1]    Script Date: 12.5.2016 20:46:37 ******/
CREATE SCHEMA [snlg_V1]
GO
/****** Object:  StoredProcedure [snlg_V1].[isp_DomainTanimla]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [snlg_V1].[isp_DomainTanimla]
	@Eposta varchar(75), @Sifre varchar(75), @UserName varchar(25), 
	@Aciklama varchar(2500), @AdminId int OUT, @DilSql nvarchar(max), 
	@AdminLang varchar(75), @DefaultLang varchar(75)
AS
SET NOCOUNT ON;
	
	--varsayılan olarak tr dili ve diğer seçilen diller tanımlanıyor
	EXEC SP_EXECUTESQL @DilSql;

	--admin oluşturuluyor
	UPDATE snlg_V1.TblUyeApp SET Eposta=@Eposta, Sifre=@Sifre, Aktif=1, UserName=@UserName, HataSay=0, UyelikTarihi=GETDATE() WHERE UyeID = 1

	SET @AdminId = 1

	UPDATE snlg_V1.TblDegiskenler SET Deger = @AdminId WHERE Degisken = N'AdminId'
	UPDATE snlg_V1.TblDegiskenler SET Deger = GETDATE() WHERE Degisken = N'Kurulum Tarihi'
	UPDATE snlg_V1.TblDegiskenler SET Deger = 'index.aspx' WHERE Degisken = N'AcilisSayfasi'
	UPDATE snlg_V1.TblDegiskenler SET Deger = @Aciklama WHERE Degisken = N'Kurulum Açıklama'
	UPDATE snlg_V1.TblDegiskenler SET Deger = @AdminLang WHERE Degisken = N'adminDefaultLangID'
	UPDATE snlg_V1.TblDegiskenler SET Deger = @DefaultLang WHERE Degisken = N'DefaultLang'



GO
/****** Object:  StoredProcedure [snlg_V1].[msp_AdminLogin]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [snlg_V1].[msp_AdminLogin]
	@UserName nvarchar(25), @Sifre varchar(128), @AdminId int
AS
SET NOCOUNT ON;

DECLARE @UyeId int, @Yetkiler varchar(4000)

SELECT   @UyeId = UyeId
FROM     TblUyeApp
WHERE     (UserName = @UserName) AND Sifre = @Sifre AND (Aktif = 1)

IF (@UyeId IS NULL)
 BEGIN--HATALI USER VEYA ŞİFRE (ÜYE BULUNAMADI)
	RAISERROR('$#sqlhata1#$',11,1);
	RETURN
 END
ELSE
 BEGIN
	--YETKİLİ OLDUĞU SAYFALARI ÇEK
	IF(@UyeId <> @AdminId)
		SELECT @Yetkiler =
			(
				SELECT     TblAdminYetkiler.Yetki AS 'data()'
				FROM         TblRol_Uye INNER JOIN
									  TblRol_Yetki ON TblRol_Uye.RolId = TblRol_Yetki.RolId INNER JOIN
									  TblAdminYetkiler ON TblRol_Yetki.YetkiId = TblAdminYetkiler.YetkiId
				WHERE     (TblRol_Uye.UyeId = @UyeId)
				FOR XML PATH('')
			)

	UPDATE TblUyeApp SET LoginGuid = NEWID() WHERE  UyeId=@UyeId

	SELECT UyeId, REPLACE(@Yetkiler,' ',',') + ',', SeoUrl,LoginGuid
	FROM     TblUyeApp
	WHERE     UyeId=@UyeId
 END






























GO
/****** Object:  StoredProcedure [snlg_V1].[msp_AdminRolKontrol]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [snlg_V1].[msp_AdminRolKontrol]
@pageName NVARCHAR(MAX), @UyeId int
AS
BEGIN
	
	DECLARE @YetkiTanimi NVARCHAR(50)

	--YETKİ YOKSA EKLE
	IF NOT EXISTS(SELECT Yetki FROM  TblAdminYetkiler WHERE Yetki = @pageName)
	BEGIN
		IF(@pageName like '%-Delete')
			Set @YetkiTanimi='Silebilir'
		ELSE IF(@pageName like '%-View')
			Set @YetkiTanimi='Görüntüleyebilir'
		ELSE IF(@pageName like '%-Update')
			Set @YetkiTanimi='Düzenleyebilir'
		ELSE IF(@pageName like '%-Insert')
			Set @YetkiTanimi='Ekleyebilir'
	    Else
		     Set @YetkiTanimi=@pageName;

		INSERT INTO snlg_V1.TblAdminYetkiler(Yetki,YetkiTanim)VALUES(@pageName,@YetkiTanimi)
	END


	IF EXISTS(	SELECT     TblAdminYetkiler.Yetki 
				FROM         TblRol_Uye INNER JOIN
									  TblRol_Yetki ON TblRol_Uye.RolId = TblRol_Yetki.RolId INNER JOIN
									  TblAdminYetkiler ON TblRol_Yetki.YetkiId = TblAdminYetkiler.YetkiId
				WHERE     (TblRol_Uye.UyeId = @UyeId AND TblAdminYetkiler.Yetki = @pageName)
			)
		select '1'
	ELSE 
		select '0'



END


GO
/****** Object:  StoredProcedure [snlg_V1].[msp_AnketDetaySec]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [snlg_V1].[msp_AnketDetaySec]
	@AnketId int, @Dil smallint
AS
SET NOCOUNT ON;

DECLARE @Diller varchar(1000)
SET @Diller = 
		(
		SELECT        TblDiller.DId AS [data()], '#' AS [data()], TblDiller.Name AS [data()], '#' AS [data()]
		FROM            TblDiller WHERE Aktif = 1 ORDER BY TblDiller.DId FOR XML path('')
		)

SELECT TAA.AnketId, TAA.Tarih, TAA.Gorunurluk, TAA.SonucGoster, TA.Soru, 
		TA.A, TA.B, TA.C, TA.D, TA.E, TA.F, TA.G, TA.H, @Diller AS Diller
FROM TblAnketApp AS TAA LEFT OUTER JOIN 
		TblAnketDetay AS TA ON TAA.AnketId = TA.AnketId AND TA.Dil = @Dil 
WHERE (TAA.AnketId = @AnketId)












































GO
/****** Object:  StoredProcedure [snlg_V1].[msp_AnketDuzenle]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [snlg_V1].[msp_AnketDuzenle]
	@Soru nvarchar(250), @A nvarchar(150), @B nvarchar(150), @C nvarchar(150), 
	@D nvarchar(150), @E nvarchar(150), @F nvarchar(150), @G nvarchar(150), @H nvarchar(150), 
	@Gorunurluk tinyint, @SonucGoster bit, @AnketId int, @Dil smallint
AS
SET NOCOUNT ON;

UPDATE TblAnketApp SET Gorunurluk = @Gorunurluk, SonucGoster = @SonucGoster 
WHERE AnketId = @AnketId 

IF(@@ROWCOUNT > 0)--bu app'nin böyle bir anketi varsa diğer işlemlere devam et
 BEGIN 
	UPDATE TblAnketDetay SET Soru = @Soru, A = @A, B = @B, C = @C, D = @D, 
				E = @E, F = @F, G = @G, H = @H 
	WHERE AnketId = @AnketId AND Dil = @Dil
	--ANKET güncellenmemişse yok demektir hemen yenisini oluşturalım
	IF(@@ROWCOUNT < 1)
		INSERT INTO TblAnketDetay (AnketId, Dil, Soru, A, B, C, D, E, F, G, H) 
		VALUES(@AnketId, @Dil, @Soru, @A, @B, @C, @D, @E, @F, @G, @H)		
 END












































GO
/****** Object:  StoredProcedure [snlg_V1].[msp_AnketOlustur]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [snlg_V1].[msp_AnketOlustur]
	@Soru nvarchar(250), @A nvarchar(150), @B nvarchar(150), 
	@C nvarchar(150), @D nvarchar(150), @E nvarchar(150), @F nvarchar(150), 
	@G nvarchar(150), @H nvarchar(150), @Gorunurluk tinyint, @SonucGoster bit
AS
SET NOCOUNT ON;

DECLARE @AnketId int, @DefaultLang smallint
SELECT TOP(1) @DefaultLang = Deger FROM snlg_V1.TblDegiskenler WHERE  Degisken = 'DefaultLang'

INSERT INTO TblAnketApp (Tarih, Gorunurluk, SonucGoster) 
VALUES(GETDATE(), @Gorunurluk, @SonucGoster)

SELECT @AnketId = SCOPE_IDENTITY()

INSERT INTO TblAnketDetay (AnketId, Dil, Soru, A, B, C, D, E, F, G, H) 
VALUES(@AnketId, @DefaultLang, @Soru, @A, @B, @C, @D, @E, @F, @G, @H)









GO
/****** Object:  StoredProcedure [snlg_V1].[msp_AnketSonuc]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [snlg_V1].[msp_AnketSonuc]
	@AnketId int
AS
SET NOCOUNT ON;

DECLARE @DefaultLang smallint
SELECT TOP(1) @DefaultLang = Deger FROM snlg_V1.TblDegiskenler WHERE  Degisken = 'DefaultLang'

IF EXISTS(SELECT AnketId FROM TblAnketApp WHERE (AnketId = @AnketId))
 BEGIN
	DECLARE @A int, @B int, @C int, @D int, @E int, @F int, @G int, @H int, @Toplam int

	SELECT @A = COUNT(Cevap) FROM TblAnketCevap WHERE (AnketId = @AnketId) AND (Cevap = 'A')
	SELECT @B = COUNT(Cevap) FROM TblAnketCevap WHERE (AnketId = @AnketId) AND (Cevap = 'B')
	SELECT @C = COUNT(Cevap) FROM TblAnketCevap WHERE (AnketId = @AnketId) AND (Cevap = 'C')
	SELECT @D = COUNT(Cevap) FROM TblAnketCevap WHERE (AnketId = @AnketId) AND (Cevap = 'D')
	SELECT @E = COUNT(Cevap) FROM TblAnketCevap WHERE (AnketId = @AnketId) AND (Cevap = 'E')
	SELECT @F = COUNT(Cevap) FROM TblAnketCevap WHERE (AnketId = @AnketId) AND (Cevap = 'F')
	SELECT @G = COUNT(Cevap) FROM TblAnketCevap WHERE (AnketId = @AnketId) AND (Cevap = 'G')
	SELECT @H = COUNT(Cevap) FROM TblAnketCevap WHERE (AnketId = @AnketId) AND (Cevap = 'H')
	SET @Toplam = @A + @B + @C + @D + @E
	
	SELECT     @Toplam AS Toplam, @A AS ASay, @B AS BSay, @C AS CSay, @D AS DSay, 
			@E AS ESay, @F AS FSay, @G AS GSay, @H AS HSay, A, B, C, D, E, F, G, H,
			Soru
	FROM         TblAnketDetay
	WHERE     (AnketId = @AnketId) AND Dil = @DefaultLang
 END






GO
/****** Object:  StoredProcedure [snlg_V1].[msp_AramaMotoruDuzenle]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [snlg_V1].[msp_AramaMotoruDuzenle]
	@GglDogrula nvarchar(MAX),@GglAnalytic nvarchar(max),@GglUser nvarchar(250),
	@GglPsw nvarchar(150),@GglProfId nvarchar(50)
AS
SET NOCOUNT ON;

UPDATE   snlg_V1.TblAramaMotoru
SET    GglDogrula = @GglDogrula, GglAnalytic = @GglAnalytic, GglUser = @GglUser, 
		GglPsw = @GglPsw, GglProfId = @GglProfId

IF(@@ROWCOUNT < 1)
	INSERT INTO snlg_V1.TblAramaMotoru
           (GglDogrula, GglAnalytic, GglUser, GglPsw, GglProfId)
	VALUES (@GglDogrula,@GglAnalytic,@GglUser,@GglPsw,@GglProfId)











































GO
/****** Object:  StoredProcedure [snlg_V1].[msp_DashBoardVerileri]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [snlg_V1].[msp_DashBoardVerileri]
AS
SET NOCOUNT ON;

DECLARE @AnketOySay int, @MakaleYorumSay int, @MakaleYorumOnaySay int, @UyeSay int, 
	@ZDefteriSay int, @ZDefteriOnaySay int, @GglUser varchar(250), @GglPsw varchar(150), 
	@GglProfId varchar(50)

--OY KULLANANLARIN SAYISI
SELECT @AnketOySay = COUNT(TAA.AnketId) FROM TblAnketApp AS TAA INNER JOIN 
			TblAnketCevap AS TAC ON TAA.AnketId = TAC.AnketId
WHERE TAA.Gorunurluk <> 4

--ONAY BEKLEYEN
SELECT @MakaleYorumOnaySay = COUNT(TMA.MakId) FROM TblMakaleApp AS TMA INNER JOIN 
				TblMakaleYorum AS TMY ON TMA.MakId = TMY.MakId
WHERE TMY.Onay = 0

--tüm yorumlar
SELECT @MakaleYorumSay = COUNT(TMA.MakId) FROM TblMakaleApp AS TMA INNER JOIN 
				TblMakaleYorum AS TMY ON TMA.MakId = TMY.MakId

--TOPLAM ÜYE SAYISI
SELECT @UyeSay = COUNT(UyeId) FROM TblUyeApp WHERE Aktif = 1

--ZİYARETÇİ DEFTERİNDE YAZILANLAR
SELECT @ZDefteriSay = COUNT(YId) FROM TblZiyaretciDefteri 

--ZİYARETÇİ DEFTERİNDE onay bekleyen
SELECT @ZDefteriOnaySay = COUNT(YId) FROM TblZiyaretciDefteri WHERE Onay = 0

--arama motoro bilgileri
SELECT @GglUser = GglUser, @GglPsw = GglPsw, @GglProfId = GglProfId FROM snlg_V1.TblAramaMotoru 

SELECT @AnketOySay, CAST(@MakaleYorumOnaySay AS VARCHAR) +'/'+ CAST(@MakaleYorumSay AS VARCHAR), 
		@UyeSay, CAST(@ZDefteriOnaySay AS VARCHAR) +'/'+ CAST(@ZDefteriSay AS VARCHAR), 
		@GglUser, @GglPsw, @GglProfId































GO
/****** Object:  StoredProcedure [snlg_V1].[msp_DuyuruDetaySec]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [snlg_V1].[msp_DuyuruDetaySec]
	@DuyuruId int, @Dil smallint
AS
SET NOCOUNT ON;

DECLARE @Diller varchar(1000)
SET @Diller = 
		(
		SELECT        TblDiller.DId AS [data()], '#' AS [data()], TblDiller.Name AS [data()], '#' AS [data()]
		FROM            TblDiller WHERE Aktif = 1 ORDER BY TblDiller.DId FOR XML path('')
		)

SELECT TblDuyuruApp.DuyuruId, TblDuyuruApp.Gorunurluk, TblDuyuruDetay.Baslik, @Diller AS Diller,
	TblDuyuruDetay.Duyuru, TblDuyuruApp.Tarih, TblDuyuruApp.Resim, TblDuyuruDetay.SeoUrl, TblDuyuruApp.AramaIndex
FROM TblDuyuruApp LEFT OUTER JOIN 
	TblDuyuruDetay ON TblDuyuruApp.DuyuruId = TblDuyuruDetay.DuyuruId AND TblDuyuruDetay.Dil = @Dil 
WHERE (TblDuyuruApp.DuyuruId = @DuyuruId)












































GO
/****** Object:  StoredProcedure [snlg_V1].[msp_DuyuruDuzenle]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [snlg_V1].[msp_DuyuruDuzenle]
	@DuyuruId int,@SeoUrl varchar(500),
	@Gorunurluk tinyint, @Baslik nvarchar(150), @Duyuru nvarchar(MAX),
	@Tarih date, @Dil smallint, @Resim varchar(250), @AramaIndex bit
AS
SET NOCOUNT ON;

DECLARE @EskiSeoUrl varchar(1000), @UrlKeyValue varchar(500)
SELECT @UrlKeyValue=UrlKeyValue FROM snlg_v1.TblUrlKeys WHERE UrlKeyName = 'announce' AND Dil = @Dil


SET @SeoUrl = snlg_V1.fun_UrlOlustur(ISNULL(@SeoUrl,@Baslik), 'announce', 'announce', @DuyuruId,@Dil)
UPDATE snlg_V1.TblSiteLinkleri SET @EskiSeoUrl=SeoUrl, SeoUrl = @SeoUrl where Id = @DuyuruId AND Dil=@Dil AND SablonAnahtar = 'announce'
IF(@@ROWCOUNT < 1)
	INSERT INTO snlg_V1.TblSiteLinkleri (SeoUrl, Id,Dil,UrlAnahtar, SablonAnahtar) VALUES (@SeoUrl, @DuyuruId,@Dil,'announce','announce')


IF(NOT @SeoUrl = @EskiSeoUrl)
	UPDATE TblMenuDetay SET MenuLink='/' + @UrlKeyValue + '/' + @SeoUrl WHERE MenuLink = '/'+ @UrlKeyValue +'/' + @EskiSeoUrl


UPDATE TblDuyuruApp 
SET Gorunurluk = @Gorunurluk, Tarih = @Tarih, Resim = ISNULL(@Resim, Resim),
    AramaIndex = @AramaIndex
WHERE (DuyuruId = @DuyuruId) 

IF (@@ROWCOUNT > 0)
 BEGIN--bu app'nin böyle bir kategorisi varsa diğer işlemlere devam et	 
	UPDATE TblDuyuruDetay SET Baslik = @Baslik, Duyuru = @Duyuru,SeoUrl=@SeoUrl
	WHERE (DuyuruId = @DuyuruId) AND (Dil = @Dil)

	IF(@@ROWCOUNT < 1)
		INSERT INTO TblDuyuruDetay (DuyuruId, Dil,SeoUrl, Baslik, Duyuru) 
		VALUES(@DuyuruId, @Dil,@SeoUrl, @Baslik, @Duyuru)
 END









































GO
/****** Object:  StoredProcedure [snlg_V1].[msp_DuyuruEkle]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [snlg_V1].[msp_DuyuruEkle]
	@Gorunurluk tinyint,@SeoUrl varchar(500),
	@Baslik nvarchar(150), @Duyuru nvarchar(MAX),@AramaIndex bit,
	@Tarih date, @Resim varchar(250)
AS
SET NOCOUNT ON;

DECLARE @DefaultLang smallint
SELECT TOP(1) @DefaultLang = Deger FROM snlg_V1.TblDegiskenler WHERE  Degisken = 'DefaultLang'

SET @SeoUrl = snlg_V1.fun_UrlOlustur(ISNULL(@SeoUrl,@Baslik), 'announce', NULL, NULL,@DefaultLang)

INSERT INTO TblDuyuruApp (Gorunurluk, Tarih, Resim,AramaIndex)
VALUES (@Gorunurluk, @Tarih, @Resim,@AramaIndex)

DECLARE @DuyuruId int
SET @DuyuruId = SCOPE_IDENTITY()

INSERT INTO TblDuyuruDetay (DuyuruId, Dil,SeoUrl,Baslik, Duyuru) 
VALUES (@DuyuruId, @DefaultLang,@SeoUrl,@Baslik, @Duyuru)

INSERT INTO snlg_V1.TblSiteLinkleri (SeoUrl, Id, Dil, UrlAnahtar, SablonAnahtar) VALUES (@SeoUrl, @DuyuruId,@DefaultLang,'announce','announce')



































GO
/****** Object:  StoredProcedure [snlg_V1].[msp_DuyuruSil]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [snlg_V1].[msp_DuyuruSil]
	@DuyuruId varchar(4000)
AS
SET NOCOUNT ON;

DECLARE @ResimlerSql NVARCHAR(4000)
DECLARE @Params NVARCHAR(4000), @Resimler varchar(8000)
SET @ResimlerSql = N'SET @ResimlerOUT = 
		(
		SELECT       Resim AS [data()], '','' AS [data()]
		FROM         snlg_V1.TblDuyuruApp
		WHERE       DuyuruId IN ('+@DuyuruId+')
		FOR XML path('''')
		)
		
		DELETE FROM snlg_V1.TblSiteLinkleri WHERE Id IN ('+@DuyuruId+') AND SablonAnahtar = ''announce''
		DELETE FROM snlg_V1.TblDuyuruApp WHERE DuyuruId IN ('+@DuyuruId+')  
'
SET @Params = N'@ResimlerOUT varchar(8000) OUTPUT'
EXECUTE sp_executesql
@ResimlerSql, @Params, @ResimlerOUT=@Resimler OUTPUT

SELECT @Resimler











































GO
/****** Object:  StoredProcedure [snlg_V1].[msp_EPostaSablonDetaySec]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [snlg_V1].[msp_EPostaSablonDetaySec]
	@EPId int
AS
SET NOCOUNT ON;

SELECT     Anahtar, Kimden, KimdenIsim, Kime, Konu, Mesaj, Aciklama, Bilgi, SmtpPsw,SmtpPort,SmtpHost,Ssl_
FROM         snlg_V1.TblEPostaSablon
WHERE     (EPId = @EPId) 

























GO
/****** Object:  StoredProcedure [snlg_V1].[msp_EPostaSablonDuzenle]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [snlg_V1].[msp_EPostaSablonDuzenle]
	    @EPId INT,
		@Mesaj nvarchar(MAX), 
		@Anahtar nvarchar(50), 
		@Kimden varchar(250), 
		@KimdenIsim nvarchar(250), 
		@Kime varchar(250), 
		@Konu nvarchar(250),
		@Aciklama nvarchar(250), 
		@Bilgi nvarchar(MAX),
		@SmtpPsw NVARCHAR(250),
		@SmtpPort NVARCHAR(50),
		@SmtpHost NVARCHAR(250),
		@Ssl_ Bit
AS
SET NOCOUNT ON;

UPDATE snlg_V1.TblEPostaSablon
		       SET Anahtar = @Anahtar, Kimden = @Kimden, KimdenIsim = @KimdenIsim, 
				 Kime = @Kime, Konu = @Konu, Mesaj = @Mesaj, 
				 Aciklama = @Aciklama, Bilgi = @Bilgi,
				 SmtpPsw=@SmtpPsw,SmtpPort=@SmtpPort,SmtpHost=@SmtpHost,Ssl_=@Ssl_
		WHERE   (EPId = @EPId) 































GO
/****** Object:  StoredProcedure [snlg_V1].[msp_EPostaSablonEkle]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [snlg_V1].[msp_EPostaSablonEkle]
		@Mesaj nvarchar(MAX), 
		@Anahtar nvarchar(50), 
		@Kimden varchar(250), 
		@KimdenIsim nvarchar(250), 
		@Kime varchar(250), 
		@Konu nvarchar(250),
		@Aciklama nvarchar(250), 
		@Bilgi nvarchar(MAX),
		@SmtpPsw NVARCHAR(250),
		@SmtpPort NVARCHAR(50),
		@SmtpHost NVARCHAR(250),
		@Ssl_ Bit
AS
SET NOCOUNT ON;

	INSERT INTO snlg_V1.TblEPostaSablon
				 (Anahtar, Kimden, KimdenIsim, Kime, Konu, Mesaj, Aciklama, Bilgi,SmtpPsw,SmtpPort,SmtpHost,Ssl_)
	VALUES (@Anahtar,@Kimden,@KimdenIsim,@Kime,@Konu,@Mesaj,@Aciklama,@Bilgi,@SmtpPsw,@SmtpPort,@SmtpHost,@Ssl_)



GO
/****** Object:  StoredProcedure [snlg_V1].[msp_EPostaSablonSil]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [snlg_V1].[msp_EPostaSablonSil]
	@EPId varchar(4000)
AS
SET NOCOUNT ON;

DECLARE @SorguSql NVARCHAR(4000)
SET @SorguSql = N'DELETE FROM snlg_V1.TblEPostaSablon WHERE EPId IN ('+@EPId+')'

EXEC SP_EXECUTESQL @SorguSql

































GO
/****** Object:  StoredProcedure [snlg_V1].[msp_EtkinlikDetaySec]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [snlg_V1].[msp_EtkinlikDetaySec]
	@EtkinlikId int, @Dil smallint
AS
SET NOCOUNT ON;

DECLARE @Diller varchar(1000)
SET @Diller = 
		(
		SELECT        TblDiller.DId AS [data()], '#' AS [data()], TblDiller.Name AS [data()], '#' AS [data()]
		FROM            TblDiller WHERE Aktif = 1 ORDER BY TblDiller.DId FOR XML path('')
		)

SELECT TblEtkinlikApp.EtkinlikId, TblEtkinlikDetay.Baslik, @Diller AS Diller,
	TblEtkinlikDetay.Detay,TblEtkinlikApp.Tarih1,TblEtkinlikApp.Tarih2, TblEtkinlikApp.Resim
FROM TblEtkinlikApp LEFT OUTER JOIN 
	TblEtkinlikDetay ON TblEtkinlikApp.EtkinlikId = TblEtkinlikDetay.EtkinlikId AND TblEtkinlikDetay.Dil = @Dil 
WHERE (TblEtkinlikApp.EtkinlikId = @EtkinlikId)













































GO
/****** Object:  StoredProcedure [snlg_V1].[msp_EtkinlikDuzenle]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [snlg_V1].[msp_EtkinlikDuzenle]
	@EtkinlikId int, @Baslik nvarchar(150), @Detay nvarchar(MAX),
	@Tarih1 smalldatetime, @Tarih2 smalldatetime, @Dil smallint, @Resim varchar(250)
AS
SET NOCOUNT ON;

UPDATE TblEtkinlikApp 
SET Tarih1 = @Tarih1, Tarih2 = @Tarih2, Resim = ISNULL(@Resim, Resim)
WHERE (EtkinlikId = @EtkinlikId) 

IF (@@ROWCOUNT > 0)
 BEGIN--bu app'nin böyle bir kategorisi varsa diğer işlemlere devam et	 
	UPDATE TblEtkinlikDetay SET Baslik = @Baslik, Detay = @Detay
	WHERE (EtkinlikId = @EtkinlikId) AND (Dil = @Dil)

	IF(@@ROWCOUNT < 1)
		INSERT INTO TblEtkinlikDetay (EtkinlikId, Dil, Baslik, Detay) 
		VALUES(@EtkinlikId, @Dil, @Baslik, @Detay)
 END













































GO
/****** Object:  StoredProcedure [snlg_V1].[msp_EtkinlikEkle]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [snlg_V1].[msp_EtkinlikEkle]
	@Baslik nvarchar(150), @Detay nvarchar(MAX),
	@Tarih1 smalldatetime, @Tarih2 smalldatetime, @Resim varchar(250)
AS
SET NOCOUNT ON;

DECLARE @DefaultLang smallint
SELECT TOP(1) @DefaultLang = Deger FROM snlg_V1.TblDegiskenler WHERE  Degisken = 'DefaultLang'

INSERT INTO TblEtkinlikApp (Tarih1, Tarih2, Resim) 
VALUES (@Tarih1, @Tarih2, @Resim)

DECLARE @EtkinlikId int
SET @EtkinlikId = SCOPE_IDENTITY()

INSERT INTO TblEtkinlikDetay (EtkinlikId, Dil, Baslik, Detay) 
VALUES (@EtkinlikId, @DefaultLang, @Baslik, @Detay)








GO
/****** Object:  StoredProcedure [snlg_V1].[msp_EtkinlikSil]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [snlg_V1].[msp_EtkinlikSil]
	@EtkinlikId varchar(4000)
AS
SET NOCOUNT ON;

DECLARE @ResimlerSql NVARCHAR(4000)
DECLARE @Params NVARCHAR(4000), @Resimler varchar(8000)
SET @ResimlerSql = N'SET @ResimlerOUT = 
		(
		SELECT       Resim AS [data()], '','' AS [data()]
		FROM         snlg_V1.TblEtkinlikApp
		WHERE       EtkinlikId IN ('+@EtkinlikId+')
		FOR XML path('''')
		)
		
		DELETE FROM snlg_V1.TblEtkinlikApp WHERE EtkinlikId IN ('+@EtkinlikId+')  
'
SET @Params = N'@ResimlerOUT varchar(8000) OUTPUT'
EXECUTE sp_executesql
@ResimlerSql, @Params, @ResimlerOUT=@Resimler OUTPUT

SELECT @Resimler










































GO
/****** Object:  StoredProcedure [snlg_V1].[msp_GaleriResimDetaySec]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [snlg_V1].[msp_GaleriResimDetaySec]
	@RId int, @Dil smallint
AS
SET NOCOUNT ON;

DECLARE @Diller varchar(1000)
SET @Diller = 
		(
		SELECT        TblDiller.DId AS [data()], '#' AS [data()], TblDiller.Name AS [data()], '#' AS [data()]
		FROM            TblDiller WHERE Aktif = 1 ORDER BY TblDiller.DId FOR XML path('')
		)

SELECT TblResimGaleriResimlerApp.RId, TblResimGaleriResimlerDetay.Baslik,TblResimGaleriResimlerApp.Sira, @Diller AS Diller,
	TblResimGaleriResimlerDetay.Bilgi, TblResimGaleriResimlerApp.Resim, TblResimGaleriResimlerApp.GId , 
	TblResimGaleriResimlerApp.LinkUrl
FROM TblResimGaleriResimlerApp LEFT OUTER JOIN 
	TblResimGaleriResimlerDetay ON TblResimGaleriResimlerApp.RId = TblResimGaleriResimlerDetay.RId AND TblResimGaleriResimlerDetay.Dil = @Dil 
WHERE (TblResimGaleriResimlerApp.RId = @RId)













































GO
/****** Object:  StoredProcedure [snlg_V1].[msp_GaleriResimDuzenle]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [snlg_V1].[msp_GaleriResimDuzenle]
	@RId int, @Baslik nvarchar(150),@GId int,
	@Bilgi nvarchar(500), @Dil smallint, @Resim varchar(250),@Sira smallint, @LinkUrl varchar(500)
AS
SET NOCOUNT ON;

UPDATE TblResimGaleriResimlerApp 
SET Resim = ISNULL(@Resim, Resim), GId =  @GId, LinkUrl = @LinkUrl,Sira=@Sira
WHERE (RId = @RId) 

IF (@@ROWCOUNT > 0)
 BEGIN--bu app'nin böyle bir kategorisi varsa diğer işlemlere devam et	 
	UPDATE TblResimGaleriResimlerDetay SET Baslik = @Baslik, Bilgi = @Bilgi
	WHERE (RId = @RId) AND (Dil = @Dil)

	IF(@@ROWCOUNT < 1)
		INSERT INTO TblResimGaleriResimlerDetay (RId, Dil, Baslik, Bilgi) 
		VALUES(@RId, @Dil, @Baslik, @Bilgi)
 END





















































GO
/****** Object:  StoredProcedure [snlg_V1].[msp_GaleriResimEkle]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [snlg_V1].[msp_GaleriResimEkle]
	@Baslik nvarchar(150), @GId int,
	@Bilgi nvarchar(500), @Resim varchar(250), @LinkUrl varchar(500)
AS
SET NOCOUNT ON;

DECLARE @DefaultLang smallint
SELECT TOP(1) @DefaultLang = Deger FROM snlg_V1.TblDegiskenler WHERE  Degisken = 'DefaultLang'

INSERT INTO TblResimGaleriResimlerApp (Resim, GId, LinkUrl) 
VALUES (@Resim, @GId, @LinkUrl)

DECLARE @RId int
SET @RId = SCOPE_IDENTITY()

INSERT INTO TblResimGaleriResimlerDetay (RId, Dil, Baslik, Bilgi) 
VALUES (@RId, @DefaultLang, @Baslik, @Bilgi)








GO
/****** Object:  StoredProcedure [snlg_V1].[msp_HaberDetaySec]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [snlg_V1].[msp_HaberDetaySec]
	@HaberId int, @Dil smallint
AS
SET NOCOUNT ON;

DECLARE @Diller varchar(1000)
SET @Diller = 
		(
		SELECT        TblDiller.DId AS [data()], '#' AS [data()], TblDiller.Name AS [data()], '#' AS [data()]
		FROM            TblDiller WHERE Aktif = 1 ORDER BY TblDiller.DId FOR XML path('')
		)

SELECT TblHaberApp.HaberId, TblHaberApp.Gorunurluk, TblHaberDetay.Baslik, @Diller AS Diller,
	TblHaberDetay.Bilgi, TblHaberDetay.Haber, TblHaberApp.Tarih, TblHaberApp.Resim,
	TblHaberDetay.SeoUrl, TblHaberApp.AramaIndex
FROM TblHaberApp LEFT OUTER JOIN 
	TblHaberDetay ON TblHaberApp.HaberId = TblHaberDetay.HaberId AND TblHaberDetay.Dil = @Dil 
WHERE (TblHaberApp.HaberId = @HaberId)











































GO
/****** Object:  StoredProcedure [snlg_V1].[msp_HaberDuzenle]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [snlg_V1].[msp_HaberDuzenle]
	@HaberId int,@SeoUrl varchar(500),@AramaIndex bit,
	@Gorunurluk tinyint, @Baslik nvarchar(150), @Haber nvarchar(MAX),
	@Bilgi nvarchar(750), @Tarih date, @Dil smallint, @Resim varchar(250)
AS
SET NOCOUNT ON;


DECLARE @EskiSeoUrl varchar(1000), @UrlKeyValue varchar(500)
SELECT @UrlKeyValue=UrlKeyValue FROM snlg_v1.TblUrlKeys WHERE UrlKeyName = 'news' AND Dil = @Dil


SET @SeoUrl = snlg_V1.fun_UrlOlustur(ISNULL(@SeoUrl,@Baslik), 'news', 'news', @HaberId,@Dil)
UPDATE snlg_V1.TblSiteLinkleri SET @EskiSeoUrl=SeoUrl, SeoUrl = @SeoUrl where Id = @HaberId AND Dil=@Dil AND SablonAnahtar = 'news'
IF(@@ROWCOUNT < 1)
	INSERT INTO snlg_V1.TblSiteLinkleri (SeoUrl, Id,Dil, UrlAnahtar, SablonAnahtar) VALUES (@SeoUrl, @HaberId,@Dil,'news','news')


IF(NOT @SeoUrl = @EskiSeoUrl)
	UPDATE TblMenuDetay SET MenuLink='/' + @UrlKeyValue + '/' + @SeoUrl WHERE MenuLink = '/'+ @UrlKeyValue +'/' + @EskiSeoUrl


UPDATE TblHaberApp 
SET Gorunurluk = @Gorunurluk, Tarih = @Tarih, Resim = ISNULL(@Resim, Resim),
	 AramaIndex = @AramaIndex
WHERE (HaberId = @HaberId) 

IF (@@ROWCOUNT > 0)
 BEGIN--bu app'nin böyle bir kategorisi varsa diğer işlemlere devam et	 
	UPDATE TblHaberDetay SET Baslik = @Baslik, Bilgi = @Bilgi,SeoUrl=@SeoUrl,
		Haber = @Haber
	WHERE (HaberId = @HaberId) AND (Dil = @Dil)

	IF(@@ROWCOUNT < 1)
		INSERT INTO TblHaberDetay (HaberId, Dil,SeoUrl,Baslik, Bilgi, Haber) 
		VALUES(@HaberId, @Dil,@SeoUrl, @Baslik, @Bilgi, @Haber)
 END




















































GO
/****** Object:  StoredProcedure [snlg_V1].[msp_HaberEkle]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [snlg_V1].[msp_HaberEkle]
	@Gorunurluk tinyint,@SeoUrl varchar(500), 
	@Baslik nvarchar(150), @Haber nvarchar(MAX),@AramaIndex bit,
	@Bilgi nvarchar(750), @Tarih date, @Resim varchar(250)
AS
SET NOCOUNT ON;

DECLARE @DefaultLang smallint
SELECT TOP(1) @DefaultLang = Deger FROM snlg_V1.TblDegiskenler WHERE  Degisken = 'DefaultLang'

SET @SeoUrl = snlg_V1.fun_UrlOlustur(ISNULL(@SeoUrl,@Baslik), 'news', NULL, NULL,@DefaultLang)

INSERT INTO TblHaberApp (Gorunurluk, Tarih, Resim,AramaIndex)
VALUES (@Gorunurluk, @Tarih, @Resim,@AramaIndex)

DECLARE @HaberId int
SET @HaberId = SCOPE_IDENTITY()

INSERT INTO TblHaberDetay (HaberId, Dil,SeoUrl, Baslik, Bilgi, Haber) 
VALUES (@HaberId, @DefaultLang,@SeoUrl, @Baslik, @Bilgi, @Haber)

INSERT INTO snlg_V1.TblSiteLinkleri (SeoUrl, Id,Dil, UrlAnahtar, SablonAnahtar) VALUES (@SeoUrl, @HaberId, @DefaultLang,'news','news')







GO
/****** Object:  StoredProcedure [snlg_V1].[msp_HaberSil]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [snlg_V1].[msp_HaberSil]
	@HaberId varchar(4000)
AS
SET NOCOUNT ON;

DECLARE @ResimlerSql NVARCHAR(4000)
DECLARE @Params NVARCHAR(4000), @Resimler varchar(8000)
SET @ResimlerSql = N'SET @ResimlerOUT = 
		(
		SELECT       Resim AS [data()], '','' AS [data()]
		FROM         snlg_V1.TblHaberApp
		WHERE       HaberId IN ('+@HaberId+')
		FOR XML path('''')
		)
		
		DELETE FROM snlg_V1.TblSiteLinkleri WHERE Id IN ('+@HaberId+') AND SablonAnahtar = ''news''
		DELETE FROM snlg_V1.TblHaberApp WHERE HaberId IN ('+@HaberId+')  
'
SET @Params = N'@ResimlerOUT varchar(8000) OUTPUT'
EXECUTE sp_executesql
@ResimlerSql, @Params, @ResimlerOUT=@Resimler OUTPUT

SELECT @Resimler










































GO
/****** Object:  StoredProcedure [snlg_V1].[msp_LinkListele]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [snlg_V1].[msp_LinkListele]
	@Dil smallint
AS
SET NOCOUNT ON;

DECLARE @SeoUrl varchar(500), @urlExtension varchar(50)
SELECT TOP(1) @urlExtension = Deger FROM snlg_V1.TblDegiskenler WHERE  Degisken = 'urlExtension'

SELECT REPLACE(('/' 
					+ ISNULL((SELECT TOP(1) UrlKeyValue FROM snlg_V1.TblUrlKeys WHERE UrlKeyName = UrlAnahtar AND Dil = @Dil), '')
					+ '/' 
					+ ISNULL(SeoUrl, (SELECT TOP(1) SeoUrl FROM snlg_V1.TblSiteLinkleri WHERE Id = T1.Id AND UrlAnahtar = T1.UrlAnahtar AND SablonAnahtar = T1.SablonAnahtar)))
				, '//', '/') AS Link,
		REPLACE(('/' 
					+ ISNULL((SELECT TOP(1) UrlKeyValue FROM snlg_V1.TblUrlKeys WHERE UrlKeyName = UrlAnahtar AND Dil = @Dil), '') 
					+ '/' 
					+ ISNULL(SeoUrl, (SELECT TOP(1) SeoUrl FROM snlg_V1.TblSiteLinkleri WHERE Id = T1.Id AND UrlAnahtar = T1.UrlAnahtar AND SablonAnahtar = T1.SablonAnahtar))
					+ @urlExtension)
				, '//', '/') AS LinkText
FROM snlg_V1.TblSiteLinkleri AS T1
WHERE  UrlAnahtar <> 'user' AND Dil = ISNULL(@Dil, Dil)
order by Dil, UrlAnahtar, LinkText














GO
/****** Object:  StoredProcedure [snlg_V1].[msp_MakaleDetaySec]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [snlg_V1].[msp_MakaleDetaySec]
	@MakId int, @Dil smallint, @YazarId int, @AdminId int
AS
SET NOCOUNT ON;

DECLARE @Diller varchar(1000)
SET @Diller = 
		(
		SELECT        TblDiller.DId AS [data()], '#' AS [data()], TblDiller.Name AS [data()], '#' AS [data()]
		FROM            TblDiller WHERE Aktif = 1 ORDER BY TblDiller.DId FOR XML path('')
		)

SELECT TblMakaleApp.MakId, TblMakaleApp.Sira, TblMakaleApp.Gorunurluk,
	TblMakaleDetay.Baslik, TblMakaleDetay.Bilgi, TblMakaleDetay.Keyword, TblMakaleDetay.Descr, 
	TblMakaleDetay.Icerik, TblMakaleApp.YazarId, TblMakaleApp.Tarih, TblMakaleApp.Resim,
	@Diller AS Diller,TblMakaleDetay.SeoUrl , TblMakaleApp.AramaIndex
FROM TblMakaleApp LEFT OUTER JOIN TblMakaleDetay ON 
	TblMakaleApp.MakId = TblMakaleDetay.MakId AND TblMakaleDetay.Dil = @Dil
WHERE (TblMakaleApp.MakId = @MakId) AND 
		(TblMakaleApp.YazarId = (CASE WHEN @YazarId = @AdminId THEN TblMakaleApp.YazarId ELSE TblMakaleApp.YazarId END)) 











































GO
/****** Object:  StoredProcedure [snlg_V1].[msp_MakaleDuzenle]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [snlg_V1].[msp_MakaleDuzenle]
	@MakId int, @KtgSql nvarchar(max), @Sira smallint, 
	@Gorunurluk tinyint, @Baslik nvarchar(250), @Icerik nvarchar(MAX),
	@Bilgi nvarchar(750), @Keyword nvarchar(500), @Descr nvarchar(500),
	@Tarih date, @Dil smallint, @Resim varchar(250),@SeoUrl varchar(500),
	@AramaIndex bit
AS
SET NOCOUNT ON;

SET @Keyword = REPLACE(@Keyword, ',', ', ')
SET @Keyword = REPLACE(@Keyword, '  ', ' ')

DECLARE @EskiSeoUrl varchar(1000), @UrlKeyValue varchar(500)
SELECT @UrlKeyValue=UrlKeyValue FROM snlg_v1.TblUrlKeys WHERE UrlKeyName = 'blog' AND Dil = @Dil


SET @SeoUrl = snlg_V1.fun_UrlOlustur(ISNULL(@SeoUrl,@Baslik),'blog', 'blog', @MakId,@Dil)
UPDATE snlg_V1.TblSiteLinkleri SET @EskiSeoUrl=SeoUrl, SeoUrl = @SeoUrl where Id = @MakId AND Dil=@Dil AND SablonAnahtar = 'blog'
IF(@@ROWCOUNT < 1)
	INSERT INTO snlg_V1.TblSiteLinkleri (SeoUrl, Id,Dil, UrlAnahtar, SablonAnahtar) VALUES (@SeoUrl, @MakId,@Dil,'blog', 'blog')


IF(NOT @SeoUrl = @EskiSeoUrl)
	UPDATE TblMenuDetay SET MenuLink='/' + @UrlKeyValue + '/' + @SeoUrl WHERE MenuLink = '/'+ @UrlKeyValue +'/' + @EskiSeoUrl


UPDATE TblMakaleApp 
SET Gorunurluk = @Gorunurluk, Tarih = @Tarih, Resim = ISNULL(@Resim, Resim),
		Sira = @Sira, AramaIndex=@AramaIndex
WHERE (MakId = @MakId) 

IF (@@ROWCOUNT > 0)
BEGIN--bu app'nin böyle bir kategorisi varsa diğer işlemlere devam et
	IF(@KtgSql IS NOT NULL AND @KtgSql != '')
	BEGIN
		DELETE FROM TblMakale_Kategori WHERE MakId = @MakId
		SET @KtgSql = REPLACE(@KtgSql,'@MakId',@MakId)
		EXEC SP_EXECUTESQL @KtgSql;
	END
	 
	UPDATE TblMakaleDetay SET Baslik = @Baslik, Bilgi = @Bilgi, 
		Icerik = @Icerik, Keyword = @Keyword, Descr = @Descr ,SeoUrl =@SeoUrl
	WHERE (MakId = @MakId) AND (Dil = @Dil)

	IF(@@ROWCOUNT < 1)
		INSERT INTO TblMakaleDetay (MakId, Dil,SeoUrl,Baslik, Bilgi, Icerik, Keyword , Descr) 
		VALUES(@MakId, @Dil,@SeoUrl,@Baslik, @Bilgi, @Icerik, @Keyword , @Descr)
END




GO
/****** Object:  StoredProcedure [snlg_V1].[msp_MakaleEkle]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [snlg_V1].[msp_MakaleEkle]
	@KtgSql nvarchar(max), @Sira smallint, @Gorunurluk tinyint, 
	@Baslik nvarchar(250), @Icerik nvarchar(MAX),@AramaIndex bit,
	@Bilgi nvarchar(750), @Keyword nvarchar(500), @Descr nvarchar(500),
	@YazarId int, @Tarih date, @Resim varchar(250),@SeoUrl varchar(500),
	@MakId int OUT
AS
SET NOCOUNT ON;

	SET @Keyword = REPLACE(@Keyword, ',', ', ')
	SET @Keyword = REPLACE(@Keyword, '  ', ' ')

	DECLARE @DefaultLang smallint
	SELECT TOP(1) @DefaultLang = Deger FROM snlg_V1.TblDegiskenler WHERE  Degisken = 'DefaultLang'

	SET @SeoUrl = snlg_V1.fun_UrlOlustur(ISNULL(@SeoUrl,@Baslik), 'blog', NULL, NULL,@DefaultLang)

	INSERT INTO TblMakaleApp ( Sira, Gorunurluk, YazarId, Tarih, Resim,AramaIndex)
	VALUES (@Sira, @Gorunurluk, @YazarId, @Tarih, @Resim,@AramaIndex)

	SET @MakId = SCOPE_IDENTITY()

	INSERT INTO TblMakaleDetay (MakId, Dil,SeoUrl,Baslik, Bilgi, Icerik, Keyword , Descr) 
	VALUES (@MakId, @DefaultLang,@SeoUrl,@Baslik, @Bilgi, @Icerik, @Keyword , @Descr)

	INSERT INTO snlg_V1.TblSiteLinkleri (SeoUrl, Id,Dil, UrlAnahtar, SablonAnahtar) VALUES (@SeoUrl, @MakId,@DefaultLang,'blog', 'blog')

	IF(@KtgSql IS NOT NULL AND @KtgSql != '')
	 BEGIN
		SET @KtgSql = REPLACE(@KtgSql,'@MakId',@MakId)
		EXEC SP_EXECUTESQL @KtgSql;
	 END




GO
/****** Object:  StoredProcedure [snlg_V1].[msp_MakaleKategoriDetaySec]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [snlg_V1].[msp_MakaleKategoriDetaySec]
	@Dil int, @KtgID smallint
AS
SET NOCOUNT ON;

DECLARE @Diller varchar(1000)
SET @Diller = 
		(
		SELECT        TblDiller.DId AS [data()], '#' AS [data()], TblDiller.Name AS [data()], '#' AS [data()]
		FROM            TblDiller WHERE Aktif = 1 ORDER BY TblDiller.DId FOR XML path('')
		)

SELECT TMKA.KtgId, TMKA.Aktif,TMKA.Resim,TMKD.SeoUrl,TMKD.KtgAd,
		TMKA.UstId, TMKD.Keyword,TMKD.Descr,@Diller AS Diller
FROM  TblMakaleKtgApp AS TMKA LEFT OUTER JOIN 
		TblMakaleKtgDetay AS TMKD ON TMKA.KtgId = TMKD.KtgId AND TMKD.Dil = @Dil
WHERE (TMKA.KtgId = @KtgID)









GO
/****** Object:  StoredProcedure [snlg_V1].[msp_MakaleKategoriDuzenle]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [snlg_V1].[msp_MakaleKategoriDuzenle]
@KtgID int,
@UstID int,
@Dil int,
@KtgAd nvarchar(200), 
@Sira int, 
@Aktif bit, 
@Resim varchar(250), 
@SeoUrl varchar(500),
@Keyword varchar(500),
@Descr varchar(500)
AS
SET NOCOUNT ON;

SET @SeoUrl = snlg_V1.fun_UrlOlustur(ISNULL(@SeoUrl,@KtgAd), 'blog', 'blogCtg',@KtgID,@Dil)
UPDATE snlg_V1.TblSiteLinkleri SET SeoUrl = @SeoUrl where  Id = @KtgID AND Dil=@Dil AND SablonAnahtar = 'blogCtg'
IF(@@ROWCOUNT < 1)
	INSERT INTO snlg_V1.TblSiteLinkleri (SeoUrl, Id,Dil,UrlAnahtar, SablonAnahtar) VALUES (@SeoUrl, @KtgID,@Dil, 'blog', 'blogCtg')


UPDATE    TblMakaleKtgApp
SET    UstId = @UstID, Sira = @Sira, Aktif = @Aktif,Resim=@Resim
WHERE     (KtgId = @KtgID)
 
IF(@@ROWCOUNT > 0)--bu app'nin böyle bir kayıt varsa diğer işlemlere devam et
 BEGIN 
	UPDATE TblMakaleKtgDetay SET 
			Descr = @Descr, Keyword = @Keyword,SeoUrl=@SeoUrl,KtgAd=@KtgAd
	WHERE KtgId = @KtgID AND Dil = @Dil
	--kategori güncellenmemişse yok demektir hemen yenisini oluşturalım
	IF(@@ROWCOUNT < 1)
		INSERT INTO TblMakaleKtgDetay (KtgId, Dil,SeoUrl,KtgAd, Keyword, Descr) 
			VALUES(@KtgID,@Dil,@SeoUrl,@KtgAd, @Keyword, @Descr)		
 END




GO
/****** Object:  StoredProcedure [snlg_V1].[msp_MakaleKategoriOlustur]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [snlg_V1].[msp_MakaleKategoriOlustur]
	@UstID int,
	@KtgAd nvarchar(200), 
	@Sira int, 
	@Aktif bit, 
	@Resim varchar(250), 
	@SeoUrl varchar(500),
	@Keyword varchar(500),
	@Descr varchar(500)
AS
SET NOCOUNT ON;

DECLARE @DefaultLang smallint
SELECT TOP(1) @DefaultLang = Deger FROM snlg_V1.TblDegiskenler WHERE  Degisken = 'DefaultLang'

DECLARE @KtgID int
SET @SeoUrl = snlg_V1.fun_UrlOlustur(ISNULL(@SeoUrl,@KtgAd), 'blog', NULL, NULL,@DefaultLang)

INSERT INTO TblMakaleKtgApp (UstId, Sira, Aktif,Resim)
VALUES(@UstID, @Sira, @Aktif,@Resim)

SELECT @KtgID = SCOPE_IDENTITY()

INSERT INTO TblMakaleKtgDetay (KtgId, Dil,SeoUrl,KtgAd, Keyword, Descr) 
VALUES(@KtgID,@DefaultLang,@SeoUrl,@KtgAd, @Keyword, @Descr)

INSERT INTO snlg_V1.TblSiteLinkleri (SeoUrl, Id,Dil,UrlAnahtar, SablonAnahtar) 
			VALUES (@SeoUrl, @KtgID,@DefaultLang,'blog','blogCtg')




GO
/****** Object:  StoredProcedure [snlg_V1].[msp_MakaleKtgSil]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [snlg_V1].[msp_MakaleKtgSil]
	@KtgId int, @Dil int
AS
SET NOCOUNT ON;

DECLARE @DefaultLang smallint
SELECT TOP(1) @DefaultLang = Deger FROM snlg_V1.TblDegiskenler WHERE  Degisken = 'DefaultLang'

DELETE FROM TblMakaleKtgDetay WHERE (KtgId = @KtgId) AND Dil = @Dil
DELETE FROM [snlg_V1].TblSiteLinkleri WHERE  Id = @KtgId AND SablonAnahtar = 'blogCtg' AND Dil = @Dil


IF(@DefaultLang = @Dil OR NOT EXISTS(SELECT * FROM TblProjeKtgDetay WHERE (KtgId = @KtgId)))
BEGIN
	DELETE FROM TblMakale_Kategori WHERE (KtgId = @KtgId); 
	DELETE FROM TblMakaleKtgApp WHERE (KtgId = @KtgId) 
	DELETE FROM TblSiteLinkleri WHERE  Id = @KtgId AND SablonAnahtar = 'blogCtg'
END




GO
/****** Object:  StoredProcedure [snlg_V1].[msp_Makaleler]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [snlg_V1].[msp_Makaleler]
	@KtgId int, @YazarId int, @AdminId int
AS
SET NOCOUNT ON;

IF(@KtgId IS NULL)
	SELECT  TblMakaleApp.MakId, TblMakaleApp.Sira, TblMakaleDetay.Baslik,
	TblMakaleApp.Gorunurluk
	FROM    TblMakaleApp INNER JOIN
              TblMakaleDetay ON TblMakaleApp.MakId = TblMakaleDetay.MakId AND
		(TblMakaleApp.YazarId = (CASE WHEN @YazarId = @AdminId THEN TblMakaleApp.YazarId ELSE TblMakaleApp.YazarId END)) 
		
	ORDER BY TblMakaleApp.Sira ASC
ELSE
	SELECT  TblMakaleApp.MakId, TblMakaleApp.Sira, TblMakaleDetay.Baslik,
	TblMakaleApp.Gorunurluk
	FROM    TblMakaleApp INNER JOIN
              TblMakaleDetay ON TblMakaleApp.MakId = TblMakaleDetay.MakId 
	WHERE   (TblMakaleApp.YazarId = (CASE WHEN @YazarId = @AdminId THEN TblMakaleApp.YazarId ELSE @YazarId END))  
		AND EXISTS(SELECT * FROM TblMakale_Kategori WHERE KtgId = @KtgId AND MakId = TblMakaleApp.MakId)
	ORDER BY TblMakaleApp.Sira ASC




GO
/****** Object:  StoredProcedure [snlg_V1].[msp_MakaleSil]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [snlg_V1].[msp_MakaleSil]
	@MakId varchar(4000)
AS
SET NOCOUNT ON;

DECLARE @ResimlerSql NVARCHAR(4000)
DECLARE @Params NVARCHAR(4000), @Resimler varchar(8000)
SET @ResimlerSql = N'SET @ResimlerOUT = 
		(
		SELECT       Resim AS [data()], '','' AS [data()]
		FROM         snlg_V1.TblMakaleApp
		WHERE       MakId IN ('+@MakId+')
		FOR XML path('''')
		)
		
		DELETE FROM snlg_V1.TblSiteLinkleri WHERE Id IN ('+@MakId+') AND SablonAnahtar = ''blog''
		DELETE FROM snlg_V1.TblMakaleYorum WHERE MakId IN ('+@MakId+')
		DELETE FROM snlg_V1.TblMakalePuan WHERE MakId IN ('+@MakId+')
		DELETE FROM snlg_V1.TblMakaleApp WHERE MakId IN ('+@MakId+')  
'
SET @Params = N'@ResimlerOUT varchar(8000) OUTPUT'
EXECUTE sp_executesql
@ResimlerSql, @Params, @ResimlerOUT=@Resimler OUTPUT

SELECT @Resimler
































GO
/****** Object:  StoredProcedure [snlg_V1].[msp_MakaleYorumCevapEposta]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [snlg_V1].[msp_MakaleYorumCevapEposta]
	@YId int
AS
SET NOCOUNT ON;

	DECLARE @DefaultLang smallint
	SELECT TOP(1) @DefaultLang = Deger FROM snlg_V1.TblDegiskenler WHERE  Degisken = 'DefaultLang'

	DECLARE @SeoUrl varchar(500), @urlExtension varchar(50), @BlogKey varchar(100), @MakID int
	SELECT TOP(1) @urlExtension = Deger FROM snlg_V1.TblDegiskenler WHERE  Degisken = 'urlExtension'
	SELECT TOP(1) @BlogKey = UrlKeyValue FROM snlg_V1.TblUrlKeys WHERE UrlKeyName = 'Blog' AND Dil = CAST(@DefaultLang AS VARCHAR(50))

	SELECT TOP(1) @MakID = MakID FROM  TblMakaleYorum  WHERE (YId = @YId);

	SELECT TOP(1) @SeoUrl = '/tr/' + @BlogKey + SeoUrl + @urlExtension FROM TblMakaleDetay WHERE MakID = @MakID AND Dil = @DefaultLang;

	
	SELECT TOP(1) ISNULL(TUA.EPosta,MY.EPosta) AS Kime, @SeoUrl AS SeoUrl
	FROM  TblMakaleYorum AS MY LEFT OUTER JOIN 
			TblUyeApp AS TUA ON TUA.UyeId = MY.UyeId
	WHERE MakID = @MakID AND NOT YId = @YId


GO
/****** Object:  StoredProcedure [snlg_V1].[msp_MakaleYorumDetay]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [snlg_V1].[msp_MakaleYorumDetay]
	@YId int
AS
SET NOCOUNT ON;

DECLARE @DefaultLang smallint
SELECT TOP(1) @DefaultLang = Deger FROM snlg_V1.TblDegiskenler WHERE  Degisken = 'DefaultLang'

SELECT TMY.YId, TMY.Yorum, TMY.Onay, TM.Baslik,TUA.UyeId,
		ISNULL(TUA.EPosta,TMY.Eposta) AS Eposta,ISNULL(TUA.UserName,TMY.Yazan) AS Yazan
FROM         TblMakaleYorum AS TMY INNER JOIN
                TblMakaleDetay AS TM ON TMY.MakId = TM.MakId AND (TM.Dil = @DefaultLang) LEFT OUTER JOIN
                TblUyeApp AS TUA ON TMY.UyeId = TUA.UyeId
WHERE     (TMY.YId = @YId) 








GO
/****** Object:  StoredProcedure [snlg_V1].[msp_MakaleYorumGuncelle]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [snlg_V1].[msp_MakaleYorumGuncelle]
	@YId int, @Onay bit, @Yorum nvarchar(max), @Yazan nvarchar(30), 
	@EPosta varchar(150)
AS
SET NOCOUNT ON;

UPDATE    TblMakaleYorum
SET Yorum = @Yorum, Onay = @Onay, 
		Yazan = CASE WHEN UyeId IS NOT NULL THEN NULL ELSE @Yazan END,
		EPosta = CASE WHEN UyeId IS NOT NULL THEN NULL ELSE @EPosta END
WHERE     (YId = @YId)

































GO
/****** Object:  StoredProcedure [snlg_V1].[msp_MakaleYorumlar]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [snlg_V1].[msp_MakaleYorumlar]
	@Onay bit
AS
SET NOCOUNT ON;

DECLARE @DefaultLang smallint
SELECT TOP(1) @DefaultLang = Deger FROM snlg_V1.TblDegiskenler WHERE  Degisken = 'DefaultLang'

SELECT     TIY.YId, TI.Baslik
FROM         TblMakaleYorum AS TIY INNER JOIN
                      TblMakaleApp AS TIA ON TIY.MakId = TIA.MakId INNER JOIN
                      TblMakaleDetay AS TI ON TIA.MakId = TI.MakId AND (TI.Dil = @DefaultLang) 
WHERE     (TIY.Onay = @Onay) 
ORDER BY TIY.YId DESC







GO
/****** Object:  StoredProcedure [snlg_V1].[msp_MenuKategoriDetaySec]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [snlg_V1].[msp_MenuKategoriDetaySec]
	@Dil int, @MenuId smallint
AS
SET NOCOUNT ON;

DECLARE @Diller varchar(1000)
SET @Diller = 
		(
		SELECT        TblDiller.DId AS [data()], '#' AS [data()], TblDiller.Name AS [data()], '#' AS [data()]
		FROM            TblDiller WHERE Aktif = 1 ORDER BY TblDiller.DId FOR XML path('')
		)

SELECT TBMA.MenuId,TBMA.Hedef,TBMA.Sira,TBMA.UstId,TBMA.Aktif,TBMA.Resim,
TBMD.MenuItem,TBMD.MenuLink,@Diller AS Diller
FROM  TblMenuApp AS TBMA LEFT OUTER JOIN 
		TblMenuDetay AS TBMD ON TBMA.MenuId = TBMD.MenuId AND TBMD.Dil = @Dil
WHERE (TBMA.MenuId = @MenuId)








GO
/****** Object:  StoredProcedure [snlg_V1].[msp_MenuKategoriDuzenle]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [snlg_V1].[msp_MenuKategoriDuzenle]
@UstId int ,
@MenuId int,
@Dil int,
@MenuItem nvarchar(200), 
@Aktif bit, 
@Resim varchar(250), 
@MenuLink varchar(500),
@Hedef varchar(250)
AS
SET NOCOUNT ON;


UPDATE    TblMenuApp
SET    UstId = @UstId, Aktif = @Aktif,Resim=@Resim,Hedef=@Hedef
WHERE     (MenuId = @MenuId)

IF(@@ROWCOUNT > 0)--bu app'nin böyle bir kayıt varsa diğer işlemlere devam et
 BEGIN 
	UPDATE TblMenuDetay SET 
			MenuLink=@MenuLink,MenuItem=@MenuItem
	WHERE MenuId = @MenuId AND Dil = @Dil
	--menü güncellenmemişse yok demektir hemen yenisini oluşturalım
	IF(@@ROWCOUNT < 1)
		INSERT INTO TblMenuDetay (MenuId, Dil,MenuLink,MenuItem) 
			VALUES(@MenuId,@Dil,@MenuLink,@MenuItem)		
 END









GO
/****** Object:  StoredProcedure [snlg_V1].[msp_MenuKategoriOlustur]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [snlg_V1].[msp_MenuKategoriOlustur]
	@UCId int ,
	@UstId int ,
	@MenuItem nvarchar(200), 
	@Aktif bit, 
	@Resim varchar(250), 
	@MenuLink varchar(500),
	@Hedef varchar(250)
AS
SET NOCOUNT ON;

DECLARE @MenuID int
--SET @MenuLink = snlg_V1.fun_UrlOlustur(ISNULL(@MenuLink,@MenuItem), 'shop', NULL, NULL,@DefaultLang)
DECLARE @DefaultLang smallint
SELECT TOP(1) @DefaultLang = Deger FROM snlg_V1.TblDegiskenler WHERE  Degisken = 'DefaultLang'

INSERT INTO TblMenuApp (UstId,Sira, Aktif,Resim,Hedef, UCId)
VALUES(@UstId,(SELECT MAX(Sira)+1 FROM TblMenuApp), @Aktif,@Resim,@Hedef, @UCId)

SELECT @MenuID = SCOPE_IDENTITY()

INSERT INTO TblMenuDetay (MenuID, Dil,MenuLink,MenuItem) 
VALUES(@MenuID,@DefaultLang,@MenuLink,@MenuItem)




GO
/****** Object:  StoredProcedure [snlg_V1].[msp_MenuKategoriSil]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [snlg_V1].[msp_MenuKategoriSil]
	@MenuId int, @Dil int
AS
SET NOCOUNT ON;

DECLARE @DefaultLang smallint
SELECT TOP(1) @DefaultLang = Deger FROM snlg_V1.TblDegiskenler WHERE  Degisken = 'DefaultLang'

DELETE FROM TblMenuDetay WHERE (MenuId = @MenuId) AND Dil = @Dil; 

IF(@DefaultLang = @Dil OR NOT EXISTS(SELECT * FROM TblMenuDetay WHERE (MenuId = @MenuId)))
	DELETE FROM TblMenuApp WHERE (MenuId = @MenuId)



GO
/****** Object:  StoredProcedure [snlg_V1].[msp_PlaceHolderEkle]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [snlg_V1].[msp_PlaceHolderEkle]
	@Title nvarchar(100), @PHName nvarchar(100)
AS
SET NOCOUNT ON;

IF NOT EXISTS(SELECT ContainerId FROM TblPlaceHolders WHERE  PHName = @PHName)
	INSERT INTO TblPlaceHolders (PHName, Title) VALUES(@PHName, @Title)


































GO
/****** Object:  StoredProcedure [snlg_V1].[msp_ProjeAltBilgiDetaySec]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [snlg_V1].[msp_ProjeAltBilgiDetaySec]
	@ProjeAltId int, @Dil smallint
AS
SET NOCOUNT ON;

DECLARE @Diller varchar(1000)
SET @Diller = 
		(
		SELECT        TblDiller.DId AS [data()], '#' AS [data()], TblDiller.Name AS [data()], '#' AS [data()]
		FROM            TblDiller WHERE Aktif = 1 ORDER BY TblDiller.DId FOR XML path('')
		)

SELECT TblProjeAltBilgiApp.ProjeAltId, TblProjeAltBilgiApp.ProjeId, TblProjeAltBilgiApp.Sira,
	TblProjeAltBilgiDetay.Baslik, TblProjeAltBilgiDetay.Keyword, TblProjeAltBilgiDetay.Descr, 
	TblProjeAltBilgiDetay.Icerik, @Diller AS Diller, TblProjeAltBilgiDetay.SeoUrl, TblProjeAltBilgiApp.Gorunurluk,
	TblProjeAltBilgiApp.AramaIndex
FROM TblProjeAltBilgiApp LEFT OUTER JOIN TblProjeAltBilgiDetay ON 
	TblProjeAltBilgiApp.ProjeAltId = TblProjeAltBilgiDetay.ProjeAltId AND TblProjeAltBilgiDetay.Dil = @Dil
WHERE (TblProjeAltBilgiApp.ProjeAltId = @ProjeAltId)































GO
/****** Object:  StoredProcedure [snlg_V1].[msp_ProjeAltBilgiDuzenle]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [snlg_V1].[msp_ProjeAltBilgiDuzenle]
	@ProjeAltId int, @ProjeId int, @Sira tinyint, 
	@Gorunurluk tinyint, @Baslik nvarchar(250), @Icerik nvarchar(MAX),
	@Keyword nvarchar(500), @Descr nvarchar(500),@Dil smallint,
	@SeoUrl varchar(500), @AramaIndex bit
AS
SET NOCOUNT ON;


DECLARE @EskiSeoUrl varchar(1000), @UrlKeyValue varchar(500)
SELECT @UrlKeyValue=UrlKeyValue FROM snlg_v1.TblUrlKeys WHERE UrlKeyName = 'project' AND Dil = @Dil


SELECT @SeoUrl = Baslik + '-' + ISNULL(@SeoUrl,@Baslik) FROM TblProjeDetay WHERE ProjeId = @ProjeId AND Dil = @Dil AND NOT ISNULL(@SeoUrl,@Baslik) LIKE snlg_V1.fun_UrlEncode(Baslik) + '%' --BURDAKAİ LIKE AMACI ŞU (EĞER URL İÇERİSİNDE PROJE ADI YOK İSE EKLE
SET @SeoUrl = snlg_V1.fun_UrlOlustur(ISNULL(@SeoUrl,@Baslik), 'project', 'project', @ProjeAltId,@Dil)

UPDATE snlg_V1.TblSiteLinkleri SET @EskiSeoUrl=SeoUrl, SeoUrl = @SeoUrl where  Id = @ProjeAltId AND Dil=@Dil AND SablonAnahtar = 'project'
IF(@@ROWCOUNT < 1)
	INSERT INTO snlg_V1.TblSiteLinkleri (SeoUrl, Id,Dil, UrlAnahtar, SablonAnahtar) VALUES (@SeoUrl, @ProjeAltId,@Dil,'project','project')


IF(NOT @SeoUrl = @EskiSeoUrl)
BEGIN
	UPDATE TblMenuDetay SET MenuLink='/' + @UrlKeyValue + '/' + @SeoUrl WHERE MenuLink = '/'+ @UrlKeyValue +'/' + @EskiSeoUrl
	UPDATE TblProjeApp SET ProjeUrl= @SeoUrl WHERE (ProjeId = @ProjeId) AND ProjeUrl = @EskiSeoUrl
END


UPDATE TblProjeAltBilgiApp 
SET  Sira = @Sira,AramaIndex=@AramaIndex,
	ProjeId = @ProjeId, Gorunurluk=@Gorunurluk
WHERE (ProjeAltId = @ProjeAltId) 

IF (@@ROWCOUNT > 0)
 BEGIN--bu app'nin böyle bir kategorisi varsa diğer işlemlere devam et
	UPDATE TblProjeAltBilgiDetay SET Baslik = @Baslik, 
		Icerik = @Icerik, Keyword = @Keyword, Descr = @Descr ,SeoUrl=@SeoUrl
	WHERE (ProjeAltId = @ProjeAltId) AND (Dil = @Dil)

	IF(@@ROWCOUNT < 1)
		INSERT INTO TblProjeAltBilgiDetay (ProjeAltId, Dil,SeoUrl, Baslik, Icerik, Keyword , Descr) 
		VALUES(@ProjeAltId, @Dil,@SeoUrl, @Baslik, @Icerik, @Keyword , @Descr)
 END



GO
/****** Object:  StoredProcedure [snlg_V1].[msp_ProjeAltBilgiEkle]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [snlg_V1].[msp_ProjeAltBilgiEkle]
	@Sira tinyint, @Gorunurluk tinyint, @ProjeId int,
	@Baslik nvarchar(250), @Icerik nvarchar(MAX), @SeoUrl varchar(500),
	@Keyword nvarchar(500), @Descr nvarchar(500), @AramaIndex bit
AS
SET NOCOUNT ON;

DECLARE @DefaultLang smallint
SELECT TOP(1) @DefaultLang = Deger FROM snlg_V1.TblDegiskenler WHERE  Degisken = 'DefaultLang'


SET @SeoUrl = ISNULL(@SeoUrl,@Baslik)
SET @SeoUrl = snlg_V1.fun_UrlEncode(@SeoUrl)
--eğer seourl kullanımdaysa bu urlnin önüne prejinin adını ekle
--IF EXISTS(SELECT Id FROM TblSiteLinkleri WHERE UrlAnahtar = 'project' AND Dil=@DefaultLang AND (SeoUrl = @SeoUrl))
	SELECT @SeoUrl = Baslik + '-' + @SeoUrl FROM TblProjeDetay WHERE ProjeId = @ProjeId AND Dil = @DefaultLang


DECLARE @ProjeAltId int
SET @SeoUrl = snlg_V1.fun_UrlOlustur(ISNULL(@SeoUrl,@Baslik), 'project', NULL, NULL,@DefaultLang)

INSERT INTO TblProjeAltBilgiApp (Sira, Gorunurluk, ProjeId, AramaIndex) 
VALUES (@Sira, @Gorunurluk, @ProjeId,@AramaIndex)

SET @ProjeAltId = SCOPE_IDENTITY()

INSERT INTO TblProjeAltBilgiDetay (ProjeAltId, Dil,SeoUrl, Baslik, Icerik, Keyword , Descr) 
VALUES (@ProjeAltId, @DefaultLang,@SeoUrl, @Baslik, @Icerik, @Keyword , @Descr)

INSERT INTO snlg_V1.TblSiteLinkleri (SeoUrl, Id,Dil, UrlAnahtar, SablonAnahtar) VALUES (@SeoUrl, @ProjeAltId,@DefaultLang,'project','project')









GO
/****** Object:  StoredProcedure [snlg_V1].[msp_ProjeAltBilgiler]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [snlg_V1].[msp_ProjeAltBilgiler]
	@ProjeId int
AS
SET NOCOUNT ON;

DECLARE @DefaultLang smallint
SELECT TOP(1) @DefaultLang = Deger FROM snlg_V1.TblDegiskenler WHERE  Degisken = 'DefaultLang'

SELECT  TblProjeAltBilgiApp.ProjeAltId, TblProjeAltBilgiApp.Sira, TblProjeAltBilgiDetay.Baslik,
TblProjeAltBilgiApp.Gorunurluk, TblProjeAltBilgiDetay.SeoUrl
FROM    TblProjeAltBilgiApp INNER JOIN
            TblProjeAltBilgiDetay ON TblProjeAltBilgiApp.ProjeAltId = TblProjeAltBilgiDetay.ProjeAltId INNER JOIN
            TblProjeDetay ON TblProjeAltBilgiApp.ProjeId = TblProjeDetay.ProjeId
WHERE   (TblProjeAltBilgiDetay.Dil = @DefaultLang) AND 
			(TblProjeDetay.ProjeId = @ProjeId) AND TblProjeDetay.Dil = @DefaultLang
ORDER BY TblProjeAltBilgiApp.Sira ASC








GO
/****** Object:  StoredProcedure [snlg_V1].[msp_ProjeAltBilgiSil]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [snlg_V1].[msp_ProjeAltBilgiSil]
	@ProjeAltId varchar(4000)
AS
SET NOCOUNT ON;

DECLARE @SorguSql NVARCHAR(4000)
SET @SorguSql = N'
		DELETE FROM snlg_V1.TblSiteLinkleri WHERE  Id IN ('+@ProjeAltId+') AND SablonAnahtar = ''project'';
		DELETE FROM snlg_V1.TblProjeAltBilgiDetay WHERE ProjeAltId IN ('+@ProjeAltId+');
		DELETE FROM snlg_V1.TblProjeAltBilgiApp WHERE ProjeAltId IN ('+@ProjeAltId+') ;
'
EXEC SP_EXECUTESQL @SorguSql


GO
/****** Object:  StoredProcedure [snlg_V1].[msp_ProjeDetaySec]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [snlg_V1].[msp_ProjeDetaySec]
	@ProjeId int, @Dil smallint
AS
SET NOCOUNT ON;

DECLARE @Diller varchar(1000)
SET @Diller = 
		(
		SELECT        TblDiller.DId AS [data()], '#' AS [data()], TblDiller.Name AS [data()], '#' AS [data()]
		FROM            TblDiller WHERE Aktif = 1 ORDER BY TblDiller.DId FOR XML path('')
		)

SELECT TblProjeApp.ProjeId, TblProjeApp.Sira, TblProjeApp.Aktif, TblProjeApp.ProjeUrl, 
	TblProjeDetay.Baslik, TblProjeDetay.Bilgi, TblProjeApp.Resim,
	@Diller AS Diller
FROM TblProjeApp LEFT OUTER JOIN TblProjeDetay ON 
	TblProjeApp.ProjeId = TblProjeDetay.ProjeId AND TblProjeDetay.Dil = @Dil
WHERE (TblProjeApp.ProjeId = @ProjeId) 














































GO
/****** Object:  StoredProcedure [snlg_V1].[msp_ProjeDuzenle]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [snlg_V1].[msp_ProjeDuzenle]
	@ProjeId int, @KtgSql nvarchar(max), @Sira tinyint, 
	@Aktif bit, @Baslik nvarchar(250), @Bilgi nvarchar(750),
	@Dil smallint, @Resim varchar(250), @ProjeUrl varchar(260)
AS
SET NOCOUNT ON;

UPDATE TblProjeApp 
SET Aktif = @Aktif, Resim = ISNULL(@Resim, Resim),
	ProjeUrl = @ProjeUrl, Sira = @Sira
WHERE (ProjeId = @ProjeId) 

IF (@@ROWCOUNT > 0)
 BEGIN--bu app'nin böyle bir kategorisi varsa diğer işlemlere devam et
	IF(@KtgSql IS NOT NULL AND @KtgSql != '')
	 BEGIN
		DELETE FROM TblProje_Kategori WHERE ProjeId = @ProjeId
		SET @KtgSql = REPLACE(@KtgSql,'@ProjeId',@ProjeId)
		EXEC SP_EXECUTESQL @KtgSql;
	 END
	 
	UPDATE TblProjeDetay SET Baslik = @Baslik, Bilgi = @Bilgi
	WHERE (ProjeId = @ProjeId) AND (Dil = @Dil)

	IF(@@ROWCOUNT < 1)
		INSERT INTO TblProjeDetay (ProjeId, Dil, Baslik, Bilgi) 
		VALUES(@ProjeId, @Dil, @Baslik, @Bilgi)
 END





















































GO
/****** Object:  StoredProcedure [snlg_V1].[msp_ProjeEkle]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [snlg_V1].[msp_ProjeEkle]
	@KtgSql nvarchar(max), @Sira tinyint, @Aktif bit, 
	@Baslik nvarchar(250), @ProjeUrl varchar(260),
	@Bilgi nvarchar(750), @Resim varchar(250)
AS
SET NOCOUNT ON;

DECLARE @DefaultLang smallint
SELECT TOP(1) @DefaultLang = Deger FROM snlg_V1.TblDegiskenler WHERE  Degisken = 'DefaultLang'

INSERT INTO TblProjeApp (Sira, Aktif, Resim,ProjeUrl) 
VALUES (@Sira, @Aktif, @Resim,@ProjeUrl)

DECLARE @ProjeId int
SET @ProjeId = SCOPE_IDENTITY()

INSERT INTO TblProjeDetay (ProjeId, Dil, Baslik, Bilgi) 
VALUES (@ProjeId, @DefaultLang, @Baslik, @Bilgi)

IF(@KtgSql IS NOT NULL AND @KtgSql != '')
 BEGIN
	SET @KtgSql = REPLACE(@KtgSql,'@ProjeId',@ProjeId)
	EXEC SP_EXECUTESQL @KtgSql;
 END











GO
/****** Object:  StoredProcedure [snlg_V1].[msp_ProjeKategoriDetaySec]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [snlg_V1].[msp_ProjeKategoriDetaySec]
	@Dil int, @KtgId smallint
AS
SET NOCOUNT ON;

DECLARE @Diller varchar(1000)
SET @Diller = 
		(
		SELECT        TblDiller.DId AS [data()], '#' AS [data()], TblDiller.Name AS [data()], '#' AS [data()]
		FROM            TblDiller WHERE Aktif = 1 ORDER BY TblDiller.DId FOR XML path('')
		)

SELECT TPKA.KtgId, TPKA.Aktif,TPKA.Resim,TPKD.SeoUrl,TPKD.KtgAd,TPKD.Keyword,TPKD.Descr,@Diller AS Diller
FROM  TblProjeKtgApp AS TPKA LEFT OUTER JOIN 
		TblProjeKtgDetay AS TPKD ON TPKA.KtgId = TPKD.KtgId AND TPKD.Dil = @Dil
WHERE (TPKA.KtgId = @KtgId)








GO
/****** Object:  StoredProcedure [snlg_V1].[msp_ProjeKategoriDuzenle]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [snlg_V1].[msp_ProjeKategoriDuzenle]
	@KtgId int,@Dil int,
	@UstId int, @KtgAd nvarchar(200), @Sira int,  @Aktif bit, 
	@Resim varchar(250),  @SeoUrl varchar(500), @Keyword varchar(500), @Descr varchar(500)
AS
SET NOCOUNT ON;


DECLARE @EskiSeoUrl varchar(1000), @UrlKeyValue varchar(500)
SELECT @UrlKeyValue=UrlKeyValue FROM snlg_v1.TblUrlKeys WHERE UrlKeyName = 'project' AND Dil = @Dil


SET @SeoUrl = snlg_V1.fun_UrlOlustur(ISNULL(@SeoUrl, @KtgAd), 'project', 'projectCtg',@KtgId,@Dil)
UPDATE snlg_V1.TblSiteLinkleri SET @EskiSeoUrl=SeoUrl, SeoUrl = @SeoUrl where  Id = @KtgId AND Dil=@Dil AND SablonAnahtar = 'projectCtg'
IF(@@ROWCOUNT < 1)
	INSERT INTO snlg_V1.TblSiteLinkleri (SeoUrl, Id,Dil,UrlAnahtar, SablonAnahtar) VALUES (@SeoUrl, @KtgId,@Dil, 'project', 'projectCtg')


IF(NOT @SeoUrl = @EskiSeoUrl)
	UPDATE TblMenuDetay SET MenuLink='/' + @UrlKeyValue + '/' + @SeoUrl WHERE MenuLink = '/'+ @UrlKeyValue +'/' + @EskiSeoUrl


UPDATE    TblProjeKtgApp
SET    UstId = @UstId, Sira = @Sira, Aktif = @Aktif,Resim=@Resim
WHERE     (KtgId = @KtgId)

IF(@@ROWCOUNT > 0)--bu app'nin böyle bir kayıt varsa diğer işlemlere devam et
 BEGIN 
	UPDATE TblProjeKtgDetay SET 
			Descr = @Descr, Keyword = @Keyword,SeoUrl=@SeoUrl,KtgAd=@KtgAd
	WHERE KtgId = @KtgId AND Dil = @Dil
	--kategori güncellenmemişse yok demektir hemen yenisini oluşturalım
	IF(@@ROWCOUNT < 1)
		INSERT INTO TblProjeKtgDetay (KtgId, Dil,SeoUrl,KtgAd, Keyword, Descr) 
			VALUES(@KtgId,@Dil,@SeoUrl,@KtgAd, @Keyword, @Descr)		
 END








GO
/****** Object:  StoredProcedure [snlg_V1].[msp_ProjeKategoriOlustur]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [snlg_V1].[msp_ProjeKategoriOlustur]
@UstId int ,
@KtgAd nvarchar(200), 
@Sira int, 
@Aktif bit, 
@Resim varchar(250), 
@SeoUrl varchar(500),
@Keyword varchar(500),
@Descr varchar(500)
AS
SET NOCOUNT ON;

DECLARE @DefaultLang smallint
SELECT TOP(1) @DefaultLang = Deger FROM snlg_V1.TblDegiskenler WHERE  Degisken = 'DefaultLang'

DECLARE @KategoriID int
SET @SeoUrl = snlg_V1.fun_UrlOlustur(ISNULL(@SeoUrl, @KtgAd), 'project', NULL, NULL,@DefaultLang)

INSERT INTO TblProjeKtgApp (UstId,Sira, Aktif,Resim)
VALUES(@UstId,@Sira, @Aktif,@Resim)

SELECT @KategoriID = SCOPE_IDENTITY()

INSERT INTO TblProjeKtgDetay (KtgId, Dil,SeoUrl,KtgAd, Keyword, Descr) 
VALUES(@KategoriID,@DefaultLang,@SeoUrl,@KtgAd, @Keyword, @Descr)

INSERT INTO snlg_V1.TblSiteLinkleri (SeoUrl, Id,Dil,UrlAnahtar, SablonAnahtar) 
			VALUES (@SeoUrl, @KategoriID,@DefaultLang,'project','projectCtg')









GO
/****** Object:  StoredProcedure [snlg_V1].[msp_ProjeKategoriSil]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [snlg_V1].[msp_ProjeKategoriSil]
	@KtgId int, @Dil int
AS
SET NOCOUNT ON;

DECLARE @DefaultLang smallint
SELECT TOP(1) @DefaultLang = Deger FROM snlg_V1.TblDegiskenler WHERE  Degisken = 'DefaultLang'

DELETE FROM TblProjeKtgDetay WHERE (KtgId = @KtgId) AND Dil = @Dil
DELETE FROM TblSiteLinkleri WHERE  Id = @KtgId AND SablonAnahtar = 'projectCtg' AND Dil = @Dil

IF(@DefaultLang = @Dil OR NOT EXISTS(SELECT * FROM TblProjeKtgDetay WHERE (KtgId = @KtgId)))
BEGIN
	DELETE FROM TblProje_Kategori WHERE (KtgId = @KtgId); 
	DELETE FROM TblProjeKtgApp WHERE (KtgId = @KtgId) 
	DELETE FROM TblSiteLinkleri WHERE  Id = @KtgId AND SablonAnahtar = 'projectCtg'
END




GO
/****** Object:  StoredProcedure [snlg_V1].[msp_Projeler]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [snlg_V1].[msp_Projeler]
	@KtgId int
AS
SET NOCOUNT ON;

DECLARE @DefaultLang smallint
SELECT TOP(1) @DefaultLang = Deger FROM snlg_V1.TblDegiskenler WHERE  Degisken = 'DefaultLang'

IF(@KtgId IS NULL)
	SELECT  TblProjeApp.ProjeId, TblProjeApp.Sira, TblProjeDetay.Baslik,
		TblProjeApp.Aktif, TblProjeApp.ProjeUrl
	FROM    TblProjeApp INNER JOIN
              TblProjeDetay ON TblProjeApp.ProjeId = TblProjeDetay.ProjeId 
	WHERE   (TblProjeDetay.Dil = @DefaultLang)  
	ORDER BY TblProjeApp.Sira ASC
ELSE
	SELECT  TblProjeApp.ProjeId, TblProjeApp.Sira, TblProjeDetay.Baslik,
	TblProjeApp.Aktif, TblProjeApp.ProjeUrl
	FROM    TblProjeApp INNER JOIN
              TblProjeDetay ON TblProjeApp.ProjeId = TblProjeDetay.ProjeId LEFT OUTER JOIN
              TblProje_Kategori ON TblProjeApp.ProjeId = TblProje_Kategori.ProjeId
	WHERE   (TblProjeDetay.Dil = @DefaultLang) AND (TblProje_Kategori.KtgId = @KtgId)
	ORDER BY TblProjeApp.Sira ASC














GO
/****** Object:  StoredProcedure [snlg_V1].[msp_ProjeSil]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [snlg_V1].[msp_ProjeSil]
	@ProjeId varchar(4000)
AS
SET NOCOUNT ON;

DECLARE @ResimlerSql NVARCHAR(4000)
DECLARE @Params NVARCHAR(4000), @Resimler varchar(8000)
SET @ResimlerSql = N'SET @ResimlerOUT = 
		(
		SELECT       Resim AS [data()], '','' AS [data()]
		FROM         snlg_V1.TblProjeApp
		WHERE       ProjeId IN ('+@ProjeId+')
		FOR XML path('''')
		)
		
		DELETE FROM snlg_V1.TblSiteLinkleri WHERE  Id IN (SELECT ProjeAltId FROM snlg_V1.TblProjeAltBilgiApp WHERE ProjeID IN ('+@ProjeId+')) AND SablonAnahtar = ''project'';
		DELETE FROM snlg_V1.TblProjeAltBilgiApp WHERE ProjeId IN ('+@ProjeId+') ;
		DELETE FROM snlg_V1.TblProjeApp WHERE ProjeId IN ('+@ProjeId+') ;
'
SET @Params = N'@ResimlerOUT varchar(8000) OUTPUT'
EXECUTE sp_executesql
@ResimlerSql, @Params, @ResimlerOUT=@Resimler OUTPUT

SELECT @Resimler


































GO
/****** Object:  StoredProcedure [snlg_V1].[msp_ReferansDetaySec]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [snlg_V1].[msp_ReferansDetaySec]
	@RId int, @Dil smallint
AS
SET NOCOUNT ON;

DECLARE @Diller varchar(1000)
SET @Diller = 
		(
		SELECT        TblDiller.DId AS [data()], '#' AS [data()], TblDiller.Name AS [data()], '#' AS [data()]
		FROM            TblDiller WHERE Aktif = 1 ORDER BY TblDiller.DId FOR XML path('')
		)

SELECT TblReferansApp.RId, TblReferansApp.Firma, TblReferansApp.Link, @Diller AS Diller,
	TblReferansDetay.Bilgi, TblReferansApp.Resim, TblReferansApp.KtgId 
FROM TblReferansApp LEFT OUTER JOIN 
	TblReferansDetay ON TblReferansApp.RId = TblReferansDetay.RId AND TblReferansDetay.Dil = @Dil 
WHERE (TblReferansApp.RId = @RId) 













































GO
/****** Object:  StoredProcedure [snlg_V1].[msp_ReferansDuzenle]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [snlg_V1].[msp_ReferansDuzenle]
	@RId int, @Firma nvarchar(250), @Link varchar(250),@KtgId int,
	@Bilgi nvarchar(500), @Dil smallint, @Resim varchar(250)
AS
SET NOCOUNT ON;

UPDATE TblReferansApp 
SET Resim = ISNULL(@Resim, Resim), KtgId =  @KtgId, Firma = @Firma, 
	Link = @Link
WHERE (RId = @RId) 

IF (@@ROWCOUNT > 0)
 BEGIN--bu app'nin böyle bir kategorisi varsa diğer işlemlere devam et	 
	UPDATE TblReferansDetay SET Bilgi = @Bilgi
	WHERE (RId = @RId) AND (Dil = @Dil)

	IF(@@ROWCOUNT < 1)
		INSERT INTO TblReferansDetay (RId, Dil, Bilgi) 
		VALUES(@RId, @Dil, @Bilgi)
 END





















































GO
/****** Object:  StoredProcedure [snlg_V1].[msp_ReferansEkle]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [snlg_V1].[msp_ReferansEkle]
	@Firma nvarchar(150), @KtgId int,
	@Bilgi nvarchar(750), @Resim varchar(250), @Link varchar(250)
AS
SET NOCOUNT ON;

DECLARE @DefaultLang smallint
SELECT TOP(1) @DefaultLang = Deger FROM snlg_V1.TblDegiskenler WHERE  Degisken = 'DefaultLang'

INSERT INTO TblReferansApp (Resim, KtgId, Firma, Link)
VALUES (@Resim, @KtgId, @Firma, @Link)

DECLARE @RId int
SET @RId = SCOPE_IDENTITY()

INSERT INTO TblReferansDetay (RId, Dil, Bilgi) 
VALUES (@RId, @DefaultLang, @Bilgi)







GO
/****** Object:  StoredProcedure [snlg_V1].[msp_ReferansKtgDetaySec]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [snlg_V1].[msp_ReferansKtgDetaySec]
	@KtgId int, @Dil smallint
AS
SET NOCOUNT ON;

DECLARE @Diller varchar(1000)
SET @Diller = 
		(
		SELECT        TblDiller.DId AS [data()], '#' AS [data()], TblDiller.Name AS [data()], '#' AS [data()]
		FROM            TblDiller WHERE Aktif = 1 ORDER BY TblDiller.DId FOR XML path('')
		)

SELECT TblReferansKtgApp.KtgId, TblReferansKtgDetay.KtgAd,
		@Diller AS Diller
FROM TblReferansKtgApp LEFT OUTER JOIN 
	TblReferansKtgDetay ON TblReferansKtgApp.KtgId = TblReferansKtgDetay.KtgId AND TblReferansKtgDetay.Dil = @Dil 
WHERE (TblReferansKtgApp.KtgId = @KtgId)




GO
/****** Object:  StoredProcedure [snlg_V1].[msp_ReferansKtgDuzenle]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [snlg_V1].[msp_ReferansKtgDuzenle]
	@KtgId int, @KtgAd nvarchar(150), @Dil smallint
AS
SET NOCOUNT ON;


DECLARE @EskiSeoUrl varchar(1000), @UrlKeyValue varchar(500)
SELECT @UrlKeyValue=UrlKeyValue FROM snlg_v1.TblUrlKeys WHERE UrlKeyName = 'portfolio' AND Dil = @Dil


DECLARE @DefaultLang smallint
SELECT TOP(1) @DefaultLang = Deger FROM snlg_V1.TblDegiskenler WHERE  Degisken = 'DefaultLang'

DECLARE @SeoUrl varchar(500)
SET @SeoUrl = snlg_V1.fun_UrlOlustur(ISNULL(@SeoUrl,@KtgAd), 'portfolio', 'portfolioCtg',@KtgID,@Dil)

UPDATE snlg_V1.TblSiteLinkleri SET @EskiSeoUrl=SeoUrl, SeoUrl = @SeoUrl where Id = @KtgId AND Dil=@Dil AND SablonAnahtar = 'portfolioCtg'
IF(@@ROWCOUNT < 1)
	INSERT INTO snlg_V1.TblSiteLinkleri (SeoUrl, Id,Dil,UrlAnahtar, SablonAnahtar) VALUES (@SeoUrl, @KtgID,@Dil, 'portfolio', 'portfolioCtg')


IF(NOT @SeoUrl = @EskiSeoUrl)
	UPDATE TblMenuDetay SET MenuLink='/' + @UrlKeyValue + '/' + @SeoUrl WHERE MenuLink = '/'+ @UrlKeyValue +'/' + @EskiSeoUrl


UPDATE TblReferansKtgDetay SET KtgAd = @KtgAd, SeoUrl=@SeoUrl
WHERE (KtgId = @KtgId) AND (Dil = @Dil)

IF(@@ROWCOUNT < 1)
	INSERT INTO TblReferansKtgDetay (KtgId, Dil, KtgAd, SeoUrl)
	VALUES(@KtgId, @Dil, @KtgAd, @SeoUrl)


GO
/****** Object:  StoredProcedure [snlg_V1].[msp_ReferansKtgEkle]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [snlg_V1].[msp_ReferansKtgEkle]
	@KtgAd nvarchar(150), @KtgId int OUT
AS
	SET NOCOUNT ON;

	DECLARE @DefaultLang smallint
	SELECT TOP(1) @DefaultLang = Deger FROM snlg_V1.TblDegiskenler WHERE  Degisken = 'DefaultLang'

	DECLARE @SeoUrl varchar(500)
	SET @SeoUrl = snlg_V1.fun_UrlOlustur(@KtgAd, 'portfolio', NULL, NULL,@DefaultLang)


	INSERT INTO TblReferansKtgApp (_)
	VALUES (NULL)

	SET @KtgId = SCOPE_IDENTITY()

	INSERT INTO TblReferansKtgDetay (KtgId, Dil, KtgAd, SeoUrl) 
	VALUES (@KtgId, @DefaultLang, @KtgAd, @SeoUrl)

	INSERT INTO snlg_V1.TblSiteLinkleri (SeoUrl, Id,Dil, UrlAnahtar, SablonAnahtar) VALUES (@SeoUrl, @KtgId, @DefaultLang,'portfolio','portfolioCtg')




GO
/****** Object:  StoredProcedure [snlg_V1].[msp_ReferansKtgSec]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [snlg_V1].[msp_ReferansKtgSec]
AS
SET NOCOUNT ON;

DECLARE @DefaultLang smallint
SELECT TOP(1) @DefaultLang = Deger FROM snlg_V1.TblDegiskenler WHERE  Degisken = 'DefaultLang'

SELECT    snlg_V1.TblReferansKtgApp.KtgId, snlg_V1.TblReferansKtgDetay.KtgAd
FROM		TblReferansKtgApp INNER JOIN
			TblReferansKtgDetay ON TblReferansKtgApp.KtgId = TblReferansKtgDetay.KtgId
WHERE        (TblReferansKtgDetay.Dil = @DefaultLang)
ORDER BY TblReferansKtgApp.KtgId DESC






GO
/****** Object:  StoredProcedure [snlg_V1].[msp_ReferansKtgSil]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [snlg_V1].[msp_ReferansKtgSil]
	@KtgId varchar(4000)
AS
SET NOCOUNT ON;

DECLARE @ResimlerSql NVARCHAR(4000)
DECLARE @Params NVARCHAR(4000), @Resimler varchar(8000)
SET @ResimlerSql = N'SET @ResimlerOUT = 
		(
		SELECT       Resim AS [data()], '','' AS [data()]
		FROM         snlg_V1.TblReferansApp
		WHERE       KtgId IN ('+@KtgId+')
		FOR XML path('''')
		)
		
		DELETE FROM snlg_V1.TblSiteLinkleri WHERE Id IN ('+@KtgId+') AND SablonAnahtar = ''portfolioCtg''
		DELETE FROM snlg_V1.TblReferansApp WHERE KtgId IN ('+@KtgId+')
		DELETE FROM snlg_V1.TblReferansKtgApp WHERE KtgId IN ('+@KtgId+') 
'
SET @Params = N'@ResimlerOUT varchar(8000) OUTPUT'
EXECUTE sp_executesql
@ResimlerSql, @Params, @ResimlerOUT=@Resimler OUTPUT

SELECT @Resimler











































GO
/****** Object:  StoredProcedure [snlg_V1].[msp_Referanslar]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [snlg_V1].[msp_Referanslar]
@KtgId int
AS
SET NOCOUNT ON;

IF(@KtgId IS NULL)
     SELECT RId, Resim, Firma FROM snlg_V1.TblReferansApp ORDER BY Sira
ELSE
	SELECT RId, Resim, Firma FROM snlg_V1.TblReferansApp WHERE (KtgId = @KtgId) ORDER BY Sira
GO
/****** Object:  StoredProcedure [snlg_V1].[msp_ReferansSil]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [snlg_V1].[msp_ReferansSil]
	@RId varchar(4000)
AS
SET NOCOUNT ON;

DECLARE @ResimlerSql NVARCHAR(4000)
DECLARE @Params NVARCHAR(4000), @Resimler varchar(8000)
SET @ResimlerSql = N'SET @ResimlerOUT = 
		(
		SELECT       Resim AS [data()], '','' AS [data()]
		FROM         snlg_V1.TblReferansApp
		WHERE       RId IN ('+@RId+')
		FOR XML path('''')
		)
		
		DELETE FROM snlg_V1.TblReferansApp WHERE RId IN ('+@RId+')  
'
SET @Params = N'@ResimlerOUT varchar(8000) OUTPUT'
EXECUTE sp_executesql
@ResimlerSql, @Params, @ResimlerOUT=@Resimler OUTPUT

SELECT @Resimler









































GO
/****** Object:  StoredProcedure [snlg_V1].[msp_Rol_Yetkiler]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [snlg_V1].[msp_Rol_Yetkiler]
	@RolId int
AS
SET NOCOUNT ON;

SELECT     AY.YetkiId, AY.Yetki, AY.YetkiTanim, 
		CAST((CASE WHEN RY.YetkiId IS NULL THEN 0 ELSE 1 END) AS bit) AS Secili
FROM         TblRol_Yetki AS RY RIGHT OUTER JOIN
                      TblAdminYetkiler AS AY ON RY.YetkiId = AY.YetkiId AND RY.RolId = @RolId
ORDER BY AY.Yetki


GO
/****** Object:  StoredProcedure [snlg_V1].[msp_Rol_YetkiTanimla]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [snlg_V1].[msp_Rol_YetkiTanimla]
	@RolId int, @YetkiSql nvarchar(MAX)
AS
SET NOCOUNT ON;

IF(EXISTS(SELECT * FROM TblRoller))
 BEGIN
	DELETE FROM TblRol_Yetki WHERE RolId=@RolId

	IF(@YetkiSql IS NOT NULL AND @YetkiSql != '')
	 BEGIN
		SET @YetkiSql = REPLACE(@YetkiSql,'@RolId',@RolId)
		EXEC SP_EXECUTESQL @YetkiSql;
	 END
 END










































GO
/****** Object:  StoredProcedure [snlg_V1].[msp_RoleUyeEkle]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [snlg_V1].[msp_RoleUyeEkle]
	@RolId smallint, @UserName varchar(25), @AdminId int
AS
SET NOCOUNT ON;

DECLARE @UyeId int

SELECT @UyeId = UyeId FROM TblUyeApp
WHERE   (UserName = @UserName) AND (UyeId <> @AdminId)

DELETE FROM TblRol_Uye WHERE RolId = @RolId AND UyeId = @UyeId
INSERT INTO TblRol_Uye (RolId,UyeId) VALUES(@RolId, @UyeId)










































GO
/****** Object:  StoredProcedure [snlg_V1].[msp_SablonDizaynControlList]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [snlg_V1].[msp_SablonDizaynControlList]
	@SablonId int
AS
SET NOCOUNT ON;

DECLARE @DefaultLang smallint
SELECT TOP(1) @DefaultLang = Deger FROM snlg_V1.TblDegiskenler WHERE  Degisken = 'DefaultLang'

SELECT  ISNULL(TblDesignSablonIcerik.Sira, 0) AS Sirala, TblUCApp.Aciklama, 
		TblUCApp.UCId, TblUCApp.UCPath, TblUCApp.Title, TblUCApp.BlokType, 
		TblDesignSablonIcerik.ContainerId, TblDesignSablonIcerik.BlockPlaceID
FROM   TblUCApp LEFT OUTER JOIN
		TblUcDetay ON TblUcDetay.UCId = TblUCApp.UCId AND TblUcDetay.Dil = @DefaultLang LEFT OUTER JOIN
		TblDesignSablonIcerik ON TblUCApp.UCId = TblDesignSablonIcerik.UCId AND TblDesignSablonIcerik.SablonId = @SablonId
ORDER BY 1, TblUCApp.Title












GO
/****** Object:  StoredProcedure [snlg_V1].[msp_SablonOlustur]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [snlg_V1].[msp_SablonOlustur]
	@SablonAd nvarchar(50), @Aciklama nvarchar(250), @CopySablonId smallint
AS
SET NOCOUNT ON;

INSERT INTO TblDesignSablonlar (SablonAd, Aciklama)
VALUES (@SablonAd,@Aciklama)

IF(@CopySablonId IS NOT NULL)--belirtilen şablonundizaynını yeni şablona kopyala
 BEGIN
	DECLARE @SablonId smallint
	SET @SablonId = SCOPE_IDENTITY()

	INSERT INTO TblDesignSablonIcerik (SablonId, ContainerId, UCId, Sira)
	SELECT        @SablonId, ContainerId, UCId, Sira
	FROM            TblDesignSablonIcerik AS TblDesignSablonIcerik_1
	WHERE SablonId = @CopySablonId
 END










































GO
/****** Object:  StoredProcedure [snlg_V1].[msp_SablonPHList]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [snlg_V1].[msp_SablonPHList]
AS
SET NOCOUNT ON;

SELECT  ContainerId, PHName, Title FROM    TblPlaceHolders 







































GO
/****** Object:  StoredProcedure [snlg_V1].[msp_SablonTasi]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [snlg_V1].[msp_SablonTasi]
	@SablonIdFrom smallint, @SablonIdTo smallint
AS
SET NOCOUNT ON;

--Eğer hedef ve kaynak şablon bu applicationa aitse taşıma işlemini yap
IF  (EXISTS(SELECT SablonId FROM TblDesignSablonlar WHERE SablonId = @SablonIdFrom ) AND
	EXISTS(SELECT SablonId FROM TblDesignSablonlar WHERE SablonId = @SablonIdTo ))
 BEGIN
	UPDATE TblSayfaApp SET SablonId = @SablonIdTo WHERE SablonId = @SablonIdFrom
	UPDATE TblSablon_Modul SET SablonId = @SablonIdTo WHERE SablonId = @SablonIdFrom
 END









































GO
/****** Object:  StoredProcedure [snlg_V1].[msp_SayfaDetaySec]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [snlg_V1].[msp_SayfaDetaySec]
	@SayfaId int, @Dil smallint
AS
SET NOCOUNT ON;

DECLARE @Diller varchar(1000)
SET @Diller = 
		(
		SELECT        TblDiller.DId AS [data()], '#' AS [data()], TblDiller.Name AS [data()], '#' AS [data()]
		FROM            TblDiller WHERE Aktif = 1 ORDER BY TblDiller.DId FOR XML path('')
		)

SELECT TSA.SayfaId, TSA.Gorunurluk, TSA.SAd,TSA.SablonId, @Diller AS Diller, TSA.AramaIndex,
		ISNULL((SELECT SablonAd FROM snlg_V1.TblDesignSablonlar where SablonId=TSA.SablonId),'') AS SablonAd,
		TSD.*
FROM  TblSayfaApp AS TSA LEFT OUTER JOIN 
		TblSayfaDetay AS TSD ON TSA.SayfaId = TSD.SayfaId AND TSD.DId = @Dil
WHERE     (TSA.SayfaId = @SayfaId)
































GO
/****** Object:  StoredProcedure [snlg_V1].[msp_SayfaDuzenle]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [snlg_V1].[msp_SayfaDuzenle]
	@SAd varchar(200), @Gorunurluk tinyint, 
	@Title nvarchar(500), @Descr nvarchar(500), @Keyword nvarchar(500),
	@SablonId smallint, @Icerik nvarchar(MAX), @Dil smallint, @SayfaId int,
	@AramaIndex bit, @SeoUrl nvarchar(250), @PageContentTitle nvarchar(MAX)
AS
SET NOCOUNT ON;


DECLARE @EskiSeoUrl varchar(1000)

SET @SeoUrl = snlg_V1.fun_UrlOlustur(ISNULL(@SeoUrl, @SAd), '', '',@SayfaId,@Dil)
UPDATE snlg_V1.TblSiteLinkleri SET @EskiSeoUrl=SeoUrl, SeoUrl = @SeoUrl where  Id = @SayfaId AND Dil=@Dil AND SablonAnahtar = ''
IF(@@ROWCOUNT < 1)
	INSERT INTO snlg_V1.TblSiteLinkleri (SeoUrl, Id,Dil,UrlAnahtar, SablonAnahtar) VALUES (@SeoUrl, @SayfaId,@Dil,'','')


IF(NOT @SeoUrl = @EskiSeoUrl)
	UPDATE TblMenuDetay SET MenuLink='/' + @SeoUrl WHERE MenuLink = '/' + @EskiSeoUrl


UPDATE    TblSayfaApp
SET    SAd = @SAd, SablonId = @SablonId, Gorunurluk = @Gorunurluk,
		AramaIndex = @AramaIndex
WHERE     (SayfaId = @SayfaId)
 
IF(@@ROWCOUNT > 0)--bu app'nin böyle bir SAYFASI varsa diğer işlemlere devam et
 BEGIN 
	UPDATE TblSayfaDetay SET Title = @Title, Icerik = @Icerik, 
			Descr = @Descr, Keyword = @Keyword,SeoUrl=@SeoUrl,
			PageContentTitle = @PageContentTitle
	WHERE SayfaId = @SayfaId AND DId = @Dil
	--sayfa güncellenmemişse yok demektir hemen yenisini oluşturalım
	IF(@@ROWCOUNT < 1)
		INSERT INTO TblSayfaDetay (SayfaId, DId,SeoUrl, Icerik, Title, Descr, Keyword) 
		VALUES(@SayfaId, @Dil,@SeoUrl,@Icerik, @Title, @Descr, @Keyword)		
 END




GO
/****** Object:  StoredProcedure [snlg_V1].[msp_SayfaOlustur]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [snlg_V1].[msp_SayfaOlustur]
	@SAd varchar(200), @Gorunurluk tinyint,
	@Title nvarchar(500), @Descr nvarchar(500), @Keyword nvarchar(500),
	@SablonId smallint, @Icerik nvarchar(MAX), @AramaIndex bit, 
	@SeoUrl nvarchar(250), @PageContentTitle nvarchar(MAX)
AS
SET NOCOUNT ON;

DECLARE @DefaultLang smallint
SELECT TOP(1) @DefaultLang = Deger FROM snlg_V1.TblDegiskenler WHERE  Degisken = 'DefaultLang'

DECLARE @SayfaId int
SET @SeoUrl = snlg_V1.fun_UrlOlustur(ISNULL(@SeoUrl, @SAd), '', NULL, NULL, @DefaultLang)

INSERT INTO TblSayfaApp (SAd, SablonId, Gorunurluk,AramaIndex)
VALUES(@SAd, @SablonId,@Gorunurluk,@AramaIndex)

SELECT @SayfaId = SCOPE_IDENTITY()

INSERT INTO TblSayfaDetay (SayfaId, DId,SeoUrl,Icerik, Title, Descr, Keyword, PageContentTitle) 
VALUES(@SayfaId, @DefaultLang,@SeoUrl,@Icerik, @Title, @Descr, @Keyword, @PageContentTitle)

INSERT INTO snlg_V1.TblSiteLinkleri (SeoUrl, Id,Dil,UrlAnahtar, SablonAnahtar) VALUES (@SeoUrl, @SayfaId, @DefaultLang,'','')







GO
/****** Object:  StoredProcedure [snlg_V1].[msp_SayfaSil]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [snlg_V1].[msp_SayfaSil]
	@SayfaId varchar(4000)
AS
SET NOCOUNT ON;

DECLARE @SorguSql NVARCHAR(4000)
SET @SorguSql = N'
		DELETE FROM snlg_V1.TblSiteLinkleri WHERE  Id IN ('+@SayfaId+') AND SablonAnahtar = '''';
		DELETE FROM snlg_V1.TblSayfaApp WHERE SayfaId IN ('+@SayfaId+') ;
'
EXEC SP_EXECUTESQL @SorguSql












































GO
/****** Object:  StoredProcedure [snlg_V1].[msp_UCIcerikDuzenle]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [snlg_V1].[msp_UCIcerikDuzenle]
	@Baslik nvarchar(200), 
	@Gorunurluk tinyint,
	@Icerik nvarchar(MAX), 
	@BaslikGorunsun bit, 
	@Aciklama varchar(250), 
	@Dil smallint, 
	@UCId int, 
	@Sira tinyint, 
	@ContainerId smallint, 
	@GosterilecekSablonlarSql nvarchar(max), 
	@Title nvarchar(100),
	@BlokUstBilgi nvarchar(Max), 
	@BlokAltBilgi nvarchar(Max)
AS
SET NOCOUNT ON;

DECLARE @UCPath nvarchar(500)

UPDATE    TblUCApp
SET    BaslikGorunsun = @BaslikGorunsun, Aciklama = @Aciklama, 
	Gorunurluk = @Gorunurluk, @UCPath = UCPath, Title = @Title
WHERE     (UCId = @UCId) 

IF(@@ROWCOUNT > 0)--bu app'nin böyle bir içeriği varsa diğer işlemlere devam et
 BEGIN 
	UPDATE TblUCDetay SET Baslik = @Baslik, Icerik = CASE WHEN @UCPath IS NULL THEN @Icerik ELSE NULL END,
	BlokUstBilgi=@BlokUstBilgi,BlokAltBilgi=@BlokAltBilgi
	WHERE UCId = @UCId AND Dil = @Dil
	--Sablon güncellenmemişse yok demektir hemen yenisini oluşturalım
	IF(@@ROWCOUNT < 1)
		INSERT INTO TblUCDetay (UCId, Dil, Baslik, Icerik,BlokUstBilgi,BlokAltBilgi) 
		VALUES(@UCId, @Dil, @Baslik, CASE WHEN @UCPath IS NULL THEN @Icerik ELSE NULL END,@BlokUstBilgi,@BlokAltBilgi)	
			
	IF(@GosterilecekSablonlarSql IS NOT NULL AND @GosterilecekSablonlarSql <> '')
	BEGIN
		SET @GosterilecekSablonlarSql = REPLACE(@GosterilecekSablonlarSql,'@ContainerId',@ContainerId)
		SET @GosterilecekSablonlarSql = REPLACE(@GosterilecekSablonlarSql,'@UCId',@UCId)
		SET @GosterilecekSablonlarSql = REPLACE(@GosterilecekSablonlarSql,'@Sira',ISNULL(@Sira, 100))
		EXEC SP_EXECUTESQL @GosterilecekSablonlarSql;
	END

END



GO
/****** Object:  StoredProcedure [snlg_V1].[msp_UCIcerikOlustur]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [snlg_V1].[msp_UCIcerikOlustur]
	@Baslik nvarchar(250), 
	@Gorunurluk tinyint, 
	@BlokType varchar(50),
	@Icerik nvarchar(MAX), 
	@BaslikGorunsun bit, 
	@Aciklama varchar(500),
	@Sira tinyint, 
	@ContainerId smallint, 
	@GosterilecekSablonlarSql nvarchar(max), 
	@Title nvarchar(100)
AS
SET NOCOUNT ON;

DECLARE @DefaultLang smallint
SELECT TOP(1) @DefaultLang = Deger FROM snlg_V1.TblDegiskenler WHERE  Degisken = 'DefaultLang'

DECLARE @UCId int

INSERT INTO TblUCApp (BaslikGorunsun, Aciklama, Gorunurluk, Title, BlokType)
VALUES(@BaslikGorunsun, @Aciklama, @Gorunurluk, @Title, @BlokType)

SELECT @UCId = SCOPE_IDENTITY()

INSERT INTO TblUCDetay (UCId, Dil, Icerik, Baslik) 
VALUES(@UCId, @DefaultLang, @Icerik, @Baslik)


IF(@GosterilecekSablonlarSql IS NOT NULL AND @GosterilecekSablonlarSql <> '')
BEGIN
	SET @GosterilecekSablonlarSql = REPLACE(@GosterilecekSablonlarSql,'@ContainerId',@ContainerId)
	SET @GosterilecekSablonlarSql = REPLACE(@GosterilecekSablonlarSql,'@UCId',@UCId)
	SET @GosterilecekSablonlarSql = REPLACE(@GosterilecekSablonlarSql,'@Sira',ISNULL(@Sira, 100))
	EXEC SP_EXECUTESQL @GosterilecekSablonlarSql;
END

IF(@BlokType = 'Menu')
	INSERT INTO snlg_V1.TblBlockAttributeKeys (BlockID, AttributeKey, DefaultValue, ValueList) VALUES(@UCId, 'MenuType', 'Top', 'Top,Left,Right,Footer')

--IF(@GosterilecekSablonlarSql IS NOT NULL AND @GosterilecekSablonlarSql <> '')
-- BEGIN
--	SET @GosterilecekSablonlarSql = REPLACE(@GosterilecekSablonlarSql,'@ContainerId',@ContainerId)
--	SET @GosterilecekSablonlarSql = REPLACE(@GosterilecekSablonlarSql,'@UCId',@UCId)
--	SET @GosterilecekSablonlarSql = REPLACE(@GosterilecekSablonlarSql,'@Sira',ISNULL(@Sira, 100))
--	EXEC SP_EXECUTESQL @GosterilecekSablonlarSql;
-- END


 





GO
/****** Object:  StoredProcedure [snlg_V1].[msp_UCIcerikSecDuzenle]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [snlg_V1].[msp_UCIcerikSecDuzenle]
	@UCId int, @Dil smallint, @BlokType varchar(50)
AS
SET NOCOUNT ON;

IF(@BlokType = '0')
	SET @BlokType = 'User Control'
ELSE IF(@BlokType = '1')
	SET @BlokType = 'Content'
ELSE IF(@BlokType = '2')
	SET @BlokType = 'Menu'

DECLARE @Diller varchar(1000)
SET @Diller = 
		(
		SELECT        TblDiller.DId AS [data()], '#' AS [data()], TblDiller.Name AS [data()], '#' AS [data()]
		FROM            TblDiller WHERE Aktif = 1 ORDER BY TblDiller.DId FOR XML path('')
		)


SELECT  TUA.UCId, TUA.BaslikGorunsun, TUA.Gorunurluk, 
		TUA.Aciklama, TUA.Title, TUD.Baslik, TUD.Icerik, 100 AS Sira, @Diller AS Diller,
		TUD.BlokUstBilgi,TUD.BlokAltBilgi
FROM         TblUCApp AS TUA LEFT OUTER JOIN
                      TblUCDetay AS TUD ON TUA.UCId = TUD.UCId AND TUD.Dil = @Dil
WHERE     (TUA.UCId = @UCId) AND BlokType = @BlokType











GO
/****** Object:  StoredProcedure [snlg_V1].[msp_UCKontrolEkle]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [snlg_V1].[msp_UCKontrolEkle]
	@Baslik nvarchar(250), @Gorunurluk tinyint, @BaslikGorunsun bit,
	@Aciklama varchar(500), @UCPath nvarchar(250), @Title nvarchar(100)
AS
SET NOCOUNT ON;

DECLARE @DefaultLang smallint
SELECT TOP(1) @DefaultLang = Deger FROM snlg_V1.TblDegiskenler WHERE  Degisken = 'DefaultLang'

DECLARE @UCId int
SELECT @UCId = UCId FROM TblUCApp WHERE  (UCPath = @UCPath)

IF (@UCId IS NULL)
 BEGIN
	INSERT INTO TblUCApp (UCPath, BaslikGorunsun, Aciklama, Gorunurluk, Title, BlokType)
	VALUES(@UCPath, @BaslikGorunsun, @Aciklama, @Gorunurluk,@Title, 'User Control')

	SET @UCId = SCOPE_IDENTITY()

	INSERT INTO TblUCDetay (UCId, Dil, Icerik, Baslik)
	VALUES(@UCId, @DefaultLang, NULL, @Baslik)
 END
ELSE
 BEGIN
	UPDATE  snlg_V1.TblUCApp
	SET     Aciklama = @Aciklama, Title = @Title
	WHERE   (UCId = @UCId) 

	UPDATE       snlg_V1.TblUcDetay
	SET                Icerik = NULL
	WHERE        (UCId = @UCId) AND (Dil = @DefaultLang)
	--detay tablosuna güncelleme yapılmadıysa ekleme yap
	IF(@@ROWCOUNT < 1)
		INSERT INTO TblUCDetay (UCId, Dil, Icerik, Baslik) VALUES(@UCId, @DefaultLang, NULL, @Baslik)
 END







GO
/****** Object:  StoredProcedure [snlg_V1].[msp_UCListele]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [snlg_V1].[msp_UCListele]
AS
SET NOCOUNT ON;

DECLARE @DefaultLang smallint
SELECT TOP(1) @DefaultLang = Deger FROM snlg_V1.TblDegiskenler WHERE  Degisken = 'DefaultLang'

SELECT     TblUCApp.UCId, TblUcDetay.Baslik, TblUCApp.Title, TblUCApp.BlokType, 
			TblUCApp.Aciklama, TblUCApp.Gorunurluk, TblUCApp.UCPath
FROM         TblUCApp LEFT OUTER JOIN
                      TblUcDetay ON TblUCApp.UCId = TblUcDetay.UCId AND TblUcDetay.Dil = @DefaultLang
WHERE BlokType IN ('User Control', 'Content', 'Menu')
ORDER BY Title




GO
/****** Object:  StoredProcedure [snlg_V1].[msp_UrlKeysOlustur]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [snlg_V1].[msp_UrlKeysOlustur]
@UrlKeyName NVARCHAR(250),
@UrlKeyValue NVARCHAR(250),
@Dil INT
AS
SET NOCOUNT ON;

DECLARE @DefaultLang smallint
SELECT TOP(1) @DefaultLang = Deger FROM snlg_V1.TblDegiskenler WHERE  Degisken = 'DefaultLang'

DECLARE @DefaultDil INT
IF(@Dil=0)
   SET @DefaultDil=@DefaultLang
ELSE
  SET @DefaultDil=@Dil
INSERT INTO snlg_V1.TblUrlKeys (UrlKeyName,UrlKeyValue,Dil)VALUES(@UrlKeyName,@UrlKeyValue,@DefaultDil)







GO
/****** Object:  StoredProcedure [snlg_V1].[msp_UrunDetaySec]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [snlg_V1].[msp_UrunDetaySec]
	@UrunId int, @Dil smallint
AS
SET NOCOUNT ON;

DECLARE @Diller varchar(1000)
SET @Diller = 
		(
		SELECT        TblDiller.DId AS [data()], '#' AS [data()], TblDiller.Name AS [data()], '#' AS [data()]
		FROM            TblDiller WHERE Aktif = 1 ORDER BY TblDiller.DId FOR XML path('')
		)

SELECT  TblUrunApp.UrunId, TblUrunApp.Fiyat, @Diller AS Diller, TblUrunApp.PId, 
		TblUrunApp.Sira, TblUrunApp.Gorunurluk, TblUrunDetay.UrunAd, 
		TblUrunDetay.Bilgi, TblUrunDetay.Detay, TblUrunDetay.Keyword, 
		TblUrunDetay.Descr, TblUrunApp.Resim, TblUrunApp.UrunKodu, TblUrunDetay.SeoUrl,
		TblUrunApp.AramaIndex
FROM         TblUrunApp LEFT OUTER JOIN
                      TblUrunDetay ON TblUrunApp.UrunId = TblUrunDetay.UrunId AND TblUrunDetay.Dil = @Dil
WHERE     (TblUrunApp.UrunId = @UrunId) 




































GO
/****** Object:  StoredProcedure [snlg_V1].[msp_UrunDuzenle]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [snlg_V1].[msp_UrunDuzenle]
	@UrunId int, @KtgSql nvarchar(max), @Sira smallint, 
	@Gorunurluk tinyint, @UrunAd nvarchar(250), @Detay nvarchar(MAX),
	@Bilgi nvarchar(750), @Keyword nvarchar(500), @Descr nvarchar(500),
	@Dil smallint, @PId tinyint, @Fiyat decimal(9,2),
	@UrunKodu varchar(50),@SeoUrl varchar(500),@AramaIndex bit
AS
SET NOCOUNT ON;


DECLARE @EskiSeoUrl varchar(1000), @UrlKeyValue varchar(500)
SELECT @UrlKeyValue=UrlKeyValue FROM snlg_v1.TblUrlKeys WHERE UrlKeyName = 'shop' AND Dil = @Dil


SET @SeoUrl = snlg_V1.fun_UrlOlustur(ISNULL(@SeoUrl,@UrunAd), 'shop', 'shop', @UrunId,@Dil)
UPDATE snlg_V1.TblSiteLinkleri SET @EskiSeoUrl=SeoUrl, SeoUrl = @SeoUrl where  Id = @UrunId AND Dil=@Dil AND SablonAnahtar = 'shop'
IF(@@ROWCOUNT < 1)
	INSERT INTO snlg_V1.TblSiteLinkleri (SeoUrl, Id,Dil,UrlAnahtar, SablonAnahtar) VALUES (@SeoUrl, @UrunId,@Dil,'shop','shop')


IF(NOT @SeoUrl = @EskiSeoUrl)
	UPDATE TblMenuDetay SET MenuLink='/' + @UrlKeyValue + '/' + @SeoUrl WHERE MenuLink = '/'+ @UrlKeyValue +'/' + @EskiSeoUrl


UPDATE TblUrunApp 
SET Gorunurluk = @Gorunurluk, Fiyat = @Fiyat, PId = @PId,
    UrunKodu = @UrunKodu, Sira = @Sira, AramaIndex=@AramaIndex
WHERE (UrunId = @UrunId) 

IF (@@ROWCOUNT > 0)
BEGIN--bu app'nin böyle bir kategorisi varsa diğer işlemlere devam et

	IF(@KtgSql IS NOT NULL AND @KtgSql != '')
	BEGIN
		DELETE FROM TblUrun_Kategori WHERE UrunId = @UrunId
		SET @KtgSql = REPLACE(@KtgSql,'@UrunId',@UrunId)
		EXEC SP_EXECUTESQL @KtgSql;
	END
	 
	UPDATE TblUrunDetay SET UrunAd = @UrunAd, Bilgi = @Bilgi, 
		Detay = @Detay, Keyword = @Keyword, Descr = @Descr,SeoUrl=@SeoUrl
	WHERE (UrunId = @UrunId) AND (Dil = @Dil)

	IF(@@ROWCOUNT < 1)
		INSERT INTO TblUrunDetay (UrunId, Dil,SeoUrl,UrunAd, Bilgi, Detay, Keyword , Descr) 
		VALUES(@UrunId, @Dil,@SeoUrl,@UrunAd, @Bilgi, @Detay, @Keyword , @Descr)
 
END




GO
/****** Object:  StoredProcedure [snlg_V1].[msp_UrunEkle]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [snlg_V1].[msp_UrunEkle]
	@KtgSql nvarchar(max), @Sira smallint, @Gorunurluk tinyint, 
	@UrunAd nvarchar(250), @Detay nvarchar(MAX),
	@Bilgi nvarchar(750), @Keyword nvarchar(500), @Descr nvarchar(500),
	@PId tinyint, @Fiyat decimal(9,2), @UrunKodu varchar(50),
	@SeoUrl varchar(500), @AramaIndex bit
AS
SET NOCOUNT ON;

DECLARE @DefaultLang smallint
SELECT TOP(1) @DefaultLang = Deger FROM snlg_V1.TblDegiskenler WHERE  Degisken = 'DefaultLang'

SET @SeoUrl = snlg_V1.fun_UrlOlustur(ISNULL(@SeoUrl,@UrunAd), 'shop', NULL, NULL, @DefaultLang)

INSERT INTO TblUrunApp (UrunKodu, Sira, Gorunurluk, Fiyat, PId,AramaIndex) 
VALUES (@UrunKodu, @Sira, @Gorunurluk, @Fiyat, @PId, @AramaIndex)

DECLARE @UrunId int
SET @UrunId = SCOPE_IDENTITY()

INSERT INTO TblUrunDetay (UrunId, Dil,SeoUrl,UrunAd, Bilgi, Detay, Keyword , Descr) 
VALUES (@UrunId, @DefaultLang,@SeoUrl, @UrunAd, @Bilgi, @Detay, @Keyword , @Descr)

INSERT INTO snlg_V1.TblSiteLinkleri (SeoUrl, Id,Dil,UrlAnahtar, SablonAnahtar) VALUES (@SeoUrl, @UrunId, @DefaultLang,'shop','shop')

IF(@KtgSql IS NOT NULL AND @KtgSql != '')
 BEGIN
	SET @KtgSql = REPLACE(@KtgSql,'@UrunId',@UrunId)
	EXEC SP_EXECUTESQL @KtgSql;
 END


 




/****** Object:  StoredProcedure [snlg_V1].[msp_UrunDuzenle]    Script Date: 9.12.2015 17:29:37 ******/
SET ANSI_NULLS ON



GO
/****** Object:  StoredProcedure [snlg_V1].[msp_UrunKategoriDetaySec]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [snlg_V1].[msp_UrunKategoriDetaySec]
	@Dil int, @KtgId smallint
AS
SET NOCOUNT ON;

DECLARE @Diller varchar(1000)
SET @Diller = 
		(
		SELECT        TblDiller.DId AS [data()], '#' AS [data()], TblDiller.Name AS [data()], '#' AS [data()]
		FROM            TblDiller WHERE Aktif = 1 ORDER BY TblDiller.DId FOR XML path('')
		)

SELECT TUKA.KtgId, TUKA.Aktif,TUKA.Resim,TUKD.SeoUrl,TUKD.KtgAd,
		TUKA.UstId, TUKD.Keyword,TUKD.Descr,@Diller AS Diller
FROM  TblUrunKtgApp AS TUKA LEFT OUTER JOIN 
		TblUrunKtgDetay AS TUKD ON TUKA.KtgId = TUKD.KtgId AND TUKD.Dil = @Dil
WHERE (TUKA.KtgId = @KtgId)









GO
/****** Object:  StoredProcedure [snlg_V1].[msp_UrunKategoriDuzenle]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [snlg_V1].[msp_UrunKategoriDuzenle]
	@KtgId int, @Dil int,
	@UstId int, @KtgAd nvarchar(200),  @Sira int,  @Aktif bit, 
	@Resim varchar(250),  @SeoUrl varchar(500), @Keyword varchar(500), @Descr varchar(500)
AS
SET NOCOUNT ON;


DECLARE @EskiSeoUrl varchar(1000), @UrlKeyValue varchar(500)
SELECT @UrlKeyValue=UrlKeyValue FROM snlg_v1.TblUrlKeys WHERE UrlKeyName = 'shop' AND Dil = @Dil


SET @SeoUrl = snlg_V1.fun_UrlOlustur(ISNULL(@SeoUrl,@KtgAd), 'shop', 'shopCtg',@KtgId,@Dil)
UPDATE snlg_V1.TblSiteLinkleri SET @EskiSeoUrl=SeoUrl, SeoUrl = @SeoUrl where  Id = @KtgId AND Dil=@Dil AND SablonAnahtar = 'shopCtg'
IF(@@ROWCOUNT < 1)
	INSERT INTO snlg_V1.TblSiteLinkleri (SeoUrl, Id,Dil,UrlAnahtar, SablonAnahtar) VALUES (@SeoUrl, @KtgId,@Dil,'shop', 'shopCtg')


IF(NOT @SeoUrl = @EskiSeoUrl)
	UPDATE TblMenuDetay SET MenuLink='/' + @UrlKeyValue + '/' + @SeoUrl WHERE MenuLink = '/'+ @UrlKeyValue +'/' + @EskiSeoUrl


UPDATE    TblUrunKtgApp
SET    UstId = @UstId, Sira = @Sira, Aktif = @Aktif,Resim=@Resim
WHERE     (KtgId = @KtgId)

IF(@@ROWCOUNT > 0)--bu app'nin böyle bir kayıt varsa diğer işlemlere devam et
 BEGIN 
	UPDATE TblUrunKtgDetay SET 
			Descr = @Descr, Keyword = @Keyword,SeoUrl=@SeoUrl,KtgAd=@KtgAd
	WHERE KtgId = @KtgId AND Dil = @Dil
	--kategori güncellenmemişse yok demektir hemen yenisini oluşturalım
	IF(@@ROWCOUNT < 1)
		INSERT INTO TblUrunKtgDetay (KtgId, Dil,SeoUrl,KtgAd, Keyword, Descr) 
			VALUES(@KtgId,@Dil,@SeoUrl,@KtgAd, @Keyword, @Descr)		
 END











GO
/****** Object:  StoredProcedure [snlg_V1].[msp_UrunKategoriOlustur]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [snlg_V1].[msp_UrunKategoriOlustur]
@UstId int ,
@KtgAd nvarchar(200), 
@Sira int, 
@Aktif bit, 
@Resim varchar(250), 
@SeoUrl varchar(500),
@Keyword varchar(500),
@Descr varchar(500)
AS
SET NOCOUNT ON;

DECLARE @DefaultLang smallint
SELECT TOP(1) @DefaultLang = Deger FROM snlg_V1.TblDegiskenler WHERE  Degisken = 'DefaultLang'

DECLARE @KategoriID int
SET @SeoUrl = snlg_V1.fun_UrlOlustur(ISNULL(@SeoUrl,@KtgAd), 'shop', NULL, NULL, @DefaultLang)

INSERT INTO TblUrunKtgApp (UstId,Sira, Aktif,Resim)
VALUES(@UstId,@Sira, @Aktif,@Resim)

SELECT @KategoriID = SCOPE_IDENTITY()

INSERT INTO TblUrunKtgDetay (KtgId, Dil,SeoUrl,KtgAd, Keyword, Descr) 
VALUES(@KategoriID, @DefaultLang,@SeoUrl,@KtgAd, @Keyword, @Descr)

INSERT INTO snlg_V1.TblSiteLinkleri (SeoUrl, Id,Dil,UrlAnahtar, SablonAnahtar) 
			VALUES (@SeoUrl, @KategoriID, @DefaultLang,'shop','shopCtg')










GO
/****** Object:  StoredProcedure [snlg_V1].[msp_UrunKategoriSil]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [snlg_V1].[msp_UrunKategoriSil]
	@KtgId int, @Dil int
AS
SET NOCOUNT ON;

DECLARE @DefaultLang smallint
SELECT TOP(1) @DefaultLang = Deger FROM snlg_V1.TblDegiskenler WHERE  Degisken = 'DefaultLang'

DELETE FROM TblUrunKtgDetay WHERE (KtgId = @KtgId) AND Dil = @Dil
DELETE FROM TblSiteLinkleri WHERE  Id = @KtgId AND SablonAnahtar = 'shopCtg' AND Dil = @Dil

IF(@DefaultLang = @Dil OR NOT EXISTS(SELECT * FROM TblUrunKtgDetay WHERE (KtgId = @KtgId)))
BEGIN
	DELETE FROM TblUrun_Kategori WHERE (KtgId = @KtgId); 
	DELETE FROM TblUrunKtgApp WHERE (KtgId = @KtgId)
	DELETE FROM TblSiteLinkleri WHERE  Id = @KtgId AND SablonAnahtar = 'shopCtg'
END




GO
/****** Object:  StoredProcedure [snlg_V1].[msp_Urunler]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [snlg_V1].[msp_Urunler]
	@KtgId int
AS
SET NOCOUNT ON;

DECLARE @DefaultLang smallint
SELECT TOP(1) @DefaultLang = Deger FROM snlg_V1.TblDegiskenler WHERE  Degisken = 'DefaultLang'

IF(@KtgId IS NULL)
	SELECT  TblUrunApp.UrunId, TblUrunApp.Sira, TblUrunDetay.UrunAd,TblUrunApp.Resim AS DefaultResim,TblUrunApp.Fiyat,
	TblUrunApp.Gorunurluk, TblUrunApp.UrunKodu
	FROM    TblUrunApp INNER JOIN
              TblUrunDetay ON TblUrunApp.UrunId = TblUrunDetay.UrunId 
	WHERE   (TblUrunDetay.Dil = @DefaultLang)  
	ORDER BY TblUrunApp.Sira ASC
ELSE
	SELECT  TblUrunApp.UrunId, TblUrunApp.Sira, TblUrunDetay.UrunAd,TblUrunApp.Resim AS DefaultResim,TblUrunApp.Fiyat,
	TblUrunApp.Gorunurluk, TblUrunApp.UrunKodu
	FROM    TblUrunApp INNER JOIN
              TblUrunDetay ON TblUrunApp.UrunId = TblUrunDetay.UrunId INNER JOIN
              TblUrun_Kategori ON TblUrunApp.UrunId = TblUrun_Kategori.UrunId
	WHERE   (TblUrunDetay.Dil = @DefaultLang) AND (TblUrun_Kategori.KtgId = @KtgId)
	ORDER BY TblUrunApp.Sira ASC














































GO
/****** Object:  StoredProcedure [snlg_V1].[msp_UrunResimEkle]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [snlg_V1].[msp_UrunResimEkle]
	@UrunId int,@Resim varchar(250)
AS
SET NOCOUNT ON;

INSERT INTO TblUrunResim(Resim, UrunId) 
VALUES (@Resim, @UrunId)

UPDATE snlg_V1.TblUrunApp SET Resim = @Resim WHERE UrunId = @UrunId AND Resim IS NULL
















GO
/****** Object:  StoredProcedure [snlg_V1].[msp_UrunSil]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [snlg_V1].[msp_UrunSil]
	@UrunId varchar(4000)
AS
SET NOCOUNT ON;

DECLARE @ResimlerSql NVARCHAR(4000)
DECLARE @Params NVARCHAR(4000), @Resimler varchar(8000)
SET @ResimlerSql = N'SET @ResimlerOUT = 
		(
		SELECT       Resim AS [data()], '','' AS [data()]
		FROM         snlg_V1.TblUrunResim WHERE UrunId IN ('+@UrunId+')
		FOR XML path('''')
		)
		
		DELETE FROM snlg_V1.TblSiteLinkleri WHERE Id IN ('+@UrunId+') AND SablonAnahtar = ''shop''
		DELETE FROM snlg_V1.TblUrunApp WHERE UrunId IN ('+@UrunId+')  
'
SET @Params = N'@ResimlerOUT varchar(8000) OUTPUT'
EXECUTE sp_executesql
@ResimlerSql, @Params, @ResimlerOUT=@Resimler OUTPUT



SELECT @Resimler



GO
/****** Object:  StoredProcedure [snlg_V1].[msp_UyeDetaySec]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [snlg_V1].[msp_UyeDetaySec]
	@UyeId int, @Dil smallint
AS
SET NOCOUNT ON;

DECLARE @Diller varchar(1000)
SET @Diller = 
		(
		SELECT        TblDiller.DId AS [data()], '#' AS [data()], TblDiller.Name AS [data()], '#' AS [data()]
		FROM            TblDiller WHERE Aktif = 1 ORDER BY TblDiller.DId FOR XML path('')
		)

SELECT TUA.UyeId, @Diller AS Diller, TUA.Aktif, TUD.UyeAd, TUA.UserName, 
		TUA.Eposta, TUD.Firma, TUD.DTarih, TUD.EvTel, 
		TUD.CepTel, TUD.IsTel, TUD.Faks, TUD.Adres, TUD.VDaire, TUD.VNo, 
		TUD.TCNo, TUD.Resim, TUDD.UyeBilgi, TUA.HataSay, @Diller AS Diller
FROM            snlg_V1.TblUyeApp AS TUA LEFT OUTER JOIN
                         snlg_V1.TblUyeDetay AS TUD ON TUA.UyeId = TUD.UyeId LEFT OUTER JOIN
                         snlg_V1.TblUyeDetayDil AS TUDD ON TUA.UyeId = TUDD.UyeId AND TUDD.Dil = @Dil
WHERE        (TUA.UyeId = @UyeId) 












































GO
/****** Object:  StoredProcedure [snlg_V1].[msp_UyeGuncelle]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [snlg_V1].[msp_UyeGuncelle]
	@Firma varchar(200),
	@UyeAd varchar(75), 
	@DTarih date, 
	@EvTel varchar(20), 
	@IsTel varchar(20), 
	@CepTel varchar(20), 
	@Faks varchar(20), 
	@Eposta varchar(150), 
	@Sifre varchar(128), 
	@Aktif bit, 
	@Adres varchar(250), 
	@VDaire varchar(250), 
	@VNo varchar(15), 
	@TCNo char(11), 
	@Resim varchar(100), 
	@UyeId int,
	@UyeBilgi nvarchar(max), 
	@Dil smallint, 
	@UserName varchar(25), 
	@HataSay tinyint
AS
SET NOCOUNT ON;

--Kullanıcı adı varmı diye kontrol et
IF(EXISTS(SELECT UyeId FROM TblUyeApp WHERE  UserName = @UserName AND UyeId <> @UyeId))
 BEGIN
	RAISERROR('$#sqlhata1#$',11,1);
	RETURN
 END

--EPOSTA adı varmı diye kontrol et
--IF(EXISTS(SELECT UyeId FROM TblUyeApp WHERE  Eposta = @Eposta AND UyeId <> @UyeId))
-- BEGIN
--	RAISERROR('$#sqlhata2#$',11,1);
--	RETURN
-- END

DECLARE @SeoUrl varchar(500)
SET @SeoUrl = snlg_V1.fun_UrlOlustur(@UserName, 'user', 'user', @UyeId, @Dil)
UPDATE snlg_V1.TblSiteLinkleri SET SeoUrl = @SeoUrl where  Id = @UyeId AND SablonAnahtar = 'user' AND Dil=@Dil

UPDATE    TblUyeApp
SET     Eposta = @Eposta, UserName = @UserName, Sifre = ISNULL(@Sifre, Sifre), Aktif = @Aktif, 
		HataSay = @HataSay, SeoUrl = @SeoUrl
WHERE     (UyeId = @UyeId) 

IF(@@ROWCOUNT > 0)--üye güncellenmeişse var demektir.
 BEGIN
	
	UPDATE    TblUyeDetay
	SET    Firma = @Firma, UyeAd = @UyeAd, DTarih = @DTarih, EvTel = @EvTel, 
			IsTel = @IsTel, CepTel = @CepTel, Faks = @Faks, 
			Adres = @Adres, VDaire = @VDaire, VNo = @VNo, 
			TCNo = @TCNo, Resim = ISNULL(@Resim,Resim)
	WHERE     (UyeId = @UyeId)
	IF(@@ROWCOUNT < 1)--üyedetay güncellenmemişse yok demektir (ekle)
		INSERT INTO TblUyeDetay
					  (Firma, UyeAd, DTarih, EvTel, IsTel, CepTel, Faks,Adres, VDaire, VNo, TCNo, Resim, UyeId)
		VALUES     (@Firma,@UyeAd,@DTarih,@EvTel,@IsTel,@CepTel,@Faks,@Adres,@VDaire,@VNo,@TCNo,@Resim,@UyeId) 


	UPDATE    TblUyeDetayDil
	SET              UyeBilgi = @UyeBilgi
	WHERE     (UyeId = @UyeId) AND (Dil = @Dil)
	IF(@@ROWCOUNT < 1)--üyedetaydil güncellenmemişse yok demektir (ekle)
		INSERT INTO TblUyeDetayDil (UyeId, UyeBilgi, Dil) VALUES (@UyeId,@UyeBilgi,@Dil)

 END
















































GO
/****** Object:  StoredProcedure [snlg_V1].[msp_Uyeler]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [snlg_V1].[msp_Uyeler]
	@RolId smallint
AS
SET NOCOUNT ON;

IF(@RolId IS NULL)
	SELECT UyeId, UserName, Eposta, Aktif 
	FROM TblUyeApp ORDER BY UyeId DESC
ELSE
	SELECT     TblUyeApp.UyeId, TblUyeApp.UserName, TblUyeApp.Eposta, TblUyeApp.Aktif
	FROM         TblUyeApp INNER JOIN
				  TblRol_Uye ON TblUyeApp.UyeId = TblRol_Uye.UyeId
	WHERE     (TblRol_Uye.RolId = @RolId)
	ORDER BY TblUyeApp.UyeId DESC











































GO
/****** Object:  StoredProcedure [snlg_V1].[msp_UyeOlustur]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [snlg_V1].[msp_UyeOlustur]
	@Firma varchar(200), @UyeAd varchar(75), @DTarih date, @EvTel varchar(20), 
	@IsTel varchar(20), @UserName varchar(25),
	@CepTel varchar(20), @Faks varchar(20), @Eposta varchar(150), @Sifre varchar(128), 
	@Aktif bit, @Adres varchar(250), @VDaire varchar(250), @VNo varchar(15), 
	@TCNo char(11), @Resim varchar(25),@UyeBilgi nvarchar(max)
AS
SET NOCOUNT ON;

--Kullanıcı adı varmı diye kontrol et
IF(EXISTS(SELECT UyeId FROM TblUyeApp WHERE  UserName = @UserName ))
 BEGIN
	RAISERROR('$#sqlhata1#$',11,1);
	RETURN
 END

--EPOSTA adı varmı diye kontrol et
IF(EXISTS(SELECT UyeId FROM TblUyeApp WHERE  Eposta = @Eposta))
 BEGIN
	RAISERROR('$#sqlhata2#$',11,1);
	RETURN
 END
 
DECLARE @DefaultLang smallint
SELECT TOP(1) @DefaultLang = Deger FROM snlg_V1.TblDegiskenler WHERE  Degisken = 'DefaultLang'

DECLARE @SeoUrl varchar(500), @UyeId int
SET @SeoUrl = snlg_V1.fun_UrlOlustur(@UserName, 'user', NULL, NULL, @DefaultLang)

INSERT INTO TblUyeApp (Eposta, Sifre, Aktif, UserName, HataSay, UyelikTarihi, SeoUrl)
VALUES (@Eposta,@Sifre,@Aktif,@UserName, 0, GETDATE(),@SeoUrl)

SET @UyeId = SCOPE_IDENTITY()

INSERT INTO snlg_V1.TblSiteLinkleri (SeoUrl, Id, UrlAnahtar, SablonAnahtar, Dil) VALUES (@SeoUrl, @UyeId,'user','user', @DefaultLang)

IF(@@ROWCOUNT > 0)
 BEGIN
	INSERT INTO TblUyeDetay
                  (Firma, UyeAd, DTarih, EvTel, IsTel, CepTel, Faks,Adres, VDaire, VNo, TCNo, Resim, UyeId)
	VALUES     (@Firma,@UyeAd,@DTarih,@EvTel,@IsTel,@CepTel,@Faks,@Adres,@VDaire,@VNo,@TCNo,@Resim,@UyeId)

	INSERT INTO TblUyeDetayDil (UyeId, UyeBilgi, Dil) VALUES (@UyeId,@UyeBilgi,1)
 END


































GO
/****** Object:  StoredProcedure [snlg_V1].[msp_UyeSil]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [snlg_V1].[msp_UyeSil]
	@Uyeler varchar(4000), @AdminId varchar(15)
AS
SET NOCOUNT ON;

IF(CHARINDEX((',' + @AdminId + ','), (',' + @Uyeler + ',')) < 1)--yani silinen üye admin değilse sil
 BEGIN
	DECLARE @ResimlerSql NVARCHAR(4000)
	DECLARE @Params NVARCHAR(4000), @Resimler varchar(8000)
	SET @ResimlerSql = N'SET @ResimlerOUT = 
			(
			SELECT       Resim AS [data()], '','' AS [data()]
			FROM         snlg_V1.TblUyeDetay
			WHERE       UyeId IN ('+@Uyeler+')
			FOR XML path('''')
			)
		
			DELETE FROM snlg_V1.TblSiteLinkleri WHERE Id IN ('+@Uyeler+') AND SablonAnahtar = ''user''
			DELETE FROM snlg_V1.TblUyeDetayDil WHERE UyeId IN ('+@Uyeler+')
			DELETE FROM snlg_V1.TblUyeDetay WHERE UyeId IN ('+@Uyeler+')
			UPDATE snlg_V1.TblMakaleYorum SET UyeId = NULL WHERE UyeId IN ('+@Uyeler+')
			UPDATE snlg_V1.TblMakalePuan SET UyeId = NULL, IP = NULL WHERE UyeId IN ('+@Uyeler+')
			DELETE FROM snlg_V1.TblUyeApp WHERE UyeId IN ('+@Uyeler+')  
	'
	SET @Params = N'@ResimlerOUT varchar(8000) OUTPUT'
	EXECUTE sp_executesql
	@ResimlerSql, @Params, @ResimlerOUT=@Resimler OUTPUT

	SELECT @Resimler
 END
ELSE
	RAISERROR('$#sqlhata1#$',11,1);











































GO
/****** Object:  StoredProcedure [snlg_V1].[msp_ZDefteriYorumDetay]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [snlg_V1].[msp_ZDefteriYorumDetay]
	@YId int
AS
SET NOCOUNT ON;

SELECT     T1.YId, T1.Yorum, T1.Onay, T1.Baslik, T1.Yazan, T2.Yorum AS Cevap
FROM         TblZiyaretciDefteri AS T1 LEFT OUTER JOIN
			TblZiyaretciDefteri AS T2 ON T1.YId = T2.UstYId
WHERE     (T1.YId = @YId)











































GO
/****** Object:  StoredProcedure [snlg_V1].[msp_ZDefteriYorumGuncelle]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [snlg_V1].[msp_ZDefteriYorumGuncelle]
	@YId int,
	@Onay bit, 
	@Yorum nvarchar(1500), 
	@Yazan nvarchar(30),
	@Baslik nvarchar(75), 
	@Cevap nvarchar(1500),
	@CevapYazan nvarchar(30)
AS
SET NOCOUNT ON;
--@Yazan
	UPDATE   snlg_V1.TblZiyaretciDefteri
	SET Yorum = @Yorum, Onay = @Onay, Yazan = @Yazan, Baslik = @Baslik
	WHERE    (YId = @YId) 

IF(@Cevap IS NULL)
BEGIN
    DELETE FROM snlg_V1.TblZiyaretciDefteri WHERE UstYId = @YId

END
ELSE
BEGIN

---üst yorumu güncelle
IF(ISNULL((SELECT ISNULL(UstYId,0) FROM snlg_V1.TblZiyaretciDefteri WHERE UstYId = @YId),0))=0
		INSERT INTO snlg_V1.TblZiyaretciDefteri (Onay, UstYId, Yorum,Yazan,Baslik)
		VALUES (@Onay, @YId, @Cevap,@Yazan,@Baslik)
ELSE
	BEGIN
		UPDATE snlg_V1.TblZiyaretciDefteri SET Yorum = @Cevap, Onay = @Onay,Yazan=@CevapYazan
		WHERE   (UstYId = @YId) 
	END
	--IF(@@ROWCOUNT < 1)
END
















GO
/****** Object:  StoredProcedure [snlg_V1].[msp_ZDefteriYorumlar]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [snlg_V1].[msp_ZDefteriYorumlar]
	@Onay bit
AS
SET NOCOUNT ON;

SELECT     YId, Baslik
FROM         TblZiyaretciDefteri 
WHERE      UstYId IS NULL AND (Onay = @Onay) 
ORDER BY YId DESC









































GO
/****** Object:  StoredProcedure [snlg_V1].[zsp_AnketCevapla]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [snlg_V1].[zsp_AnketCevapla] 
	@AnketId int, @IP varchar(15), @Cevap char(1), @UserId int
AS

IF EXISTS(SELECT AnketId FROM TblAnketApp WHERE AnketId = @AnketId  )
 BEGIN
	IF(@UserId IS NULL)--ÜYE DEĞİLSE İP İLE KAYDET
	 BEGIN
		UPDATE TblAnketCevap SET Cevap = @Cevap WHERE (AnketId = @AnketId) AND (IP = @IP)
		IF(@@ROWCOUNT<1)
			INSERT INTO TblAnketCevap (AnketId, Cevap, IP) VALUES (@AnketId, @Cevap, @IP)
	 END
	ELSE--ÜYE İSE USER ID İLE KAYDET
	 BEGIN
		UPDATE TblAnketCevap SET Cevap = @Cevap WHERE (AnketId = @AnketId) AND (UserId = @UserId)
		IF(@@ROWCOUNT<1)
			INSERT INTO TblAnketCevap (AnketId, Cevap, UserId) VALUES (@AnketId, @Cevap, @UserId)
	 END
 END













































GO
/****** Object:  StoredProcedure [snlg_V1].[zsp_Anketler]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [snlg_V1].[zsp_Anketler]
	@Dil smallint, @UserId int, @IP varchar(15)
AS
SET NOCOUNT ON;

DECLARE @Gorunurluk tinyint
IF(@UserId IS NOT NULL)
	SET @Gorunurluk = 2
ELSE
	SET @Gorunurluk = 3


DECLARE @DefaultLang smallint
SELECT TOP(1) @DefaultLang = Deger FROM snlg_V1.TblDegiskenler WHERE  Degisken = 'DefaultLang'


SELECT  TblAnketApp.AnketId, TblAnketApp.SonucGoster, TblAnketApp.Gorunurluk,
			ISNULL(TAD.Soru, (SELECT TOP 1 Soru FROM TblAnketDetay WHERE (AnketId = TblAnketApp.AnketId) AND (Dil = @DefaultLang))) AS Soru,
			ISNULL(TAD.A, (SELECT TOP 1 A FROM TblAnketDetay WHERE (AnketId = TblAnketApp.AnketId) AND (Dil = @DefaultLang))) AS A,
			ISNULL(TAD.B, (SELECT TOP 1 B FROM TblAnketDetay WHERE (AnketId = TblAnketApp.AnketId) AND (Dil = @DefaultLang))) AS B,
			ISNULL(TAD.C, (SELECT TOP 1 C FROM TblAnketDetay WHERE (AnketId = TblAnketApp.AnketId) AND (Dil = @DefaultLang))) AS C,
			ISNULL(TAD.D, (SELECT TOP 1 D FROM TblAnketDetay WHERE (AnketId = TblAnketApp.AnketId) AND (Dil = @DefaultLang))) AS D,
			ISNULL(TAD.E, (SELECT TOP 1 E FROM TblAnketDetay WHERE (AnketId = TblAnketApp.AnketId) AND (Dil = @DefaultLang))) AS E,
			ISNULL(TAD.F, (SELECT TOP 1 F FROM TblAnketDetay WHERE (AnketId = TblAnketApp.AnketId) AND (Dil = @DefaultLang))) AS F,
			ISNULL(TAD.G, (SELECT TOP 1 G FROM TblAnketDetay WHERE (AnketId = TblAnketApp.AnketId) AND (Dil = @DefaultLang))) AS G,
			ISNULL(TAD.H, (SELECT TOP 1 H FROM TblAnketDetay WHERE (AnketId = TblAnketApp.AnketId) AND (Dil = @DefaultLang))) AS H,
			(SELECT COUNT(Cevap) FROM TblAnketCevap WHERE (AnketId = TblAnketApp.AnketId) AND (Cevap = 'A')) AS ASay,
			(SELECT COUNT(Cevap) FROM TblAnketCevap WHERE (AnketId = TblAnketApp.AnketId) AND (Cevap = 'B')) AS BSay,
			(SELECT COUNT(Cevap) FROM TblAnketCevap WHERE (AnketId = TblAnketApp.AnketId) AND (Cevap = 'C')) AS CSay,
			(SELECT COUNT(Cevap) FROM TblAnketCevap WHERE (AnketId = TblAnketApp.AnketId) AND (Cevap = 'D')) AS DSay,
			(SELECT COUNT(Cevap) FROM TblAnketCevap WHERE (AnketId = TblAnketApp.AnketId) AND (Cevap = 'E')) AS ESay,
			(SELECT COUNT(Cevap) FROM TblAnketCevap WHERE (AnketId = TblAnketApp.AnketId) AND (Cevap = 'F')) AS FSay,
			(SELECT COUNT(Cevap) FROM TblAnketCevap WHERE (AnketId = TblAnketApp.AnketId) AND (Cevap = 'G')) AS GSay,
			(SELECT COUNT(Cevap) FROM TblAnketCevap WHERE (AnketId = TblAnketApp.AnketId) AND (Cevap = 'H')) AS HSay,
			(SELECT TOP(1) AnketID FROM TblAnketCevap WHERE IP = @IP OR UserID = @UserID) AS OyKulandi
FROM    TblAnketApp LEFT OUTER JOIN
			TblAnketDetay AS TAD ON TblAnketApp.AnketId = TAD.AnketId AND TAD.Dil = @Dil
WHERE TblAnketApp.Gorunurluk IN (1,@Gorunurluk)













































GO
/****** Object:  StoredProcedure [snlg_V1].[zsp_AnketSonuc]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [snlg_V1].[zsp_AnketSonuc]
	@AnketId int, @Dil smallint
AS
SET NOCOUNT ON;

DECLARE @DefaultLang smallint
SELECT TOP(1) @DefaultLang = Deger FROM snlg_V1.TblDegiskenler WHERE  Degisken = 'DefaultLang'

IF EXISTS(SELECT AnketId FROM TblAnketApp WHERE (AnketId = @AnketId) )
 BEGIN
	DECLARE @A int, @B int, @C int, @D int, @E int, @F int, @G int, @H int, @Toplam int

	SELECT @A = COUNT(Cevap) FROM TblAnketCevap WHERE (AnketId = @AnketId) AND (Cevap = 'A')
	SELECT @B = COUNT(Cevap) FROM TblAnketCevap WHERE (AnketId = @AnketId) AND (Cevap = 'B')
	SELECT @C = COUNT(Cevap) FROM TblAnketCevap WHERE (AnketId = @AnketId) AND (Cevap = 'C')
	SELECT @D = COUNT(Cevap) FROM TblAnketCevap WHERE (AnketId = @AnketId) AND (Cevap = 'D')
	SELECT @E = COUNT(Cevap) FROM TblAnketCevap WHERE (AnketId = @AnketId) AND (Cevap = 'E')
	SELECT @F = COUNT(Cevap) FROM TblAnketCevap WHERE (AnketId = @AnketId) AND (Cevap = 'F')
	SELECT @G = COUNT(Cevap) FROM TblAnketCevap WHERE (AnketId = @AnketId) AND (Cevap = 'G')
	SELECT @H = COUNT(Cevap) FROM TblAnketCevap WHERE (AnketId = @AnketId) AND (Cevap = 'H')
	SET @Toplam = @A + @B + @C + @D + @E
	
	SELECT     @Toplam AS Toplam, @A AS ASay, @B AS BSay, @C AS CSay, @D AS DSay, 
			@E AS ESay, @F AS FSay, @G AS GSay, @H AS HSay,
			ISNULL(Soru, (SELECT TOP 1 Soru FROM TblAnketDetay WHERE (AnketId = @AnketId) AND (Dil = @DefaultLang))) AS Soru,
			ISNULL(A, (SELECT TOP 1 A FROM TblAnketDetay WHERE (AnketId = @AnketId) AND (Dil = @DefaultLang))) AS A,
			ISNULL(B, (SELECT TOP 1 B FROM TblAnketDetay WHERE (AnketId = @AnketId) AND (Dil = @DefaultLang))) AS B,
			ISNULL(C, (SELECT TOP 1 C FROM TblAnketDetay WHERE (AnketId = @AnketId) AND (Dil = @DefaultLang))) AS C,
			ISNULL(D, (SELECT TOP 1 D FROM TblAnketDetay WHERE (AnketId = @AnketId) AND (Dil = @DefaultLang))) AS D,
			ISNULL(E, (SELECT TOP 1 E FROM TblAnketDetay WHERE (AnketId = @AnketId) AND (Dil = @DefaultLang))) AS E,
			ISNULL(F, (SELECT TOP 1 F FROM TblAnketDetay WHERE (AnketId = @AnketId) AND (Dil = @DefaultLang))) AS F,
			ISNULL(G, (SELECT TOP 1 G FROM TblAnketDetay WHERE (AnketId = @AnketId) AND (Dil = @DefaultLang))) AS G,
			ISNULL(H, (SELECT TOP 1 H FROM TblAnketDetay WHERE (AnketId = @AnketId) AND (Dil = @DefaultLang))) AS H
	FROM         TblAnketDetay
	WHERE     (AnketId = @AnketId) AND Dil = @Dil
 END

































GO
/****** Object:  StoredProcedure [snlg_V1].[zsp_AppDegerler]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [snlg_V1].[zsp_AppDegerler]
AS
SET NOCOUNT ON;

SELECT GglDogrula, GglAnalytic FROM TblAramaMotoru







































GO
/****** Object:  StoredProcedure [snlg_V1].[zsp_DilListele]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [snlg_V1].[zsp_DilListele]
AS
SET NOCOUNT ON;


SELECT    DId, Name, LongName FROM TblDiller WHERE Aktif = 1









































GO
/****** Object:  StoredProcedure [snlg_V1].[zsp_Duyuru_Detay]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [snlg_V1].[zsp_Duyuru_Detay]
	@Dil smallint, @DuyuruId int
AS
SET NOCOUNT ON;

DECLARE @DefaultLang smallint
SELECT TOP(1) @DefaultLang = Deger FROM snlg_V1.TblDegiskenler WHERE  Degisken = 'DefaultLang'

DECLARE @DefRsm varchar(500)
SELECT TOP(1) @DefRsm = ResimYol FROM TblVarsayilanResimler WHERE  ResimAnahtar = N'announce';

SELECT ISNULL(TDD.Baslik, (SELECT TOP 1 Baslik FROM TblDuyuruDetay WHERE DuyuruId = TDA.DuyuruId AND Dil = @DefaultLang)) AS Baslik,
		ISNULL(TDD.Duyuru, (SELECT TOP 1 Duyuru FROM TblDuyuruDetay WHERE DuyuruId = TDA.DuyuruId AND Dil = @DefaultLang)) AS Duyuru,
		ISNULL(TDA.Resim , @DefRsm) AS Resim,TDA.AramaIndex,
		TDA.Gorunurluk, TDA.Tarih
FROM TblDuyuruApp AS TDA LEFT OUTER JOIN
		TblDuyuruDetay AS TDD ON TDA.DuyuruId = TDD.DuyuruId AND TDD.Dil = @Dil
WHERE  TDA.DuyuruId = @DuyuruId AND TDA.Gorunurluk <> 4 











































GO
/****** Object:  StoredProcedure [snlg_V1].[zsp_Duyuru_SonEklenen]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [snlg_V1].[zsp_Duyuru_SonEklenen]
	@Dil smallint, @Adet tinyint
AS
SET NOCOUNT ON;

DECLARE @DefaultLang smallint
SELECT TOP(1) @DefaultLang = Deger FROM snlg_V1.TblDegiskenler WHERE  Degisken = 'DefaultLang'

DECLARE @DefRsm varchar(500)
SELECT TOP(1) @DefRsm = ResimYol FROM TblVarsayilanResimler WHERE  ResimAnahtar = N'announce';

SELECT	TOP(@Adet) TDD.SeoUrl,
		ISNULL(TDA.Resim, @DefRsm) AS Resim,
		ISNULL(TDD.Baslik, (SELECT TOP 1 Baslik FROM TblDuyuruDetay WHERE (DuyuruId = TDA.DuyuruId) AND (Dil = @DefaultLang))) AS Baslik				
FROM	TblDuyuruApp AS TDA LEFT OUTER JOIN
			TblDuyuruDetay AS TDD ON TDA.DuyuruId = TDD.DuyuruId AND TDD.Dil = @Dil
WHERE     (TDA.Gorunurluk <> 4)
ORDER BY TDA.DuyuruId DESC








GO
/****** Object:  StoredProcedure [snlg_V1].[zsp_Duyurular]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [snlg_V1].[zsp_Duyurular]
	@Dil smallint, @CurrentPage int, @PageSize int, @KayitSayisi int OUTPUT
AS
SET NOCOUNT ON;

DECLARE @DefaultLang smallint
SELECT TOP(1) @DefaultLang = Deger FROM snlg_V1.TblDegiskenler WHERE  Degisken = 'DefaultLang'

DECLARE @DefRsm varchar(500)
SELECT TOP(1) @DefRsm = ResimYol FROM TblVarsayilanResimler WHERE  ResimAnahtar = N'announce';

IF (@KayitSayisi < 0)
	SELECT @KayitSayisi = COUNT(DuyuruId) FROM TblDuyuruApp WHERE  (Gorunurluk <> 4)

BEGIN
	WITH TblSayfala AS
	(
		SELECT TOP(@PageSize*@CurrentPage) ROW_NUMBER() OVER(ORDER BY DuyuruId DESC) AS Sirala, DuyuruId
		FROM TblDuyuruApp WHERE  (Gorunurluk <> 4) 
	)
	SELECT TDD.SeoUrl,
		ISNULL(TDA.Resim, @DefRsm) AS Resim,
		ISNULL(TDD.Baslik, (SELECT TOP 1 Baslik FROM TblDuyuruDetay WHERE DuyuruId = TDA.DuyuruId AND Dil = @DefaultLang)) AS Baslik
	FROM TblSayfala INNER JOIN 
			TblDuyuruApp AS TDA ON TblSayfala.DuyuruId = TDA.DuyuruId  LEFT OUTER JOIN
			TblDuyuruDetay AS TDD ON TDA.DuyuruId = TDD.DuyuruId AND TDD.Dil = @Dil
	WHERE TblSayfala.Sirala BETWEEN ((@CurrentPage - 1) * @PageSize) + 1 AND @CurrentPage * @PageSize
END
	












































GO
/****** Object:  StoredProcedure [snlg_V1].[zsp_EpostaIletisim]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [snlg_V1].[zsp_EpostaIletisim]
AS
SET NOCOUNT ON;

SELECT     TOP (1) 1, TES.Kime, TES.Kimden, TES.KimdenIsim, TES.Mesaj, TES.Konu, TES.SmtpHost, TES.SmtpPsw, TES.SmtpPort, TES.SSL_
FROM         TblEPostaSablon AS TES 
WHERE     (TES.Anahtar = N'iletişimFormu_Admine')
UNION
SELECT     TOP (1) 2, Kime, Kimden, KimdenIsim, Mesaj, Konu, SmtpHost, SmtpPsw, SmtpPort, SSL_
FROM         TblEPostaSablon
WHERE      (Anahtar = N'iletişimFormu_Ziyaretçiye')
ORDER BY 1 



GO
/****** Object:  StoredProcedure [snlg_V1].[zsp_EPostaSablonGetir_Smtp]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [snlg_V1].[zsp_EPostaSablonGetir_Smtp]
	@Anahtar nvarchar(50), @Ozelifadeler varchar(8000)
AS
SET NOCOUNT ON;


IF NOT EXISTS(SELECT * FROM TblEPostaSablon WHERE (Anahtar = @Anahtar))
	INSERT INTO snlg_V1.TblEPostaSablon
			 (Anahtar, Kimden, KimdenIsim, Kime, Konu, Mesaj, Aciklama, Bilgi,SmtpPsw,SmtpPort,SmtpHost,Ssl_)
	VALUES (@Anahtar, NULL, NULL, NULL, NULL, @Ozelifadeler, NULL, @Ozelifadeler, NULL, NULL,	NULL,	0)


SELECT     TOP (1) Kimden, KimdenIsim, Kime, Konu, Mesaj, Aciklama, Bilgi, SmtpHost, SmtpPsw, SmtpPort, SSL_
FROM         TblEPostaSablon
WHERE     (Anahtar = @Anahtar)



GO
/****** Object:  StoredProcedure [snlg_V1].[zsp_EtkinlikDetay]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [snlg_V1].[zsp_EtkinlikDetay] 
	@Dil smallint, @EtkinlikId int
AS

SELECT ISNULL(TH.Detay,(SELECT Detay FROM TblEtkinlikDetay WHERE EtkinlikId = @EtkinlikId AND Dil = 1)) AS Detay,
		ISNULL(TH.Baslik,(SELECT Baslik FROM TblEtkinlikDetay WHERE EtkinlikId = @EtkinlikId AND Dil = 1)) AS Baslik,
		THA.Resim, THA.Tarih1,THA.Tarih2
FROM TblEtkinlikApp AS THA LEFT OUTER JOIN 
		TblEtkinlikDetay AS TH ON THA.EtkinlikId = TH.EtkinlikId AND TH.Dil = @Dil 
WHERE (THA.EtkinlikId = @EtkinlikId)









































GO
/****** Object:  StoredProcedure [snlg_V1].[zsp_Etkinlikler]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [snlg_V1].[zsp_Etkinlikler] 
	@Dil smallint, @Baslangic date
AS

DECLARE @DefaultLang smallint
SELECT TOP(1) @DefaultLang = Deger FROM snlg_V1.TblDegiskenler WHERE  Degisken = 'DefaultLang'

SELECT THA.EtkinlikId, THA.Tarih1, THA.Tarih2,
	ISNULL(TH.Baslik, (SELECT Baslik FROM TblEtkinlikDetay WHERE EtkinlikId = THA.EtkinlikId AND Dil = @DefaultLang)) AS Baslik
FROM TblEtkinlikApp AS THA LEFT OUTER JOIN TblEtkinlikDetay AS TH ON THA.EtkinlikId = TH.EtkinlikId AND (TH.Dil = @Dil)
WHERE Tarih1 >= @Baslangic











GO
/****** Object:  StoredProcedure [snlg_V1].[zsp_GaleridekiResimler]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [snlg_V1].[zsp_GaleridekiResimler]
	@Dil smallint, @GId int
AS
SET NOCOUNT ON;

DECLARE @DefaultLang smallint
SELECT TOP(1) @DefaultLang = Deger FROM snlg_V1.TblDegiskenler WHERE  Degisken = 'DefaultLang'

SELECT  ISNULL(TRD.Baslik, (SELECT TOP 1 Baslik FROM TblResimGaleriResimlerDetay WHERE RId = TRA.RId AND Dil = @DefaultLang)) AS Baslik,
		ISNULL(TRD.Bilgi, (SELECT TOP 1 Bilgi FROM TblResimGaleriResimlerDetay WHERE RId = TRA.RId AND Dil = @DefaultLang)) AS Bilgi,
		TRA.Resim, TRA.LinkUrl
FROM    TblResimGaleriResimlerApp AS TRA LEFT OUTER JOIN
		 TblResimGaleriResimlerDetay AS TRD ON TRA.RId = TRD.RId AND (TRD.Dil = @Dil)
WHERE        (TRA.GId = @GId) 
ORDER BY TRA.Sira



GO
/****** Object:  StoredProcedure [snlg_V1].[zsp_Haber_Detay]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [snlg_V1].[zsp_Haber_Detay]
	@Dil smallint, @HaberId int
AS
SET NOCOUNT ON;

DECLARE @DefaultLang smallint
SELECT TOP(1) @DefaultLang = Deger FROM snlg_V1.TblDegiskenler WHERE  Degisken = 'DefaultLang'

DECLARE @DefRsm varchar(500)
SELECT TOP(1) @DefRsm = ResimYol FROM TblVarsayilanResimler WHERE  ResimAnahtar = N'news';

SELECT ISNULL(THD.Baslik, (SELECT TOP 1 Baslik FROM TblHaberDetay WHERE HaberId = THA.HaberId AND Dil = @DefaultLang)) AS Baslik,
		ISNULL(THD.Bilgi, (SELECT TOP 1 Bilgi FROM TblHaberDetay WHERE HaberId = THA.HaberId AND Dil = @DefaultLang)) AS Bilgi,
		ISNULL(THD.Haber, (SELECT TOP 1 Haber FROM TblHaberDetay WHERE HaberId = THA.HaberId AND Dil = @DefaultLang)) AS Haber,
		ISNULL(THA.Resim, @DefRsm) AS Resim,
		THA.Gorunurluk, THA.Tarih, THA.AramaIndex
FROM TblHaberApp AS THA LEFT OUTER JOIN
		TblHaberDetay AS THD ON THA.HaberId = THD.HaberId AND THD.Dil = @Dil
WHERE  THA.HaberId = @HaberId AND THA.Gorunurluk <> 4












































GO
/****** Object:  StoredProcedure [snlg_V1].[zsp_Haber_SonEklenen]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [snlg_V1].[zsp_Haber_SonEklenen]
	@Dil smallint, @Adet tinyint
AS
SET NOCOUNT ON;

DECLARE @DefaultLang smallint
SELECT TOP(1) @DefaultLang = Deger FROM snlg_V1.TblDegiskenler WHERE  Degisken = 'DefaultLang'

DECLARE @DefRsm varchar(500)
SELECT TOP(1) @DefRsm = ResimYol FROM TblVarsayilanResimler WHERE  ResimAnahtar = N'news';

SELECT	TOP(@Adet) THD.SeoUrl,
		ISNULL(THA.Resim, @DefRsm) AS Resim,
		ISNULL(THD.Baslik, (SELECT TOP 1 Baslik FROM TblHaberDetay WHERE (HaberId = THA.HaberId) AND (Dil = @DefaultLang))) AS Baslik,				
		ISNULL(THD.Bilgi, (SELECT TOP 1 Bilgi FROM TblHaberDetay WHERE (HaberId = THA.HaberId) AND (Dil = @DefaultLang))) AS Bilgi				
FROM	TblHaberApp AS THA LEFT OUTER JOIN
			TblHaberDetay AS THD ON THA.HaberId = THD.HaberId AND THD.Dil = @Dil
WHERE     (THA.Gorunurluk <> 4)
ORDER BY THA.HaberId DESC











































GO
/****** Object:  StoredProcedure [snlg_V1].[zsp_Haberler]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [snlg_V1].[zsp_Haberler]
	@Dil smallint, @CurrentPage int, 
	@PageSize int, @KayitSayisi int OUTPUT
AS
SET NOCOUNT ON;

DECLARE @DefaultLang smallint
SELECT TOP(1) @DefaultLang = Deger FROM snlg_V1.TblDegiskenler WHERE  Degisken = 'DefaultLang'

DECLARE @DefRsm varchar(500)
SELECT TOP(1) @DefRsm = ResimYol FROM TblVarsayilanResimler WHERE  ResimAnahtar = N'news';

IF (@KayitSayisi < 0)
	SELECT @KayitSayisi = COUNT(HaberId) FROM TblHaberApp WHERE  (Gorunurluk <> 4)

BEGIN
	WITH TblSayfala AS
	(
		SELECT TOP(@PageSize*@CurrentPage) ROW_NUMBER() OVER(ORDER BY HaberId DESC) AS Sirala, HaberId
		FROM TblHaberApp WHERE  (Gorunurluk <> 4) 
	)
	SELECT THD.SeoUrl,
		ISNULL(THA.Resim, @DefRsm) AS Resim,
		ISNULL(THD.Baslik, (SELECT TOP 1 Baslik FROM TblHaberDetay WHERE HaberId = THA.HaberId AND Dil = @DefaultLang)) AS Baslik,
		ISNULL(THD.Bilgi, (SELECT TOP 1 Bilgi FROM TblHaberDetay WHERE HaberId = THA.HaberId AND Dil = @DefaultLang)) AS Bilgi
	FROM TblSayfala INNER JOIN 
			TblHaberApp AS THA ON TblSayfala.HaberId = THA.HaberId  LEFT OUTER JOIN
			TblHaberDetay AS THD ON THA.HaberId = THD.HaberId AND THD.Dil = @Dil
	WHERE TblSayfala.Sirala BETWEEN ((@CurrentPage - 1) * @PageSize) + 1 AND @CurrentPage * @PageSize
END
	

	


































GO
/****** Object:  StoredProcedure [snlg_V1].[zsp_Makale_ArsivdekiMakaleler]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [snlg_V1].[zsp_Makale_ArsivdekiMakaleler]
	@Dil smallint, @Ay int, @Yil int,
	@CurrentPage int, 
	@PageSize int, @KayitSayisi int OUTPUT
AS
SET NOCOUNT ON;

DECLARE @DefaultLang smallint
SELECT TOP(1) @DefaultLang = Deger FROM snlg_V1.TblDegiskenler WHERE  Degisken = 'DefaultLang'

DECLARE @DefRsm varchar(500)
SELECT TOP(1) @DefRsm = ResimYol FROM TblVarsayilanResimler WHERE  ResimAnahtar = N'blog'

IF (@KayitSayisi < 0)
	SELECT  @KayitSayisi = COUNT(TMA.MakId)
	FROM    TblMakale_Kategori AS TMK INNER JOIN
			  TblMakaleApp AS TMA ON TMK.MakId = TMA.MakId 
	WHERE     (TMA.Gorunurluk <> 4) AND
	DATEPART(YEAR, TMA.Tarih) = @Yil AND
	DATEPART(MONTH, TMA.Tarih) = @Ay
	
		
BEGIN
	WITH TblSayfala AS
	(
		SELECT TOP(@PageSize*@CurrentPage) ROW_NUMBER() OVER(ORDER BY TMA.Sira asc, TMA.MakId asc) AS Sirala, TMA.MakId,TMA.Tarih
		FROM    TblMakale_Kategori AS TMK INNER JOIN
				  TblMakaleApp AS TMA ON TMK.MakId = TMA.MakId
		WHERE     (TMA.Gorunurluk <> 4) AND
		  DATEPART(YEAR, TMA.Tarih) = @Yil AND
			DATEPART(MONTH, TMA.Tarih) = @Ay
       ORDER BY TMA.MakId DESC
			
	)
	SELECT TMD.SeoUrl, TMA.MakId,
		(SELECT COUNT(YId) FROM TblMakaleYorum WHERE (MakId = TMA.MakId ) AND (Onay = 1)) AS YorumSay,
		TMA.Tarih AS Tarih,
		(Select UserName FROM snlg_V1.TblUyeApp AS TBUye WHERE TBUye.UyeId=TMA.YazarId) AS Yazar,

		ISNULL(TMA.Resim, @DefRsm) AS Resim,
		ISNULL(TMD.Baslik, (SELECT TOP 1 Baslik FROM TblMakaleDetay WHERE (MakId = TMA.MakId) AND (Dil = @DefaultLang))) AS Baslik,
		ISNULL(TMD.Bilgi, (SELECT TOP 1 Bilgi FROM TblMakaleDetay WHERE (MakId = TMA.MakId) AND (Dil = @DefaultLang))) AS Bilgi
	FROM TblSayfala INNER JOIN
			TblMakaleApp AS TMA ON TblSayfala.MakId = TMA.MakId LEFT OUTER JOIN
			TblMakaleDetay AS TMD ON TMA.MakId = TMD.MakId AND TMD.Dil = @Dil  
	WHERE TblSayfala.Sirala BETWEEN ((@CurrentPage - 1) * @PageSize) + 1 AND @CurrentPage * @PageSize AND
	DATEPART(YEAR, TMA.Tarih) = @Yil AND
			DATEPART(MONTH, TMA.Tarih) = @Ay
    ORDER BY TMA.MakId DESC
	
END








GO
/****** Object:  StoredProcedure [snlg_V1].[zsp_Makale_ArsivList]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [snlg_V1].[zsp_Makale_ArsivList]
AS
SET NOCOUNT ON;

SELECT count(*) AS Sayi, DATEPART(MONTH, Tarih) AS Ay, DATEPART(YEAR, Tarih) AS Yil
FROM        snlg_V1.TblMakaleApp 
WHERE      (Gorunurluk <> 4) 
GROUP BY DATEPART(MONTH, Tarih), DATEPART(YEAR, Tarih)
ORDER BY 2 DESC, 1 DESC











































GO
/****** Object:  StoredProcedure [snlg_V1].[zsp_Makale_EnCokPuanlanan]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [snlg_V1].[zsp_Makale_EnCokPuanlanan]
	@Dil smallint, @Adet tinyint
AS
SET NOCOUNT ON;

	DECLARE @DefaultLang smallint
	SELECT TOP(1) @DefaultLang = Deger FROM snlg_V1.TblDegiskenler WHERE  Degisken = 'DefaultLang'

	SELECT TOP (@Adet) TMD.SeoUrl,TMA.Tarih,
				ISNULL(TMD.Baslik, (SELECT TOP 1 Baslik FROM TblMakaleDetay WHERE (MakId = TMA.MakId) AND (Dil = @DefaultLang))) AS Baslik
	FROM         TblMakaleApp AS TMA INNER JOIN
				  TblMakalePuan AS TMDY ON TMA.MakId = TMDY.MakId LEFT OUTER JOIN
				  TblMakaleDetay AS TMD ON TMA.MakId = TMD.MakId AND TMD.Dil = @Dil
	WHERE     (TMA.Gorunurluk <> 4) 
	GROUP BY Baslik, TMD.SeoUrl,TMA.MakId,TMA.Tarih
	ORDER BY SUM(TMDY.Puan), COUNT(TMD.SeoUrl) DESC




GO
/****** Object:  StoredProcedure [snlg_V1].[zsp_Makale_EnCokYorumlanan]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [snlg_V1].[zsp_Makale_EnCokYorumlanan]
	@Dil smallint, @Adet tinyint
AS
SET NOCOUNT ON;

DECLARE @DefaultLang smallint
SELECT TOP(1) @DefaultLang = Deger FROM snlg_V1.TblDegiskenler WHERE  Degisken = 'DefaultLang'

--SET LANGUAGE Turkish;
SELECT TOP (@Adet) TMD.SeoUrl,TMA.Tarih AS  Tarih,
		ISNULL(TMD.Baslik, (SELECT TOP 1 Baslik FROM snlg_V1.TblMakaleDetay WHERE (MakId = TMA.MakId) AND (Dil = @DefaultLang))) AS Baslik
FROM         snlg_V1.TblMakaleApp AS TMA INNER JOIN
			  snlg_V1.TblMakaleYorum AS TMDY ON TMA.MakId = TMDY.MakId LEFT OUTER JOIN
			  snlg_V1.TblMakaleDetay AS TMD ON TMA.MakId = TMD.MakId AND TMD.Dil = @Dil
WHERE     (TMA.Gorunurluk <> 4) AND (TMDY.Onay = 1) AND (TMDY.Yorum IS NOT NULL)
GROUP BY Baslik, TMD.SeoUrl,TMA.MakId,TMA.Tarih
ORDER BY COUNT(TMDY.YId) DESC









































GO
/****** Object:  StoredProcedure [snlg_V1].[zsp_Makale_EnSonEklenen]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [snlg_V1].[zsp_Makale_EnSonEklenen]
	@Dil smallint, @Adet tinyint
AS
SET NOCOUNT ON;

DECLARE @DefaultLang smallint
SELECT TOP(1) @DefaultLang = Deger FROM snlg_V1.TblDegiskenler WHERE  Degisken = 'DefaultLang'

DECLARE @DefRsm varchar(500)
SELECT TOP(1) @DefRsm = ResimYol FROM TblVarsayilanResimler WHERE  ResimAnahtar = N'blog'

--Eski Sorgu
--SELECT	TOP(@Adet) TMA.SeoUrl,
--		ISNULL(TMA.Resim, @DefRsm) AS Resim,
--		ISNULL(TMD.Baslik, (SELECT TOP 1 Baslik FROM TblMakaleDetay WHERE (MakId = TMA.MakId) AND (Dil = 1055))) AS Baslik,
--		ISNULL(TMD.Bilgi, (SELECT TOP 1 Bilgi FROM TblMakaleDetay WHERE (MakId = TMA.MakId) AND (Dil = 1055))) AS Bilgi
--FROM	TblMakaleApp AS TMA LEFT OUTER JOIN
--			TblMakaleDetay AS TMD ON TMA.MakId = TMD.MakId AND TMD.Dil = @Dil
--WHERE     (TMA.Gorunurluk <> 4)
--ORDER BY TMA.MakId DESC
--SET LANGUAGE Turkish;
SELECT	TOP(@Adet) TMD.SeoUrl,TMA.MakId,
		ISNULL(TMA.Resim, @DefRsm) AS Resim,
		ISNULL(TMD.Baslik, (SELECT TOP 1 Baslik FROM snlg_V1.TblMakaleDetay WHERE (MakId = TMA.MakId) AND (Dil = @DefaultLang))) AS Baslik,
		ISNULL(TMD.Bilgi, (SELECT TOP 1 Bilgi FROM snlg_V1.TblMakaleDetay WHERE (MakId = TMA.MakId) AND (Dil = @DefaultLang))) AS Bilgi,
		TMA.Tarih AS Tarih,

		(Select UserName FROM snlg_V1.TblUyeApp AS TBUye WHERE TBUye.UyeId=TMA.YazarId) AS Yazar,
		(SELECT COUNT(YId) FROM TblMakaleYorum WHERE (MakId = TMA.MakId ) AND (Onay = 1)) AS YorumSayisi

FROM	snlg_V1.TblMakaleApp AS TMA LEFT OUTER JOIN
			snlg_V1.TblMakaleDetay AS TMD 
			ON TMA.MakId = TMD.MakId AND TMD.Dil = @Dil
WHERE     (TMA.Gorunurluk <> 4)
ORDER BY TMA.MakId DESC









































GO
/****** Object:  StoredProcedure [snlg_V1].[zsp_Makale_EnSonYorumlanan]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [snlg_V1].[zsp_Makale_EnSonYorumlanan]
	@Dil smallint, @Adet tinyint
AS
SET NOCOUNT ON;

DECLARE @DefaultLang smallint
SELECT TOP(1) @DefaultLang = Deger FROM snlg_V1.TblDegiskenler WHERE  Degisken = 'DefaultLang'

--SET LANGUAGE Turkish;
SELECT 	ISNULL(TMD.Baslik, (SELECT TOP 1 Baslik FROM TblMakaleDetay WHERE (MakId = Tbl1.MakId) AND (Dil = @DefaultLang))) AS Baslik,
	TMD.SeoUrl,(SELECT Tarih AS  Tarih FROM snlg_V1.TblMakaleApp AS TMA3 WHERE TMA3.MakId=Tbl1.MakId ) AS Tarih
FROM	
	(
	SELECT TOP(5) TMA2.MakId
	FROM	TblMakaleApp AS TMA2 INNER JOIN TblMakaleYorum AS TMY2 ON TMA2.MakId = TMY2.MakId
	WHERE     (TMA2.Gorunurluk <> 4) AND TMY2.Onay = 1
	GROUP BY TMA2.MakId
	ORDER BY MAX(TMY2.YId) DESC
	) 
	AS Tbl1 LEFT OUTER JOIN
			TblMakaleDetay AS TMD ON Tbl1.MakId = TMD.MakId AND TMD.Dil = @Dil









































GO
/****** Object:  StoredProcedure [snlg_V1].[zsp_Makale_Icerik]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [snlg_V1].[zsp_Makale_Icerik]
	@Dil smallint, @MakId int
AS
SET NOCOUNT ON;

	DECLARE @DefaultLang smallint
	SELECT TOP(1) @DefaultLang = Deger FROM snlg_V1.TblDegiskenler WHERE  Degisken = 'DefaultLang'

	DECLARE @DefRsm varchar(500)
	SELECT TOP(1) @DefRsm = ResimYol FROM TblVarsayilanResimler WHERE  ResimAnahtar = N'blog'

	SELECT TMA.MakId,ISNULL(TMD.Baslik, (SELECT TOP 1 Baslik FROM TblMakaleDetay WHERE MakId = TMA.MakId AND Dil = @DefaultLang)) AS Baslik,
		ISNULL(TMD.Keyword, (SELECT TOP 1 Keyword FROM TblMakaleDetay WHERE MakId = TMA.MakId AND Dil = @DefaultLang)) AS Keyword,
		ISNULL(TMD.Icerik, (SELECT TOP 1 Icerik FROM TblMakaleDetay WHERE MakId = TMA.MakId AND Dil = @DefaultLang)) AS Icerik,
		ISNULL(TMD.Descr, (SELECT TOP 1 Descr FROM TblMakaleDetay WHERE MakId = TMA.MakId AND Dil = @DefaultLang)) AS Descr,
		ISNULL(TMA.Resim, @DefRsm) AS Resim,
		ISNULL((SELECT AVG(Puan)  FROM TblMakalePuan WHERE MakId = @MakId), 0) AS Puan,
		TUA.SeoUrl AS YazarDetayAdres, TAM.GglProfId, TAM.GglPsw, TAM.GglUser,
		TMA.Gorunurluk, TUD.UyeAd,TMA.AramaIndex,

		TMA.Tarih, TMD.SeoUrl,

		(Select UserName FROM snlg_V1.TblUyeApp AS TBUye WHERE TBUye.UyeId=TMA.YazarId) AS Yazar,
		( SELECT  COUNT(YId) AS YorumSayisi
			FROM    snlg_V1.TblMakaleYorum INNER JOIN 
				snlg_V1.TblMakaleApp ON snlg_V1.TblMakaleApp.MakId = TblMakaleYorum.MakId
			WHERE  snlg_V1.TblMakaleApp.MakId = TMD.MakId AND (Onay = 1) ) AS YorumSayisi

	FROM TblMakaleApp AS TMA LEFT OUTER JOIN
			TblMakaleDetay AS TMD ON TMA.MakId = TMD.MakId AND TMD.Dil = @Dil LEFT OUTER JOIN
			TblUyeApp AS TUA ON TUA.UyeId = TMA.YazarId LEFT OUTER JOIN
			TblUyeDetay AS TUD ON TMA.YazarId = TUD.UyeId LEFT OUTER JOIN
			TblAramaMotoru AS TAM ON 1=1
	WHERE  TMA.MakId = @MakId AND TMA.Gorunurluk <> 4



GO
/****** Object:  StoredProcedure [snlg_V1].[zsp_Makale_KategoriBilgileri]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [snlg_V1].[zsp_Makale_KategoriBilgileri]
	@Dil smallint, @KtgId int
AS
SET NOCOUNT ON;

DECLARE @DefaultLang smallint
SELECT TOP(1) @DefaultLang = Deger FROM snlg_V1.TblDegiskenler WHERE  Degisken = 'DefaultLang'

DECLARE @DefRsm varchar(500)
SELECT TOP(1) @DefRsm = ResimYol FROM TblVarsayilanResimler WHERE  ResimAnahtar = N'blogCtg';

SELECT ISNULL(TMKD.KtgAd, (SELECT TOP 1 KtgAd FROM TblMakaleKtgDetay WHERE KtgId = TMKA.KtgId AND Dil = @DefaultLang)) AS KtgAd,
		ISNULL(TMKD.Keyword, (SELECT TOP 1 Keyword FROM TblMakaleKtgDetay WHERE KtgId = TMKA.KtgId AND Dil = @DefaultLang)) AS Keyword,
		ISNULL(TMKD.Descr, (SELECT TOP 1 Descr FROM TblMakaleKtgDetay WHERE KtgId = TMKA.KtgId AND Dil = @DefaultLang)) AS Descr,
		ISNULL(TMKA.Resim, @DefRsm) AS Resim
FROM TblMakaleKtgApp AS TMKA LEFT OUTER JOIN
		TblMakaleKtgDetay AS TMKD ON TMKA.KtgId = TMKD.KtgId AND TMKD.Dil = @Dil
WHERE  TMKA.KtgId = @KtgId AND TMKA. Aktif = 1 











































GO
/****** Object:  StoredProcedure [snlg_V1].[zsp_Makale_KategoridekiMakaleler]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [snlg_V1].[zsp_Makale_KategoridekiMakaleler]
	@Dil smallint, @KtgId int, @CurrentPage int, 
	@PageSize int, @KayitSayisi int OUTPUT
AS
SET NOCOUNT ON;

DECLARE @DefaultLang smallint
SELECT TOP(1) @DefaultLang = Deger FROM snlg_V1.TblDegiskenler WHERE  Degisken = 'DefaultLang'

DECLARE @DefRsm varchar(500)
SELECT TOP(1) @DefRsm = ResimYol FROM TblVarsayilanResimler WHERE  ResimAnahtar = N'blog'

IF (@KayitSayisi < 0)
	SELECT  @KayitSayisi = COUNT(TMA.MakId)
	FROM    TblMakale_Kategori AS TMK INNER JOIN
			  TblMakaleApp AS TMA ON TMK.MakId = TMA.MakId 
	WHERE     (TMA.Gorunurluk <> 4) AND (TMK.KtgId = @KtgId)
BEGIN
	WITH TblSayfala AS
	(
		SELECT TOP(@PageSize*@CurrentPage) ROW_NUMBER() OVER(ORDER BY TMA.Sira DESC, TMA.MakId DESC) AS Sirala, TMA.MakId
		FROM    TblMakale_Kategori AS TMK INNER JOIN
				  TblMakaleApp AS TMA ON TMK.MakId = TMA.MakId
		WHERE     (TMA.Gorunurluk <> 4) AND (TMK.KtgId = @KtgId)
		 ORDER BY TMA.MakId DESC
	)
	SELECT DISTINCT TMD.SeoUrl, TMA.MakId,TMA.Tarih,
		(Select UserName FROM snlg_V1.TblUyeApp AS TBUye WHERE TBUye.UyeId=TMA.YazarId) AS Yazar,
		(SELECT COUNT(YId) FROM TblMakaleYorum WHERE (MakId = TMA.MakId ) AND (Onay = 1)) AS YorumSay,
		(SELECT AVG(Puan) FROM TblMakalePuan WHERE (MakId = TMA.MakId )) AS Puan,
		
		ISNULL(TMA.Resim, @DefRsm) AS Resim,
		ISNULL(TMD.Baslik, (SELECT TOP 1 Baslik FROM TblMakaleDetay WHERE MakId = TMA.MakId AND Dil = @DefaultLang)) AS Baslik,
		ISNULL(TMD.Bilgi, (SELECT TOP 1 Bilgi FROM TblMakaleDetay WHERE MakId = TMA.MakId AND Dil = @DefaultLang)) AS Bilgi
	FROM TblSayfala INNER JOIN
			TblMakaleApp AS TMA ON TblSayfala.MakId = TMA.MakId LEFT OUTER JOIN
			TblMakaleDetay AS TMD ON TMA.MakId = TMD.MakId AND TMD.Dil = @Dil
	WHERE TblSayfala.Sirala BETWEEN ((@CurrentPage - 1) * @PageSize) + 1 AND @CurrentPage * @PageSize
	 ORDER BY TMA.MakId DESC
END








GO
/****** Object:  StoredProcedure [snlg_V1].[zsp_makale_KategoriDetay]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [snlg_V1].[zsp_makale_KategoriDetay]
	@KtgId int, @Dil smallint
AS
SET NOCOUNT ON;

DECLARE @DefaultLang smallint
SELECT TOP(1) @DefaultLang = Deger FROM snlg_V1.TblDegiskenler WHERE  Degisken = 'DefaultLang'

SELECT	ISNULL(TblMakaleKtgDetay.KtgAd,(SELECT TOP(1) KtgAd FROM TblMakaleKtgDetay WHERE KtgId = @KtgId AND (Dil = @DefaultLang))) AS KtgAd,
			ISNULL(TblMakaleKtgDetay.Descr,(SELECT TOP(1) Descr FROM TblMakaleKtgDetay WHERE KtgId = @KtgId AND (Dil = @DefaultLang))) AS Descr,
			ISNULL(TblMakaleKtgDetay.Keyword,(SELECT TOP(1) Keyword FROM TblMakaleKtgDetay WHERE KtgId = @KtgId AND (Dil = @DefaultLang))) AS Keyword
FROM	TblMakaleKtgApp LEFT OUTER JOIN
		TblMakaleKtgDetay ON TblMakaleKtgApp.KtgId = TblMakaleKtgDetay.KtgId AND TblMakaleKtgDetay.Dil = @Dil
WHERE	(TblMakaleKtgApp.KtgId = @KtgId)












































GO
/****** Object:  StoredProcedure [snlg_V1].[zsp_Makale_Kategorileri]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [snlg_V1].[zsp_Makale_Kategorileri]
	@Dil smallint
AS
SET NOCOUNT ON;

DECLARE @DefaultLang smallint
SELECT TOP(1) @DefaultLang = Deger FROM snlg_V1.TblDegiskenler WHERE  Degisken = 'DefaultLang'

DECLARE @DefRsm varchar(500)
SELECT TOP(1) @DefRsm = ResimYol FROM TblVarsayilanResimler WHERE  ResimAnahtar = N'blogCtg';

WITH RekursifSorgu(KtgId)
AS
(
	SELECT KtgId FROM TblMakaleKtgApp
	WHERE   Aktif = 1 AND UstId IS NULL
		UNION ALL
	SELECT TMKA.KtgId FROM TblMakaleKtgApp TMKA JOIN RekursifSorgu 
	ON TMKA.UstId = RekursifSorgu.KtgId
	WHERE   Aktif = 1 
)
SELECT ISNULL(TMKD.KtgAd, (SELECT TOP 1 KtgAd FROM TblMakaleKtgDetay WHERE KtgId = TMKA.KtgId AND Dil = @DefaultLang)) AS KtgAd,
		ISNULL(TMKA.Resim, @DefRsm) AS Resim,
		TMKA.Sira, TMKD.SeoUrl, TMKA.UstId, RekursifSorgu.KtgId
FROM RekursifSorgu INNER JOIN 
		TblMakaleKtgApp AS TMKA ON TMKA.KtgId = RekursifSorgu.KtgId LEFT OUTER JOIN
		TblMakaleKtgDetay AS TMKD ON TMKA.KtgId = TMKD.KtgId AND TMKD.Dil = @Dil













GO
/****** Object:  StoredProcedure [snlg_V1].[zsp_Makale_KategoriListesi]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [snlg_V1].[zsp_Makale_KategoriListesi]
@Dil smallint, @MakId int
AS
BEGIN

Select MKD.KtgAd,MKD.SeoUrl from snlg_V1.TblMakale_Kategori AS MK INNER JOIN
 snlg_V1.TblMakaleKtgDetay AS MKD ON
 MK.KtgId=MKD.KtgId 
 INNER JOIN snlg_V1.TblMakaleKtgApp AS MKA ON
 MK.KtgId=MKA.KtgId 
 WHERE MK.MakId=@MakId AND MKD.Dil=@Dil


END











GO
/****** Object:  StoredProcedure [snlg_V1].[zsp_Makale_MakaleListesi]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [snlg_V1].[zsp_Makale_MakaleListesi]

	@Dil smallint,  @CurrentPage int, 
	@PageSize int, @KayitSayisi int OUTPUT
AS
SET NOCOUNT ON;

--SET LANGUAGE Turkish;

DECLARE @DefaultLang smallint
SELECT TOP(1) @DefaultLang = Deger FROM snlg_V1.TblDegiskenler WHERE  Degisken = 'DefaultLang'

DECLARE @DefRsm varchar(500)
SELECT TOP(1) @DefRsm = ResimYol FROM TblVarsayilanResimler WHERE  ResimAnahtar = N'blog'

IF (@KayitSayisi < 0)
	SELECT  @KayitSayisi = COUNT(TMA.MakId)
	FROM    TblMakale_Kategori AS TMK INNER JOIN
			  TblMakaleApp AS TMA ON TMK.MakId = TMA.MakId 
	WHERE     (TMA.Gorunurluk <> 4)
	

BEGIN
	WITH TblSayfala AS
	(
		SELECT TOP(@PageSize*@CurrentPage) ROW_NUMBER() OVER(ORDER BY TMA.Sira asc, TMA.MakId asc) AS Sirala, TMA.MakId,TMA.Tarih
		FROM    TblMakale_Kategori AS TMK INNER JOIN
				  TblMakaleApp AS TMA ON TMK.MakId = TMA.MakId
		WHERE     (TMA.Gorunurluk <> 4)
		 ORDER BY TMA.MakId DESC
	)
	SELECT DISTINCT TMD.SeoUrl, TMA.MakId,
	
		(SELECT COUNT(YId) FROM TblMakaleYorum WHERE (MakId = TMA.MakId ) AND (Onay = 1)) AS YorumSay,
		(SELECT AVG(Puan) FROM TblMakalePuan WHERE (MakId = TMA.MakId )) AS Puan,
		TMA.Tarih AS Tarih,
		(Select UserName FROM snlg_V1.TblUyeApp AS TBUye WHERE TBUye.UyeId=TMA.YazarId) AS Yazar,

		ISNULL(TMA.Resim, @DefRsm) AS Resim,
		ISNULL(TMD.Baslik, (SELECT TOP 1 Baslik FROM TblMakaleDetay WHERE MakId = TMA.MakId AND Dil = @DefaultLang)) AS Baslik,
		ISNULL(TMD.Bilgi, (SELECT TOP 1 Bilgi FROM TblMakaleDetay WHERE MakId = TMA.MakId AND Dil = @DefaultLang)) AS Bilgi
	FROM TblSayfala INNER JOIN
			TblMakaleApp AS TMA ON TblSayfala.MakId = TMA.MakId LEFT OUTER JOIN
			TblMakaleDetay AS TMD ON TMA.MakId = TMD.MakId AND TMD.Dil = @Dil  
	WHERE TblSayfala.Sirala BETWEEN ((@CurrentPage - 1) * @PageSize) + 1 AND @CurrentPage * @PageSize
	ORDER BY TMA.MakId DESC
END




GO
/****** Object:  StoredProcedure [snlg_V1].[zsp_Makale_PuanEkle]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [snlg_V1].[zsp_Makale_PuanEkle]
	@MakId int, @UyeId int, @IP varchar(15), @Puan tinyint
AS
SET NOCOUNT ON;

IF(@UyeId IS NOT NULL)
 BEGIN--ÜYE İSE ÜYE ID İLE KAYDET
	UPDATE TblMakalePuan SET Puan = @Puan 
	WHERE (MakId = @MakId) AND (UyeId = @UyeId)
	IF(@@ROWCOUNT < 1)
		INSERT INTO TblMakalePuan (MakId, UyeId, Puan)
		VALUES     (@MakId,@UyeId,@Puan)	
 END
ELSE
 BEGIN--ÜYE DEĞİLSE IP İLE KAYDET
	UPDATE TblMakalePuan SET Puan = @Puan 
	WHERE (MakId = @MakId) AND (IP = @IP)
	IF(@@ROWCOUNT < 1)
		INSERT INTO TblMakalePuan (MakId, IP, Puan)
		VALUES     (@MakId,@IP,@Puan)	
 END




































GO
/****** Object:  StoredProcedure [snlg_V1].[zsp_Makale_Rasgele]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [snlg_V1].[zsp_Makale_Rasgele]
	@Dil smallint, @Adet tinyint
AS
SET NOCOUNT ON;

DECLARE @DefaultLang smallint
SELECT TOP(1) @DefaultLang = Deger FROM snlg_V1.TblDegiskenler WHERE  Degisken = 'DefaultLang'

DECLARE @DefRsm varchar(500)
SELECT TOP(1) @DefRsm = ResimYol FROM TblVarsayilanResimler WHERE  ResimAnahtar = N'blog'

SELECT	TOP(@Adet) ISNULL(TMD.Baslik, (SELECT TOP 1 Baslik FROM TblMakaleDetay WHERE (MakId = TMA.MakId) AND (Dil = @DefaultLang))) AS Baslik,
			ISNULL(TMA.Resim, @DefRsm) AS Resim,
			TMD.SeoUrl
FROM	TblMakaleApp AS TMA LEFT OUTER JOIN
			TblMakaleDetay AS TMD ON TMA.MakId = TMD.MakId AND TMD.Dil = @Dil
WHERE     (TMA.Gorunurluk <> 4)
ORDER BY NEWID()



GO
/****** Object:  StoredProcedure [snlg_V1].[zsp_Makale_TagMakaleListesi]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [snlg_V1].[zsp_Makale_TagMakaleListesi]
@Dil smallint, 
@TagValues NVARCHAR(250), 
@CurrentPage int, 
@PageSize int, 
@KayitSayisi int OUTPUT
AS
SET NOCOUNT ON;

DECLARE @DefaultLang smallint
SELECT TOP(1) @DefaultLang = Deger FROM snlg_V1.TblDegiskenler WHERE  Degisken = 'DefaultLang'

DECLARE @DefRsm varchar(500)
SELECT TOP(1) @DefRsm = ResimYol FROM TblVarsayilanResimler WHERE  ResimAnahtar = N'blog'

IF (@KayitSayisi < 0)
	SELECT  @KayitSayisi = COUNT(TMA.MakId)
	FROM    TblMakale_Kategori AS TMK INNER JOIN
			  TblMakaleApp AS TMA ON TMK.MakId = TMA.MakId INNER JOIN
				  TblMakaleDetay AS TBMD ON TMA.MakId=TBMD.MakId
 		WHERE     (TMA.Gorunurluk <> 4) AND ('-' + snlg_V1.fun_UrlEncode(TBMD.Keyword) + '-') LIKE ('%-' + @TagValues + '-%')
BEGIN
	WITH TblSayfala AS
	(
		SELECT TOP(@PageSize*@CurrentPage) ROW_NUMBER() OVER(ORDER BY TMA.Sira DESC, TMA.MakId DESC) AS Sirala, TMA.MakId
		FROM    TblMakale_Kategori AS TMK INNER JOIN
				  TblMakaleApp AS TMA ON TMK.MakId = TMA.MakId INNER JOIN
				  TblMakaleDetay AS TBMD ON TMA.MakId=TBMD.MakId
 		WHERE     (TMA.Gorunurluk <> 4) AND ('-' + snlg_V1.fun_UrlEncode(TBMD.Keyword) + '-') LIKE ('%-' + @TagValues + '-%')
		 ORDER BY TMA.MakId DESC
	)
	SELECT DISTINCT TMD.SeoUrl, TMA.MakId,TMA.Tarih,
		(Select UserName FROM snlg_V1.TblUyeApp AS TBUye WHERE TBUye.UyeId=TMA.YazarId) AS Yazar,
		(SELECT COUNT(YId) FROM TblMakaleYorum WHERE (MakId = TMA.MakId ) AND (Onay = 1)) AS YorumSay,
		(SELECT AVG(Puan) FROM TblMakalePuan WHERE (MakId = TMA.MakId )) AS Puan,
		
		ISNULL(TMA.Resim, @DefRsm) AS Resim,
		ISNULL(TMD.Baslik, (SELECT TOP 1 Baslik FROM TblMakaleDetay WHERE MakId = TMA.MakId AND Dil = @DefaultLang)) AS Baslik,
		ISNULL(TMD.Bilgi, (SELECT TOP 1 Bilgi FROM TblMakaleDetay WHERE MakId = TMA.MakId AND Dil = @DefaultLang)) AS Bilgi
	FROM TblSayfala INNER JOIN
			TblMakaleApp AS TMA ON TblSayfala.MakId = TMA.MakId LEFT OUTER JOIN
			TblMakaleDetay AS TMD ON TMA.MakId = TMD.MakId AND TMD.Dil = @Dil
	WHERE TblSayfala.Sirala BETWEEN ((@CurrentPage - 1) * @PageSize) + 1 AND @CurrentPage * @PageSize
	 ORDER BY TMA.MakId DESC
END







GO
/****** Object:  StoredProcedure [snlg_V1].[zsp_Makale_YazarDetay]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [snlg_V1].[zsp_Makale_YazarDetay]
	@UyeId int, @Dil smallint
AS
SET NOCOUNT ON;

DECLARE @DefaultLang smallint
SELECT TOP(1) @DefaultLang = Deger FROM snlg_V1.TblDegiskenler WHERE  Degisken = 'DefaultLang'

DECLARE @DefRsm varchar(500)
SELECT TOP(1) @DefRsm = ResimYol FROM TblVarsayilanResimler WHERE  ResimAnahtar = N'user'

SELECT TUD.UyeAd,
		ISNULL(TUDD.UyeBilgi, (SELECT TOP 1 UyeBilgi FROM TblUyeDetay WHERE UyeId = TUA.UyeId AND Dil = @DefaultLang)) AS UyeBilgi,
		ISNULL(TUD.Resim, @DefRsm) AS Resim
FROM       TblUyeApp AS TUA LEFT OUTER JOIN
                TblUyeDetay AS TUD ON TUA.UyeId = TUD.UyeId LEFT OUTER JOIN
                TblUyeDetayDil AS TUDD ON TUA.UyeId = TUDD.UyeId AND TUDD.Dil = @Dil
WHERE        (TUA.UyeId = @UyeId) 




































GO
/****** Object:  StoredProcedure [snlg_V1].[zsp_Makale_Yazarlar]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [snlg_V1].[zsp_Makale_Yazarlar]
	@Dil smallint, @Adet tinyint, @SorguTip tinyint
AS
SET NOCOUNT ON;


DECLARE @DefRsm varchar(500)
SELECT TOP(1) @DefRsm = ResimYol FROM TblVarsayilanResimler WHERE  ResimAnahtar = N'user'

IF(@SorguTip = 1)--tüm yazarlar
	SELECT TblUyeApp.SeoUrl, TblUyeDetay.UyeAd,TblUyeDetayDil.UyeBilgi,
			ISNULL(TblUyeDetay.Resim, @DefRsm) AS Resim,
			(SELECT TOP(1) MakID FROM TblMakaleApp WHERE YazarID = TblUyeApp.UyeId ORDER BY MakID DESC) AS SonMakaleID
	FROM   TblUyeApp LEFT OUTER JOIN
				TblUyeDetay ON TblUyeApp.UyeId = TblUyeDetay.UyeId LEFT OUTER JOIN
				TblUyeDetayDil ON TblUyeApp.UyeId = TblUyeDetayDil.UyeId  AND (TblUyeDetayDil.Dil = @Dil)
	WHERE     TblUyeApp.Aktif = 1 AND EXISTS(SELECT * FROM TblMakaleApp WHERE YazarID = TblUyeApp.UyeId)
ELSE--rasgele x yazar
	SELECT TOP(@Adet) TblUyeApp.SeoUrl, TblUyeDetay.UyeAd,
			ISNULL(TblUyeDetay.Resim, @DefRsm) AS Resim,
			(SELECT TOP(1) MakID FROM TblMakaleApp WHERE YazarID = TblUyeApp.UyeId ORDER BY MakID DESC) AS SonMakaleID
	FROM   TblUyeApp LEFT OUTER JOIN
				TblUyeDetay ON TblUyeApp.UyeId = TblUyeDetay.UyeId LEFT OUTER JOIN
				TblUyeDetayDil ON TblUyeApp.UyeId = TblUyeDetayDil.UyeId  AND (TblUyeDetayDil.Dil = @Dil)
	WHERE     TblUyeApp.Aktif = 1 AND EXISTS(SELECT * FROM TblMakaleApp WHERE YazarID = TblUyeApp.UyeId)
	ORDER BY NEWID()




GO
/****** Object:  StoredProcedure [snlg_V1].[zsp_makale_YazarMakaleler]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [snlg_V1].[zsp_makale_YazarMakaleler]
	@Dil smallint, @YazarId int, @CurrentPage int, 
	@PageSize int, @KayitSayisi int OUTPUT
AS
SET NOCOUNT ON;

DECLARE @DefaultLang smallint
SELECT TOP(1) @DefaultLang = Deger FROM snlg_V1.TblDegiskenler WHERE  Degisken = 'DefaultLang'

DECLARE @DefRsm varchar(500)
SELECT TOP(1) @DefRsm = ResimYol FROM TblVarsayilanResimler WHERE  ResimAnahtar = N'blog'

IF (@KayitSayisi < 0)
	SELECT  @KayitSayisi = COUNT(MakId)
	FROM    TblMakaleApp 
	WHERE   (Gorunurluk <> 4) AND (YazarId = @YazarId)

BEGIN
	WITH TblSayfala AS
	(
		SELECT TOP(@PageSize*@CurrentPage) ROW_NUMBER() OVER(ORDER BY Sira DESC, MakId DESC) AS Sirala, MakId
		FROM    TblMakaleApp
		WHERE      (Gorunurluk <> 4) AND (YazarId = @YazarId)
	)
	SELECT TMD.SeoUrl,TMA.MakId,
		ISNULL(TMA.Resim, @DefRsm) AS Resim,
		ISNULL(TMD.Baslik, (SELECT TOP 1 Baslik FROM TblMakaleDetay WHERE MakId = TMA.MakId AND Dil = @DefaultLang)) AS Baslik,
		ISNULL(TMD.Bilgi, (SELECT TOP 1 Bilgi FROM TblMakaleDetay WHERE MakId = TMA.MakId AND Dil = @DefaultLang)) AS Bilgi,
		(SELECT COUNT(YId) FROM TblMakaleYorum WHERE (MakId = TMA.MakId ) AND (Onay = 1)) AS YorumSay,
		(SELECT AVG(Puan) FROM TblMakalePuan WHERE (MakId = TMA.MakId )) AS Puan
	FROM TblSayfala INNER JOIN
			TblMakaleApp AS TMA ON TblSayfala.MakId = TMA.MakId LEFT OUTER JOIN
			TblMakaleDetay AS TMD ON TMA.MakId = TMD.MakId AND TMD.Dil = @Dil
	WHERE TblSayfala.Sirala BETWEEN ((@CurrentPage - 1) * @PageSize) + 1 AND @CurrentPage * @PageSize AND (TMA.YazarId = @YazarId)
END



































GO
/****** Object:  StoredProcedure [snlg_V1].[zsp_Makale_YorumEkle]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [snlg_V1].[zsp_Makale_YorumEkle]
	@MakId int, @UstYId int, @EPosta varchar(150), @Yazan nvarchar(30), 
	@Yorum nvarchar(max), @IP varchar(15), @Puan tinyint,
	@UyeId int, @Onay bit
AS
SET NOCOUNT ON;

IF (@UyeId IS NULL)
 BEGIN
	IF(@Puan IS NOT NULL)
	 BEGIN
		UPDATE TblMakalePuan SET Puan = @Puan 
		WHERE (MakId = @MakId) AND (IP = @IP)
		IF(@@ROWCOUNT < 1)
			INSERT INTO TblMakalePuan (MakId, IP, Puan)
			VALUES     (@MakId,@IP,@Puan)	
	 END

	--YORUM EKLE
	INSERT INTO TblMakaleYorum (UstYId, MakId, Yazan, EPosta, Yorum, Onay,Tarih)
	VALUES     (@UstYId,@MakId,@Yazan, @EPosta,@Yorum,0,GETDATE())
 END
ELSE
 BEGIN
	IF(@Puan IS NOT NULL)
	 BEGIN
		UPDATE TblMakalePuan SET Puan = @Puan 
		WHERE (MakId = @MakId) AND (UyeId = @UyeId)
		IF(@@ROWCOUNT < 1)
			INSERT INTO TblMakalePuan (MakId, UyeId, Puan)
			VALUES     (@MakId,@UyeId,@Puan)	
	 END

	--YORUM EKLE
	INSERT INTO TblMakaleYorum (UstYId, MakId, Yorum, Onay, UyeId,Tarih)
	VALUES     (@UstYId,@MakId,@Yorum, 0, @UyeId,GETDATE())
 END

--SELECT     TOP (1) TES.Kime, TES.Kimden, TES.KimdenIsim, TES.Mesaj, TES.Konu, TES.SmtpHost, TES.SmtpPsw, TES.SmtpPort, TES.SSL_
--FROM         TblEPostaSablon AS TES
--WHERE     (TES.Anahtar = N'makaleYorum_Admine')

































GO
/****** Object:  StoredProcedure [snlg_V1].[zsp_Makale_Yorumlar]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [snlg_V1].[zsp_Makale_Yorumlar]
	@MakId int, @CurrentPage int, 
	@PageSize int
AS
SET NOCOUNT ON;

DECLARE @DefRsm varchar(500)
SELECT TOP(1) @DefRsm = ResimYol FROM TblVarsayilanResimler WHERE  ResimAnahtar = N'user';

--KAYIT VARSA
WITH TblSayfala AS
(
	SELECT TOP(@PageSize*@CurrentPage) ROW_NUMBER() OVER(ORDER BY YId DESC) AS Sirala, YId, UstYId
	FROM TblMakaleYorum
	WHERE  (MakId = @MakId) AND Onay = 1 AND UstYId IS NULL
),
RekursifSorgu(YId, UstYId) AS
(
	SELECT 	YId, UstYId FROM TblSayfala 
	WHERE Sirala BETWEEN ((@CurrentPage - 1) * @PageSize) + 1 AND @CurrentPage * @PageSize
		UNION ALL
	SELECT TMY.YId, TMY.UstYId
	FROM TblMakaleYorum AS TMY INNER JOIN 
			RekursifSorgu ON TMY.UstYId = RekursifSorgu.YId
	WHERE  (TMY.MakId = @MakId) AND Onay = 1 
)
SELECT TMY.YId, TMY.UstYId, ISNULL(TUA.UserName,TMY.Yazan) AS Yazan, TMY.Yorum,TMY.Tarih,
		ISNULL(TUD.Resim, @DefRsm) AS Resim
FROM TblMakaleYorum AS TMY INNER JOIN
		RekursifSorgu ON TMY.YId = RekursifSorgu.YId LEFT OUTER JOIN
		TblUyeApp AS TUA ON TUA.UyeId = TMY.UyeId LEFT OUTER JOIN
		TblUyeDetay AS TUd ON TUA.UyeId = TUD.UyeId





































GO
/****** Object:  StoredProcedure [snlg_V1].[zsp_makale_YorumSay]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [snlg_V1].[zsp_makale_YorumSay]
	@MakId int
AS
SET NOCOUNT ON;

SELECT  COUNT(YId)
FROM    TblMakaleYorum INNER JOIN 
			TblMakaleApp ON TblMakaleApp.MakId = TblMakaleYorum.MakId
WHERE  TblMakaleApp.MakId = @MakId AND (Onay = 1) 
--AND UstYId IS NULL



































GO
/****** Object:  StoredProcedure [snlg_V1].[zsp_MakaleTaglari_EnCokPuanlanan]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [snlg_V1].[zsp_MakaleTaglari_EnCokPuanlanan]
	@Dil smallint, @Adet tinyint
AS
SET NOCOUNT ON;

	DECLARE @DefaultLang smallint
	SELECT TOP(1) @DefaultLang = Deger FROM snlg_V1.TblDegiskenler WHERE  Degisken = 'DefaultLang'

	SELECT TOP (@Adet) ISNULL(TMD.Keyword, (SELECT TOP 1 Keyword FROM TblMakaleDetay WHERE (MakId = TMA.MakId) AND (Dil = @DefaultLang))) + ',' AS 'data()'
	FROM         TblMakaleApp AS TMA LEFT OUTER JOIN
				  TblMakalePuan AS TMDY ON TMA.MakId = TMDY.MakId LEFT OUTER JOIN
				  TblMakaleDetay AS TMD ON TMA.MakId = TMD.MakId AND TMD.Dil = @Dil
	WHERE     (TMA.Gorunurluk <> 4) 
	GROUP BY Keyword, TMA.MakId
	ORDER BY SUM(TMDY.Puan), COUNT(TMD.MakId) DESC
	FOR XML PATH('')




GO
/****** Object:  StoredProcedure [snlg_V1].[zsp_Menuler]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [snlg_V1].[zsp_Menuler] 
	@Dil smallint, @UCID int
AS
SET NOCOUNT ON;

DECLARE @DefaultLang smallint
SELECT TOP(1) @DefaultLang = Deger FROM snlg_V1.TblDegiskenler WHERE  Degisken = 'DefaultLang';

WITH RekursifSorgu(MenuId)
AS
(
	SELECT MenuId FROM TblMenuApp
	WHERE   Aktif = 1 AND UstId IS NULL
		UNION ALL
	SELECT TMA.MenuId FROM TblMenuApp TMA JOIN RekursifSorgu 
	ON TMA.UstId = RekursifSorgu.MenuId
	WHERE   Aktif = 1 
)
SELECT TMA.Sira, TMA.UstId, TMA.Hedef, RekursifSorgu.MenuId,TMA.Resim,
		ISNULL(TMD.MenuItem, (SELECT TOP 1 MenuItem FROM TblMenuDetay WHERE MenuId = TMA.MenuId AND Dil = @DefaultLang)) AS MenuItem,
		ISNULL(TMD.MenuLink, (SELECT TOP 1 MenuLink FROM TblMenuDetay WHERE MenuId = TMA.MenuId AND Dil = @DefaultLang)) AS MenuLink
FROM RekursifSorgu INNER JOIN 
		TblMenuApp AS TMA ON TMA.MenuId = RekursifSorgu.MenuId LEFT OUTER JOIN
		TblMenuDetay AS TMD ON TMA.MenuId = TMD.MenuId AND TMD.Dil = @Dil
WHERE TMA.UCID = @UCID




GO
/****** Object:  StoredProcedure [snlg_V1].[zsp_Proje_EnSonEklenen]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [snlg_V1].[zsp_Proje_EnSonEklenen]
	@Dil smallint, @Adet tinyint
AS
SET NOCOUNT ON;

DECLARE @DefaultLang smallint
SELECT TOP(1) @DefaultLang = Deger FROM snlg_V1.TblDegiskenler WHERE  Degisken = 'DefaultLang'

DECLARE @DefRsm varchar(500)
SELECT TOP(1) @DefRsm = ResimYol FROM TblVarsayilanResimler WHERE  ResimAnahtar = N'project'

SELECT TOP(@Adet) TPA.ProjeUrl,
	ISNULL(TPA.Resim, @DefRsm) AS Resim,
	ISNULL(TPD.Baslik, (SELECT TOP 1 Baslik FROM TblProjeDetay WHERE ProjeId = TPA.ProjeId AND Dil = @DefaultLang)) AS Baslik
FROM TblProjeApp AS TPA LEFT OUTER JOIN
		TblProjeDetay AS TPD ON TPA.ProjeId = TPD.ProjeId AND TPD.Dil = @Dil
WHERE TPA.Aktif=1
ORDER BY TPA.Sira ASC






GO
/****** Object:  StoredProcedure [snlg_V1].[zsp_Proje_KategoriBilgileri]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [snlg_V1].[zsp_Proje_KategoriBilgileri]
	@Dil smallint, @KtgId int
AS
SET NOCOUNT ON;

DECLARE @DefaultLang smallint
SELECT TOP(1) @DefaultLang = Deger FROM snlg_V1.TblDegiskenler WHERE  Degisken = 'DefaultLang'

DECLARE @DefRsm varchar(500)
SELECT TOP(1) @DefRsm = ResimYol FROM TblVarsayilanResimler WHERE  ResimAnahtar = N'projectCtg'

SELECT ISNULL(TPKD.KtgAd, (SELECT TOP 1 KtgAd FROM TblProjeKtgDetay WHERE KtgId = TPKA.KtgId AND Dil = @DefaultLang)) AS KtgAd,
		ISNULL(TPKD.Keyword, (SELECT TOP 1 Keyword FROM TblProjeKtgDetay WHERE KtgId = TPKA.KtgId AND Dil = @DefaultLang)) AS Keyword,
		ISNULL(TPKD.Descr, (SELECT TOP 1 Descr FROM TblProjeKtgDetay WHERE KtgId = TPKA.KtgId AND Dil = @DefaultLang)) AS Descr,
		ISNULL(TPKA.Resim, @DefRsm) AS Resim
FROM TblProjeKtgApp AS TPKA LEFT OUTER JOIN
		TblProjeKtgDetay AS TPKD ON TPKA.KtgId = TPKD.KtgId AND TPKD.Dil = @Dil
WHERE  TPKA.KtgId = @KtgId AND TPKA. Aktif = 1 













































GO
/****** Object:  StoredProcedure [snlg_V1].[zsp_Proje_KategoridekiProjeler]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [snlg_V1].[zsp_Proje_KategoridekiProjeler]
	@Dil smallint, @KtgId int, @CurrentPage int, 
	@PageSize int, @KayitSayisi int OUTPUT
AS
SET NOCOUNT ON;

DECLARE @DefaultLang smallint
SELECT TOP(1) @DefaultLang = Deger FROM snlg_V1.TblDegiskenler WHERE  Degisken = 'DefaultLang'

DECLARE @DefRsm varchar(500)
SELECT TOP(1) @DefRsm = ResimYol FROM TblVarsayilanResimler WHERE  ResimAnahtar = N'project'

IF(@KtgId IS NULL)
 BEGIN
	IF (@KayitSayisi < 0)
		SELECT  @KayitSayisi = COUNT(ProjeId)
		FROM    TblProjeApp
		WHERE      (Aktif = 1)

	BEGIN
		WITH TblSayfala AS
		(
			SELECT TOP(@PageSize*@CurrentPage) ROW_NUMBER() OVER(ORDER BY (255-Sira) DESC, ProjeId DESC) AS Sirala, ProjeId
			FROM    TblProjeApp 
			WHERE      (Aktif = 1)
		)
		SELECT TPA.ProjeUrl,
			ISNULL(TPA.Resim, @DefRsm) AS Resim,
			ISNULL(TPD.Baslik, (SELECT TOP 1 Baslik FROM TblProjeDetay WHERE ProjeId = TPA.ProjeId AND Dil = @DefaultLang)) AS Baslik,
			ISNULL(TPD.Bilgi, (SELECT TOP 1 Bilgi FROM TblProjeDetay WHERE ProjeId = TPA.ProjeId AND Dil = @DefaultLang)) AS Bilgi
		FROM TblSayfala INNER JOIN
				TblProjeApp AS TPA ON TblSayfala.ProjeId = TPA.ProjeId LEFT OUTER JOIN
				TblProjeDetay AS TPD ON TPA.ProjeId = TPD.ProjeId AND TPD.Dil = @Dil
		WHERE TblSayfala.Sirala BETWEEN ((@CurrentPage - 1) * @PageSize) + 1 AND @CurrentPage * @PageSize
		ORDER  BY TPA.Sira DESC
	END
 END
ELSE
 BEGIN
	IF (@KayitSayisi < 0)
		SELECT  @KayitSayisi = COUNT(TPA.ProjeId)
		FROM    TblProje_Kategori AS TMK INNER JOIN
				  TblProjeApp AS TPA ON TMK.ProjeId = TPA.ProjeId 
		WHERE     (TPA.Aktif = 1) AND (TMK.KtgId = @KtgId)

	BEGIN
		WITH TblSayfala AS
		(
			SELECT TOP(@PageSize*@CurrentPage) ROW_NUMBER() OVER(ORDER BY (255-TPA.Sira) DESC, TPA.ProjeId DESC) AS Sirala, TPA.ProjeId
			FROM    TblProje_Kategori AS TMK INNER JOIN
					  TblProjeApp AS TPA ON TMK.ProjeId = TPA.ProjeId
			WHERE     (TPA.Aktif = 1) AND (TMK.KtgId = @KtgId)
		)
		SELECT TPA.ProjeUrl,
			ISNULL(TPA.Resim, @DefRsm) AS Resim,
			ISNULL(TPD.Baslik, (SELECT TOP 1 Baslik FROM TblProjeDetay WHERE ProjeId = TPA.ProjeId AND Dil = @DefaultLang)) AS Baslik,
			ISNULL(TPD.Bilgi, (SELECT TOP 1 Bilgi FROM TblProjeDetay WHERE ProjeId = TPA.ProjeId AND Dil = @DefaultLang)) AS Bilgi
		FROM TblSayfala INNER JOIN
				TblProjeApp AS TPA ON TblSayfala.ProjeId = TPA.ProjeId LEFT OUTER JOIN
				TblProjeDetay AS TPD ON TPA.ProjeId = TPD.ProjeId AND TPD.Dil = @Dil
		WHERE TblSayfala.Sirala BETWEEN ((@CurrentPage - 1) * @PageSize) + 1 AND @CurrentPage * @PageSize
		ORDER  BY TPA.Sira DESC
	END
 END



GO
/****** Object:  StoredProcedure [snlg_V1].[zsp_Proje_KategoriDetay]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [snlg_V1].[zsp_Proje_KategoriDetay]
	@KtgId int, @Dil smallint
AS
SET NOCOUNT ON;

DECLARE @DefaultLang smallint
SELECT TOP(1) @DefaultLang = Deger FROM snlg_V1.TblDegiskenler WHERE  Degisken = 'DefaultLang'

DECLARE @DefRsm varchar(500)
SELECT TOP(1) @DefRsm = ResimYol FROM TblVarsayilanResimler WHERE  ResimAnahtar = N'project'

SELECT	ISNULL(TblProjeKtgDetay.KtgAd,(SELECT TOP(1) KtgAd FROM TblProjeKtgDetay WHERE KtgId = @KtgId AND (Dil = @DefaultLang))) AS KtgAd,
			ISNULL(TblProjeKtgDetay.Descr,(SELECT TOP(1) Descr FROM TblProjeKtgDetay WHERE KtgId = @KtgId AND (Dil = @DefaultLang))) AS Descr,
			ISNULL(TblProjeKtgDetay.Keyword,(SELECT TOP(1) Keyword FROM TblProjeKtgDetay WHERE KtgId = @KtgId AND (Dil = @DefaultLang))) AS Keyword,
			ISNULL(TblProjeKtgApp.Resim, @DefRsm) AS Resim
FROM	TblProjeKtgApp LEFT OUTER JOIN
		TblProjeKtgDetay ON TblProjeKtgApp.KtgId = TblProjeKtgDetay.KtgId AND TblProjeKtgDetay.Dil = @Dil
WHERE	(TblProjeKtgApp.KtgId = @KtgId)







































GO
/****** Object:  StoredProcedure [snlg_V1].[zsp_Proje_Kategorileri]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [snlg_V1].[zsp_Proje_Kategorileri]
	@Dil smallint
AS
SET NOCOUNT ON;

DECLARE @DefaultLang smallint
SELECT TOP(1) @DefaultLang = Deger FROM snlg_V1.TblDegiskenler WHERE  Degisken = 'DefaultLang'

DECLARE @DefRsm varchar(500)
SELECT TOP(1) @DefRsm = ResimYol FROM TblVarsayilanResimler WHERE  ResimAnahtar = N'projectCtg';

WITH RekursifSorgu(KtgId)
AS
(
	SELECT KtgId FROM TblProjeKtgApp
	WHERE   Aktif = 1 AND UstId IS NULL
		UNION ALL
	SELECT TPKA.KtgId FROM TblProjeKtgApp TPKA JOIN RekursifSorgu 
	ON TPKA.UstId = RekursifSorgu.KtgId
	WHERE   Aktif = 1 
)
SELECT ISNULL(TPKD.KtgAd, (SELECT TOP 1 KtgAd FROM TblProjeKtgDetay WHERE KtgId = TPKA.KtgId AND Dil = @DefaultLang)) AS KtgAd,
		ISNULL(TPKD.SeoUrl, (SELECT TOP 1 SeoUrl FROM TblProjeKtgDetay WHERE KtgId = TPKA.KtgId AND Dil = @DefaultLang)) AS SeoUrl,
		ISNULL(TPKA.Resim, @DefRsm) AS Resim,
		ISNULL(TPKA.Sira,200), TPKA.UstId, RekursifSorgu.KtgId
FROM RekursifSorgu INNER JOIN 
		TblProjeKtgApp AS TPKA ON TPKA.KtgId = RekursifSorgu.KtgId LEFT OUTER JOIN
		TblProjeKtgDetay AS TPKD ON TPKA.KtgId = TPKD.KtgId AND TPKD.Dil = @Dil












































GO
/****** Object:  StoredProcedure [snlg_V1].[zsp_Proje_KategorileriBlok]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [snlg_V1].[zsp_Proje_KategorileriBlok]
	@Dil int
AS
SET NOCOUNT ON;

DECLARE @DefaultLang smallint
SELECT TOP(1) @DefaultLang = Deger FROM snlg_V1.TblDegiskenler WHERE  Degisken = 'DefaultLang';


WITH RekursifSorgu(KtgId)
AS
(
	SELECT KtgId FROM TblProjeKtgApp
	WHERE   Aktif = 1 AND UstId IS NULL
		UNION ALL
	SELECT TPKA.KtgId FROM TblProjeKtgApp TPKA JOIN RekursifSorgu 
	ON TPKA.UstId = RekursifSorgu.KtgId
	WHERE   Aktif = 1 
)
SELECT ISNULL(TPKD.KtgAd, (SELECT TOP 1 KtgAd FROM TblProjeKtgDetay WHERE KtgId = TPKA.KtgId AND Dil = @DefaultLang)) AS KtgAd,
		ISNULL(TPKD.SeoUrl, (SELECT TOP 1 SeoUrl FROM TblProjeKtgDetay WHERE KtgId = TPKA.KtgId AND Dil = @DefaultLang)) AS SeoUrl,
		ISNULL(TPKA.Sira,200) AS Sira, TPKA.UstId, RekursifSorgu.KtgId AS ID, TPKA.Resim, 1 AS sorguNo
FROM RekursifSorgu INNER JOIN 
		TblProjeKtgApp AS TPKA ON TPKA.KtgId = RekursifSorgu.KtgId LEFT OUTER JOIN
		TblProjeKtgDetay AS TPKD ON TPKA.KtgId = TPKD.KtgId AND TPKD.Dil = @Dil
UNION ALL
SELECT ISNULL(TPD.Baslik, (SELECT TOP 1 Baslik FROM TblProjeDetay WHERE ProjeId = TPA.ProjeId AND Dil = @DefaultLang)) AS Baslik,
		TPA.ProjeUrl AS SeoUrl, ISNULL(TPA.Sira,200) AS Sira, TPK.KtgId AS UstId, TPA.ProjeId AS ID, TPA.Resim, 2 AS sorguNo
FROM TblProje_Kategori AS TPK INNER JOIN
		TblProjeApp AS TPA ON TPK.ProjeId = TPA.ProjeId LEFT OUTER JOIN
		TblProjeDetay AS TPD ON TPA.ProjeId = TPD.ProjeId AND TPD.Dil = @Dil
WHERE (TPA.Aktif = 1)
UNION ALL
SELECT ISNULL(TPAD.Baslik, (SELECT TOP 1 Baslik FROM TblProjeAltBilgiDetay WHERE ProjeId = TPAA.ProjeId AND Dil = @DefaultLang)) AS Baslik,
		TPAD.SeoUrl AS SeoUrl, ISNULL(TPAA.Sira,200) AS Sira, TPAA.ProjeId AS UstId, TPAA.ProjeAltId AS ID, NULL AS Resim, 3 AS sorguNo
FROM TblProjeAltBilgiApp AS TPAA LEFT OUTER JOIN
		TblProjeAltBilgiDetay AS TPAD ON TPAD.ProjeAltId = TPAA.ProjeAltId AND TPAD.Dil = @Dil
WHERE (TPAA.Gorunurluk <> 4)








GO
/****** Object:  StoredProcedure [snlg_V1].[zsp_ProjeAltBilgi_Icerik]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [snlg_V1].[zsp_ProjeAltBilgi_Icerik]
	@Dil smallint, @ProjeAltId int
AS
SET NOCOUNT ON;

DECLARE @DefaultLang smallint
SELECT TOP(1) @DefaultLang = Deger FROM snlg_V1.TblDegiskenler WHERE  Degisken = 'DefaultLang'

SELECT ISNULL(TPD.Baslik, (SELECT TOP 1 Baslik FROM TblProjeAltBilgiDetay WHERE ProjeAltId = TPA.ProjeAltId AND Dil = @DefaultLang)) AS Baslik,
		ISNULL(TPD.Keyword, (SELECT TOP 1 Keyword FROM TblProjeAltBilgiDetay WHERE ProjeAltId = TPA.ProjeAltId AND Dil = @DefaultLang)) AS Keyword,
		ISNULL(TPD.Icerik, (SELECT TOP 1 Icerik FROM TblProjeAltBilgiDetay WHERE ProjeAltId = TPA.ProjeAltId AND Dil = @DefaultLang)) AS Icerik,
		ISNULL(TPD.Descr, (SELECT TOP 1 Descr FROM TblProjeAltBilgiDetay WHERE ProjeAltId = TPA.ProjeAltId AND Dil = @DefaultLang)) AS Descr,
		ISNULL(PD.Baslik, (SELECT TOP 1 Baslik FROM TblProjeDetay WHERE ProjeId = TPA.ProjeId AND Dil = @DefaultLang)) AS ProjeAdi,
		TPA.AramaIndex
FROM TblProjeAltBilgiApp AS TPA LEFT OUTER JOIN
		TblProjeAltBilgiDetay AS TPD ON TPA.ProjeAltId = TPD.ProjeAltId AND TPD.Dil = @Dil LEFT OUTER JOIN
		TblProjeDetay AS PD ON PD.ProjeId = TPA.ProjeId AND TPD.Dil = @Dil 
WHERE  TPA.ProjeAltId = @ProjeAltId AND TPA.Gorunurluk <> 4



































GO
/****** Object:  StoredProcedure [snlg_V1].[zsp_QueryStringAnnounce]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [snlg_V1].[zsp_QueryStringAnnounce]
	@Url varchar(500)
AS
SET NOCOUNT ON;

DECLARE @SablonQS varchar(500), @IcerikQS varchar(500)


	SELECT  TOP(1) @IcerikQS = 'dyrid=' + CAST(Tbl1.DuyuruId AS VARCHAR),
			@SablonQS = 'sablon=' + CAST(TSM.SablonId AS VARCHAR) +
			'&gorunurluk=' + CAST(Tbl1.Gorunurluk AS VARCHAR)
	FROM TblDuyuruApp AS Tbl1 INNER JOIN
			TblDuyuruDetay AS Tbl2 ON Tbl1.DuyuruID = Tbl2.DuyuruID INNER JOIN 
			TblDesignSablonlar AS TDS ON 1=1 INNER JOIN
			TblSablon_Modul AS TSM ON TDS.SablonId = TSM.SablonId
	WHERE (Tbl2.SeoUrl = @Url) AND (Tbl1.Gorunurluk <> 4) AND TSM.SablonAnahtar = 'announce'

	IF (@IcerikQS IS NOT NULL)
		SELECT @IcerikQS + '&' + @SablonQS












GO
/****** Object:  StoredProcedure [snlg_V1].[zsp_QueryStringBlog]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [snlg_V1].[zsp_QueryStringBlog]
	@Url varchar(500)
AS
SET NOCOUNT ON;

DECLARE @SablonQS varchar(500), @IcerikQS varchar(500)


	SELECT  TOP(1) @IcerikQS = 'mktg=' + CAST(Tbl1.KtgId AS VARCHAR),
			@SablonQS = 'sablon=' + CAST(TSM.SablonId AS VARCHAR) +
			'&gorunurluk=1'
	FROM TblMakaleKtgApp AS Tbl1 INNER JOIN 
			TblMakaleKtgDetay AS Tbl2 ON Tbl1.KtgID = Tbl2.KtgID INNER JOIN
			TblDesignSablonlar AS TDS ON 1=1 INNER JOIN
			TblSablon_Modul AS TSM ON TDS.SablonId = TSM.SablonId
	WHERE (Tbl2.SeoUrl = @Url) AND (Tbl1.Aktif = 1) AND TSM.SablonAnahtar = 'blogCtg'

	IF (@IcerikQS IS NULL)
		SELECT  TOP(1) @IcerikQS = 'makid=' + CAST(Tbl1.MakId AS VARCHAR),
				@SablonQS = 'sablon=' + CAST(TSM.SablonId AS VARCHAR) +
				'&gorunurluk=' + CAST(Tbl1.Gorunurluk AS VARCHAR)
		FROM TblMakaleApp AS Tbl1 INNER JOIN 
				TblMakaleDetay AS Tbl2 ON Tbl1.MakID = Tbl2.MakID INNER JOIN
				TblDesignSablonlar AS TDS ON 1=1 INNER JOIN
				TblSablon_Modul AS TSM ON TDS.SablonId = TSM.SablonId
		WHERE (Tbl2.SeoUrl = @Url) AND (Tbl1.Gorunurluk <> 4) AND TSM.SablonAnahtar = 'blog'

	IF (@IcerikQS IS NULL)
	 BEGIN
		IF(ISNUMERIC(REPLACE(@Url,'-','')) = 1)
			SELECT  TOP(1) @IcerikQS = 'mak_arsiv_yil=' + substring(@Url,1,4) + '&mak_arsiv_ay=' + substring(@Url,6,2), 
					@SablonQS = 'sablon=' + CAST(TSM.SablonId AS VARCHAR) +
					'&gorunurluk=' + CAST(Tbl1.Gorunurluk AS VARCHAR)
			FROM TblMakaleApp AS Tbl1 INNER JOIN 
					TblDesignSablonlar AS TDS ON 1=1 INNER JOIN
					TblSablon_Modul AS TSM ON TDS.SablonId = TSM.SablonId
			WHERE (Tbl1.Gorunurluk <> 4) AND TSM.SablonAnahtar = 'blogArshive'
	 END


	IF (@IcerikQS IS NOT NULL)
		SELECT @IcerikQS + '&' + @SablonQS



GO
/****** Object:  StoredProcedure [snlg_V1].[zsp_QueryStringBlogTag]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [snlg_V1].[zsp_QueryStringBlogTag]
	@Url varchar(500)
AS
SET NOCOUNT ON;

	DECLARE @SablonQS varchar(500), @IcerikQS varchar(500)


	SELECT  TOP(1) @IcerikQS = 'tagvalue=' + @Url, 
			@SablonQS = 'sablon=' + CAST(TSM.SablonId AS VARCHAR) +
			'&gorunurluk=' + CAST(Tbl1.Gorunurluk AS VARCHAR)
	FROM TblMakaleApp AS Tbl1 INNER JOIN 
			TblMakaleDetay AS Tbl2 ON Tbl1.MakID = Tbl2.MakID INNER JOIN
			TblDesignSablonlar AS TDS ON 1=1 INNER JOIN
			TblSablon_Modul AS TSM ON TDS.SablonId = TSM.SablonId
	WHERE ('-' + snlg_V1.fun_UrlEncode(Tbl2.Keyword) + '-') LIKE ('%-' + @Url + '-%') AND (Tbl1.Gorunurluk <> 4) AND TSM.SablonAnahtar = 'blogTag'


	IF (@IcerikQS IS NOT NULL)
		SELECT @IcerikQS + '&' + @SablonQS





GO
/****** Object:  StoredProcedure [snlg_V1].[zsp_QueryStringEditor]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [snlg_V1].[zsp_QueryStringEditor]
	@Url varchar(500)
AS
SET NOCOUNT ON;

DECLARE @SablonQS varchar(500), @IcerikQS varchar(500)

	SELECT  TOP(1) @IcerikQS = 'yazar=' + CAST(Tbl1.UyeId AS VARCHAR),
			@SablonQS = 'sablon=' + CAST(TSM.SablonId AS VARCHAR) +
			'&gorunurluk=1'
	FROM TblUyeApp AS Tbl1 INNER JOIN 
			TblDesignSablonlar AS TDS ON 1=1 INNER JOIN
			TblSablon_Modul AS TSM ON  TDS.SablonId = TSM.SablonId
	WHERE  (Tbl1.SeoUrl = @Url) AND (Tbl1.Aktif = 1) AND TSM.SablonAnahtar = 'editor'

IF (@IcerikQS IS NOT NULL)
	SELECT @IcerikQS + '&' + @SablonQS






























GO
/****** Object:  StoredProcedure [snlg_V1].[zsp_QueryStringNews]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [snlg_V1].[zsp_QueryStringNews]
	@Url varchar(500)
AS
SET NOCOUNT ON;

DECLARE @SablonQS varchar(500), @IcerikQS varchar(500)


	SELECT  TOP(1) @IcerikQS = 'hbrid=' + CAST(Tbl1.HaberId AS VARCHAR),
			@SablonQS = 'sablon=' + CAST(TSM.SablonId AS VARCHAR) +			'&gorunurluk=' + CAST(Tbl1.Gorunurluk AS VARCHAR)
	FROM TblHaberApp AS Tbl1 INNER JOIN 
			TblHaberDetay AS Tbl2 ON Tbl1.HaberID = Tbl2.HaberID INNER JOIN
			TblDesignSablonlar AS TDS ON 1=1 INNER JOIN
			TblSablon_Modul AS TSM ON TDS.SablonId = TSM.SablonId
	WHERE (Tbl2.SeoUrl = @Url) AND (Tbl1.Gorunurluk <> 4) AND TSM.SablonAnahtar = 'news'


	IF (@IcerikQS IS NOT NULL)
		SELECT @IcerikQS + '&' + @SablonQS




































GO
/****** Object:  StoredProcedure [snlg_V1].[zsp_QueryStringPages]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [snlg_V1].[zsp_QueryStringPages]
	@Url varchar(500)
AS
SET NOCOUNT ON;

DECLARE @SablonQS varchar(500), @IcerikQS varchar(500)


	SELECT  TOP(1) @IcerikQS = 'syf=' + CAST(Tbl1.SayfaId AS VARCHAR),
			@SablonQS = 'sablon=' + CAST(Tbl1.SablonId AS VARCHAR) +
			'&gorunurluk=' + CAST(Tbl1.Gorunurluk AS VARCHAR)
	FROM TblSayfaApp AS Tbl1 INNER JOIN 
			TblSayfaDetay AS Tbl2 ON  Tbl1.SayfaID = Tbl2.SayfaID INNER JOIN 
			TblDesignSablonlar AS TDS ON  Tbl1.SablonId = TDS.SablonId
	WHERE  (Tbl2.SeoUrl = @Url) AND (Tbl1.Gorunurluk <> 4)


	IF (@IcerikQS IS NOT NULL)
		SELECT @IcerikQS + '&' + @SablonQS
















GO
/****** Object:  StoredProcedure [snlg_V1].[zsp_QueryStringPortfolio]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [snlg_V1].[zsp_QueryStringPortfolio]
	@Url varchar(500)
AS
SET NOCOUNT ON;

DECLARE @SablonQS varchar(500), @IcerikQS varchar(500)

	SELECT  TOP(1) @IcerikQS = 'rktg=' + CAST(Tbl1.KtgId AS VARCHAR),
			@SablonQS = 'sablon=' + CAST(TSM.SablonId AS VARCHAR) +
			'&gorunurluk=1'
	FROM TblReferansKtgDetay AS Tbl1 INNER JOIN 
			TblDesignSablonlar AS TDS ON 1=1 INNER JOIN
			TblSablon_Modul AS TSM ON  TDS.SablonId = TSM.SablonId
	WHERE  (Tbl1.SeoUrl = @Url) AND TSM.SablonAnahtar = 'portfolioCtg'

IF (@IcerikQS IS NOT NULL)
	SELECT @IcerikQS + '&' + @SablonQS




GO
/****** Object:  StoredProcedure [snlg_V1].[zsp_QueryStringProject]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [snlg_V1].[zsp_QueryStringProject]
	@Url varchar(500)
AS
SET NOCOUNT ON;

DECLARE @SablonQS varchar(500), @IcerikQS varchar(500)

	SELECT  TOP(1) @IcerikQS = 'pktg=' + CAST(Tbl1.KtgId AS VARCHAR),
			@SablonQS = 'sablon=' + CAST(TSM.SablonId AS VARCHAR) +
			'&gorunurluk=1'
	FROM TblProjeKtgApp AS Tbl1 INNER JOIN 
			TblProjeKtgDetay AS Tbl2 ON Tbl1.KtgID = Tbl2.KtgID INNER JOIN
			TblDesignSablonlar AS TDS ON 1=1 INNER JOIN
			TblSablon_Modul AS TSM ON TDS.SablonId = TSM.SablonId
	WHERE (Tbl2.SeoUrl = @Url) AND (Tbl1.Aktif = 1) AND TSM.SablonAnahtar = 'projectCtg'

	IF (@IcerikQS IS NULL)
		SELECT  TOP(1) @IcerikQS = 'paltid=' + CAST(Tbl1.ProjeAltId AS VARCHAR),
				@SablonQS = 'sablon=' + CAST(TSM.SablonId AS VARCHAR) +
				'&gorunurluk=' + CAST(Tbl1.Gorunurluk AS VARCHAR)
		FROM TblProjeAltBilgiApp AS Tbl1 INNER JOIN 
				TblProjeAltBilgiDetay AS Tbl2 ON Tbl1.ProjeAltID = Tbl2.ProjeAltID INNER JOIN
				TblDesignSablonlar AS TDS ON 1=1 INNER JOIN
				TblSablon_Modul AS TSM ON TDS.SablonId = TSM.SablonId
		WHERE (Tbl2.SeoUrl = @Url) AND (Tbl1.Gorunurluk <> 4) AND TSM.SablonAnahtar = 'project'

IF (@IcerikQS IS NOT NULL)
	SELECT @IcerikQS + '&' + @SablonQS





GO
/****** Object:  StoredProcedure [snlg_V1].[zsp_QueryStringShop]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [snlg_V1].[zsp_QueryStringShop]
	@Url varchar(500)
AS
SET NOCOUNT ON;

DECLARE @SablonQS varchar(500), @IcerikQS varchar(500)


	SELECT  TOP(1) @IcerikQS = 'uktg=' + CAST(Tbl1.KtgId AS VARCHAR),
			@SablonQS = 'sablon=' + CAST(TSM.SablonId AS VARCHAR) +
			'&gorunurluk=1'
	FROM TblUrunKtgApp AS Tbl1 INNER JOIN 
			TblUrunKtgDetay AS Tbl2 ON Tbl1.KtgID=Tbl2.KtgID INNER JOIN
			TblDesignSablonlar AS TDS ON 1=1 INNER JOIN
			TblSablon_Modul AS TSM ON  TDS.SablonId = TSM.SablonId
	WHERE  (Tbl2.SeoUrl = @Url) AND (Tbl1.Aktif = 1) AND TSM.SablonAnahtar = 'shopCtg'

	IF (@IcerikQS IS NULL)
		SELECT  TOP(1) @IcerikQS = 'urunid=' + CAST(Tbl1.UrunId AS VARCHAR), 
				@SablonQS = 'sablon=' + CAST(TSM.SablonId AS VARCHAR) +
				'&gorunurluk=' + CAST(Tbl1.Gorunurluk AS VARCHAR)
		FROM TblUrunApp AS Tbl1 INNER JOIN 
				TblUrunDetay AS Tbl2 ON Tbl1.UrunID=Tbl2.UrunID INNER JOIN
				TblDesignSablonlar AS TDS ON 1=1 INNER JOIN
				TblSablon_Modul AS TSM ON  TDS.SablonId = TSM.SablonId
		WHERE  (Tbl2.SeoUrl = @Url) AND (Tbl1.Gorunurluk <> 4) AND TSM.SablonAnahtar = 'shop'

IF (@IcerikQS IS NOT NULL)
	SELECT @IcerikQS + '&' + @SablonQS











GO
/****** Object:  StoredProcedure [snlg_V1].[zsp_QueryStringUser]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [snlg_V1].[zsp_QueryStringUser]
	@Url varchar(500)
AS
SET NOCOUNT ON;

DECLARE @SablonQS varchar(500), @IcerikQS varchar(500)

	SELECT  TOP(1) @IcerikQS = 'uye=' + CAST(Tbl1.UyeId AS VARCHAR),
			@SablonQS = 'sablon=' + CAST(TSM.SablonId AS VARCHAR) +
			'&gorunurluk=1'
	FROM TblUyeApp AS Tbl1 INNER JOIN 
			TblDesignSablonlar AS TDS ON 1=1 INNER JOIN
			TblSablon_Modul AS TSM ON  TDS.SablonId = TSM.SablonId
	WHERE  (Tbl1.SeoUrl = @Url) AND (Tbl1.Aktif = 1) AND TSM.SablonAnahtar = 'user'

IF (@IcerikQS IS NOT NULL)
	SELECT @IcerikQS + '&' + @SablonQS



	



GO
/****** Object:  StoredProcedure [snlg_V1].[zsp_QueryStringUser_edit]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [snlg_V1].[zsp_QueryStringUser_edit]
	@Url varchar(500)
AS
SET NOCOUNT ON;

DECLARE @SablonQS varchar(500), @IcerikQS varchar(500)

	SELECT  TOP(1) @IcerikQS = 'uye=' + CAST(Tbl1.UyeId AS VARCHAR),
			@SablonQS = 'sablon=' + CAST(TSM.SablonId AS VARCHAR) +
			'&gorunurluk=1'
	FROM TblUyeApp AS Tbl1 INNER JOIN 
			TblDesignSablonlar AS TDS ON 1=1 INNER JOIN
			TblSablon_Modul AS TSM ON  TDS.SablonId = TSM.SablonId
	WHERE  (Tbl1.SeoUrl = @Url) AND (Tbl1.Aktif = 1) AND TSM.SablonAnahtar = 'user-edit'

IF (@IcerikQS IS NOT NULL)
	SELECT @IcerikQS + '&' + @SablonQS



	



GO
/****** Object:  StoredProcedure [snlg_V1].[zsp_Referans_EnSonEklenen]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [snlg_V1].[zsp_Referans_EnSonEklenen]
	@Dil smallint, @Adet tinyint
AS
SET NOCOUNT ON;

DECLARE @DefRsm varchar(500)
SELECT TOP(1) @DefRsm = ResimYol FROM TblVarsayilanResimler WHERE  ResimAnahtar = N'portfolio'

SELECT	TOP(@Adet) TRA.Link, TRA.Firma,
		ISNULL(TRA.Resim, @DefRsm) AS Resim
FROM	TblReferansApp AS TRA LEFT OUTER JOIN
			TblReferansDetay AS TRD ON TRA.RId = TRD.RId AND TRD.Dil = @Dil
ORDER BY TRA.RId DESC











































GO
/****** Object:  StoredProcedure [snlg_V1].[zsp_Referans_KategoridekiReferanslar]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [snlg_V1].[zsp_Referans_KategoridekiReferanslar]
	@Dil smallint, @KtgId int, @CurrentPage int, 
	@PageSize int, @KayitSayisi int OUTPUT
AS
SET NOCOUNT ON;

DECLARE @DefaultLang smallint
SELECT TOP(1) @DefaultLang = Deger FROM snlg_V1.TblDegiskenler WHERE  Degisken = 'DefaultLang'

DECLARE @DefRsm varchar(500)
SELECT TOP(1) @DefRsm = ResimYol FROM TblVarsayilanResimler WHERE  ResimAnahtar = N'portfolio'

IF (@KayitSayisi < 0)
 BEGIN
	IF(@KtgId IS NULL)
		SELECT  @KayitSayisi = COUNT(RId) FROM TblReferansApp 
	ELSE
		SELECT  @KayitSayisi = COUNT(RId) FROM TblReferansApp WHERE  (KtgId = @KtgId)
 END

BEGIN
	WITH TblSayfala AS
	(
		SELECT TOP(@PageSize*@CurrentPage) ROW_NUMBER() OVER(ORDER BY RId DESC) AS Sirala, RId
		FROM    TblReferansApp
		WHERE      (KtgId = ISNULL(@KtgId, KtgId))
	)
	SELECT TRA.Firma, TRA.Link, TRA.RId,
			ISNULL(TRA.Resim, @DefRsm) AS Resim,
			ISNULL(TRD.Bilgi, (SELECT TOP 1 Bilgi FROM TblReferansDetay WHERE RId = TRA.RId AND Dil = @DefaultLang)) AS Bilgi
	FROM TblSayfala INNER JOIN
			TblReferansApp AS TRA ON TblSayfala.RId = TRA.RId LEFT OUTER JOIN
			TblReferansDetay AS TRD ON TRA.RId = TRD.RId AND TRD.Dil = @Dil
	WHERE TblSayfala.Sirala BETWEEN ((@CurrentPage - 1) * @PageSize) + 1 AND @CurrentPage * @PageSize ORDER BY TRA.Sira ASC
END

	






GO
/****** Object:  StoredProcedure [snlg_V1].[zsp_Referans_Kategorileri]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [snlg_V1].[zsp_Referans_Kategorileri]
	@Dil smallint
AS
SET NOCOUNT ON;

DECLARE @DefaultLang smallint
SELECT TOP(1) @DefaultLang = Deger FROM snlg_V1.TblDegiskenler WHERE  Degisken = 'DefaultLang'

SELECT	ISNULL(TRKD.KtgAd, (SELECT TOP 1 KtgAd FROM TblReferansKtgDetay WHERE (KtgId = TRKA.KtgId) AND (Dil = @DefaultLang))) AS KtgAd, 
			TRKD.SeoUrl
FROM	TblReferansKtgApp AS TRKA LEFT OUTER JOIN
			TblReferansKtgDetay AS TRKD ON TRKA.KtgId = TRKD.KtgId AND TRKD.Dil = @Dil





GO
/****** Object:  StoredProcedure [snlg_V1].[zsp_Referans_Rasgele]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [snlg_V1].[zsp_Referans_Rasgele]
	@Dil smallint, @Adet tinyint
AS
SET NOCOUNT ON;

DECLARE @DefRsm varchar(500)
SELECT TOP(1) @DefRsm = ResimYol FROM TblVarsayilanResimler WHERE  ResimAnahtar = N'portfolio'

SELECT	TOP(@Adet) TRA.Link, TRA.Firma,
		ISNULL(TRA.Resim, @DefRsm) AS Resim
FROM	TblReferansApp AS TRA LEFT OUTER JOIN
			TblReferansDetay AS TRD ON TRA.RId = TRD.RId AND TRD.Dil = @Dil
ORDER BY NEWID()












































GO
/****** Object:  StoredProcedure [snlg_V1].[zsp_SablondakiKontrolleriGetir]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [snlg_V1].[zsp_SablondakiKontrolleriGetir]
	@SablonId smallint, @Dil smallint, @isLogin bit
AS
SET NOCOUNT ON;

DECLARE @DefaultLang smallint
SELECT TOP(1) @DefaultLang = Deger FROM snlg_V1.TblDegiskenler WHERE  Degisken = 'DefaultLang'

DECLARE @Gorunurluk tinyint
IF(@isLogin = 1)
	SET @Gorunurluk = 2
ELSE
	SET @Gorunurluk = 3


--ŞABLONDAKİ BLOKLAR
SELECT  ISNULL(TblUcDetay.Baslik,(SELECT Baslik FROM TblUcDetay WHERE UCId = TblUCApp.UCId AND (Dil = @DefaultLang))) AS UCBaslik,
		ISNULL(TblUcDetay.Icerik,(SELECT Icerik FROM TblUcDetay WHERE UCId = TblUCApp.UCId AND (Dil = @DefaultLang))) AS UCIcerik,
		ISNULL(TblUcDetay.BlokAltBilgi,(SELECT BlokAltBilgi FROM TblUcDetay WHERE UCId = TblUCApp.UCId AND (Dil = @DefaultLang))) AS BlokAltBilgi,
		ISNULL(TblUcDetay.BlokUstBilgi,(SELECT BlokUstBilgi FROM TblUcDetay WHERE UCId = TblUCApp.UCId AND (Dil = @DefaultLang))) AS BlokUstBilgi,
		TblPlaceHolders.PHName, TblUCApp.UCPath, TblUCApp.Title, TblUCApp.BaslikGorunsun, TblUCApp.BlokType, 
		TblDesignSablonIcerik.Sira, TblDesignSablonIcerik.BlockPlaceID, TblUCApp.UCID
FROM   TblPlaceHolders INNER JOIN
		TblDesignSablonIcerik ON TblDesignSablonIcerik.ContainerId = TblPlaceHolders.ContainerId INNER JOIN 
		TblUCApp ON TblDesignSablonIcerik.UCId = TblUCApp.UCId AND TblUCApp.Gorunurluk IN (1,@Gorunurluk) LEFT OUTER JOIN
		TblUcDetay ON TblUCApp.UCId = TblUcDetay.UCId AND TblUcDetay.Dil = @Dil
WHERE TblDesignSablonIcerik.SablonId = @SablonId 
ORDER BY TblDesignSablonIcerik.Sira


--ŞABLONDAKİ BLOKLARIN ATTRİBUTES'LARI
SELECT DSI.BlockPlaceID, ISNULL(BAV.AttributeValue, BAK.DefaultValue) AS AttributeValue, BAK.AttributeKey
FROM     snlg_V1.TblDesignSablonIcerik AS DSI INNER JOIN
                  snlg_V1.TblBlockAttributeKeys AS BAK ON DSI.UCId = BAK.BlockID LEFT OUTER JOIN
                  snlg_V1.TblBlockAttributeValues AS BAV ON BAK.AttributeID = BAV.AttributeID AND DSI.BlockPlaceID = BAV.BlockPlaceID
WHERE  (DSI.SablonId = @SablonId)









GO
/****** Object:  StoredProcedure [snlg_V1].[zsp_SayfadakiKontrolleriGetir]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [snlg_V1].[zsp_SayfadakiKontrolleriGetir]
	@SablonId smallint, @Dil smallint, @isLogin bit
AS
SET NOCOUNT ON;

DECLARE @DefaultLang smallint
SELECT TOP(1) @DefaultLang = Deger FROM snlg_V1.TblDegiskenler WHERE  Degisken = 'DefaultLang'

DECLARE @Gorunurluk tinyint
IF(@isLogin = 1)
	SET @Gorunurluk = 2
ELSE
	SET @Gorunurluk = 3

SELECT  ISNULL(TblUcDetay.Baslik,(SELECT Baslik FROM TblUcDetay WHERE UCId = TblUCApp.UCId AND (Dil = @DefaultLang))) AS UCBaslik,
		ISNULL(TblUcDetay.Icerik,(SELECT Icerik FROM TblUcDetay WHERE UCId = TblUCApp.UCId AND (Dil = @DefaultLang))) AS UCIcerik,
		TblDesignContainers.ContainerName, TblUCApp.UCPath, TblUCApp.BaslikGorunsun, 
		TblDesignSablonIcerik.Sira
FROM   TblDesignContainers INNER JOIN
		TblDesignSablonIcerik ON TblDesignSablonIcerik.ContainerId = TblDesignContainers.ContainerId  AND 
								 TblDesignSablonIcerik.SablonId = @SablonId INNER JOIN
		TblUCApp ON TblDesignSablonIcerik.UCId = TblUCApp.UCId AND TblUCApp. 
					TblUCApp.Gorunurluk IN (1,@Gorunurluk) LEFT OUTER JOIN
		TblUcDetay ON TblUCApp.UCId = TblUcDetay.UCId AND TblUcDetay.Dil = @Dil
ORDER BY TblDesignSablonIcerik.Sira












































GO
/****** Object:  StoredProcedure [snlg_V1].[zsp_SayfaDetayGetir]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [snlg_V1].[zsp_SayfaDetayGetir]
	@SayfaId int, @Dil smallint
AS
SET NOCOUNT ON;

SELECT	ISNULL(TblSayfaDetay.Title,(SELECT TOP(1) Title FROM TblSayfaDetay WHERE SayfaId = @SayfaId AND (DId = 1))) AS Title,
			ISNULL(TblSayfaDetay.Descr,(SELECT TOP(1) Descr FROM TblSayfaDetay WHERE SayfaId = @SayfaId AND (DId = 1))) AS Descr,
			ISNULL(TblSayfaDetay.Keyword,(SELECT TOP(1) Keyword FROM TblSayfaDetay WHERE SayfaId = @SayfaId AND (DId = 1))) AS Keyword,
			ISNULL(TblSayfaDetay.Icerik,(SELECT TOP(1) Icerik FROM TblSayfaDetay WHERE SayfaId = @SayfaId AND (DId = 1))) AS Icerik,
			TblSayfaApp.AramaIndex
FROM	TblSayfaApp LEFT OUTER JOIN
		TblSayfaDetay ON TblSayfaApp.SayfaId = TblSayfaDetay.SayfaId AND TblSayfaDetay.DId = @Dil
WHERE	(TblSayfaApp.SayfaId = @SayfaId)






























GO
/****** Object:  StoredProcedure [snlg_V1].[zsp_SayfaMetaGetir]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [snlg_V1].[zsp_SayfaMetaGetir]
	@SayfaId int, @Dil smallint
AS
SET NOCOUNT ON;

SELECT	ISNULL(TblSayfaDetay.Title,(SELECT TOP(1) Title FROM TblSayfaDetay WHERE SayfaId = @SayfaId AND (DId = 1))) AS Title,
			ISNULL(TblSayfaDetay.Descr,(SELECT TOP(1) Descr FROM TblSayfaDetay WHERE SayfaId = @SayfaId AND (DId = 1))) AS Descr,
			ISNULL(TblSayfaDetay.Keyword,(SELECT TOP(1) Keyword FROM TblSayfaDetay WHERE SayfaId = @SayfaId AND (DId = 1))) AS Keyword
FROM	TblSayfaApp LEFT OUTER JOIN
		TblSayfaDetay ON TblSayfaApp.SayfaId = TblSayfaDetay.SayfaId AND TblSayfaDetay.DId = @Dil
WHERE	(TblSayfaApp.SayfaId = @SayfaId) AND TblSayfaApp.Gorunurluk <> 4












































GO
/****** Object:  StoredProcedure [snlg_V1].[zsp_Urun_Detay]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [snlg_V1].[zsp_Urun_Detay]
	@Dil smallint, @UrunId int
AS
SET NOCOUNT ON;

DECLARE @DefaultLang smallint
SELECT TOP(1) @DefaultLang = Deger FROM snlg_V1.TblDegiskenler WHERE  Degisken = 'DefaultLang'

DECLARE @DefRsm varchar(500)
SELECT TOP(1) @DefRsm = ResimYol FROM TblVarsayilanResimler WHERE  ResimAnahtar = N'shop'

SELECT ISNULL(TUD.UrunAd, (SELECT TOP 1 UrunAd FROM TblUrunDetay WHERE UrunId = TUA.UrunId AND Dil = @DefaultLang)) AS UrunAd,
		ISNULL(TUD.Bilgi, (SELECT TOP 1 Bilgi FROM TblUrunDetay WHERE UrunId = TUA.UrunId AND Dil = @DefaultLang)) AS Bilgi,
		ISNULL(TUD.Keyword, (SELECT TOP 1 Keyword FROM TblUrunDetay WHERE UrunId = TUA.UrunId AND Dil = @DefaultLang)) AS Keyword,
		ISNULL(TUD.Detay, (SELECT TOP 1 Detay FROM TblUrunDetay WHERE UrunId = TUA.UrunId AND Dil = @DefaultLang)) AS Detay,
		ISNULL(TUD.Descr, (SELECT TOP 1 Descr FROM TblUrunDetay WHERE UrunId = TUA.UrunId AND Dil = @DefaultLang)) AS Descr,
		ISNULL(TUA.Resim, @DefRsm) AS Resim,TUA.AramaIndex,
		TUA.Gorunurluk, TUA.Fiyat, TPB.Simge, TUA.UrunKodu
FROM TblUrunApp AS TUA LEFT OUTER JOIN
		TblUrunDetay AS TUD ON TUA.UrunId = TUD.UrunId AND TUD.Dil = @Dil LEFT OUTER JOIN
			TblParaBirimleri AS TPB ON TUA.PId = TPB.PId
WHERE  TUA.UrunId = @UrunId AND TUA.Gorunurluk <> 4














































GO
/****** Object:  StoredProcedure [snlg_V1].[zsp_Urun_EnSonEklenen]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [snlg_V1].[zsp_Urun_EnSonEklenen]
	@Dil smallint, @Adet tinyint
AS
SET NOCOUNT ON;

DECLARE @DefaultLang smallint
SELECT TOP(1) @DefaultLang = Deger FROM snlg_V1.TblDegiskenler WHERE  Degisken = 'DefaultLang'

DECLARE @DefRsm varchar(500)
SELECT TOP(1) @DefRsm = ResimYol FROM TblVarsayilanResimler WHERE  ResimAnahtar = N'shop'

SELECT	TOP(@Adet) 
		ISNULL(TUD.UrunAd, (SELECT TOP 1 UrunAd FROM TblUrunDetay WHERE (UrunId = TUA.UrunId) AND (Dil = @DefaultLang))) AS UrunAd, 
		ISNULL(TUD.Bilgi, (SELECT TOP 1 Bilgi FROM TblUrunDetay WHERE (UrunId = TUA.UrunId) AND (Dil = @DefaultLang))) AS Bilgi, 
		ISNULL(TUA.Resim, @DefRsm) AS Resim,
			TUD.SeoUrl, TUA.Fiyat, TPB.Simge
FROM	TblUrunApp AS TUA LEFT OUTER JOIN
			TblUrunDetay AS TUD ON TUA.UrunId = TUD.UrunId AND TUD.Dil = @Dil LEFT OUTER JOIN
			TblParaBirimleri AS TPB ON TUA.PId = TPB.PId
WHERE     (TUA.Gorunurluk <> 4)
ORDER BY TUA.Sira ASC












































GO
/****** Object:  StoredProcedure [snlg_V1].[zsp_Urun_KategoriBilgileri]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [snlg_V1].[zsp_Urun_KategoriBilgileri]
	@Dil smallint, @KtgId int
AS
SET NOCOUNT ON;

DECLARE @DefaultLang smallint
SELECT TOP(1) @DefaultLang = Deger FROM snlg_V1.TblDegiskenler WHERE  Degisken = 'DefaultLang'

DECLARE @DefRsm varchar(500)
SELECT TOP(1) @DefRsm = ResimYol FROM TblVarsayilanResimler WHERE  ResimAnahtar = N'shopCtg'

SELECT ISNULL(TUKD.KtgAd, (SELECT TOP 1 KtgAd FROM TblUrunKtgDetay WHERE KtgId = TUKA.KtgId AND Dil = @DefaultLang)) AS KtgAd,
		ISNULL(TUKD.Keyword, (SELECT TOP 1 Keyword FROM TblUrunKtgDetay WHERE KtgId = TUKA.KtgId AND Dil = @DefaultLang)) AS Keyword,
		ISNULL(TUKD.Descr, (SELECT TOP 1 Descr FROM TblUrunKtgDetay WHERE KtgId = TUKA.KtgId AND Dil = @DefaultLang)) AS Descr,
		ISNULL(TUKA.Resim, @DefRsm) AS Resim
FROM TblUrunKtgApp AS TUKA LEFT OUTER JOIN
		TblUrunKtgDetay AS TUKD ON TUKA.KtgId = TUKD.KtgId AND TUKD.Dil = @Dil
WHERE  TUKA.KtgId = @KtgId AND TUKA. Aktif = 1 







GO
/****** Object:  StoredProcedure [snlg_V1].[zsp_Urun_KategoridekiUrunler]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [snlg_V1].[zsp_Urun_KategoridekiUrunler]
	@Dil smallint, @KtgId int, @CurrentPage int, 
	@PageSize int, @KayitSayisi int OUTPUT
AS
SET NOCOUNT ON;

DECLARE @DefaultLang smallint
SELECT TOP(1) @DefaultLang = Deger FROM snlg_V1.TblDegiskenler WHERE  Degisken = 'DefaultLang'

DECLARE @DefRsm varchar(500)
SELECT TOP(1) @DefRsm = ResimYol FROM TblVarsayilanResimler WHERE  ResimAnahtar = N'shop'

IF (@KayitSayisi < 0)
	SELECT  @KayitSayisi = COUNT(TUA.UrunId)
	FROM    TblUrun_Kategori AS TUK INNER JOIN
			  TblUrunApp AS TUA ON TUK.UrunId = TUA.UrunId 
	WHERE     (TUA.Gorunurluk <> 4) AND (TUK.KtgId = @KtgId)

BEGIN
	WITH TblSayfala AS
	(
		SELECT TOP(@PageSize*@CurrentPage) ROW_NUMBER() OVER(ORDER BY TUA.Sira, TUA.UrunId DESC) AS Sirala, TUA.UrunId
		FROM    TblUrun_Kategori AS TUK INNER JOIN
				  TblUrunApp AS TUA ON TUK.UrunId = TUA.UrunId
		WHERE     (TUA.Gorunurluk <> 4) AND (TUK.KtgId = @KtgId)
	)
	SELECT  TUD.SeoUrl, TUA.Fiyat, TPB.Simge,
		ISNULL(TUA.Resim, @DefRsm) AS Resim,
		ISNULL(TUD.UrunAd, (SELECT TOP 1 UrunAd FROM TblUrunDetay WHERE UrunId = TUA.UrunId AND Dil = @DefaultLang)) AS UrunAd,
		ISNULL(TUD.Bilgi, (SELECT TOP 1 Bilgi FROM TblUrunDetay WHERE UrunId = TUA.UrunId AND Dil = @DefaultLang)) AS Bilgi
	FROM TblSayfala INNER JOIN
			TblUrunApp AS TUA ON TblSayfala.UrunId = TUA.UrunId LEFT OUTER JOIN
			TblUrunDetay AS TUD ON TUA.UrunId = TUD.UrunId AND TUD.Dil = @Dil LEFT OUTER JOIN
			TblParaBirimleri AS TPB ON TUA.PId = TPB.PId
	WHERE TblSayfala.Sirala BETWEEN ((@CurrentPage - 1) * @PageSize) + 1 AND @CurrentPage * @PageSize
	ORDER BY TblSayfala.Sirala
END




GO
/****** Object:  StoredProcedure [snlg_V1].[zsp_Urun_KategoridekiUrunler2]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [snlg_V1].[zsp_Urun_KategoridekiUrunler2]
	@Dil smallint, @KtgId int, @CurrentPage int, 
	@PageSize int, @KayitSayisi int OUTPUT
AS
SET NOCOUNT ON;

DECLARE @DefaultLang smallint
SELECT TOP(1) @DefaultLang = Deger FROM snlg_V1.TblDegiskenler WHERE  Degisken = 'DefaultLang'

DECLARE @DefRsm varchar(500)
SELECT TOP(1) @DefRsm = ResimYol FROM TblVarsayilanResimler WHERE  ResimAnahtar = N'shop'

IF (@KayitSayisi < 0)
	SELECT  @KayitSayisi = COUNT(TUA.UrunId)
	FROM    TblUrun_Kategori AS TUK INNER JOIN
			  TblUrunApp AS TUA ON TUK.UrunId = TUA.UrunId 
	WHERE     (TUA.Gorunurluk <> 4) AND (TUK.KtgId = @KtgId)

BEGIN
	WITH TblSayfala AS
	(
		SELECT DISTINCT TOP(@PageSize*@CurrentPage) ROW_NUMBER() OVER(ORDER BY TUA.Sira) AS Sirala, 
		ISNULL(TUA.Resim, @DefRsm) AS Resim,
				ISNULL(TUD.UrunAd, (SELECT TOP 1 UrunAd FROM TblUrunDetay WHERE UrunId = TUA.UrunId AND Dil = @DefaultLang)) AS UrunAd,
				ISNULL(TUD.Bilgi, (SELECT TOP 1 Bilgi FROM TblUrunDetay WHERE UrunId = TUA.UrunId AND Dil = @DefaultLang)) AS Bilgi,
				TUD.SeoUrl, TUA.Fiyat, TPB.Simge
		FROM    TblUrun_Kategori AS TUK INNER JOIN
				  TblUrunApp AS TUA ON TUK.UrunId = TUA.UrunId LEFT OUTER JOIN
				  TblUrunDetay AS TUD ON TUA.UrunId = TUD.UrunId AND TUD.Dil = @Dil LEFT OUTER JOIN
			TblParaBirimleri AS TPB ON TUA.PId = TPB.PId
		WHERE     (TUA.Gorunurluk <> 4) AND (TUK.KtgId = @KtgId)
	)
	SELECT * FROM TblSayfala WHERE Sirala BETWEEN ((@CurrentPage - 1) * @PageSize) + 1 AND @CurrentPage * @PageSize
	ORDER BY Sirala
END
	

GO
/****** Object:  StoredProcedure [snlg_V1].[zsp_Urun_KategoriDetay]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [snlg_V1].[zsp_Urun_KategoriDetay]
	@Dil smallint, @KtgId int
AS
SET NOCOUNT ON;

DECLARE @DefaultLang smallint
SELECT TOP(1) @DefaultLang = Deger FROM snlg_V1.TblDegiskenler WHERE  Degisken = 'DefaultLang'

DECLARE @DefRsm varchar(500)
SELECT TOP(1) @DefRsm = ResimYol FROM TblVarsayilanResimler WHERE  ResimAnahtar = N'shopCtg'

SELECT ISNULL(TUKD.KtgAd, (SELECT TOP 1 KtgAd FROM TblUrunKtgDetay WHERE KtgId = TUKA.KtgId AND Dil = @DefaultLang)) AS KtgAd,
		ISNULL(TUKD.Keyword, (SELECT TOP 1 Keyword FROM TblUrunKtgDetay WHERE KtgId = TUKA.KtgId AND Dil = @DefaultLang)) AS Keyword,
		ISNULL(TUKD.Descr, (SELECT TOP 1 Descr FROM TblUrunKtgDetay WHERE KtgId = TUKA.KtgId AND Dil = @DefaultLang)) AS Descr,
		ISNULL(TUKA.Resim, @DefRsm) AS Resim
FROM TblUrunKtgApp AS TUKA LEFT OUTER JOIN
		TblUrunKtgDetay AS TUKD ON TUKA.KtgId = TUKD.KtgId AND TUKD.Dil = @Dil
WHERE  TUKA.KtgId = @KtgId AND TUKA. Aktif = 1 










































GO
/****** Object:  StoredProcedure [snlg_V1].[zsp_Urun_Kategorileri]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [snlg_V1].[zsp_Urun_Kategorileri]
	@Dil smallint
AS
SET NOCOUNT ON;

DECLARE @DefaultLang smallint
SELECT TOP(1) @DefaultLang = Deger FROM snlg_V1.TblDegiskenler WHERE  Degisken = 'DefaultLang'

DECLARE @DefRsm varchar(500)
SELECT TOP(1) @DefRsm = ResimYol FROM TblVarsayilanResimler WHERE  ResimAnahtar = N'shopCtg';

WITH RekursifSorgu(KtgId)
AS
(
	SELECT KtgId FROM TblUrunKtgApp
	WHERE   Aktif = 1 AND UstId IS NULL
		UNION ALL
	SELECT TUKA.KtgId FROM TblUrunKtgApp TUKA JOIN RekursifSorgu 
	ON TUKA.UstId = RekursifSorgu.KtgId
	WHERE   Aktif = 1 
)
SELECT TUKA.Sira, TUKA.UstId, RekursifSorgu.KtgId,
		ISNULL(TUKD.KtgAd, (SELECT TOP 1 KtgAd FROM TblUrunKtgDetay WHERE KtgId = TUKA.KtgId AND Dil = @DefaultLang)) AS KtgAd,
		ISNULL(TUKD.SeoUrl, (SELECT TOP 1 SeoUrl FROM TblUrunKtgDetay WHERE KtgId = TUKA.KtgId AND Dil = @DefaultLang)) AS SeoUrl,
		ISNULL(TUKA.Resim, @DefRsm) AS Resim
FROM RekursifSorgu INNER JOIN 
		TblUrunKtgApp AS TUKA ON TUKA.KtgId = RekursifSorgu.KtgId LEFT OUTER JOIN
		TblUrunKtgDetay AS TUKD ON TUKA.KtgId = TUKD.KtgId AND TUKD.Dil = @Dil








































GO
/****** Object:  StoredProcedure [snlg_V1].[zsp_Urun_Rasgele]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [snlg_V1].[zsp_Urun_Rasgele]
	@Dil smallint, @Adet tinyint
AS
SET NOCOUNT ON;

DECLARE @DefaultLang smallint
SELECT TOP(1) @DefaultLang = Deger FROM snlg_V1.TblDegiskenler WHERE  Degisken = 'DefaultLang'

DECLARE @DefRsm varchar(500)
SELECT TOP(1) @DefRsm = ResimYol FROM TblVarsayilanResimler WHERE  ResimAnahtar = N'shop'

SELECT	TOP(@Adet) ISNULL(TUD.UrunAd, (SELECT TOP 1 UrunAd FROM TblUrunDetay WHERE (UrunId = TUA.UrunId) AND (Dil = @DefaultLang))) AS UrunAd, 
		ISNULL(TUA.Resim, @DefRsm) AS Resim,
			TUD.SeoUrl, TUA.Fiyat, TPB.Simge
FROM	TblUrunApp AS TUA LEFT OUTER JOIN
			TblUrunDetay AS TUD ON TUA.UrunId = TUD.UrunId AND TUD.Dil = @Dil LEFT OUTER JOIN
			TblParaBirimleri AS TPB ON TUA.PId = TPB.PId
WHERE     (TUA.Gorunurluk <> 4)
ORDER BY NEWID()









































GO
/****** Object:  StoredProcedure [snlg_V1].[zsp_UyeDetaySec]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [snlg_V1].[zsp_UyeDetaySec]
	@UyeId int, @Dil smallint
AS
SET NOCOUNT ON;

	DECLARE @DefaultLang smallint
	SELECT TOP(1) @DefaultLang = Deger FROM snlg_V1.TblDegiskenler WHERE  Degisken = 'DefaultLang'

	DECLARE @DefRsm varchar(500)
	SELECT TOP(1) @DefRsm = ResimYol FROM TblVarsayilanResimler WHERE  ResimAnahtar = N'member'

	SELECT TUA.UyeId, TUD.UyeAd, TUD.Resim, TUA.Eposta,TUA.UserName,TUA.Sifre,
		ISNULL(TUDD.UyeBilgi, (SELECT TOP 1 UyeBilgi FROM TblUyeDetayDil WHERE UyeId = TUA.UyeId AND Dil = @DefaultLang)) AS UyeBilgi,
		ISNULL(TUD.Resim, @DefRsm) AS Resim
	FROM            snlg_V1.TblUyeApp AS TUA LEFT OUTER JOIN
							 snlg_V1.TblUyeDetay AS TUD ON TUA.UyeId = TUD.UyeId LEFT OUTER JOIN
							 snlg_V1.TblUyeDetayDil AS TUDD ON TUA.UyeId = TUDD.UyeId AND TUDD.Dil = @Dil
	WHERE        (TUA.UyeId = @UyeId)



GO
/****** Object:  StoredProcedure [snlg_V1].[zsp_UyeGuncelle]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [snlg_V1].[zsp_UyeGuncelle]
    @UyeAd varchar(75), @Eposta varchar(150), 
	@Sifre varchar(128), @UyeId int, @Dil int
AS
SET NOCOUNT ON;

	--EPOSTA adı varmı diye kontrol et
	IF(EXISTS(SELECT UyeId FROM TblUyeApp WHERE UyeId <> @UyeId AND  Eposta = @Eposta))
	 BEGIN
		RAISERROR('$#sqlhata2#$',11,1);
		RETURN
	 END
 
	IF(@Sifre!='')
		UPDATE    TblUyeApp SET     Eposta = @Eposta, Sifre = @Sifre WHERE     (UyeId = @UyeId) 
	ELSE
		UPDATE    TblUyeApp SET     Eposta = @Eposta WHERE     (UyeId = @UyeId) 


	IF(@@ROWCOUNT > 0)--üye güncellenmeişse var demektir.
	 BEGIN
	
		UPDATE    TblUyeDetay SET     UyeAd = @UyeAd WHERE     (UyeId = @UyeId)
		IF(@@ROWCOUNT < 1)--üyedetay güncellenmemişse yok demektir (ekle)
			INSERT INTO TblUyeDetay (UyeAd,UyeId) VALUES (@UyeAd,@UyeId) 

	 END



GO
/****** Object:  StoredProcedure [snlg_V1].[zsp_UyeLogin]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [snlg_V1].[zsp_UyeLogin]
	@UserName nvarchar(25), @Sifre varchar(128), @AdminId int
AS
SET NOCOUNT ON;

DECLARE @UyeId int, @Yetkiler varchar(4000)

SELECT   @UyeId = UyeId
FROM     TblUyeApp
WHERE     (UserName = @UserName) AND Sifre = @Sifre AND (Aktif = 1)

IF (@UyeId IS NULL)
 BEGIN--HATALI USER VEYA ŞİFRE (ÜYE BULUNAMADI)
	RAISERROR('$#sqlhata1#$',11,1);
	RETURN
 END
ELSE
 BEGIN
	--YETKİLİ OLDUĞU SAYFALARI ÇEK
	IF(@UyeId <> @AdminId)
		SELECT @Yetkiler =
			(
				SELECT     TblAdminYetkiler.Yetki AS 'data()'
				FROM         TblRol_Uye INNER JOIN
									  TblRol_Yetki ON TblRol_Uye.RolId = TblRol_Yetki.RolId INNER JOIN
									  TblAdminYetkiler ON TblRol_Yetki.YetkiId = TblAdminYetkiler.YetkiId
				WHERE     (TblRol_Uye.UyeId = @UyeId)
				FOR XML PATH('')
			)

	UPDATE TblUyeApp SET LoginGuid = NEWID() WHERE  UyeId=@UyeId

	SELECT UyeId, REPLACE(@Yetkiler,' ',',') + ',', SeoUrl,LoginGuid
	FROM     TblUyeApp
	WHERE     UyeId=@UyeId
 END






























GO
/****** Object:  StoredProcedure [snlg_V1].[zsp_UyeLoginGuidDogrula]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [snlg_V1].[zsp_UyeLoginGuidDogrula]
	@LoginGuid varchar(128), @AdminId int
AS
SET NOCOUNT ON;

DECLARE @UyeId int, @Yetkiler varchar(4000)

SELECT @UyeId = UyeId FROM TblUyeApp 
WHERE  (LoginGuid = @LoginGuid) AND (Aktif = 1)

--YETKİLİ OLDUĞU SAYFALARI ÇEK
IF(@UyeId <> @AdminId)
	SELECT @Yetkiler =
		(
			SELECT     TblAdminYetkiler.Yetki AS 'data()'
			FROM         TblRol_Uye INNER JOIN
									TblRol_Yetki ON TblRol_Uye.RolId = TblRol_Yetki.RolId INNER JOIN
									TblAdminYetkiler ON TblRol_Yetki.YetkiId = TblAdminYetkiler.YetkiId
			WHERE     (TblRol_Uye.UyeId = @UyeId)
			FOR XML PATH('')
		)

SELECT UyeId, REPLACE(@Yetkiler,' ',',')
FROM     TblUyeApp
WHERE     UyeId=@UyeId




GO
/****** Object:  StoredProcedure [snlg_V1].[zsp_UyeOlustur]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [snlg_V1].[zsp_UyeOlustur]
	@UyeAd varchar(75),
	@Eposta varchar(150), 
	@Sifre varchar(128), 
	@UserName varchar(25), 
	@UyeId int OUT
AS
SET NOCOUNT ON;

--Kullanıcı adı varmı diye kontrol et
IF(EXISTS(SELECT UyeId FROM TblUyeApp WHERE  UserName = @UserName ))
 BEGIN
	RAISERROR('$#sqlhata1#$',11,1);
	RETURN
 END

--EPOSTA adı varmı diye kontrol et
IF(EXISTS(SELECT UyeId FROM TblUyeApp WHERE  Eposta = @Eposta))
 BEGIN
	RAISERROR('$#sqlhata2#$',11,1);
	RETURN
 END

 
DECLARE @DefaultLang smallint
SELECT TOP(1) @DefaultLang = Deger FROM snlg_V1.TblDegiskenler WHERE  Degisken = 'DefaultLang'

DECLARE @SeoUrl varchar(500)
SET @SeoUrl = snlg_V1.fun_UrlOlustur(@UserName, 'user', NULL, NULL, @DefaultLang)

INSERT INTO TblUyeApp (Eposta, Sifre, Aktif, UserName, HataSay, UyelikTarihi,SeoUrl)
VALUES (@Eposta,@Sifre,1,@UserName, 0, GETDATE(),@SeoUrl)

SET @UyeId = SCOPE_IDENTITY()

IF(@@ROWCOUNT > 0)
 BEGIN
	INSERT INTO TblUyeDetay
                  (UyeAd,UyeId)
	VALUES     (@UyeAd,@UyeId) 

	INSERT INTO TblUyeDetayDil (UyeId,Dil) VALUES (@UyeId,@DefaultLang)

INSERT INTO snlg_V1.TblSiteLinkleri (SeoUrl, Id, UrlAnahtar, SablonAnahtar, Dil) VALUES (@SeoUrl, @UyeId,'user','user', @DefaultLang)
 END

--mail göndermek için ilgili veriler çekiliyor
SELECT    Top(1) Kimden, KimdenIsim, Mesaj, Konu, SmtpPsw, SmtpPort, SmtpHost, Ssl_
FROM    TblEPostaSablon WHERE  Anahtar = N'üyeOldu'












GO
/****** Object:  StoredProcedure [snlg_V1].[zsp_UyeSifreSifirla]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [snlg_V1].[zsp_UyeSifreSifirla]
	@IslemTipi int,
	@Eposta varchar(150), 
	@Sifre varchar(128),
	@guidDegeri nvarchar(MAX)
AS
SET NOCOUNT ON;

DECLARE @UserName VARCHAR(500)
DECLARE @GuidDeger VARCHAR(500)

--EPOSTA adı varmı diye kontrol et

IF(EXISTS(SELECT UyeId FROM TblUyeApp WHERE  Eposta = @Eposta))
BEGIN
	
	--İşlem tipi 1 olan şifre sıfırlama  yeni şifreyi güncelleme
	if(@IslemTipi=1)
	 BEGIN
		UPDATE  TblUyeApp
		SET   @UserName=UserName, Sifre = @Sifre, HataSay = 0
		WHERE (Eposta = @Eposta)	
	 END
	--İşlem tipi 2 olan şifre sıfırlama sayfasını mail bilgileri 
	 if(@IslemTipi=2)
	 BEGIN
	   SELECT @UserName=UserName FROM TblUyeApp WHERE  (Eposta = @Eposta)	
	 END

	 UPDATE  snlg_V1.TblUyeApp SET SifreUnuttumGuid=@guidDegeri  WHERE Eposta=@Eposta
	 SET @GuidDeger=@guidDegeri
	 SELECT  TOP (1) TES.Kimden, TES.KimdenIsim, TES.Mesaj, TES.Konu, TES.SmtpHost, 
		             TES.SmtpPsw, TES.SmtpPort, TES.SSL_, @UserName AS UserName,@GuidDeger AS GuidDegeri
	 FROM TblEPostaSablon AS TES 
          WHERE (TES.Anahtar = N'şifreHatırlat')
END
 ELSE
 BEGIN
 RAISERROR('$#sqlhata1#$',11,1);
	RETURN

 END


































GO
/****** Object:  StoredProcedure [snlg_V1].[zsp_ZDefteri_YorumEkle]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [snlg_V1].[zsp_ZDefteri_YorumEkle]
	@Yazan nvarchar(30), @Yorum nvarchar(1500),
	@Baslik nvarchar(75)
AS
SET NOCOUNT ON;

INSERT INTO TblZiyaretciDefteri (UstYId, Yazan, Yorum, Baslik, Onay)
VALUES     (NULL,@Yazan,@Yorum, @Baslik, 0)












































GO
/****** Object:  StoredProcedure [snlg_V1].[zsp_ZDefteri_Yorumlar]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [snlg_V1].[zsp_ZDefteri_Yorumlar]
	@CurrentPage int, @PageSize int
AS
SET NOCOUNT ON;

WITH TblSayfala AS
(
	SELECT TOP(@PageSize*@CurrentPage) ROW_NUMBER() OVER(ORDER BY YId DESC) AS Sirala, YId, UstYId
	FROM TblZiyaretciDefteri
	WHERE   Onay = 1 AND UstYId IS NULL
),
RekursifSorgu(YId, UstYId) AS
(
	SELECT 	YId, UstYId FROM TblSayfala 
	WHERE Sirala BETWEEN ((@CurrentPage - 1) * @PageSize) + 1 AND @CurrentPage * @PageSize
		UNION ALL
	SELECT TZD.YId, TZD.UstYId
	FROM TblZiyaretciDefteri AS TZD INNER JOIN 
			RekursifSorgu ON TZD.UstYId = RekursifSorgu.YId
	WHERE   Onay = 1 

)
SELECT TZD.YId, TZD.UstYId, TZD.Baslik, TZD.Yazan, TZD.Yorum
FROM TblZiyaretciDefteri AS TZD INNER JOIN 
		RekursifSorgu ON TZD.YId = RekursifSorgu.YId












































GO
/****** Object:  StoredProcedure [snlg_V1].[zsp_ZDefteri_YorumSay]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [snlg_V1].[zsp_ZDefteri_YorumSay]
AS
SET NOCOUNT ON;

SELECT  COUNT(YId)
FROM    TblZiyaretciDefteri
WHERE   (Onay = 1) AND UstYId IS NULL








































GO
/****** Object:  UserDefinedFunction [snlg_V1].[fun_UrlEncode]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE FUNCTION [snlg_V1].[fun_UrlEncode]
(
	@SeoUrl nvarCHAR(750)
)
returns varCHAR(8000) AS

BEGIN

	DECLARE @SeoUrl2 varCHAR(750)

    SET @SeoUrl = LOWER(@SeoUrl)
    SET @SeoUrl = REPLACE(@SeoUrl,'ç','c')
    SET @SeoUrl = REPLACE(@SeoUrl,'ğ','g')
    SET @SeoUrl = REPLACE(@SeoUrl,'ı','i')
    SET @SeoUrl = REPLACE(@SeoUrl,'ö','o')
    SET @SeoUrl = REPLACE(@SeoUrl,'ş','s')
    SET @SeoUrl = REPLACE(@SeoUrl,'ü','u')
    SET @SeoUrl = REPLACE(@SeoUrl,'.','-')
    SET @SeoUrl = REPLACE(@SeoUrl,'&','-')
    SET @SeoUrl = REPLACE(@SeoUrl,'/','-')
    SET @SeoUrl = REPLACE(@SeoUrl,' ','-')
    SET @SeoUrl = REPLACE(@SeoUrl,'--','-')
    SET @SeoUrl = REPLACE(@SeoUrl,'--','-')
    SET @SeoUrl = REPLACE(@SeoUrl,'--','-')
    SET @SeoUrl = REPLACE(@SeoUrl,'--','-')
    SET @SeoUrl = REPLACE(@SeoUrl,'--','-')
    
	
   SET @SeoUrl2 = ''
   DECLARE @p int, @c int
   SET @p = 1
   WHILE (@p <= LEN(@SeoUrl))
    BEGIN
		SET @c = ascii(SUBSTRING(@SeoUrl, @p, 1))
		IF (
			 @c between 48 and 57 OR 
			 @c between 65 and 90 OR 
			 @c between 97 and 122 OR 
			 @c = 36 OR 
			 @c = 43 OR 
			 @c = 45 OR 
			 @c = 61 OR 
			 @c = 95  
			)
		 SET @SeoUrl2 = @SeoUrl2 + CHAR(@c)
		SET @p = @p + 1
	 END
      
	if LEN(@SeoUrl2) = 0
      return null
      

	RETURN @SeoUrl2
END














GO
/****** Object:  UserDefinedFunction [snlg_V1].[fun_UrlOlustur]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE  FUNCTION [snlg_V1].[fun_UrlOlustur]
(
	@SeoUrl nvarCHAR(750), @UrlAnahtar varchar(50), @SablonAnahtar varchar(50), @Id int,
	@Dil int
)
returns varCHAR(8000) AS

BEGIN
	DECLARE @Bos bit, @Rakam varCHAR(3), @SeoUrl2 varCHAR(250)
    SET @Rakam = ''
    SET @Bos = 0

    SET @SeoUrl = LOWER(@SeoUrl)
    SET @SeoUrl = REPLACE(@SeoUrl,'ç','c')
    SET @SeoUrl = REPLACE(@SeoUrl,'ğ','g')
    SET @SeoUrl = REPLACE(@SeoUrl,'ı','i')
    SET @SeoUrl = REPLACE(@SeoUrl,'ö','o')
    SET @SeoUrl = REPLACE(@SeoUrl,'ş','s')
    SET @SeoUrl = REPLACE(@SeoUrl,'ü','u')
    SET @SeoUrl = REPLACE(@SeoUrl,'.','-')
    SET @SeoUrl = REPLACE(@SeoUrl,'&','-')
    SET @SeoUrl = REPLACE(@SeoUrl,'/','-')
    SET @SeoUrl = REPLACE(@SeoUrl,' ','-')
    SET @SeoUrl = REPLACE(@SeoUrl,'--','-')
    SET @SeoUrl = REPLACE(@SeoUrl,'--','-')
    SET @SeoUrl = REPLACE(@SeoUrl,'--','-')
    SET @SeoUrl = REPLACE(@SeoUrl,'--','-')
    SET @SeoUrl = REPLACE(@SeoUrl,'--','-')
    
   SET @SeoUrl2 = ''
   DECLARE @p int, @c int
   SET @p = 1
   WHILE (@p <= LEN(@SeoUrl))
    BEGIN
		SET @c = ascii(SUBSTRING(@SeoUrl, @p, 1))
		IF (
			 @c between 48 and 57 OR 
			 @c between 65 and 90 OR 
			 @c between 97 and 122 OR 
			 @c = 36 OR 
			 @c = 43 OR 
			 @c = 45 OR 
			 @c = 61 OR 
			 @c = 95  
			)
		 SET @SeoUrl2 = @SeoUrl2 + CHAR(@c)
		SET @p = @p + 1
	 END
      
	if LEN(@SeoUrl2) = 0
      return null
      
	SET @SeoUrl = @SeoUrl2

	WHILE(@Bos = 0)
	 BEGIN
		IF(@Id IS NULL)
		 BEGIN
			IF EXISTS(SELECT Id FROM TblSiteLinkleri 
						WHERE UrlAnahtar = @UrlAnahtar AND Dil=@Dil AND
								(SeoUrl = @SeoUrl + @Rakam))
				SET @Rakam = (CAST(CASE WHEN @Rakam = '' THEN 0 ELSE @Rakam END AS smallint) + 1)
			ELSE
				SET @Bos = 1
		 END
		ELSE
		 BEGIN
			IF EXISTS(SELECT Id FROM TblSiteLinkleri 
						WHERE  
								SablonAnahtar = @SablonAnahtar AND Dil=@Dil AND
								(SeoUrl = @SeoUrl + @Rakam) AND Id <> @Id)
				SET @Rakam = (CAST(CASE WHEN @Rakam = '' THEN 0 ELSE @Rakam END AS smallint) + 1)
			ELSE
				SET @Bos = 1
		 END
	 END

	RETURN @SeoUrl + @Rakam
END













GO
/****** Object:  Table [snlg_V1].[TblAdminYetkiler]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [snlg_V1].[TblAdminYetkiler](
	[YetkiId] [int] IDENTITY(1,1) NOT NULL,
	[Yetki] [nvarchar](100) NOT NULL,
	[YetkiTanim] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_TblAdminYetkiler] PRIMARY KEY CLUSTERED 
(
	[YetkiId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [snlg_V1].[TblAnketApp]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [snlg_V1].[TblAnketApp](
	[AnketId] [int] IDENTITY(134,1) NOT NULL,
	[Tarih] [date] NOT NULL CONSTRAINT [DF_TblAnketApp_Tarih]  DEFAULT (getdate()),
	[SonucGoster] [bit] NOT NULL CONSTRAINT [DF_TblAnketApp_SonucGoster]  DEFAULT ((0)),
	[Gorunurluk] [tinyint] NOT NULL CONSTRAINT [DF_TblAnketApp_Gorunurluk]  DEFAULT ((1)),
 CONSTRAINT [PK_TblAnketApp] PRIMARY KEY CLUSTERED 
(
	[AnketId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [snlg_V1].[TblAnketCevap]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [snlg_V1].[TblAnketCevap](
	[AnketId] [int] NOT NULL,
	[Cevap] [char](1) NOT NULL,
	[IP] [varchar](15) NULL,
	[UserId] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [snlg_V1].[TblAnketDetay]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [snlg_V1].[TblAnketDetay](
	[AnketId] [int] NOT NULL,
	[Dil] [smallint] NOT NULL,
	[Soru] [nvarchar](250) NULL,
	[A] [nvarchar](150) NULL,
	[B] [nvarchar](150) NULL,
	[C] [nvarchar](150) NULL,
	[D] [nvarchar](150) NULL,
	[E] [nvarchar](150) NULL,
	[F] [nvarchar](150) NULL,
	[G] [nvarchar](150) NULL,
	[H] [nvarchar](150) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [snlg_V1].[TblAramaMotoru]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [snlg_V1].[TblAramaMotoru](
	[GglDogrula] [nvarchar](max) NULL,
	[GglAnalytic] [nvarchar](max) NULL,
	[GglUser] [nvarchar](250) NULL,
	[GglPsw] [nvarchar](150) NULL,
	[GglProfId] [nvarchar](50) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [snlg_V1].[TblBlockAttributeKeys]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [snlg_V1].[TblBlockAttributeKeys](
	[AttributeID] [int] IDENTITY(1,1) NOT NULL,
	[BlockID] [int] NOT NULL,
	[AttributeKey] [varchar](250) NOT NULL,
	[DefaultValue] [varchar](max) NULL,
	[ValueList] [varchar](max) NULL,
 CONSTRAINT [PK_TblBlockAttributeKeys] PRIMARY KEY CLUSTERED 
(
	[AttributeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [snlg_V1].[TblBlockAttributeValues]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [snlg_V1].[TblBlockAttributeValues](
	[AttributeID] [int] NOT NULL,
	[BlockPlaceID] [int] NOT NULL,
	[AttributeValue] [varchar](max) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [snlg_V1].[TblDegiskenler]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [snlg_V1].[TblDegiskenler](
	[DegiskenID] [int] IDENTITY(1,1) NOT NULL,
	[Degisken] [nvarchar](50) NOT NULL,
	[Deger] [nvarchar](max) NULL,
 CONSTRAINT [PK_TblDegiskenler] PRIMARY KEY CLUSTERED 
(
	[DegiskenID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [snlg_V1].[TblDesignSablonIcerik]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [snlg_V1].[TblDesignSablonIcerik](
	[BlockPlaceID] [int] IDENTITY(1,1) NOT NULL,
	[SablonId] [smallint] NOT NULL,
	[ContainerId] [smallint] NOT NULL,
	[UCId] [int] NOT NULL,
	[Sira] [tinyint] NULL,
 CONSTRAINT [PK_TblDesignSablonIcerik] PRIMARY KEY CLUSTERED 
(
	[BlockPlaceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [snlg_V1].[TblDesignSablonlar]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [snlg_V1].[TblDesignSablonlar](
	[SablonId] [smallint] IDENTITY(-32335,1) NOT NULL,
	[SablonAd] [nvarchar](50) NOT NULL,
	[Aciklama] [nvarchar](250) NULL,
 CONSTRAINT [PK_TblDesignSablonlar] PRIMARY KEY CLUSTERED 
(
	[SablonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [snlg_V1].[TblDiller]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [snlg_V1].[TblDiller](
	[DId] [smallint] NOT NULL,
	[Name] [varchar](15) NOT NULL,
	[LongName] [nvarchar](50) NULL,
	[Aktif] [bit] NOT NULL CONSTRAINT [DF__TblDiller__Aktif__4A8310C6]  DEFAULT ((0)),
 CONSTRAINT [PK_TblDiller] PRIMARY KEY CLUSTERED 
(
	[DId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [snlg_V1].[TblDuyuruApp]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [snlg_V1].[TblDuyuruApp](
	[DuyuruId] [int] IDENTITY(1,1) NOT NULL,
	[Tarih] [date] NULL CONSTRAINT [DF_TblDuyuruApp_Tarih]  DEFAULT (getdate()),
	[Resim] [varchar](500) NULL,
	[Gorunurluk] [tinyint] NOT NULL CONSTRAINT [DF_TblDuyuruApp_Gorunurluk]  DEFAULT ((1)),
	[AramaIndex] [bit] NOT NULL CONSTRAINT [DF__TblDuyuru__Arama__4F47C5E3]  DEFAULT ((1)),
 CONSTRAINT [PK_TblDuyuruApp] PRIMARY KEY CLUSTERED 
(
	[DuyuruId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [snlg_V1].[TblDuyuruDetay]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [snlg_V1].[TblDuyuruDetay](
	[DuyuruId] [int] NOT NULL,
	[Dil] [smallint] NOT NULL,
	[SeoUrl] [nvarchar](500) NULL,
	[Baslik] [nvarchar](150) NULL,
	[Duyuru] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [snlg_V1].[TblEPostaSablon]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [snlg_V1].[TblEPostaSablon](
	[EPId] [int] IDENTITY(1,1) NOT NULL,
	[Anahtar] [nvarchar](50) NOT NULL,
	[Kimden] [varchar](250) NULL,
	[KimdenIsim] [nvarchar](250) NULL,
	[Kime] [varchar](250) NULL,
	[Konu] [nvarchar](250) NULL,
	[Mesaj] [nvarchar](max) NULL,
	[Aciklama] [nvarchar](250) NULL,
	[Bilgi] [nvarchar](max) NULL,
	[SmtpPsw] [nvarchar](150) NULL,
	[SmtpPort] [varchar](50) NULL,
	[SmtpHost] [nvarchar](250) NULL,
	[Ssl_] [bit] NULL,
 CONSTRAINT [PK_TblEPostaSablon] PRIMARY KEY CLUSTERED 
(
	[EPId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [snlg_V1].[TblEtkinlikApp]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [snlg_V1].[TblEtkinlikApp](
	[EtkinlikId] [int] IDENTITY(1,1) NOT NULL,
	[Tarih1] [smalldatetime] NOT NULL CONSTRAINT [DF_TblEtkinlikApp_Tarih]  DEFAULT (getdate()),
	[Tarih2] [smalldatetime] NULL,
	[Resim] [varchar](250) NULL,
 CONSTRAINT [PK_TblEtkinlikApp] PRIMARY KEY CLUSTERED 
(
	[EtkinlikId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [snlg_V1].[TblEtkinlikDetay]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [snlg_V1].[TblEtkinlikDetay](
	[EtkinlikId] [int] NOT NULL,
	[Dil] [smallint] NOT NULL,
	[Baslik] [nvarchar](150) NOT NULL,
	[Detay] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [snlg_V1].[TblHaberApp]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [snlg_V1].[TblHaberApp](
	[HaberId] [int] IDENTITY(1,1) NOT NULL,
	[Tarih] [date] NULL CONSTRAINT [DF_TblHaberApp_Tarih]  DEFAULT (getdate()),
	[Resim] [varchar](250) NULL,
	[Gorunurluk] [tinyint] NOT NULL CONSTRAINT [DF_TblHaberApp_Gorunurluk]  DEFAULT ((1)),
	[AramaIndex] [bit] NOT NULL CONSTRAINT [DF__TblHaberA__Arama__5AB9788F]  DEFAULT ((1)),
 CONSTRAINT [PK_TblHaberApp] PRIMARY KEY CLUSTERED 
(
	[HaberId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [snlg_V1].[TblHaberDetay]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [snlg_V1].[TblHaberDetay](
	[HaberId] [int] NOT NULL,
	[Dil] [smallint] NOT NULL,
	[SeoUrl] [nvarchar](500) NULL,
	[Baslik] [nvarchar](150) NULL,
	[Bilgi] [nvarchar](750) NULL,
	[Haber] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [snlg_V1].[TblIlceler]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [snlg_V1].[TblIlceler](
	[IlceKod] [smallint] NOT NULL,
	[IlKod] [tinyint] NOT NULL,
	[Ilce] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TblIlceler] PRIMARY KEY CLUSTERED 
(
	[IlceKod] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [snlg_V1].[TblIller]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [snlg_V1].[TblIller](
	[IlKod] [tinyint] NOT NULL,
	[Il] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TblIller] PRIMARY KEY CLUSTERED 
(
	[IlKod] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [snlg_V1].[TblMahalle]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [snlg_V1].[TblMahalle](
	[MahalleId] [int] IDENTITY(1,1) NOT NULL,
	[IlceKod] [smallint] NOT NULL,
	[Mahalle] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TblMahalle] PRIMARY KEY CLUSTERED 
(
	[MahalleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [snlg_V1].[TblMakale_Kategori]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [snlg_V1].[TblMakale_Kategori](
	[MakId] [int] NOT NULL,
	[KtgId] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [snlg_V1].[TblMakaleApp]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [snlg_V1].[TblMakaleApp](
	[MakId] [int] IDENTITY(1,1) NOT NULL,
	[Sira] [smallint] NULL CONSTRAINT [DF_TblMakaleApp_Sira]  DEFAULT ((255)),
	[Tarih] [date] NULL CONSTRAINT [DF_TblMakaleApp_Tarih]  DEFAULT (getdate()),
	[YazarId] [int] NULL,
	[Resim] [varchar](250) NULL,
	[Gorunurluk] [tinyint] NOT NULL CONSTRAINT [DF_TblMakaleApp_Gorunurluk]  DEFAULT ((1)),
	[AramaIndex] [bit] NOT NULL CONSTRAINT [DF__TblMakale__Arama__681373AD]  DEFAULT ((1)),
 CONSTRAINT [PK_TblMakaleApp] PRIMARY KEY CLUSTERED 
(
	[MakId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [snlg_V1].[TblMakaleDetay]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [snlg_V1].[TblMakaleDetay](
	[MakId] [int] NOT NULL,
	[Dil] [smallint] NOT NULL,
	[SeoUrl] [nvarchar](500) NULL,
	[Baslik] [nvarchar](250) NULL,
	[Bilgi] [nvarchar](750) NULL,
	[Icerik] [nvarchar](max) NULL,
	[Keyword] [nvarchar](500) NULL,
	[Descr] [nvarchar](500) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [snlg_V1].[TblMakaleKtgApp]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [snlg_V1].[TblMakaleKtgApp](
	[KtgId] [int] IDENTITY(234,1) NOT NULL,
	[UstId] [int] NULL,
	[Sira] [int] NULL CONSTRAINT [DF_TblIcerikKtgApp_Sira]  DEFAULT ((255)),
	[Aktif] [bit] NOT NULL,
	[Resim] [varchar](250) NULL,
 CONSTRAINT [PK_TblIcerikKtgApp] PRIMARY KEY CLUSTERED 
(
	[KtgId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [snlg_V1].[TblMakaleKtgDetay]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [snlg_V1].[TblMakaleKtgDetay](
	[KtgId] [int] NOT NULL,
	[Dil] [smallint] NOT NULL,
	[SeoUrl] [nvarchar](500) NULL,
	[KtgAd] [nvarchar](200) NULL,
	[Keyword] [nvarchar](500) NULL,
	[Descr] [nvarchar](500) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [snlg_V1].[TblMakalePuan]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [snlg_V1].[TblMakalePuan](
	[MakId] [int] NOT NULL,
	[IP] [nvarchar](30) NULL,
	[Puan] [tinyint] NOT NULL CONSTRAINT [DF_TblMakalePuan_Puan]  DEFAULT ((0)),
	[UyeId] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [snlg_V1].[TblMakaleYorum]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [snlg_V1].[TblMakaleYorum](
	[YId] [int] IDENTITY(123,1) NOT NULL,
	[UstYId] [int] NULL,
	[MakId] [int] NOT NULL,
	[Yorum] [nvarchar](max) NOT NULL,
	[Onay] [bit] NOT NULL,
	[EPosta] [varchar](150) NULL,
	[Yazan] [nvarchar](30) NULL,
	[UyeId] [int] NULL,
	[Tarih] [smalldatetime] NULL,
 CONSTRAINT [PK_TblMakaleYorum] PRIMARY KEY CLUSTERED 
(
	[YId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [snlg_V1].[TblMenuApp]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [snlg_V1].[TblMenuApp](
	[MenuId] [int] IDENTITY(1,1) NOT NULL,
	[UstId] [int] NULL,
	[Sira] [int] NULL CONSTRAINT [DF_TblMenuApp_Sira]  DEFAULT ((20)),
	[Aktif] [bit] NOT NULL,
	[Resim] [varchar](250) NULL,
	[Hedef] [varchar](25) NOT NULL CONSTRAINT [DF_TblMenuApp_Target]  DEFAULT ('s'),
	[UCId] [int] NOT NULL,
 CONSTRAINT [PK_TblMenuApp] PRIMARY KEY CLUSTERED 
(
	[MenuId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [snlg_V1].[TblMenuDetay]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [snlg_V1].[TblMenuDetay](
	[MenuId] [int] NOT NULL,
	[Dil] [smallint] NOT NULL,
	[MenuLink] [nvarchar](250) NULL,
	[MenuItem] [nvarchar](150) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [snlg_V1].[TblParaBirimleri]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [snlg_V1].[TblParaBirimleri](
	[PId] [tinyint] IDENTITY(1,1) NOT NULL,
	[Para] [nvarchar](50) NOT NULL,
	[Simge] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[PId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [snlg_V1].[TblPlaceHolders]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [snlg_V1].[TblPlaceHolders](
	[ContainerId] [smallint] IDENTITY(-32666,1) NOT NULL,
	[PHName] [nvarchar](100) NOT NULL,
	[Title] [nvarchar](100) NULL,
 CONSTRAINT [PK_TblContainers] PRIMARY KEY CLUSTERED 
(
	[ContainerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [snlg_V1].[TblProje_Kategori]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [snlg_V1].[TblProje_Kategori](
	[ProjeId] [int] NOT NULL,
	[KtgId] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [snlg_V1].[TblProjeAltBilgiApp]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [snlg_V1].[TblProjeAltBilgiApp](
	[ProjeAltId] [int] IDENTITY(1,1) NOT NULL,
	[ProjeId] [int] NOT NULL,
	[Sira] [tinyint] NULL CONSTRAINT [DF_TblProjeAltBilgiApp_Sira]  DEFAULT ((255)),
	[Gorunurluk] [tinyint] NOT NULL CONSTRAINT [DF_TblProjeAltBilgiApp_Gorunurluk_1]  DEFAULT ((1)),
	[AramaIndex] [bit] NOT NULL CONSTRAINT [DF__TblProjeA__Arama__7EF6D905]  DEFAULT ((1)),
 CONSTRAINT [PK_TblProjeAltBilgiApp] PRIMARY KEY CLUSTERED 
(
	[ProjeAltId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [snlg_V1].[TblProjeAltBilgiDetay]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [snlg_V1].[TblProjeAltBilgiDetay](
	[ProjeAltId] [int] NOT NULL,
	[Dil] [smallint] NOT NULL,
	[SeoUrl] [nvarchar](500) NULL,
	[Baslik] [nvarchar](250) NULL,
	[Icerik] [nvarchar](max) NULL,
	[Keyword] [nvarchar](500) NULL,
	[Descr] [nvarchar](500) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [snlg_V1].[TblProjeApp]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [snlg_V1].[TblProjeApp](
	[ProjeId] [int] IDENTITY(1,1) NOT NULL,
	[Sira] [tinyint] NULL CONSTRAINT [DF_TblProjeApp_Sira]  DEFAULT ((255)),
	[ProjeUrl] [varchar](260) NULL,
	[Resim] [varchar](250) NULL,
	[Aktif] [bit] NOT NULL CONSTRAINT [DF_TblProjeApp_Gorunurluk_1]  DEFAULT ((1)),
 CONSTRAINT [PK_TblProjeApp] PRIMARY KEY CLUSTERED 
(
	[ProjeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [snlg_V1].[TblProjeDetay]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [snlg_V1].[TblProjeDetay](
	[ProjeId] [int] NOT NULL,
	[Dil] [smallint] NOT NULL,
	[Baslik] [nvarchar](250) NULL,
	[Bilgi] [nvarchar](750) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [snlg_V1].[TblProjeKtgApp]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [snlg_V1].[TblProjeKtgApp](
	[KtgId] [int] IDENTITY(234,1) NOT NULL,
	[UstId] [int] NULL,
	[Sira] [tinyint] NULL CONSTRAINT [DF_TblProjeKtgApp_Sira]  DEFAULT ((255)),
	[Aktif] [bit] NOT NULL,
	[Resim] [varchar](250) NULL,
 CONSTRAINT [PK_TbProjeKtgApp] PRIMARY KEY CLUSTERED 
(
	[KtgId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [snlg_V1].[TblProjeKtgDetay]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [snlg_V1].[TblProjeKtgDetay](
	[KtgId] [int] NOT NULL,
	[Dil] [smallint] NOT NULL,
	[SeoUrl] [nvarchar](500) NULL,
	[KtgAd] [nvarchar](200) NULL,
	[Keyword] [nvarchar](500) NULL,
	[Descr] [nvarchar](500) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [snlg_V1].[TblReferansApp]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [snlg_V1].[TblReferansApp](
	[RId] [int] IDENTITY(1,1) NOT NULL,
	[Sira] [int] NULL,
	[KtgId] [int] NOT NULL,
	[Resim] [varchar](250) NULL,
	[Link] [varchar](250) NULL,
	[Firma] [varchar](250) NULL,
 CONSTRAINT [PK_TblReferansApp] PRIMARY KEY CLUSTERED 
(
	[RId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [snlg_V1].[TblReferansDetay]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [snlg_V1].[TblReferansDetay](
	[RId] [int] NULL,
	[Dil] [smallint] NOT NULL,
	[Bilgi] [nvarchar](500) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [snlg_V1].[TblReferansKtgApp]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [snlg_V1].[TblReferansKtgApp](
	[KtgId] [int] IDENTITY(1,1) NOT NULL,
	[_] [bit] NULL,
 CONSTRAINT [PK_TblReferansKtgApp] PRIMARY KEY CLUSTERED 
(
	[KtgId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [snlg_V1].[TblReferansKtgDetay]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [snlg_V1].[TblReferansKtgDetay](
	[KtgId] [int] NOT NULL,
	[Dil] [smallint] NOT NULL,
	[KtgAd] [varchar](150) NOT NULL,
	[SeoUrl] [varchar](500) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [snlg_V1].[TblResimGaleriApp]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [snlg_V1].[TblResimGaleriApp](
	[GId] [int] IDENTITY(1,1) NOT NULL,
	[GaleriAd] [varchar](150) NOT NULL,
 CONSTRAINT [PK_TblGaleriler] PRIMARY KEY CLUSTERED 
(
	[GId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [snlg_V1].[TblResimGaleriResimlerApp]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [snlg_V1].[TblResimGaleriResimlerApp](
	[RId] [int] IDENTITY(1,1) NOT NULL,
	[GId] [int] NOT NULL,
	[Sira] [smallint] NULL,
	[Resim] [varchar](250) NULL,
	[LinkUrl] [varchar](500) NULL,
 CONSTRAINT [PK_TblResimGaleriResimler] PRIMARY KEY CLUSTERED 
(
	[RId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [snlg_V1].[TblResimGaleriResimlerDetay]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [snlg_V1].[TblResimGaleriResimlerDetay](
	[RId] [int] NOT NULL,
	[Dil] [smallint] NOT NULL,
	[Baslik] [nvarchar](150) NULL,
	[Bilgi] [nvarchar](500) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [snlg_V1].[TblRol_Uye]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [snlg_V1].[TblRol_Uye](
	[RolId] [smallint] NOT NULL,
	[UyeId] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [snlg_V1].[TblRol_Yetki]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [snlg_V1].[TblRol_Yetki](
	[YetkiId] [int] NOT NULL,
	[RolId] [smallint] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [snlg_V1].[TblRoller]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [snlg_V1].[TblRoller](
	[RolId] [smallint] IDENTITY(1,1) NOT NULL,
	[RolAd] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TblRoller] PRIMARY KEY CLUSTERED 
(
	[RolId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [snlg_V1].[TblSablon_Modul]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [snlg_V1].[TblSablon_Modul](
	[AnahtarId] [smallint] IDENTITY(-32000,1) NOT NULL,
	[SablonAnahtar] [varchar](50) NOT NULL,
	[SablonId] [smallint] NOT NULL,
	[Aciklama] [varchar](250) NULL,
 CONSTRAINT [PK_TblSabitSablonlar] PRIMARY KEY CLUSTERED 
(
	[AnahtarId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [snlg_V1].[TblSayfaApp]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [snlg_V1].[TblSayfaApp](
	[SayfaId] [int] IDENTITY(234,1) NOT NULL,
	[SAd] [varchar](205) NOT NULL,
	[Gorunurluk] [tinyint] NOT NULL CONSTRAINT [DF_TblSayfaApp_Gorunurluk]  DEFAULT ((1)),
	[SablonId] [smallint] NOT NULL,
	[AramaIndex] [bit] NOT NULL CONSTRAINT [DF__TblSayfaA__Arama__345EC57D]  DEFAULT ((1)),
 CONSTRAINT [PK_Table_1_1] PRIMARY KEY CLUSTERED 
(
	[SayfaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [snlg_V1].[TblSayfaDetay]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [snlg_V1].[TblSayfaDetay](
	[SayfaId] [int] NOT NULL,
	[DId] [smallint] NOT NULL,
	[SeoUrl] [nvarchar](250) NULL,
	[Icerik] [nvarchar](max) NULL,
	[Title] [nvarchar](500) NULL,
	[Descr] [nvarchar](500) NULL,
	[Keyword] [nvarchar](500) NULL,
	[PageContentTitle] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [snlg_V1].[TblSiteLinkleri]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [snlg_V1].[TblSiteLinkleri](
	[SeoUrl] [varchar](750) NULL,
	[Id] [int] NOT NULL,
	[Dil] [int] NULL,
	[UrlAnahtar] [varchar](50) NULL,
	[SablonAnahtar] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [snlg_V1].[TblUCApp]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [snlg_V1].[TblUCApp](
	[UCId] [int] IDENTITY(1,1) NOT NULL,
	[UCPath] [nvarchar](250) NULL,
	[BaslikGorunsun] [bit] NOT NULL CONSTRAINT [DF_TblUCApp_BaslikGorunsun]  DEFAULT ((1)),
	[Gorunurluk] [tinyint] NOT NULL CONSTRAINT [DF_TblDesignUserControls_Gorunurluk]  DEFAULT ((1)),
	[Aciklama] [varchar](500) NULL,
	[Title] [nvarchar](100) NOT NULL,
	[BlokType] [varchar](50) NOT NULL,
 CONSTRAINT [PK_TblUserControls] PRIMARY KEY CLUSTERED 
(
	[UCId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [snlg_V1].[TblUcDetay]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [snlg_V1].[TblUcDetay](
	[UCId] [int] NOT NULL,
	[Dil] [smallint] NOT NULL,
	[Icerik] [nvarchar](max) NULL,
	[Baslik] [nvarchar](250) NULL,
	[BlokAltBilgi] [nvarchar](max) NULL,
	[BlokUstBilgi] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [snlg_V1].[TblUlke]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [snlg_V1].[TblUlke](
	[UId] [tinyint] IDENTITY(1,1) NOT NULL,
	[Ulke] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TblUlke] PRIMARY KEY CLUSTERED 
(
	[UId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [snlg_V1].[TblUrlKeys]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [snlg_V1].[TblUrlKeys](
	[UrlKeyID] [int] IDENTITY(1,1) NOT NULL,
	[UrlKeyName] [varchar](250) NOT NULL,
	[UrlKeyValue] [varchar](250) NOT NULL,
	[Dil] [smallint] NOT NULL,
 CONSTRAINT [PK_TblUrlKeys] PRIMARY KEY CLUSTERED 
(
	[UrlKeyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [snlg_V1].[TblUrun_Kategori]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [snlg_V1].[TblUrun_Kategori](
	[UrunId] [int] NOT NULL,
	[KtgId] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [snlg_V1].[TblUrunApp]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [snlg_V1].[TblUrunApp](
	[UrunId] [int] IDENTITY(123,1) NOT NULL,
	[Sira] [smallint] NULL CONSTRAINT [DF_TblUrunApp_Sira]  DEFAULT ((255)),
	[UrunKodu] [varchar](50) NULL,
	[Fiyat] [decimal](9, 2) NULL,
	[PId] [tinyint] NULL CONSTRAINT [DF_TblUrunApp_PId]  DEFAULT ((1)),
	[Gorunurluk] [tinyint] NOT NULL CONSTRAINT [DF_TblUrunApp_Gorunurluk]  DEFAULT ((1)),
	[Resim] [varchar](250) NULL,
	[AramaIndex] [bit] NOT NULL CONSTRAINT [DF__TblUrunAp__Arama__2DB1C7EE]  DEFAULT ((1)),
 CONSTRAINT [PK_TblUrunApp] PRIMARY KEY CLUSTERED 
(
	[UrunId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [snlg_V1].[TblUrunDetay]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [snlg_V1].[TblUrunDetay](
	[UrunId] [int] NOT NULL,
	[Dil] [smallint] NOT NULL,
	[SeoUrl] [nvarchar](500) NULL,
	[UrunAd] [nvarchar](250) NULL,
	[Bilgi] [nvarchar](750) NULL,
	[Detay] [nvarchar](max) NULL,
	[Keyword] [nvarchar](500) NULL,
	[Descr] [nvarchar](500) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [snlg_V1].[TblUrunKtgApp]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [snlg_V1].[TblUrunKtgApp](
	[KtgId] [int] IDENTITY(123,1) NOT NULL,
	[Sira] [tinyint] NULL CONSTRAINT [DF_TblKtgApp_Sira]  DEFAULT ((20)),
	[Resim] [varchar](250) NULL,
	[UstId] [int] NULL,
	[Aktif] [bit] NOT NULL CONSTRAINT [DF_TblKtgApp_Aktif]  DEFAULT ((1)),
 CONSTRAINT [PK_TblKtg] PRIMARY KEY CLUSTERED 
(
	[KtgId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [snlg_V1].[TblUrunKtgDetay]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [snlg_V1].[TblUrunKtgDetay](
	[KtgId] [int] NOT NULL,
	[Dil] [smallint] NOT NULL,
	[SeoUrl] [nvarchar](500) NULL,
	[KtgAd] [nvarchar](200) NULL,
	[Keyword] [nvarchar](500) NULL,
	[Descr] [nvarchar](500) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [snlg_V1].[TblUrunResim]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [snlg_V1].[TblUrunResim](
	[UrunId] [int] NOT NULL,
	[Sira] [smallint] NULL,
	[Resim] [varchar](250) NULL,
	[ResimId] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_TblUrunResim] PRIMARY KEY CLUSTERED 
(
	[ResimId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [snlg_V1].[TblUyeApp]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [snlg_V1].[TblUyeApp](
	[UyeId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](25) NULL,
	[Eposta] [varchar](150) NULL,
	[Sifre] [varchar](128) NULL,
	[HataSay] [tinyint] NULL CONSTRAINT [DF_TblUyeler_HataSay]  DEFAULT ((0)),
	[UyelikTarihi] [date] NULL CONSTRAINT [DF_TblUyeler_UyelikTarihi]  DEFAULT (getdate()),
	[Aktif] [bit] NULL CONSTRAINT [DF_TblUyeler_Aktif]  DEFAULT ((1)),
	[SeoUrl] [varchar](35) NULL,
	[LoginGuid] [uniqueidentifier] NULL CONSTRAINT [DF_TblUyeApp_LoginGuid_1]  DEFAULT (newid()),
	[SifreUnuttumGuid] [nvarchar](max) NULL,
 CONSTRAINT [PK_TblUyeApp_UyeId] PRIMARY KEY NONCLUSTERED 
(
	[UyeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [snlg_V1].[TblUyeDetay]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [snlg_V1].[TblUyeDetay](
	[UyeId] [int] NOT NULL,
	[Firma] [nvarchar](200) NULL,
	[UyeAd] [nvarchar](75) NULL,
	[DTarih] [date] NULL,
	[EvTel] [varchar](20) NULL,
	[IsTel] [varchar](20) NULL,
	[CepTel] [varchar](20) NULL,
	[Faks] [varchar](20) NULL,
	[Adres] [nvarchar](250) NULL,
	[VDaire] [varchar](250) NULL,
	[VNo] [varchar](15) NULL,
	[TCNo] [char](11) NULL,
	[Resim] [varchar](250) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [snlg_V1].[TblUyeDetayDil]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [snlg_V1].[TblUyeDetayDil](
	[UyeId] [int] NOT NULL,
	[Dil] [smallint] NOT NULL,
	[UyeBilgi] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [snlg_V1].[TblVarsayilanResimler]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [snlg_V1].[TblVarsayilanResimler](
	[AnahtarId] [smallint] IDENTITY(-32000,1) NOT NULL,
	[ResimAnahtar] [nvarchar](50) NOT NULL,
	[ResimYol] [varchar](500) NULL,
	[Aciklama] [varchar](250) NULL,
 CONSTRAINT [PK_TblVarsayilanResimler] PRIMARY KEY CLUSTERED 
(
	[AnahtarId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [snlg_V1].[TblZiyaretciDefteri]    Script Date: 12.5.2016 20:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [snlg_V1].[TblZiyaretciDefteri](
	[YId] [int] IDENTITY(123,1) NOT NULL,
	[UstYId] [int] NULL,
	[Yazan] [nvarchar](30) NULL,
	[Baslik] [nvarchar](75) NULL,
	[Yorum] [nvarchar](1500) NOT NULL,
	[Onay] [bit] NOT NULL,
 CONSTRAINT [PK_TblZiyaretciDefteri] PRIMARY KEY CLUSTERED 
(
	[YId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [snlg_V1].[TblAnketCevap]  WITH CHECK ADD  CONSTRAINT [FK_TblAnketCevap_TblAnketApp_AnketId] FOREIGN KEY([AnketId])
REFERENCES [snlg_V1].[TblAnketApp] ([AnketId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [snlg_V1].[TblAnketCevap] CHECK CONSTRAINT [FK_TblAnketCevap_TblAnketApp_AnketId]
GO
ALTER TABLE [snlg_V1].[TblAnketDetay]  WITH CHECK ADD  CONSTRAINT [FK_TblAnketler_TblAnketApp_AnketId] FOREIGN KEY([AnketId])
REFERENCES [snlg_V1].[TblAnketApp] ([AnketId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [snlg_V1].[TblAnketDetay] CHECK CONSTRAINT [FK_TblAnketler_TblAnketApp_AnketId]
GO
ALTER TABLE [snlg_V1].[TblAnketDetay]  WITH CHECK ADD  CONSTRAINT [FK_TblAnketler_TblDiller_DId] FOREIGN KEY([Dil])
REFERENCES [snlg_V1].[TblDiller] ([DId])
ON UPDATE CASCADE
GO
ALTER TABLE [snlg_V1].[TblAnketDetay] CHECK CONSTRAINT [FK_TblAnketler_TblDiller_DId]
GO
ALTER TABLE [snlg_V1].[TblBlockAttributeKeys]  WITH CHECK ADD  CONSTRAINT [FK_TblBlockAttributeKeys_TblUCApp] FOREIGN KEY([BlockID])
REFERENCES [snlg_V1].[TblUCApp] ([UCId])
ON DELETE CASCADE
GO
ALTER TABLE [snlg_V1].[TblBlockAttributeKeys] CHECK CONSTRAINT [FK_TblBlockAttributeKeys_TblUCApp]
GO
ALTER TABLE [snlg_V1].[TblBlockAttributeValues]  WITH CHECK ADD  CONSTRAINT [FK_TblBlockAttributeValues_TblDesignSablonIcerik] FOREIGN KEY([BlockPlaceID])
REFERENCES [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID])
ON DELETE CASCADE
GO
ALTER TABLE [snlg_V1].[TblBlockAttributeValues] CHECK CONSTRAINT [FK_TblBlockAttributeValues_TblDesignSablonIcerik]
GO
ALTER TABLE [snlg_V1].[TblDesignSablonIcerik]  WITH CHECK ADD  CONSTRAINT [FK_TblDesign_TblContainers] FOREIGN KEY([ContainerId])
REFERENCES [snlg_V1].[TblPlaceHolders] ([ContainerId])
ON DELETE CASCADE
GO
ALTER TABLE [snlg_V1].[TblDesignSablonIcerik] CHECK CONSTRAINT [FK_TblDesign_TblContainers]
GO
ALTER TABLE [snlg_V1].[TblDesignSablonIcerik]  WITH CHECK ADD  CONSTRAINT [FK_TblDesign_TblUserControls] FOREIGN KEY([UCId])
REFERENCES [snlg_V1].[TblUCApp] ([UCId])
ON DELETE CASCADE
GO
ALTER TABLE [snlg_V1].[TblDesignSablonIcerik] CHECK CONSTRAINT [FK_TblDesign_TblUserControls]
GO
ALTER TABLE [snlg_V1].[TblDesignSablonIcerik]  WITH CHECK ADD  CONSTRAINT [FK_TblDesignSablonIcerik_TblDesignSablonlar] FOREIGN KEY([SablonId])
REFERENCES [snlg_V1].[TblDesignSablonlar] ([SablonId])
ON DELETE CASCADE
GO
ALTER TABLE [snlg_V1].[TblDesignSablonIcerik] CHECK CONSTRAINT [FK_TblDesignSablonIcerik_TblDesignSablonlar]
GO
ALTER TABLE [snlg_V1].[TblDuyuruDetay]  WITH CHECK ADD  CONSTRAINT [FK_TblDuyurular_TblDiller_DId] FOREIGN KEY([Dil])
REFERENCES [snlg_V1].[TblDiller] ([DId])
ON UPDATE CASCADE
GO
ALTER TABLE [snlg_V1].[TblDuyuruDetay] CHECK CONSTRAINT [FK_TblDuyurular_TblDiller_DId]
GO
ALTER TABLE [snlg_V1].[TblDuyuruDetay]  WITH CHECK ADD  CONSTRAINT [FK_TblDuyurular_TblDuyuruApp_DuyuruId] FOREIGN KEY([DuyuruId])
REFERENCES [snlg_V1].[TblDuyuruApp] ([DuyuruId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [snlg_V1].[TblDuyuruDetay] CHECK CONSTRAINT [FK_TblDuyurular_TblDuyuruApp_DuyuruId]
GO
ALTER TABLE [snlg_V1].[TblEtkinlikDetay]  WITH CHECK ADD  CONSTRAINT [FK_TblEtkinlikler_TblDiller] FOREIGN KEY([Dil])
REFERENCES [snlg_V1].[TblDiller] ([DId])
GO
ALTER TABLE [snlg_V1].[TblEtkinlikDetay] CHECK CONSTRAINT [FK_TblEtkinlikler_TblDiller]
GO
ALTER TABLE [snlg_V1].[TblEtkinlikDetay]  WITH CHECK ADD  CONSTRAINT [FK_TblEtkinlikler_TblEtkinlikApp_EtkinlikId] FOREIGN KEY([EtkinlikId])
REFERENCES [snlg_V1].[TblEtkinlikApp] ([EtkinlikId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [snlg_V1].[TblEtkinlikDetay] CHECK CONSTRAINT [FK_TblEtkinlikler_TblEtkinlikApp_EtkinlikId]
GO
ALTER TABLE [snlg_V1].[TblHaberDetay]  WITH CHECK ADD  CONSTRAINT [FK_TblHaberler_TblDiller_DId] FOREIGN KEY([Dil])
REFERENCES [snlg_V1].[TblDiller] ([DId])
ON UPDATE CASCADE
GO
ALTER TABLE [snlg_V1].[TblHaberDetay] CHECK CONSTRAINT [FK_TblHaberler_TblDiller_DId]
GO
ALTER TABLE [snlg_V1].[TblHaberDetay]  WITH CHECK ADD  CONSTRAINT [FK_TblHaberler_TblHaberApp_HaberId] FOREIGN KEY([HaberId])
REFERENCES [snlg_V1].[TblHaberApp] ([HaberId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [snlg_V1].[TblHaberDetay] CHECK CONSTRAINT [FK_TblHaberler_TblHaberApp_HaberId]
GO
ALTER TABLE [snlg_V1].[TblIlceler]  WITH CHECK ADD  CONSTRAINT [FK_TblIlceler_TblIller_IlKod] FOREIGN KEY([IlKod])
REFERENCES [snlg_V1].[TblIller] ([IlKod])
ON UPDATE CASCADE
GO
ALTER TABLE [snlg_V1].[TblIlceler] CHECK CONSTRAINT [FK_TblIlceler_TblIller_IlKod]
GO
ALTER TABLE [snlg_V1].[TblMahalle]  WITH CHECK ADD  CONSTRAINT [FK_TblMahalle_TblIlceler] FOREIGN KEY([IlceKod])
REFERENCES [snlg_V1].[TblIlceler] ([IlceKod])
ON UPDATE CASCADE
GO
ALTER TABLE [snlg_V1].[TblMahalle] CHECK CONSTRAINT [FK_TblMahalle_TblIlceler]
GO
ALTER TABLE [snlg_V1].[TblMakale_Kategori]  WITH CHECK ADD  CONSTRAINT [FK_TblMakale_Kategori_TblMakaleApp] FOREIGN KEY([MakId])
REFERENCES [snlg_V1].[TblMakaleApp] ([MakId])
ON DELETE CASCADE
GO
ALTER TABLE [snlg_V1].[TblMakale_Kategori] CHECK CONSTRAINT [FK_TblMakale_Kategori_TblMakaleApp]
GO
ALTER TABLE [snlg_V1].[TblMakale_Kategori]  WITH CHECK ADD  CONSTRAINT [FK_TblMakale_Kategori_TblMakaleKtgApp] FOREIGN KEY([KtgId])
REFERENCES [snlg_V1].[TblMakaleKtgApp] ([KtgId])
GO
ALTER TABLE [snlg_V1].[TblMakale_Kategori] CHECK CONSTRAINT [FK_TblMakale_Kategori_TblMakaleKtgApp]
GO
ALTER TABLE [snlg_V1].[TblMakaleApp]  WITH NOCHECK ADD  CONSTRAINT [FK_TblMakaleApp_TblUyeler] FOREIGN KEY([YazarId])
REFERENCES [snlg_V1].[TblUyeApp] ([UyeId])
GO
ALTER TABLE [snlg_V1].[TblMakaleApp] CHECK CONSTRAINT [FK_TblMakaleApp_TblUyeler]
GO
ALTER TABLE [snlg_V1].[TblMakaleDetay]  WITH CHECK ADD  CONSTRAINT [FK_TblMakaleDetay_TblDiller_DId] FOREIGN KEY([Dil])
REFERENCES [snlg_V1].[TblDiller] ([DId])
ON UPDATE CASCADE
GO
ALTER TABLE [snlg_V1].[TblMakaleDetay] CHECK CONSTRAINT [FK_TblMakaleDetay_TblDiller_DId]
GO
ALTER TABLE [snlg_V1].[TblMakaleDetay]  WITH CHECK ADD  CONSTRAINT [FK_TblMakaleDetay_TblMakaleApp] FOREIGN KEY([MakId])
REFERENCES [snlg_V1].[TblMakaleApp] ([MakId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [snlg_V1].[TblMakaleDetay] CHECK CONSTRAINT [FK_TblMakaleDetay_TblMakaleApp]
GO
ALTER TABLE [snlg_V1].[TblMakaleKtgDetay]  WITH CHECK ADD  CONSTRAINT [FK_TblIcerikKtgler_TblIcerikKtgApp_KtgId_DId] FOREIGN KEY([Dil])
REFERENCES [snlg_V1].[TblDiller] ([DId])
ON UPDATE CASCADE
GO
ALTER TABLE [snlg_V1].[TblMakaleKtgDetay] CHECK CONSTRAINT [FK_TblIcerikKtgler_TblIcerikKtgApp_KtgId_DId]
GO
ALTER TABLE [snlg_V1].[TblMakaleKtgDetay]  WITH CHECK ADD  CONSTRAINT [FK_TblMakaleApp_TblMakaleKtgDetay] FOREIGN KEY([KtgId])
REFERENCES [snlg_V1].[TblMakaleKtgApp] ([KtgId])
ON DELETE CASCADE
GO
ALTER TABLE [snlg_V1].[TblMakaleKtgDetay] CHECK CONSTRAINT [FK_TblMakaleApp_TblMakaleKtgDetay]
GO
ALTER TABLE [snlg_V1].[TblMakalePuan]  WITH CHECK ADD  CONSTRAINT [FK_TblMakalePuan_TblMakaleApp] FOREIGN KEY([MakId])
REFERENCES [snlg_V1].[TblMakaleApp] ([MakId])
GO
ALTER TABLE [snlg_V1].[TblMakalePuan] CHECK CONSTRAINT [FK_TblMakalePuan_TblMakaleApp]
GO
ALTER TABLE [snlg_V1].[TblMakaleYorum]  WITH CHECK ADD  CONSTRAINT [FK_TblMakaleYorum_TblMakaleApp] FOREIGN KEY([MakId])
REFERENCES [snlg_V1].[TblMakaleApp] ([MakId])
GO
ALTER TABLE [snlg_V1].[TblMakaleYorum] CHECK CONSTRAINT [FK_TblMakaleYorum_TblMakaleApp]
GO
ALTER TABLE [snlg_V1].[TblMakaleYorum]  WITH CHECK ADD  CONSTRAINT [FK_TblMakaleYorum_TblMakaleYorum] FOREIGN KEY([UstYId])
REFERENCES [snlg_V1].[TblMakaleYorum] ([YId])
GO
ALTER TABLE [snlg_V1].[TblMakaleYorum] CHECK CONSTRAINT [FK_TblMakaleYorum_TblMakaleYorum]
GO
ALTER TABLE [snlg_V1].[TblMakaleYorum]  WITH NOCHECK ADD  CONSTRAINT [FK_TblMakaleYorum_TblUyeApp] FOREIGN KEY([UyeId])
REFERENCES [snlg_V1].[TblUyeApp] ([UyeId])
GO
ALTER TABLE [snlg_V1].[TblMakaleYorum] CHECK CONSTRAINT [FK_TblMakaleYorum_TblUyeApp]
GO
ALTER TABLE [snlg_V1].[TblMenuApp]  WITH CHECK ADD  CONSTRAINT [FK_TblMenuApp_TblMenuApp] FOREIGN KEY([UCId])
REFERENCES [snlg_V1].[TblUCApp] ([UCId])
ON DELETE CASCADE
GO
ALTER TABLE [snlg_V1].[TblMenuApp] CHECK CONSTRAINT [FK_TblMenuApp_TblMenuApp]
GO
ALTER TABLE [snlg_V1].[TblMenuApp]  WITH CHECK ADD  CONSTRAINT [FK_TblMenuApp_TblMenuApp1] FOREIGN KEY([MenuId])
REFERENCES [snlg_V1].[TblMenuApp] ([MenuId])
GO
ALTER TABLE [snlg_V1].[TblMenuApp] CHECK CONSTRAINT [FK_TblMenuApp_TblMenuApp1]
GO
ALTER TABLE [snlg_V1].[TblMenuDetay]  WITH CHECK ADD  CONSTRAINT [FK_TblMenuApp_TblMenuDetay] FOREIGN KEY([MenuId])
REFERENCES [snlg_V1].[TblMenuApp] ([MenuId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [snlg_V1].[TblMenuDetay] CHECK CONSTRAINT [FK_TblMenuApp_TblMenuDetay]
GO
ALTER TABLE [snlg_V1].[TblMenuDetay]  WITH CHECK ADD  CONSTRAINT [FK_TblMenuItem_TblDiller_DId] FOREIGN KEY([Dil])
REFERENCES [snlg_V1].[TblDiller] ([DId])
ON UPDATE CASCADE
GO
ALTER TABLE [snlg_V1].[TblMenuDetay] CHECK CONSTRAINT [FK_TblMenuItem_TblDiller_DId]
GO
ALTER TABLE [snlg_V1].[TblProje_Kategori]  WITH CHECK ADD  CONSTRAINT [FK_TblProje_Kategori_TblProjeApp] FOREIGN KEY([ProjeId])
REFERENCES [snlg_V1].[TblProjeApp] ([ProjeId])
ON DELETE CASCADE
GO
ALTER TABLE [snlg_V1].[TblProje_Kategori] CHECK CONSTRAINT [FK_TblProje_Kategori_TblProjeApp]
GO
ALTER TABLE [snlg_V1].[TblProje_Kategori]  WITH CHECK ADD  CONSTRAINT [FK_TblProje_Kategori_TblProjeKtgApp] FOREIGN KEY([KtgId])
REFERENCES [snlg_V1].[TblProjeKtgApp] ([KtgId])
GO
ALTER TABLE [snlg_V1].[TblProje_Kategori] CHECK CONSTRAINT [FK_TblProje_Kategori_TblProjeKtgApp]
GO
ALTER TABLE [snlg_V1].[TblProjeAltBilgiDetay]  WITH CHECK ADD  CONSTRAINT [PK_TblProjeAltBilgiDetay_TblDiller_DId] FOREIGN KEY([Dil])
REFERENCES [snlg_V1].[TblDiller] ([DId])
ON UPDATE CASCADE
GO
ALTER TABLE [snlg_V1].[TblProjeAltBilgiDetay] CHECK CONSTRAINT [PK_TblProjeAltBilgiDetay_TblDiller_DId]
GO
ALTER TABLE [snlg_V1].[TblProjeAltBilgiDetay]  WITH CHECK ADD  CONSTRAINT [PK_TblProjeAltBilgiDetay_TblProjeAltBilgieApp] FOREIGN KEY([ProjeAltId])
REFERENCES [snlg_V1].[TblProjeAltBilgiApp] ([ProjeAltId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [snlg_V1].[TblProjeAltBilgiDetay] CHECK CONSTRAINT [PK_TblProjeAltBilgiDetay_TblProjeAltBilgieApp]
GO
ALTER TABLE [snlg_V1].[TblProjeDetay]  WITH CHECK ADD  CONSTRAINT [PK_TblProjeDetay_TblDiller_DId] FOREIGN KEY([Dil])
REFERENCES [snlg_V1].[TblDiller] ([DId])
ON UPDATE CASCADE
GO
ALTER TABLE [snlg_V1].[TblProjeDetay] CHECK CONSTRAINT [PK_TblProjeDetay_TblDiller_DId]
GO
ALTER TABLE [snlg_V1].[TblProjeDetay]  WITH CHECK ADD  CONSTRAINT [PK_TblProjeDetay_TblProjeeApp] FOREIGN KEY([ProjeId])
REFERENCES [snlg_V1].[TblProjeApp] ([ProjeId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [snlg_V1].[TblProjeDetay] CHECK CONSTRAINT [PK_TblProjeDetay_TblProjeeApp]
GO
ALTER TABLE [snlg_V1].[TblProjeKtgDetay]  WITH CHECK ADD  CONSTRAINT [FK_TblProjeApp_TblProjeKtgDetay] FOREIGN KEY([KtgId])
REFERENCES [snlg_V1].[TblProjeKtgApp] ([KtgId])
ON DELETE CASCADE
GO
ALTER TABLE [snlg_V1].[TblProjeKtgDetay] CHECK CONSTRAINT [FK_TblProjeApp_TblProjeKtgDetay]
GO
ALTER TABLE [snlg_V1].[TblProjeKtgDetay]  WITH CHECK ADD  CONSTRAINT [PK_TblProjeKtgler_TblProjeKtgApp_KtgId_DId] FOREIGN KEY([Dil])
REFERENCES [snlg_V1].[TblDiller] ([DId])
ON UPDATE CASCADE
GO
ALTER TABLE [snlg_V1].[TblProjeKtgDetay] CHECK CONSTRAINT [PK_TblProjeKtgler_TblProjeKtgApp_KtgId_DId]
GO
ALTER TABLE [snlg_V1].[TblReferansApp]  WITH CHECK ADD  CONSTRAINT [FK_TblReferansApp_TblReferansKtgApp] FOREIGN KEY([KtgId])
REFERENCES [snlg_V1].[TblReferansKtgApp] ([KtgId])
GO
ALTER TABLE [snlg_V1].[TblReferansApp] CHECK CONSTRAINT [FK_TblReferansApp_TblReferansKtgApp]
GO
ALTER TABLE [snlg_V1].[TblReferansDetay]  WITH CHECK ADD  CONSTRAINT [FK_TblReferansDetay_TblDiller] FOREIGN KEY([Dil])
REFERENCES [snlg_V1].[TblDiller] ([DId])
ON UPDATE CASCADE
GO
ALTER TABLE [snlg_V1].[TblReferansDetay] CHECK CONSTRAINT [FK_TblReferansDetay_TblDiller]
GO
ALTER TABLE [snlg_V1].[TblReferansDetay]  WITH CHECK ADD  CONSTRAINT [FK_TblReferansDetay_TblReferansApp] FOREIGN KEY([RId])
REFERENCES [snlg_V1].[TblReferansApp] ([RId])
ON DELETE CASCADE
GO
ALTER TABLE [snlg_V1].[TblReferansDetay] CHECK CONSTRAINT [FK_TblReferansDetay_TblReferansApp]
GO
ALTER TABLE [snlg_V1].[TblReferansKtgDetay]  WITH CHECK ADD  CONSTRAINT [FK_TblReferansKtgDetay_TblDiller] FOREIGN KEY([Dil])
REFERENCES [snlg_V1].[TblDiller] ([DId])
ON UPDATE CASCADE
GO
ALTER TABLE [snlg_V1].[TblReferansKtgDetay] CHECK CONSTRAINT [FK_TblReferansKtgDetay_TblDiller]
GO
ALTER TABLE [snlg_V1].[TblReferansKtgDetay]  WITH CHECK ADD  CONSTRAINT [FK_TblReferansKtgDetay_TblReferansKtgApp] FOREIGN KEY([KtgId])
REFERENCES [snlg_V1].[TblReferansKtgApp] ([KtgId])
ON DELETE CASCADE
GO
ALTER TABLE [snlg_V1].[TblReferansKtgDetay] CHECK CONSTRAINT [FK_TblReferansKtgDetay_TblReferansKtgApp]
GO
ALTER TABLE [snlg_V1].[TblResimGaleriResimlerApp]  WITH CHECK ADD  CONSTRAINT [FK_TblResimGaleriResimlerApp_TblResimGaleriApp] FOREIGN KEY([GId])
REFERENCES [snlg_V1].[TblResimGaleriApp] ([GId])
ON DELETE CASCADE
GO
ALTER TABLE [snlg_V1].[TblResimGaleriResimlerApp] CHECK CONSTRAINT [FK_TblResimGaleriResimlerApp_TblResimGaleriApp]
GO
ALTER TABLE [snlg_V1].[TblResimGaleriResimlerDetay]  WITH CHECK ADD  CONSTRAINT [FK_TblResimGaleriResimDetay_TblDiller] FOREIGN KEY([Dil])
REFERENCES [snlg_V1].[TblDiller] ([DId])
ON UPDATE CASCADE
GO
ALTER TABLE [snlg_V1].[TblResimGaleriResimlerDetay] CHECK CONSTRAINT [FK_TblResimGaleriResimDetay_TblDiller]
GO
ALTER TABLE [snlg_V1].[TblResimGaleriResimlerDetay]  WITH CHECK ADD  CONSTRAINT [FK_TblResimGaleriResimDetay_TblResimGaleriResimler] FOREIGN KEY([RId])
REFERENCES [snlg_V1].[TblResimGaleriResimlerApp] ([RId])
ON DELETE CASCADE
GO
ALTER TABLE [snlg_V1].[TblResimGaleriResimlerDetay] CHECK CONSTRAINT [FK_TblResimGaleriResimDetay_TblResimGaleriResimler]
GO
ALTER TABLE [snlg_V1].[TblRol_Uye]  WITH CHECK ADD  CONSTRAINT [FK_TblUye_Rol_TblUyeler] FOREIGN KEY([UyeId])
REFERENCES [snlg_V1].[TblUyeApp] ([UyeId])
ON DELETE CASCADE
GO
ALTER TABLE [snlg_V1].[TblRol_Uye] CHECK CONSTRAINT [FK_TblUye_Rol_TblUyeler]
GO
ALTER TABLE [snlg_V1].[TblRol_Uye]  WITH CHECK ADD  CONSTRAINT [FK_TblUye-Rol_TblRoller] FOREIGN KEY([RolId])
REFERENCES [snlg_V1].[TblRoller] ([RolId])
ON DELETE CASCADE
GO
ALTER TABLE [snlg_V1].[TblRol_Uye] CHECK CONSTRAINT [FK_TblUye-Rol_TblRoller]
GO
ALTER TABLE [snlg_V1].[TblRol_Yetki]  WITH CHECK ADD  CONSTRAINT [FK_TblRol_Yetki_TblAdminYetkiler] FOREIGN KEY([YetkiId])
REFERENCES [snlg_V1].[TblAdminYetkiler] ([YetkiId])
ON DELETE CASCADE
GO
ALTER TABLE [snlg_V1].[TblRol_Yetki] CHECK CONSTRAINT [FK_TblRol_Yetki_TblAdminYetkiler]
GO
ALTER TABLE [snlg_V1].[TblSablon_Modul]  WITH CHECK ADD  CONSTRAINT [FK_TblSablonlarSabitleri_TblDesignSablonlar] FOREIGN KEY([SablonId])
REFERENCES [snlg_V1].[TblDesignSablonlar] ([SablonId])
GO
ALTER TABLE [snlg_V1].[TblSablon_Modul] CHECK CONSTRAINT [FK_TblSablonlarSabitleri_TblDesignSablonlar]
GO
ALTER TABLE [snlg_V1].[TblSayfaApp]  WITH CHECK ADD  CONSTRAINT [FK_TblSayfaApp_TblDesignSablonlar] FOREIGN KEY([SablonId])
REFERENCES [snlg_V1].[TblDesignSablonlar] ([SablonId])
ON UPDATE CASCADE
GO
ALTER TABLE [snlg_V1].[TblSayfaApp] CHECK CONSTRAINT [FK_TblSayfaApp_TblDesignSablonlar]
GO
ALTER TABLE [snlg_V1].[TblSayfaDetay]  WITH CHECK ADD  CONSTRAINT [FK_TblDSyfIcerik_TblDiller_DId] FOREIGN KEY([DId])
REFERENCES [snlg_V1].[TblDiller] ([DId])
ON UPDATE CASCADE
GO
ALTER TABLE [snlg_V1].[TblSayfaDetay] CHECK CONSTRAINT [FK_TblDSyfIcerik_TblDiller_DId]
GO
ALTER TABLE [snlg_V1].[TblSayfaDetay]  WITH CHECK ADD  CONSTRAINT [FK_TblSyfIcerik_TblSyfApp_SId] FOREIGN KEY([SayfaId])
REFERENCES [snlg_V1].[TblSayfaApp] ([SayfaId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [snlg_V1].[TblSayfaDetay] CHECK CONSTRAINT [FK_TblSyfIcerik_TblSyfApp_SId]
GO
ALTER TABLE [snlg_V1].[TblUcDetay]  WITH CHECK ADD  CONSTRAINT [FK_TblDesignUcDetay_TblDesignUC] FOREIGN KEY([UCId])
REFERENCES [snlg_V1].[TblUCApp] ([UCId])
ON DELETE CASCADE
GO
ALTER TABLE [snlg_V1].[TblUcDetay] CHECK CONSTRAINT [FK_TblDesignUcDetay_TblDesignUC]
GO
ALTER TABLE [snlg_V1].[TblUcDetay]  WITH CHECK ADD  CONSTRAINT [FK_TblUcDetay_TblDiller] FOREIGN KEY([Dil])
REFERENCES [snlg_V1].[TblDiller] ([DId])
ON UPDATE CASCADE
GO
ALTER TABLE [snlg_V1].[TblUcDetay] CHECK CONSTRAINT [FK_TblUcDetay_TblDiller]
GO
ALTER TABLE [snlg_V1].[TblUrlKeys]  WITH CHECK ADD  CONSTRAINT [FK_TblUrlKeys_TblDiller] FOREIGN KEY([Dil])
REFERENCES [snlg_V1].[TblDiller] ([DId])
ON DELETE CASCADE
GO
ALTER TABLE [snlg_V1].[TblUrlKeys] CHECK CONSTRAINT [FK_TblUrlKeys_TblDiller]
GO
ALTER TABLE [snlg_V1].[TblUrun_Kategori]  WITH CHECK ADD  CONSTRAINT [FK_TblUrun_Kategori_TblUrunApp] FOREIGN KEY([UrunId])
REFERENCES [snlg_V1].[TblUrunApp] ([UrunId])
ON DELETE CASCADE
GO
ALTER TABLE [snlg_V1].[TblUrun_Kategori] CHECK CONSTRAINT [FK_TblUrun_Kategori_TblUrunApp]
GO
ALTER TABLE [snlg_V1].[TblUrun_Kategori]  WITH CHECK ADD  CONSTRAINT [FK_TblUrun_Kategori_TblUrunKtgApp] FOREIGN KEY([KtgId])
REFERENCES [snlg_V1].[TblUrunKtgApp] ([KtgId])
GO
ALTER TABLE [snlg_V1].[TblUrun_Kategori] CHECK CONSTRAINT [FK_TblUrun_Kategori_TblUrunKtgApp]
GO
ALTER TABLE [snlg_V1].[TblUrunDetay]  WITH CHECK ADD  CONSTRAINT [FK_TblUrunDetay_TblDiller_DId] FOREIGN KEY([Dil])
REFERENCES [snlg_V1].[TblDiller] ([DId])
ON UPDATE CASCADE
GO
ALTER TABLE [snlg_V1].[TblUrunDetay] CHECK CONSTRAINT [FK_TblUrunDetay_TblDiller_DId]
GO
ALTER TABLE [snlg_V1].[TblUrunDetay]  WITH CHECK ADD  CONSTRAINT [FK_TblUrunDetay_TblUrunApp_UrunId] FOREIGN KEY([UrunId])
REFERENCES [snlg_V1].[TblUrunApp] ([UrunId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [snlg_V1].[TblUrunDetay] CHECK CONSTRAINT [FK_TblUrunDetay_TblUrunApp_UrunId]
GO
ALTER TABLE [snlg_V1].[TblUrunKtgApp]  WITH CHECK ADD  CONSTRAINT [FK_TblUrunKtgApp_TblUrunKtgApp] FOREIGN KEY([UstId])
REFERENCES [snlg_V1].[TblUrunKtgApp] ([KtgId])
GO
ALTER TABLE [snlg_V1].[TblUrunKtgApp] CHECK CONSTRAINT [FK_TblUrunKtgApp_TblUrunKtgApp]
GO
ALTER TABLE [snlg_V1].[TblUrunKtgDetay]  WITH CHECK ADD  CONSTRAINT [FK_TblKtgler_TblDiller_DId] FOREIGN KEY([Dil])
REFERENCES [snlg_V1].[TblDiller] ([DId])
ON UPDATE CASCADE
GO
ALTER TABLE [snlg_V1].[TblUrunKtgDetay] CHECK CONSTRAINT [FK_TblKtgler_TblDiller_DId]
GO
ALTER TABLE [snlg_V1].[TblUrunKtgDetay]  WITH CHECK ADD  CONSTRAINT [FK_TblUrunKtgApp_TblUrunKtgDetay] FOREIGN KEY([KtgId])
REFERENCES [snlg_V1].[TblUrunKtgApp] ([KtgId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [snlg_V1].[TblUrunKtgDetay] CHECK CONSTRAINT [FK_TblUrunKtgApp_TblUrunKtgDetay]
GO
ALTER TABLE [snlg_V1].[TblUrunResim]  WITH CHECK ADD  CONSTRAINT [FK_TblUrunResim_TblUrunApp_UrunId] FOREIGN KEY([UrunId])
REFERENCES [snlg_V1].[TblUrunApp] ([UrunId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [snlg_V1].[TblUrunResim] CHECK CONSTRAINT [FK_TblUrunResim_TblUrunApp_UrunId]
GO
ALTER TABLE [snlg_V1].[TblUyeDetay]  WITH CHECK ADD  CONSTRAINT [FK_TblUyeDetay_TblUyeler] FOREIGN KEY([UyeId])
REFERENCES [snlg_V1].[TblUyeApp] ([UyeId])
ON DELETE CASCADE
GO
ALTER TABLE [snlg_V1].[TblUyeDetay] CHECK CONSTRAINT [FK_TblUyeDetay_TblUyeler]
GO
ALTER TABLE [snlg_V1].[TblUyeDetayDil]  WITH CHECK ADD  CONSTRAINT [FK_TblUyeDetayDil_TblDiller] FOREIGN KEY([Dil])
REFERENCES [snlg_V1].[TblDiller] ([DId])
GO
ALTER TABLE [snlg_V1].[TblUyeDetayDil] CHECK CONSTRAINT [FK_TblUyeDetayDil_TblDiller]
GO
ALTER TABLE [snlg_V1].[TblUyeDetayDil]  WITH CHECK ADD  CONSTRAINT [FK_TblYazarDetay_TblUyeler] FOREIGN KEY([UyeId])
REFERENCES [snlg_V1].[TblUyeApp] ([UyeId])
GO
ALTER TABLE [snlg_V1].[TblUyeDetayDil] CHECK CONSTRAINT [FK_TblYazarDetay_TblUyeler]
GO
ALTER TABLE [snlg_V1].[TblZiyaretciDefteri]  WITH CHECK ADD  CONSTRAINT [FK_TblZiyaretciDefteri_TblZiyaretciDefteri] FOREIGN KEY([UstYId])
REFERENCES [snlg_V1].[TblZiyaretciDefteri] ([YId])
GO
ALTER TABLE [snlg_V1].[TblZiyaretciDefteri] CHECK CONSTRAINT [FK_TblZiyaretciDefteri_TblZiyaretciDefteri]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1=Herkese
2=Üyelere
3=Üye olmayanlara, 4= hiç kimse görmesin' , @level0type=N'SCHEMA',@level0name=N'snlg_V1', @level1type=N'TABLE',@level1name=N'TblAnketApp', @level2type=N'COLUMN',@level2name=N'Gorunurluk'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1=Herkese
2=Üyelere
3=Üye olmayanlara, 4= hiç kimse görmesin' , @level0type=N'SCHEMA',@level0name=N'snlg_V1', @level1type=N'TABLE',@level1name=N'TblDuyuruApp', @level2type=N'COLUMN',@level2name=N'Gorunurluk'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1=Herkese
2=Üyelere
3=Üye olmayanlara, 4= hiç kimse görmesin' , @level0type=N'SCHEMA',@level0name=N'snlg_V1', @level1type=N'TABLE',@level1name=N'TblHaberApp', @level2type=N'COLUMN',@level2name=N'Gorunurluk'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1=Herkese
2=Üyelere
3=Üye olmayanlara, 4= hiç kimse görmesin' , @level0type=N'SCHEMA',@level0name=N'snlg_V1', @level1type=N'TABLE',@level1name=N'TblMakaleApp', @level2type=N'COLUMN',@level2name=N'Gorunurluk'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1=Herkese
2=Üyelere
3=Üye olmayanlara, 4= hiç kimse görmesin' , @level0type=N'SCHEMA',@level0name=N'snlg_V1', @level1type=N'TABLE',@level1name=N'TblProjeAltBilgiApp', @level2type=N'COLUMN',@level2name=N'Gorunurluk'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1=Herkese
2=Üyelere
3=Üye olmayanlara, 4= hiç kimse görmesin' , @level0type=N'SCHEMA',@level0name=N'snlg_V1', @level1type=N'TABLE',@level1name=N'TblProjeApp', @level2type=N'COLUMN',@level2name=N'Aktif'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1=Herkese
2=Üyelere
3=Üye olmayanlara, 4= hiç kimse görmesin' , @level0type=N'SCHEMA',@level0name=N'snlg_V1', @level1type=N'TABLE',@level1name=N'TblSayfaApp', @level2type=N'COLUMN',@level2name=N'Gorunurluk'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ucname boş ise resim yok demektir ' , @level0type=N'SCHEMA',@level0name=N'snlg_V1', @level1type=N'TABLE',@level1name=N'TblUCApp', @level2type=N'COLUMN',@level2name=N'UCPath'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1=Herkese
2=Üyelere
3=Üye olmayanlara, 4=Kimseye Görünmesin' , @level0type=N'SCHEMA',@level0name=N'snlg_V1', @level1type=N'TABLE',@level1name=N'TblUCApp', @level2type=N'COLUMN',@level2name=N'Gorunurluk'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1=Herkese
2=Üyelere
3=Üye olmayanlara, 4= hiç kimse görmesin' , @level0type=N'SCHEMA',@level0name=N'snlg_V1', @level1type=N'TABLE',@level1name=N'TblUrunApp', @level2type=N'COLUMN',@level2name=N'Gorunurluk'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'buraya sadece uzantı yazılacak resim adı yorumId olacak' , @level0type=N'SCHEMA',@level0name=N'snlg_V1', @level1type=N'TABLE',@level1name=N'TblUyeDetayDil', @level2type=N'COLUMN',@level2name=N'UyeBilgi'
GO
