DELETE FROM [snlg_V1].[TblZiyaretciDefteri]
GO
DELETE FROM [snlg_V1].[TblVarsayilanResimler]
GO
DELETE FROM [snlg_V1].[TblUlke]
GO
DELETE FROM [snlg_V1].[TblSiteLinkleri]
GO
DELETE FROM [snlg_V1].[TblParaBirimleri]
GO
DELETE FROM [snlg_V1].[TblEPostaSablon]
GO
DELETE FROM [snlg_V1].[TblDegiskenler]
GO
DELETE FROM [snlg_V1].[TblAramaMotoru]
GO
DELETE FROM [snlg_V1].[TblBlockAttributeValues]
GO
DELETE FROM [snlg_V1].[TblBlockAttributeKeys]
GO
DELETE FROM [snlg_V1].[TblMahalle]
GO
DELETE FROM [snlg_V1].[TblIlceler]
GO
DELETE FROM [snlg_V1].[TblIller]
GO
DELETE FROM [snlg_V1].[TblUyeDetay]
GO
DELETE FROM [snlg_V1].[TblRol_Uye]
GO
DELETE FROM [snlg_V1].[TblRoller]
GO
DELETE FROM [snlg_V1].[TblSablon_Modul]
GO
DELETE FROM [snlg_V1].[TblDesignSablonIcerik]
GO
DELETE FROM [snlg_V1].[TblPlaceHolders]
GO
DELETE FROM [snlg_V1].[TblRol_Yetki]
GO
DELETE FROM [snlg_V1].[TblAdminYetkiler]
GO
DELETE FROM [snlg_V1].[TblAnketCevap]
GO
DELETE FROM [snlg_V1].[TblDuyuruDetay]
GO
DELETE FROM [snlg_V1].[TblDuyuruApp]
GO
DELETE FROM [snlg_V1].[TblSayfaDetay]
GO
DELETE FROM [snlg_V1].[TblSayfaApp]
GO
DELETE FROM [snlg_V1].[TblDesignSablonlar]
GO
DELETE FROM [snlg_V1].[TblAnketDetay]
GO
DELETE FROM [snlg_V1].[TblAnketApp]
GO
DELETE FROM [snlg_V1].[TblUyeDetayDil]
GO
DELETE FROM [snlg_V1].[TblUrlKeys]
GO
DELETE FROM [snlg_V1].[TblUcDetay]
GO
DELETE FROM [snlg_V1].[TblResimGaleriResimlerDetay]
GO
DELETE FROM [snlg_V1].[TblResimGaleriResimlerApp]
GO
DELETE FROM [snlg_V1].[TblResimGaleriApp]
GO
DELETE FROM [snlg_V1].[TblUrunKtgDetay]
GO
DELETE FROM [snlg_V1].[TblMakaleKtgDetay]
GO
DELETE FROM [snlg_V1].[TblHaberDetay]
GO
DELETE FROM [snlg_V1].[TblHaberApp]
GO
DELETE FROM [snlg_V1].[TblEtkinlikDetay]
GO
DELETE FROM [snlg_V1].[TblEtkinlikApp]
GO
DELETE FROM [snlg_V1].[TblReferansKtgDetay]
GO
DELETE FROM [snlg_V1].[TblProjeDetay]
GO
DELETE FROM [snlg_V1].[TblUrun_Kategori]
GO
DELETE FROM [snlg_V1].[TblUrunKtgApp]
GO
DELETE FROM [snlg_V1].[TblUrunDetay]
GO
DELETE FROM [snlg_V1].[TblUrunResim]
GO
DELETE FROM [snlg_V1].[TblUrunApp]
GO
DELETE FROM [snlg_V1].[TblProjeAltBilgiDetay]
GO
DELETE FROM [snlg_V1].[TblProjeAltBilgiApp]
GO
DELETE FROM [snlg_V1].[TblMenuDetay]
GO
DELETE FROM [snlg_V1].[TblMenuApp]
GO
DELETE FROM [snlg_V1].[TblUCApp]
GO
DELETE FROM [snlg_V1].[TblProje_Kategori]
GO
DELETE FROM [snlg_V1].[TblProjeApp]
GO
DELETE FROM [snlg_V1].[TblProjeKtgDetay]
GO
DELETE FROM [snlg_V1].[TblProjeKtgApp]
GO
DELETE FROM [snlg_V1].[TblMakaleYorum]
GO
DELETE FROM [snlg_V1].[TblMakalePuan]
GO
DELETE FROM [snlg_V1].[TblMakale_Kategori]
GO
DELETE FROM [snlg_V1].[TblMakaleKtgApp]
GO
DELETE FROM [snlg_V1].[TblMakaleDetay]
GO
DELETE FROM [snlg_V1].[TblMakaleApp]
GO
DELETE FROM [snlg_V1].[TblUyeApp]
GO
DELETE FROM [snlg_V1].[TblReferansDetay]
GO
DELETE FROM [snlg_V1].[TblDiller]
GO
DELETE FROM [snlg_V1].[TblReferansApp]
GO
DELETE FROM [snlg_V1].[TblReferansKtgApp]
GO
SET IDENTITY_INSERT [snlg_V1].[TblReferansKtgApp] ON 

GO
INSERT [snlg_V1].[TblReferansKtgApp] ([KtgId], [_]) VALUES (1, NULL)
GO
INSERT [snlg_V1].[TblReferansKtgApp] ([KtgId], [_]) VALUES (2, NULL)
GO
SET IDENTITY_INSERT [snlg_V1].[TblReferansKtgApp] OFF
GO
SET IDENTITY_INSERT [snlg_V1].[TblReferansApp] ON 

GO
INSERT [snlg_V1].[TblReferansApp] ([RId], [Sira], [KtgId], [Resim], [Link], [Firma]) VALUES (1, 5, 1, N'/uploads/images/referanslar/r14.gif', N'#', N'INTER ACTUAL')
GO
INSERT [snlg_V1].[TblReferansApp] ([RId], [Sira], [KtgId], [Resim], [Link], [Firma]) VALUES (2, 6, 1, N'/uploads/images/referanslar/r13.gif', N'#', N'SPEEDO')
GO
INSERT [snlg_V1].[TblReferansApp] ([RId], [Sira], [KtgId], [Resim], [Link], [Firma]) VALUES (3, 3, 1, N'/uploads/images/referanslar/r12.gif', N'#', N'UBF')
GO
INSERT [snlg_V1].[TblReferansApp] ([RId], [Sira], [KtgId], [Resim], [Link], [Firma]) VALUES (6, 7, 1, N'/uploads/images/referanslar/r11.gif', N'#', N'TELECOM')
GO
INSERT [snlg_V1].[TblReferansApp] ([RId], [Sira], [KtgId], [Resim], [Link], [Firma]) VALUES (7, 4, 1, N'/uploads/images/referanslar/r10.gif', N'#', N'PARS')
GO
INSERT [snlg_V1].[TblReferansApp] ([RId], [Sira], [KtgId], [Resim], [Link], [Firma]) VALUES (8, 2, 1, N'/uploads/images/referanslar/r1.gif', N'#', N'ARIBA')
GO
INSERT [snlg_V1].[TblReferansApp] ([RId], [Sira], [KtgId], [Resim], [Link], [Firma]) VALUES (11, 8, 1, N'/uploads/images/referanslar/r16.gif', N'#', N'TEN SQUARE')
GO
INSERT [snlg_V1].[TblReferansApp] ([RId], [Sira], [KtgId], [Resim], [Link], [Firma]) VALUES (12, 1, 1, N'/uploads/images/referanslar/r15.gif', N'#', N'KINTANA')
GO
INSERT [snlg_V1].[TblReferansApp] ([RId], [Sira], [KtgId], [Resim], [Link], [Firma]) VALUES (14, 6, 2, N'/uploads/images/referanslar/r13.gif', N'#', N'SPEEDO')
GO
INSERT [snlg_V1].[TblReferansApp] ([RId], [Sira], [KtgId], [Resim], [Link], [Firma]) VALUES (15, 7, 2, N'/uploads/images/referanslar/r12.gif', N'#', N'UBF')
GO
INSERT [snlg_V1].[TblReferansApp] ([RId], [Sira], [KtgId], [Resim], [Link], [Firma]) VALUES (16, 8, 2, N'/uploads/images/referanslar/r11.gif', N'#', N'TELECOM')
GO
INSERT [snlg_V1].[TblReferansApp] ([RId], [Sira], [KtgId], [Resim], [Link], [Firma]) VALUES (17, 1, 2, N'/uploads/images/referanslar/r10.gif', N'#', N'PARS')
GO
INSERT [snlg_V1].[TblReferansApp] ([RId], [Sira], [KtgId], [Resim], [Link], [Firma]) VALUES (19, 3, 2, N'/uploads/images/referanslar/r16.gif', N'#', N'TEN SQUARE')
GO
INSERT [snlg_V1].[TblReferansApp] ([RId], [Sira], [KtgId], [Resim], [Link], [Firma]) VALUES (20, 5, 2, N'/uploads/images/referanslar/r15.gif', N'#', N'KINTANA')
GO
INSERT [snlg_V1].[TblReferansApp] ([RId], [Sira], [KtgId], [Resim], [Link], [Firma]) VALUES (21, 4, 2, N'/uploads/images/referanslar/r14.gif', N'#', N'INTER ACTUAL')
GO
SET IDENTITY_INSERT [snlg_V1].[TblReferansApp] OFF
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (1, N'ar', N'العربية', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (2, N'bg', N'български', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (3, N'ca', N'català', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (4, N'zh-CHS', N'中文(简体)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (5, N'cs', N'čeština', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (6, N'da', N'dansk', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (7, N'de', N'Deutsch', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (8, N'el', N'ελληνικά', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (9, N'en', N'English', 1)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (10, N'es', N'español', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (11, N'fi', N'suomi', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (12, N'fr', N'français', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (13, N'he', N'עברית', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (14, N'hu', N'magyar', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (15, N'is', N'íslenska', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (16, N'it', N'italiano', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (17, N'ja', N'日本語', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (18, N'ko', N'한국어', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (19, N'nl', N'Nederlands', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (20, N'no', N'norsk', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (21, N'pl', N'polski', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (22, N'pt', N'Português', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (24, N'ro', N'română', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (25, N'ru', N'русский', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (26, N'hr', N'hrvatski', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (27, N'sk', N'slovenčina', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (28, N'sq', N'shqipe', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (29, N'sv', N'svenska', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (30, N'th', N'ไทย', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (31, N'tr', N'Türkçe', 1)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (32, N'ur', N'اُردو', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (33, N'id', N'Bahasa Indonesia', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (34, N'uk', N'україньска', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (35, N'be', N'Беларускі', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (36, N'sl', N'slovenski', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (37, N'et', N'eesti', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (38, N'lv', N'latviešu', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (39, N'lt', N'lietuvių', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (41, N'fa', N'فارسى', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (42, N'vi', N'Tiếng Việt', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (43, N'hy', N'Հայերեն', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (44, N'az', N'Azərbaycan­ılı', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (45, N'eu', N'euskara', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (47, N'mk', N'македонски јазик', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (54, N'af', N'Afrikaans', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (55, N'ka', N'ქართული', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (56, N'fo', N'føroyskt', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (57, N'hi', N'हिंदी', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (62, N'ms', N'Bahasa Malaysia', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (63, N'kk', N'Қазащb', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (64, N'ky', N'Кыргыз', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (65, N'sw', N'Kiswahili', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (67, N'uz', N'U''zbek', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (68, N'tt', N'Татар', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (70, N'pa', N'ਪੰਜਾਬੀ', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (71, N'gu', N'ગુજરાતી', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (73, N'ta', N'தமிழ்', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (74, N'te', N'తెలుగు', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (75, N'kn', N'ಕನ್ನಡ', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (78, N'mr', N'मराठी', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (79, N'sa', N'संस्कृत', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (80, N'mn', N'Монгол хэл', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (86, N'gl', N'galego', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (87, N'kok', N'कोंकणी', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (90, N'syr', N'ܣܘܪܝܝܐ', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (101, N'dv', N'ދިވެހިބަސް', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (1025, N'ar-SA', N'العربية (المملكة العربية السعودية)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (1026, N'bg-BG', N'български (България)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (1027, N'ca-ES', N'català (català)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (1028, N'zh-TW', N'中文(台灣)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (1029, N'cs-CZ', N'čeština (Česká republika)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (1030, N'da-DK', N'dansk (Danmark)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (1031, N'de-DE', N'Deutsch (Deutschland)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (1032, N'el-GR', N'ελληνικά (Ελλάδα)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (1033, N'en-US', N'Englisih (USA)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (1035, N'fi-FI', N'suomi (Suomi)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (1036, N'fr-FR', N'français (France)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (1037, N'he-IL', N'עברית (ישראל)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (1038, N'hu-HU', N'magyar (Magyarország)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (1039, N'is-IS', N'íslenska (Ísland)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (1040, N'it-IT', N'italiano (Italia)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (1041, N'ja-JP', N'日本語 (日本)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (1042, N'ko-KR', N'한국어 (대한민국)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (1043, N'nl-NL', N'Nederlands (Nederland)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (1044, N'nb-NO', N'norsk, bokmål (Norge)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (1045, N'pl-PL', N'polski (Polska)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (1046, N'pt-BR', N'Português (Brasil)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (1047, N'rm-CH', N'Rumantsch (Svizra)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (1048, N'ro-RO', N'română (România)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (1049, N'ru-RU', N'русский (Россия)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (1050, N'hr-HR', N'hrvatski (Hrvatska)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (1051, N'sk-SK', N'slovenčina (Slovenská republika)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (1052, N'sq-AL', N'shqipe (Shqipëria)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (1053, N'sv-SE', N'svenska (Sverige)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (1054, N'th-TH', N'ไทย (ไทย)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (1055, N'tr-TR', N'Türkçe (Türkiye)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (1056, N'ur-PK', N'اُردو (پاکستان)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (1057, N'id-ID', N'Bahasa Indonesia (Indonesia)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (1058, N'uk-UA', N'україньска (Україна)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (1059, N'be-BY', N'Беларускі (Беларусь)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (1060, N'sl-SI', N'slovenski (Slovenija)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (1061, N'et-EE', N'eesti (Eesti)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (1062, N'lv-LV', N'latviešu (Latvija)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (1063, N'lt-LT', N'lietuvių (Lietuva)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (1064, N'tg-Cyrl-TJ', N'Тоҷикӣ (Тоҷикистон)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (1065, N'fa-IR', N'فارسى (ايران)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (1066, N'vi-VN', N'Tiếng Việt (Việt Nam)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (1067, N'hy-AM', N'Հայերեն (Հայաստան)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (1068, N'az-Latn-AZ', N'Azərbaycan­ılı (Azərbaycanca)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (1069, N'eu-ES', N'euskara (euskara)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (1070, N'hsb-DE', N'hornjoserbšćina (Němska)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (1071, N'mk-MK', N'македонски јазик (Македонија)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (1074, N'tn-ZA', N'Setswana (Aforika Borwa)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (1076, N'xh-ZA', N'isiXhosa (uMzantsi Afrika)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (1077, N'zu-ZA', N'isiZulu (iNingizimu Afrika)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (1078, N'af-ZA', N'Afrikaans (Suid Afrika)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (1079, N'ka-GE', N'ქართული (საქართველო)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (1080, N'fo-FO', N'føroyskt (Føroyar)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (1081, N'hi-IN', N'हिंदी (भारत)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (1082, N'mt-MT', N'Malti (Malta)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (1083, N'se-NO', N'davvisámegiella (Norga)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (1086, N'ms-MY', N'Bahasa Malaysia (Malaysia)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (1087, N'kk-KZ', N'Қазақ (Қазақстан)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (1088, N'ky-KG', N'Кыргыз (Кыргызстан)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (1089, N'sw-KE', N'Kiswahili (Kenya)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (1090, N'tk-TM', N'türkmençe (Türkmenistan)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (1091, N'uz-Latn-UZ', N'U''zbek (U''zbekiston Respublikasi)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (1092, N'tt-RU', N'Татар (Россия)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (1093, N'bn-IN', N'বাংলা (ভারত)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (1094, N'pa-IN', N'ਪੰਜਾਬੀ (ਭਾਰਤ)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (1095, N'gu-IN', N'ગુજરાતી (ભારત)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (1096, N'or-IN', N'ଓଡ଼ିଆ (ଭାରତ)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (1097, N'ta-IN', N'தமிழ் (இந்தியா)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (1098, N'te-IN', N'తెలుగు (భారత దేశం)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (1099, N'kn-IN', N'ಕನ್ನಡ (ಭಾರತ)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (1100, N'ml-IN', N'മലയാളം (ഭാരതം)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (1101, N'as-IN', N'অসমীয়া (ভাৰত)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (1102, N'mr-IN', N'मराठी (भारत)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (1103, N'sa-IN', N'संस्कृत (भारतम्)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (1104, N'mn-MN', N'Монгол хэл (Монгол улс)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (1105, N'bo-CN', N'བོད་ཡིག (ཀྲུང་ཧྭ་མི་དམངས་སྤྱི་མཐུན་རྒྱལ་ཁབ།)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (1106, N'cy-GB', N'Cymraeg (y Deyrnas Unedig)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (1107, N'km-KH', N'ខ្មែរ (កម្ពុជា)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (1108, N'lo-LA', N'ລາວ (ສ.ປ.ປ. ລາວ)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (1110, N'gl-ES', N'galego (galego)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (1111, N'kok-IN', N'कोंकणी (भारत)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (1114, N'syr-SY', N'ܣܘܪܝܝܐ (سوريا)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (1115, N'si-LK', N'සිංහ (ශ්‍රී ලංකා)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (1117, N'iu-Cans-CA', N'ᐃᓄᒃᑎᑐᑦ (ᑲᓇᑕ)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (1118, N'am-ET', N'አማርኛ (ኢትዮጵያ)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (1121, N'ne-NP', N'नेपाली (नेपाल)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (1122, N'fy-NL', N'Frysk (Nederlân)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (1123, N'ps-AF', N'پښتو (افغانستان)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (1124, N'fil-PH', N'Filipino (Pilipinas)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (1125, N'dv-MV', N'ދިވެހިބަސް (ދިވެހި ރާއްޖެ)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (1128, N'ha-Latn-NG', N'Hausa (Nigeria)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (1130, N'yo-NG', N'Yoruba (Nigeria)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (1131, N'quz-BO', N'runasimi (Bolivia Suyu)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (1132, N'nso-ZA', N'Sesotho sa Leboa (Afrika Borwa)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (1133, N'ba-RU', N'Башҡорт (Россия)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (1134, N'lb-LU', N'Lëtzebuergesch (Luxembourg)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (1135, N'kl-GL', N'kalaallisut (Kalaallit Nunaat)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (1136, N'ig-NG', N'Igbo (Nigeria)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (1144, N'ii-CN', N'ꆈꌠꁱꂷ (ꍏꉸꏓꂱꇭꉼꇩ)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (1146, N'arn-CL', N'Mapudungun (Chile)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (1148, N'moh-CA', N'Kanien''kéha (Canada)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (1150, N'br-FR', N'brezhoneg (Frañs)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (1152, N'ug-CN', N'ئۇيغۇر يېزىقى (جۇڭخۇا خەلق جۇمھۇرىيىتى)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (1153, N'mi-NZ', N'Reo Māori (Aotearoa)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (1154, N'oc-FR', N'Occitan (França)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (1155, N'co-FR', N'Corsu (France)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (1156, N'gsw-FR', N'Elsässisch (Frànkrisch)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (1157, N'sah-RU', N'саха (Россия)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (1158, N'qut-GT', N'K''iche (Guatemala)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (1159, N'rw-RW', N'Kinyarwanda (Rwanda)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (1160, N'wo-SN', N'Wolof (Sénégal)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (1164, N'prs-AF', N'درى (افغانستان)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (2049, N'ar-IQ', N'العربية (العراق)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (2052, N'zh-CN', N'中文(中华人民共和国)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (2055, N'de-CH', N'Deutsch (Schweiz)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (2057, N'en-GB', N'English (United Kingdom)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (2058, N'es-MX', N'Español (México)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (2060, N'fr-BE', N'français (Belgique)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (2064, N'it-CH', N'italiano (Svizzera)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (2067, N'nl-BE', N'Nederlands (België)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (2068, N'nn-NO', N'norsk, nynorsk (Noreg)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (2070, N'pt-PT', N'português (Portugal)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (2074, N'sr-Latn-CS', N'srpski (Srbija)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (2077, N'sv-FI', N'svenska (Finland)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (2092, N'az-Cyrl-AZ', N'Азәрбајҹан (Азәрбајҹан)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (2094, N'dsb-DE', N'dolnoserbšćina (Nimska)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (2107, N'se-SE', N'davvisámegiella (Ruoŧŧa)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (2108, N'ga-IE', N'Gaeilge (Éire)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (2110, N'ms-BN', N'Bahasa Malaysia (Brunei Darussalam)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (2115, N'uz-Cyrl-UZ', N'Ўзбек (Ўзбекистон)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (2117, N'bn-BD', N'বাংলা (বাংলাদেশ)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (2128, N'mn-Mong-CN', N'ᠮᠤᠨᠭᠭᠤᠯ ᠬᠡᠯᠡ (ᠪᠦᠭᠦᠳᠡ ᠨᠠᠢᠷᠠᠮᠳᠠᠬᠤ ᠳᠤᠮᠳᠠᠳᠤ ᠠᠷᠠᠳ ᠣᠯᠣᠰ)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (2141, N'iu-Latn-CA', N'Inuktitut (Kanatami) (kanata)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (2143, N'tzm-Latn-DZ', N'Tamazight (Djazaïr)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (2155, N'quz-EC', N'runasimi (Ecuador Suyu)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (3073, N'ar-EG', N'العربية (مصر)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (3076, N'zh-HK', N'中文 (香港特别行政區)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (3079, N'de-AT', N'Deutsch (Österreich)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (3081, N'en-AU', N'English (Australia)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (3082, N'es-ES', N'español (España)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (3084, N'fr-CA', N'français (Canada)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (3098, N'sr-Cyrl-CS', N'српски (Србија)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (3131, N'se-FI', N'davvisámegiella (Suopma)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (3179, N'quz-PE', N'runasimi (Peru Suyu)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (4097, N'ar-LY', N'العربية (ليبيا)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (4100, N'zh-SG', N'中文(新加坡)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (4103, N'de-LU', N'Deutsch (Luxemburg)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (4105, N'en-CA', N'English (Canada)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (4106, N'es-GT', N'Español (Guatemala)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (4108, N'fr-CH', N'français (Suisse)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (4122, N'hr-BA', N'hrvatski (Bosna i Hercegovina)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (4155, N'smj-NO', N'julevusámegiella (Vuodna)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (5121, N'ar-DZ', N'العربية (الجزائر)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (5124, N'zh-MO', N'中文(澳門特别行政區)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (5127, N'de-LI', N'Deutsch (Liechtenstein)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (5129, N'en-NZ', N'English (New Zealand)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (5130, N'es-CR', N'Español (Costa Rica)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (5132, N'fr-LU', N'français (Luxembourg)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (5146, N'bs-Latn-BA', N'bosanski (Bosna i Hercegovina)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (5179, N'smj-SE', N'julevusámegiella (Svierik)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (6145, N'ar-MA', N'العربية (المملكة المغربية)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (6153, N'en-IE', N'English (Eire)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (6154, N'es-PA', N'Español (Panamá)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (6156, N'fr-MC', N'français (Principauté de Monaco)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (6170, N'sr-Latn-BA', N'srpski (Bosna i Hercegovina)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (6203, N'sma-NO', N'åarjelsaemiengiele (Nöörje)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (7169, N'ar-TN', N'العربية (تونس)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (7177, N'en-ZA', N'English (South Africa)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (7178, N'es-DO', N'Español (República Dominicana)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (7194, N'sr-Cyrl-BA', N'српски (Босна и Херцеговина)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (7227, N'sma-SE', N'åarjelsaemiengiele (Sveerje)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (8193, N'ar-OM', N'العربية (عمان)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (8201, N'en-JM', N'English (Jamaica)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (8202, N'es-VE', N'Español (Republica Bolivariana de Venezuela)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (8218, N'bs-Cyrl-BA', N'босански (Босна и Херцеговина)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (8251, N'sms-FI', N'sääm´ǩiõll (Lää´ddjânnam)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (9217, N'ar-YE', N'العربية (اليمن)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (9225, N'en-029', N'English (Caribbean)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (9226, N'es-CO', N'Español (Colombia)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (9275, N'smn-FI', N'sämikielâ (Suomâ)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (10241, N'ar-SY', N'العربية (سوريا)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (10249, N'en-BZ', N'English (Belize)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (10250, N'es-PE', N'Español (Perú)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (11265, N'ar-JO', N'العربية (الأردن)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (11273, N'en-TT', N'English (Trinidad y Tobago)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (11274, N'es-AR', N'Español (Argentina)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (12289, N'ar-LB', N'العربية (لبنان)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (12297, N'en-ZW', N'English (Zimbabwe)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (12298, N'es-EC', N'Español (Ecuador)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (13313, N'ar-KW', N'العربية (الكويت)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (13321, N'en-PH', N'English (Philippines)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (13322, N'es-CL', N'Español (Chile)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (14337, N'ar-AE', N'العربية (الإمارات العربية المتحدة)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (14346, N'es-UY', N'Español (Uruguay)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (15361, N'ar-BH', N'العربية (البحرين)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (15370, N'es-PY', N'Español (Paraguay)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (16385, N'ar-QA', N'العربية (قطر)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (16393, N'en-IN', N'English (India)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (16394, N'es-BO', N'Español (Bolivia)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (17417, N'en-MY', N'English (Malaysia)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (17418, N'es-SV', N'Español (El Salvador)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (18441, N'en-SG', N'English (Singapore)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (18442, N'es-HN', N'Español (Honduras)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (19466, N'es-NI', N'Español (Nicaragua)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (20490, N'es-PR', N'Español (Puerto Rico)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (21514, N'es-US', N'Español (Estados Unidos)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (31748, N'zh-CHT', N'中文(繁體)', 0)
GO
INSERT [snlg_V1].[TblDiller] ([DId], [Name], [LongName], [Aktif]) VALUES (31770, N'sr', N'srpski', 0)
GO
INSERT [snlg_V1].[TblReferansDetay] ([RId], [Dil], [Bilgi]) VALUES (11, 31, NULL)
GO
INSERT [snlg_V1].[TblReferansDetay] ([RId], [Dil], [Bilgi]) VALUES (12, 31, NULL)
GO
INSERT [snlg_V1].[TblReferansDetay] ([RId], [Dil], [Bilgi]) VALUES (NULL, 31, N' SDFSDF SDF SD')
GO
INSERT [snlg_V1].[TblReferansDetay] ([RId], [Dil], [Bilgi]) VALUES (1, 31, NULL)
GO
INSERT [snlg_V1].[TblReferansDetay] ([RId], [Dil], [Bilgi]) VALUES (2, 31, NULL)
GO
INSERT [snlg_V1].[TblReferansDetay] ([RId], [Dil], [Bilgi]) VALUES (3, 31, NULL)
GO
INSERT [snlg_V1].[TblReferansDetay] ([RId], [Dil], [Bilgi]) VALUES (6, 31, NULL)
GO
INSERT [snlg_V1].[TblReferansDetay] ([RId], [Dil], [Bilgi]) VALUES (7, 31, NULL)
GO
INSERT [snlg_V1].[TblReferansDetay] ([RId], [Dil], [Bilgi]) VALUES (8, 31, NULL)
GO
INSERT [snlg_V1].[TblReferansDetay] ([RId], [Dil], [Bilgi]) VALUES (21, 31, NULL)
GO
INSERT [snlg_V1].[TblReferansDetay] ([RId], [Dil], [Bilgi]) VALUES (14, 31, NULL)
GO
INSERT [snlg_V1].[TblReferansDetay] ([RId], [Dil], [Bilgi]) VALUES (15, 31, NULL)
GO
INSERT [snlg_V1].[TblReferansDetay] ([RId], [Dil], [Bilgi]) VALUES (16, 31, NULL)
GO
INSERT [snlg_V1].[TblReferansDetay] ([RId], [Dil], [Bilgi]) VALUES (17, 31, NULL)
GO
INSERT [snlg_V1].[TblReferansDetay] ([RId], [Dil], [Bilgi]) VALUES (19, 31, NULL)
GO
INSERT [snlg_V1].[TblReferansDetay] ([RId], [Dil], [Bilgi]) VALUES (20, 31, NULL)
GO
SET IDENTITY_INSERT [snlg_V1].[TblUyeApp] ON 

GO
INSERT [snlg_V1].[TblUyeApp] ([UyeId], [UserName], [Eposta], [Sifre], [HataSay], [UyelikTarihi], [Aktif], [SeoUrl], [LoginGuid], [SifreUnuttumGuid]) VALUES (1, N'admin', N'demo@demo.com', N'21232f297a57a5a743894a0e4a801fc3', 0, CAST(N'2016-06-05' AS Date), 1, N'admin', N'9b95429d-701c-4b6b-bf04-7c232adee861', N'273e7dda-7529-469d-950a-55713378d404')
GO
SET IDENTITY_INSERT [snlg_V1].[TblUyeApp] OFF
GO
SET IDENTITY_INSERT [snlg_V1].[TblMakaleApp] ON 

GO
INSERT [snlg_V1].[TblMakaleApp] ([MakId], [Sira], [Tarih], [YazarId], [Resim], [Gorunurluk], [AramaIndex]) VALUES (43, 1, CAST(N'2016-09-10' AS Date), 1, N'/uploads/images/blog/3.jpg', 1, 1)
GO
INSERT [snlg_V1].[TblMakaleApp] ([MakId], [Sira], [Tarih], [YazarId], [Resim], [Gorunurluk], [AramaIndex]) VALUES (44, 3, CAST(N'2016-10-10' AS Date), 1, N'/uploads/images/blog/2.jpg', 1, 0)
GO
INSERT [snlg_V1].[TblMakaleApp] ([MakId], [Sira], [Tarih], [YazarId], [Resim], [Gorunurluk], [AramaIndex]) VALUES (51, 2, CAST(N'2016-02-04' AS Date), 1, N'/Uploads/Images/blog/1.jpg', 1, 0)
GO
SET IDENTITY_INSERT [snlg_V1].[TblMakaleApp] OFF
GO
INSERT [snlg_V1].[TblMakaleDetay] ([MakId], [Dil], [SeoUrl], [Baslik], [Bilgi], [Icerik], [Keyword], [Descr]) VALUES (43, 31, N'sea-erroribus-laboramus-scriptorem-tale-paulo-consulatu', N'Sea erroribus laboramus scriptorem, tale paulo consulatu', N'At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus.', N'Lorem ipsum dolor sit amet, ullum convenire vis in, vel ea eius impetus perfecto. Eum in pertinax salutandi scripserit, ne option nonumes luptatum per, sit unum fabulas temporibus ne. Suas rebum iisque his ei, at mea stet dicta. Est cu tibique temporibus. Qui ei graeco scribentur, mei dicat iuvaret alienum ea. Id elit concludaturque nam, partem eirmod imperdiet ne nam, nobis adipiscing ei vel. Quando aliquando ei sed, magna graece no eam. Ad quo dico natum diceret, minimum omittantur conclusionemque id eos. Cu purto viris labitur usu, te nec dicunt gubergren. Ludus efficiendi delicatissimi eos ex, movet vocent sensibus in mel. Bonorum veritus delicatissimi cum te, te probo partem vel, nec ei solum partiendo. Erroribus voluptaria dissentias his id, eum mucius meliore eu. Impedit commune qualisque usu ex, no sea erroribus laboramus scriptorem, tale paulo consulatu usu no. Ea audiam consulatu quaerendum eum, natum mundi euismod at sit. In equidem scripserit mea, nam mutat dicta verterem et. Prima ubique alterum eu sit, regione atomorum ne vel, an eros novum sadipscing duo. Vix ut persecuti ullamcorper, per no justo doming. Usu cu scaevola appellantur, ad aeque ludus mel, fierent adolescens mel at. Has luptatum splendide cu, nam prompta luptatum persequeris ut, imperdiet democritum has ne. Cu has illum augue, duo verear facilisi an, ei amet tacimates recteque pro. Eu ignota veritus his, summo melius no usu. Posse simul mei cu, mei epicuri vivendum in. His an ullum error delicatissimi, duo eu mazim nusquam. Vim eu quod duis eius, tale melius maiestatis mea te. Ne diam dicunt tincidunt has, quando admodum mandamus no vix. Has summo blandit aliquando ea. Usu odio quando facete ut, te usu epicuri adipisci moderatius.', N'App, PC', NULL)
GO
INSERT [snlg_V1].[TblMakaleDetay] ([MakId], [Dil], [SeoUrl], [Baslik], [Bilgi], [Icerik], [Keyword], [Descr]) VALUES (44, 31, N'these-cases-are-perfectly-simple-and-easy-to-distinguish', N'These cases are perfectly simple and easy to distinguish', N'These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best.', N'<p>On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain.</p>

<p>These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted.</p>

<p>The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.</p>
', N'App, Btt, Sanaloger', NULL)
GO
INSERT [snlg_V1].[TblMakaleDetay] ([MakId], [Dil], [SeoUrl], [Baslik], [Bilgi], [Icerik], [Keyword], [Descr]) VALUES (51, 31, N'duis-aute-irure-dolor-in-reprehenderit-in-voluptate-velit-esse-cillum-dolore', N'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore', N'On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. ', N'On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.', N'Hayat, Resim, Dünya', NULL)
GO
SET IDENTITY_INSERT [snlg_V1].[TblMakaleKtgApp] ON 

GO
INSERT [snlg_V1].[TblMakaleKtgApp] ([KtgId], [UstId], [Sira], [Aktif], [Resim]) VALUES (244, NULL, NULL, 1, NULL)
GO
INSERT [snlg_V1].[TblMakaleKtgApp] ([KtgId], [UstId], [Sira], [Aktif], [Resim]) VALUES (261, NULL, 2, 1, NULL)
GO
INSERT [snlg_V1].[TblMakaleKtgApp] ([KtgId], [UstId], [Sira], [Aktif], [Resim]) VALUES (270, NULL, 3, 1, NULL)
GO
SET IDENTITY_INSERT [snlg_V1].[TblMakaleKtgApp] OFF
GO
INSERT [snlg_V1].[TblMakale_Kategori] ([MakId], [KtgId]) VALUES (44, 261)
GO
INSERT [snlg_V1].[TblMakale_Kategori] ([MakId], [KtgId]) VALUES (43, 261)
GO
INSERT [snlg_V1].[TblMakale_Kategori] ([MakId], [KtgId]) VALUES (51, 244)
GO
INSERT [snlg_V1].[TblMakale_Kategori] ([MakId], [KtgId]) VALUES (51, 261)
GO
INSERT [snlg_V1].[TblMakalePuan] ([MakId], [IP], [Puan], [UyeId]) VALUES (44, N'212.156.122.166', 3, NULL)
GO
INSERT [snlg_V1].[TblMakalePuan] ([MakId], [IP], [Puan], [UyeId]) VALUES (43, N'88.248.108.66', 5, NULL)
GO
INSERT [snlg_V1].[TblMakalePuan] ([MakId], [IP], [Puan], [UyeId]) VALUES (43, N'::1', 5, NULL)
GO
INSERT [snlg_V1].[TblMakalePuan] ([MakId], [IP], [Puan], [UyeId]) VALUES (44, N'::1', 5, NULL)
GO
INSERT [snlg_V1].[TblMakalePuan] ([MakId], [IP], [Puan], [UyeId]) VALUES (44, N'91.93.126.254', 5, NULL)
GO
INSERT [snlg_V1].[TblMakalePuan] ([MakId], [IP], [Puan], [UyeId]) VALUES (44, NULL, 5, 1)
GO
SET IDENTITY_INSERT [snlg_V1].[TblMakaleYorum] ON 

GO
INSERT [snlg_V1].[TblMakaleYorum] ([YId], [UstYId], [MakId], [Yorum], [Onay], [EPosta], [Yazan], [UyeId], [Tarih]) VALUES (130, NULL, 44, N'cvxcxcvxc', 1, N'yasinbolat.designer@gmail.com', N'ysn', NULL, CAST(N'2016-10-09 19:21:00' AS SmallDateTime))
GO
INSERT [snlg_V1].[TblMakaleYorum] ([YId], [UstYId], [MakId], [Yorum], [Onay], [EPosta], [Yazan], [UyeId], [Tarih]) VALUES (151, NULL, 44, N'deneme', 1, NULL, NULL, 1, CAST(N'2016-01-05 15:10:00' AS SmallDateTime))
GO
INSERT [snlg_V1].[TblMakaleYorum] ([YId], [UstYId], [MakId], [Yorum], [Onay], [EPosta], [Yazan], [UyeId], [Tarih]) VALUES (152, NULL, 43, N'Voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.', 1, N'atifcndmr@gmail.com', N'Atıf Candemir', NULL, CAST(N'2016-02-07 16:22:00' AS SmallDateTime))
GO
INSERT [snlg_V1].[TblMakaleYorum] ([YId], [UstYId], [MakId], [Yorum], [Onay], [EPosta], [Yazan], [UyeId], [Tarih]) VALUES (153, 152, 43, N'fsdfdsffsdfdsfsdf', 0, N'aaa@aaa.aa', N'undefined', NULL, CAST(N'2016-02-07 20:16:00' AS SmallDateTime))
GO
SET IDENTITY_INSERT [snlg_V1].[TblMakaleYorum] OFF
GO
SET IDENTITY_INSERT [snlg_V1].[TblProjeKtgApp] ON 

GO
INSERT [snlg_V1].[TblProjeKtgApp] ([KtgId], [UstId], [Sira], [Aktif], [Resim]) VALUES (255, NULL, NULL, 1, NULL)
GO
INSERT [snlg_V1].[TblProjeKtgApp] ([KtgId], [UstId], [Sira], [Aktif], [Resim]) VALUES (264, NULL, NULL, 1, NULL)
GO
INSERT [snlg_V1].[TblProjeKtgApp] ([KtgId], [UstId], [Sira], [Aktif], [Resim]) VALUES (266, NULL, NULL, 1, NULL)
GO
SET IDENTITY_INSERT [snlg_V1].[TblProjeKtgApp] OFF
GO
INSERT [snlg_V1].[TblProjeKtgDetay] ([KtgId], [Dil], [SeoUrl], [KtgAd], [Keyword], [Descr]) VALUES (264, 31, N'devam-eden-projeler', N'Devam Eden Projeler', N'Proje', NULL)
GO
INSERT [snlg_V1].[TblProjeKtgDetay] ([KtgId], [Dil], [SeoUrl], [KtgAd], [Keyword], [Descr]) VALUES (266, 31, N'tamamlanan-projeler', N'Tamamlanan Projeler', NULL, NULL)
GO
INSERT [snlg_V1].[TblProjeKtgDetay] ([KtgId], [Dil], [SeoUrl], [KtgAd], [Keyword], [Descr]) VALUES (255, 31, N'yeni-baslanan-projeler', N'Yeni Başlanan Projeler', NULL, NULL)
GO
INSERT [snlg_V1].[TblProjeKtgDetay] ([KtgId], [Dil], [SeoUrl], [KtgAd], [Keyword], [Descr]) VALUES (255, 2057, NULL, N'Plugins', N'', N'')
GO
SET IDENTITY_INSERT [snlg_V1].[TblProjeApp] ON 

GO
INSERT [snlg_V1].[TblProjeApp] ([ProjeId], [Sira], [ProjeUrl], [Resim], [Aktif]) VALUES (26, 1, N'vitae-mondi-tanitim', N'/uploads/images/projeler/vitae-mondi/1.jpg', 1)
GO
INSERT [snlg_V1].[TblProjeApp] ([ProjeId], [Sira], [ProjeUrl], [Resim], [Aktif]) VALUES (30, 3, N'moda-palas-tanitim', N'/uploads/images/projeler/moda-palas/3.jpg', 1)
GO
INSERT [snlg_V1].[TblProjeApp] ([ProjeId], [Sira], [ProjeUrl], [Resim], [Aktif]) VALUES (31, 1, N'vertimos-tanitim', N'/uploads/images/projeler/vertimos/2.jpg', 1)
GO
SET IDENTITY_INSERT [snlg_V1].[TblProjeApp] OFF
GO
INSERT [snlg_V1].[TblProje_Kategori] ([ProjeId], [KtgId]) VALUES (31, 255)
GO
INSERT [snlg_V1].[TblProje_Kategori] ([ProjeId], [KtgId]) VALUES (30, 264)
GO
INSERT [snlg_V1].[TblProje_Kategori] ([ProjeId], [KtgId]) VALUES (26, 266)
GO
SET IDENTITY_INSERT [snlg_V1].[TblUCApp] ON 

GO
INSERT [snlg_V1].[TblUCApp] ([UCId], [UCPath], [BaslikGorunsun], [Gorunurluk], [Aciklama], [Title], [BlokType]) VALUES (-32612, N'general\polls', 1, 1, NULL, N'General - Polls', N'User Control')
GO
INSERT [snlg_V1].[TblUCApp] ([UCId], [UCPath], [BaslikGorunsun], [Gorunurluk], [Aciklama], [Title], [BlokType]) VALUES (-32611, N'announcement\announcements', 0, 1, NULL, N'Announcement - Announcements', N'User Control')
GO
INSERT [snlg_V1].[TblUCApp] ([UCId], [UCPath], [BaslikGorunsun], [Gorunurluk], [Aciklama], [Title], [BlokType]) VALUES (-32610, N'announcement\announcement-detail', 0, 1, NULL, N'Announcement - Announcement Detail', N'User Control')
GO
INSERT [snlg_V1].[TblUCApp] ([UCId], [UCPath], [BaslikGorunsun], [Gorunurluk], [Aciklama], [Title], [BlokType]) VALUES (-32609, N'announcement\latest-announcement', 0, 1, NULL, N'Announcement - Latest Announcement', N'User Control')
GO
INSERT [snlg_V1].[TblUCApp] ([UCId], [UCPath], [BaslikGorunsun], [Gorunurluk], [Aciklama], [Title], [BlokType]) VALUES (-32608, N'news\news', 0, 1, NULL, N'News - News', N'User Control')
GO
INSERT [snlg_V1].[TblUCApp] ([UCId], [UCPath], [BaslikGorunsun], [Gorunurluk], [Aciklama], [Title], [BlokType]) VALUES (-32607, N'news\news-detail', 0, 1, NULL, N'News - News Detail', N'User Control')
GO
INSERT [snlg_V1].[TblUCApp] ([UCId], [UCPath], [BaslikGorunsun], [Gorunurluk], [Aciklama], [Title], [BlokType]) VALUES (-32606, N'news\latest-news', 1, 1, NULL, N'News - Latest News', N'User Control')
GO
INSERT [snlg_V1].[TblUCApp] ([UCId], [UCPath], [BaslikGorunsun], [Gorunurluk], [Aciklama], [Title], [BlokType]) VALUES (-32605, N'general\contact-form', 1, 1, NULL, N'General - Contact Form', N'User Control')
GO
INSERT [snlg_V1].[TblUCApp] ([UCId], [UCPath], [BaslikGorunsun], [Gorunurluk], [Aciklama], [Title], [BlokType]) VALUES (-32603, N'general\page-content', 1, 1, NULL, N'General - Page Content', N'User Control')
GO
INSERT [snlg_V1].[TblUCApp] ([UCId], [UCPath], [BaslikGorunsun], [Gorunurluk], [Aciklama], [Title], [BlokType]) VALUES (-32602, N'guestbook\comments', 1, 1, NULL, N'Guestbook - Comments', N'User Control')
GO
INSERT [snlg_V1].[TblUCApp] ([UCId], [UCPath], [BaslikGorunsun], [Gorunurluk], [Aciklama], [Title], [BlokType]) VALUES (-32601, N'guestbook\new-comment', 1, 1, NULL, N'Guestbook - New Comment', N'User Control')
GO
INSERT [snlg_V1].[TblUCApp] ([UCId], [UCPath], [BaslikGorunsun], [Gorunurluk], [Aciklama], [Title], [BlokType]) VALUES (-32600, NULL, 0, 1, NULL, N'Logo', N'Content')
GO
INSERT [snlg_V1].[TblUCApp] ([UCId], [UCPath], [BaslikGorunsun], [Gorunurluk], [Aciklama], [Title], [BlokType]) VALUES (-32591, N'article\most-rated-articles', 1, 1, NULL, N'Article - Most Rated Articles', N'User Control')
GO
INSERT [snlg_V1].[TblUCApp] ([UCId], [UCPath], [BaslikGorunsun], [Gorunurluk], [Aciklama], [Title], [BlokType]) VALUES (-32590, N'article\most-reviewed-articles', 1, 1, NULL, N'Article - Most Reviewed Articles', N'User Control')
GO
INSERT [snlg_V1].[TblUCApp] ([UCId], [UCPath], [BaslikGorunsun], [Gorunurluk], [Aciklama], [Title], [BlokType]) VALUES (-32589, N'article\latest-articles', 1, 1, NULL, N'Article - Latest Articles', N'User Control')
GO
INSERT [snlg_V1].[TblUCApp] ([UCId], [UCPath], [BaslikGorunsun], [Gorunurluk], [Aciklama], [Title], [BlokType]) VALUES (-32588, N'article\recently-reviewed-articles', 1, 1, NULL, N'Article - Recently Reviewed Articles', N'User Control')
GO
INSERT [snlg_V1].[TblUCApp] ([UCId], [UCPath], [BaslikGorunsun], [Gorunurluk], [Aciklama], [Title], [BlokType]) VALUES (-32587, N'article\categories-articles', 0, 1, NULL, N'Article - Categories Articles', N'User Control')
GO
INSERT [snlg_V1].[TblUCApp] ([UCId], [UCPath], [BaslikGorunsun], [Gorunurluk], [Aciklama], [Title], [BlokType]) VALUES (-32582, N'article\article-detail', 1, 1, NULL, N'Article - Article Detail', N'User Control')
GO
INSERT [snlg_V1].[TblUCApp] ([UCId], [UCPath], [BaslikGorunsun], [Gorunurluk], [Aciklama], [Title], [BlokType]) VALUES (-32581, N'article\random-articles', 1, 1, NULL, N'Article - Random Articles', N'User Control')
GO
INSERT [snlg_V1].[TblUCApp] ([UCId], [UCPath], [BaslikGorunsun], [Gorunurluk], [Aciklama], [Title], [BlokType]) VALUES (-32580, N'article\comments', 1, 1, NULL, N'Article - Comments', N'User Control')
GO
INSERT [snlg_V1].[TblUCApp] ([UCId], [UCPath], [BaslikGorunsun], [Gorunurluk], [Aciklama], [Title], [BlokType]) VALUES (-32579, N'project\latest-projects', 1, 1, NULL, N'Project - Latest Projects', N'User Control')
GO
INSERT [snlg_V1].[TblUCApp] ([UCId], [UCPath], [BaslikGorunsun], [Gorunurluk], [Aciklama], [Title], [BlokType]) VALUES (-32578, N'project\projects', 0, 1, NULL, N'Project - Projects', N'User Control')
GO
INSERT [snlg_V1].[TblUCApp] ([UCId], [UCPath], [BaslikGorunsun], [Gorunurluk], [Aciklama], [Title], [BlokType]) VALUES (-32577, N'project\category-menu', 0, 1, NULL, N'Project - Category Menu', N'User Control')
GO
INSERT [snlg_V1].[TblUCApp] ([UCId], [UCPath], [BaslikGorunsun], [Gorunurluk], [Aciklama], [Title], [BlokType]) VALUES (-32576, N'project\project-detail', 0, 1, NULL, N'Project - Project Detail', N'User Control')
GO
INSERT [snlg_V1].[TblUCApp] ([UCId], [UCPath], [BaslikGorunsun], [Gorunurluk], [Aciklama], [Title], [BlokType]) VALUES (-32572, N'member\register', 1, 3, NULL, N'Member - Register', N'User Control')
GO
INSERT [snlg_V1].[TblUCApp] ([UCId], [UCPath], [BaslikGorunsun], [Gorunurluk], [Aciklama], [Title], [BlokType]) VALUES (-32571, N'portfolio\references', 0, 1, NULL, N'Portfolio - References', N'User Control')
GO
INSERT [snlg_V1].[TblUCApp] ([UCId], [UCPath], [BaslikGorunsun], [Gorunurluk], [Aciklama], [Title], [BlokType]) VALUES (-32570, N'portfolio\latest-references', 0, 1, NULL, N'Portfolio - Latest References', N'User Control')
GO
INSERT [snlg_V1].[TblUCApp] ([UCId], [UCPath], [BaslikGorunsun], [Gorunurluk], [Aciklama], [Title], [BlokType]) VALUES (-32568, N'article\new-comment-form', 1, 1, NULL, N'Article - New Comment Form', N'User Control')
GO
INSERT [snlg_V1].[TblUCApp] ([UCId], [UCPath], [BaslikGorunsun], [Gorunurluk], [Aciklama], [Title], [BlokType]) VALUES (-32562, N'product\latest-products', 1, 1, NULL, N'Product - Latest Products', N'User Control')
GO
INSERT [snlg_V1].[TblUCApp] ([UCId], [UCPath], [BaslikGorunsun], [Gorunurluk], [Aciklama], [Title], [BlokType]) VALUES (-32561, N'product\products', 0, 1, NULL, N'Product - Products', N'User Control')
GO
INSERT [snlg_V1].[TblUCApp] ([UCId], [UCPath], [BaslikGorunsun], [Gorunurluk], [Aciklama], [Title], [BlokType]) VALUES (-32557, N'product\categories-menu', 0, 1, NULL, N'Product - Categories Menu', N'User Control')
GO
INSERT [snlg_V1].[TblUCApp] ([UCId], [UCPath], [BaslikGorunsun], [Gorunurluk], [Aciklama], [Title], [BlokType]) VALUES (-32556, N'product\random-products', 1, 1, NULL, N'Product - Random Products', N'User Control')
GO
INSERT [snlg_V1].[TblUCApp] ([UCId], [UCPath], [BaslikGorunsun], [Gorunurluk], [Aciklama], [Title], [BlokType]) VALUES (-32555, N'product\product-detail', 0, 1, NULL, N'Product - Product Detail', N'User Control')
GO
INSERT [snlg_V1].[TblUCApp] ([UCId], [UCPath], [BaslikGorunsun], [Gorunurluk], [Aciklama], [Title], [BlokType]) VALUES (-32527, N'member\login', 1, 1, NULL, N'Member - Login', N'User Control')
GO
INSERT [snlg_V1].[TblUCApp] ([UCId], [UCPath], [BaslikGorunsun], [Gorunurluk], [Aciklama], [Title], [BlokType]) VALUES (-32522, N'general\events-calendar', 0, 1, NULL, N'General - Events Calendar', N'User Control')
GO
INSERT [snlg_V1].[TblUCApp] ([UCId], [UCPath], [BaslikGorunsun], [Gorunurluk], [Aciklama], [Title], [BlokType]) VALUES (-32493, N'general\language-menu', 0, 1, NULL, N'General - Language Menu', N'User Control')
GO
INSERT [snlg_V1].[TblUCApp] ([UCId], [UCPath], [BaslikGorunsun], [Gorunurluk], [Aciklama], [Title], [BlokType]) VALUES (-32482, N'article\articles', 0, 1, NULL, N'Article - Articles', N'User Control')
GO
INSERT [snlg_V1].[TblUCApp] ([UCId], [UCPath], [BaslikGorunsun], [Gorunurluk], [Aciklama], [Title], [BlokType]) VALUES (-32480, N'article\categories-list', 1, 1, NULL, N'Article - Categories List', N'User Control')
GO
INSERT [snlg_V1].[TblUCApp] ([UCId], [UCPath], [BaslikGorunsun], [Gorunurluk], [Aciklama], [Title], [BlokType]) VALUES (-32476, N'article\article-archive-list', 1, 1, NULL, N'Article - Article Archive List', N'User Control')
GO
INSERT [snlg_V1].[TblUCApp] ([UCId], [UCPath], [BaslikGorunsun], [Gorunurluk], [Aciklama], [Title], [BlokType]) VALUES (-32475, N'article\article-archive-detail', 0, 1, NULL, N'Article - Article Archive Detail', N'User Control')
GO
INSERT [snlg_V1].[TblUCApp] ([UCId], [UCPath], [BaslikGorunsun], [Gorunurluk], [Aciklama], [Title], [BlokType]) VALUES (-32435, N'member\member-profile', 1, 2, NULL, N'Member - Member Profile', N'User Control')
GO
INSERT [snlg_V1].[TblUCApp] ([UCId], [UCPath], [BaslikGorunsun], [Gorunurluk], [Aciklama], [Title], [BlokType]) VALUES (-32306, N'member\member-panel', 0, 2, NULL, N'Member - Member Panel', N'User Control')
GO
INSERT [snlg_V1].[TblUCApp] ([UCId], [UCPath], [BaslikGorunsun], [Gorunurluk], [Aciklama], [Title], [BlokType]) VALUES (-32303, N'article\author-detail', 1, 1, NULL, N'Article - Author Detail', N'User Control')
GO
INSERT [snlg_V1].[TblUCApp] ([UCId], [UCPath], [BaslikGorunsun], [Gorunurluk], [Aciklama], [Title], [BlokType]) VALUES (-32302, N'article\authors', 0, 1, NULL, N'Article - Authors', N'User Control')
GO
INSERT [snlg_V1].[TblUCApp] ([UCId], [UCPath], [BaslikGorunsun], [Gorunurluk], [Aciklama], [Title], [BlokType]) VALUES (-32198, NULL, 0, 1, N'Anasayfa Slayt Gösterisi', N'Slider - Home(Bootstrap)', N'Content')
GO
INSERT [snlg_V1].[TblUCApp] ([UCId], [UCPath], [BaslikGorunsun], [Gorunurluk], [Aciklama], [Title], [BlokType]) VALUES (-32092, NULL, 0, 1, NULL, N'Social Media', N'Content')
GO
INSERT [snlg_V1].[TblUCApp] ([UCId], [UCPath], [BaslikGorunsun], [Gorunurluk], [Aciklama], [Title], [BlokType]) VALUES (-32091, NULL, 0, 1, NULL, N'Copyright', N'Content')
GO
INSERT [snlg_V1].[TblUCApp] ([UCId], [UCPath], [BaslikGorunsun], [Gorunurluk], [Aciklama], [Title], [BlokType]) VALUES (1, NULL, 0, 1, NULL, N'Top Menü', N'Menu')
GO
INSERT [snlg_V1].[TblUCApp] ([UCId], [UCPath], [BaslikGorunsun], [Gorunurluk], [Aciklama], [Title], [BlokType]) VALUES (2, NULL, 0, 1, NULL, N'Footer Menü', N'Menu')
GO
INSERT [snlg_V1].[TblUCApp] ([UCId], [UCPath], [BaslikGorunsun], [Gorunurluk], [Aciklama], [Title], [BlokType]) VALUES (3, N'article\articles-list-by-tag', 0, 1, NULL, N'Article - Articles List By Tag', N'User Control')
GO
INSERT [snlg_V1].[TblUCApp] ([UCId], [UCPath], [BaslikGorunsun], [Gorunurluk], [Aciklama], [Title], [BlokType]) VALUES (21, N'member\password-reset', 1, 1, NULL, N'Member - Password Reset', N'User Control')
GO
INSERT [snlg_V1].[TblUCApp] ([UCId], [UCPath], [BaslikGorunsun], [Gorunurluk], [Aciklama], [Title], [BlokType]) VALUES (36, N'general\breadcrumbs', 0, 1, NULL, N'General - Breadcrumbs', N'User Control')
GO
INSERT [snlg_V1].[TblUCApp] ([UCId], [UCPath], [BaslikGorunsun], [Gorunurluk], [Aciklama], [Title], [BlokType]) VALUES (38, N'general\page-title', 0, 1, NULL, N'General - Page Title', N'User Control')
GO
INSERT [snlg_V1].[TblUCApp] ([UCId], [UCPath], [BaslikGorunsun], [Gorunurluk], [Aciklama], [Title], [BlokType]) VALUES (39, NULL, 0, 1, N'Foto Galeri Sayfası Slayt Gösterisi', N'Slider - Foto Galeri(Bootstrap Lighbox)', N'Content')
GO
INSERT [snlg_V1].[TblUCApp] ([UCId], [UCPath], [BaslikGorunsun], [Gorunurluk], [Aciklama], [Title], [BlokType]) VALUES (41, NULL, 0, 1, NULL, N'Hakkımızda Sol Menü', N'Menu')
GO
INSERT [snlg_V1].[TblUCApp] ([UCId], [UCPath], [BaslikGorunsun], [Gorunurluk], [Aciklama], [Title], [BlokType]) VALUES (45, N'general\share', 1, 1, NULL, N'General - Share', N'User Control')
GO
INSERT [snlg_V1].[TblUCApp] ([UCId], [UCPath], [BaslikGorunsun], [Gorunurluk], [Aciklama], [Title], [BlokType]) VALUES (46, N'member\members-edit', 1, 1, NULL, N'Member - Members Edit', N'User Control')
GO
INSERT [snlg_V1].[TblUCApp] ([UCId], [UCPath], [BaslikGorunsun], [Gorunurluk], [Aciklama], [Title], [BlokType]) VALUES (51, N'portfolio\reference-categories', 1, 1, NULL, N'Portfolio - Reference Categories', N'User Control')
GO
INSERT [snlg_V1].[TblUCApp] ([UCId], [UCPath], [BaslikGorunsun], [Gorunurluk], [Aciklama], [Title], [BlokType]) VALUES (52, N'article\random-authors', 1, 1, NULL, N'Article - Random Authors ', N'User Control')
GO
INSERT [snlg_V1].[TblUCApp] ([UCId], [UCPath], [BaslikGorunsun], [Gorunurluk], [Aciklama], [Title], [BlokType]) VALUES (53, N'article\most-tags', 1, 1, NULL, N'Article - Most Tags', N'User Control')
GO
INSERT [snlg_V1].[TblUCApp] ([UCId], [UCPath], [BaslikGorunsun], [Gorunurluk], [Aciklama], [Title], [BlokType]) VALUES (54, NULL, 0, 1, NULL, N'Footer iletişim', N'Content')
GO
SET IDENTITY_INSERT [snlg_V1].[TblUCApp] OFF
GO
SET IDENTITY_INSERT [snlg_V1].[TblMenuApp] ON 

GO
INSERT [snlg_V1].[TblMenuApp] ([MenuId], [UstId], [Sira], [Aktif], [Resim], [Hedef], [UCId]) VALUES (675, 675, 0, 1, NULL, N'_self', 1)
GO
INSERT [snlg_V1].[TblMenuApp] ([MenuId], [UstId], [Sira], [Aktif], [Resim], [Hedef], [UCId]) VALUES (678, NULL, 6, 1, NULL, N'_self', 1)
GO
INSERT [snlg_V1].[TblMenuApp] ([MenuId], [UstId], [Sira], [Aktif], [Resim], [Hedef], [UCId]) VALUES (681, 675, 1, 1, NULL, N'_self', 1)
GO
INSERT [snlg_V1].[TblMenuApp] ([MenuId], [UstId], [Sira], [Aktif], [Resim], [Hedef], [UCId]) VALUES (734, 675, 0, 1, NULL, N'_self', 1)
GO
INSERT [snlg_V1].[TblMenuApp] ([MenuId], [UstId], [Sira], [Aktif], [Resim], [Hedef], [UCId]) VALUES (742, NULL, 0, 1, NULL, N'_self', 1)
GO
INSERT [snlg_V1].[TblMenuApp] ([MenuId], [UstId], [Sira], [Aktif], [Resim], [Hedef], [UCId]) VALUES (743, 742, 0, 1, NULL, N'_self', 1)
GO
INSERT [snlg_V1].[TblMenuApp] ([MenuId], [UstId], [Sira], [Aktif], [Resim], [Hedef], [UCId]) VALUES (762, 742, 2, 1, NULL, N'_self', 1)
GO
INSERT [snlg_V1].[TblMenuApp] ([MenuId], [UstId], [Sira], [Aktif], [Resim], [Hedef], [UCId]) VALUES (781, NULL, 2, 1, NULL, N'_self', 1)
GO
INSERT [snlg_V1].[TblMenuApp] ([MenuId], [UstId], [Sira], [Aktif], [Resim], [Hedef], [UCId]) VALUES (785, NULL, 3, 1, NULL, N'_self', 1)
GO
INSERT [snlg_V1].[TblMenuApp] ([MenuId], [UstId], [Sira], [Aktif], [Resim], [Hedef], [UCId]) VALUES (791, NULL, 7, 1, NULL, N'_self', 1)
GO
INSERT [snlg_V1].[TblMenuApp] ([MenuId], [UstId], [Sira], [Aktif], [Resim], [Hedef], [UCId]) VALUES (797, NULL, 1, 1, NULL, N'_self', 1)
GO
INSERT [snlg_V1].[TblMenuApp] ([MenuId], [UstId], [Sira], [Aktif], [Resim], [Hedef], [UCId]) VALUES (807, NULL, 4, 1, NULL, N'_self', 1)
GO
INSERT [snlg_V1].[TblMenuApp] ([MenuId], [UstId], [Sira], [Aktif], [Resim], [Hedef], [UCId]) VALUES (808, NULL, 5, 1, NULL, N'_self', 1)
GO
INSERT [snlg_V1].[TblMenuApp] ([MenuId], [UstId], [Sira], [Aktif], [Resim], [Hedef], [UCId]) VALUES (809, NULL, 0, 0, NULL, N'_self', 2)
GO
INSERT [snlg_V1].[TblMenuApp] ([MenuId], [UstId], [Sira], [Aktif], [Resim], [Hedef], [UCId]) VALUES (811, NULL, 2, 1, NULL, N'_self', 2)
GO
INSERT [snlg_V1].[TblMenuApp] ([MenuId], [UstId], [Sira], [Aktif], [Resim], [Hedef], [UCId]) VALUES (812, NULL, 3, 0, NULL, N'_self', 2)
GO
INSERT [snlg_V1].[TblMenuApp] ([MenuId], [UstId], [Sira], [Aktif], [Resim], [Hedef], [UCId]) VALUES (813, NULL, 4, 0, NULL, N'_self', 2)
GO
INSERT [snlg_V1].[TblMenuApp] ([MenuId], [UstId], [Sira], [Aktif], [Resim], [Hedef], [UCId]) VALUES (814, NULL, 5, 0, NULL, N'_self', 2)
GO
INSERT [snlg_V1].[TblMenuApp] ([MenuId], [UstId], [Sira], [Aktif], [Resim], [Hedef], [UCId]) VALUES (815, 811, 6, 1, NULL, N'_self', 2)
GO
INSERT [snlg_V1].[TblMenuApp] ([MenuId], [UstId], [Sira], [Aktif], [Resim], [Hedef], [UCId]) VALUES (816, NULL, 7, 1, NULL, N'_self', 2)
GO
INSERT [snlg_V1].[TblMenuApp] ([MenuId], [UstId], [Sira], [Aktif], [Resim], [Hedef], [UCId]) VALUES (817, NULL, 9, 1, NULL, N'_self', 2)
GO
INSERT [snlg_V1].[TblMenuApp] ([MenuId], [UstId], [Sira], [Aktif], [Resim], [Hedef], [UCId]) VALUES (821, NULL, 2, 1, NULL, N'_self', 41)
GO
INSERT [snlg_V1].[TblMenuApp] ([MenuId], [UstId], [Sira], [Aktif], [Resim], [Hedef], [UCId]) VALUES (822, NULL, 1, 1, NULL, N'_self', 41)
GO
INSERT [snlg_V1].[TblMenuApp] ([MenuId], [UstId], [Sira], [Aktif], [Resim], [Hedef], [UCId]) VALUES (825, 742, 3, 1, NULL, N'_self', 1)
GO
INSERT [snlg_V1].[TblMenuApp] ([MenuId], [UstId], [Sira], [Aktif], [Resim], [Hedef], [UCId]) VALUES (826, NULL, 3, 1, NULL, N'_self', 41)
GO
INSERT [snlg_V1].[TblMenuApp] ([MenuId], [UstId], [Sira], [Aktif], [Resim], [Hedef], [UCId]) VALUES (856, NULL, 1, 1, NULL, N'_self', 2)
GO
INSERT [snlg_V1].[TblMenuApp] ([MenuId], [UstId], [Sira], [Aktif], [Resim], [Hedef], [UCId]) VALUES (857, NULL, 0, 1, NULL, N'_self', 41)
GO
INSERT [snlg_V1].[TblMenuApp] ([MenuId], [UstId], [Sira], [Aktif], [Resim], [Hedef], [UCId]) VALUES (858, 742, 1, 1, NULL, N'_self', 1)
GO
INSERT [snlg_V1].[TblMenuApp] ([MenuId], [UstId], [Sira], [Aktif], [Resim], [Hedef], [UCId]) VALUES (859, NULL, 8, 1, NULL, N'_self', 2)
GO
INSERT [snlg_V1].[TblMenuApp] ([MenuId], [UstId], [Sira], [Aktif], [Resim], [Hedef], [UCId]) VALUES (860, 859, 0, 1, NULL, N'_self', 2)
GO
INSERT [snlg_V1].[TblMenuApp] ([MenuId], [UstId], [Sira], [Aktif], [Resim], [Hedef], [UCId]) VALUES (861, 859, 1, 1, NULL, N'_self', 2)
GO
INSERT [snlg_V1].[TblMenuApp] ([MenuId], [UstId], [Sira], [Aktif], [Resim], [Hedef], [UCId]) VALUES (863, 811, 2, 1, NULL, N'_self', 2)
GO
INSERT [snlg_V1].[TblMenuApp] ([MenuId], [UstId], [Sira], [Aktif], [Resim], [Hedef], [UCId]) VALUES (864, 859, 2, 1, NULL, N'_self', 2)
GO
INSERT [snlg_V1].[TblMenuApp] ([MenuId], [UstId], [Sira], [Aktif], [Resim], [Hedef], [UCId]) VALUES (866, 816, 0, 1, NULL, N'_self', 2)
GO
INSERT [snlg_V1].[TblMenuApp] ([MenuId], [UstId], [Sira], [Aktif], [Resim], [Hedef], [UCId]) VALUES (867, 811, 1, 1, NULL, N'_self', 2)
GO
INSERT [snlg_V1].[TblMenuApp] ([MenuId], [UstId], [Sira], [Aktif], [Resim], [Hedef], [UCId]) VALUES (868, 816, 1, 1, NULL, N'_self', 2)
GO
INSERT [snlg_V1].[TblMenuApp] ([MenuId], [UstId], [Sira], [Aktif], [Resim], [Hedef], [UCId]) VALUES (869, 811, 0, 1, NULL, N'_self', 2)
GO
INSERT [snlg_V1].[TblMenuApp] ([MenuId], [UstId], [Sira], [Aktif], [Resim], [Hedef], [UCId]) VALUES (870, 856, 0, 1, NULL, N'_self', 2)
GO
INSERT [snlg_V1].[TblMenuApp] ([MenuId], [UstId], [Sira], [Aktif], [Resim], [Hedef], [UCId]) VALUES (871, 856, 1, 1, NULL, N'_self', 2)
GO
INSERT [snlg_V1].[TblMenuApp] ([MenuId], [UstId], [Sira], [Aktif], [Resim], [Hedef], [UCId]) VALUES (872, 856, 2, 1, NULL, N'_self', 2)
GO
INSERT [snlg_V1].[TblMenuApp] ([MenuId], [UstId], [Sira], [Aktif], [Resim], [Hedef], [UCId]) VALUES (873, 856, 3, 1, NULL, N'_self', 2)
GO
INSERT [snlg_V1].[TblMenuApp] ([MenuId], [UstId], [Sira], [Aktif], [Resim], [Hedef], [UCId]) VALUES (877, NULL, 10, 0, NULL, N'_self', 2)
GO
INSERT [snlg_V1].[TblMenuApp] ([MenuId], [UstId], [Sira], [Aktif], [Resim], [Hedef], [UCId]) VALUES (878, NULL, 11, 0, N'/plugins/fileman/Uploads/1.jpg', N'_self', 2)
GO
SET IDENTITY_INSERT [snlg_V1].[TblMenuApp] OFF
GO
INSERT [snlg_V1].[TblMenuDetay] ([MenuId], [Dil], [MenuLink], [MenuItem]) VALUES (742, 9, NULL, N'Sanalog')
GO
INSERT [snlg_V1].[TblMenuDetay] ([MenuId], [Dil], [MenuLink], [MenuItem]) VALUES (825, 31, N'/sikca-sorulan-sorular', N'Sıça Sorulan Sorular')
GO
INSERT [snlg_V1].[TblMenuDetay] ([MenuId], [Dil], [MenuLink], [MenuItem]) VALUES (826, 31, N'/sikca-sorulan-sorular', N'Sıça Sorulan Sorular')
GO
INSERT [snlg_V1].[TblMenuDetay] ([MenuId], [Dil], [MenuLink], [MenuItem]) VALUES (807, 31, N'/portfoy/referanslar', N'Referanslar')
GO
INSERT [snlg_V1].[TblMenuDetay] ([MenuId], [Dil], [MenuLink], [MenuItem]) VALUES (858, 31, N'/degerlerimiz', N'Değerlerimiz')
GO
INSERT [snlg_V1].[TblMenuDetay] ([MenuId], [Dil], [MenuLink], [MenuItem]) VALUES (863, 31, N'/haberler', N'Haberler')
GO
INSERT [snlg_V1].[TblMenuDetay] ([MenuId], [Dil], [MenuLink], [MenuItem]) VALUES (743, 2057, NULL, N'What is Sanalog?')
GO
INSERT [snlg_V1].[TblMenuDetay] ([MenuId], [Dil], [MenuLink], [MenuItem]) VALUES (762, 31, N'/ekibimiz', N'Ekibimiz')
GO
INSERT [snlg_V1].[TblMenuDetay] ([MenuId], [Dil], [MenuLink], [MenuItem]) VALUES (678, 1033, NULL, N'BLOG')
GO
INSERT [snlg_V1].[TblMenuDetay] ([MenuId], [Dil], [MenuLink], [MenuItem]) VALUES (678, 31, N'/blog', N'Blog')
GO
INSERT [snlg_V1].[TblMenuDetay] ([MenuId], [Dil], [MenuLink], [MenuItem]) VALUES (681, 1033, NULL, N'OUR VISION')
GO
INSERT [snlg_V1].[TblMenuDetay] ([MenuId], [Dil], [MenuLink], [MenuItem]) VALUES (867, 31, N'/duyurular', N'Duyurular')
GO
INSERT [snlg_V1].[TblMenuDetay] ([MenuId], [Dil], [MenuLink], [MenuItem]) VALUES (856, 31, N'/biz-kimiz', N'Hakkımızda')
GO
INSERT [snlg_V1].[TblMenuDetay] ([MenuId], [Dil], [MenuLink], [MenuItem]) VALUES (681, 31, NULL, N'Vizyonumuz')
GO
INSERT [snlg_V1].[TblMenuDetay] ([MenuId], [Dil], [MenuLink], [MenuItem]) VALUES (797, 31, N'/etkinlikler', N'Etkinlikler')
GO
INSERT [snlg_V1].[TblMenuDetay] ([MenuId], [Dil], [MenuLink], [MenuItem]) VALUES (809, 31, N'/shop/modafans-hakiki-deri-ayakkabi', N'Anasayfa')
GO
INSERT [snlg_V1].[TblMenuDetay] ([MenuId], [Dil], [MenuLink], [MenuItem]) VALUES (872, 31, N'/ekibimiz', N'Ekibimiz')
GO
INSERT [snlg_V1].[TblMenuDetay] ([MenuId], [Dil], [MenuLink], [MenuItem]) VALUES (873, 31, N'/sikca-sorulan-sorular', N'S.S.S')
GO
INSERT [snlg_V1].[TblMenuDetay] ([MenuId], [Dil], [MenuLink], [MenuItem]) VALUES (878, 31, N'/anasayfa', N'test')
GO
INSERT [snlg_V1].[TblMenuDetay] ([MenuId], [Dil], [MenuLink], [MenuItem]) VALUES (811, 31, N'/etkinlikler', N'Güncel')
GO
INSERT [snlg_V1].[TblMenuDetay] ([MenuId], [Dil], [MenuLink], [MenuItem]) VALUES (785, 31, N'/projeler', N'Projeler')
GO
INSERT [snlg_V1].[TblMenuDetay] ([MenuId], [Dil], [MenuLink], [MenuItem]) VALUES (785, 2057, NULL, N'Tutorials')
GO
INSERT [snlg_V1].[TblMenuDetay] ([MenuId], [Dil], [MenuLink], [MenuItem]) VALUES (675, 1033, NULL, N'ABOUT US')
GO
INSERT [snlg_V1].[TblMenuDetay] ([MenuId], [Dil], [MenuLink], [MenuItem]) VALUES (675, 31, NULL, N'Misyonumuz')
GO
INSERT [snlg_V1].[TblMenuDetay] ([MenuId], [Dil], [MenuLink], [MenuItem]) VALUES (812, 31, N'/urunler', N'Ürünler')
GO
INSERT [snlg_V1].[TblMenuDetay] ([MenuId], [Dil], [MenuLink], [MenuItem]) VALUES (813, 31, N'/projeler', N'Projeler')
GO
INSERT [snlg_V1].[TblMenuDetay] ([MenuId], [Dil], [MenuLink], [MenuItem]) VALUES (743, 31, N'/biz-kimiz', N'Biz Kimiz?')
GO
INSERT [snlg_V1].[TblMenuDetay] ([MenuId], [Dil], [MenuLink], [MenuItem]) VALUES (734, 31, NULL, N'Misyonumuz')
GO
INSERT [snlg_V1].[TblMenuDetay] ([MenuId], [Dil], [MenuLink], [MenuItem]) VALUES (734, 2057, NULL, N'MISSION')
GO
INSERT [snlg_V1].[TblMenuDetay] ([MenuId], [Dil], [MenuLink], [MenuItem]) VALUES (681, 2057, NULL, N'VISION')
GO
INSERT [snlg_V1].[TblMenuDetay] ([MenuId], [Dil], [MenuLink], [MenuItem]) VALUES (675, 2057, NULL, N'MISSION')
GO
INSERT [snlg_V1].[TblMenuDetay] ([MenuId], [Dil], [MenuLink], [MenuItem]) VALUES (742, 31, N'/biz-kimiz', N'Hakkımızda')
GO
INSERT [snlg_V1].[TblMenuDetay] ([MenuId], [Dil], [MenuLink], [MenuItem]) VALUES (762, 2057, NULL, N'Team')
GO
INSERT [snlg_V1].[TblMenuDetay] ([MenuId], [Dil], [MenuLink], [MenuItem]) VALUES (742, 2057, NULL, N'Sanalog')
GO
INSERT [snlg_V1].[TblMenuDetay] ([MenuId], [Dil], [MenuLink], [MenuItem]) VALUES (814, 31, N'/referanslar', N'Referanslar')
GO
INSERT [snlg_V1].[TblMenuDetay] ([MenuId], [Dil], [MenuLink], [MenuItem]) VALUES (815, 31, N'/foto-galeri', N'Foto Galeri')
GO
INSERT [snlg_V1].[TblMenuDetay] ([MenuId], [Dil], [MenuLink], [MenuItem]) VALUES (816, 31, N'/blog', N'Blog')
GO
INSERT [snlg_V1].[TblMenuDetay] ([MenuId], [Dil], [MenuLink], [MenuItem]) VALUES (817, 31, N'/bize-ulasin', N'Bize Ulaşın')
GO
INSERT [snlg_V1].[TblMenuDetay] ([MenuId], [Dil], [MenuLink], [MenuItem]) VALUES (781, 31, N'/urunler', N'Ürünler')
GO
INSERT [snlg_V1].[TblMenuDetay] ([MenuId], [Dil], [MenuLink], [MenuItem]) VALUES (781, 2057, NULL, N'Shop')
GO
INSERT [snlg_V1].[TblMenuDetay] ([MenuId], [Dil], [MenuLink], [MenuItem]) VALUES (791, 31, N'/bize-ulasin', N'Bize Ulaşın')
GO
INSERT [snlg_V1].[TblMenuDetay] ([MenuId], [Dil], [MenuLink], [MenuItem]) VALUES (791, 2057, NULL, N'Contact Us')
GO
INSERT [snlg_V1].[TblMenuDetay] ([MenuId], [Dil], [MenuLink], [MenuItem]) VALUES (743, 9, N'/what-is-sanalog', N'What is Sanalog?')
GO
INSERT [snlg_V1].[TblMenuDetay] ([MenuId], [Dil], [MenuLink], [MenuItem]) VALUES (785, 9, N'/tutorials', N'Tutorials')
GO
INSERT [snlg_V1].[TblMenuDetay] ([MenuId], [Dil], [MenuLink], [MenuItem]) VALUES (791, 9, N'/contact-us', N'Contact Us')
GO
INSERT [snlg_V1].[TblMenuDetay] ([MenuId], [Dil], [MenuLink], [MenuItem]) VALUES (781, 9, N'/urunler1', N'Shop')
GO
INSERT [snlg_V1].[TblMenuDetay] ([MenuId], [Dil], [MenuLink], [MenuItem]) VALUES (762, 9, NULL, N'Team')
GO
INSERT [snlg_V1].[TblMenuDetay] ([MenuId], [Dil], [MenuLink], [MenuItem]) VALUES (678, 9, N'/blog', NULL)
GO
INSERT [snlg_V1].[TblMenuDetay] ([MenuId], [Dil], [MenuLink], [MenuItem]) VALUES (808, 31, N'/foto-galeri', N'Foto Galeri')
GO
INSERT [snlg_V1].[TblMenuDetay] ([MenuId], [Dil], [MenuLink], [MenuItem]) VALUES (816, 9, NULL, N'blogx')
GO
INSERT [snlg_V1].[TblMenuDetay] ([MenuId], [Dil], [MenuLink], [MenuItem]) VALUES (857, 31, N'/biz-kimiz', N'Biz Kimiz?')
GO
INSERT [snlg_V1].[TblMenuDetay] ([MenuId], [Dil], [MenuLink], [MenuItem]) VALUES (821, 31, N'/ekibimiz', N'Ekibimiz')
GO
INSERT [snlg_V1].[TblMenuDetay] ([MenuId], [Dil], [MenuLink], [MenuItem]) VALUES (822, 31, N'/degerlerimiz', N'Değerlerimiz')
GO
INSERT [snlg_V1].[TblMenuDetay] ([MenuId], [Dil], [MenuLink], [MenuItem]) VALUES (866, 31, N'/yazarlar', N'Yazarlar')
GO
INSERT [snlg_V1].[TblMenuDetay] ([MenuId], [Dil], [MenuLink], [MenuItem]) VALUES (868, 31, N'/blog', N'Makaleler')
GO
INSERT [snlg_V1].[TblMenuDetay] ([MenuId], [Dil], [MenuLink], [MenuItem]) VALUES (877, 31, N'/duyurular/at-vero-eos-et-accusamus-et-iusto-odio-dignissimos-ducimus-qui-blanditiis-praesentium-voluptatum-deleniti', N'aaaaaa')
GO
INSERT [snlg_V1].[TblMenuDetay] ([MenuId], [Dil], [MenuLink], [MenuItem]) VALUES (859, 31, NULL, N'Üyelik')
GO
INSERT [snlg_V1].[TblMenuDetay] ([MenuId], [Dil], [MenuLink], [MenuItem]) VALUES (860, 31, N'/uye-ol', N'Üye Ol')
GO
INSERT [snlg_V1].[TblMenuDetay] ([MenuId], [Dil], [MenuLink], [MenuItem]) VALUES (861, 31, N'/uye-girisi', N'Üye Girişi')
GO
INSERT [snlg_V1].[TblMenuDetay] ([MenuId], [Dil], [MenuLink], [MenuItem]) VALUES (864, 31, N'/ziyaretci-defteri', N'Ziyaretçi Defteri')
GO
INSERT [snlg_V1].[TblMenuDetay] ([MenuId], [Dil], [MenuLink], [MenuItem]) VALUES (869, 31, N'/etkinlikler', N'Etkinlikler')
GO
INSERT [snlg_V1].[TblMenuDetay] ([MenuId], [Dil], [MenuLink], [MenuItem]) VALUES (870, 31, N'/biz-kimiz', N'Biz Kimiz?')
GO
INSERT [snlg_V1].[TblMenuDetay] ([MenuId], [Dil], [MenuLink], [MenuItem]) VALUES (871, 31, N'/degerlerimiz', N'Değerlerimiz')
GO
SET IDENTITY_INSERT [snlg_V1].[TblProjeAltBilgiApp] ON 

GO
INSERT [snlg_V1].[TblProjeAltBilgiApp] ([ProjeAltId], [ProjeId], [Sira], [Gorunurluk], [AramaIndex]) VALUES (30, 27, NULL, 1, 0)
GO
INSERT [snlg_V1].[TblProjeAltBilgiApp] ([ProjeAltId], [ProjeId], [Sira], [Gorunurluk], [AramaIndex]) VALUES (31, 27, NULL, 1, 0)
GO
INSERT [snlg_V1].[TblProjeAltBilgiApp] ([ProjeAltId], [ProjeId], [Sira], [Gorunurluk], [AramaIndex]) VALUES (32, 27, NULL, 1, 0)
GO
INSERT [snlg_V1].[TblProjeAltBilgiApp] ([ProjeAltId], [ProjeId], [Sira], [Gorunurluk], [AramaIndex]) VALUES (33, 29, NULL, 1, 1)
GO
INSERT [snlg_V1].[TblProjeAltBilgiApp] ([ProjeAltId], [ProjeId], [Sira], [Gorunurluk], [AramaIndex]) VALUES (34, 26, 4, 1, 0)
GO
INSERT [snlg_V1].[TblProjeAltBilgiApp] ([ProjeAltId], [ProjeId], [Sira], [Gorunurluk], [AramaIndex]) VALUES (35, 26, 2, 1, 0)
GO
INSERT [snlg_V1].[TblProjeAltBilgiApp] ([ProjeAltId], [ProjeId], [Sira], [Gorunurluk], [AramaIndex]) VALUES (37, 26, 8, 1, 1)
GO
INSERT [snlg_V1].[TblProjeAltBilgiApp] ([ProjeAltId], [ProjeId], [Sira], [Gorunurluk], [AramaIndex]) VALUES (38, 26, 1, 1, 0)
GO
INSERT [snlg_V1].[TblProjeAltBilgiApp] ([ProjeAltId], [ProjeId], [Sira], [Gorunurluk], [AramaIndex]) VALUES (39, 26, 6, 1, 0)
GO
INSERT [snlg_V1].[TblProjeAltBilgiApp] ([ProjeAltId], [ProjeId], [Sira], [Gorunurluk], [AramaIndex]) VALUES (40, 26, 3, 1, 0)
GO
INSERT [snlg_V1].[TblProjeAltBilgiApp] ([ProjeAltId], [ProjeId], [Sira], [Gorunurluk], [AramaIndex]) VALUES (41, 31, 7, 1, 0)
GO
INSERT [snlg_V1].[TblProjeAltBilgiApp] ([ProjeAltId], [ProjeId], [Sira], [Gorunurluk], [AramaIndex]) VALUES (42, 30, 5, 1, 0)
GO
SET IDENTITY_INSERT [snlg_V1].[TblProjeAltBilgiApp] OFF
GO
INSERT [snlg_V1].[TblProjeAltBilgiDetay] ([ProjeAltId], [Dil], [SeoUrl], [Baslik], [Icerik], [Keyword], [Descr]) VALUES (34, 31, N'vitae-mondi-tanitim', N'Tanıtım', N'<p><img alt="" class="img-responsive" src="/uploads/images/projeler/vitae-mondi/tanitim.jpg" /></p>

<div class="row project-info text-center">
<div class="col-md-3">
<div class="info-box">
<h2>Proje Tipi</h2>

<h4>Konut ve Ticaret</h4>
</div>
</div>

<div class="col-md-3">
<div class="info-box">
<h2>Proje Tarihi</h2>

<h4>2011</h4>
</div>
</div>

<div class="col-md-3">
<div class="info-box">
<h2>Proje Yeri</h2>

<h4>Yaşamkent / Ankara</h4>
</div>
</div>

<div class="col-md-3">
<div class="info-box">
<h2>Arsa Alanı</h2>

<h4>130.300m2</h4>
</div>
</div>
</div>

<hr />
<p><strong>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</strong></p>

<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur</p>
<img alt="Vitae Mondi Foto Galeri" gallery_id="122" gallery_type="lightbox" src="/admin/themes/default/images/icon-image-gallery.png" title="Vitae Mondi Foto Galeri" type="image_gallery" />', NULL, NULL)
GO
INSERT [snlg_V1].[TblProjeAltBilgiDetay] ([ProjeAltId], [Dil], [SeoUrl], [Baslik], [Icerik], [Keyword], [Descr]) VALUES (31, 31, NULL, N'g-iki', NULL, NULL, NULL)
GO
INSERT [snlg_V1].[TblProjeAltBilgiDetay] ([ProjeAltId], [Dil], [SeoUrl], [Baslik], [Icerik], [Keyword], [Descr]) VALUES (30, 31, NULL, N'E-posta Şablonları', N'<p>
	Idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness</p>
', NULL, NULL)
GO
INSERT [snlg_V1].[TblProjeAltBilgiDetay] ([ProjeAltId], [Dil], [SeoUrl], [Baslik], [Icerik], [Keyword], [Descr]) VALUES (32, 31, NULL, N'g-üç', NULL, NULL, NULL)
GO
INSERT [snlg_V1].[TblProjeAltBilgiDetay] ([ProjeAltId], [Dil], [SeoUrl], [Baslik], [Icerik], [Keyword], [Descr]) VALUES (33, 31, NULL, N'Sanalog Kurulumu', N'<p>
	<span style="color: rgb(128, 128, 128); font-family: Raleway, sans-serif; font-size: 17px; line-height: 28px;">Lorem ipsum dolor sit amet, consectetuer leo, vel purus, nonummy dolor auctor quam. Ornare vel, donec pharetra ligula at varius commodo, nec nunc vel eget. Ultricies hymenaeos nulla bibendum et at pretium. Lorem Ipsum is simply dummy text of the printing and typesetting industry.</span></p>
', N'sanalog, kurulum', N'Sanalog  Kurulumu')
GO
INSERT [snlg_V1].[TblProjeAltBilgiDetay] ([ProjeAltId], [Dil], [SeoUrl], [Baslik], [Icerik], [Keyword], [Descr]) VALUES (39, 31, N'vitae-mondi-ulasim', N'Ulaşım', N'<address><strong>Building, Inc.</strong><br />
795 Folsom Ave, Suite 600<br />
San Francisco, CA 94107</address>
<iframe allowfullscreen="" frameborder="0" height="450" src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d10107.749826982017!2d28.94011198523641!3d41.133390725394!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1str!2s!4v1455381493416" style="border:0" width="100%"></iframe>', NULL, NULL)
GO
INSERT [snlg_V1].[TblProjeAltBilgiDetay] ([ProjeAltId], [Dil], [SeoUrl], [Baslik], [Icerik], [Keyword], [Descr]) VALUES (41, 31, N'vertimos-tanitim', N'Tanıtım', N'<p><img alt="" class="img-responsive" src="/uploads/images/projeler/vertimos/2.jpg" /></p>

<div class="row project-info text-center">
<div class="col-md-3">
<div class="info-box">
<h2>Proje Tipi</h2>

<h4>Konut ve Ticaret</h4>
</div>
</div>

<div class="col-md-3">
<div class="info-box">
<h2>Proje Tarihi</h2>

<h4>2011</h4>
</div>
</div>

<div class="col-md-3">
<div class="info-box">
<h2>Proje Yeri</h2>

<h4>Yaşamkent / Ankara</h4>
</div>
</div>

<div class="col-md-3">
<div class="info-box">
<h2>Arsa Alanı</h2>

<h4>130.300m2</h4>
</div>
</div>
</div>

<hr />
<p><strong>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</strong></p>

<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur</p>
<img alt="Vitae Mondi Foto Galeri" gallery_id="122" gallery_type="lightbox" src="/admin/themes/default/images/icon-image-gallery.png" title="Vitae Mondi Foto Galeri" type="image_gallery" />', NULL, NULL)
GO
INSERT [snlg_V1].[TblProjeAltBilgiDetay] ([ProjeAltId], [Dil], [SeoUrl], [Baslik], [Icerik], [Keyword], [Descr]) VALUES (37, 31, N'vitae-mondi-kat-plani', N'Kat Planı', N'<p>Eius timeam detracto qui at, sea electram periculis in, at reprimique contentiones reprehendunt has. Tota complectitur necessitatibus has eu, vis mutat vitae at. Vim diam everti ne. Nec virtute eruditi in.</p>

<img alt="Trend Bahçeşehir Kat Planı" gallery_id="119" gallery_type="lightbox" src="/admin/themes/default/images/icon-image-gallery.jpg" title="Trend Bahçeşehir Kat Planı" type="image_gallery" />', NULL, NULL)
GO
INSERT [snlg_V1].[TblProjeAltBilgiDetay] ([ProjeAltId], [Dil], [SeoUrl], [Baslik], [Icerik], [Keyword], [Descr]) VALUES (38, 31, N'vitae-mondi-daireler', N'Daireler', N'<p>Eius timeam detracto qui at, sea electram periculis in, at reprimique contentiones reprehendunt has. Tota complectitur necessitatibus has eu, vis mutat vitae at. Vim diam everti ne. Nec virtute eruditi in.</p>

<img alt="Trend Bahçeşehir Vaziyet Planı" gallery_id="120" gallery_type="bootstrap-carousel" src="/admin/themes/default/images/icon-image-gallery.png" title="Trend Bahçeşehir Vaziyet Planı" type="image_gallery" />', NULL, NULL)
GO
INSERT [snlg_V1].[TblProjeAltBilgiDetay] ([ProjeAltId], [Dil], [SeoUrl], [Baslik], [Icerik], [Keyword], [Descr]) VALUES (42, 31, N'moda-palas-tanitim', N'Tanıtım', N'<p><img alt="" class="img-responsive" src="/uploads/images/projeler/moda-palas/3.jpg" /></p>

<div class="row project-info text-center">
<div class="col-md-3">
<div class="info-box">
<h2>Proje Tipi</h2>

<h4>Konut ve Ticaret</h4>
</div>
</div>

<div class="col-md-3">
<div class="info-box">
<h2>Proje Tarihi</h2>

<h4>2011</h4>
</div>
</div>

<div class="col-md-3">
<div class="info-box">
<h2>Proje Yeri</h2>

<h4>Yaşamkent / Ankara</h4>
</div>
</div>

<div class="col-md-3">
<div class="info-box">
<h2>Arsa Alanı</h2>

<h4>130.300m2</h4>
</div>
</div>
</div>

<hr />
<p><strong>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</strong></p>

<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur</p>
<img alt="Vitae Mondi Foto Galeri" gallery_id="122" gallery_type="lightbox" src="/admin/themes/default/images/icon-image-gallery.png" title="Vitae Mondi Foto Galeri" type="image_gallery" />', NULL, NULL)
GO
INSERT [snlg_V1].[TblProjeAltBilgiDetay] ([ProjeAltId], [Dil], [SeoUrl], [Baslik], [Icerik], [Keyword], [Descr]) VALUES (40, 31, N'vitae-mondi-s-s-s-', N'S.S.S.', N'<div aria-multiselectable="true" class="panel-group" id="accordion" role="tablist">
<div class="panel panel-default">
<div class="panel-heading" id="headingOne" role="tab">
<h4 class="panel-title"><a aria-controls="collapseOne" aria-expanded="true" data-parent="#accordion" data-toggle="collapse" href="#collapseOne" role="button">Collapsible Group Item #1 </a></h4>
</div>

<div aria-labelledby="headingOne" class="panel-collapse collapse in" id="collapseOne" role="tabpanel">
<div class="panel-body">Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven&#39;t heard of them accusamus labore sustainable VHS.</div>
</div>
</div>

<div class="panel panel-default">
<div class="panel-heading" id="headingTwo" role="tab">
<h4 class="panel-title"><a aria-controls="collapseTwo" aria-expanded="false" class="collapsed" data-parent="#accordion" data-toggle="collapse" href="#collapseTwo" role="button">Collapsible Group Item #2 </a></h4>
</div>

<div aria-labelledby="headingTwo" class="panel-collapse collapse" id="collapseTwo" role="tabpanel">
<div class="panel-body">Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven&#39;t heard of them accusamus labore sustainable VHS.</div>
</div>
</div>

<div class="panel panel-default">
<div class="panel-heading" id="headingThree" role="tab">
<h4 class="panel-title"><a aria-controls="collapseThree" aria-expanded="false" class="collapsed" data-parent="#accordion" data-toggle="collapse" href="#collapseThree" role="button">Collapsible Group Item #3 </a></h4>
</div>

<div aria-labelledby="headingThree" class="panel-collapse collapse" id="collapseThree" role="tabpanel">
<div class="panel-body">Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven&#39;t heard of them accusamus labore sustainable VHS.</div>
</div>
</div>
</div>
', NULL, NULL)
GO
INSERT [snlg_V1].[TblProjeAltBilgiDetay] ([ProjeAltId], [Dil], [SeoUrl], [Baslik], [Icerik], [Keyword], [Descr]) VALUES (35, 31, N'vitae-mondi-vaziyet-plani', N'Vaziyet Planı', N'<p><img alt="Proje Mavişehir Vaziyet Planı" gallery_id="123" gallery_type="zoom_gallery" src="/admin/themes/default/images/icon-image-gallery.jpg" title="Proje Mavişehir Vaziyet Planı" type="image_gallery" /></p>

<p>Quando aliquando ei sed, magna graece no eam. Ad quo dico natum diceret, minimum omittantur conclusionemque id eos. Cu purto viris labitur usu, te nec dicunt gubergren. Ludus efficiendi delicatissimi eos ex, movet vocent sensibus in mel. Bonorum veritus delicatissimi cum te, te probo partem vel, nec ei solum partiendo. Erroribus voluptaria dissentias his id, eum mucius meliore eu. Impedit commune qualisque usu ex, no sea erroribus laboramus scriptorem, tale paulo consulatu usu no. Ea audiam consulatu quaerendum eum, natum mundi euismod at sit. In equidem scripserit mea, nam mutat dicta verterem et. Prima ubique alterum eu sit, regione atomorum ne vel, an eros novum sadipscing duo.</p>

<p>Vix ut persecuti ullamcorper, per no justo doming. Usu cu scaevola appellantur, ad aeque ludus mel, fierent adolescens mel at. Has luptatum splendide cu, nam prompta luptatum persequeris ut, imperdiet democritum has ne. Cu has illum augue, duo verear facilisi an, ei amet tacimates recteque pro. Eu ignota veritus his, summo melius no usu. Posse simul mei cu, mei epicuri vivendum in. His an ullum error delicatissimi, duo eu mazim nusquam. Vim eu quod duis eius, tale melius maiestatis mea te. Ne diam dicunt tincidunt has, quando admodum mandamus no vix. Has summo blandit aliquando ea. Usu odio quando facete ut, te usu epicuri adipisci moderatius.</p>
', NULL, NULL)
GO
SET IDENTITY_INSERT [snlg_V1].[TblUrunApp] ON 

GO
INSERT [snlg_V1].[TblUrunApp] ([UrunId], [Sira], [UrunKodu], [Fiyat], [PId], [Gorunurluk], [Resim], [AramaIndex]) VALUES (135, 14, N'MHD117', CAST(250.00 AS Decimal(9, 2)), 1, 1, N'/uploads/images/urunler/5.jpg', 1)
GO
INSERT [snlg_V1].[TblUrunApp] ([UrunId], [Sira], [UrunKodu], [Fiyat], [PId], [Gorunurluk], [Resim], [AramaIndex]) VALUES (137, 4, N'MHD101', CAST(35.00 AS Decimal(9, 2)), 1, 1, N'/Uploads/Images/urunler/1.jpg', 0)
GO
INSERT [snlg_V1].[TblUrunApp] ([UrunId], [Sira], [UrunKodu], [Fiyat], [PId], [Gorunurluk], [Resim], [AramaIndex]) VALUES (138, 1, N'MHD102', CAST(349.07 AS Decimal(9, 2)), 1, 1, N'/uploads/images/urunler/11.jpg', 1)
GO
INSERT [snlg_V1].[TblUrunApp] ([UrunId], [Sira], [UrunKodu], [Fiyat], [PId], [Gorunurluk], [Resim], [AramaIndex]) VALUES (140, 9, N'MHD112', CAST(50.00 AS Decimal(9, 2)), 1, 1, N'/uploads/images/urunler/1.jpg', 0)
GO
INSERT [snlg_V1].[TblUrunApp] ([UrunId], [Sira], [UrunKodu], [Fiyat], [PId], [Gorunurluk], [Resim], [AramaIndex]) VALUES (141, 6, N'MHD106', CAST(400.00 AS Decimal(9, 2)), 1, 1, N'/Uploads/Images/urunler/3.jpg', 1)
GO
INSERT [snlg_V1].[TblUrunApp] ([UrunId], [Sira], [UrunKodu], [Fiyat], [PId], [Gorunurluk], [Resim], [AramaIndex]) VALUES (142, 8, N'MHD111', CAST(50.00 AS Decimal(9, 2)), 1, 1, N'/uploads/images/urunler/3.jpg', 0)
GO
INSERT [snlg_V1].[TblUrunApp] ([UrunId], [Sira], [UrunKodu], [Fiyat], [PId], [Gorunurluk], [Resim], [AramaIndex]) VALUES (143, 10, N'MHD113', CAST(190.00 AS Decimal(9, 2)), 1, 1, N'/uploads/images/urunler/3.jpg', 1)
GO
INSERT [snlg_V1].[TblUrunApp] ([UrunId], [Sira], [UrunKodu], [Fiyat], [PId], [Gorunurluk], [Resim], [AramaIndex]) VALUES (144, 15, N'MHD118', CAST(200.00 AS Decimal(9, 2)), 1, 1, N'/uploads/images/urunler/6.jpg', 1)
GO
INSERT [snlg_V1].[TblUrunApp] ([UrunId], [Sira], [UrunKodu], [Fiyat], [PId], [Gorunurluk], [Resim], [AramaIndex]) VALUES (145, 3, N'MHD107', CAST(150.00 AS Decimal(9, 2)), 1, 1, N'/uploads/images/urunler/2.jpg', 1)
GO
INSERT [snlg_V1].[TblUrunApp] ([UrunId], [Sira], [UrunKodu], [Fiyat], [PId], [Gorunurluk], [Resim], [AramaIndex]) VALUES (147, 5, N'MHD105', CAST(230.00 AS Decimal(9, 2)), 1, 1, N'/uploads/images/urunler/4.jpg', 1)
GO
INSERT [snlg_V1].[TblUrunApp] ([UrunId], [Sira], [UrunKodu], [Fiyat], [PId], [Gorunurluk], [Resim], [AramaIndex]) VALUES (148, 2, N'MHD103', CAST(99.00 AS Decimal(9, 2)), 1, 1, N'/uploads/images/urunler/10.jpg', 1)
GO
INSERT [snlg_V1].[TblUrunApp] ([UrunId], [Sira], [UrunKodu], [Fiyat], [PId], [Gorunurluk], [Resim], [AramaIndex]) VALUES (149, 1, N'MHD104', CAST(465.00 AS Decimal(9, 2)), 1, 1, N'/uploads/images/urunler/9.jpg', 1)
GO
INSERT [snlg_V1].[TblUrunApp] ([UrunId], [Sira], [UrunKodu], [Fiyat], [PId], [Gorunurluk], [Resim], [AramaIndex]) VALUES (150, 1, N'MHD108', CAST(99.00 AS Decimal(9, 2)), 1, 1, N'/uploads/images/urunler/3.jpg', 1)
GO
INSERT [snlg_V1].[TblUrunApp] ([UrunId], [Sira], [UrunKodu], [Fiyat], [PId], [Gorunurluk], [Resim], [AramaIndex]) VALUES (151, 13, N'MHD116', CAST(600.00 AS Decimal(9, 2)), 1, 1, N'/uploads/images/urunler/2.jpg', 1)
GO
INSERT [snlg_V1].[TblUrunApp] ([UrunId], [Sira], [UrunKodu], [Fiyat], [PId], [Gorunurluk], [Resim], [AramaIndex]) VALUES (152, 2, N'MHD109', CAST(299.00 AS Decimal(9, 2)), 1, 1, N'/uploads/images/urunler/4.jpg', 1)
GO
INSERT [snlg_V1].[TblUrunApp] ([UrunId], [Sira], [UrunKodu], [Fiyat], [PId], [Gorunurluk], [Resim], [AramaIndex]) VALUES (153, 7, N'MHD110', CAST(120.00 AS Decimal(9, 2)), 1, 1, N'/uploads/images/urunler/2.jpg', 1)
GO
INSERT [snlg_V1].[TblUrunApp] ([UrunId], [Sira], [UrunKodu], [Fiyat], [PId], [Gorunurluk], [Resim], [AramaIndex]) VALUES (154, 12, N'MHD115', CAST(450.00 AS Decimal(9, 2)), 1, 1, N'/uploads/images/urunler/1.jpg', 1)
GO
INSERT [snlg_V1].[TblUrunApp] ([UrunId], [Sira], [UrunKodu], [Fiyat], [PId], [Gorunurluk], [Resim], [AramaIndex]) VALUES (155, 11, N'MHD114', CAST(500.00 AS Decimal(9, 2)), 1, 1, N'/uploads/images/urunler/2.jpg', 1)
GO
SET IDENTITY_INSERT [snlg_V1].[TblUrunApp] OFF
GO
SET IDENTITY_INSERT [snlg_V1].[TblUrunResim] ON 

GO
INSERT [snlg_V1].[TblUrunResim] ([UrunId], [Sira], [Resim], [ResimId]) VALUES (147, 1, N'/uploads/images/urunler/1.jpg', 158)
GO
INSERT [snlg_V1].[TblUrunResim] ([UrunId], [Sira], [Resim], [ResimId]) VALUES (145, NULL, N'/uploads/images/urunler/2.jpg', 163)
GO
INSERT [snlg_V1].[TblUrunResim] ([UrunId], [Sira], [Resim], [ResimId]) VALUES (150, 2, N'/uploads/images/urunler/3.jpg', 166)
GO
INSERT [snlg_V1].[TblUrunResim] ([UrunId], [Sira], [Resim], [ResimId]) VALUES (152, NULL, N'/uploads/images/urunler/4.jpg', 171)
GO
INSERT [snlg_V1].[TblUrunResim] ([UrunId], [Sira], [Resim], [ResimId]) VALUES (153, NULL, N'/uploads/images/urunler/2.jpg', 173)
GO
INSERT [snlg_V1].[TblUrunResim] ([UrunId], [Sira], [Resim], [ResimId]) VALUES (142, NULL, N'/uploads/images/urunler/3.jpg', 175)
GO
INSERT [snlg_V1].[TblUrunResim] ([UrunId], [Sira], [Resim], [ResimId]) VALUES (137, NULL, N'/uploads/images/urunler/4.jpg', 176)
GO
INSERT [snlg_V1].[TblUrunResim] ([UrunId], [Sira], [Resim], [ResimId]) VALUES (140, NULL, N'/uploads/images/urunler/1.jpg', 178)
GO
INSERT [snlg_V1].[TblUrunResim] ([UrunId], [Sira], [Resim], [ResimId]) VALUES (143, NULL, N'/uploads/images/urunler/3.jpg', 180)
GO
INSERT [snlg_V1].[TblUrunResim] ([UrunId], [Sira], [Resim], [ResimId]) VALUES (155, NULL, N'/uploads/images/urunler/2.jpg', 182)
GO
INSERT [snlg_V1].[TblUrunResim] ([UrunId], [Sira], [Resim], [ResimId]) VALUES (154, NULL, N'/uploads/images/urunler/1.jpg', 184)
GO
INSERT [snlg_V1].[TblUrunResim] ([UrunId], [Sira], [Resim], [ResimId]) VALUES (141, NULL, N'/uploads/images/urunler/4.jpg', 186)
GO
INSERT [snlg_V1].[TblUrunResim] ([UrunId], [Sira], [Resim], [ResimId]) VALUES (135, NULL, N'/uploads/images/urunler/5.jpg', 189)
GO
INSERT [snlg_V1].[TblUrunResim] ([UrunId], [Sira], [Resim], [ResimId]) VALUES (138, NULL, N'/uploads/images/urunler/11.jpg', 191)
GO
INSERT [snlg_V1].[TblUrunResim] ([UrunId], [Sira], [Resim], [ResimId]) VALUES (144, NULL, N'/uploads/images/urunler/6.jpg', 192)
GO
INSERT [snlg_V1].[TblUrunResim] ([UrunId], [Sira], [Resim], [ResimId]) VALUES (149, NULL, N'/uploads/images/urunler/9.jpg', 196)
GO
INSERT [snlg_V1].[TblUrunResim] ([UrunId], [Sira], [Resim], [ResimId]) VALUES (148, NULL, N'/uploads/images/urunler/10.jpg', 199)
GO
INSERT [snlg_V1].[TblUrunResim] ([UrunId], [Sira], [Resim], [ResimId]) VALUES (151, NULL, N'/uploads/images/urunler/2.jpg', 202)
GO
INSERT [snlg_V1].[TblUrunResim] ([UrunId], [Sira], [Resim], [ResimId]) VALUES (147, 3, N'/uploads/images/urunler/2.jpg', 204)
GO
INSERT [snlg_V1].[TblUrunResim] ([UrunId], [Sira], [Resim], [ResimId]) VALUES (150, 1, N'/uploads/images/urunler/2.jpg', 205)
GO
INSERT [snlg_V1].[TblUrunResim] ([UrunId], [Sira], [Resim], [ResimId]) VALUES (147, 4, N'/uploads/images/urunler/4.jpg', 206)
GO
INSERT [snlg_V1].[TblUrunResim] ([UrunId], [Sira], [Resim], [ResimId]) VALUES (144, NULL, N'/Uploads/Images/urunler/5.jpg', 217)
GO
INSERT [snlg_V1].[TblUrunResim] ([UrunId], [Sira], [Resim], [ResimId]) VALUES (145, NULL, N'/Uploads/Images/urunler/4.jpg', 218)
GO
INSERT [snlg_V1].[TblUrunResim] ([UrunId], [Sira], [Resim], [ResimId]) VALUES (148, NULL, N'/Uploads/Images/urunler/9.jpg', 219)
GO
INSERT [snlg_V1].[TblUrunResim] ([UrunId], [Sira], [Resim], [ResimId]) VALUES (149, NULL, N'/Uploads/Images/urunler/10.jpg', 220)
GO
INSERT [snlg_V1].[TblUrunResim] ([UrunId], [Sira], [Resim], [ResimId]) VALUES (137, NULL, N'/Uploads/Images/urunler/1.jpg', 221)
GO
INSERT [snlg_V1].[TblUrunResim] ([UrunId], [Sira], [Resim], [ResimId]) VALUES (141, NULL, N'/Uploads/Images/urunler/3.jpg', 222)
GO
SET IDENTITY_INSERT [snlg_V1].[TblUrunResim] OFF
GO
INSERT [snlg_V1].[TblUrunDetay] ([UrunId], [Dil], [SeoUrl], [UrunAd], [Bilgi], [Detay], [Keyword], [Descr]) VALUES (135, 31, N'classic-kahverengi-hakiki-deri-kemer', N'Classic Kahverengi Hakiki Deri Kemer', N'Qui hinc nobis quaerendum cu, in mea illud voluptaria. Ex erat eirmod qui. Mel at soleat labitur scripserit. Ius esse eros civibus te, eam ut suavitate dissentiet necessitatibus. Ea duo percipit signiferumque, eos et purto forensibus intellegebat. Mei ut enim vidit. Dicta inani vivendo ei mea, te eam eros idque bonorum. Aperiam dolorem reformidans mei id, ea cum probo cetero, eam cu tota aeque patrioque. Quaeque bonorum eos et, exerci consul tamquam ius eu. Quodsi dissentiet et mei. Case discere ullamcorper mei eu, ut mei tantas prodesset assueverit. Postea complectitur eum ea, eu mei incorrupte theophrastus definitionem. Ei errem sanctus eam, velit dolor integre an eos. Congue option pri at. Summo perfecto signiferumque ad sea, vim ne utr', N'<ul>
	<li>Materyal : %100 Hakiki Deri</li>
	<li>Taban: TERMO</li>
	<li>Topuk Boyu: 1 Cm</li>
	<li>Renk / Desen: Kahve</li>
	<li>Ürün Kodu: EÇ-713-Kahve</li>
</ul>

<p>Nam eu fastidii intellegat, eos enim wisi ei, harum eripuit fabellas ad duo. At eos malorum corrumpit, omnium oblique sed cu, homero virtute placerat quo ne. Id aperiri placerat deserunt pri. Ne sea solet scriptorem, ne summo nonumy mel. Mel vidit invidunt ex, pri id melius tincidunt.</p>

<h4>İade Şartları</h4>

<hr />NewCompany''de satın aldığınız ürünü sorunsuz olarak iade edebilirsiniz. Satın aldığınız ürün beklentilerinizi karşılamaz ise ürünü NewCompany''ye kolayca iade edebilirsiniz. İade işlemlerinizi aşağıdaki şekilde yapabilirsiniz:<br />
14 gün içerisinde, 0800 000 00 00 numaralı telefondan bize ulaşarak ürünü iade edebilirsiniz. Ürünü, orijinal kutusuyla ve faturasıyla birlikte NewCompany''ye iade gönderebilirsiniz. İadenizin kabul edilmesi için, ürünün hasar görmemiş ve kullanılmamış olması gerekmektedir.', NULL, NULL)
GO
INSERT [snlg_V1].[TblUrunDetay] ([UrunId], [Dil], [SeoUrl], [UrunAd], [Bilgi], [Detay], [Keyword], [Descr]) VALUES (137, 31, N'lisango-minti-kahverengi-suet-ayakkabi', N'Lisango Minti Kahverengi Süet Ayakkabı', N'Qui hinc nobis quaerendum cu, in mea illud voluptaria. Ex erat eirmod qui. Mel at soleat labitur scripserit. Ius esse eros civibus te, eam ut suavitate dissentiet necessitatibus. Ea duo percipit signiferumque, eos et purto forensibus intellegebat. Mei ut enim vidit. Dicta inani vivendo ei mea, te eam eros idque bonorum. Aperiam dolorem reformidans mei id, ea cum probo cetero, eam cu tota aeque patrioque. Quaeque bonorum eos et, exerci consul tamquam ius eu. Quodsi dissentiet et mei. Case discere ullamcorper mei eu, ut mei tantas prodesset assueverit. Postea complectitur eum ea, eu mei incorrupte theophrastus definitionem. Ei errem sanctus eam, velit dolor integre an eos. Congue option pri at. Summo perfecto signiferumque ad sea, vim ne utr', N'<ul>
	<li>Materyal : %100 Hakiki Deri</li>
	<li>Taban: TERMO</li>
	<li>Topuk Boyu: 1 Cm</li>
	<li>Renk / Desen: Kahve</li>
	<li>Ürün Kodu: EÇ-713-Kahve</li>
</ul>

<p>Nam eu fastidii intellegat, eos enim wisi ei, harum eripuit fabellas ad duo. At eos malorum corrumpit, omnium oblique sed cu, homero virtute placerat quo ne. Id aperiri placerat deserunt pri. Ne sea solet scriptorem, ne summo nonumy mel. Mel vidit invidunt ex, pri id melius tincidunt.</p>

<h4>İade Şartları</h4>

<hr />NewCompany''de satın aldığınız ürünü sorunsuz olarak iade edebilirsiniz. Satın aldığınız ürün beklentilerinizi karşılamaz ise ürünü NewCompany''ye kolayca iade edebilirsiniz. İade işlemlerinizi aşağıdaki şekilde yapabilirsiniz:<br />
14 gün içerisinde, 0800 000 00 00 numaralı telefondan bize ulaşarak ürünü iade edebilirsiniz. Ürünü, orijinal kutusuyla ve faturasıyla birlikte NewCompany''ye iade gönderebilirsiniz. İadenizin kabul edilmesi için, ürünün hasar görmemiş ve kullanılmamış olması gerekmektedir.', NULL, NULL)
GO
INSERT [snlg_V1].[TblUrunDetay] ([UrunId], [Dil], [SeoUrl], [UrunAd], [Bilgi], [Detay], [Keyword], [Descr]) VALUES (155, 31, N'lisango-minti-siyah-suet-ayakkabi', N'Lisango Minti Siyah Süet Ayakkabı', N'Qui hinc nobis quaerendum cu, in mea illud voluptaria. Ex erat eirmod qui. Mel at soleat labitur scripserit. Ius esse eros civibus te, eam ut suavitate dissentiet necessitatibus. Ea duo percipit signiferumque, eos et purto forensibus intellegebat. Mei ut enim vidit. Dicta inani vivendo ei mea, te eam eros idque bonorum. Aperiam dolorem reformidans mei id, ea cum probo cetero, eam cu tota aeque patrioque. Quaeque bonorum eos et, exerci consul tamquam ius eu. Quodsi dissentiet et mei. Case discere ullamcorper mei eu, ut mei tantas prodesset assueverit. Postea complectitur eum ea, eu mei incorrupte theophrastus definitionem. Ei errem sanctus eam, velit dolor integre an eos. Congue option pri at. Summo perfecto signiferumque ad sea, vim ne utr', N'<ul>
	<li>Materyal : %100 Hakiki Deri</li>
	<li>Taban: TERMO</li>
	<li>Topuk Boyu: 1 Cm</li>
	<li>Renk / Desen: Kahve</li>
	<li>Ürün Kodu: EÇ-713-Kahve</li>
</ul>

<p>Nam eu fastidii intellegat, eos enim wisi ei, harum eripuit fabellas ad duo. At eos malorum corrumpit, omnium oblique sed cu, homero virtute placerat quo ne. Id aperiri placerat deserunt pri. Ne sea solet scriptorem, ne summo nonumy mel. Mel vidit invidunt ex, pri id melius tincidunt.</p>

<h4>İade Şartları</h4>

<hr />NewCompany''de satın aldığınız ürünü sorunsuz olarak iade edebilirsiniz. Satın aldığınız ürün beklentilerinizi karşılamaz ise ürünü NewCompany''ye kolayca iade edebilirsiniz. İade işlemlerinizi aşağıdaki şekilde yapabilirsiniz:<br />
14 gün içerisinde, 0800 000 00 00 numaralı telefondan bize ulaşarak ürünü iade edebilirsiniz. Ürünü, orijinal kutusuyla ve faturasıyla birlikte NewCompany''ye iade gönderebilirsiniz. İadenizin kabul edilmesi için, ürünün hasar görmemiş ve kullanılmamış olması gerekmektedir.', NULL, NULL)
GO
INSERT [snlg_V1].[TblUrunDetay] ([UrunId], [Dil], [SeoUrl], [UrunAd], [Bilgi], [Detay], [Keyword], [Descr]) VALUES (138, 31, N'molinda-nova-kahverengi-deri-canta', N'Molinda Nova Kahverengi Deri Çanta', N'Qui hinc nobis quaerendum cu, in mea illud voluptaria. Ex erat eirmod qui. Mel at soleat labitur scripserit. Ius esse eros civibus te, eam ut suavitate dissentiet necessitatibus. Ea duo percipit signiferumque, eos et purto forensibus intellegebat. Mei ut enim vidit. Dicta inani vivendo ei mea, te eam eros idque bonorum. Aperiam dolorem reformidans mei id, ea cum probo cetero, eam cu tota aeque patrioque. Quaeque bonorum eos et, exerci consul tamquam ius eu. Quodsi dissentiet et mei. Case discere ullamcorper mei eu, ut mei tantas prodesset assueverit. Postea complectitur eum ea, eu mei incorrupte theophrastus definitionem. Ei errem sanctus eam, velit dolor integre an eos. Congue option pri at. Summo perfecto signiferumque ad sea, vim ne utr', N'<ul>
	<li>Materyal : %100 Hakiki Deri</li>
	<li>Taban: TERMO</li>
	<li>Topuk Boyu: 1 Cm</li>
	<li>Renk / Desen: Kahve</li>
	<li>Ürün Kodu: EÇ-713-Kahve</li>
</ul>

<p>Nam eu fastidii intellegat, eos enim wisi ei, harum eripuit fabellas ad duo. At eos malorum corrumpit, omnium oblique sed cu, homero virtute placerat quo ne. Id aperiri placerat deserunt pri. Ne sea solet scriptorem, ne summo nonumy mel. Mel vidit invidunt ex, pri id melius tincidunt.</p>

<h4>İade Şartları</h4>

<hr />NewCompany''de satın aldığınız ürünü sorunsuz olarak iade edebilirsiniz. Satın aldığınız ürün beklentilerinizi karşılamaz ise ürünü NewCompany''ye kolayca iade edebilirsiniz. İade işlemlerinizi aşağıdaki şekilde yapabilirsiniz:<br />
14 gün içerisinde, 0800 000 00 00 numaralı telefondan bize ulaşarak ürünü iade edebilirsiniz. Ürünü, orijinal kutusuyla ve faturasıyla birlikte NewCompany''ye iade gönderebilirsiniz. İadenizin kabul edilmesi için, ürünün hasar görmemiş ve kullanılmamış olması gerekmektedir.', NULL, NULL)
GO
INSERT [snlg_V1].[TblUrunDetay] ([UrunId], [Dil], [SeoUrl], [UrunAd], [Bilgi], [Detay], [Keyword], [Descr]) VALUES (140, 31, N'classic-kahverengi-hakiki-deri-ayakkabi', N'Classic Kahverengi Hakiki Deri Ayakkabı', N'Qui hinc nobis quaerendum cu, in mea illud voluptaria. Ex erat eirmod qui. Mel at soleat labitur scripserit. Ius esse eros civibus te, eam ut suavitate dissentiet necessitatibus. Ea duo percipit signiferumque, eos et purto forensibus intellegebat. Mei ut enim vidit. Dicta inani vivendo ei mea, te eam eros idque bonorum. Aperiam dolorem reformidans mei id, ea cum probo cetero, eam cu tota aeque patrioque. Quaeque bonorum eos et, exerci consul tamquam ius eu. Quodsi dissentiet et mei. Case discere ullamcorper mei eu, ut mei tantas prodesset assueverit. Postea complectitur eum ea, eu mei incorrupte theophrastus definitionem. Ei errem sanctus eam, velit dolor integre an eos. Congue option pri at. Summo perfecto signiferumque ad sea, vim ne utr', N'<ul>
	<li>Materyal : %100 Hakiki Deri</li>
	<li>Taban: TERMO</li>
	<li>Topuk Boyu: 1 Cm</li>
	<li>Renk / Desen: Kahve</li>
	<li>Ürün Kodu: EÇ-713-Kahve</li>
</ul>

<p>Nam eu fastidii intellegat, eos enim wisi ei, harum eripuit fabellas ad duo. At eos malorum corrumpit, omnium oblique sed cu, homero virtute placerat quo ne. Id aperiri placerat deserunt pri. Ne sea solet scriptorem, ne summo nonumy mel. Mel vidit invidunt ex, pri id melius tincidunt.</p>

<h4>İade Şartları</h4>

<hr />NewCompany''de satın aldığınız ürünü sorunsuz olarak iade edebilirsiniz. Satın aldığınız ürün beklentilerinizi karşılamaz ise ürünü NewCompany''ye kolayca iade edebilirsiniz. İade işlemlerinizi aşağıdaki şekilde yapabilirsiniz:<br />
14 gün içerisinde, 0800 000 00 00 numaralı telefondan bize ulaşarak ürünü iade edebilirsiniz. Ürünü, orijinal kutusuyla ve faturasıyla birlikte NewCompany''ye iade gönderebilirsiniz. İadenizin kabul edilmesi için, ürünün hasar görmemiş ve kullanılmamış olması gerekmektedir.', NULL, NULL)
GO
INSERT [snlg_V1].[TblUrunDetay] ([UrunId], [Dil], [SeoUrl], [UrunAd], [Bilgi], [Detay], [Keyword], [Descr]) VALUES (141, 31, N'lemonga-kahverengi-suet-ayakkabi', N'Lemonga Kahverengi Süet Ayakkabı', N'Qui hinc nobis quaerendum cu, in mea illud voluptaria. Ex erat eirmod qui. Mel at soleat labitur scripserit. Ius esse eros civibus te, eam ut suavitate dissentiet necessitatibus. Ea duo percipit signiferumque, eos et purto forensibus intellegebat. Mei ut enim vidit. Dicta inani vivendo ei mea, te eam eros idque bonorum. Aperiam dolorem reformidans mei id, ea cum probo cetero, eam cu tota aeque patrioque. Quaeque bonorum eos et, exerci consul tamquam ius eu. Quodsi dissentiet et mei. Case discere ullamcorper mei eu, ut mei tantas prodesset assueverit. Postea complectitur eum ea, eu mei incorrupte theophrastus definitionem. Ei errem sanctus eam, velit dolor integre an eos. Congue option pri at. Summo perfecto signiferumque ad sea, vim ne utr', N'<ul>
	<li>Materyal : %100 Hakiki Deri</li>
	<li>Taban: TERMO</li>
	<li>Topuk Boyu: 1 Cm</li>
	<li>Renk / Desen: Kahve</li>
	<li>Ürün Kodu: EÇ-713-Kahve</li>
</ul>

<p>Nam eu fastidii intellegat, eos enim wisi ei, harum eripuit fabellas ad duo. At eos malorum corrumpit, omnium oblique sed cu, homero virtute placerat quo ne. Id aperiri placerat deserunt pri. Ne sea solet scriptorem, ne summo nonumy mel. Mel vidit invidunt ex, pri id melius tincidunt.</p>

<h4>İade Şartları</h4>

<hr />NewCompany''de satın aldığınız ürünü sorunsuz olarak iade edebilirsiniz. Satın aldığınız ürün beklentilerinizi karşılamaz ise ürünü NewCompany''ye kolayca iade edebilirsiniz. İade işlemlerinizi aşağıdaki şekilde yapabilirsiniz:<br />
14 gün içerisinde, 0800 000 00 00 numaralı telefondan bize ulaşarak ürünü iade edebilirsiniz. Ürünü, orijinal kutusuyla ve faturasıyla birlikte NewCompany''ye iade gönderebilirsiniz. İadenizin kabul edilmesi için, ürünün hasar görmemiş ve kullanılmamış olması gerekmektedir.', NULL, NULL)
GO
INSERT [snlg_V1].[TblUrunDetay] ([UrunId], [Dil], [SeoUrl], [UrunAd], [Bilgi], [Detay], [Keyword], [Descr]) VALUES (142, 31, N'csx-kahverengi-deri-bot-ayakkabi', N'CSX Kahverengi Deri Bot Ayakkabı', N'Qui hinc nobis quaerendum cu, in mea illud voluptaria. Ex erat eirmod qui. Mel at soleat labitur scripserit. Ius esse eros civibus te, eam ut suavitate dissentiet necessitatibus. Ea duo percipit signiferumque, eos et purto forensibus intellegebat. Mei ut enim vidit. Dicta inani vivendo ei mea, te eam eros idque bonorum. Aperiam dolorem reformidans mei id, ea cum probo cetero, eam cu tota aeque patrioque. Quaeque bonorum eos et, exerci consul tamquam ius eu. Quodsi dissentiet et mei. Case discere ullamcorper mei eu, ut mei tantas prodesset assueverit. Postea complectitur eum ea, eu mei incorrupte theophrastus definitionem. Ei errem sanctus eam, velit dolor integre an eos. Congue option pri at. Summo perfecto signiferumque ad sea, vim ne utr', N'<ul>
	<li>Materyal : %100 Hakiki Deri</li>
	<li>Taban: TERMO</li>
	<li>Topuk Boyu: 1 Cm</li>
	<li>Renk / Desen: Kahve</li>
	<li>Ürün Kodu: EÇ-713-Kahve</li>
</ul>

<p>Nam eu fastidii intellegat, eos enim wisi ei, harum eripuit fabellas ad duo. At eos malorum corrumpit, omnium oblique sed cu, homero virtute placerat quo ne. Id aperiri placerat deserunt pri. Ne sea solet scriptorem, ne summo nonumy mel. Mel vidit invidunt ex, pri id melius tincidunt.</p>

<h4>İade Şartları</h4>

<hr />NewCompany''de satın aldığınız ürünü sorunsuz olarak iade edebilirsiniz. Satın aldığınız ürün beklentilerinizi karşılamaz ise ürünü NewCompany''ye kolayca iade edebilirsiniz. İade işlemlerinizi aşağıdaki şekilde yapabilirsiniz:<br />
14 gün içerisinde, 0800 000 00 00 numaralı telefondan bize ulaşarak ürünü iade edebilirsiniz. Ürünü, orijinal kutusuyla ve faturasıyla birlikte NewCompany''ye iade gönderebilirsiniz. İadenizin kabul edilmesi için, ürünün hasar görmemiş ve kullanılmamış olması gerekmektedir.', NULL, NULL)
GO
INSERT [snlg_V1].[TblUrunDetay] ([UrunId], [Dil], [SeoUrl], [UrunAd], [Bilgi], [Detay], [Keyword], [Descr]) VALUES (143, 31, N'modasen-kahverengi-deri-bot-ayakkabi', N'Modasen Kahverengi Deri Bot Ayakkabı', N'Qui hinc nobis quaerendum cu, in mea illud voluptaria. Ex erat eirmod qui. Mel at soleat labitur scripserit. Ius esse eros civibus te, eam ut suavitate dissentiet necessitatibus. Ea duo percipit signiferumque, eos et purto forensibus intellegebat. Mei ut enim vidit. Dicta inani vivendo ei mea, te eam eros idque bonorum. Aperiam dolorem reformidans mei id, ea cum probo cetero, eam cu tota aeque patrioque. Quaeque bonorum eos et, exerci consul tamquam ius eu. Quodsi dissentiet et mei. Case discere ullamcorper mei eu, ut mei tantas prodesset assueverit. Postea complectitur eum ea, eu mei incorrupte theophrastus definitionem. Ei errem sanctus eam, velit dolor integre an eos. Congue option pri at. Summo perfecto signiferumque ad sea, vim ne utr', N'<ul>
	<li>Materyal : %100 Hakiki Deri</li>
	<li>Taban: TERMO</li>
	<li>Topuk Boyu: 1 Cm</li>
	<li>Renk / Desen: Kahve</li>
	<li>Ürün Kodu: EÇ-713-Kahve</li>
</ul>

<p>Nam eu fastidii intellegat, eos enim wisi ei, harum eripuit fabellas ad duo. At eos malorum corrumpit, omnium oblique sed cu, homero virtute placerat quo ne. Id aperiri placerat deserunt pri. Ne sea solet scriptorem, ne summo nonumy mel. Mel vidit invidunt ex, pri id melius tincidunt.</p>

<h4>İade Şartları</h4>

<hr />NewCompany''de satın aldığınız ürünü sorunsuz olarak iade edebilirsiniz. Satın aldığınız ürün beklentilerinizi karşılamaz ise ürünü NewCompany''ye kolayca iade edebilirsiniz. İade işlemlerinizi aşağıdaki şekilde yapabilirsiniz:<br />
14 gün içerisinde, 0800 000 00 00 numaralı telefondan bize ulaşarak ürünü iade edebilirsiniz. Ürünü, orijinal kutusuyla ve faturasıyla birlikte NewCompany''ye iade gönderebilirsiniz. İadenizin kabul edilmesi için, ürünün hasar görmemiş ve kullanılmamış olması gerekmektedir.', NULL, NULL)
GO
INSERT [snlg_V1].[TblUrunDetay] ([UrunId], [Dil], [SeoUrl], [UrunAd], [Bilgi], [Detay], [Keyword], [Descr]) VALUES (144, 31, N'trendy-kahverengi-hakiki-deri-kemer', N'Trendy Kahverengi Hakiki Deri Kemer', N'Qui hinc nobis quaerendum cu, in mea illud voluptaria. Ex erat eirmod qui. Mel at soleat labitur scripserit. Ius esse eros civibus te, eam ut suavitate dissentiet necessitatibus. Ea duo percipit signiferumque, eos et purto forensibus intellegebat. Mei ut enim vidit. Dicta inani vivendo ei mea, te eam eros idque bonorum. Aperiam dolorem reformidans mei id, ea cum probo cetero, eam cu tota aeque patrioque. Quaeque bonorum eos et, exerci consul tamquam ius eu. Quodsi dissentiet et mei. Case discere ullamcorper mei eu, ut mei tantas prodesset assueverit. Postea complectitur eum ea, eu mei incorrupte theophrastus definitionem. Ei errem sanctus eam, velit dolor integre an eos. Congue option pri at. Summo perfecto signiferumque ad sea, vim ne utr', N'<ul>
	<li>Materyal : %100 Hakiki Deri</li>
	<li>Taban: TERMO</li>
	<li>Topuk Boyu: 1 Cm</li>
	<li>Renk / Desen: Kahve</li>
	<li>Ürün Kodu: EÇ-713-Kahve</li>
</ul>

<p>Nam eu fastidii intellegat, eos enim wisi ei, harum eripuit fabellas ad duo. At eos malorum corrumpit, omnium oblique sed cu, homero virtute placerat quo ne. Id aperiri placerat deserunt pri. Ne sea solet scriptorem, ne summo nonumy mel. Mel vidit invidunt ex, pri id melius tincidunt.</p>

<h4>İade Şartları</h4>

<hr />NewCompany''de satın aldığınız ürünü sorunsuz olarak iade edebilirsiniz. Satın aldığınız ürün beklentilerinizi karşılamaz ise ürünü NewCompany''ye kolayca iade edebilirsiniz. İade işlemlerinizi aşağıdaki şekilde yapabilirsiniz:<br />
14 gün içerisinde, 0800 000 00 00 numaralı telefondan bize ulaşarak ürünü iade edebilirsiniz. Ürünü, orijinal kutusuyla ve faturasıyla birlikte NewCompany''ye iade gönderebilirsiniz. İadenizin kabul edilmesi için, ürünün hasar görmemiş ve kullanılmamış olması gerekmektedir.', NULL, NULL)
GO
INSERT [snlg_V1].[TblUrunDetay] ([UrunId], [Dil], [SeoUrl], [UrunAd], [Bilgi], [Detay], [Keyword], [Descr]) VALUES (145, 31, N'deridenna-deri-ayakkabi', N'Deridenna Moda Deri Ayakkabı', N'Qui hinc nobis quaerendum cu, in mea illud voluptaria. Ex erat eirmod qui. Mel at soleat labitur scripserit. Ius esse eros civibus te, eam ut suavitate dissentiet necessitatibus. Ea duo percipit signiferumque, eos et purto forensibus intellegebat. Mei ut enim vidit. Dicta inani vivendo ei mea, te eam eros idque bonorum. Aperiam dolorem reformidans mei id, ea cum probo cetero, eam cu tota aeque patrioque. Quaeque bonorum eos et, exerci consul tamquam ius eu. Quodsi dissentiet et mei. Case discere ullamcorper mei eu, ut mei tantas prodesset assueverit. Postea complectitur eum ea, eu mei incorrupte theophrastus definitionem. Ei errem sanctus eam, velit dolor integre an eos. Congue option pri at. Summo perfecto signiferumque ad sea, vim ne utr', N'<ul>
	<li>Materyal : %100 Hakiki Deri</li>
	<li>Taban: TERMO</li>
	<li>Topuk Boyu: 1 Cm</li>
	<li>Renk / Desen: Kahve</li>
	<li>Ürün Kodu: EÇ-713-Kahve</li>
</ul>

<p>Nam eu fastidii intellegat, eos enim wisi ei, harum eripuit fabellas ad duo. At eos malorum corrumpit, omnium oblique sed cu, homero virtute placerat quo ne. Id aperiri placerat deserunt pri. Ne sea solet scriptorem, ne summo nonumy mel. Mel vidit invidunt ex, pri id melius tincidunt.</p>

<h4>İade Şartları</h4>

<hr />NewCompany''de satın aldığınız ürünü sorunsuz olarak iade edebilirsiniz. Satın aldığınız ürün beklentilerinizi karşılamaz ise ürünü NewCompany''ye kolayca iade edebilirsiniz. İade işlemlerinizi aşağıdaki şekilde yapabilirsiniz:<br />
14 gün içerisinde, 0800 000 00 00 numaralı telefondan bize ulaşarak ürünü iade edebilirsiniz. Ürünü, orijinal kutusuyla ve faturasıyla birlikte NewCompany''ye iade gönderebilirsiniz. İadenizin kabul edilmesi için, ürünün hasar görmemiş ve kullanılmamış olması gerekmektedir.', NULL, NULL)
GO
INSERT [snlg_V1].[TblUrunDetay] ([UrunId], [Dil], [SeoUrl], [UrunAd], [Bilgi], [Detay], [Keyword], [Descr]) VALUES (147, 31, N'modafans-hakiki-deri-ayakkabi', N'Modafans Hakiki Deri Ayakkabı', N'Qui hinc nobis quaerendum cu, in mea illud voluptaria. Ex erat eirmod qui. Mel at soleat labitur scripserit. Ius esse eros civibus te, eam ut suavitate dissentiet necessitatibus. Ea duo percipit signiferumque, eos et purto forensibus intellegebat. Mei ut enim vidit. Dicta inani vivendo ei mea, te eam eros idque bonorum. Aperiam dolorem reformidans mei id, ea cum probo cetero, eam cu tota aeque patrioque. Quaeque bonorum eos et, exerci consul tamquam ius eu. Quodsi dissentiet et mei. Case discere ullamcorper mei eu, ut mei tantas prodesset assueverit. Postea complectitur eum ea, eu mei incorrupte theophrastus definitionem. Ei errem sanctus eam, velit dolor integre an eos. Congue option pri at. Summo perfecto signiferumque ad sea, vim ne utr.', N'<ul>
	<li>Materyal : %100 Hakiki Deri</li>
	<li>Taban: TERMO</li>
	<li>Topuk Boyu: 1 Cm</li>
	<li>Renk / Desen: Kahve</li>
	<li>Ürün Kodu: EÇ-713-Kahve</li>
</ul>

<p>Nam eu fastidii intellegat, eos enim wisi ei, harum eripuit fabellas ad duo. At eos malorum corrumpit, omnium oblique sed cu, homero virtute placerat quo ne. Id aperiri placerat deserunt pri. Ne sea solet scriptorem, ne summo nonumy mel. Mel vidit invidunt ex, pri id melius tincidunt.</p>

<h4>İade Şartları</h4>

<hr />NewCompany''de satın aldığınız ürünü sorunsuz olarak iade edebilirsiniz. Satın aldığınız ürün beklentilerinizi karşılamaz ise ürünü NewCompany''ye kolayca iade edebilirsiniz. İade işlemlerinizi aşağıdaki şekilde yapabilirsiniz:<br />
14 gün içerisinde, 0800 000 00 00 numaralı telefondan bize ulaşarak ürünü iade edebilirsiniz. Ürünü, orijinal kutusuyla ve faturasıyla birlikte NewCompany''ye iade gönderebilirsiniz. İadenizin kabul edilmesi için, ürünün hasar görmemiş ve kullanılmamış olması gerekmektedir.', NULL, NULL)
GO
INSERT [snlg_V1].[TblUrunDetay] ([UrunId], [Dil], [SeoUrl], [UrunAd], [Bilgi], [Detay], [Keyword], [Descr]) VALUES (148, 31, N'cossy-moda-tam-beyaz-gomlek', N'Cossy Moda Tam Beyaz Gömlek', N'Qui hinc nobis quaerendum cu, in mea illud voluptaria. Ex erat eirmod qui. Mel at soleat labitur scripserit. Ius esse eros civibus te, eam ut suavitate dissentiet necessitatibus. Ea duo percipit signiferumque, eos et purto forensibus intellegebat. Mei ut enim vidit. Dicta inani vivendo ei mea, te eam eros idque bonorum. Aperiam dolorem reformidans mei id, ea cum probo cetero, eam cu tota aeque patrioque. Quaeque bonorum eos et, exerci consul tamquam ius eu. Quodsi dissentiet et mei. Case discere ullamcorper mei eu, ut mei tantas prodesset assueverit. Postea complectitur eum ea, eu mei incorrupte theophrastus definitionem. Ei errem sanctus eam, velit dolor integre an eos. Congue option pri at. Summo perfecto signiferumque ad sea, vim ne utr', N'<ul>
	<li>Materyal : %100 Hakiki Deri</li>
	<li>Taban: TERMO</li>
	<li>Topuk Boyu: 1 Cm</li>
	<li>Renk / Desen: Kahve</li>
	<li>Ürün Kodu: EÇ-713-Kahve</li>
</ul>

<p>Nam eu fastidii intellegat, eos enim wisi ei, harum eripuit fabellas ad duo. At eos malorum corrumpit, omnium oblique sed cu, homero virtute placerat quo ne. Id aperiri placerat deserunt pri. Ne sea solet scriptorem, ne summo nonumy mel. Mel vidit invidunt ex, pri id melius tincidunt.</p>

<h4>İade Şartları</h4>

<hr />NewCompany''de satın aldığınız ürünü sorunsuz olarak iade edebilirsiniz. Satın aldığınız ürün beklentilerinizi karşılamaz ise ürünü NewCompany''ye kolayca iade edebilirsiniz. İade işlemlerinizi aşağıdaki şekilde yapabilirsiniz:<br />
14 gün içerisinde, 0800 000 00 00 numaralı telefondan bize ulaşarak ürünü iade edebilirsiniz. Ürünü, orijinal kutusuyla ve faturasıyla birlikte NewCompany''ye iade gönderebilirsiniz. İadenizin kabul edilmesi için, ürünün hasar görmemiş ve kullanılmamış olması gerekmektedir.', NULL, NULL)
GO
INSERT [snlg_V1].[TblUrunDetay] ([UrunId], [Dil], [SeoUrl], [UrunAd], [Bilgi], [Detay], [Keyword], [Descr]) VALUES (150, 31, N'palenda-kahverengi-deri-bot-ayakkabi', N'Palenda Kahverengi Deri Bot Ayakkabı', N'Qui hinc nobis quaerendum cu, in mea illud voluptaria. Ex erat eirmod qui. Mel at soleat labitur scripserit. Ius esse eros civibus te, eam ut suavitate dissentiet necessitatibus. Ea duo percipit signiferumque, eos et purto forensibus intellegebat. Mei ut enim vidit. Dicta inani vivendo ei mea, te eam eros idque bonorum. Aperiam dolorem reformidans mei id, ea cum probo cetero, eam cu tota aeque patrioque. Quaeque bonorum eos et, exerci consul tamquam ius eu. Quodsi dissentiet et mei. Case discere ullamcorper mei eu, ut mei tantas prodesset assueverit. Postea complectitur eum ea, eu mei incorrupte theophrastus definitionem. Ei errem sanctus eam, velit dolor integre an eos. Congue option pri at. Summo perfecto signiferumque ad sea, vim ne utr', N'<ul>
	<li>Materyal : %100 Hakiki Deri</li>
	<li>Taban: TERMO</li>
	<li>Topuk Boyu: 1 Cm</li>
	<li>Renk / Desen: Kahve</li>
	<li>Ürün Kodu: EÇ-713-Kahve</li>
</ul>

<p>Nam eu fastidii intellegat, eos enim wisi ei, harum eripuit fabellas ad duo. At eos malorum corrumpit, omnium oblique sed cu, homero virtute placerat quo ne. Id aperiri placerat deserunt pri. Ne sea solet scriptorem, ne summo nonumy mel. Mel vidit invidunt ex, pri id melius tincidunt.</p>

<h4>İade Şartları</h4>

<hr />NewCompany''de satın aldığınız ürünü sorunsuz olarak iade edebilirsiniz. Satın aldığınız ürün beklentilerinizi karşılamaz ise ürünü NewCompany''ye kolayca iade edebilirsiniz. İade işlemlerinizi aşağıdaki şekilde yapabilirsiniz:<br />
14 gün içerisinde, 0800 000 00 00 numaralı telefondan bize ulaşarak ürünü iade edebilirsiniz. Ürünü, orijinal kutusuyla ve faturasıyla birlikte NewCompany''ye iade gönderebilirsiniz. İadenizin kabul edilmesi için, ürünün hasar görmemiş ve kullanılmamış olması gerekmektedir.', NULL, NULL)
GO
INSERT [snlg_V1].[TblUrunDetay] ([UrunId], [Dil], [SeoUrl], [UrunAd], [Bilgi], [Detay], [Keyword], [Descr]) VALUES (149, 31, N'cossy-moda-buz-mavisi-gomlek', N'Cossy Moda Buz Mavisi Gömlek', N'Qui hinc nobis quaerendum cu, in mea illud voluptaria. Ex erat eirmod qui. Mel at soleat labitur scripserit. Ius esse eros civibus te, eam ut suavitate dissentiet necessitatibus. Ea duo percipit signiferumque, eos et purto forensibus intellegebat. Mei ut enim vidit. Dicta inani vivendo ei mea, te eam eros idque bonorum. Aperiam dolorem reformidans mei id, ea cum probo cetero, eam cu tota aeque patrioque. Quaeque bonorum eos et, exerci consul tamquam ius eu. Quodsi dissentiet et mei. Case discere ullamcorper mei eu, ut mei tantas prodesset assueverit. Postea complectitur eum ea, eu mei incorrupte theophrastus definitionem. Ei errem sanctus eam, velit dolor integre an eos. Congue option pri at. Summo perfecto signiferumque ad sea, vim ne utr', N'<ul>
	<li>Materyal : %100 Hakiki Deri</li>
	<li>Taban: TERMO</li>
	<li>Topuk Boyu: 1 Cm</li>
	<li>Renk / Desen: Kahve</li>
	<li>Ürün Kodu: EÇ-713-Kahve</li>
</ul>

<p>Nam eu fastidii intellegat, eos enim wisi ei, harum eripuit fabellas ad duo. At eos malorum corrumpit, omnium oblique sed cu, homero virtute placerat quo ne. Id aperiri placerat deserunt pri. Ne sea solet scriptorem, ne summo nonumy mel. Mel vidit invidunt ex, pri id melius tincidunt.</p>

<h4>İade Şartları</h4>

<hr />NewCompany''de satın aldığınız ürünü sorunsuz olarak iade edebilirsiniz. Satın aldığınız ürün beklentilerinizi karşılamaz ise ürünü NewCompany''ye kolayca iade edebilirsiniz. İade işlemlerinizi aşağıdaki şekilde yapabilirsiniz:<br />
14 gün içerisinde, 0800 000 00 00 numaralı telefondan bize ulaşarak ürünü iade edebilirsiniz. Ürünü, orijinal kutusuyla ve faturasıyla birlikte NewCompany''ye iade gönderebilirsiniz. İadenizin kabul edilmesi için, ürünün hasar görmemiş ve kullanılmamış olması gerekmektedir.', NULL, NULL)
GO
INSERT [snlg_V1].[TblUrunDetay] ([UrunId], [Dil], [SeoUrl], [UrunAd], [Bilgi], [Detay], [Keyword], [Descr]) VALUES (151, 31, N'malinda-minti-siyah-suet-ayakkabi', N'Malinda Minti Siyah Süet Ayakkabı', N'Qui hinc nobis quaerendum cu, in mea illud voluptaria. Ex erat eirmod qui. Mel at soleat labitur scripserit. Ius esse eros civibus te, eam ut suavitate dissentiet necessitatibus. Ea duo percipit signiferumque, eos et purto forensibus intellegebat. Mei ut enim vidit. Dicta inani vivendo ei mea, te eam eros idque bonorum. Aperiam dolorem reformidans mei id, ea cum probo cetero, eam cu tota aeque patrioque. Quaeque bonorum eos et, exerci consul tamquam ius eu. Quodsi dissentiet et mei. Case discere ullamcorper mei eu, ut mei tantas prodesset assueverit. Postea complectitur eum ea, eu mei incorrupte theophrastus definitionem. Ei errem sanctus eam, velit dolor integre an eos. Congue option pri at. Summo perfecto signiferumque ad sea, vim ne utr', N'<ul>
	<li>Materyal : %100 Hakiki Deri</li>
	<li>Taban: TERMO</li>
	<li>Topuk Boyu: 1 Cm</li>
	<li>Renk / Desen: Kahve</li>
	<li>Ürün Kodu: EÇ-713-Kahve</li>
</ul>

<p>Nam eu fastidii intellegat, eos enim wisi ei, harum eripuit fabellas ad duo. At eos malorum corrumpit, omnium oblique sed cu, homero virtute placerat quo ne. Id aperiri placerat deserunt pri. Ne sea solet scriptorem, ne summo nonumy mel. Mel vidit invidunt ex, pri id melius tincidunt.</p>

<h4>İade Şartları</h4>

<hr />NewCompany''de satın aldığınız ürünü sorunsuz olarak iade edebilirsiniz. Satın aldığınız ürün beklentilerinizi karşılamaz ise ürünü NewCompany''ye kolayca iade edebilirsiniz. İade işlemlerinizi aşağıdaki şekilde yapabilirsiniz:<br />
14 gün içerisinde, 0800 000 00 00 numaralı telefondan bize ulaşarak ürünü iade edebilirsiniz. Ürünü, orijinal kutusuyla ve faturasıyla birlikte NewCompany''ye iade gönderebilirsiniz. İadenizin kabul edilmesi için, ürünün hasar görmemiş ve kullanılmamış olması gerekmektedir.', NULL, NULL)
GO
INSERT [snlg_V1].[TblUrunDetay] ([UrunId], [Dil], [SeoUrl], [UrunAd], [Bilgi], [Detay], [Keyword], [Descr]) VALUES (152, 31, N'quadro-mix-kahverengi-bot-ayakkabi', N'Quadro Mix Kahverengi Bot Ayakkabı', N'Qui hinc nobis quaerendum cu, in mea illud voluptaria. Ex erat eirmod qui. Mel at soleat labitur scripserit. Ius esse eros civibus te, eam ut suavitate dissentiet necessitatibus. Ea duo percipit signiferumque, eos et purto forensibus intellegebat. Mei ut enim vidit. Dicta inani vivendo ei mea, te eam eros idque bonorum. Aperiam dolorem reformidans mei id, ea cum probo cetero, eam cu tota aeque patrioque. Quaeque bonorum eos et, exerci consul tamquam ius eu. Quodsi dissentiet et mei. Case discere ullamcorper mei eu, ut mei tantas prodesset assueverit. Postea complectitur eum ea, eu mei incorrupte theophrastus definitionem. Ei errem sanctus eam, velit dolor integre an eos. Congue option pri at. Summo perfecto signiferumque ad sea, vim ne utr', N'<ul>
	<li>Materyal : %100 Hakiki Deri</li>
	<li>Taban: TERMO</li>
	<li>Topuk Boyu: 1 Cm</li>
	<li>Renk / Desen: Kahve</li>
	<li>Ürün Kodu: EÇ-713-Kahve</li>
</ul>

<p>Nam eu fastidii intellegat, eos enim wisi ei, harum eripuit fabellas ad duo. At eos malorum corrumpit, omnium oblique sed cu, homero virtute placerat quo ne. Id aperiri placerat deserunt pri. Ne sea solet scriptorem, ne summo nonumy mel. Mel vidit invidunt ex, pri id melius tincidunt.</p>

<h4>İade Şartları</h4>

<hr />NewCompany''de satın aldığınız ürünü sorunsuz olarak iade edebilirsiniz. Satın aldığınız ürün beklentilerinizi karşılamaz ise ürünü NewCompany''ye kolayca iade edebilirsiniz. İade işlemlerinizi aşağıdaki şekilde yapabilirsiniz:<br />
14 gün içerisinde, 0800 000 00 00 numaralı telefondan bize ulaşarak ürünü iade edebilirsiniz. Ürünü, orijinal kutusuyla ve faturasıyla birlikte NewCompany''ye iade gönderebilirsiniz. İadenizin kabul edilmesi için, ürünün hasar görmemiş ve kullanılmamış olması gerekmektedir.', NULL, NULL)
GO
INSERT [snlg_V1].[TblUrunDetay] ([UrunId], [Dil], [SeoUrl], [UrunAd], [Bilgi], [Detay], [Keyword], [Descr]) VALUES (153, 31, N'atlanta-hakiki-siyah-deri-ayakkabi', N'Atlanta Hakiki Siyah Deri Ayakkabı', N'Qui hinc nobis quaerendum cu, in mea illud voluptaria. Ex erat eirmod qui. Mel at soleat labitur scripserit. Ius esse eros civibus te, eam ut suavitate dissentiet necessitatibus. Ea duo percipit signiferumque, eos et purto forensibus intellegebat. Mei ut enim vidit. Dicta inani vivendo ei mea, te eam eros idque bonorum. Aperiam dolorem reformidans mei id, ea cum probo cetero, eam cu tota aeque patrioque. Quaeque bonorum eos et, exerci consul tamquam ius eu. Quodsi dissentiet et mei. Case discere ullamcorper mei eu, ut mei tantas prodesset assueverit. Postea complectitur eum ea, eu mei incorrupte theophrastus definitionem. Ei errem sanctus eam, velit dolor integre an eos. Congue option pri at. Summo perfecto signiferumque ad sea, vim ne utr', N'<ul>
	<li>Materyal : %100 Hakiki Deri</li>
	<li>Taban: TERMO</li>
	<li>Topuk Boyu: 1 Cm</li>
	<li>Renk / Desen: Kahve</li>
	<li>Ürün Kodu: EÇ-713-Kahve</li>
</ul>

<p>Nam eu fastidii intellegat, eos enim wisi ei, harum eripuit fabellas ad duo. At eos malorum corrumpit, omnium oblique sed cu, homero virtute placerat quo ne. Id aperiri placerat deserunt pri. Ne sea solet scriptorem, ne summo nonumy mel. Mel vidit invidunt ex, pri id melius tincidunt.</p>

<h4>İade Şartları</h4>

<hr />NewCompany''de satın aldığınız ürünü sorunsuz olarak iade edebilirsiniz. Satın aldığınız ürün beklentilerinizi karşılamaz ise ürünü NewCompany''ye kolayca iade edebilirsiniz. İade işlemlerinizi aşağıdaki şekilde yapabilirsiniz:<br />
14 gün içerisinde, 0800 000 00 00 numaralı telefondan bize ulaşarak ürünü iade edebilirsiniz. Ürünü, orijinal kutusuyla ve faturasıyla birlikte NewCompany''ye iade gönderebilirsiniz. İadenizin kabul edilmesi için, ürünün hasar görmemiş ve kullanılmamış olması gerekmektedir.', NULL, NULL)
GO
INSERT [snlg_V1].[TblUrunDetay] ([UrunId], [Dil], [SeoUrl], [UrunAd], [Bilgi], [Detay], [Keyword], [Descr]) VALUES (154, 31, N'classic-kahverengi-modern-ayakkabi', N'Classic Kahverengi Modern Ayakkabı', N'Qui hinc nobis quaerendum cu, in mea illud voluptaria. Ex erat eirmod qui. Mel at soleat labitur scripserit. Ius esse eros civibus te, eam ut suavitate dissentiet necessitatibus. Ea duo percipit signiferumque, eos et purto forensibus intellegebat. Mei ut enim vidit. Dicta inani vivendo ei mea, te eam eros idque bonorum. Aperiam dolorem reformidans mei id, ea cum probo cetero, eam cu tota aeque patrioque. Quaeque bonorum eos et, exerci consul tamquam ius eu. Quodsi dissentiet et mei. Case discere ullamcorper mei eu, ut mei tantas prodesset assueverit. Postea complectitur eum ea, eu mei incorrupte theophrastus definitionem. Ei errem sanctus eam, velit dolor integre an eos. Congue option pri at. Summo perfecto signiferumque ad sea, vim ne utr', N'<ul>
	<li>Materyal : %100 Hakiki Deri</li>
	<li>Taban: TERMO</li>
	<li>Topuk Boyu: 1 Cm</li>
	<li>Renk / Desen: Kahve</li>
	<li>Ürün Kodu: EÇ-713-Kahve</li>
</ul>

<p>Nam eu fastidii intellegat, eos enim wisi ei, harum eripuit fabellas ad duo. At eos malorum corrumpit, omnium oblique sed cu, homero virtute placerat quo ne. Id aperiri placerat deserunt pri. Ne sea solet scriptorem, ne summo nonumy mel. Mel vidit invidunt ex, pri id melius tincidunt.</p>

<h4>İade Şartları</h4>

<hr />NewCompany''de satın aldığınız ürünü sorunsuz olarak iade edebilirsiniz. Satın aldığınız ürün beklentilerinizi karşılamaz ise ürünü NewCompany''ye kolayca iade edebilirsiniz. İade işlemlerinizi aşağıdaki şekilde yapabilirsiniz:<br />
14 gün içerisinde, 0800 000 00 00 numaralı telefondan bize ulaşarak ürünü iade edebilirsiniz. Ürünü, orijinal kutusuyla ve faturasıyla birlikte NewCompany''ye iade gönderebilirsiniz. İadenizin kabul edilmesi için, ürünün hasar görmemiş ve kullanılmamış olması gerekmektedir.', NULL, NULL)
GO
SET IDENTITY_INSERT [snlg_V1].[TblUrunKtgApp] ON 

GO
INSERT [snlg_V1].[TblUrunKtgApp] ([KtgId], [Sira], [Resim], [UstId], [Aktif]) VALUES (203, NULL, NULL, NULL, 1)
GO
INSERT [snlg_V1].[TblUrunKtgApp] ([KtgId], [Sira], [Resim], [UstId], [Aktif]) VALUES (204, NULL, NULL, NULL, 1)
GO
INSERT [snlg_V1].[TblUrunKtgApp] ([KtgId], [Sira], [Resim], [UstId], [Aktif]) VALUES (219, NULL, NULL, 204, 1)
GO
INSERT [snlg_V1].[TblUrunKtgApp] ([KtgId], [Sira], [Resim], [UstId], [Aktif]) VALUES (220, NULL, NULL, 204, 1)
GO
SET IDENTITY_INSERT [snlg_V1].[TblUrunKtgApp] OFF
GO
INSERT [snlg_V1].[TblUrun_Kategori] ([UrunId], [KtgId]) VALUES (138, 220)
GO
INSERT [snlg_V1].[TblUrun_Kategori] ([UrunId], [KtgId]) VALUES (148, 219)
GO
INSERT [snlg_V1].[TblUrun_Kategori] ([UrunId], [KtgId]) VALUES (144, 220)
GO
INSERT [snlg_V1].[TblUrun_Kategori] ([UrunId], [KtgId]) VALUES (145, 203)
GO
INSERT [snlg_V1].[TblUrun_Kategori] ([UrunId], [KtgId]) VALUES (152, 203)
GO
INSERT [snlg_V1].[TblUrun_Kategori] ([UrunId], [KtgId]) VALUES (153, 203)
GO
INSERT [snlg_V1].[TblUrun_Kategori] ([UrunId], [KtgId]) VALUES (137, 203)
GO
INSERT [snlg_V1].[TblUrun_Kategori] ([UrunId], [KtgId]) VALUES (142, 203)
GO
INSERT [snlg_V1].[TblUrun_Kategori] ([UrunId], [KtgId]) VALUES (143, 203)
GO
INSERT [snlg_V1].[TblUrun_Kategori] ([UrunId], [KtgId]) VALUES (149, 219)
GO
INSERT [snlg_V1].[TblUrun_Kategori] ([UrunId], [KtgId]) VALUES (155, 203)
GO
INSERT [snlg_V1].[TblUrun_Kategori] ([UrunId], [KtgId]) VALUES (154, 203)
GO
INSERT [snlg_V1].[TblUrun_Kategori] ([UrunId], [KtgId]) VALUES (147, 203)
GO
INSERT [snlg_V1].[TblUrun_Kategori] ([UrunId], [KtgId]) VALUES (141, 203)
GO
INSERT [snlg_V1].[TblUrun_Kategori] ([UrunId], [KtgId]) VALUES (151, 203)
GO
INSERT [snlg_V1].[TblUrun_Kategori] ([UrunId], [KtgId]) VALUES (135, 220)
GO
INSERT [snlg_V1].[TblUrun_Kategori] ([UrunId], [KtgId]) VALUES (140, 203)
GO
INSERT [snlg_V1].[TblUrun_Kategori] ([UrunId], [KtgId]) VALUES (150, 203)
GO
INSERT [snlg_V1].[TblProjeDetay] ([ProjeId], [Dil], [Baslik], [Bilgi]) VALUES (30, 31, N'Moda Palas', N'Idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness')
GO
INSERT [snlg_V1].[TblProjeDetay] ([ProjeId], [Dil], [Baslik], [Bilgi]) VALUES (26, 31, N'Vitae Mondi', N'Idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness')
GO
INSERT [snlg_V1].[TblProjeDetay] ([ProjeId], [Dil], [Baslik], [Bilgi]) VALUES (31, 31, N'Vertimos', N'Idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness')
GO
INSERT [snlg_V1].[TblReferansKtgDetay] ([KtgId], [Dil], [KtgAd], [SeoUrl]) VALUES (1, 31, N'Referanslar', N'referanslar')
GO
INSERT [snlg_V1].[TblReferansKtgDetay] ([KtgId], [Dil], [KtgAd], [SeoUrl]) VALUES (2, 31, N'Partnerler', N'partnerler')
GO
SET IDENTITY_INSERT [snlg_V1].[TblEtkinlikApp] ON 

GO
INSERT [snlg_V1].[TblEtkinlikApp] ([EtkinlikId], [Tarih1], [Tarih2], [Resim]) VALUES (1, CAST(N'2016-11-11 20:14:00' AS SmallDateTime), CAST(N'2016-11-11 23:14:00' AS SmallDateTime), NULL)
GO
INSERT [snlg_V1].[TblEtkinlikApp] ([EtkinlikId], [Tarih1], [Tarih2], [Resim]) VALUES (5, CAST(N'2016-04-06 21:00:00' AS SmallDateTime), CAST(N'2016-04-07 23:45:00' AS SmallDateTime), NULL)
GO
SET IDENTITY_INSERT [snlg_V1].[TblEtkinlikApp] OFF
GO
INSERT [snlg_V1].[TblEtkinlikDetay] ([EtkinlikId], [Dil], [Baslik], [Detay]) VALUES (1, 31, N'24 Kasım Öğretmenler Günü', N'<p><strong>Lorem Ipsum</strong>, dizgi ve baskı endüstrisinde kullanılan mıgır metinlerdir. Lorem Ipsum, adı bilinmeyen bir matbaacının bir hurufat numune kitabı oluşturmak üzere bir yazı galerisini alarak karıştırdığı 1500''lerden beri endüstri standardı sahte metinler olarak kullanılmıştır. Beşyüz yıl boyunca varlığını sürdürmekle kalmamış, aynı zamanda pek değişmeden elektronik dizgiye de sıçramıştır. 1960''larda Lorem Ipsum pasajları da içeren Letraset yapraklarının yayınlanması ile ve yakın zamanda Aldus PageMaker gibi Lorem Ipsum sürümleri içeren masaüstü yayıncılık yazılımları ile popüler olmuştur.</p>
')
GO
INSERT [snlg_V1].[TblEtkinlikDetay] ([EtkinlikId], [Dil], [Baslik], [Detay]) VALUES (5, 31, N'Building Grup Toplantısı', N'<p>Building Grup Toplantısı Yapılacak.</p>
')
GO
SET IDENTITY_INSERT [snlg_V1].[TblHaberApp] ON 

GO
INSERT [snlg_V1].[TblHaberApp] ([HaberId], [Tarih], [Resim], [Gorunurluk], [AramaIndex]) VALUES (203, CAST(N'2012-06-11' AS Date), N'/uploads/images/haberler/3.jpg', 1, 1)
GO
INSERT [snlg_V1].[TblHaberApp] ([HaberId], [Tarih], [Resim], [Gorunurluk], [AramaIndex]) VALUES (204, CAST(N'2012-06-11' AS Date), N'/uploads/images/haberler/2.jpg', 1, 1)
GO
INSERT [snlg_V1].[TblHaberApp] ([HaberId], [Tarih], [Resim], [Gorunurluk], [AramaIndex]) VALUES (218, CAST(N'2012-12-12' AS Date), N'/uploads/images/haberler/1.jpg', 1, 1)
GO
SET IDENTITY_INSERT [snlg_V1].[TblHaberApp] OFF
GO
INSERT [snlg_V1].[TblHaberDetay] ([HaberId], [Dil], [SeoUrl], [Baslik], [Bilgi], [Haber]) VALUES (204, 31, N'equal-blame-belongs-to-those-who-fail-in-their-duty-through-weakness-of-will-which-is-the-same', N'Equal blame belongs to those who fail in their duty through weakness of will which is the same', N'Natum etiam percipitur his ea, nam essent erroribus evertitur ei. Erant conclusionemque cum eu, omnis dicant nam in. Pri justo consul neglegentur ex, has simul tractatos inciderint ea, an adhuc altera his. Et sit semper repudiandae', N'Lorem ipsum dolor sit amet, quem eleifend ut sit. Postulant laboramus qui et, ex his liber noluisse, vidit eripuit urbanitas vis eu. Modus suscipiantur nam te. Ad homero interesset intellegebat qui. Ut pri ullum fierent.<br />
<br />
Vel ne tamquam fierent invenire, veri equidem sapientem et cum. Mel oblique eruditi ex, tollit docendi his in. No mea noluisse philosophia, in est natum instructior. No splendide definiebas quo.<br />
<br />
Cum idque rationibus suscipiantur ut, vim eu eius atqui partem. Natum etiam percipitur his ea, nam essent erroribus evertitur ei. Erant conclusionemque cum eu, omnis dicant nam in. Pri justo consul neglegentur ex, has simul tractatos inciderint ea, an adhuc altera his. Et sit semper repudiandae. Duo et quis invenire repudiandae, vix in purto ignota oblique.<br />
<br />
Ad per velit nobis patrioque, in mel odio mutat officiis. Dolores corrumpit ut quo, et nam consul maluisset, essent molestie appellantur eum ne. Cum ignota invidunt ex. No tamquam veritus sed, prima scriptorem ne mel, autem etiam probatus eu pro. Idque laboramus eu usu, his vitae eirmod appellantur an.')
GO
INSERT [snlg_V1].[TblHaberDetay] ([HaberId], [Dil], [SeoUrl], [Baslik], [Bilgi], [Haber]) VALUES (203, 31, N'doming-scribentur-te-sed-mel-habeo-tritani-noluisse-ut-id-everti-disputationi-qui', N'Doming scribentur te sed, mel habeo tritani noluisse ut, id everti disputationi qui', N'Eu eos elitr vidisse, usu dictas adipisci reformidans in. Wisi alienum voluptatum et sea, sonet scribentur mea no', N'Id nam tollit aliquip, vim laudem persequeris cu. Mel minimum legendos ad, vide dolores recteque has at. Nec cu suas sanctus denique, cum invidunt recusabo splendide no. Vix at rebum consetetur, sea et prima choro.<br />
<br />
Cu tollit ullamcorper sit, sed no incorrupte intellegam. Cu ius veritus nominati, duo esse tantas vocent at. An qui vidisse nusquam, ius te exerci debitis mandamus. Ex cum natum erant liberavisse. Viderer fierent his an. Ex eruditi senserit forensibus has, id facilisis repudiare reprimique qui, mea nibh natum modus id.<br />
<br />
Omnis viris tantas ei pro. Maiorum contentiones sea eu, quo ad melius patrioque definiebas. Facer soluta minimum et has, et doctus probatus sapientem ius. Sea soleat consulatu et.<br />
<br />
Civibus maluisset vel ea, et quo legere repudiandae. Eum antiopam accusamus an, nec discere docendi persecuti ei. Vix ne augue soluta dictas, qui meis elitr evertitur et. Vis stet singulis ad. Eu minim insolens posidonium vix, eu eos elitr vidisse, usu dictas adipisci reformidans in. Wisi alienum voluptatum et sea, sonet scribentur mea no.<br />
<br />
Eu qui soluta repudiare philosophia, at inani legere impetus qui, at tota velit est. Est evertitur deterruisset ut, mei copiosae mandamus delicatissimi eu. Et eos eius liberavisse. No sed magna ullum utinam, at labores pericula aliquando sit. Te pri porro vivendum perpetua.<br />
<br />
Ea dicunt detracto eos, ne duis natum accusata has. Tamquam inimicus pro ex, ei pri diam libris essent. Habeo audiam est at, est ei singulis efficiendi, veniam praesent et eos. Ne latine noluisse est, cum an bonorum quaestio. Mei esse malis accusam an, et tamquam prompta admodum cum. Cum cu dictas invenire.<br />
<br />
Ei mea singulis mnesarchum, eos quas concludaturque ut. Pro id sonet melius torquatos. Ipsum harum scribentur et mea, ius postea inermis eu. Ex errem ancillae delicatissimi sed, id augue appetere sea.')
GO
INSERT [snlg_V1].[TblHaberDetay] ([HaberId], [Dil], [SeoUrl], [Baslik], [Bilgi], [Haber]) VALUES (218, 31, N'mistaken-idea-of-denouncing-pleasure-and-praising-pain', N'Mistaken idea of denouncing pleasure and praising pain', N'Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae.', N'<p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.</p>

 <p>Righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances</p>')
GO
INSERT [snlg_V1].[TblMakaleKtgDetay] ([KtgId], [Dil], [SeoUrl], [KtgAd], [Keyword], [Descr]) VALUES (244, 31, N'hayat', N'Hayat', NULL, NULL)
GO
INSERT [snlg_V1].[TblMakaleKtgDetay] ([KtgId], [Dil], [SeoUrl], [KtgAd], [Keyword], [Descr]) VALUES (270, 31, N'motivasyon', N'Motivasyon', NULL, NULL)
GO
INSERT [snlg_V1].[TblMakaleKtgDetay] ([KtgId], [Dil], [SeoUrl], [KtgAd], [Keyword], [Descr]) VALUES (261, 31, N'saglik', N'Sağlık', NULL, NULL)
GO
INSERT [snlg_V1].[TblMakaleKtgDetay] ([KtgId], [Dil], [SeoUrl], [KtgAd], [Keyword], [Descr]) VALUES (261, 9, N'yazilim', N'Yazılım2', NULL, NULL)
GO
INSERT [snlg_V1].[TblUrunKtgDetay] ([KtgId], [Dil], [SeoUrl], [KtgAd], [Keyword], [Descr]) VALUES (203, 1033, NULL, N'Computer', N'', N'')
GO
INSERT [snlg_V1].[TblUrunKtgDetay] ([KtgId], [Dil], [SeoUrl], [KtgAd], [Keyword], [Descr]) VALUES (203, 31, N'ayakkabilar', N'Ayakkabılar', NULL, NULL)
GO
INSERT [snlg_V1].[TblUrunKtgDetay] ([KtgId], [Dil], [SeoUrl], [KtgAd], [Keyword], [Descr]) VALUES (204, 1033, NULL, N'Phone', N'', N'')
GO
INSERT [snlg_V1].[TblUrunKtgDetay] ([KtgId], [Dil], [SeoUrl], [KtgAd], [Keyword], [Descr]) VALUES (204, 31, N'kombinler', N'Kombinler', NULL, NULL)
GO
INSERT [snlg_V1].[TblUrunKtgDetay] ([KtgId], [Dil], [SeoUrl], [KtgAd], [Keyword], [Descr]) VALUES (219, 1033, NULL, N'Mobile Phone', N'', N'')
GO
INSERT [snlg_V1].[TblUrunKtgDetay] ([KtgId], [Dil], [SeoUrl], [KtgAd], [Keyword], [Descr]) VALUES (219, 31, N'gomlek-ceket', N'Gömlek&Ceket', NULL, NULL)
GO
INSERT [snlg_V1].[TblUrunKtgDetay] ([KtgId], [Dil], [SeoUrl], [KtgAd], [Keyword], [Descr]) VALUES (220, 1033, NULL, N'Headphones', N'', N'')
GO
INSERT [snlg_V1].[TblUrunKtgDetay] ([KtgId], [Dil], [SeoUrl], [KtgAd], [Keyword], [Descr]) VALUES (220, 31, N'canta-kemer', N'Çanta&Kemer', NULL, NULL)
GO
SET IDENTITY_INSERT [snlg_V1].[TblResimGaleriApp] ON 

GO
INSERT [snlg_V1].[TblResimGaleriApp] ([GId], [GaleriAd]) VALUES (99, N'Anasayfa Slayt')
GO
INSERT [snlg_V1].[TblResimGaleriApp] ([GId], [GaleriAd]) VALUES (119, N'Vitae Mondi Kat Planı')
GO
INSERT [snlg_V1].[TblResimGaleriApp] ([GId], [GaleriAd]) VALUES (120, N'Vitae Mondi Daireler')
GO
INSERT [snlg_V1].[TblResimGaleriApp] ([GId], [GaleriAd]) VALUES (121, N'Kurumsal Foto Galeri')
GO
INSERT [snlg_V1].[TblResimGaleriApp] ([GId], [GaleriAd]) VALUES (122, N'Vitae Mondi Foto Galeri')
GO
INSERT [snlg_V1].[TblResimGaleriApp] ([GId], [GaleriAd]) VALUES (123, N'Vitae Mondi Vaziyet Planı')
GO
SET IDENTITY_INSERT [snlg_V1].[TblResimGaleriApp] OFF
GO
SET IDENTITY_INSERT [snlg_V1].[TblResimGaleriResimlerApp] ON 

GO
INSERT [snlg_V1].[TblResimGaleriResimlerApp] ([RId], [GId], [Sira], [Resim], [LinkUrl]) VALUES (751, 119, 0, N'/uploads/images/projeler/vitae-mondi/kat-plani/kat-plani.jpg', NULL)
GO
INSERT [snlg_V1].[TblResimGaleriResimlerApp] ([RId], [GId], [Sira], [Resim], [LinkUrl]) VALUES (757, 99, 2, N'/uploads/images/anasayfa/slayt/1.jpg', N'/tr/etkinlikler')
GO
INSERT [snlg_V1].[TblResimGaleriResimlerApp] ([RId], [GId], [Sira], [Resim], [LinkUrl]) VALUES (758, 99, 1, N'/uploads/images/anasayfa/slayt/2.jpg', NULL)
GO
INSERT [snlg_V1].[TblResimGaleriResimlerApp] ([RId], [GId], [Sira], [Resim], [LinkUrl]) VALUES (759, 99, 3, N'/uploads/images/anasayfa/slayt/3.jpg', N'/tr/blog')
GO
INSERT [snlg_V1].[TblResimGaleriResimlerApp] ([RId], [GId], [Sira], [Resim], [LinkUrl]) VALUES (785, 119, 0, N'/uploads/images/projeler/vitae-mondi/kat-plani/kat-plani.jpg', NULL)
GO
INSERT [snlg_V1].[TblResimGaleriResimlerApp] ([RId], [GId], [Sira], [Resim], [LinkUrl]) VALUES (786, 119, 0, N'/uploads/images/projeler/vitae-mondi/kat-plani/kat-plani.jpg', NULL)
GO
INSERT [snlg_V1].[TblResimGaleriResimlerApp] ([RId], [GId], [Sira], [Resim], [LinkUrl]) VALUES (794, 120, 0, N'/uploads/images/projeler/vitae-mondi/daireler/1.jpg', NULL)
GO
INSERT [snlg_V1].[TblResimGaleriResimlerApp] ([RId], [GId], [Sira], [Resim], [LinkUrl]) VALUES (795, 120, 0, N'/uploads/images/projeler/vitae-mondi/daireler/2.jpg', NULL)
GO
INSERT [snlg_V1].[TblResimGaleriResimlerApp] ([RId], [GId], [Sira], [Resim], [LinkUrl]) VALUES (796, 120, 0, N'/uploads/images/projeler/vitae-mondi/daireler/3.jpg', NULL)
GO
INSERT [snlg_V1].[TblResimGaleriResimlerApp] ([RId], [GId], [Sira], [Resim], [LinkUrl]) VALUES (800, 121, 1, N'/uploads/images/foto-galeri/1.jpg', N'#')
GO
INSERT [snlg_V1].[TblResimGaleriResimlerApp] ([RId], [GId], [Sira], [Resim], [LinkUrl]) VALUES (801, 121, 3, N'/uploads/images/foto-galeri/2.jpg', N'#')
GO
INSERT [snlg_V1].[TblResimGaleriResimlerApp] ([RId], [GId], [Sira], [Resim], [LinkUrl]) VALUES (802, 121, 2, N'/uploads/images/foto-galeri/3.jpg', N'#')
GO
INSERT [snlg_V1].[TblResimGaleriResimlerApp] ([RId], [GId], [Sira], [Resim], [LinkUrl]) VALUES (803, 121, 4, N'/uploads/images/foto-galeri/4.jpg', N'#')
GO
INSERT [snlg_V1].[TblResimGaleriResimlerApp] ([RId], [GId], [Sira], [Resim], [LinkUrl]) VALUES (804, 121, 5, N'/uploads/images/foto-galeri/5.jpg', N'#')
GO
INSERT [snlg_V1].[TblResimGaleriResimlerApp] ([RId], [GId], [Sira], [Resim], [LinkUrl]) VALUES (805, 121, 6, N'/uploads/images/foto-galeri/6.jpg', N'#')
GO
INSERT [snlg_V1].[TblResimGaleriResimlerApp] ([RId], [GId], [Sira], [Resim], [LinkUrl]) VALUES (806, 121, 7, N'/uploads/images/foto-galeri/7.jpg', N'#')
GO
INSERT [snlg_V1].[TblResimGaleriResimlerApp] ([RId], [GId], [Sira], [Resim], [LinkUrl]) VALUES (807, 121, 8, N'/uploads/images/foto-galeri/8.jpg', N'#')
GO
INSERT [snlg_V1].[TblResimGaleriResimlerApp] ([RId], [GId], [Sira], [Resim], [LinkUrl]) VALUES (808, 121, 9, N'/uploads/images/foto-galeri/9.jpg', N'#')
GO
INSERT [snlg_V1].[TblResimGaleriResimlerApp] ([RId], [GId], [Sira], [Resim], [LinkUrl]) VALUES (809, 122, 0, N'/uploads/images/projeler/vitae-mondi/foto-galeri/1.jpg', NULL)
GO
INSERT [snlg_V1].[TblResimGaleriResimlerApp] ([RId], [GId], [Sira], [Resim], [LinkUrl]) VALUES (810, 122, 0, N'/uploads/images/projeler/vitae-mondi/foto-galeri/2.jpg', NULL)
GO
INSERT [snlg_V1].[TblResimGaleriResimlerApp] ([RId], [GId], [Sira], [Resim], [LinkUrl]) VALUES (811, 122, 0, N'/uploads/images/projeler/vitae-mondi/foto-galeri/3.jpg', NULL)
GO
INSERT [snlg_V1].[TblResimGaleriResimlerApp] ([RId], [GId], [Sira], [Resim], [LinkUrl]) VALUES (812, 122, 0, N'/uploads/images/projeler/vitae-mondi/foto-galeri/4.jpg', NULL)
GO
INSERT [snlg_V1].[TblResimGaleriResimlerApp] ([RId], [GId], [Sira], [Resim], [LinkUrl]) VALUES (813, 122, 0, N'/uploads/images/projeler/vitae-mondi/foto-galeri/5.jpg', NULL)
GO
INSERT [snlg_V1].[TblResimGaleriResimlerApp] ([RId], [GId], [Sira], [Resim], [LinkUrl]) VALUES (814, 122, 0, N'/uploads/images/projeler/vitae-mondi/foto-galeri/6.jpg', NULL)
GO
INSERT [snlg_V1].[TblResimGaleriResimlerApp] ([RId], [GId], [Sira], [Resim], [LinkUrl]) VALUES (816, 120, 0, N'/uploads/images/projeler/vitae-mondi/daireler/4.jpg', NULL)
GO
INSERT [snlg_V1].[TblResimGaleriResimlerApp] ([RId], [GId], [Sira], [Resim], [LinkUrl]) VALUES (817, 123, 0, N'/uploads/images/projeler/vitae-mondi/vaziyet-plani.jpg', N'')
GO
SET IDENTITY_INSERT [snlg_V1].[TblResimGaleriResimlerApp] OFF
GO
INSERT [snlg_V1].[TblResimGaleriResimlerDetay] ([RId], [Dil], [Baslik], [Bilgi]) VALUES (758, 31, N'Tamamen Responsive', N'Web siten tüm platformlarda mükemmel gözüksün')
GO
INSERT [snlg_V1].[TblResimGaleriResimlerDetay] ([RId], [Dil], [Baslik], [Bilgi]) VALUES (800, 31, N'His an reque luptatum recusabo', N'Ne ius conceptam mediocritatem, mea quis fierent delicata no. Nostrum lobortis senserit cu qui, duo utamur aliquam habemus te, laoreet incorrupte dissentiunt quo ut.')
GO
INSERT [snlg_V1].[TblResimGaleriResimlerDetay] ([RId], [Dil], [Baslik], [Bilgi]) VALUES (801, 31, N' Menandri evertitur forensibus in eum, legimus expetendis te ius', N'Ne ius conceptam mediocritatem, mea quis fierent delicata no. Nostrum lobortis senserit cu qui, duo utamur aliquam habemus te, laoreet incorrupte dissentiunt quo ut.')
GO
INSERT [snlg_V1].[TblResimGaleriResimlerDetay] ([RId], [Dil], [Baslik], [Bilgi]) VALUES (794, 31, N'1+1 Daire', N'Tota complectitur necessitatibus has eu')
GO
INSERT [snlg_V1].[TblResimGaleriResimlerDetay] ([RId], [Dil], [Baslik], [Bilgi]) VALUES (751, 31, N'1+1', N'Dicit honestatis eum at, ei cetero ullamcorper vim. Detracto periculis ne mea. Cum cu deseruisse temporibus comprehensam, cum labores nonumes voluptatum ut. No sea alii causae, lobortis efficiendi an sea. Eu expetenda deseruisse efficiantur eam.')
GO
INSERT [snlg_V1].[TblResimGaleriResimlerDetay] ([RId], [Dil], [Baslik], [Bilgi]) VALUES (795, 31, N'2+1', N'Est animal civibus ex, facilis oportere pri')
GO
INSERT [snlg_V1].[TblResimGaleriResimlerDetay] ([RId], [Dil], [Baslik], [Bilgi]) VALUES (802, 31, N'Quis tempor elaboraret nec ex', N'Ne ius conceptam mediocritatem, mea quis fierent delicata no. Nostrum lobortis senserit cu qui, duo utamur aliquam habemus te, laoreet incorrupte dissentiunt quo ut.')
GO
INSERT [snlg_V1].[TblResimGaleriResimlerDetay] ([RId], [Dil], [Baslik], [Bilgi]) VALUES (757, 31, N'Standart Tema', N'Hiç kimseye ihtiyacın olmadan web siteni yapabileceğini biliyor muydun? Üstelik ücretsiz!')
GO
INSERT [snlg_V1].[TblResimGaleriResimlerDetay] ([RId], [Dil], [Baslik], [Bilgi]) VALUES (759, 31, N'Birlikte Yürüyelim', N'Bir Sanaloger olarak geliştirici ağımıza katılmaya ne dersin?')
GO
INSERT [snlg_V1].[TblResimGaleriResimlerDetay] ([RId], [Dil], [Baslik], [Bilgi]) VALUES (785, 31, N'2+1', N'Dicit honestatis eum at, ei cetero ullamcorper vim. Detracto periculis ne mea. Cum cu deseruisse temporibus comprehensam, cum labores nonumes voluptatum ut. No sea alii causae, lobortis efficiendi an sea. Eu expetenda deseruisse efficiantur eam.')
GO
INSERT [snlg_V1].[TblResimGaleriResimlerDetay] ([RId], [Dil], [Baslik], [Bilgi]) VALUES (786, 31, N'3+1', N'Dicit honestatis eum at, ei cetero ullamcorper vim. Detracto periculis ne mea. Cum cu deseruisse temporibus comprehensam, cum labores nonumes voluptatum ut. No sea alii causae, lobortis efficiendi an sea. Eu expetenda deseruisse efficiantur eam.')
GO
INSERT [snlg_V1].[TblResimGaleriResimlerDetay] ([RId], [Dil], [Baslik], [Bilgi]) VALUES (817, 31, N'', N'')
GO
INSERT [snlg_V1].[TblResimGaleriResimlerDetay] ([RId], [Dil], [Baslik], [Bilgi]) VALUES (796, 31, N'3+1', N'Commodo aliquip scripserit eu cum')
GO
INSERT [snlg_V1].[TblResimGaleriResimlerDetay] ([RId], [Dil], [Baslik], [Bilgi]) VALUES (803, 31, N' Odio sapientem in duo an soluta accusamus efficiantur usu', N'Ne ius conceptam mediocritatem, mea quis fierent delicata no. Nostrum lobortis senserit cu qui, duo utamur aliquam habemus te, laoreet incorrupte dissentiunt quo ut.')
GO
INSERT [snlg_V1].[TblResimGaleriResimlerDetay] ([RId], [Dil], [Baslik], [Bilgi]) VALUES (804, 31, N'Rebum causae maiestatis eu has nec integre nostrud', N'Ne ius conceptam mediocritatem, mea quis fierent delicata no. Nostrum lobortis senserit cu qui, duo utamur aliquam habemus te, laoreet incorrupte dissentiunt quo ut.')
GO
INSERT [snlg_V1].[TblResimGaleriResimlerDetay] ([RId], [Dil], [Baslik], [Bilgi]) VALUES (805, 31, N'Novum erroribus necessitatibus nam ut', N'Ne ius conceptam mediocritatem, mea quis fierent delicata no. Nostrum lobortis senserit cu qui, duo utamur aliquam habemus te, laoreet incorrupte dissentiunt quo ut.')
GO
INSERT [snlg_V1].[TblResimGaleriResimlerDetay] ([RId], [Dil], [Baslik], [Bilgi]) VALUES (806, 31, N' Viris tibique mea te no nominavi aliquando ius', N'Ne ius conceptam mediocritatem, mea quis fierent delicata no. Nostrum lobortis senserit cu qui, duo utamur aliquam habemus te, laoreet incorrupte dissentiunt quo ut.')
GO
INSERT [snlg_V1].[TblResimGaleriResimlerDetay] ([RId], [Dil], [Baslik], [Bilgi]) VALUES (807, 31, N'Melius nostrud mel an iudico dolores consectetuer', N'Ne ius conceptam mediocritatem, mea quis fierent delicata no. Nostrum lobortis senserit cu qui, duo utamur aliquam habemus te, laoreet incorrupte dissentiunt quo ut.')
GO
INSERT [snlg_V1].[TblResimGaleriResimlerDetay] ([RId], [Dil], [Baslik], [Bilgi]) VALUES (808, 31, N'Et purto nominati rationibus nam quo at justo porro abhorreant', N'Ne ius conceptam mediocritatem, mea quis fierent delicata no. Nostrum lobortis senserit cu qui, duo utamur aliquam habemus te, laoreet incorrupte dissentiunt quo ut.')
GO
INSERT [snlg_V1].[TblResimGaleriResimlerDetay] ([RId], [Dil], [Baslik], [Bilgi]) VALUES (809, 31, NULL, NULL)
GO
INSERT [snlg_V1].[TblResimGaleriResimlerDetay] ([RId], [Dil], [Baslik], [Bilgi]) VALUES (810, 31, NULL, NULL)
GO
INSERT [snlg_V1].[TblResimGaleriResimlerDetay] ([RId], [Dil], [Baslik], [Bilgi]) VALUES (812, 31, NULL, NULL)
GO
INSERT [snlg_V1].[TblResimGaleriResimlerDetay] ([RId], [Dil], [Baslik], [Bilgi]) VALUES (813, 31, NULL, NULL)
GO
INSERT [snlg_V1].[TblResimGaleriResimlerDetay] ([RId], [Dil], [Baslik], [Bilgi]) VALUES (814, 31, NULL, NULL)
GO
INSERT [snlg_V1].[TblResimGaleriResimlerDetay] ([RId], [Dil], [Baslik], [Bilgi]) VALUES (811, 31, NULL, NULL)
GO
INSERT [snlg_V1].[TblResimGaleriResimlerDetay] ([RId], [Dil], [Baslik], [Bilgi]) VALUES (816, 31, N'4+1', N'Dicant nonumy habemus qui id')
GO
INSERT [snlg_V1].[TblUcDetay] ([UCId], [Dil], [Icerik], [Baslik], [BlokAltBilgi], [BlokUstBilgi]) VALUES (39, 31, N'<img alt="Kurumsal Foto Galeri" gallery_id="121" gallery_type="lightbox" src="/admin/themes/default/images/icon-image-gallery.png" title="Kurumsal Foto Galeri" type="image_gallery" />', N'Foto Galeri', NULL, NULL)
GO
INSERT [snlg_V1].[TblUcDetay] ([UCId], [Dil], [Icerik], [Baslik], [BlokAltBilgi], [BlokUstBilgi]) VALUES (52, 31, NULL, N'Yazarlar', NULL, NULL)
GO
INSERT [snlg_V1].[TblUcDetay] ([UCId], [Dil], [Icerik], [Baslik], [BlokAltBilgi], [BlokUstBilgi]) VALUES (-32306, 31, NULL, N'Hoşgeldiniz', NULL, NULL)
GO
INSERT [snlg_V1].[TblUcDetay] ([UCId], [Dil], [Icerik], [Baslik], [BlokAltBilgi], [BlokUstBilgi]) VALUES (-32612, 31, NULL, N'Anket', NULL, NULL)
GO
INSERT [snlg_V1].[TblUcDetay] ([UCId], [Dil], [Icerik], [Baslik], [BlokAltBilgi], [BlokUstBilgi]) VALUES (-32611, 31, NULL, N'Duyurular', NULL, NULL)
GO
INSERT [snlg_V1].[TblUcDetay] ([UCId], [Dil], [Icerik], [Baslik], [BlokAltBilgi], [BlokUstBilgi]) VALUES (-32610, 31, NULL, N'Duyurular', NULL, NULL)
GO
INSERT [snlg_V1].[TblUcDetay] ([UCId], [Dil], [Icerik], [Baslik], [BlokAltBilgi], [BlokUstBilgi]) VALUES (-32609, 31, NULL, N'Son Duyurular', NULL, NULL)
GO
INSERT [snlg_V1].[TblUcDetay] ([UCId], [Dil], [Icerik], [Baslik], [BlokAltBilgi], [BlokUstBilgi]) VALUES (-32608, 31, NULL, N'Haberler', NULL, NULL)
GO
INSERT [snlg_V1].[TblUcDetay] ([UCId], [Dil], [Icerik], [Baslik], [BlokAltBilgi], [BlokUstBilgi]) VALUES (-32607, 31, NULL, N'Haberler', NULL, NULL)
GO
INSERT [snlg_V1].[TblUcDetay] ([UCId], [Dil], [Icerik], [Baslik], [BlokAltBilgi], [BlokUstBilgi]) VALUES (-32606, 31, NULL, N'Son Haberler', NULL, NULL)
GO
INSERT [snlg_V1].[TblUcDetay] ([UCId], [Dil], [Icerik], [Baslik], [BlokAltBilgi], [BlokUstBilgi]) VALUES (-32605, 31, NULL, N'İletişim Formu', NULL, NULL)
GO
INSERT [snlg_V1].[TblUcDetay] ([UCId], [Dil], [Icerik], [Baslik], [BlokAltBilgi], [BlokUstBilgi]) VALUES (36, 31, NULL, N'Breadcrumbs', NULL, NULL)
GO
INSERT [snlg_V1].[TblUcDetay] ([UCId], [Dil], [Icerik], [Baslik], [BlokAltBilgi], [BlokUstBilgi]) VALUES (-32603, 31, NULL, N'Sayfa İçeriği Modülü', NULL, NULL)
GO
INSERT [snlg_V1].[TblUcDetay] ([UCId], [Dil], [Icerik], [Baslik], [BlokAltBilgi], [BlokUstBilgi]) VALUES (-32602, 31, NULL, N'Yorumlar', NULL, NULL)
GO
INSERT [snlg_V1].[TblUcDetay] ([UCId], [Dil], [Icerik], [Baslik], [BlokAltBilgi], [BlokUstBilgi]) VALUES (-32601, 31, NULL, N'Yorum Yaz', NULL, NULL)
GO
INSERT [snlg_V1].[TblUcDetay] ([UCId], [Dil], [Icerik], [Baslik], [BlokAltBilgi], [BlokUstBilgi]) VALUES (-32600, 31, N'<a class="navbar-brand" href="/tr/anasayfa"><img alt="" src="/uploads/images/logo.png" /></a>', N'Logo', NULL, NULL)
GO
INSERT [snlg_V1].[TblUcDetay] ([UCId], [Dil], [Icerik], [Baslik], [BlokAltBilgi], [BlokUstBilgi]) VALUES (53, 31, NULL, N'En Popüler Etiketler', NULL, NULL)
GO
INSERT [snlg_V1].[TblUcDetay] ([UCId], [Dil], [Icerik], [Baslik], [BlokAltBilgi], [BlokUstBilgi]) VALUES (-32303, 31, NULL, N'Yazara Ait Makaleler', NULL, NULL)
GO
INSERT [snlg_V1].[TblUcDetay] ([UCId], [Dil], [Icerik], [Baslik], [BlokAltBilgi], [BlokUstBilgi]) VALUES (-32591, 31, NULL, N'En Çok Puanlananlar', NULL, NULL)
GO
INSERT [snlg_V1].[TblUcDetay] ([UCId], [Dil], [Icerik], [Baslik], [BlokAltBilgi], [BlokUstBilgi]) VALUES (-32590, 31, NULL, N'En Çok Yorumlananlar', NULL, NULL)
GO
INSERT [snlg_V1].[TblUcDetay] ([UCId], [Dil], [Icerik], [Baslik], [BlokAltBilgi], [BlokUstBilgi]) VALUES (-32589, 31, NULL, N'Son Makaleler', NULL, NULL)
GO
INSERT [snlg_V1].[TblUcDetay] ([UCId], [Dil], [Icerik], [Baslik], [BlokAltBilgi], [BlokUstBilgi]) VALUES (-32588, 31, NULL, N'En Son Yorumlananlar', NULL, NULL)
GO
INSERT [snlg_V1].[TblUcDetay] ([UCId], [Dil], [Icerik], [Baslik], [BlokAltBilgi], [BlokUstBilgi]) VALUES (-32587, 31, NULL, N'Kategorideki Makaleler', NULL, NULL)
GO
INSERT [snlg_V1].[TblUcDetay] ([UCId], [Dil], [Icerik], [Baslik], [BlokAltBilgi], [BlokUstBilgi]) VALUES (-32527, 31, NULL, N'Üye Girişi', NULL, NULL)
GO
INSERT [snlg_V1].[TblUcDetay] ([UCId], [Dil], [Icerik], [Baslik], [BlokAltBilgi], [BlokUstBilgi]) VALUES (-32302, 31, NULL, N'Yazarlar', NULL, NULL)
GO
INSERT [snlg_V1].[TblUcDetay] ([UCId], [Dil], [Icerik], [Baslik], [BlokAltBilgi], [BlokUstBilgi]) VALUES (-32582, 31, NULL, N'Makale Detay', NULL, NULL)
GO
INSERT [snlg_V1].[TblUcDetay] ([UCId], [Dil], [Icerik], [Baslik], [BlokAltBilgi], [BlokUstBilgi]) VALUES (-32581, 31, NULL, N'Rastgele Makaleler', NULL, NULL)
GO
INSERT [snlg_V1].[TblUcDetay] ([UCId], [Dil], [Icerik], [Baslik], [BlokAltBilgi], [BlokUstBilgi]) VALUES (-32580, 31, NULL, N'Makale Yorumları', NULL, NULL)
GO
INSERT [snlg_V1].[TblUcDetay] ([UCId], [Dil], [Icerik], [Baslik], [BlokAltBilgi], [BlokUstBilgi]) VALUES (-32579, 31, NULL, N'Son Projeler', NULL, NULL)
GO
INSERT [snlg_V1].[TblUcDetay] ([UCId], [Dil], [Icerik], [Baslik], [BlokAltBilgi], [BlokUstBilgi]) VALUES (-32578, 31, NULL, N'Projeler', NULL, NULL)
GO
INSERT [snlg_V1].[TblUcDetay] ([UCId], [Dil], [Icerik], [Baslik], [BlokAltBilgi], [BlokUstBilgi]) VALUES (-32577, 31, NULL, N'Proje - Projeler Menüsü', NULL, NULL)
GO
INSERT [snlg_V1].[TblUcDetay] ([UCId], [Dil], [Icerik], [Baslik], [BlokAltBilgi], [BlokUstBilgi]) VALUES (-32576, 31, NULL, N'Proje Detay', NULL, NULL)
GO
INSERT [snlg_V1].[TblUcDetay] ([UCId], [Dil], [Icerik], [Baslik], [BlokAltBilgi], [BlokUstBilgi]) VALUES (-32572, 31, NULL, N'Üye Ol', NULL, NULL)
GO
INSERT [snlg_V1].[TblUcDetay] ([UCId], [Dil], [Icerik], [Baslik], [BlokAltBilgi], [BlokUstBilgi]) VALUES (-32571, 31, NULL, N'Referanslar', NULL, NULL)
GO
INSERT [snlg_V1].[TblUcDetay] ([UCId], [Dil], [Icerik], [Baslik], [BlokAltBilgi], [BlokUstBilgi]) VALUES (-32568, 31, NULL, N'Yeni Yorum Yaz', NULL, NULL)
GO
INSERT [snlg_V1].[TblUcDetay] ([UCId], [Dil], [Icerik], [Baslik], [BlokAltBilgi], [BlokUstBilgi]) VALUES (-32476, 31, NULL, N'Makale Arşivi', NULL, NULL)
GO
INSERT [snlg_V1].[TblUcDetay] ([UCId], [Dil], [Icerik], [Baslik], [BlokAltBilgi], [BlokUstBilgi]) VALUES (-32482, 31, NULL, N'Makaleler', NULL, NULL)
GO
INSERT [snlg_V1].[TblUcDetay] ([UCId], [Dil], [Icerik], [Baslik], [BlokAltBilgi], [BlokUstBilgi]) VALUES (51, 31, NULL, N'Referans Kategorileri', NULL, NULL)
GO
INSERT [snlg_V1].[TblUcDetay] ([UCId], [Dil], [Icerik], [Baslik], [BlokAltBilgi], [BlokUstBilgi]) VALUES (-32480, 31, NULL, N'Makale Kategorileri', NULL, NULL)
GO
INSERT [snlg_V1].[TblUcDetay] ([UCId], [Dil], [Icerik], [Baslik], [BlokAltBilgi], [BlokUstBilgi]) VALUES (-32570, 31, NULL, N'Son Referanslar', NULL, NULL)
GO
INSERT [snlg_V1].[TblUcDetay] ([UCId], [Dil], [Icerik], [Baslik], [BlokAltBilgi], [BlokUstBilgi]) VALUES (-32435, 31, NULL, N'Üye Profil', NULL, NULL)
GO
INSERT [snlg_V1].[TblUcDetay] ([UCId], [Dil], [Icerik], [Baslik], [BlokAltBilgi], [BlokUstBilgi]) VALUES (-32475, 31, NULL, N'Arşivdeki Makaleler', NULL, NULL)
GO
INSERT [snlg_V1].[TblUcDetay] ([UCId], [Dil], [Icerik], [Baslik], [BlokAltBilgi], [BlokUstBilgi]) VALUES (-32522, 31, NULL, N'Etkinlik Takvimi', NULL, NULL)
GO
INSERT [snlg_V1].[TblUcDetay] ([UCId], [Dil], [Icerik], [Baslik], [BlokAltBilgi], [BlokUstBilgi]) VALUES (-32493, 31, NULL, N'Dil seçme menüsü', NULL, NULL)
GO
INSERT [snlg_V1].[TblUcDetay] ([UCId], [Dil], [Icerik], [Baslik], [BlokAltBilgi], [BlokUstBilgi]) VALUES (-32562, 31, NULL, N'Yeni Ürünler', NULL, NULL)
GO
INSERT [snlg_V1].[TblUcDetay] ([UCId], [Dil], [Icerik], [Baslik], [BlokAltBilgi], [BlokUstBilgi]) VALUES (-32561, 31, NULL, N'Kategorideki Ürünler', NULL, NULL)
GO
INSERT [snlg_V1].[TblUcDetay] ([UCId], [Dil], [Icerik], [Baslik], [BlokAltBilgi], [BlokUstBilgi]) VALUES (-32557, 31, NULL, N'Kategoriler', NULL, NULL)
GO
INSERT [snlg_V1].[TblUcDetay] ([UCId], [Dil], [Icerik], [Baslik], [BlokAltBilgi], [BlokUstBilgi]) VALUES (-32556, 31, NULL, N'İlgi Çeken Ürünler', NULL, NULL)
GO
INSERT [snlg_V1].[TblUcDetay] ([UCId], [Dil], [Icerik], [Baslik], [BlokAltBilgi], [BlokUstBilgi]) VALUES (-32555, 31, NULL, N'Ürün Detay', NULL, NULL)
GO
INSERT [snlg_V1].[TblUcDetay] ([UCId], [Dil], [Icerik], [Baslik], [BlokAltBilgi], [BlokUstBilgi]) VALUES (-32091, 31, N'<p class="copyright">Copyright &copy; 2016 | Sanalog&trade;</p>
', N'Copyright', NULL, NULL)
GO
INSERT [snlg_V1].[TblUcDetay] ([UCId], [Dil], [Icerik], [Baslik], [BlokAltBilgi], [BlokUstBilgi]) VALUES (1, 31, NULL, NULL, NULL, NULL)
GO
INSERT [snlg_V1].[TblUcDetay] ([UCId], [Dil], [Icerik], [Baslik], [BlokAltBilgi], [BlokUstBilgi]) VALUES (2, 31, NULL, NULL, NULL, NULL)
GO
INSERT [snlg_V1].[TblUcDetay] ([UCId], [Dil], [Icerik], [Baslik], [BlokAltBilgi], [BlokUstBilgi]) VALUES (3, 31, NULL, N'Makale Tagları', NULL, NULL)
GO
INSERT [snlg_V1].[TblUcDetay] ([UCId], [Dil], [Icerik], [Baslik], [BlokAltBilgi], [BlokUstBilgi]) VALUES (-32600, 9, N'<a class="navbar-brand" href="/en/home"><img alt="" src="/uploads/images/logo.png" /></a>', NULL, NULL, NULL)
GO
INSERT [snlg_V1].[TblUcDetay] ([UCId], [Dil], [Icerik], [Baslik], [BlokAltBilgi], [BlokUstBilgi]) VALUES (38, 31, NULL, N'Sayfa Bağlığı Modülü', NULL, NULL)
GO
INSERT [snlg_V1].[TblUcDetay] ([UCId], [Dil], [Icerik], [Baslik], [BlokAltBilgi], [BlokUstBilgi]) VALUES (21, 31, NULL, N'Yeni Şifren', NULL, NULL)
GO
INSERT [snlg_V1].[TblUcDetay] ([UCId], [Dil], [Icerik], [Baslik], [BlokAltBilgi], [BlokUstBilgi]) VALUES (41, 31, NULL, NULL, NULL, NULL)
GO
INSERT [snlg_V1].[TblUcDetay] ([UCId], [Dil], [Icerik], [Baslik], [BlokAltBilgi], [BlokUstBilgi]) VALUES (-32198, 31, N'<img alt="Trend Bahçeşehir Vaziyet Planı" gallery_id="99" gallery_type="bootstrap-carousel" src="/admin/themes/default/images/icon-image-gallery.png" title="Trend Bahçeşehir Vaziyet Planı" type="image_gallery" />', N'Anasayfa Slayt', N'<img alt="Kurumsal Foto Galeri" gallery_id="121" gallery_type="bootstrap-carousel" src="/admin/themes/default/images/icon-image-gallery.png" title="Kurumsal Foto Galeri" type="image_gallery" /><img alt="Anasayfa Slider" gallery_id="99" gallery_type="bootstrap-carousel" src="/admin/themes/default/images/icon-image-gallery.png" title="Anasayfa Slider" type="image_gallery" /><img alt="Anasayfa Slider" gallery_id="99" gallery_type="flexy" src="/admin/themes/default/images/icon-image-gallery.png" title="Anasayfa Slider" type="image_gallery" /><img alt="Anasayfa Slider" gallery_id="99" gallery_type="lightbox" src="/admin/themes/default/images/icon-image-gallery.png" title="Anasayfa Slider" type="image_gallery" /><img alt="Anasayfa Slider" gallery_id="99" gallery_type="galleriffic-album" src="/admin/themes/default/images/icon-image-gallery.png" title="Anasayfa Slider" type="image_gallery" /><img alt="Anasayfa Slider" gallery_id="99" gallery_type="bootstrap-carousel" src="/admin/themes/default/images/icon-image-gallery.png" title="Anasayfa Slider" type="image_gallery" /><img alt="Anasayfa Slider" gallery_id="99" gallery_type="bootstrap-carousel" src="/admin/themes/default/images/icon-image-gallery.png" title="Anasayfa Slider" type="image_gallery" />', NULL)
GO
INSERT [snlg_V1].[TblUcDetay] ([UCId], [Dil], [Icerik], [Baslik], [BlokAltBilgi], [BlokUstBilgi]) VALUES (-32092, 31, N'<nav class="social text-right">
<p><a href="https://tr-tr.facebook.com/Sanalog" target="_blank"><i class="fa fa-facebook"> </i></a> <a href="https://twitter.com/SANALOGI" target="_blank"><i class="fa fa-twitter"> </i></a></p>
</nav>
', N'Sosyal Medya', NULL, NULL)
GO
INSERT [snlg_V1].[TblUcDetay] ([UCId], [Dil], [Icerik], [Baslik], [BlokAltBilgi], [BlokUstBilgi]) VALUES (45, 31, NULL, N'Paylaş', NULL, NULL)
GO
INSERT [snlg_V1].[TblUcDetay] ([UCId], [Dil], [Icerik], [Baslik], [BlokAltBilgi], [BlokUstBilgi]) VALUES (46, 31, NULL, N'Hesap ayarları Düzenleme', NULL, NULL)
GO
INSERT [snlg_V1].[TblUcDetay] ([UCId], [Dil], [Icerik], [Baslik], [BlokAltBilgi], [BlokUstBilgi]) VALUES (54, 31, N'<address class="text-right"><strong>Building, Inc.</strong><br />
795 Folsom Ave, Suite 600<br />
San Francisco, CA 94107</address>

<address class="text-right"><a href="mailto:#">first.last@building.com</a></address>', N'Footer iletişim', NULL, NULL)
GO
SET IDENTITY_INSERT [snlg_V1].[TblUrlKeys] ON 

GO
INSERT [snlg_V1].[TblUrlKeys] ([UrlKeyID], [UrlKeyName], [UrlKeyValue], [Dil]) VALUES (1, N'announce', N'duyurular', 31)
GO
INSERT [snlg_V1].[TblUrlKeys] ([UrlKeyID], [UrlKeyName], [UrlKeyValue], [Dil]) VALUES (3, N'editor', N'editor', 31)
GO
INSERT [snlg_V1].[TblUrlKeys] ([UrlKeyID], [UrlKeyName], [UrlKeyValue], [Dil]) VALUES (4, N'news', N'haberler', 31)
GO
INSERT [snlg_V1].[TblUrlKeys] ([UrlKeyID], [UrlKeyName], [UrlKeyValue], [Dil]) VALUES (5, N'portfolio', N'portfoy', 31)
GO
INSERT [snlg_V1].[TblUrlKeys] ([UrlKeyID], [UrlKeyName], [UrlKeyValue], [Dil]) VALUES (6, N'project', N'projeler', 31)
GO
INSERT [snlg_V1].[TblUrlKeys] ([UrlKeyID], [UrlKeyName], [UrlKeyValue], [Dil]) VALUES (7, N'shop', N'shop', 31)
GO
INSERT [snlg_V1].[TblUrlKeys] ([UrlKeyID], [UrlKeyName], [UrlKeyValue], [Dil]) VALUES (8, N'user', N'uye', 31)
GO
INSERT [snlg_V1].[TblUrlKeys] ([UrlKeyID], [UrlKeyName], [UrlKeyValue], [Dil]) VALUES (9, N'Announce', N'announce', 9)
GO
INSERT [snlg_V1].[TblUrlKeys] ([UrlKeyID], [UrlKeyName], [UrlKeyValue], [Dil]) VALUES (10, N'Blog', N'blog', 9)
GO
INSERT [snlg_V1].[TblUrlKeys] ([UrlKeyID], [UrlKeyName], [UrlKeyValue], [Dil]) VALUES (11, N'Editor', N'editor', 9)
GO
INSERT [snlg_V1].[TblUrlKeys] ([UrlKeyID], [UrlKeyName], [UrlKeyValue], [Dil]) VALUES (12, N'News', N'new', 9)
GO
INSERT [snlg_V1].[TblUrlKeys] ([UrlKeyID], [UrlKeyName], [UrlKeyValue], [Dil]) VALUES (13, N'Portfolio', N'portfolio', 9)
GO
INSERT [snlg_V1].[TblUrlKeys] ([UrlKeyID], [UrlKeyName], [UrlKeyValue], [Dil]) VALUES (14, N'Project', N'project', 9)
GO
INSERT [snlg_V1].[TblUrlKeys] ([UrlKeyID], [UrlKeyName], [UrlKeyValue], [Dil]) VALUES (15, N'Shop', N'shop', 9)
GO
INSERT [snlg_V1].[TblUrlKeys] ([UrlKeyID], [UrlKeyName], [UrlKeyValue], [Dil]) VALUES (16, N'User', N'member', 9)
GO
INSERT [snlg_V1].[TblUrlKeys] ([UrlKeyID], [UrlKeyName], [UrlKeyValue], [Dil]) VALUES (34, N'blog', N'blog', 31)
GO
INSERT [snlg_V1].[TblUrlKeys] ([UrlKeyID], [UrlKeyName], [UrlKeyValue], [Dil]) VALUES (35, N'tag', N'tag', 31)
GO
SET IDENTITY_INSERT [snlg_V1].[TblUrlKeys] OFF
GO
INSERT [snlg_V1].[TblUyeDetayDil] ([UyeId], [Dil], [UyeBilgi]) VALUES (1, 31, N'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.')
GO
SET IDENTITY_INSERT [snlg_V1].[TblAnketApp] ON 

GO
INSERT [snlg_V1].[TblAnketApp] ([AnketId], [Tarih], [SonucGoster], [Gorunurluk]) VALUES (154, CAST(N'2012-10-10' AS Date), 1, 1)
GO
SET IDENTITY_INSERT [snlg_V1].[TblAnketApp] OFF
GO
INSERT [snlg_V1].[TblAnketDetay] ([AnketId], [Dil], [Soru], [A], [B], [C], [D], [E], [F], [G], [H]) VALUES (154, 31, N'En çok hangi yazarımızın yazılarını beğeniyorsunuz?', N'Alexandre Dumas ', N'Alphonse Daudet', N'Alphonse De Lamartine', N'Albert Camus', NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [snlg_V1].[TblDesignSablonlar] ON 

GO
INSERT [snlg_V1].[TblDesignSablonlar] ([SablonId], [SablonAd], [Aciklama]) VALUES (-32330, N'Anasayfa', N'Anasayfa')
GO
INSERT [snlg_V1].[TblDesignSablonlar] ([SablonId], [SablonAd], [Aciklama]) VALUES (-32328, N'Blog - Makale Kategorileri', N'Makale kategorilerini text olarak listeler')
GO
INSERT [snlg_V1].[TblDesignSablonlar] ([SablonId], [SablonAd], [Aciklama]) VALUES (-32325, N'Üyelik - Üye Kaydı', N'Üye kayıt formu')
GO
INSERT [snlg_V1].[TblDesignSablonlar] ([SablonId], [SablonAd], [Aciklama]) VALUES (-32321, N'Bize Ulaşın', N'İletişim bilgilerinin sunumu')
GO
INSERT [snlg_V1].[TblDesignSablonlar] ([SablonId], [SablonAd], [Aciklama]) VALUES (-32320, N'Mağaza - Anasayfa', N'Tüm ürünleri listeler')
GO
INSERT [snlg_V1].[TblDesignSablonlar] ([SablonId], [SablonAd], [Aciklama]) VALUES (-32319, N'Mağaza - Kategori altındaki ürünler', N'Seçilen kategoriye göre ürünleri listeler')
GO
INSERT [snlg_V1].[TblDesignSablonlar] ([SablonId], [SablonAd], [Aciklama]) VALUES (-32318, N'Mağaza - Ürün Detay', N'Ürün detayını görüntüler')
GO
INSERT [snlg_V1].[TblDesignSablonlar] ([SablonId], [SablonAd], [Aciklama]) VALUES (-32317, N'Projeler - Anasayfa', N'Tüm projeleri listeler')
GO
INSERT [snlg_V1].[TblDesignSablonlar] ([SablonId], [SablonAd], [Aciklama]) VALUES (-32272, N'Duyuru Detay', N'Duyuru detayını görüntüler')
GO
INSERT [snlg_V1].[TblDesignSablonlar] ([SablonId], [SablonAd], [Aciklama]) VALUES (-32271, N'Duyurular', N'Tüm duyuruları listeler')
GO
INSERT [snlg_V1].[TblDesignSablonlar] ([SablonId], [SablonAd], [Aciklama]) VALUES (-32270, N'Blog - Resimli Makale Kategorileri', N'Makale kategorilerini resim ve text olarak listeler')
GO
INSERT [snlg_V1].[TblDesignSablonlar] ([SablonId], [SablonAd], [Aciklama]) VALUES (-32259, N'Projeler - Proje Detay', N'Proje detayını görüntüler')
GO
INSERT [snlg_V1].[TblDesignSablonlar] ([SablonId], [SablonAd], [Aciklama]) VALUES (-32258, N'Projeler - kategori içindeki projeler', N'Seçilen kategoriye göre projeleri listeler')
GO
INSERT [snlg_V1].[TblDesignSablonlar] ([SablonId], [SablonAd], [Aciklama]) VALUES (-32242, N'Üyelik - Üye Profil', N'Üye profili')
GO
INSERT [snlg_V1].[TblDesignSablonlar] ([SablonId], [SablonAd], [Aciklama]) VALUES (-32240, N'Mağaza - Resimsiz Ürün kategorileri', N'Ürün kategorileri text link olarak listelenir')
GO
INSERT [snlg_V1].[TblDesignSablonlar] ([SablonId], [SablonAd], [Aciklama]) VALUES (-32106, N'Ziyaretçi Defteri', N'Ziyaretçi defteri yorumları ve formu')
GO
INSERT [snlg_V1].[TblDesignSablonlar] ([SablonId], [SablonAd], [Aciklama]) VALUES (-32105, N'Etkinlik Takvimi', N'Etkinlik takvimini görüntüler')
GO
INSERT [snlg_V1].[TblDesignSablonlar] ([SablonId], [SablonAd], [Aciklama]) VALUES (-32095, N'Blog - Yazar Detay', N'Yazarın eklediği makaleler listelenir')
GO
INSERT [snlg_V1].[TblDesignSablonlar] ([SablonId], [SablonAd], [Aciklama]) VALUES (-32094, N'Referanslar', N'Tüm referansları listeler')
GO
INSERT [snlg_V1].[TblDesignSablonlar] ([SablonId], [SablonAd], [Aciklama]) VALUES (-32063, N'Üyelik - Üye Girişi', N'Üye giriş formu')
GO
INSERT [snlg_V1].[TblDesignSablonlar] ([SablonId], [SablonAd], [Aciklama]) VALUES (-32060, N'Haberler', N'Tüm haberleri listeler')
GO
INSERT [snlg_V1].[TblDesignSablonlar] ([SablonId], [SablonAd], [Aciklama]) VALUES (-32059, N'Haber Detay', N'Haber detayını görüntüler')
GO
INSERT [snlg_V1].[TblDesignSablonlar] ([SablonId], [SablonAd], [Aciklama]) VALUES (-32056, N'Blog - Makaleler', N'Tüm makaleleri listeler')
GO
INSERT [snlg_V1].[TblDesignSablonlar] ([SablonId], [SablonAd], [Aciklama]) VALUES (-32054, N'Foto Galeri', N'Foto Galeri')
GO
INSERT [snlg_V1].[TblDesignSablonlar] ([SablonId], [SablonAd], [Aciklama]) VALUES (-32048, N'Hakkımızda', N'Firma bilgilerinin sunumu')
GO
INSERT [snlg_V1].[TblDesignSablonlar] ([SablonId], [SablonAd], [Aciklama]) VALUES (-32047, N'Blog - Yazarlar', N'Tüm yazarları listeler')
GO
INSERT [snlg_V1].[TblDesignSablonlar] ([SablonId], [SablonAd], [Aciklama]) VALUES (-32046, N'Blog - Tag Detay', N'Seçilen etikete  göre makaleleri listeler')
GO
INSERT [snlg_V1].[TblDesignSablonlar] ([SablonId], [SablonAd], [Aciklama]) VALUES (-32045, N'Blog - Makale Detay', N'Makale detayını görüntüler')
GO
INSERT [snlg_V1].[TblDesignSablonlar] ([SablonId], [SablonAd], [Aciklama]) VALUES (-32044, N'Blog - Kategorideki Makaleler', N'Seçilen kategoriye göre makaleleri listeler')
GO
INSERT [snlg_V1].[TblDesignSablonlar] ([SablonId], [SablonAd], [Aciklama]) VALUES (-32043, N'Blog - Makale Arşivi', N'Seçilen tarihe göre makaleleri listeler')
GO
INSERT [snlg_V1].[TblDesignSablonlar] ([SablonId], [SablonAd], [Aciklama]) VALUES (-32041, N'Üyelik - Şifremi Unuttum', N'Üyelere için şifre sıfırlama')
GO
SET IDENTITY_INSERT [snlg_V1].[TblDesignSablonlar] OFF
GO
SET IDENTITY_INSERT [snlg_V1].[TblSayfaApp] ON 

GO
INSERT [snlg_V1].[TblSayfaApp] ([SayfaId], [SAd], [Gorunurluk], [SablonId], [AramaIndex]) VALUES (242, N'Anasayfa', 1, -32330, 1)
GO
INSERT [snlg_V1].[TblSayfaApp] ([SayfaId], [SAd], [Gorunurluk], [SablonId], [AramaIndex]) VALUES (246, N'Üye Ol', 1, -32325, 1)
GO
INSERT [snlg_V1].[TblSayfaApp] ([SayfaId], [SAd], [Gorunurluk], [SablonId], [AramaIndex]) VALUES (250, N'Biz Kimiz', 1, -32048, 1)
GO
INSERT [snlg_V1].[TblSayfaApp] ([SayfaId], [SAd], [Gorunurluk], [SablonId], [AramaIndex]) VALUES (251, N'Bize Ulaşın', 1, -32321, 1)
GO
INSERT [snlg_V1].[TblSayfaApp] ([SayfaId], [SAd], [Gorunurluk], [SablonId], [AramaIndex]) VALUES (277, N'Degerlerimiz', 1, -32048, 1)
GO
INSERT [snlg_V1].[TblSayfaApp] ([SayfaId], [SAd], [Gorunurluk], [SablonId], [AramaIndex]) VALUES (278, N'Sıkça Sorulan Sorular', 1, -32048, 1)
GO
INSERT [snlg_V1].[TblSayfaApp] ([SayfaId], [SAd], [Gorunurluk], [SablonId], [AramaIndex]) VALUES (284, N'Blog', 1, -32056, 1)
GO
INSERT [snlg_V1].[TblSayfaApp] ([SayfaId], [SAd], [Gorunurluk], [SablonId], [AramaIndex]) VALUES (287, N'Üye Profil', 1, -32242, 1)
GO
INSERT [snlg_V1].[TblSayfaApp] ([SayfaId], [SAd], [Gorunurluk], [SablonId], [AramaIndex]) VALUES (289, N'Duyurular', 1, -32271, 1)
GO
INSERT [snlg_V1].[TblSayfaApp] ([SayfaId], [SAd], [Gorunurluk], [SablonId], [AramaIndex]) VALUES (1311, N'Etkinlikler', 1, -32105, 1)
GO
INSERT [snlg_V1].[TblSayfaApp] ([SayfaId], [SAd], [Gorunurluk], [SablonId], [AramaIndex]) VALUES (1319, N'Referanslar', 1, -32094, 1)
GO
INSERT [snlg_V1].[TblSayfaApp] ([SayfaId], [SAd], [Gorunurluk], [SablonId], [AramaIndex]) VALUES (1320, N'Projeler', 1, -32317, 1)
GO
INSERT [snlg_V1].[TblSayfaApp] ([SayfaId], [SAd], [Gorunurluk], [SablonId], [AramaIndex]) VALUES (1321, N'Ürünler', 1, -32320, 1)
GO
INSERT [snlg_V1].[TblSayfaApp] ([SayfaId], [SAd], [Gorunurluk], [SablonId], [AramaIndex]) VALUES (2362, N'Haberler', 1, -32060, 1)
GO
INSERT [snlg_V1].[TblSayfaApp] ([SayfaId], [SAd], [Gorunurluk], [SablonId], [AramaIndex]) VALUES (2370, N'Foto Galeri', 1, -32054, 1)
GO
INSERT [snlg_V1].[TblSayfaApp] ([SayfaId], [SAd], [Gorunurluk], [SablonId], [AramaIndex]) VALUES (2389, N'Ekibimiz', 1, -32048, 1)
GO
INSERT [snlg_V1].[TblSayfaApp] ([SayfaId], [SAd], [Gorunurluk], [SablonId], [AramaIndex]) VALUES (2390, N'Üye Girişi', 1, -32063, 1)
GO
INSERT [snlg_V1].[TblSayfaApp] ([SayfaId], [SAd], [Gorunurluk], [SablonId], [AramaIndex]) VALUES (2391, N'Yazarlar', 1, -32047, 0)
GO
INSERT [snlg_V1].[TblSayfaApp] ([SayfaId], [SAd], [Gorunurluk], [SablonId], [AramaIndex]) VALUES (2393, N'Ziyaretçi Defteri', 1, -32106, 1)
GO
INSERT [snlg_V1].[TblSayfaApp] ([SayfaId], [SAd], [Gorunurluk], [SablonId], [AramaIndex]) VALUES (2395, N'şifremi unuttum', 1, -32041, 0)
GO
SET IDENTITY_INSERT [snlg_V1].[TblSayfaApp] OFF
GO
INSERT [snlg_V1].[TblSayfaDetay] ([SayfaId], [DId], [SeoUrl], [Icerik], [Title], [Descr], [Keyword], [PageContentTitle]) VALUES (289, 2057, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [snlg_V1].[TblSayfaDetay] ([SayfaId], [DId], [SeoUrl], [Icerik], [Title], [Descr], [Keyword], [PageContentTitle]) VALUES (284, 9, N'blog', NULL, N'blog_en', N'blog_en', N'blog_en', NULL)
GO
INSERT [snlg_V1].[TblSayfaDetay] ([SayfaId], [DId], [SeoUrl], [Icerik], [Title], [Descr], [Keyword], [PageContentTitle]) VALUES (1319, 9, NULL, NULL, N'references3', N'references2', N'references3', NULL)
GO
INSERT [snlg_V1].[TblSayfaDetay] ([SayfaId], [DId], [SeoUrl], [Icerik], [Title], [Descr], [Keyword], [PageContentTitle]) VALUES (242, 9, N'home', NULL, N'home', NULL, NULL, NULL)
GO
INSERT [snlg_V1].[TblSayfaDetay] ([SayfaId], [DId], [SeoUrl], [Icerik], [Title], [Descr], [Keyword], [PageContentTitle]) VALUES (251, 9, N'contact-us', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [snlg_V1].[TblSayfaDetay] ([SayfaId], [DId], [SeoUrl], [Icerik], [Title], [Descr], [Keyword], [PageContentTitle]) VALUES (250, 9, N'who-we-are', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [snlg_V1].[TblSayfaDetay] ([SayfaId], [DId], [SeoUrl], [Icerik], [Title], [Descr], [Keyword], [PageContentTitle]) VALUES (2390, 31, N'uye-girisi', N'<img alt="" class="img-responsive" src="/uploads/images/uye-kaydi.jpg" />', N'Sanalog | Üye Girişi', N'Üye Girişi', N'Üye Girişi', N'<h1>&Uuml;yelik <span>/ &Uuml;ye Girişi</span></h1>
')
GO
INSERT [snlg_V1].[TblSayfaDetay] ([SayfaId], [DId], [SeoUrl], [Icerik], [Title], [Descr], [Keyword], [PageContentTitle]) VALUES (1311, 31, N'etkinlikler', N'<img alt="" class="img-responsive" src="/uploads/images/etkinliklerimiz.jpg" />', N'Sanalog | Etkinlikler', N'Etkinlikler', N'Etkinlikler', N'<h1>Etkinlikler<span>/ Sosyal Aktivitelerimiz</span></h1>
')
GO
INSERT [snlg_V1].[TblSayfaDetay] ([SayfaId], [DId], [SeoUrl], [Icerik], [Title], [Descr], [Keyword], [PageContentTitle]) VALUES (250, 31, N'biz-kimiz', N'<div class="row">
<div class="col-md-6"><img alt="" class="img-responsive" src="/uploads/images/anasayfa/h4.jpg" /></div>

<div class="col-md-6">
<h1>Elementum a risus aliquam integer vehicula.</h1>

<p>Diam dui, at sodales. Quaerat arcu in molestie suspendisse, pellentesque maecenas diam lorem eleifend semper condimentum, elementum ut neque id aenean lacus. Vel imperdiet pellentesque neque vulputate.</p>
</div>

<div class="col-md-12">Ultrices commodo mi felis scelerisque nulla bibendum, augue aliquam, eget vulputate congue. Elit varius, justo ad tincidunt lorem sit, convallis adipiscing, elit vitae vivamus congue elit aliquet.</div>
</div>

<hr /> 
<div class="row">
<div class="col-sm-4">
<div class="count">580</div>

<h4>Clients</h4>

<p>Ultrices commodo mi felis scelerisque nulla bibendum, augue tincidunt aliquam.</p>
</div>

<div class="col-sm-4">
<div class="count">3640</div>

<h4>Sketches</h4>

<p>Turpis vestibulum et inceptos ornare ornare, ante urna a eu velit nulla senectus.</p>
</div>

<div class="col-sm-4">
<div class="count">720</div>

<h4>Projects</h4>

<p>Eget mi vestibulum orci ut deserunt, proin ante, vestibulum lacus fringilla deleniti nonummy.</p>
</div>
</div>

<hr />
<div class="row">
<div class="col-md-12">
<h3>Eget vulputate congue</h3>

<p>Ultrices commodo mi felis scelerisque nulla bibendum, augue aliquam, eget vulputate congue. Elit varius, justo ad tincidunt lorem sit, convallis adipiscing, elit vitae vivamus congue elit aliquet, et scelerisque luctus. Tristique vestibulum pellentesque enim viverra tincidunt. Vel nulla in, lobortis taciti, sit sed mi auctor commodo.</p>

<p>Elementum a risus aliquam integer vehicula. Ligula ipsum pretium ac, amet egestas mauris interdum et, fusce convallis tristique mauris, in ut, vel aliquam sem conubia viverra. Turpis vestibulum et inceptos ornare ornare, ante urna a eu velit nulla senectus, in vitae sit quis eleifend lacus, mauris nec quo viverra elit quis eleifend lacus, mauris nec quo viverra elit enim.</p>
</div>
</div>
', N'Sanalog | Biz Kimiz', N'Biz Kimiz', N'Biz Kimiz', NULL)
GO
INSERT [snlg_V1].[TblSayfaDetay] ([SayfaId], [DId], [SeoUrl], [Icerik], [Title], [Descr], [Keyword], [PageContentTitle]) VALUES (278, 31, N'sikca-sorulan-sorular', N'<h2>Merak ettiğiniz sorular ve cevapları, sizlerin daha detaylı bilgi edinmeniz i&ccedil;in oluşturulmuştur.</h2>

<div class="divider-20">&nbsp;</div>

<div aria-multiselectable="true" class="panel-group" id="accordion" role="tablist">
<div class="panel panel-default">
<div class="panel-heading" id="headingOne" role="tab">
<h4 class="panel-title"><a aria-controls="collapseOne" aria-expanded="true" data-parent="#accordion" data-toggle="collapse" href="#collapseOne" role="button">Sunt aliqua put a bird </a></h4>
</div>

<div aria-labelledby="headingOne" class="panel-collapse collapse in" id="collapseOne" role="tabpanel">
<div class="panel-body">Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven&#39;t heard of them accusamus labore sustainable VHS.</div>
</div>
</div>

<div class="panel panel-default">
<div class="panel-heading" id="headingTwo" role="tab">
<h4 class="panel-title"><a aria-controls="collapseTwo" aria-expanded="false" class="collapsed" data-parent="#accordion" data-toggle="collapse" href="#collapseTwo" role="button">Leggings occaecat craft beer farm-to-table </a></h4>
</div>

<div aria-labelledby="headingTwo" class="panel-collapse collapse" id="collapseTwo" role="tabpanel">
<div class="panel-body">Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven&#39;t heard of them accusamus labore sustainable VHS.</div>
</div>
</div>

<div class="panel panel-default">
<div class="panel-heading" id="headingThree" role="tab">
<h4 class="panel-title"><a aria-controls="collapseThree" aria-expanded="false" class="collapsed" data-parent="#accordion" data-toggle="collapse" href="#collapseThree" role="button">Aliqua put a bird on it squid single-origin coffee </a></h4>
</div>

<div aria-labelledby="headingThree" class="panel-collapse collapse" id="collapseThree" role="tabpanel">
<div class="panel-body">Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven&#39;t heard of them accusamus labore sustainable VHS.</div>
</div>
</div>

<div class="panel panel-default">
<div class="panel-heading" id="headingThree" role="tab">
<h4 class="panel-title"><a aria-controls="collapseThree" aria-expanded="false" class="collapsed" data-parent="#accordion" data-toggle="collapse" href="#collapseFour" role="button">Nihil anim keffiyeh helvetica craft beer labore </a></h4>
</div>

<div aria-labelledby="headingThree" class="panel-collapse collapse" id="collapseFour" role="tabpanel">
<div class="panel-body">Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven&#39;t heard of them accusamus labore sustainable VHS.</div>
</div>
</div>

<div class="panel panel-default">
<div class="panel-heading" id="headingThree" role="tab">
<h4 class="panel-title"><a aria-controls="collapseThree" aria-expanded="false" class="collapsed" data-parent="#accordion" data-toggle="collapse" href="#collapseFive" role="button">Cred nesciunt sapiente ea proident </a></h4>
</div>

<div aria-labelledby="headingThree" class="panel-collapse collapse" id="collapseFive" role="tabpanel">
<div class="panel-body">Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven&#39;t heard of them accusamus labore sustainable VHS.</div>
</div>
</div>
</div>

<p>&nbsp;</p>
', N'Sanalog | S.S.S', N'Sıkça Sorulan Sorular', N'Sıkça Sorulan Sorular', N'<h1>Hakkımızda <span>/ Sık&ccedil;a Sorulan Sorular</span></h1>
')
GO
INSERT [snlg_V1].[TblSayfaDetay] ([SayfaId], [DId], [SeoUrl], [Icerik], [Title], [Descr], [Keyword], [PageContentTitle]) VALUES (278, 9, N'faq', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [snlg_V1].[TblSayfaDetay] ([SayfaId], [DId], [SeoUrl], [Icerik], [Title], [Descr], [Keyword], [PageContentTitle]) VALUES (242, 31, N'anasayfa', N'<div class="c-content-box c-bg-white mt-lg mb-md">
<div class="container">
<div class="row">
<div class="col-sm-4">
<p><img alt="" class="img-responsive" src="/uploads/images/anasayfa/h1.jpg" /></p>

<h3 class="c-font-uppercase c-font-bold">Fully responsive</h3>

<p class="c-font-thin">Beautiful cinematic designs optimized for all screen sizes and types. Compatible with Retina high pixel density displays.</p>
</div>

<div class="col-sm-4">
<p><img alt="" class="img-responsive" src="/uploads/images/anasayfa/h2.jpg" /></p>

<h3 class="c-font-uppercase c-font-bold">Visual & Pragmatic</h3>

<p class="c-font-thin">Featuring trending modern web standards.<br />
Clean and easy framework design for worry and hassle free customizations.</p>
</div>

<div class="col-sm-4 c-card">
<p><img alt="" class="img-responsive" src="/uploads/images/anasayfa/h3.jpg" /></p>

<h3 class="c-font-uppercase c-font-bold">Dedicated Support</h3>

<p class="c-font-thin">Quick response with regular updates.<br />
Each update will include great new features and enhancements for free.</p>
</div>
</div>
</div>
</div>
<!--///-->

<div class="c-content-box c-size-lg c-bg-grey-1 mb-lg">
<div class="container">
<div class="c-content-title-1">
<h1 class="text-center">BİZ KİMİZ?</h1>
</div>

<div class="row">
<div class="col-sm-8"><img alt="" class="img-responsive" src="/uploads/images/anasayfa/h4.jpg" /></div>

<div class="col-sm-4">
<div aria-multiselectable="true" class="panel-group" id="accordion" role="tablist">
<div class="panel panel-default">
<div class="panel-heading" id="headingOne" role="tab">
<h4 class="panel-title"><a aria-controls="collapseOne" aria-expanded="true" data-parent="#accordion" data-toggle="collapse" href="#collapseOne" role="button">Collapsible Group Item #1 </a></h4>
</div>

<div aria-labelledby="headingOne" class="panel-collapse collapse in" id="collapseOne" role="tabpanel">
<div class="panel-body">Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. </div>
</div>
</div>

<div class="panel panel-default">
<div class="panel-heading" id="headingTwo" role="tab">
<h4 class="panel-title"><a aria-controls="collapseTwo" aria-expanded="false" class="collapsed" data-parent="#accordion" data-toggle="collapse" href="#collapseTwo" role="button">Collapsible Group Item #2 </a></h4>
</div>

<div aria-labelledby="headingTwo" class="panel-collapse collapse" id="collapseTwo" role="tabpanel">
<div class="panel-body">Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo.</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
', N'Sanalog | Sınır Sensin', N'Anasayfa', N'Anasayfa', NULL)
GO
INSERT [snlg_V1].[TblSayfaDetay] ([SayfaId], [DId], [SeoUrl], [Icerik], [Title], [Descr], [Keyword], [PageContentTitle]) VALUES (246, 31, N'uye-ol', N'<img alt="" class="img-responsive" src="/uploads/images/uye-kaydi.jpg" />', N'Sanalog | Üye Ol', N'Üye Ol', N'Üye Ol', N'<h1>&Uuml;yelik&nbsp;<span>/ &Uuml;ye Ol</span></h1>
')
GO
INSERT [snlg_V1].[TblSayfaDetay] ([SayfaId], [DId], [SeoUrl], [Icerik], [Title], [Descr], [Keyword], [PageContentTitle]) VALUES (289, 31, N'duyurular', NULL, N'Sanalog | Duyurular', N'Duyurular', N'Duyurular', N'<h1>Duyurular <span>/ &Ouml;nemli Duyurularımız</span></h1>
')
GO
INSERT [snlg_V1].[TblSayfaDetay] ([SayfaId], [DId], [SeoUrl], [Icerik], [Title], [Descr], [Keyword], [PageContentTitle]) VALUES (251, 31, N'bize-ulasin', N'<h4 class="head-style-2">İletişim Bilgileri</h4>

<address><strong>Building, Inc.</strong><br />
795 Folsom Ave, Suite 600<br />
San Francisco, CA 94107</address>
&nbsp;

<address><strong>Full Name</strong><br />
<a href="mailto:#">first.last@building.com</a></address>

<p><iframe allowfullscreen="" frameborder="0" height="250" src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d10107.749826982017!2d28.94011198523641!3d41.133390725394!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1str!2s!4v1455381493416" style="border:0" width="100%"></iframe></p>
', N'Sanalog | Bize Ulaşın', N'Bize Ulaşın', N'Bize Ulaşın', N'<h1>Bize Ulaşın <span>/ İletişim Bilgilerimiz</span></h1>
')
GO
INSERT [snlg_V1].[TblSayfaDetay] ([SayfaId], [DId], [SeoUrl], [Icerik], [Title], [Descr], [Keyword], [PageContentTitle]) VALUES (287, 31, N'uye-profil', N'<img alt="" class="img-responsive" src="/uploads/images/uye-kaydi.jpg" />', N'Sanalog | Üye Profil', N'Üye Profil', N'Üye Profil', N'<h1>Üyelik <span>/ Üye Profil</span></h1>
')
GO
INSERT [snlg_V1].[TblSayfaDetay] ([SayfaId], [DId], [SeoUrl], [Icerik], [Title], [Descr], [Keyword], [PageContentTitle]) VALUES (2362, 31, N'haberler', NULL, N'Sanalog | Haberler', N'Haberler', N'Haberler', N'<h1>Haberler&nbsp;<span>/ Şirket Haberleri</span></h1>
')
GO
INSERT [snlg_V1].[TblSayfaDetay] ([SayfaId], [DId], [SeoUrl], [Icerik], [Title], [Descr], [Keyword], [PageContentTitle]) VALUES (2370, 31, N'foto-galeri', NULL, N'Sanalog | Foto Galeri', N'Foto Galeri', N'Foto Galeri', N'<h1>Foto Galeri <span>/ Gezilerimizden&nbsp;Fotoğraflar</span></h1>
')
GO
INSERT [snlg_V1].[TblSayfaDetay] ([SayfaId], [DId], [SeoUrl], [Icerik], [Title], [Descr], [Keyword], [PageContentTitle]) VALUES (251, 2057, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [snlg_V1].[TblSayfaDetay] ([SayfaId], [DId], [SeoUrl], [Icerik], [Title], [Descr], [Keyword], [PageContentTitle]) VALUES (284, 31, N'blog', NULL, N'Sanalog | Blog', N'Blog', N'Blog', N'<h1>Blog <span>/ Makalelerimiz</span></h1>
')
GO
INSERT [snlg_V1].[TblSayfaDetay] ([SayfaId], [DId], [SeoUrl], [Icerik], [Title], [Descr], [Keyword], [PageContentTitle]) VALUES (1320, 31, N'projeler', NULL, N'Sanalog | Projeler', N'Projeler', N'Projeler', N'<h1>Projeler <span>/ T&uuml;m Projelerimiz</span></h1>
')
GO
INSERT [snlg_V1].[TblSayfaDetay] ([SayfaId], [DId], [SeoUrl], [Icerik], [Title], [Descr], [Keyword], [PageContentTitle]) VALUES (1321, 31, N'urunler', NULL, N'Sanalog | Ürünler', N'Ürünler', N'Ürünler', N'<h1>&Uuml;r&uuml;nler <span>/ &Uuml;r&uuml;n &Ccedil;eşitlerimiz</span></h1>
')
GO
INSERT [snlg_V1].[TblSayfaDetay] ([SayfaId], [DId], [SeoUrl], [Icerik], [Title], [Descr], [Keyword], [PageContentTitle]) VALUES (1319, 31, N'referanslar', NULL, N'Sanalog | Referanslar', N'Referanslar', N'Referanslar', N'<h1>Referanslar <span>/ T&uuml;m Referanslarımız</span></h1>
')
GO
INSERT [snlg_V1].[TblSayfaDetay] ([SayfaId], [DId], [SeoUrl], [Icerik], [Title], [Descr], [Keyword], [PageContentTitle]) VALUES (2391, 31, N'yazarlar', NULL, NULL, N'Yazarlar', N'Yazarlar', N'<h1>Blog <span>/ Yazarlar</span></h1>
')
GO
INSERT [snlg_V1].[TblSayfaDetay] ([SayfaId], [DId], [SeoUrl], [Icerik], [Title], [Descr], [Keyword], [PageContentTitle]) VALUES (277, 31, N'degerlerimiz', N'<p><img alt="" class="img-responsive" src="/uploads/images/hakkimizda/degerlerimiz.jpg" /></p>

<div class="row">
<div class="col-sm-4">
<h3>Misyonumuz</h3>
</div>

<div class="col-sm-8">
<p>expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.</p>
</div>
</div>

<hr />
<div class="row">
<div class="col-sm-4">
<h3>Vizyonumuz</h3>
</div>

<div class="col-sm-8">
<p><strong>To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? </strong>But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure.</p>
</div>
</div>

<p><strong>&nbsp;</strong></p>
', N'Sanalog | Değerlerimiz', N'Degerlerimiz', N'Degerlerimiz', N'<h1>Hakkımızda <span>/ Değerlerimiz</span></h1>
')
GO
INSERT [snlg_V1].[TblSayfaDetay] ([SayfaId], [DId], [SeoUrl], [Icerik], [Title], [Descr], [Keyword], [PageContentTitle]) VALUES (2389, 31, N'ekibimiz', N'<blockquote>Turpis vestibulum et inceptos ornare ornare, ante urna a eu velit nulla senectus. &mdash; Marco Lian&nbsp;</blockquote>

<div class="row text-center">
<div class="col-sm-4"><img alt="" class="img-responsive" src="/uploads/images/hakkimizda/ekibimiz/person-10.jpg" />
<h4>Susana Jacobs <cite>Designer</cite></h4>
</div>

<div class="col-sm-4"><img alt="" class="img-responsive" src="/uploads/images/hakkimizda/ekibimiz/person-1.jpg" />
<h4>Male Alem <cite>Co-Producer</cite></h4>
</div>

<div class="col-sm-4"><img alt="" class="img-responsive" src="/uploads/images/hakkimizda/ekibimiz/person-11.jpg" />
<h4>Roin Juni <cite>Web Developer</cite></h4>
</div>

<div class="col-sm-4"><img alt="" class="img-responsive" src="/uploads/images/hakkimizda/ekibimiz/person-6.jpg" />
<h4>Sam Peterson <cite>Director</cite></h4>
</div>

<div class="col-sm-4"><img alt="" class="img-responsive" src="/uploads/images/hakkimizda/ekibimiz/person-3.jpg" />
<h4>Alex Brown <cite>Cleaner</cite></h4>
</div>

<div class="col-sm-4"><img alt="" class="img-responsive" src="/uploads/images/hakkimizda/ekibimiz/person-9.jpg" />
<h4>Elena Klimova <cite>Web Designer</cite></h4>
</div>
</div>
', N'Sanalog | Ekibimiz', N'Ekibimiz', N'Ekibimiz', N'<h1>Hakkımızda <span>/ Ekibimiz</span></h1>
')
GO
INSERT [snlg_V1].[TblSayfaDetay] ([SayfaId], [DId], [SeoUrl], [Icerik], [Title], [Descr], [Keyword], [PageContentTitle]) VALUES (277, 9, N'our-values', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [snlg_V1].[TblSayfaDetay] ([SayfaId], [DId], [SeoUrl], [Icerik], [Title], [Descr], [Keyword], [PageContentTitle]) VALUES (289, 9, N'announcements', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [snlg_V1].[TblSayfaDetay] ([SayfaId], [DId], [SeoUrl], [Icerik], [Title], [Descr], [Keyword], [PageContentTitle]) VALUES (1320, 9, N'projects', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [snlg_V1].[TblSayfaDetay] ([SayfaId], [DId], [SeoUrl], [Icerik], [Title], [Descr], [Keyword], [PageContentTitle]) VALUES (1321, 9, N'products', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [snlg_V1].[TblSayfaDetay] ([SayfaId], [DId], [SeoUrl], [Icerik], [Title], [Descr], [Keyword], [PageContentTitle]) VALUES (246, 9, N'signup', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [snlg_V1].[TblSayfaDetay] ([SayfaId], [DId], [SeoUrl], [Icerik], [Title], [Descr], [Keyword], [PageContentTitle]) VALUES (287, 9, N'member-profile', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [snlg_V1].[TblSayfaDetay] ([SayfaId], [DId], [SeoUrl], [Icerik], [Title], [Descr], [Keyword], [PageContentTitle]) VALUES (2395, 31, N'sifremi-unuttum', N'<p style="margin-top:100px"><a href="/tr/anasayfa"><img alt="" sizes="img-responsive" src="/uploads/images/logo.png" /></a></p>

', NULL, NULL, NULL, NULL)
GO
INSERT [snlg_V1].[TblSayfaDetay] ([SayfaId], [DId], [SeoUrl], [Icerik], [Title], [Descr], [Keyword], [PageContentTitle]) VALUES (2393, 31, N'ziyaretci-defteri', NULL, NULL, N'Ziyaretçi Defteri', N'Ziyaretçi Defteri', N'<h1>Ziyaretçi Defteri <span>/ Bizim için bir şeyler yazın</span></h1>')
GO
SET IDENTITY_INSERT [snlg_V1].[TblDuyuruApp] ON 

GO
INSERT [snlg_V1].[TblDuyuruApp] ([DuyuruId], [Tarih], [Resim], [Gorunurluk], [AramaIndex]) VALUES (77, CAST(N'2016-12-12' AS Date), N'/uploads/images/duyurular/3.jpg', 1, 1)
GO
INSERT [snlg_V1].[TblDuyuruApp] ([DuyuruId], [Tarih], [Resim], [Gorunurluk], [AramaIndex]) VALUES (80, CAST(N'2016-02-12' AS Date), N'/uploads/images/duyurular/2.jpg', 1, 1)
GO
INSERT [snlg_V1].[TblDuyuruApp] ([DuyuruId], [Tarih], [Resim], [Gorunurluk], [AramaIndex]) VALUES (82, CAST(N'2016-02-02' AS Date), N'/uploads/images/duyurular/1.jpg', 1, 1)
GO
SET IDENTITY_INSERT [snlg_V1].[TblDuyuruApp] OFF
GO
INSERT [snlg_V1].[TblDuyuruDetay] ([DuyuruId], [Dil], [SeoUrl], [Baslik], [Duyuru]) VALUES (77, 31, N'at-vero-eos-et-accusamus-et-iusto-odio-dignissimos-ducimus-qui-blanditiis-praesentium-voluptatum-deleniti', N'At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti', N'Eum iusto dolore putent et. At solum molestie eam, appetere elaboraret id mel, per debet alterum ex. Aeque quodsi civibus qui at, est ea legimus facilis consequat. Ea eum modus repudiandae ullamcorper, ad graeci mediocrem constituam ius.<br />
<br />
Ei mea solum vitae facete, lorem nostrud qui in. Eruditi dignissim laboramus vel in, ne quo dicta affert persecuti, vel veri sententiae ut. Commodo antiopam pro ex. Est homero reprimique et, ex eos percipit atomorum.<br />
<br />
Tamquam facilisis instructior ea duo. At pri decore detraxit. Dolor commodo dignissim sit ne. Ne copiosae nominati eum.<br />
<br />
Vel lobortis patrioque an, eos ne facer partem. Eam in viris nemore cotidieque. At vix dicat graece. Maiorum pericula id duo, eum eu justo tollit definitionem. Assum iuvaret cum no. Ad vim modo volutpat, tota latine fierent vim te.')
GO
INSERT [snlg_V1].[TblDuyuruDetay] ([DuyuruId], [Dil], [SeoUrl], [Baslik], [Duyuru]) VALUES (80, 31, N'ventore-veritatis-et-quasi-architecto-beatae-vitae-dicta-sunt-explicabo', N'Ventore veritatis et quasi architecto beatae vitae dicta sunt explicabo', N'Quo maiorum vulputate consequuntur in. Cibo apeirian consequat est an. Ne qualisque torquatos per, prima verear consequat te vel, sea posse animal numquam et. Accumsan posidonium ne his, odio timeam graecis eu eos, qui ad audiam vocibus. Pri oratio deseruisse sadipscing ne, aliquip accumsan offendit in sea. Nec no quot laboramus, et sea dolorum assentior, eum no quidam tractatos.<br />
<br />
Ut munere copiosae pri. Cum te everti vocent eruditi, et usu veri affert. In est inermis albucius. Facer dolores voluptua at eam, nostrud appetere ne vim.<br />
<br />
Usu id constituto sadipscing. Ex partem sapientem dissentiet vim, eos semper aliquip albucius id. Nec ad mazim debitis. Libris delenit forensibus nam te, vero possit reprehendunt ne has. In has mentitum aliquando reprimique, no omnium delectus democritum sit.')
GO
INSERT [snlg_V1].[TblDuyuruDetay] ([DuyuruId], [Dil], [SeoUrl], [Baslik], [Duyuru]) VALUES (82, 31, N'denouncing-pleasure-and-praising-pain-was-born-and-i-will-give-you-a-complete-account-of-the-system', N'Denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound', N'Ius decore persecuti ut, id vis phaedrum prodesset complectitur. Ius ex alia ornatus deleniti. Quo tollit prodesset ad, eos at tale brute democritum, liber adolescens theophrastus eum id. Cum at alterum maiestatis interesset. Nonumy ignota at sed. Ea alterum constituto has.<br />
<br />
Harum nostro propriae eam ut. Eam modo viderer ut, justo putent vim ex. Dico sapientem sadipscing ei nec. Ridens sapientem scribentur sit ea. Eos te diam quando liberavisse, ea ipsum liberavisse ius, assum movet vulputate ut mel. Est cu tantas nemore quaerendum, an atqui insolens accusamus qui, ut usu habeo movet tollit.<br />
<br />
In qui option torquatos, ne saperet fierent suscipiantur eam. Eum ut eleifend maluisset, mea probo detraxit necessitatibus no, eam ad elit interpretaris. Ea quod quas vidisse ius, vel fabulas erroribus id. Aeque iisque eu mei, per tempor delenit impedit no, eum simul soluta perfecto ei. Vel at euripidis efficiendi reformidans, ius autem congue ad.<br />
<br />
Te eum option commune, ea mei consul audiam delectus. An mea putant torquatos maiestatis. Nec ad elitr essent, discere pericula ea vim, dolor affert reformidans per in. Epicurei electram no vis, essent viderer theophrastus usu ei.<br />
<br />
Ne pro errem invenire, ut malorum hendrerit qui. Partem vidisse in vis, iusto nostrum pro te, ne putant delectus intellegat sit. Diceret dolorem liberavisse eam ei, sanctus urbanitas eu nec. Cu vim electram sapientem. Scripta quaeque ius et, elitr numquam inciderint nam eu. His eu labore invenire, mea ut persequeris delicatissimi, his quod case albucius ex.<br />
<br />
Quodsi iriure temporibus at cum, sit eu quas putent. Legimus percipitur eam ex, nonumes adipisci te vim. Ne munere everti appetere sea. Ea alii civibus sed. Dolorem euripidis ex eos.')
GO
INSERT [snlg_V1].[TblAnketCevap] ([AnketId], [Cevap], [IP], [UserId]) VALUES (154, N'A', N'85.105.213.167', NULL)
GO
INSERT [snlg_V1].[TblAnketCevap] ([AnketId], [Cevap], [IP], [UserId]) VALUES (154, N'A', N'88.242.28.152', NULL)
GO
INSERT [snlg_V1].[TblAnketCevap] ([AnketId], [Cevap], [IP], [UserId]) VALUES (154, N'B', N'176.41.53.241', NULL)
GO
INSERT [snlg_V1].[TblAnketCevap] ([AnketId], [Cevap], [IP], [UserId]) VALUES (154, N'E', N'217.131.161.42', NULL)
GO
INSERT [snlg_V1].[TblAnketCevap] ([AnketId], [Cevap], [IP], [UserId]) VALUES (154, N'E', N'217.131.161.42', NULL)
GO
INSERT [snlg_V1].[TblAnketCevap] ([AnketId], [Cevap], [IP], [UserId]) VALUES (154, N'D', N'78.172.239.147', NULL)
GO
INSERT [snlg_V1].[TblAnketCevap] ([AnketId], [Cevap], [IP], [UserId]) VALUES (154, N'F', N'92.45.136.73', NULL)
GO
INSERT [snlg_V1].[TblAnketCevap] ([AnketId], [Cevap], [IP], [UserId]) VALUES (154, N'A', N'78.172.227.195', NULL)
GO
INSERT [snlg_V1].[TblAnketCevap] ([AnketId], [Cevap], [IP], [UserId]) VALUES (154, N'A', N'213.153.223.92', NULL)
GO
INSERT [snlg_V1].[TblAnketCevap] ([AnketId], [Cevap], [IP], [UserId]) VALUES (154, N'A', N'95.8.170.22', NULL)
GO
INSERT [snlg_V1].[TblAnketCevap] ([AnketId], [Cevap], [IP], [UserId]) VALUES (154, N'D', NULL, 1)
GO
INSERT [snlg_V1].[TblAnketCevap] ([AnketId], [Cevap], [IP], [UserId]) VALUES (154, N'A', N'78.160.195.5', NULL)
GO
INSERT [snlg_V1].[TblAnketCevap] ([AnketId], [Cevap], [IP], [UserId]) VALUES (154, N'D', N'5.46.188.42', NULL)
GO
INSERT [snlg_V1].[TblAnketCevap] ([AnketId], [Cevap], [IP], [UserId]) VALUES (154, N'F', N'88.254.50.142', NULL)
GO
INSERT [snlg_V1].[TblAnketCevap] ([AnketId], [Cevap], [IP], [UserId]) VALUES (154, N'B', N'178.233.38.250', NULL)
GO
INSERT [snlg_V1].[TblAnketCevap] ([AnketId], [Cevap], [IP], [UserId]) VALUES (154, N'A', N'212.156.88.118', NULL)
GO
INSERT [snlg_V1].[TblAnketCevap] ([AnketId], [Cevap], [IP], [UserId]) VALUES (154, N'A', N'85.102.161.70', NULL)
GO
INSERT [snlg_V1].[TblAnketCevap] ([AnketId], [Cevap], [IP], [UserId]) VALUES (154, N'A', N'88.240.118.200', NULL)
GO
INSERT [snlg_V1].[TblAnketCevap] ([AnketId], [Cevap], [IP], [UserId]) VALUES (154, N'D', N'78.188.213.186', NULL)
GO
INSERT [snlg_V1].[TblAnketCevap] ([AnketId], [Cevap], [IP], [UserId]) VALUES (154, N'D', N'83.66.111.132', NULL)
GO
INSERT [snlg_V1].[TblAnketCevap] ([AnketId], [Cevap], [IP], [UserId]) VALUES (154, N'A', N'78.172.71.100', NULL)
GO
INSERT [snlg_V1].[TblAnketCevap] ([AnketId], [Cevap], [IP], [UserId]) VALUES (154, N'A', N'94.122.144.134', NULL)
GO
INSERT [snlg_V1].[TblAnketCevap] ([AnketId], [Cevap], [IP], [UserId]) VALUES (154, N'F', N'82.222.42.46', NULL)
GO
INSERT [snlg_V1].[TblAnketCevap] ([AnketId], [Cevap], [IP], [UserId]) VALUES (154, N'C', N'176.43.214.74', NULL)
GO
INSERT [snlg_V1].[TblAnketCevap] ([AnketId], [Cevap], [IP], [UserId]) VALUES (154, N'B', N'85.100.108.221', NULL)
GO
INSERT [snlg_V1].[TblAnketCevap] ([AnketId], [Cevap], [IP], [UserId]) VALUES (154, N'B', N'78.188.65.81', NULL)
GO
INSERT [snlg_V1].[TblAnketCevap] ([AnketId], [Cevap], [IP], [UserId]) VALUES (154, N'A', N'78.184.245.198', NULL)
GO
INSERT [snlg_V1].[TblAnketCevap] ([AnketId], [Cevap], [IP], [UserId]) VALUES (154, N'A', N'95.15.150.180', NULL)
GO
INSERT [snlg_V1].[TblAnketCevap] ([AnketId], [Cevap], [IP], [UserId]) VALUES (154, N'A', N'78.173.86.200', NULL)
GO
INSERT [snlg_V1].[TblAnketCevap] ([AnketId], [Cevap], [IP], [UserId]) VALUES (154, N'E', N'88.254.248.246', NULL)
GO
INSERT [snlg_V1].[TblAnketCevap] ([AnketId], [Cevap], [IP], [UserId]) VALUES (154, N'F', N'195.174.87.233', NULL)
GO
INSERT [snlg_V1].[TblAnketCevap] ([AnketId], [Cevap], [IP], [UserId]) VALUES (154, N'A', N'78.161.89.229', NULL)
GO
INSERT [snlg_V1].[TblAnketCevap] ([AnketId], [Cevap], [IP], [UserId]) VALUES (154, N'A', N'78.186.6.156', NULL)
GO
INSERT [snlg_V1].[TblAnketCevap] ([AnketId], [Cevap], [IP], [UserId]) VALUES (154, N'A', N'78.161.78.87', NULL)
GO
INSERT [snlg_V1].[TblAnketCevap] ([AnketId], [Cevap], [IP], [UserId]) VALUES (154, N'A', N'94.122.202.142', NULL)
GO
INSERT [snlg_V1].[TblAnketCevap] ([AnketId], [Cevap], [IP], [UserId]) VALUES (154, N'D', N'78.188.138.205', NULL)
GO
INSERT [snlg_V1].[TblAnketCevap] ([AnketId], [Cevap], [IP], [UserId]) VALUES (154, N'B', N'88.232.105.112', NULL)
GO
INSERT [snlg_V1].[TblAnketCevap] ([AnketId], [Cevap], [IP], [UserId]) VALUES (154, N'E', N'85.99.32.217', NULL)
GO
INSERT [snlg_V1].[TblAnketCevap] ([AnketId], [Cevap], [IP], [UserId]) VALUES (154, N'F', N'78.165.40.13', NULL)
GO
INSERT [snlg_V1].[TblAnketCevap] ([AnketId], [Cevap], [IP], [UserId]) VALUES (154, N'F', N'78.188.10.201', NULL)
GO
INSERT [snlg_V1].[TblAnketCevap] ([AnketId], [Cevap], [IP], [UserId]) VALUES (154, N'A', N'78.189.24.85', NULL)
GO
INSERT [snlg_V1].[TblAnketCevap] ([AnketId], [Cevap], [IP], [UserId]) VALUES (154, N'D', N'176.41.13.94', NULL)
GO
INSERT [snlg_V1].[TblAnketCevap] ([AnketId], [Cevap], [IP], [UserId]) VALUES (154, N'E', N'188.3.157.144', NULL)
GO
INSERT [snlg_V1].[TblAnketCevap] ([AnketId], [Cevap], [IP], [UserId]) VALUES (154, N'A', N'95.10.14.175', NULL)
GO
INSERT [snlg_V1].[TblAnketCevap] ([AnketId], [Cevap], [IP], [UserId]) VALUES (154, N'F', N'85.110.50.26', NULL)
GO
INSERT [snlg_V1].[TblAnketCevap] ([AnketId], [Cevap], [IP], [UserId]) VALUES (154, N'B', N'78.183.205.217', NULL)
GO
INSERT [snlg_V1].[TblAnketCevap] ([AnketId], [Cevap], [IP], [UserId]) VALUES (154, N'A', N'88.252.36.151', NULL)
GO
INSERT [snlg_V1].[TblAnketCevap] ([AnketId], [Cevap], [IP], [UserId]) VALUES (154, N'D', N'88.233.202.107', NULL)
GO
INSERT [snlg_V1].[TblAnketCevap] ([AnketId], [Cevap], [IP], [UserId]) VALUES (154, N'B', N'81.213.217.135', NULL)
GO
INSERT [snlg_V1].[TblAnketCevap] ([AnketId], [Cevap], [IP], [UserId]) VALUES (154, N'A', N'88.229.86.142', NULL)
GO
INSERT [snlg_V1].[TblAnketCevap] ([AnketId], [Cevap], [IP], [UserId]) VALUES (154, N'B', N'78.185.28.182', NULL)
GO
INSERT [snlg_V1].[TblAnketCevap] ([AnketId], [Cevap], [IP], [UserId]) VALUES (154, N'F', N'85.106.152.163', NULL)
GO
INSERT [snlg_V1].[TblAnketCevap] ([AnketId], [Cevap], [IP], [UserId]) VALUES (154, N'D', N'88.247.126.230', NULL)
GO
INSERT [snlg_V1].[TblAnketCevap] ([AnketId], [Cevap], [IP], [UserId]) VALUES (154, N'D', N'88.248.108.66', NULL)
GO
INSERT [snlg_V1].[TblAnketCevap] ([AnketId], [Cevap], [IP], [UserId]) VALUES (154, N'A', N'212.175.77.254', NULL)
GO
INSERT [snlg_V1].[TblAnketCevap] ([AnketId], [Cevap], [IP], [UserId]) VALUES (154, N'A', N'::1', NULL)
GO
SET IDENTITY_INSERT [snlg_V1].[TblAdminYetkiler] ON 

GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5169, N'activities.aspx-Delete', N'Silebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5170, N'activities.aspx-Insert', N'Oluşturabilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5172, N'activities.aspx-Update', N'Düzenleyebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5173, N'activities.aspx-View', N'Görüntüleyebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5175, N'activity-edit.aspx-Insert', N'Oluşturabilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5178, N'activity-edit.aspx-View', N'Görüntüleyebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5179, N'announcement-add.aspx-Delete', N'Silebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5180, N'announcement-add.aspx-Insert', N'Oluşturabilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5183, N'announcement-add.aspx-View', N'Görüntüleyebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5184, N'announcements.aspx-Delete', N'Silebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5185, N'announcements.aspx-Insert', N'Oluşturabilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5187, N'announcements.aspx-Update', N'Düzenleyebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5188, N'announcements.aspx-View', N'Görüntüleyebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5190, N'article-categories.aspx-Insert', N'Oluşturabilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5193, N'article-categories.aspx-View', N'Görüntüleyebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5194, N'article-comments.aspx-Delete', N'Silebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5195, N'article-comments.aspx-Insert', N'Oluşturabilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5197, N'article-comments.aspx-Update', N'Düzenleyebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5198, N'article-comments.aspx-View', N'Görüntüleyebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5203, N'article-edit.aspx-View', N'Görüntüleyebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5204, N'articles.aspx-Delete', N'Silebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5205, N'articles.aspx-Insert', N'Oluşturabilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5207, N'articles.aspx-Update', N'Düzenleyebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5208, N'articles.aspx-View', N'Görüntüleyebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5209, N'authorization-keys.aspx-Delete', N'Silebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5210, N'authorization-keys.aspx-Insert', N'Oluşturabilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5212, N'authorization-keys.aspx-Update', N'Düzenleyebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5213, N'authorization-keys.aspx-View', N'Görüntüleyebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5214, N'block-edit.aspx-Delete', N'Silebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5215, N'block-edit.aspx-Insert', N'Oluşturabilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5218, N'block-edit.aspx-View', N'Görüntüleyebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5219, N'blocks.aspx-Delete', N'Silebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5220, N'blocks.aspx-Insert', N'Oluşturabilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5222, N'blocks.aspx-Update', N'Düzenleyebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5223, N'blocks.aspx-View', N'Görüntüleyebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5224, N'block-web-control-add.aspx-Delete', N'Silebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5225, N'block-web-control-add.aspx-Insert', N'Oluşturabilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5227, N'block-web-control-add.aspx-Update', N'Düzenleyebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5228, N'block-web-control-add.aspx-View', N'Görüntüleyebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5229, N'default-photos.aspx-Delete', N'Silebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5230, N'default-photos.aspx-Insert', N'Oluşturabilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5232, N'default-photos.aspx-Update', N'Düzenleyebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5233, N'default-photos.aspx-View', N'Görüntüleyebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5234, N'default-templates.aspx-Delete', N'Silebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5235, N'default-templates.aspx-Insert', N'Oluşturabilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5237, N'default-templates.aspx-Update', N'Düzenleyebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5238, N'default-templates.aspx-View', N'Görüntüleyebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5240, N'email-forms.aspx-Insert', N'Oluşturabilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5242, N'email-forms.aspx-Update', N'Düzenleyebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5243, N'email-forms.aspx-View', N'Görüntüleyebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5244, N'email-forms-edit.aspx-Delete', N'Silebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5245, N'email-forms-edit.aspx-Insert', N'Oluşturabilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5248, N'email-forms-edit.aspx-View', N'Görüntüleyebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5249, N'gallery-photo-add.aspx-Delete', N'Silebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5250, N'gallery-photo-add.aspx-Insert', N'Oluşturabilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5252, N'gallery-photo-add.aspx-Update', N'Düzenleyebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5253, N'gallery-photo-add.aspx-View', N'Görüntüleyebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5254, N'gallery-photos.aspx-Delete', N'Silebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5257, N'gallery-photos.aspx-Update', N'Düzenleyebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5258, N'gallery-photos.aspx-View', N'Görüntüleyebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5259, N'guestbook.aspx-Delete', N'Silebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5260, N'guestbook.aspx-Insert', N'Oluşturabilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5262, N'guestbook.aspx-Update', N'Düzenleyebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5263, N'guestbook.aspx-View', N'Görüntüleyebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5264, N'install-theme.aspx-Delete', N'Silebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5265, N'install-theme.aspx-Insert', N'Oluşturabilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5267, N'install-theme.aspx-Update', N'Düzenleyebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5268, N'install-theme.aspx-View', N'Görüntüleyebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5269, N'language-edit.aspx-Delete', N'Silebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5270, N'language-edit.aspx-Insert', N'Oluşturabilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5272, N'language-edit.aspx-Update', N'Düzenleyebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5273, N'language-edit.aspx-View', N'Görüntüleyebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5274, N'languages.aspx-Delete', N'Silebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5275, N'languages.aspx-Insert', N'Oluşturabilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5277, N'languages.aspx-Update', N'Düzenleyebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5278, N'languages.aspx-View', N'Görüntüleyebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5279, N'member-detail.aspx-Delete', N'Silebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5280, N'member-detail.aspx-Insert', N'Oluşturabilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5283, N'member-detail.aspx-View', N'Görüntüleyebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5284, N'members.aspx-Delete', N'Silebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5285, N'members.aspx-Insert', N'Oluşturabilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5287, N'members.aspx-Update', N'Düzenleyebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5288, N'members.aspx-View', N'Görüntüleyebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5289, N'menu-groups.aspx-Delete', N'Silebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5290, N'menu-groups.aspx-Insert', N'Oluşturabilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5292, N'menu-groups.aspx-Update', N'Düzenleyebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5293, N'menu-groups.aspx-View', N'Görüntüleyebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5294, N'menus.aspx-Delete', N'Silebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5298, N'menus.aspx-View', N'Görüntüleyebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5299, N'news.aspx-Delete', N'Silebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5300, N'news.aspx-Insert', N'Oluşturabilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5302, N'news.aspx-Update', N'Düzenleyebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5303, N'news.aspx-View', N'Görüntüleyebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5304, N'news-edit.aspx-Delete', N'Silebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5305, N'news-edit.aspx-Insert', N'Oluşturabilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5308, N'news-edit.aspx-View', N'Görüntüleyebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5309, N'page-edit.aspx-Delete', N'Silebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5310, N'page-edit.aspx-Insert', N'Oluşturabilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5313, N'page-edit.aspx-View', N'Görüntüleyebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5314, N'pages.aspx-Delete', N'Silebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5315, N'pages.aspx-Insert', N'Oluşturabilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5317, N'pages.aspx-Update', N'Düzenleyebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5318, N'pages.aspx-View', N'Görüntüleyebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5319, N'photo-galleries.aspx-Delete', N'Silebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5320, N'photo-galleries.aspx-Insert', N'Oluşturabilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5322, N'photo-galleries.aspx-Update', N'Düzenleyebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5323, N'photo-galleries.aspx-View', N'Görüntüleyebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5324, N'placeholders.aspx-Delete', N'Silebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5325, N'placeholders.aspx-Insert', N'Oluşturabilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5327, N'placeholders.aspx-Update', N'Düzenleyebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5328, N'placeholders.aspx-View', N'Görüntüleyebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5329, N'poll-edit.aspx-Delete', N'Silebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5330, N'poll-edit.aspx-Insert', N'Oluşturabilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5333, N'poll-edit.aspx-View', N'Görüntüleyebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5334, N'polls.aspx-Delete', N'Silebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5335, N'polls.aspx-Insert', N'Oluşturabilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5337, N'polls.aspx-Update', N'Düzenleyebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5338, N'polls.aspx-View', N'Görüntüleyebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5340, N'product-categories.aspx-Insert', N'Oluşturabilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5343, N'product-categories.aspx-View', N'Görüntüleyebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5344, N'product-edit.aspx-Delete', N'Silebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5345, N'product-edit.aspx-Insert', N'Oluşturabilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5348, N'product-edit.aspx-View', N'Görüntüleyebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5349, N'products.aspx-Delete', N'Silebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5350, N'products.aspx-Insert', N'Oluşturabilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5352, N'products.aspx-Update', N'Düzenleyebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5353, N'products.aspx-View', N'Görüntüleyebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5354, N'project-add.aspx-Delete', N'Silebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5355, N'project-add.aspx-Insert', N'Oluşturabilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5358, N'project-add.aspx-View', N'Görüntüleyebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5359, N'project-categories.aspx-Delete', N'Silebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5363, N'project-categories.aspx-View', N'Görüntüleyebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5364, N'projects.aspx-Delete', N'Silebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5365, N'projects.aspx-Insert', N'Oluşturabilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5367, N'projects.aspx-Update', N'Düzenleyebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5368, N'projects.aspx-View', N'Görüntüleyebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5369, N'project-sub-page-add.aspx-Delete', N'Silebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5370, N'project-sub-page-add.aspx-Insert', N'Oluşturabilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5373, N'project-sub-page-add.aspx-View', N'Görüntüleyebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5374, N'project-sub-pages.aspx-Delete', N'Silebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5375, N'project-sub-pages.aspx-Insert', N'Oluşturabilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5377, N'project-sub-pages.aspx-Update', N'Düzenleyebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5378, N'project-sub-pages.aspx-View', N'Görüntüleyebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5379, N'reference-categories.aspx-Delete', N'Silebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5380, N'reference-categories.aspx-Insert', N'Oluşturabilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5382, N'reference-categories.aspx-Update', N'Düzenleyebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5383, N'reference-categories.aspx-View', N'Görüntüleyebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5384, N'reference-category-edit.aspx-Delete', N'Silebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5385, N'reference-category-edit.aspx-Insert', N'Oluşturabilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5388, N'reference-category-edit.aspx-View', N'Görüntüleyebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5389, N'reference-edit.aspx-Inert', N'reference-edit.aspx-Inert')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5391, N'references.aspx-Insert', N'Oluşturabilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5393, N'references.aspx-Update', N'Düzenleyebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5394, N'references.aspx-View', N'Görüntüleyebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5395, N'role-authorization.aspx-Delete', N'Silebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5396, N'role-authorization.aspx-Insert', N'Oluşturabilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5398, N'role-authorization.aspx-Update', N'Düzenleyebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5399, N'role-authorization.aspx-View', N'Görüntüleyebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5400, N'roles.aspx-Delete', N'Silebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5401, N'roles.aspx-Insert', N'Oluşturabilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5403, N'roles.aspx-Update', N'Düzenleyebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5404, N'roles.aspx-View', N'Görüntüleyebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5405, N'search-engine.aspx-Delete', N'Silebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5406, N'search-engine.aspx-Insert', N'Oluşturabilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5408, N'search-engine.aspx-Update', N'Düzenleyebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5409, N'search-engine.aspx-View', N'Görüntüleyebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5410, N'start-page.aspx-Delete', N'Silebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5411, N'start-page.aspx-Insert', N'Oluşturabilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5413, N'start-page.aspx-Update', N'Düzenleyebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5414, N'start-page.aspx-View', N'Görüntüleyebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5415, N'template-pages-transfer.aspx-Delete', N'Silebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5416, N'template-pages-transfer.aspx-Insert', N'Oluşturabilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5418, N'template-pages-transfer.aspx-Update', N'Düzenleyebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5419, N'template-pages-transfer.aspx-View', N'Görüntüleyebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5420, N'templates.aspx-Delete', N'Silebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5421, N'templates.aspx-Insert', N'Oluşturabilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5423, N'templates.aspx-Update', N'Düzenleyebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5424, N'templates.aspx-View', N'Görüntüleyebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5425, N'theme-Delete.aspx-Delete', N'Silebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5426, N'theme-Insert.aspx-Insert', N'Oluşturabilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5428, N'theme-Update.aspx-Update', N'Düzenleyebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5429, N'theme-View.aspx-View', N'Görüntüleyebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5430, N'UrlKeys.aspx-Delete', N'Silebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5431, N'UrlKeys.aspx-Insert', N'Oluşturabilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5433, N'UrlKeys.aspx-Update', N'Düzenleyebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5434, N'UrlKeys.aspx-View', N'Görüntüleyebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5714, N'menus.aspx-Update', N'Düzenleyebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5735, N'theme-select.aspx-View', N'Görüntüleyebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5829, N'article-edit.aspx-Delete', N'Silebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5869, N'article-categories.aspx-Delete', N'Silebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5908, N'announcement-add.aspx-Update', N'Düzenleyebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5927, N'product-photos.aspx-Delete', N'Silebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (5993, N'references.aspx-Delete', N'Silebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (6065, N'article-edit.aspx-Update', N'Düzenleyebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (6074, N'article-categories.aspx-Update', N'Düzenleyebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (6089, N'news-edit.aspx-Update', N'Düzenleyebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (6114, N'reference-category-edit.aspx-Update', N'Düzenleyebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (6168, N'activity-edit.aspx-Update', N'Düzenleyebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (6170, N'activity-edit.aspx-Delete', N'Silebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (6189, N'poll-edit.aspx-Update', N'Düzenleyebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (6257, N'email-forms-edit.aspx-Update', N'Düzenleyebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (6561, N'project-sub-page-add.aspx-Update', N'Düzenleyebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (6621, N'page-edit.aspx-Update', N'Düzenleyebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (6643, N'product-edit.aspx-Update', N'Düzenleyebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (6697, N'block-edit.aspx-Update', N'Düzenleyebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (6704, N'member-detail.aspx-Update', N'Düzenleyebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (6709, N'email-forms.aspx-Delete', N'Silebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (6763, N'article-edit.aspx-Insert', N'Oluşturabilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (6775, N'product-photos.aspx-Insert', N'Oluşturabilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (6835, N'gallery-photos.aspx-Insert', N'Oluşturabilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (6849, N'reference-edit.aspx-Update', N'Düzenleyebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (6969, N'product-categories.aspx-Delete', N'Silebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (6971, N'product-categories.aspx-Update', N'Düzenleyebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (7002, N'project-categories.aspx-Insert', N'Oluşturabilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (7008, N'project-add.aspx-Update', N'Düzenleyebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (7019, N'menus.aspx-Insert', N'Oluşturabilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (7025, N'project-categories.aspx-Update', N'Düzenleyebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (7044, N'default.aspx-View', N'Görüntüleyebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (7045, N'test.aspx-View', N'Görüntüleyebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (7046, N'template-design.aspx-View', N'Görüntüleyebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (7047, N'reference-edit.aspx-View', N'Görüntüleyebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (7048, N'product-photos.aspx-View', N'Görüntüleyebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (7049, N'member-role.aspx-View', N'Görüntüleyebilir')
GO
INSERT [snlg_V1].[TblAdminYetkiler] ([YetkiId], [Yetki], [YetkiTanim]) VALUES (7050, N'theme-install.aspx-View', N'Görüntüleyebilir')
GO
SET IDENTITY_INSERT [snlg_V1].[TblAdminYetkiler] OFF
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5169, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5170, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5172, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5175, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5178, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5179, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5908, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5183, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5184, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5185, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5187, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5188, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5190, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5193, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5194, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5195, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5197, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5198, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5203, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5204, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5205, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5207, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5208, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5209, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5210, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5212, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5213, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5214, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5215, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5218, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5219, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5220, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5222, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5223, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5224, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5225, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5227, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5228, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (7044, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5229, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5230, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5232, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5233, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5234, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5235, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5237, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5238, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5240, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5242, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5243, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5244, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5245, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5248, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5249, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5250, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5252, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5253, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5254, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5257, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5258, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5259, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5260, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5262, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5263, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5264, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5265, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5267, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5268, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5269, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5270, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5272, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5273, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5274, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5275, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5277, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5278, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5279, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5280, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5283, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5284, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5285, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5287, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5288, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5289, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5290, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5292, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5293, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5294, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5298, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5299, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5300, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5302, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5303, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5304, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5305, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5308, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5309, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5310, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5313, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5314, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5315, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5317, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5318, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5319, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5320, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5322, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5323, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5324, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5325, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5327, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5328, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5329, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5330, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5333, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5334, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5335, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5337, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5338, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5340, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5343, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5344, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5345, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5348, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5349, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5350, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5352, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5353, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5354, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5355, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5358, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5359, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5363, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5364, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5365, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5367, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5368, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5369, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5370, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5373, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5374, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5375, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5377, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5378, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5379, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5380, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5382, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5383, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5384, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5385, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5388, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5389, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5391, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5393, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5394, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5395, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5396, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5398, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5399, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5400, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5401, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5403, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5404, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5405, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5406, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5408, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5409, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5410, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5411, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5413, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5414, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5415, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5416, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5418, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5419, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5420, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5421, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5423, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5424, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5425, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5426, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5428, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5429, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5430, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5431, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5433, 11)
GO
INSERT [snlg_V1].[TblRol_Yetki] ([YetkiId], [RolId]) VALUES (5434, 11)
GO
SET IDENTITY_INSERT [snlg_V1].[TblPlaceHolders] ON 

GO
INSERT [snlg_V1].[TblPlaceHolders] ([ContainerId], [PHName], [Title]) VALUES (-32648, N'snlg_PH1', N'Top Left')
GO
INSERT [snlg_V1].[TblPlaceHolders] ([ContainerId], [PHName], [Title]) VALUES (-32647, N'snlg_PH2', N'Top Right')
GO
INSERT [snlg_V1].[TblPlaceHolders] ([ContainerId], [PHName], [Title]) VALUES (-32646, N'snlg_PH3', N'Content 3/Col-4 (B)')
GO
INSERT [snlg_V1].[TblPlaceHolders] ([ContainerId], [PHName], [Title]) VALUES (-32645, N'snlg_PH4', N'Content 3/Col-4 (C)')
GO
INSERT [snlg_V1].[TblPlaceHolders] ([ContainerId], [PHName], [Title]) VALUES (-32644, N'snlg_PH5', N'Logo')
GO
INSERT [snlg_V1].[TblPlaceHolders] ([ContainerId], [PHName], [Title]) VALUES (-32643, N'snlg_PH6', N'Top Menu')
GO
INSERT [snlg_V1].[TblPlaceHolders] ([ContainerId], [PHName], [Title]) VALUES (-32641, N'snlg_PH8', N'Content 3/Col-4 (A)')
GO
INSERT [snlg_V1].[TblPlaceHolders] ([ContainerId], [PHName], [Title]) VALUES (-32640, N'snlg_PH9', N'Content 2/Col-12 (A)')
GO
INSERT [snlg_V1].[TblPlaceHolders] ([ContainerId], [PHName], [Title]) VALUES (-32639, N'snlg_PH10', N'Content 5/Col-2 (A)')
GO
INSERT [snlg_V1].[TblPlaceHolders] ([ContainerId], [PHName], [Title]) VALUES (-32638, N'snlg_PH11', N'Content 5/Col-2 (B)')
GO
INSERT [snlg_V1].[TblPlaceHolders] ([ContainerId], [PHName], [Title]) VALUES (-32637, N'snlg_PH12', N'Content 5/Col-2 (C)')
GO
INSERT [snlg_V1].[TblPlaceHolders] ([ContainerId], [PHName], [Title]) VALUES (-32636, N'snlg_PH13', N'Content 5/Col-2 (D)')
GO
INSERT [snlg_V1].[TblPlaceHolders] ([ContainerId], [PHName], [Title]) VALUES (-32635, N'snlg_PH14', N'Content 5/Col-2 (E)')
GO
INSERT [snlg_V1].[TblPlaceHolders] ([ContainerId], [PHName], [Title]) VALUES (-32633, N'snlg_PH15', N'Content 7/Col-9 (A)')
GO
INSERT [snlg_V1].[TblPlaceHolders] ([ContainerId], [PHName], [Title]) VALUES (-32632, N'snlg_PH16', N'Content 6/Col-3 (B)')
GO
INSERT [snlg_V1].[TblPlaceHolders] ([ContainerId], [PHName], [Title]) VALUES (-32631, N'snlg_PH17', N'Content 8/Col-4 (A)')
GO
INSERT [snlg_V1].[TblPlaceHolders] ([ContainerId], [PHName], [Title]) VALUES (-32630, N'snlg_PH18', N'Content 8/Col-8 (B)')
GO
INSERT [snlg_V1].[TblPlaceHolders] ([ContainerId], [PHName], [Title]) VALUES (-32628, N'snlg_PH21', N'Content 9/Col-12 (A)')
GO
INSERT [snlg_V1].[TblPlaceHolders] ([ContainerId], [PHName], [Title]) VALUES (-32627, N'snlg_PH22', N'Foo/Col-2 (A)')
GO
INSERT [snlg_V1].[TblPlaceHolders] ([ContainerId], [PHName], [Title]) VALUES (-32626, N'snlg_PH23', N'Foo/Col-5 (B)')
GO
INSERT [snlg_V1].[TblPlaceHolders] ([ContainerId], [PHName], [Title]) VALUES (-32622, N'snlg_PH27', N'Content 6/Col-3 (A)')
GO
INSERT [snlg_V1].[TblPlaceHolders] ([ContainerId], [PHName], [Title]) VALUES (-32621, N'snlg_PH28', N'Content 6/Col-9 (B)')
GO
INSERT [snlg_V1].[TblPlaceHolders] ([ContainerId], [PHName], [Title]) VALUES (-32618, N'snlg_PH26', N'Foo/Col-2 (D)')
GO
INSERT [snlg_V1].[TblPlaceHolders] ([ContainerId], [PHName], [Title]) VALUES (-32617, N'snlg_PH29', N'Content 5/Col-2 (F)')
GO
INSERT [snlg_V1].[TblPlaceHolders] ([ContainerId], [PHName], [Title]) VALUES (-32616, N'snlg_PH30', N'Content 4/Col-6 (A)')
GO
INSERT [snlg_V1].[TblPlaceHolders] ([ContainerId], [PHName], [Title]) VALUES (-32615, N'snlg_PH31', N'Content 4/Col-6 (B)')
GO
INSERT [snlg_V1].[TblPlaceHolders] ([ContainerId], [PHName], [Title]) VALUES (-32613, N'snlg_PH33', N'Page Title')
GO
INSERT [snlg_V1].[TblPlaceHolders] ([ContainerId], [PHName], [Title]) VALUES (-32612, N'snlg_PH34', N'Breadcrumbs')
GO
INSERT [snlg_V1].[TblPlaceHolders] ([ContainerId], [PHName], [Title]) VALUES (-32611, N'snlg_PH35', N'Content 1/Full Width')
GO
INSERT [snlg_V1].[TblPlaceHolders] ([ContainerId], [PHName], [Title]) VALUES (-32610, N'snlg_PH36', N'Foo/Col-3 (C)')
GO
SET IDENTITY_INSERT [snlg_V1].[TblPlaceHolders] OFF
GO
SET IDENTITY_INSERT [snlg_V1].[TblDesignSablonIcerik] ON 

GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (4953, -32240, -32644, -32600, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (4955, -32240, -32643, 1, 1)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (4956, -32240, -32613, 38, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (4959, -32240, -32627, -32091, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (4960, -32240, -32626, 2, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (4961, -32240, -32618, -32092, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (5010, -32328, -32644, -32600, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (5012, -32328, -32643, 1, 1)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (5013, -32328, -32613, 38, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (5015, -32328, -32640, -32603, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (5016, -32328, -32633, -32580, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (5017, -32328, -32632, -32609, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (5018, -32328, -32627, -32091, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (5019, -32328, -32626, 2, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (5020, -32328, -32618, -32092, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (5110, -32054, -32644, -32600, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (5112, -32054, -32643, 1, 1)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (5113, -32054, -32613, 38, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (5115, -32054, -32640, -32603, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (5116, -32054, -32640, 39, 1)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (5117, -32054, -32627, -32091, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (5118, -32054, -32626, 2, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (5119, -32054, -32618, -32092, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (5151, -32317, -32644, -32600, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (5153, -32317, -32643, 1, 1)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (5154, -32317, -32613, 38, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (5156, -32317, -32622, -32577, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (5157, -32317, -32621, -32578, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (5158, -32317, -32627, -32091, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (5159, -32317, -32626, 2, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (5160, -32317, -32618, -32092, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (5582, -32258, -32644, -32600, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (5583, -32258, -32643, 1, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (5584, -32258, -32613, 38, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (5586, -32258, -32640, -32578, 1)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (5587, -32258, -32640, -32603, 2)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (5588, -32258, -32627, -32091, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (5589, -32258, -32626, 2, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (5590, -32258, -32618, -32092, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (5692, -32328, -32640, 36, 100)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (5785, -32054, -32612, 36, 100)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (5790, -32240, -32640, 36, 1)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (5792, -32317, -32640, 36, 1)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (5793, -32258, -32640, 36, 1)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (5829, -32094, -32644, -32600, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (5830, -32094, -32643, 1, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (5831, -32094, -32613, 38, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (5832, -32094, -32612, 36, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (5833, -32094, -32622, 51, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (5834, -32094, -32621, -32571, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (5835, -32094, -32627, -32091, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (5836, -32094, -32626, 2, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (5837, -32094, -32618, -32092, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (5838, -32321, -32644, -32600, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (5839, -32321, -32643, 1, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (5840, -32321, -32613, 38, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (5841, -32321, -32612, 36, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (5843, -32321, -32616, -32603, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (5844, -32321, -32615, -32605, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (5845, -32321, -32627, -32091, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (5846, -32321, -32626, 2, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (5847, -32321, -32618, -32092, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (5927, -32319, -32644, -32600, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (5928, -32319, -32643, 1, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (5929, -32319, -32613, 38, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (5930, -32319, -32640, 36, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (5931, -32319, -32622, -32557, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (5932, -32319, -32621, -32561, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (5933, -32319, -32627, -32091, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (5934, -32319, -32626, 2, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (5935, -32319, -32618, -32092, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6247, -32048, -32644, -32600, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6248, -32048, -32644, 1, 1)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6249, -32048, -32613, 38, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6250, -32048, -32612, 36, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6251, -32048, -32622, 41, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6252, -32048, -32621, -32603, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6253, -32048, -32627, -32091, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6254, -32048, -32626, 2, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6255, -32048, -32618, -32092, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6277, -32046, -32644, -32600, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6278, -32046, -32643, 1, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6279, -32046, -32613, 38, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6280, -32046, -32640, 36, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6281, -32046, -32633, 45, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6282, -32046, -32633, 3, 1)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6283, -32046, -32632, -32480, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6284, -32046, -32632, -32476, 1)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6285, -32046, -32632, -32581, 2)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6286, -32046, -32632, -32591, 3)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6287, -32046, -32632, -32590, 4)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6288, -32046, -32632, -32589, 5)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6290, -32046, -32632, -32588, 7)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6291, -32046, -32627, -32091, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6292, -32046, -32626, 2, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6293, -32046, -32618, -32092, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6294, -32045, -32644, -32600, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6295, -32045, -32643, 1, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6296, -32045, -32613, 38, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6297, -32045, -32640, 36, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6298, -32045, -32633, 45, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6299, -32045, -32633, -32582, 1)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6300, -32045, -32633, -32580, 2)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6301, -32045, -32633, -32568, 3)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6303, -32045, -32632, -32480, 1)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6304, -32045, -32632, -32476, 2)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6305, -32045, -32632, -32581, 3)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6306, -32045, -32632, -32591, 4)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6307, -32045, -32632, -32590, 5)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6308, -32045, -32632, -32589, 6)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6310, -32045, -32632, -32588, 8)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6311, -32045, -32627, -32091, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6312, -32045, -32626, 2, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6313, -32045, -32618, -32092, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6371, -32045, -32632, 53, 3)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6373, -32046, -32632, 53, 3)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6398, -32047, -32644, -32600, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6399, -32047, -32643, 1, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6400, -32047, -32613, 38, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6401, -32047, -32612, 36, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6402, -32047, -32640, -32302, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6403, -32047, -32627, -32091, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6404, -32047, -32626, 2, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6405, -32047, -32618, -32092, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6408, -32045, -32632, 52, 6)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6410, -32046, -32632, 52, 6)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6463, -32321, -32610, 54, 1)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6466, -32045, -32610, 54, 1)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6467, -32328, -32610, 54, 1)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6470, -32046, -32610, 54, 1)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6472, -32047, -32610, 54, 1)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6476, -32054, -32610, 54, 1)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6479, -32048, -32610, 54, 1)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6481, -32319, -32610, 54, 1)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6482, -32240, -32610, 54, 1)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6484, -32317, -32610, 54, 1)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6485, -32258, -32610, 54, 1)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6487, -32094, -32610, 54, 1)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6503, -32060, -32644, -32600, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6504, -32060, -32643, 1, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6505, -32060, -32613, 38, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6506, -32060, -32612, 36, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6507, -32060, -32640, -32608, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6508, -32060, -32627, -32091, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6509, -32060, -32626, 2, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6510, -32060, -32610, 54, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6511, -32060, -32618, -32092, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6539, -32320, -32644, -32600, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6540, -32320, -32643, 1, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6541, -32320, -32613, 38, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6542, -32320, -32640, 36, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6543, -32320, -32640, -32603, 1)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6544, -32320, -32622, -32557, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6545, -32320, -32621, -32562, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6546, -32320, -32627, -32091, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6547, -32320, -32626, 2, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6548, -32320, -32610, 54, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6549, -32320, -32618, -32092, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6550, -32106, -32644, -32600, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6551, -32106, -32643, 1, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6552, -32106, -32613, 38, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6553, -32106, -32612, 36, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6554, -32106, -32640, -32603, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6555, -32106, -32633, -32602, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6556, -32106, -32632, -32601, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6557, -32106, -32627, -32091, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6558, -32106, -32626, 2, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6559, -32106, -32610, 54, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6560, -32106, -32618, -32092, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6561, -32325, -32644, -32600, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6562, -32325, -32643, 1, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6563, -32325, -32613, 38, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6564, -32325, -32612, 36, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6565, -32325, -32616, -32603, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6566, -32325, -32615, -32572, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6567, -32325, -32627, -32091, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6568, -32325, -32626, 2, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6569, -32325, -32610, 54, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6570, -32325, -32618, -32092, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6581, -32063, -32644, -32600, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6582, -32063, -32643, 1, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6583, -32063, -32613, 38, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6584, -32063, -32612, 36, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6585, -32063, -32616, -32603, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6586, -32063, -32615, -32527, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6587, -32063, -32615, -32306, 1)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6588, -32063, -32627, -32091, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6589, -32063, -32626, 2, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6590, -32063, -32610, 54, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6591, -32063, -32618, -32092, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6625, -32043, -32644, -32600, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6626, -32043, -32643, 1, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6627, -32043, -32613, 38, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6628, -32043, -32640, 36, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6629, -32043, -32633, 45, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6630, -32043, -32633, -32475, 1)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6631, -32043, -32632, -32480, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6632, -32043, -32632, -32476, 1)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6633, -32043, -32632, -32581, 2)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6634, -32043, -32632, 53, 3)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6635, -32043, -32632, -32591, 4)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6636, -32043, -32632, -32590, 5)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6637, -32043, -32632, -32589, 6)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6638, -32043, -32632, 52, 7)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6639, -32043, -32632, -32588, 8)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6640, -32043, -32627, -32091, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6641, -32043, -32626, 2, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6642, -32043, -32610, 54, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6643, -32043, -32618, -32092, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6644, -32044, -32644, -32600, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6645, -32044, -32643, 1, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6646, -32044, -32613, 38, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6647, -32044, -32640, 36, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6648, -32044, -32633, 45, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6649, -32044, -32633, -32587, 1)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6650, -32044, -32632, -32480, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6651, -32044, -32632, -32476, 1)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6652, -32044, -32632, -32581, 2)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6653, -32044, -32632, 53, 3)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6654, -32044, -32632, -32591, 4)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6655, -32044, -32632, -32590, 5)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6656, -32044, -32632, -32589, 6)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6657, -32044, -32632, 52, 7)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6658, -32044, -32632, -32588, 8)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6659, -32044, -32627, -32091, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6660, -32044, -32626, 2, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6661, -32044, -32610, 54, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6662, -32044, -32618, -32092, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6689, -32270, -32644, -32600, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6690, -32270, -32643, 1, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6691, -32270, -32613, 38, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6692, -32270, -32611, -32603, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6693, -32270, -32640, 36, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6694, -32270, -32627, -32091, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6695, -32270, -32626, 2, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6696, -32270, -32610, 54, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6697, -32270, -32618, -32092, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6698, -32271, -32644, -32600, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6699, -32271, -32643, 1, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6700, -32271, -32613, 38, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6701, -32271, -32612, 36, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6702, -32271, -32611, -32603, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6703, -32271, -32640, -32611, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6704, -32271, -32627, -32091, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6705, -32271, -32626, 2, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6706, -32271, -32610, 54, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6707, -32271, -32618, -32092, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6760, -32041, -32646, -32603, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6761, -32041, -32646, 21, 1)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6776, -32330, -32644, -32600, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6777, -32330, -32643, 1, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6778, -32330, -32611, -32198, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6779, -32330, -32611, -32609, 1)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6780, -32330, -32611, -32603, 2)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6781, -32330, -32622, -32606, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6782, -32330, -32621, -32589, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6783, -32330, -32628, -32556, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6784, -32330, -32628, -32570, 1)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6785, -32330, -32627, -32091, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6786, -32330, -32626, 2, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6787, -32330, -32610, 54, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6788, -32330, -32618, -32092, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6799, -32242, -32644, -32600, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6800, -32242, -32643, 1, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6801, -32242, -32613, 38, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6802, -32242, -32612, 36, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6803, -32242, -32616, -32603, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6804, -32242, -32615, -32435, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6805, -32242, -32627, -32091, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6806, -32242, -32626, 2, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6807, -32242, -32610, 54, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6808, -32242, -32618, -32092, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6809, -32056, -32644, -32600, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6810, -32056, -32643, 1, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6811, -32056, -32613, 38, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6812, -32056, -32640, 36, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6813, -32056, -32633, -32482, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6814, -32056, -32632, -32612, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6815, -32056, -32632, -32480, 1)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6816, -32056, -32632, -32476, 2)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6817, -32056, -32632, 53, 3)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6818, -32056, -32632, -32581, 4)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6819, -32056, -32632, -32591, 5)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6820, -32056, -32632, -32590, 6)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6821, -32056, -32632, -32589, 7)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6822, -32056, -32632, 52, 8)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6823, -32056, -32632, -32588, 9)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6824, -32056, -32627, -32091, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6825, -32056, -32626, 2, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6826, -32056, -32610, 54, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6827, -32056, -32618, -32092, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6828, -32059, -32644, -32600, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6829, -32059, -32643, 1, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6830, -32059, -32613, 38, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6831, -32059, -32640, 45, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6832, -32059, -32640, -32607, 1)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6833, -32059, -32627, -32091, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6834, -32059, -32626, 2, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6835, -32059, -32610, 54, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6836, -32059, -32618, -32092, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6837, -32272, -32644, -32600, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6838, -32272, -32643, 1, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6839, -32272, -32613, 38, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6840, -32272, -32640, 45, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6841, -32272, -32640, -32610, 1)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6842, -32272, -32627, -32091, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6843, -32272, -32626, 2, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6844, -32272, -32610, 54, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6845, -32272, -32618, -32092, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6846, -32095, -32644, -32600, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6847, -32095, -32643, 1, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6848, -32095, -32613, 38, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6849, -32095, -32612, 36, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6850, -32095, -32640, 45, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6851, -32095, -32640, -32303, 1)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6852, -32095, -32627, -32091, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6853, -32095, -32626, 2, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6854, -32095, -32610, 54, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6855, -32095, -32618, -32092, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6856, -32105, -32644, -32600, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6857, -32105, -32643, 1, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6858, -32105, -32613, 38, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6859, -32105, -32612, 36, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6860, -32105, -32640, 45, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6861, -32105, -32640, -32603, 1)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6862, -32105, -32640, -32522, 2)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6863, -32105, -32627, -32091, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6864, -32105, -32626, 2, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6865, -32105, -32610, 54, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6866, -32105, -32618, -32092, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6867, -32318, -32644, -32600, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6868, -32318, -32643, 1, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6869, -32318, -32613, 38, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6870, -32318, -32640, 45, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6871, -32318, -32640, 36, 1)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6872, -32318, -32640, -32555, 2)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6873, -32318, -32627, -32091, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6874, -32318, -32626, 2, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6875, -32318, -32610, 54, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6876, -32318, -32618, -32092, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6877, -32259, -32644, -32600, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6878, -32259, -32643, 1, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6879, -32259, -32613, 38, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6880, -32259, -32640, 45, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6881, -32259, -32640, 36, 1)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6882, -32259, -32622, -32577, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6883, -32259, -32621, -32576, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6884, -32259, -32627, -32091, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6885, -32259, -32626, 2, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6886, -32259, -32610, 54, 0)
GO
INSERT [snlg_V1].[TblDesignSablonIcerik] ([BlockPlaceID], [SablonId], [ContainerId], [UCId], [Sira]) VALUES (6887, -32259, -32618, -32092, 0)
GO
SET IDENTITY_INSERT [snlg_V1].[TblDesignSablonIcerik] OFF
GO
SET IDENTITY_INSERT [snlg_V1].[TblSablon_Modul] ON 

GO
INSERT [snlg_V1].[TblSablon_Modul] ([AnahtarId], [SablonAnahtar], [SablonId], [Aciklama]) VALUES (-32000, N'blog', -32045, N'Makaleye tıklanınca')
GO
INSERT [snlg_V1].[TblSablon_Modul] ([AnahtarId], [SablonAnahtar], [SablonId], [Aciklama]) VALUES (-31999, N'user', -32242, N'Üyeye tıklanınca')
GO
INSERT [snlg_V1].[TblSablon_Modul] ([AnahtarId], [SablonAnahtar], [SablonId], [Aciklama]) VALUES (-31998, N'portfolioCtg', -32094, N'Referans kategorisine tıklanınca')
GO
INSERT [snlg_V1].[TblSablon_Modul] ([AnahtarId], [SablonAnahtar], [SablonId], [Aciklama]) VALUES (-31997, N'shop', -32318, N'Ürüne tıklanınca')
GO
INSERT [snlg_V1].[TblSablon_Modul] ([AnahtarId], [SablonAnahtar], [SablonId], [Aciklama]) VALUES (-31996, N'shopCtg', -32319, N'Ürün kategorisine tıklanınca')
GO
INSERT [snlg_V1].[TblSablon_Modul] ([AnahtarId], [SablonAnahtar], [SablonId], [Aciklama]) VALUES (-31994, N'blogCtg', -32044, N'Makale kategorisine tıklanınca')
GO
INSERT [snlg_V1].[TblSablon_Modul] ([AnahtarId], [SablonAnahtar], [SablonId], [Aciklama]) VALUES (-31991, N'announce', -32272, N'Duyuruya tıklanınca')
GO
INSERT [snlg_V1].[TblSablon_Modul] ([AnahtarId], [SablonAnahtar], [SablonId], [Aciklama]) VALUES (-31988, N'blogArshive', -32043, N'Makale arşivine tıklanınca')
GO
INSERT [snlg_V1].[TblSablon_Modul] ([AnahtarId], [SablonAnahtar], [SablonId], [Aciklama]) VALUES (-31987, N'project', -32259, N'Projeye tıklanınca')
GO
INSERT [snlg_V1].[TblSablon_Modul] ([AnahtarId], [SablonAnahtar], [SablonId], [Aciklama]) VALUES (-31986, N'projectCtg', -32258, N'Proje kategorisine tıklanınca')
GO
INSERT [snlg_V1].[TblSablon_Modul] ([AnahtarId], [SablonAnahtar], [SablonId], [Aciklama]) VALUES (-31967, N'editor', -32095, N'Yazara tıklanınca')
GO
INSERT [snlg_V1].[TblSablon_Modul] ([AnahtarId], [SablonAnahtar], [SablonId], [Aciklama]) VALUES (-31942, N'news', -32059, N'Habere tıklanınca')
GO
INSERT [snlg_V1].[TblSablon_Modul] ([AnahtarId], [SablonAnahtar], [SablonId], [Aciklama]) VALUES (-31939, N'blogTag', -32046, N'Makaledeki taglardan birine tıklanınca')
GO
SET IDENTITY_INSERT [snlg_V1].[TblSablon_Modul] OFF
GO
SET IDENTITY_INSERT [snlg_V1].[TblRoller] ON 

GO
INSERT [snlg_V1].[TblRoller] ([RolId], [RolAd]) VALUES (4, N'Makale Yazarı')
GO
INSERT [snlg_V1].[TblRoller] ([RolId], [RolAd]) VALUES (7, N'Ürün Sorumlusu')
GO
INSERT [snlg_V1].[TblRoller] ([RolId], [RolAd]) VALUES (11, N'demo')
GO
INSERT [snlg_V1].[TblRoller] ([RolId], [RolAd]) VALUES (16, N'admin')
GO
SET IDENTITY_INSERT [snlg_V1].[TblRoller] OFF
GO
INSERT [snlg_V1].[TblUyeDetay] ([UyeId], [Firma], [UyeAd], [DTarih], [EvTel], [IsTel], [CepTel], [Faks], [Adres], [VDaire], [VNo], [TCNo], [Resim]) VALUES (1, NULL, N'demo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'/uploads/user/341295645.jpg')
GO
INSERT [snlg_V1].[TblIller] ([IlKod], [Il]) VALUES (1, N'Adana')
GO
INSERT [snlg_V1].[TblIller] ([IlKod], [Il]) VALUES (2, N'Adıyaman')
GO
INSERT [snlg_V1].[TblIller] ([IlKod], [Il]) VALUES (3, N'Afyonkarahisar')
GO
INSERT [snlg_V1].[TblIller] ([IlKod], [Il]) VALUES (4, N'Ağrı')
GO
INSERT [snlg_V1].[TblIller] ([IlKod], [Il]) VALUES (5, N'Amasya')
GO
INSERT [snlg_V1].[TblIller] ([IlKod], [Il]) VALUES (6, N'Ankara')
GO
INSERT [snlg_V1].[TblIller] ([IlKod], [Il]) VALUES (7, N'Antalya')
GO
INSERT [snlg_V1].[TblIller] ([IlKod], [Il]) VALUES (8, N'Artvin')
GO
INSERT [snlg_V1].[TblIller] ([IlKod], [Il]) VALUES (9, N'Aydın')
GO
INSERT [snlg_V1].[TblIller] ([IlKod], [Il]) VALUES (10, N'Balıkesir')
GO
INSERT [snlg_V1].[TblIller] ([IlKod], [Il]) VALUES (11, N'Bilecik')
GO
INSERT [snlg_V1].[TblIller] ([IlKod], [Il]) VALUES (12, N'Bingöl')
GO
INSERT [snlg_V1].[TblIller] ([IlKod], [Il]) VALUES (13, N'Bitlis')
GO
INSERT [snlg_V1].[TblIller] ([IlKod], [Il]) VALUES (14, N'Bolu')
GO
INSERT [snlg_V1].[TblIller] ([IlKod], [Il]) VALUES (15, N'Burdur')
GO
INSERT [snlg_V1].[TblIller] ([IlKod], [Il]) VALUES (16, N'Bursa')
GO
INSERT [snlg_V1].[TblIller] ([IlKod], [Il]) VALUES (17, N'Çanakkale')
GO
INSERT [snlg_V1].[TblIller] ([IlKod], [Il]) VALUES (18, N'Çankırı')
GO
INSERT [snlg_V1].[TblIller] ([IlKod], [Il]) VALUES (19, N'Çorum')
GO
INSERT [snlg_V1].[TblIller] ([IlKod], [Il]) VALUES (20, N'Denizli')
GO
INSERT [snlg_V1].[TblIller] ([IlKod], [Il]) VALUES (21, N'Diyarbakır')
GO
INSERT [snlg_V1].[TblIller] ([IlKod], [Il]) VALUES (22, N'Edirne')
GO
INSERT [snlg_V1].[TblIller] ([IlKod], [Il]) VALUES (23, N'Elazığ')
GO
INSERT [snlg_V1].[TblIller] ([IlKod], [Il]) VALUES (24, N'Erzincan')
GO
INSERT [snlg_V1].[TblIller] ([IlKod], [Il]) VALUES (25, N'Erzurum')
GO
INSERT [snlg_V1].[TblIller] ([IlKod], [Il]) VALUES (26, N'Eskişehir')
GO
INSERT [snlg_V1].[TblIller] ([IlKod], [Il]) VALUES (27, N'Gaziantep')
GO
INSERT [snlg_V1].[TblIller] ([IlKod], [Il]) VALUES (28, N'Giresun')
GO
INSERT [snlg_V1].[TblIller] ([IlKod], [Il]) VALUES (29, N'Gümüşhane')
GO
INSERT [snlg_V1].[TblIller] ([IlKod], [Il]) VALUES (30, N'Hakkari')
GO
INSERT [snlg_V1].[TblIller] ([IlKod], [Il]) VALUES (31, N'Hatay')
GO
INSERT [snlg_V1].[TblIller] ([IlKod], [Il]) VALUES (32, N'Isparta')
GO
INSERT [snlg_V1].[TblIller] ([IlKod], [Il]) VALUES (33, N'Mersin(İçel)')
GO
INSERT [snlg_V1].[TblIller] ([IlKod], [Il]) VALUES (34, N'İstanbul')
GO
INSERT [snlg_V1].[TblIller] ([IlKod], [Il]) VALUES (35, N'İzmir')
GO
INSERT [snlg_V1].[TblIller] ([IlKod], [Il]) VALUES (36, N'Kars')
GO
INSERT [snlg_V1].[TblIller] ([IlKod], [Il]) VALUES (37, N'Kastamonu')
GO
INSERT [snlg_V1].[TblIller] ([IlKod], [Il]) VALUES (38, N'Kayseri')
GO
INSERT [snlg_V1].[TblIller] ([IlKod], [Il]) VALUES (39, N'Kırklareli')
GO
INSERT [snlg_V1].[TblIller] ([IlKod], [Il]) VALUES (40, N'Kırşehir')
GO
INSERT [snlg_V1].[TblIller] ([IlKod], [Il]) VALUES (41, N'Kocaeli')
GO
INSERT [snlg_V1].[TblIller] ([IlKod], [Il]) VALUES (42, N'Kahramanmaraş')
GO
INSERT [snlg_V1].[TblIller] ([IlKod], [Il]) VALUES (43, N'Konya')
GO
INSERT [snlg_V1].[TblIller] ([IlKod], [Il]) VALUES (44, N'Kütahya')
GO
INSERT [snlg_V1].[TblIller] ([IlKod], [Il]) VALUES (45, N'Malatya')
GO
INSERT [snlg_V1].[TblIller] ([IlKod], [Il]) VALUES (46, N'Manisa')
GO
INSERT [snlg_V1].[TblIller] ([IlKod], [Il]) VALUES (47, N'Mardin')
GO
INSERT [snlg_V1].[TblIller] ([IlKod], [Il]) VALUES (48, N'Muğla')
GO
INSERT [snlg_V1].[TblIller] ([IlKod], [Il]) VALUES (49, N'Muş')
GO
INSERT [snlg_V1].[TblIller] ([IlKod], [Il]) VALUES (50, N'Nevşehir')
GO
INSERT [snlg_V1].[TblIller] ([IlKod], [Il]) VALUES (51, N'Niğde')
GO
INSERT [snlg_V1].[TblIller] ([IlKod], [Il]) VALUES (52, N'Ordu')
GO
INSERT [snlg_V1].[TblIller] ([IlKod], [Il]) VALUES (53, N'Rize')
GO
INSERT [snlg_V1].[TblIller] ([IlKod], [Il]) VALUES (54, N'Sakarya')
GO
INSERT [snlg_V1].[TblIller] ([IlKod], [Il]) VALUES (55, N'Samsun')
GO
INSERT [snlg_V1].[TblIller] ([IlKod], [Il]) VALUES (56, N'Siirt')
GO
INSERT [snlg_V1].[TblIller] ([IlKod], [Il]) VALUES (57, N'Sinop')
GO
INSERT [snlg_V1].[TblIller] ([IlKod], [Il]) VALUES (58, N'Sivas')
GO
INSERT [snlg_V1].[TblIller] ([IlKod], [Il]) VALUES (59, N'Tekirdağ')
GO
INSERT [snlg_V1].[TblIller] ([IlKod], [Il]) VALUES (60, N'Tokat')
GO
INSERT [snlg_V1].[TblIller] ([IlKod], [Il]) VALUES (61, N'Trabzon')
GO
INSERT [snlg_V1].[TblIller] ([IlKod], [Il]) VALUES (62, N'Tunceli')
GO
INSERT [snlg_V1].[TblIller] ([IlKod], [Il]) VALUES (63, N'Şanlıurfa')
GO
INSERT [snlg_V1].[TblIller] ([IlKod], [Il]) VALUES (64, N'Uşak')
GO
INSERT [snlg_V1].[TblIller] ([IlKod], [Il]) VALUES (65, N'Van')
GO
INSERT [snlg_V1].[TblIller] ([IlKod], [Il]) VALUES (66, N'Yozgat')
GO
INSERT [snlg_V1].[TblIller] ([IlKod], [Il]) VALUES (67, N'Zonguldak')
GO
INSERT [snlg_V1].[TblIller] ([IlKod], [Il]) VALUES (68, N'Aksaray')
GO
INSERT [snlg_V1].[TblIller] ([IlKod], [Il]) VALUES (69, N'Bayburt')
GO
INSERT [snlg_V1].[TblIller] ([IlKod], [Il]) VALUES (70, N'Karaman')
GO
INSERT [snlg_V1].[TblIller] ([IlKod], [Il]) VALUES (71, N'Kırıkkale')
GO
INSERT [snlg_V1].[TblIller] ([IlKod], [Il]) VALUES (72, N'Batman')
GO
INSERT [snlg_V1].[TblIller] ([IlKod], [Il]) VALUES (73, N'Şırnak')
GO
INSERT [snlg_V1].[TblIller] ([IlKod], [Il]) VALUES (74, N'Bartın')
GO
INSERT [snlg_V1].[TblIller] ([IlKod], [Il]) VALUES (75, N'Ardahan')
GO
INSERT [snlg_V1].[TblIller] ([IlKod], [Il]) VALUES (76, N'Iğdır')
GO
INSERT [snlg_V1].[TblIller] ([IlKod], [Il]) VALUES (77, N'Yalova')
GO
INSERT [snlg_V1].[TblIller] ([IlKod], [Il]) VALUES (78, N'Karabük')
GO
INSERT [snlg_V1].[TblIller] ([IlKod], [Il]) VALUES (79, N'Kilis')
GO
INSERT [snlg_V1].[TblIller] ([IlKod], [Il]) VALUES (80, N'Osmaniye')
GO
INSERT [snlg_V1].[TblIller] ([IlKod], [Il]) VALUES (81, N'Düzce')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (1, 1, N'Çukurova')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (2, 1, N'Girne')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (3, 2, N'Gölbaşı')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (4, 2, N'Tut')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (5, 3, N'Bayat')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (6, 3, N'Çobanlar')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (7, 3, N'Şuhut')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (8, 4, N'Eleşkirt')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (9, 4, N'Hamur')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (10, 4, N'Patnos')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (11, 5, N'Gümüşhacıköy')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (12, 5, N'Merzifon')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (13, 6, N'Evren')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (14, 6, N'Güdül')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (15, 6, N'Kazan')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (16, 6, N'Pursaklar')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (17, 7, N'Aksu')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (18, 7, N'Demre(Kale)')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (19, 7, N'Gazipaşa')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (20, 7, N'Kaş')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (21, 7, N'Konyaaltı')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (22, 7, N'Muratpaşa')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (23, 8, N'Arhavi')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (24, 8, N'Borçka')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (25, 8, N'Hopa')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (26, 9, N'Buharkent(Çubukdağı)')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (27, 9, N'Çine')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (28, 9, N'İncirliova')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (29, 9, N'Karacasu')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (30, 9, N'Karpuzlu')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (31, 9, N'Köşk')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (32, 9, N'Nazilli')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (33, 9, N'Sultanhisar')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (34, 10, N'Ayvalık')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (35, 10, N'Balya')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (36, 10, N'Burhaniye')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (37, 10, N'Edremit')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (38, 10, N'Merkez')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (39, 10, N'Sındırgı')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (40, 11, N'Gölpazarı')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (41, 11, N'Merkez')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (42, 12, N'Adaklı')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (43, 12, N'Merkez')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (44, 12, N'Yedisu')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (45, 13, N'Adilcevaz')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (46, 13, N'Merkez')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (47, 14, N'Dörtdivan')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (48, 14, N'Merkez')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (49, 15, N'Altınyayla(Dirmil)')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (50, 16, N'Büyükorhan')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (51, 16, N'Gemlik')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (52, 16, N'Mustafakemalpaşa')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (53, 16, N'Nilüfer')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (54, 17, N'Bayramiç')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (55, 17, N'Eceabat')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (56, 17, N'Yenice')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (57, 18, N'Atkaracalar')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (58, 18, N'Bayramören')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (59, 18, N'Çerkeş')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (60, 18, N'Yapraklı')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (61, 19, N'Bayat')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (62, 19, N'İskilip')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (63, 19, N'Osmancık')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (64, 19, N'Uğurludağ')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (65, 20, N'Baklan')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (66, 20, N'Çal')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (67, 20, N'Güney')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (68, 20, N'Tavas')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (69, 21, N'Çınar')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (70, 21, N'Çüngüş')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (71, 21, N'Dicle')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (72, 21, N'Lice')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (73, 21, N'Sur')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (74, 21, N'Yenişehir')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (75, 22, N'Keşan')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (76, 22, N'Süloğlu(Süleoğlu)')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (77, 23, N'Alacakaya')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (78, 23, N'Kovancılar')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (79, 24, N'Kemaliye')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (80, 25, N'Karaçoban')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (81, 25, N'Narman')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (82, 25, N'Oltu')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (83, 25, N'Olur')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (84, 25, N'Tekman')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (85, 25, N'Tortum')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (86, 25, N'Uzundere')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (87, 26, N'Çifteler')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (88, 26, N'Han')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (89, 26, N'Mihalgazi')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (90, 26, N'Mihalıççık')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (91, 26, N'Tepebaşı')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (92, 27, N'İslahiye')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (93, 27, N'Yavuzeli')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (94, 28, N'Alucra')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (95, 28, N'Bulancak')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (96, 28, N'Çanakçı')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (97, 28, N'Merkez')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (98, 28, N'Yağlıdere')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (99, 29, N'Merkez')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (100, 29, N'Torul')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (101, 30, N'Çukurca')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (102, 30, N'Merkez')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (103, 32, N'Atabey')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (104, 32, N'Sütçüler')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (105, 32, N'Uluborlu')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (106, 33, N'Akdeniz')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (107, 33, N'Aydıncık')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (108, 33, N'Bozyazı')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (109, 34, N'Adalar')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (110, 34, N'Avcılar')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (111, 34, N'Beykoz')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (112, 34, N'Çatalca')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (113, 34, N'Esenler')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (114, 34, N'Eyüp')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (115, 34, N'Fatih')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (116, 34, N'Gaziosmanpaşa')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (117, 34, N'Kağıthane')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (118, 34, N'Kartal')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (119, 34, N'Pendik')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (120, 34, N'Sarıyer')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (121, 34, N'Sultangazi')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (122, 34, N'Tuzla')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (123, 34, N'Zeytinburnu')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (124, 35, N'Balçova')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (125, 35, N'Bayındır')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (126, 35, N'Çiğli')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (127, 35, N'Güzelbahçe')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (128, 35, N'Karabağlar')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (129, 35, N'Karaburun')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (130, 35, N'Kemalpaşa')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (131, 35, N'Konak')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (132, 35, N'Ödemiş')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (133, 35, N'Tire')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (134, 36, N'Arpaçay')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (135, 37, N'Azdavay')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (136, 37, N'Hanönü(Gökçeağaç)')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (137, 37, N'İnebolu')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (138, 38, N'Hacılar')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (139, 39, N'Demirköy')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (140, 39, N'Kofçaz')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (141, 39, N'Pehlivanköy')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (142, 39, N'Vize')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (143, 40, N'Akpınar')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (144, 40, N'Boztepe')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (145, 41, N'Dilovası')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (146, 41, N'Körfez(Tütünçiftlik)')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (147, 42, N'Çağlıyancerit')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (148, 42, N'Nurhak')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (149, 43, N'Akören')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (150, 43, N'Çumra')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (151, 43, N'Derbent')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (152, 43, N'Doğanhisar')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (153, 43, N'Emirgazi')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (154, 43, N'Ereğli')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (155, 43, N'Ilgın')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (156, 43, N'Sarayönü')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (157, 44, N'Çavdarhisar')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (158, 44, N'Merkez')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (159, 44, N'Tavşanlı')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (160, 45, N'Akçadağ')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (161, 45, N'Doğanşehir')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (162, 45, N'Kuluncak')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (163, 45, N'Merkez')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (164, 46, N'Gölmarmara')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (165, 46, N'Gördes')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (166, 46, N'Kula')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (167, 46, N'Merkez')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (168, 46, N'Sarıgöl')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (169, 46, N'Selendi')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (170, 46, N'Soma')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (171, 47, N'Dargeçit')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (172, 47, N'Derik')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (173, 47, N'Merkez')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (174, 48, N'Köyceğiz')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (175, 48, N'Milas')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (176, 49, N'Hasköy')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (177, 49, N'Malazgirt')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (178, 50, N'Avanos')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (179, 50, N'Kozaklı')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (180, 51, N'Çamardı')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (181, 51, N'Ulukışla')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (182, 52, N'Akkuş')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (183, 52, N'Çatalpınar')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (184, 52, N'Çaybaşı')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (185, 52, N'Gülyalı')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (186, 53, N'Derepazarı')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (187, 54, N'Arifiye')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (188, 54, N'Hendek')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (189, 54, N'Karasu')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (190, 54, N'Kaynarca')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (191, 54, N'Sapanca')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (192, 54, N'Serdivan')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (193, 55, N'Canik')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (194, 55, N'Çarşamba')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (195, 55, N'Terme')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (196, 55, N'Vezirköprü')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (197, 56, N'Aydınlar')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (198, 56, N'Baykan')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (199, 57, N'Ayancık')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (200, 57, N'Boyabat')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (201, 57, N'Durağan')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (202, 58, N'Gürün')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (203, 58, N'Kangal')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (204, 58, N'Koyulhisar')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (205, 59, N'Çorlu')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (206, 60, N'Almus')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (207, 60, N'Merkez')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (208, 60, N'Pazar')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (209, 60, N'Reşadiye')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (210, 61, N'Beşikdüzü')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (211, 61, N'Düzköy')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (212, 61, N'Merkez')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (213, 61, N'Tonya')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (214, 62, N'Hozat')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (215, 62, N'Mazgirt')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (216, 62, N'Merkez')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (217, 62, N'Pülümür')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (218, 63, N'Halfeti')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (219, 63, N'Merkez')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (220, 63, N'Siverek')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (221, 64, N'Merkez')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (222, 65, N'Çatak')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (223, 65, N'Edremit(Gümüşdere)')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (224, 65, N'Erciş')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (225, 65, N'Gevaş')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (226, 65, N'Gürpınar')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (227, 65, N'Saray')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (228, 66, N'Akdağmadeni')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (229, 1, N'Karaisalı')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (230, 1, N'Karataş')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (231, 1, N'Seyhan')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (232, 1, N'Yumurtalık')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (233, 2, N'Besni')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (234, 2, N'Çelikhan')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (235, 2, N'Gerger')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (236, 2, N'Samsat')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (237, 3, N'Başmakçı')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (238, 3, N'Bolvadin')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (239, 3, N'Dazkırı')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (240, 3, N'Emirdağ')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (241, 3, N'Evciler')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (242, 3, N'İscehisar')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (243, 3, N'Kızılören')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (244, 3, N'Sandıklı')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (245, 4, N'Diyadin')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (246, 4, N'Tutak')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (247, 5, N'Hamamözü')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (248, 6, N'Çubuk')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (249, 6, N'Etimesgut')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (250, 6, N'Gölbaşı')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (251, 6, N'Haymana')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (252, 6, N'Mamak')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (253, 6, N'Polatlı')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (254, 7, N'Döşemealtı')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (255, 7, N'Finike')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (256, 7, N'Manavgat')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (257, 9, N'Kuşadası')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (258, 9, N'Merkez')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (259, 9, N'Söke')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (260, 9, N'Yenipazar')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (261, 10, N'Havran')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (262, 10, N'Kepsut')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (263, 10, N'Marmara')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (264, 10, N'Savaştepe')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (265, 12, N'Genç')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (266, 13, N'Güroymak')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (267, 14, N'Göynük')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (268, 14, N'Kıbrıscık')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (269, 14, N'Mengen')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (270, 15, N'Çavdır')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (271, 15, N'Kemer')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (272, 16, N'İnegöl')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (273, 16, N'Keles')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (274, 16, N'Mudanya')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (275, 16, N'Orhaneli')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (276, 16, N'Orhangazi')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (277, 16, N'Yenişehir')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (278, 16, N'Yıldırım')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (279, 17, N'Ayvacık')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (280, 17, N'Bozcaada')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (281, 17, N'Ezine')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (282, 17, N'Gelibolu')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (283, 17, N'Lapseki')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (284, 18, N'Eldivan')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (285, 18, N'Ilgaz')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (286, 18, N'Merkez')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (287, 19, N'Dodurga')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (288, 19, N'Kargı')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (289, 19, N'Mecitözü')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (290, 20, N'Babadağ')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (291, 20, N'Buldan')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (292, 20, N'Sarayköy')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (293, 20, N'Serinhisar')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (294, 21, N'Bismil')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (295, 21, N'Silvan')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (296, 22, N'Havsa')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (297, 23, N'Baskil')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (298, 23, N'Merkez')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (299, 23, N'Palu')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (300, 23, N'Sivrice')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (301, 24, N'Üzümlü')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (302, 25, N'Horasan')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (303, 25, N'İspir')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (304, 25, N'Pasinler')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (305, 25, N'Şenkaya')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (306, 26, N'Alpu')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (307, 26, N'Günyüzü')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (308, 26, N'Sarıcakaya')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (309, 27, N'Karkamış')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (310, 27, N'Nizip')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (311, 27, N'Oğuzeli')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (312, 27, N'Şahinbey')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (313, 28, N'Dereli')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (314, 28, N'Eynesil')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (315, 28, N'Güce')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (316, 28, N'Keşap')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (317, 29, N'Köse')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (318, 29, N'Kürtün')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (319, 31, N'İskenderun')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (320, 31, N'Kumlu')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (321, 32, N'Gönen')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (322, 32, N'Merkez')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (323, 33, N'Çamlıyayla')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (324, 33, N'Erdemli')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (325, 33, N'Mut')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (326, 33, N'Toroslar')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (327, 34, N'Arnavutköy')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (328, 34, N'Bağcılar')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (329, 34, N'Bayrampaşa')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (330, 34, N'Esenyurt')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (331, 34, N'Maltepe')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (332, 34, N'Silivri')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (333, 34, N'Şişli')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (334, 34, N'Üsküdar')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (335, 35, N'Bayraklı')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (336, 35, N'Dikili')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (337, 35, N'Seferihisar')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (338, 36, N'Kağızman')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (339, 36, N'Susuz')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (340, 37, N'Araç')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (341, 37, N'Bozkurt')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (342, 37, N'Cide')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (343, 37, N'Çatalzeytin')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (344, 37, N'Daday')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (345, 37, N'Devrekani')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (346, 37, N'Doğanyurt')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (347, 37, N'İhsangazi')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (348, 37, N'Küre')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (349, 37, N'Seydiler')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (350, 37, N'Taşköprü')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (351, 38, N'Akkışla')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (352, 38, N'Bünyan')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (353, 38, N'Tomarza')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (354, 38, N'Yahyalı')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (355, 39, N'Lüleburgaz')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (356, 40, N'Kaman')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (357, 41, N'Darıca')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (358, 41, N'Derince')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (359, 41, N'Gebze')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (360, 41, N'Karamürsel')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (361, 42, N'Andırın')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (362, 42, N'Ekinözü')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (363, 43, N'Bozkır')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (364, 43, N'Güneysınır')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (365, 43, N'Hadim')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (366, 43, N'Hüyük')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (367, 43, N'Seydişehir')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (368, 43, N'Yunak')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (369, 44, N'Domaniç')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (370, 45, N'Arapkir(Arapgir)')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (371, 45, N'Battalgazi')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (372, 45, N'Hekimhan')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (373, 45, N'Yeşilyurt')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (374, 46, N'Ahmetli')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (375, 46, N'Demirci')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (376, 46, N'Salihli')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (377, 47, N'Mazıdağı')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (378, 48, N'Dalaman')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (379, 48, N'Datça')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (380, 48, N'Kavaklıdere')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (381, 48, N'Marmaris')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (382, 48, N'Merkez')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (383, 48, N'Ortaca')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (384, 49, N'Bulanık')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (385, 49, N'Varto')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (386, 50, N'Derinkuyu')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (387, 50, N'Gülşehir')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (388, 50, N'Merkez')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (389, 51, N'Çiftlik(Özyurt)')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (390, 52, N'Aybastı')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (391, 52, N'Fatsa')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (392, 52, N'İkizce')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (393, 52, N'Kumru')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (394, 52, N'Ulubey')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (395, 53, N'Çamlıhemşin')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (396, 54, N'Akyazı')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (397, 54, N'Geyve')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (398, 54, N'Pamukova')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (399, 55, N'Asarcık')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (400, 55, N'Havza')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (401, 55, N'İlkadım')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (402, 55, N'Ondokuzmayıs(Ballıca)')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (403, 55, N'Salıpazarı')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (404, 57, N'Dikmen')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (405, 57, N'Erfelek')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (406, 57, N'Merkez')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (407, 57, N'Saraydüzü')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (408, 58, N'Gemerek')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (409, 58, N'Gölova')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (410, 58, N'Hafik')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (411, 58, N'Suşehri')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (412, 58, N'Şarkışla')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (413, 58, N'Yıldızeli')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (414, 59, N'Merkez')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (415, 59, N'Şarköy')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (416, 60, N'Artova')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (417, 60, N'Erbaa')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (418, 60, N'Niksar')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (419, 60, N'Sulusaray')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (420, 61, N'Çarşıbaşı')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (421, 61, N'Çaykara')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (422, 61, N'Sürmene')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (423, 61, N'Vakfıkebir')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (424, 62, N'Çemişgezek')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (425, 62, N'Ovacık')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (426, 65, N'Muradiye')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (427, 66, N'Kadışehri')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (428, 66, N'Merkez')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (429, 66, N'Şefaatli')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (430, 66, N'Yenifakılı')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (431, 67, N'Gökçebey')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (432, 68, N'Ağaçören')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (433, 68, N'Gülağaç')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (434, 68, N'Güzelyurt')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (435, 68, N'Merkez')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (436, 68, N'Ortaköy')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (437, 70, N'Ayrancı')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (438, 70, N'Başyayla')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (439, 70, N'Ermenek')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (440, 71, N'Delice')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (441, 71, N'Keskin')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (442, 72, N'Beşiri')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (443, 73, N'Cizre')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (444, 73, N'Merkez')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (445, 74, N'Amasra')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (446, 74, N'Kurucaşile')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (447, 75, N'Merkez')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (448, 77, N'Armutlu')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (449, 78, N'Ovacık')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (450, 78, N'Yenice')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (451, 81, N'Akçakoca')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (452, 81, N'Kaynaşlı')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (453, 81, N'Yığılca')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (454, 1, N'Aladağ(Karsantı)')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (455, 1, N'Ceyhan')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (456, 1, N'Feke')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (457, 1, N'İmamoğlu')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (458, 1, N'Kozan')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (459, 1, N'Tufanbeyli')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (460, 2, N'Kahta')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (461, 2, N'Merkez')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (462, 2, N'Sincik')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (463, 3, N'Çay')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (464, 3, N'Dinar')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (465, 3, N'Hocalar')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (466, 3, N'İhsaniye')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (467, 3, N'Merkez')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (468, 3, N'Sultandağı')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (469, 4, N'Merkez')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (470, 4, N'Taşlıçay')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (471, 5, N'Göynücek')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (472, 5, N'Merkez')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (473, 5, N'Suluova')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (474, 5, N'Taşova')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (475, 6, N'Akyurt')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (476, 6, N'Ayaş')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (477, 6, N'Çankaya')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (478, 6, N'Elmadağ')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (479, 6, N'Nallıhan')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (480, 6, N'Sincan')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (481, 7, N'Akseki')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (482, 7, N'Alanya')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (483, 7, N'İbradı(Aydınkent)')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (484, 7, N'Kepez')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (485, 7, N'Korkuteli')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (486, 7, N'Kumluca')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (487, 7, N'Serik')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (488, 8, N'Murgul(Göktaş)')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (489, 8, N'Yusufeli')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (490, 9, N'Bozdoğan')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (491, 9, N'Germencik')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (492, 9, N'Kuyucak')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (493, 10, N'Bandırma')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (494, 10, N'Bigadiç')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (495, 10, N'Gömeç')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (496, 11, N'Bozüyük')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (497, 11, N'İnhisar')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (498, 11, N'Pazaryeri')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (499, 11, N'Söğüt')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (500, 11, N'Yenipazar')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (501, 12, N'Yayladere')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (502, 13, N'Hizan')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (503, 13, N'Mutki')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (504, 14, N'Mudurnu')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (505, 15, N'Ağlasun')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (506, 15, N'Bucak')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (507, 15, N'Çeltikçi')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (508, 15, N'Yeşilova')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (509, 16, N'İznik')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (510, 16, N'Karacabey')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (511, 16, N'Osmangazi')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (512, 17, N'Biga')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (513, 18, N'Kızılırmak')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (514, 18, N'Şabanözü')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (515, 19, N'Alaca')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (516, 19, N'Laçin')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (517, 19, N'Merkez')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (518, 19, N'Oğuzlar(Karaören)')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (519, 19, N'Sungurlu')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (520, 20, N'Acıpayam')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (521, 20, N'Beyağaç')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (522, 20, N'Çardak')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (523, 20, N'Honaz')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (524, 20, N'Merkez')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (525, 21, N'Çermik')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (526, 21, N'Eğil')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (527, 21, N'Ergani')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (528, 21, N'Hazro')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (529, 21, N'Kayapınar')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (530, 21, N'Kulp')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (531, 22, N'İpsala')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (532, 22, N'Meriç')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (533, 22, N'Merkez')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (534, 22, N'Uzunköprü')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (535, 24, N'Çayırlı')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (536, 24, N'Kemah')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (537, 24, N'Tercan')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (538, 25, N'Aşkale')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (539, 25, N'Aziziye(Ilıca)')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (540, 25, N'Çat')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (541, 25, N'Karayazı')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (542, 25, N'Köprüköy')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (543, 25, N'Palandöken')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (544, 25, N'Yakutiye')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (545, 26, N'Beylikova')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (546, 26, N'İnönü')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (547, 26, N'Mahmudiye')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (548, 27, N'Nurdağı')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (549, 28, N'Doğankent')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (550, 28, N'Görele')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (551, 30, N'Yüksekova')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (552, 31, N'Dörtyol')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (553, 31, N'Hassa')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (554, 31, N'Reyhanlı')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (555, 31, N'Samandağ')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (556, 31, N'Yayladağı')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (557, 32, N'Aksu')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (558, 32, N'Eğirdir(Eğridir)')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (559, 32, N'Gelendost')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (560, 32, N'Keçiborlu')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (561, 32, N'Senirkent')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (562, 32, N'Şarkikaraağaç')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (563, 32, N'Yalvaç')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (564, 33, N'Anamur')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (565, 33, N'Gülnar (Gülpınar)')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (566, 33, N'Silifke')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (567, 34, N'Bakırköy')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (568, 34, N'Başakşehir')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (569, 34, N'Beşiktaş')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (570, 34, N'Beylikdüzü')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (571, 34, N'Büyükçekmece')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (572, 34, N'Kadıköy')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (573, 34, N'Sancaktepe')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (574, 34, N'Sultanbeyli')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (575, 35, N'Aliağa')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (576, 35, N'Beydağ')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (577, 35, N'Buca')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (578, 35, N'Çeşme')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (579, 35, N'Foça')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (580, 35, N'Gaziemir')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (581, 35, N'Kınık')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (582, 35, N'Kiraz')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (583, 35, N'Torbalı')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (584, 35, N'Urla')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (585, 36, N'Merkez')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (586, 37, N'Abana')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (587, 37, N'Ağlı')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (588, 37, N'Merkez')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (589, 37, N'Pınarbaşı')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (590, 37, N'Tosya')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (591, 38, N'Felahiye')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (592, 38, N'İncesu')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (593, 38, N'Kocasinan')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (594, 38, N'Pınarbaşı')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (595, 38, N'Sarız')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (596, 38, N'Talas')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (597, 39, N'Babaeski')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (598, 39, N'Merkez')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (599, 40, N'Mucur')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (600, 42, N'Afşin')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (601, 42, N'Elbistan')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (602, 42, N'Pazarcık')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (603, 43, N'Akşehir')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (604, 43, N'Altınekin')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (605, 43, N'Cihanbeyli')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (606, 43, N'Çeltik')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (607, 43, N'Derebucak')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (608, 43, N'Kadınhanı')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (609, 43, N'Karapınar')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (610, 43, N'Kulu')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (611, 43, N'Selçuklu')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (612, 43, N'Yalıhüyük')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (613, 44, N'Dumlupınar')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (614, 44, N'Emet')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (615, 44, N'Gediz')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (616, 44, N'Hisarcık')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (617, 44, N'Pazarlar')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (618, 44, N'Şaphane')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (619, 45, N'Darende')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (620, 45, N'Pütürge(Pötürge)')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (621, 45, N'Yazıhan')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (622, 46, N'Köprübaşı')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (623, 46, N'Saruhanlı')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (624, 47, N'Kızıltepe')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (625, 48, N'Bodrum')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (626, 50, N'Acıgöl')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (627, 51, N'Altunhisar')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (628, 52, N'Gölköy')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (629, 52, N'Gürgentepe')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (630, 52, N'Kabadüz(Karadüz)')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (631, 52, N'Korgan')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (632, 52, N'Merkez')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (633, 52, N'Mesudiye')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (634, 52, N'Ünye')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (635, 53, N'Ardeşen')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (636, 53, N'Çayeli')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (637, 53, N'Fındıklı')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (638, 53, N'Hemşin')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (639, 53, N'İyidere')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (640, 53, N'Kalkandere')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (641, 53, N'Merkez')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (642, 54, N'Karapürçek')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (643, 54, N'Söğütlü')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (644, 55, N'Ayvacık')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (645, 55, N'Kavak')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (646, 55, N'Ladik')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (647, 55, N'Tekkeköy')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (648, 55, N'Yakakent')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (649, 56, N'Pervari')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (650, 56, N'Şirvan')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (651, 57, N'Türkeli')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (652, 58, N'Akıncılar')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (653, 58, N'Altınyayla')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (654, 58, N'Divriği')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (655, 58, N'Doğanşar')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (656, 58, N'İmranlı')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (657, 58, N'Ulaş')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (658, 59, N'Çerkezköy')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (659, 59, N'Marmaraereğlisi')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (660, 60, N'Zile')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (661, 61, N'Akçaabat')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (662, 61, N'Arsin')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (663, 61, N'Dernekpazarı')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (664, 61, N'Köprübaşı')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (665, 61, N'Maçka')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (666, 61, N'Of')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (667, 61, N'Şalpazarı')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (668, 61, N'Yomra')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (669, 63, N'Akçakale')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (670, 63, N'Bozova')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (671, 63, N'Ceylanpınar')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (672, 63, N'Harran')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (673, 63, N'Suruç')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (674, 64, N'Eşme')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (675, 64, N'Karahallı')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (676, 64, N'Ulubey')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (677, 65, N'Başkale')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (678, 65, N'Çaldıran')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (679, 65, N'Özalp')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (680, 66, N'Boğazlıyan')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (681, 66, N'Aydıncık')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (682, 66, N'Sorgun')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (683, 67, N'Devrek')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (684, 67, N'Karadenizereğli')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (685, 70, N'Sarıveliler')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (686, 71, N'Balışeyh')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (687, 71, N'Yahşihan')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (688, 72, N'Kozluk')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (689, 73, N'Beytüşşebap')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (690, 73, N'İdil')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (691, 75, N'Çıldır')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (692, 76, N'Aralık')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (693, 76, N'Tuzluca')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (694, 77, N'Çınarcık')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (695, 77, N'Merkez')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (696, 78, N'Eflani')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (697, 78, N'Eskipazar')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (698, 78, N'Merkez')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (699, 78, N'Safranbolu')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (700, 79, N'Merkez')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (701, 80, N'Merkez')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (702, 80, N'Toprakkale')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (703, 81, N'Cumayeri')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (704, 66, N'Çandır')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (705, 66, N'Çayıralan')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (706, 66, N'Çekerek')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (707, 67, N'Çaycuma')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (708, 68, N'Eskil')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (709, 69, N'Merkez')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (710, 70, N'Merkez')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (711, 71, N'Bahşili')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (712, 71, N'Çelebi')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (713, 71, N'Karakeçili')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (714, 71, N'Merkez')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (715, 72, N'Gercüş')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (716, 72, N'Merkez')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (717, 73, N'Uludere')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (718, 74, N'Ulus')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (719, 75, N'Damal')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (720, 75, N'Hanak')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (721, 75, N'Posof')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (722, 76, N'Karakoyunlu')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (723, 77, N'Altınova')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (724, 77, N'Çiftlikköy')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (725, 80, N'Kadirli')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (726, 81, N'Gölyaka')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (727, 1, N'Gazimagosa')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (728, 1, N'Güzelyurt')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (729, 1, N'Pozantı')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (730, 1, N'Saimbeyli')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (731, 1, N'Sarıçam')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (732, 1, N'Yüreğir')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (733, 3, N'Sincanlı(Sinanpaşa)')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (734, 4, N'Doğubayazıt(Doğubeyazıt)')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (735, 6, N'Altındağ')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (736, 6, N'Bala')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (737, 6, N'Beypazarı')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (738, 6, N'Çamlıdere')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (739, 6, N'Kalecik')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (740, 6, N'Keçiören')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (741, 6, N'Kızılcahamam')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (742, 6, N'Şereflikoçhisar')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (743, 6, N'Yenimahalle')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (744, 7, N'Elmalı')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (745, 7, N'Gündoğmuş')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (746, 7, N'Kemer')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (747, 8, N'Ardanuç')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (748, 8, N'Merkez')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (749, 8, N'Şavşat')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (750, 9, N'Didim(Yenihisar)')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (751, 9, N'Koçarlı')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (752, 10, N'Dursunbey')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (753, 10, N'Erdek')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (754, 10, N'Gönen')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (755, 10, N'İvrindi')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (756, 10, N'Manyas')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (757, 10, N'Susurluk')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (758, 11, N'Osmaneli')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (759, 12, N'Karlıova')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (760, 12, N'Kiğı')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (761, 12, N'Solhan')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (762, 13, N'Ahlat')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (763, 13, N'Tatvan')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (764, 14, N'Gerede')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (765, 14, N'Seben')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (766, 14, N'Yeniçağa')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (767, 15, N'Gölhisar')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (768, 15, N'Karamanlı')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (769, 15, N'Merkez')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (770, 15, N'Tefenni')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (771, 16, N'Gürsu')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (772, 16, N'Harmancık')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (773, 16, N'Kestel')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (774, 17, N'Çan')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (775, 17, N'Gökçeada(İmroz)')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (776, 17, N'Merkez')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (777, 18, N'Korgun')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (778, 18, N'Kurşunlu')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (779, 18, N'Orta')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (780, 19, N'Boğazkale')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (781, 19, N'Ortaköy')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (782, 20, N'Akköy')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (783, 20, N'Bekilli')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (784, 20, N'Bozkurt')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (785, 20, N'Çameli')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (786, 20, N'Çivril')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (787, 20, N'Kale')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (788, 21, N'Bağlar')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (789, 21, N'Hani')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (790, 21, N'Kocaköy')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (791, 22, N'Enez')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (792, 22, N'Lalapaşa')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (793, 23, N'Ağın')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (794, 23, N'Arıcak')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (795, 23, N'Karakoçan')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (796, 23, N'Keban')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (797, 23, N'Maden')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (798, 24, N'Ilıç(İliç)')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (799, 24, N'Merkez')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (800, 24, N'Otlukbeli')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (801, 24, N'Refahiye')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (802, 25, N'Hınıs')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (803, 25, N'Pazaryolu')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (804, 26, N'Odunpazarı')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (805, 26, N'Seyitgazi')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (806, 26, N'Sivrihisar')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (807, 27, N'Araban')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (808, 27, N'Şehitkamil')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (809, 28, N'Çamoluk')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (810, 28, N'Espiye')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (811, 28, N'Piraziz')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (812, 28, N'Şebinkarahisar')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (813, 28, N'Tirebolu')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (814, 29, N'Kelkit')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (815, 29, N'Şiran')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (816, 30, N'Şemdinli')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (817, 31, N'Altınözü')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (818, 31, N'Antakya')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (819, 31, N'Belen')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (820, 31, N'Erzin')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (821, 31, N'Kırıkhan')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (822, 32, N'Yenişarbademli')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (823, 33, N'Mezitli')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (824, 33, N'Tarsus')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (825, 33, N'Yenişehir')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (826, 34, N'Ataşehir')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (827, 34, N'Bahçelievler')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (828, 34, N'Beyoğlu')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (829, 34, N'Çekmeköy')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (830, 34, N'Güngören')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (831, 34, N'Küçükçekmece')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (832, 34, N'Şile')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (833, 34, N'Ümraniye')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (834, 35, N'Bergama')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (835, 35, N'Bornova')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (836, 35, N'Karşıyaka')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (837, 35, N'Menderes(Cumaovası)')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (838, 35, N'Menemen')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (839, 35, N'Narlıdere')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (840, 35, N'Selçuk')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (841, 36, N'Akyaka')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (842, 36, N'Digor')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (843, 36, N'Sarıkamış')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (844, 36, N'Selim')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (845, 37, N'Şenpazar')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (846, 38, N'Develi')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (847, 38, N'Melikgazi')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (848, 38, N'Özvatan(Çukur)')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (849, 38, N'Sarıoğlan')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (850, 38, N'Yeşilhisar')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (851, 39, N'Pınarhisar')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (852, 40, N'Akçakent')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (853, 40, N'Çiçekdağı')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (854, 40, N'Merkez')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (855, 41, N'Başiskele')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (856, 41, N'Çayırova')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (857, 41, N'Gölcük')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (858, 41, N'İzmit')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (859, 41, N'Kandıra')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (860, 41, N'Kartepe')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (861, 42, N'Göksun')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (862, 42, N'Merkez')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (863, 42, N'Türkoğlu')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (864, 43, N'Ahırlı')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (865, 43, N'Beyşehir')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (866, 43, N'Halkapınar')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (867, 43, N'Karatay')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (868, 43, N'Meram')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (869, 43, N'Taşkent')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (870, 43, N'Tuzlukçu')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (871, 44, N'Altıntaş')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (872, 44, N'Aslanapa')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (873, 44, N'Simav')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (874, 45, N'Arguvan')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (875, 45, N'Doğanyol')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (876, 45, N'Kale')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (877, 46, N'Akhisar')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (878, 46, N'Alaşehir')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (879, 46, N'Kırkağaç')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (880, 46, N'Turgutlu')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (881, 47, N'Midyat(Estel)')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (882, 47, N'Nusaybin')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (883, 47, N'Ömerli')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (884, 47, N'Savur')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (885, 47, N'Yeşilli')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (886, 48, N'Fethiye')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (887, 48, N'Ula')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (888, 48, N'Yatağan')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (889, 49, N'Korkut')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (890, 49, N'Merkez')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (891, 50, N'Hacıbektaş')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (892, 50, N'Ürgüp')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (893, 51, N'Bor')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (894, 51, N'Merkez')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (895, 52, N'Çamaş')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (896, 52, N'Kabataş')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (897, 52, N'Perşembe')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (898, 53, N'Güneysu')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (899, 53, N'İkizdere')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (900, 53, N'Pazar')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (901, 54, N'Adapazarı')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (902, 54, N'Erenler')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (903, 54, N'Ferizli')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (904, 54, N'Kocaali')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (905, 54, N'Taraklı')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (906, 55, N'Alaçam')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (907, 55, N'Atakum')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (908, 55, N'Bafra')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (909, 56, N'Eruh')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (910, 56, N'Kurtalan')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (911, 56, N'Merkez')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (912, 57, N'Gerze')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (913, 58, N'Merkez')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (914, 58, N'Zara')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (915, 59, N'Hayrabolu')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (916, 59, N'Malkara')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (917, 59, N'Muratlı')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (918, 59, N'Saray')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (919, 60, N'Başçiftlik')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (920, 60, N'Turhal')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (921, 60, N'Yeşilyurt')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (922, 61, N'Araklı')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (923, 61, N'Hayrat')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (924, 62, N'Nazımiye')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (925, 62, N'Pertek')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (926, 63, N'Birecik')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (927, 63, N'Hilvan')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (928, 63, N'Viranşehir')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (929, 64, N'Banaz')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (930, 64, N'Sivaslı')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (931, 65, N'Bahçesaray')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (932, 65, N'Merkez')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (933, 66, N'Saraykent')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (934, 66, N'Sarıkaya')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (935, 66, N'Yerköy')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (936, 67, N'Alaplı')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (937, 67, N'Merkez')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (938, 68, N'Sarıyahşi')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (939, 69, N'Aydıntepe')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (940, 69, N'Demirözü')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (941, 70, N'Kazımkarabekir')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (942, 71, N'Sulakyurt')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (943, 72, N'Hasankeyf')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (944, 72, N'Sason')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (945, 73, N'Güçlükonak')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (946, 73, N'Silopi')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (947, 74, N'Merkez')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (948, 75, N'Göle')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (949, 76, N'Merkez')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (950, 77, N'Termal')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (951, 79, N'Elbeyli')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (952, 79, N'Musabeyli')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (953, 79, N'Polateli')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (954, 80, N'Bahçe')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (955, 80, N'Düziçi')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (956, 80, N'Hasanbeyli')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (957, 80, N'Sumbas')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (958, 81, N'Çilimli')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (959, 81, N'Gümüşova')
GO
INSERT [snlg_V1].[TblIlceler] ([IlceKod], [IlKod], [Ilce]) VALUES (960, 81, N'Merkez')
GO
SET IDENTITY_INSERT [snlg_V1].[TblBlockAttributeKeys] ON 

GO
INSERT [snlg_V1].[TblBlockAttributeKeys] ([AttributeID], [BlockID], [AttributeKey], [DefaultValue], [ValueList]) VALUES (9, 1, N'MenuType', N'Top', N'Top,Left,Right,Footer')
GO
INSERT [snlg_V1].[TblBlockAttributeKeys] ([AttributeID], [BlockID], [AttributeKey], [DefaultValue], [ValueList]) VALUES (10, 3, N'aa', N'5', N'3')
GO
INSERT [snlg_V1].[TblBlockAttributeKeys] ([AttributeID], [BlockID], [AttributeKey], [DefaultValue], [ValueList]) VALUES (12, 38, N'page-title', N'Anasayfa', N'Anasayfa,Biz Kimiz,Bize Ulaşın,Blog,Degerlerimiz,Duyurular,Ekibimiz,Etkinlikler,Foto Galeri,Haberler,Projeler,Referanslar,Sıkça Sorulan Sorular,şifremi unuttum,Ürünler,Üye Girişi,Üye Ol,Üye Profil,Yazarlar,Ziyaretçi Defteri')
GO
INSERT [snlg_V1].[TblBlockAttributeKeys] ([AttributeID], [BlockID], [AttributeKey], [DefaultValue], [ValueList]) VALUES (13, 36, N'breadcrumbs', N'Anasayfa', N'Anasayfa,Biz Kimiz,Bize Ulaşın,Blog,Degerlerimiz,Duyurular,Ekibimiz,Etkinlikler,Foto Galeri,Haberler,Projeler,Referanslar,Sıkça Sorulan Sorular,şifremi unuttum,Ürünler,Üye Girişi,Üye Ol,Üye Profil,Yazarlar,Ziyaretçi Defteri')
GO
INSERT [snlg_V1].[TblBlockAttributeKeys] ([AttributeID], [BlockID], [AttributeKey], [DefaultValue], [ValueList]) VALUES (17, 41, N'MenuType', N'Left', N'Top,Left,Right,Footer')
GO
INSERT [snlg_V1].[TblBlockAttributeKeys] ([AttributeID], [BlockID], [AttributeKey], [DefaultValue], [ValueList]) VALUES (18, 2, N'MenuType', N'Footer', N'Top,Left,Right,Footer')
GO
SET IDENTITY_INSERT [snlg_V1].[TblBlockAttributeKeys] OFF
GO
INSERT [snlg_V1].[TblBlockAttributeValues] ([AttributeID], [BlockPlaceID], [AttributeValue]) VALUES (12, 6830, N'Haberler')
GO
INSERT [snlg_V1].[TblBlockAttributeValues] ([AttributeID], [BlockPlaceID], [AttributeValue]) VALUES (12, 5929, N'Ürünler')
GO
INSERT [snlg_V1].[TblBlockAttributeValues] ([AttributeID], [BlockPlaceID], [AttributeValue]) VALUES (11, 5113, N'default')
GO
INSERT [snlg_V1].[TblBlockAttributeValues] ([AttributeID], [BlockPlaceID], [AttributeValue]) VALUES (13, 5930, N'Ürünler')
GO
INSERT [snlg_V1].[TblBlockAttributeValues] ([AttributeID], [BlockPlaceID], [AttributeValue]) VALUES (12, 6839, N'Duyurular')
GO
INSERT [snlg_V1].[TblBlockAttributeValues] ([AttributeID], [BlockPlaceID], [AttributeValue]) VALUES (12, 6869, N'Ürünler')
GO
INSERT [snlg_V1].[TblBlockAttributeValues] ([AttributeID], [BlockPlaceID], [AttributeValue]) VALUES (13, 6871, N'Ürünler')
GO
INSERT [snlg_V1].[TblBlockAttributeValues] ([AttributeID], [BlockPlaceID], [AttributeValue]) VALUES (12, 6848, N'Yazarlar')
GO
INSERT [snlg_V1].[TblBlockAttributeValues] ([AttributeID], [BlockPlaceID], [AttributeValue]) VALUES (12, 6296, N'Blog')
GO
INSERT [snlg_V1].[TblBlockAttributeValues] ([AttributeID], [BlockPlaceID], [AttributeValue]) VALUES (13, 6297, N'Blog')
GO
INSERT [snlg_V1].[TblBlockAttributeValues] ([AttributeID], [BlockPlaceID], [AttributeValue]) VALUES (13, 6849, N'Yazarlar')
GO
INSERT [snlg_V1].[TblBlockAttributeValues] ([AttributeID], [BlockPlaceID], [AttributeValue]) VALUES (12, 5584, N'Ürünler')
GO
INSERT [snlg_V1].[TblBlockAttributeValues] ([AttributeID], [BlockPlaceID], [AttributeValue]) VALUES (12, 6541, N'Ürünler')
GO
INSERT [snlg_V1].[TblBlockAttributeValues] ([AttributeID], [BlockPlaceID], [AttributeValue]) VALUES (11, 5154, N'default')
GO
INSERT [snlg_V1].[TblBlockAttributeValues] ([AttributeID], [BlockPlaceID], [AttributeValue]) VALUES (12, 6879, N'Projeler')
GO
INSERT [snlg_V1].[TblBlockAttributeValues] ([AttributeID], [BlockPlaceID], [AttributeValue]) VALUES (13, 6881, N'Projeler')
GO
INSERT [snlg_V1].[TblBlockAttributeValues] ([AttributeID], [BlockPlaceID], [AttributeValue]) VALUES (12, 6279, N'Blog')
GO
INSERT [snlg_V1].[TblBlockAttributeValues] ([AttributeID], [BlockPlaceID], [AttributeValue]) VALUES (13, 6280, N'Blog')
GO
INSERT [snlg_V1].[TblBlockAttributeValues] ([AttributeID], [BlockPlaceID], [AttributeValue]) VALUES (10, 6282, N'3')
GO
INSERT [snlg_V1].[TblBlockAttributeValues] ([AttributeID], [BlockPlaceID], [AttributeValue]) VALUES (12, 6801, N'Üye Profil')
GO
INSERT [snlg_V1].[TblBlockAttributeValues] ([AttributeID], [BlockPlaceID], [AttributeValue]) VALUES (13, 6802, N'Üye Profil')
GO
INSERT [snlg_V1].[TblBlockAttributeValues] ([AttributeID], [BlockPlaceID], [AttributeValue]) VALUES (12, 6627, N'Blog')
GO
INSERT [snlg_V1].[TblBlockAttributeValues] ([AttributeID], [BlockPlaceID], [AttributeValue]) VALUES (13, 6628, N'Blog')
GO
INSERT [snlg_V1].[TblBlockAttributeValues] ([AttributeID], [BlockPlaceID], [AttributeValue]) VALUES (12, 6646, N'Blog')
GO
INSERT [snlg_V1].[TblBlockAttributeValues] ([AttributeID], [BlockPlaceID], [AttributeValue]) VALUES (13, 6647, N'Blog')
GO
INSERT [snlg_V1].[TblAramaMotoru] ([GglDogrula], [GglAnalytic], [GglUser], [GglPsw], [GglProfId]) VALUES (N'', N'', N'', N'', N'')
GO
INSERT [snlg_V1].[TblDegiskenler] ([Degisken], [Deger]) VALUES (N'AcilisSayfasi', N'anasayfa')
GO
INSERT [snlg_V1].[TblDegiskenler] ([Degisken], [Deger]) VALUES (N'adminDefaultLangID', N'31')
GO
INSERT [snlg_V1].[TblDegiskenler] ([Degisken], [Deger]) VALUES (N'AdminId', N'1')
GO
INSERT [snlg_V1].[TblDegiskenler] ([Degisken], [Deger]) VALUES (N'DefaultLang', N'31')
GO
INSERT [snlg_V1].[TblDegiskenler] ([Degisken], [Deger]) VALUES (N'Kurulum Açıklama', N'Yok')
GO
INSERT [snlg_V1].[TblDegiskenler] ([Degisken], [Deger]) VALUES (N'Kurulum Tarihi', N'Nov  5 2016  9:06PM')
GO
INSERT [snlg_V1].[TblDegiskenler] ([Degisken], [Deger]) VALUES (N'SanalogVersiyon', N'1.5.0.3')
GO
INSERT [snlg_V1].[TblDegiskenler] ([Degisken], [Deger]) VALUES (N'urlExtension', N'')
GO
SET IDENTITY_INSERT [snlg_V1].[TblEPostaSablon] ON 

GO
INSERT [snlg_V1].[TblEPostaSablon] ([EPId], [Anahtar], [Kimden], [KimdenIsim], [Kime], [Konu], [Mesaj], [Aciklama], [Bilgi], [SmtpPsw], [SmtpPort], [SmtpHost], [Ssl_]) VALUES (1, N'üyeOldu', N'demo@domainname.com', NULL, N'demo@yourmail.com', N'Hoşgeldin Sanaloger', N'&nbsp;
<p>Kullanıcı bilgileriniz.</p>

<div>kullanıcı adı : $#kullanıcı_adı#$&nbsp;</div>

<div>Şifre : $#şifre#$ :&nbsp;</div>
', N'yeni üyeler için kullanacağım', N'Bu mesajda şu özel ifadeleri kullanabilirsiniz.
$#kullanıcı_adı#$ : üyenin kullanıcı adı
$#şifre#$ : üyenin şifresi

', N'00000000', N'587', N'mail.domainname.com', 0)
GO
INSERT [snlg_V1].[TblEPostaSablon] ([EPId], [Anahtar], [Kimden], [KimdenIsim], [Kime], [Konu], [Mesaj], [Aciklama], [Bilgi], [SmtpPsw], [SmtpPort], [SmtpHost], [Ssl_]) VALUES (4, N'iletişimFormu_Admine', N'demo@domainname.com', N'iletişim Formu', N'demo@yourmail.com', N'İletişim Formundan Mesaj Var.', N'<p>$#isim#$  </p>

<p>$#email#$</p>

<p>$#telefon#$ </p>

<p>$#konu#$</p>

<p>$#mesaj#$ <br />
 </p>
', N'iletişim formu için kulanılan mesaj şablonu', N'Bu mesajda şu özel ifadeleri kullanabilirsiniz.
$#email#$ : forma yazılan e-posta adresi
$#isim#$    : forma yazılan  isim
$#konu#$  : forma yazılan konu
$#mesaj#$ : forma yazılan mesaj
$#telefon#$ : forma yazılan telefon numarası

', N'00000000', N'587', N'mail.domainname.com', 0)
GO
INSERT [snlg_V1].[TblEPostaSablon] ([EPId], [Anahtar], [Kimden], [KimdenIsim], [Kime], [Konu], [Mesaj], [Aciklama], [Bilgi], [SmtpPsw], [SmtpPort], [SmtpHost], [Ssl_]) VALUES (5, N'ŞifreHatırlat', N'demo@domainname.com', N'demo', N'demo@yourmail.com', N'Şifre Sıfırlama', N'<h3>Merhaba,</h3>

<p>Sanaloger: <strong>$#kullanıcı_adı#$</strong></p>

<p>İşte şifreni sıfırlayabileceğin bağlantın:</p>

<p><em>(Sıfırlama bağlatısının tek kullanımlık olduğunu unutmamalısın!)</em></p>

<p><strong><a href="http://domainismi.com/tr/sifremi-unuttum?guid=$#guid#$">http://domainismi.com/tr/sifremi-unuttum?guid=$#guid#$</a></strong></p>
', N'şifre unutanlara gönderilen mesaj', N'Bu mesajda şu özel ifadeleri kullanabilirsiniz. "domainismini" ibaresi olan kısımlara mutlaka kendi domain isminizi yazmalısınız!
$#kullanıcı_adı#$ : üyenin kullanıcı adı
$#şifre#$ : üyenin şifresi
http://domainismi.com/tr/sifremi-unuttum?guid=$#guid#$     :  Şifre Sıfırlama linki', N'00000000', N'587', N'mail.domainname.com', 0)
GO
INSERT [snlg_V1].[TblEPostaSablon] ([EPId], [Anahtar], [Kimden], [KimdenIsim], [Kime], [Konu], [Mesaj], [Aciklama], [Bilgi], [SmtpPsw], [SmtpPort], [SmtpHost], [Ssl_]) VALUES (6, N'makaleYorum_Ziyaretci', N'demo@domainname.com', NULL, N'demo@yourmail.com', N'Makale Yorumunuza Cevap Verildi', N'yorum yaptığınız makaleye başka yorum yapıldı.
<p>$#url_adresi#$ </p>
', N'makale yorumu yazan birine cevap yazılınca gidecek mesaj.', N'Bu mesajda şu özel ifadeleri kullanabilirsiniz.
$#url_adresi#$ : mesajınıza yazılan cevap', N'00000000', N'587', N'mail.domainname.com', 0)
GO
INSERT [snlg_V1].[TblEPostaSablon] ([EPId], [Anahtar], [Kimden], [KimdenIsim], [Kime], [Konu], [Mesaj], [Aciklama], [Bilgi], [SmtpPsw], [SmtpPort], [SmtpHost], [Ssl_]) VALUES (7, N'makaleYorum_Admine', N'demo@domainname.com', N'demo', N'demo@yourmail.com', N'test', N'<p>Siteden "$#başlık#$" başlıklı makaleye yorum yazıldı adminden onaylayabilirsin.<br />
$#mesaj#$</p>
', N'yorum yazılınca admine gidecek mesaj', N'Bu mesajda şu özel ifadeleri kullanabilirsiniz.
$#mesaj#$ : yazılan mesaj
$#başlık#$ : makale başlığı', N'00000000', N'587', N'mail.domainname.com', 0)
GO
INSERT [snlg_V1].[TblEPostaSablon] ([EPId], [Anahtar], [Kimden], [KimdenIsim], [Kime], [Konu], [Mesaj], [Aciklama], [Bilgi], [SmtpPsw], [SmtpPort], [SmtpHost], [Ssl_]) VALUES (18, N'iletişimFormu_Ziyaretçiye', N'demo@domainname.com', N'demo', N'demo@yourmail.com', N'test', N'<p>$#mesaj#$&nbsp;</p>

<div>$#telefon#$</div>
', N'ziyaretçiye gidecek mesaj', N'Bu mesajda şu özel ifadeleri kullanabilirsiniz.
$#mesaj#$ : forma yazılan mesaj
$#telefon#$ : forma yazılan telefon numarası', N'00000000', N'587', N'mail.domainname.com', 0)
GO
INSERT [snlg_V1].[TblEPostaSablon] ([EPId], [Anahtar], [Kimden], [KimdenIsim], [Kime], [Konu], [Mesaj], [Aciklama], [Bilgi], [SmtpPsw], [SmtpPort], [SmtpHost], [Ssl_]) VALUES (19, N'ÜrünSiparişFormuZiyaretci', N'demo@domainname.com', N'demo', N'demo@yourmail.com', N'Sipariş', N'Ürün Adı :$#ürün#$
<hr /> Ürün Adet :$#adet#$
<hr />Ad Soyad : $#isim#$
<hr /> E-Posta Adresi : $#eposta#$
<hr /> Telefon $#telefon#$
<hr /> Açık Adres : $#adres#$
<hr /> Mesaj : $#mesaj#$', N'ziyaretçiye giden sipariş mesajı', N'Ürün Adı :$#ürün#$ 
Ürün Adet :$#adet#$   
Ad Soyad : $#isim#$ 
E-Posta Adresi : $#eposta#$
Telefon $#telefon#$
Açık Adres : $#adres#$
Mesaj : $#mesaj#$', N'00000000', N'587', N'mail.domainname.com', 0)
GO
INSERT [snlg_V1].[TblEPostaSablon] ([EPId], [Anahtar], [Kimden], [KimdenIsim], [Kime], [Konu], [Mesaj], [Aciklama], [Bilgi], [SmtpPsw], [SmtpPort], [SmtpHost], [Ssl_]) VALUES (20, N'ÜrünSiparişFormuAdmin', N'demo@domainname.com', N'demo', N'demo@yourmail.com', N'Sipariş', N'Ürün Adı :$#ürün#$
<hr /> Ürün Adet :$#adet#$
<hr />Ad Soyad : $#isim#$
<hr /> E-Posta Adresi : $#eposta#$
<hr /> Telefon $#telefon#$
<hr /> Açık Adres : $#adres#$
<hr /> Mesaj : $#mesaj#$', N'admine giden sipariş mesajı', N'Ürün Adı :$#ürün#$ 
Ürün Adet :$#adet#$   
Ad Soyad : $#isim#$ 
E-Posta Adresi : $#eposta#$
Telefon $#telefon#$
Açık Adres : $#adres#$
Mesaj : $#mesaj#$', N'00000000', N'587', N'mail.domainname.com', 0)
GO
INSERT [snlg_V1].[TblEPostaSablon] ([EPId], [Anahtar], [Kimden], [KimdenIsim], [Kime], [Konu], [Mesaj], [Aciklama], [Bilgi], [SmtpPsw], [SmtpPort], [SmtpHost], [Ssl_]) VALUES (21, N'ZiyaretçiDefteriFormuAdmin', N'demo@domainname.com', N'ziyaretçi defteri', N'demo@yourmail.com', N'Ziyaretçi defteri', N'<p>$#isim#$ &nbsp;</p>
$#konu#$

<p>$#mesaj#$&nbsp;</p>
', N'ziyaretçi defterine yazılan mesajın şablonu', N'Bu mesajda şu özel ifadeleri kullanabilirsiniz.
$#isim#$    : forma yazılan  isim
$#konu#$  : forma yazılan konu
$#mesaj#$ : forma yazılan mesaj
', N'00000000', N'587', N'mail.domainname.com', 0)
GO
SET IDENTITY_INSERT [snlg_V1].[TblEPostaSablon] OFF
GO
SET IDENTITY_INSERT [snlg_V1].[TblParaBirimleri] ON 

GO
INSERT [snlg_V1].[TblParaBirimleri] ([PId], [Para], [Simge]) VALUES (1, N'Türk Lirası', N'TL')
GO
INSERT [snlg_V1].[TblParaBirimleri] ([PId], [Para], [Simge]) VALUES (2, N'Amerikan Doları', N'$')
GO
INSERT [snlg_V1].[TblParaBirimleri] ([PId], [Para], [Simge]) VALUES (3, N'Euro', N'€')
GO
SET IDENTITY_INSERT [snlg_V1].[TblParaBirimleri] OFF
GO
INSERT [snlg_V1].[TblSiteLinkleri] ([SeoUrl], [Id], [Dil], [UrlAnahtar], [SablonAnahtar]) VALUES (N'uye-girisi', 2390, 31, N'', N'')
GO
INSERT [snlg_V1].[TblSiteLinkleri] ([SeoUrl], [Id], [Dil], [UrlAnahtar], [SablonAnahtar]) VALUES (N'saglik', 261, 31, N'blog', N'blogCtg')
GO
INSERT [snlg_V1].[TblSiteLinkleri] ([SeoUrl], [Id], [Dil], [UrlAnahtar], [SablonAnahtar]) VALUES (N'bize-ulasin', 251, 31, N'', N'')
GO
INSERT [snlg_V1].[TblSiteLinkleri] ([SeoUrl], [Id], [Dil], [UrlAnahtar], [SablonAnahtar]) VALUES (N'degerlerimiz', 277, 31, N'', N'')
GO
INSERT [snlg_V1].[TblSiteLinkleri] ([SeoUrl], [Id], [Dil], [UrlAnahtar], [SablonAnahtar]) VALUES (N'yazarlar', 2391, 31, N'', N'')
GO
INSERT [snlg_V1].[TblSiteLinkleri] ([SeoUrl], [Id], [Dil], [UrlAnahtar], [SablonAnahtar]) VALUES (N'duis-aute-irure-dolor-in-reprehenderit-in-voluptate-velit-esse-cillum-dolore', 51, 31, N'blog', N'blog')
GO
INSERT [snlg_V1].[TblSiteLinkleri] ([SeoUrl], [Id], [Dil], [UrlAnahtar], [SablonAnahtar]) VALUES (N'blog', 284, 31, N'', N'')
GO
INSERT [snlg_V1].[TblSiteLinkleri] ([SeoUrl], [Id], [Dil], [UrlAnahtar], [SablonAnahtar]) VALUES (N'referanslar', 1, 31, N'portfolio', N'portfolioCtg')
GO
INSERT [snlg_V1].[TblSiteLinkleri] ([SeoUrl], [Id], [Dil], [UrlAnahtar], [SablonAnahtar]) VALUES (N'lisango-minti-kahverengi-suet-ayakkabi', 137, 31, N'shop', N'shop')
GO
INSERT [snlg_V1].[TblSiteLinkleri] ([SeoUrl], [Id], [Dil], [UrlAnahtar], [SablonAnahtar]) VALUES (N'hayat', 244, 31, N'blog', N'blogCtg')
GO
INSERT [snlg_V1].[TblSiteLinkleri] ([SeoUrl], [Id], [Dil], [UrlAnahtar], [SablonAnahtar]) VALUES (N'motivasyon', 270, 31, N'blog', N'blogCtg')
GO
INSERT [snlg_V1].[TblSiteLinkleri] ([SeoUrl], [Id], [Dil], [UrlAnahtar], [SablonAnahtar]) VALUES (N'partnerler', 2, 31, N'portfolio', N'portfolioCtg')
GO
INSERT [snlg_V1].[TblSiteLinkleri] ([SeoUrl], [Id], [Dil], [UrlAnahtar], [SablonAnahtar]) VALUES (N'akif', 4, 31, N'user', N'user')
GO
INSERT [snlg_V1].[TblSiteLinkleri] ([SeoUrl], [Id], [Dil], [UrlAnahtar], [SablonAnahtar]) VALUES (N'cossy-moda-buz-mavisi-gomlek', 149, 31, N'shop', N'shop')
GO
INSERT [snlg_V1].[TblSiteLinkleri] ([SeoUrl], [Id], [Dil], [UrlAnahtar], [SablonAnahtar]) VALUES (N'duyurular', 289, 31, N'', N'')
GO
INSERT [snlg_V1].[TblSiteLinkleri] ([SeoUrl], [Id], [Dil], [UrlAnahtar], [SablonAnahtar]) VALUES (N'sifremi-unuttum', 2395, 31, N'', N'')
GO
INSERT [snlg_V1].[TblSiteLinkleri] ([SeoUrl], [Id], [Dil], [UrlAnahtar], [SablonAnahtar]) VALUES (N'projeler', 1320, 31, N'', N'')
GO
INSERT [snlg_V1].[TblSiteLinkleri] ([SeoUrl], [Id], [Dil], [UrlAnahtar], [SablonAnahtar]) VALUES (N'sikca-sorulan-sorular', 278, 31, N'', N'')
GO
INSERT [snlg_V1].[TblSiteLinkleri] ([SeoUrl], [Id], [Dil], [UrlAnahtar], [SablonAnahtar]) VALUES (N'akif', 4, 31, N'user', N'user')
GO
INSERT [snlg_V1].[TblSiteLinkleri] ([SeoUrl], [Id], [Dil], [UrlAnahtar], [SablonAnahtar]) VALUES (N'modafans-hakiki-deri-ayakkabi', 147, 31, N'shop', N'shop')
GO
INSERT [snlg_V1].[TblSiteLinkleri] ([SeoUrl], [Id], [Dil], [UrlAnahtar], [SablonAnahtar]) VALUES (N'foto-galeri', 2370, 31, N'', N'')
GO
INSERT [snlg_V1].[TblSiteLinkleri] ([SeoUrl], [Id], [Dil], [UrlAnahtar], [SablonAnahtar]) VALUES (N'urunler', 1321, 31, N'', N'')
GO
INSERT [snlg_V1].[TblSiteLinkleri] ([SeoUrl], [Id], [Dil], [UrlAnahtar], [SablonAnahtar]) VALUES (N'muhammed', 27, 31, N'user', N'user')
GO
INSERT [snlg_V1].[TblSiteLinkleri] ([SeoUrl], [Id], [Dil], [UrlAnahtar], [SablonAnahtar]) VALUES (N'deridenna-deri-ayakkabi', 145, 31, N'shop', N'shop')
GO
INSERT [snlg_V1].[TblSiteLinkleri] ([SeoUrl], [Id], [Dil], [UrlAnahtar], [SablonAnahtar]) VALUES (N'at-vero-eos-et-accusamus-et-iusto-odio-dignissimos-ducimus-qui-blanditiis-praesentium-voluptatum-deleniti', 77, 31, N'announce', N'announce')
GO
INSERT [snlg_V1].[TblSiteLinkleri] ([SeoUrl], [Id], [Dil], [UrlAnahtar], [SablonAnahtar]) VALUES (N'uye-ol', 246, 31, N'', N'')
GO
INSERT [snlg_V1].[TblSiteLinkleri] ([SeoUrl], [Id], [Dil], [UrlAnahtar], [SablonAnahtar]) VALUES (N'uye-profil', 287, 31, N'', N'')
GO
INSERT [snlg_V1].[TblSiteLinkleri] ([SeoUrl], [Id], [Dil], [UrlAnahtar], [SablonAnahtar]) VALUES (N'classic-kahverengi-hakiki-deri-ayakkabi', 140, 31, N'shop', N'shop')
GO
INSERT [snlg_V1].[TblSiteLinkleri] ([SeoUrl], [Id], [Dil], [UrlAnahtar], [SablonAnahtar]) VALUES (N'haberler', 2362, 31, N'', N'')
GO
INSERT [snlg_V1].[TblSiteLinkleri] ([SeoUrl], [Id], [Dil], [UrlAnahtar], [SablonAnahtar]) VALUES (N'mistaken-idea-of-denouncing-pleasure-and-praising-pain', 218, 31, N'news', N'news')
GO
INSERT [snlg_V1].[TblSiteLinkleri] ([SeoUrl], [Id], [Dil], [UrlAnahtar], [SablonAnahtar]) VALUES (N'equal-blame-belongs-to-those-who-fail-in-their-duty-through-weakness-of-will-which-is-the-same', 204, 31, N'news', N'news')
GO
INSERT [snlg_V1].[TblSiteLinkleri] ([SeoUrl], [Id], [Dil], [UrlAnahtar], [SablonAnahtar]) VALUES (N'doming-scribentur-te-sed-mel-habeo-tritani-noluisse-ut-id-everti-disputationi-qui', 203, 31, N'news', N'news')
GO
INSERT [snlg_V1].[TblSiteLinkleri] ([SeoUrl], [Id], [Dil], [UrlAnahtar], [SablonAnahtar]) VALUES (N'classic-kahverengi-modern-ayakkabi', 154, 31, N'shop', N'shop')
GO
INSERT [snlg_V1].[TblSiteLinkleri] ([SeoUrl], [Id], [Dil], [UrlAnahtar], [SablonAnahtar]) VALUES (N'etkinlikler', 1311, 31, N'', N'')
GO
INSERT [snlg_V1].[TblSiteLinkleri] ([SeoUrl], [Id], [Dil], [UrlAnahtar], [SablonAnahtar]) VALUES (N'mda', 7, 31, N'user', N'user')
GO
INSERT [snlg_V1].[TblSiteLinkleri] ([SeoUrl], [Id], [Dil], [UrlAnahtar], [SablonAnahtar]) VALUES (N'selam', 8, 31, N'user', N'user')
GO
INSERT [snlg_V1].[TblSiteLinkleri] ([SeoUrl], [Id], [Dil], [UrlAnahtar], [SablonAnahtar]) VALUES (N'mda1', 11, 31, N'user', N'user')
GO
INSERT [snlg_V1].[TblSiteLinkleri] ([SeoUrl], [Id], [Dil], [UrlAnahtar], [SablonAnahtar]) VALUES (N'mda2', 12, 31, N'user', N'user')
GO
INSERT [snlg_V1].[TblSiteLinkleri] ([SeoUrl], [Id], [Dil], [UrlAnahtar], [SablonAnahtar]) VALUES (N'ssss', 13, 31, N'user', N'user')
GO
INSERT [snlg_V1].[TblSiteLinkleri] ([SeoUrl], [Id], [Dil], [UrlAnahtar], [SablonAnahtar]) VALUES (N'ssss1', 14, 31, N'user', N'user')
GO
INSERT [snlg_V1].[TblSiteLinkleri] ([SeoUrl], [Id], [Dil], [UrlAnahtar], [SablonAnahtar]) VALUES (N'mda3', 17, 31, N'user', N'user')
GO
INSERT [snlg_V1].[TblSiteLinkleri] ([SeoUrl], [Id], [Dil], [UrlAnahtar], [SablonAnahtar]) VALUES (N'klo', 18, 31, N'user', N'user')
GO
INSERT [snlg_V1].[TblSiteLinkleri] ([SeoUrl], [Id], [Dil], [UrlAnahtar], [SablonAnahtar]) VALUES (N'knnl', 19, 31, N'user', N'user')
GO
INSERT [snlg_V1].[TblSiteLinkleri] ([SeoUrl], [Id], [Dil], [UrlAnahtar], [SablonAnahtar]) VALUES (N'kmmo', 22, 31, N'user', N'user')
GO
INSERT [snlg_V1].[TblSiteLinkleri] ([SeoUrl], [Id], [Dil], [UrlAnahtar], [SablonAnahtar]) VALUES (N'wefwew', 24, 31, N'user', N'user')
GO
INSERT [snlg_V1].[TblSiteLinkleri] ([SeoUrl], [Id], [Dil], [UrlAnahtar], [SablonAnahtar]) VALUES (N'mdakbaba', 29, 31, N'user', N'user')
GO
INSERT [snlg_V1].[TblSiteLinkleri] ([SeoUrl], [Id], [Dil], [UrlAnahtar], [SablonAnahtar]) VALUES (N'moda-palas-tanitim', 42, 31, N'project', N'project')
GO
INSERT [snlg_V1].[TblSiteLinkleri] ([SeoUrl], [Id], [Dil], [UrlAnahtar], [SablonAnahtar]) VALUES (N'anasayfa', 242, 31, N'', N'')
GO
INSERT [snlg_V1].[TblSiteLinkleri] ([SeoUrl], [Id], [Dil], [UrlAnahtar], [SablonAnahtar]) VALUES (N'these-cases-are-perfectly-simple-and-easy-to-distinguish', 44, 31, N'blog', N'blog')
GO
INSERT [snlg_V1].[TblSiteLinkleri] ([SeoUrl], [Id], [Dil], [UrlAnahtar], [SablonAnahtar]) VALUES (N'molinda-nova-kahverengi-deri-canta', 138, 31, N'shop', N'shop')
GO
INSERT [snlg_V1].[TblSiteLinkleri] ([SeoUrl], [Id], [Dil], [UrlAnahtar], [SablonAnahtar]) VALUES (N'knjhh', 20, 31, N'user', N'user')
GO
INSERT [snlg_V1].[TblSiteLinkleri] ([SeoUrl], [Id], [Dil], [UrlAnahtar], [SablonAnahtar]) VALUES (N'vitae-mondi-vaziyet-plani', 35, 31, N'project', N'project')
GO
INSERT [snlg_V1].[TblSiteLinkleri] ([SeoUrl], [Id], [Dil], [UrlAnahtar], [SablonAnahtar]) VALUES (N'vitae-mondi-kat-plani', 37, 31, N'project', N'project')
GO
INSERT [snlg_V1].[TblSiteLinkleri] ([SeoUrl], [Id], [Dil], [UrlAnahtar], [SablonAnahtar]) VALUES (N'vitae-mondi-daireler', 38, 31, N'project', N'project')
GO
INSERT [snlg_V1].[TblSiteLinkleri] ([SeoUrl], [Id], [Dil], [UrlAnahtar], [SablonAnahtar]) VALUES (N'mda5', 25, 31, N'user', N'user')
GO
INSERT [snlg_V1].[TblSiteLinkleri] ([SeoUrl], [Id], [Dil], [UrlAnahtar], [SablonAnahtar]) VALUES (N'mda6', 26, 31, N'user', N'user')
GO
INSERT [snlg_V1].[TblSiteLinkleri] ([SeoUrl], [Id], [Dil], [UrlAnahtar], [SablonAnahtar]) VALUES (N'referanslar', 1319, 31, N'', N'')
GO
INSERT [snlg_V1].[TblSiteLinkleri] ([SeoUrl], [Id], [Dil], [UrlAnahtar], [SablonAnahtar]) VALUES (N'ozkan', 6, 31, N'user', N'user')
GO
INSERT [snlg_V1].[TblSiteLinkleri] ([SeoUrl], [Id], [Dil], [UrlAnahtar], [SablonAnahtar]) VALUES (N'ssss2', 15, 31, N'user', N'user')
GO
INSERT [snlg_V1].[TblSiteLinkleri] ([SeoUrl], [Id], [Dil], [UrlAnahtar], [SablonAnahtar]) VALUES (N'sea-erroribus-laboramus-scriptorem-tale-paulo-consulatu', 43, 31, N'blog', N'blog')
GO
INSERT [snlg_V1].[TblSiteLinkleri] ([SeoUrl], [Id], [Dil], [UrlAnahtar], [SablonAnahtar]) VALUES (N'mmmm', 16, 31, N'user', N'user')
GO
INSERT [snlg_V1].[TblSiteLinkleri] ([SeoUrl], [Id], [Dil], [UrlAnahtar], [SablonAnahtar]) VALUES (N'mda4', 23, 31, N'user', N'user')
GO
INSERT [snlg_V1].[TblSiteLinkleri] ([SeoUrl], [Id], [Dil], [UrlAnahtar], [SablonAnahtar]) VALUES (N'vertimos-tanitim', 41, 31, N'project', N'project')
GO
INSERT [snlg_V1].[TblSiteLinkleri] ([SeoUrl], [Id], [Dil], [UrlAnahtar], [SablonAnahtar]) VALUES (N'lisango-minti-siyah-suet-ayakkabi', 155, 31, N'shop', N'shop')
GO
INSERT [snlg_V1].[TblSiteLinkleri] ([SeoUrl], [Id], [Dil], [UrlAnahtar], [SablonAnahtar]) VALUES (N'classic-kahverengi-hakiki-deri-kemer', 135, 31, N'shop', N'shop')
GO
INSERT [snlg_V1].[TblSiteLinkleri] ([SeoUrl], [Id], [Dil], [UrlAnahtar], [SablonAnahtar]) VALUES (N'gomlek-ceket', 219, 31, N'shop', N'shopCtg')
GO
INSERT [snlg_V1].[TblSiteLinkleri] ([SeoUrl], [Id], [Dil], [UrlAnahtar], [SablonAnahtar]) VALUES (N'canta-kemer', 220, 31, N'shop', N'shopCtg')
GO
INSERT [snlg_V1].[TblSiteLinkleri] ([SeoUrl], [Id], [Dil], [UrlAnahtar], [SablonAnahtar]) VALUES (N'mda7', 28, 31, N'user', N'user')
GO
INSERT [snlg_V1].[TblSiteLinkleri] ([SeoUrl], [Id], [Dil], [UrlAnahtar], [SablonAnahtar]) VALUES (N'lemonga-kahverengi-suet-ayakkabi', 141, 31, N'shop', N'shop')
GO
INSERT [snlg_V1].[TblSiteLinkleri] ([SeoUrl], [Id], [Dil], [UrlAnahtar], [SablonAnahtar]) VALUES (N'ayakkabilar', 203, 31, N'shop', N'shopCtg')
GO
INSERT [snlg_V1].[TblSiteLinkleri] ([SeoUrl], [Id], [Dil], [UrlAnahtar], [SablonAnahtar]) VALUES (N'vitae-mondi-tanitim', 34, 31, N'project', N'project')
GO
INSERT [snlg_V1].[TblSiteLinkleri] ([SeoUrl], [Id], [Dil], [UrlAnahtar], [SablonAnahtar]) VALUES (N'vitae-mondi-ulasim', 39, 31, N'project', N'project')
GO
INSERT [snlg_V1].[TblSiteLinkleri] ([SeoUrl], [Id], [Dil], [UrlAnahtar], [SablonAnahtar]) VALUES (N'vitae-mondi-s-s-s-', 40, 31, N'project', N'project')
GO
INSERT [snlg_V1].[TblSiteLinkleri] ([SeoUrl], [Id], [Dil], [UrlAnahtar], [SablonAnahtar]) VALUES (N'mda8', 30, 31, N'user', N'user')
GO
INSERT [snlg_V1].[TblSiteLinkleri] ([SeoUrl], [Id], [Dil], [UrlAnahtar], [SablonAnahtar]) VALUES (N'yasin', 31, 31, N'user', N'user')
GO
INSERT [snlg_V1].[TblSiteLinkleri] ([SeoUrl], [Id], [Dil], [UrlAnahtar], [SablonAnahtar]) VALUES (N'mda9', 32, 31, N'user', N'user')
GO
INSERT [snlg_V1].[TblSiteLinkleri] ([SeoUrl], [Id], [Dil], [UrlAnahtar], [SablonAnahtar]) VALUES (N'mmm', 35, 31, N'user', N'user')
GO
INSERT [snlg_V1].[TblSiteLinkleri] ([SeoUrl], [Id], [Dil], [UrlAnahtar], [SablonAnahtar]) VALUES (N'mmmm1', 36, 31, N'user', N'user')
GO
INSERT [snlg_V1].[TblSiteLinkleri] ([SeoUrl], [Id], [Dil], [UrlAnahtar], [SablonAnahtar]) VALUES (N'mm', 33, 31, N'user', N'user')
GO
INSERT [snlg_V1].[TblSiteLinkleri] ([SeoUrl], [Id], [Dil], [UrlAnahtar], [SablonAnahtar]) VALUES (N'yasinbolat', 34, 31, N'user', N'user')
GO
INSERT [snlg_V1].[TblSiteLinkleri] ([SeoUrl], [Id], [Dil], [UrlAnahtar], [SablonAnahtar]) VALUES (N'devam-eden-projeler', 264, 31, N'project', N'projectCtg')
GO
INSERT [snlg_V1].[TblSiteLinkleri] ([SeoUrl], [Id], [Dil], [UrlAnahtar], [SablonAnahtar]) VALUES (N'yeni-baslanan-projeler', 255, 31, N'project', N'projectCtg')
GO
INSERT [snlg_V1].[TblSiteLinkleri] ([SeoUrl], [Id], [Dil], [UrlAnahtar], [SablonAnahtar]) VALUES (N'tamamlanan-projeler', 266, 31, N'project', N'projectCtg')
GO
INSERT [snlg_V1].[TblSiteLinkleri] ([SeoUrl], [Id], [Dil], [UrlAnahtar], [SablonAnahtar]) VALUES (N'wewe', 37, 31, N'user', N'user')
GO
INSERT [snlg_V1].[TblSiteLinkleri] ([SeoUrl], [Id], [Dil], [UrlAnahtar], [SablonAnahtar]) VALUES (N'biz-kimiz', 250, 31, N'', N'')
GO
INSERT [snlg_V1].[TblSiteLinkleri] ([SeoUrl], [Id], [Dil], [UrlAnahtar], [SablonAnahtar]) VALUES (N'ventore-veritatis-et-quasi-architecto-beatae-vitae-dicta-sunt-explicabo', 80, 31, N'announce', N'announce')
GO
INSERT [snlg_V1].[TblSiteLinkleri] ([SeoUrl], [Id], [Dil], [UrlAnahtar], [SablonAnahtar]) VALUES (N'denouncing-pleasure-and-praising-pain-was-born-and-i-will-give-you-a-complete-account-of-the-system', 82, 31, N'announce', N'announce')
GO
INSERT [snlg_V1].[TblSiteLinkleri] ([SeoUrl], [Id], [Dil], [UrlAnahtar], [SablonAnahtar]) VALUES (N'kombinler', 204, 31, N'shop', N'shopCtg')
GO
INSERT [snlg_V1].[TblSiteLinkleri] ([SeoUrl], [Id], [Dil], [UrlAnahtar], [SablonAnahtar]) VALUES (N'palenda-kahverengi-deri-bot-ayakkabi', 150, 31, N'shop', N'shop')
GO
INSERT [snlg_V1].[TblSiteLinkleri] ([SeoUrl], [Id], [Dil], [UrlAnahtar], [SablonAnahtar]) VALUES (N'quadro-mix-kahverengi-bot-ayakkabi', 152, 31, N'shop', N'shop')
GO
INSERT [snlg_V1].[TblSiteLinkleri] ([SeoUrl], [Id], [Dil], [UrlAnahtar], [SablonAnahtar]) VALUES (N'atlanta-hakiki-siyah-deri-ayakkabi', 153, 31, N'shop', N'shop')
GO
INSERT [snlg_V1].[TblSiteLinkleri] ([SeoUrl], [Id], [Dil], [UrlAnahtar], [SablonAnahtar]) VALUES (N'csx-kahverengi-deri-bot-ayakkabi', 142, 31, N'shop', N'shop')
GO
INSERT [snlg_V1].[TblSiteLinkleri] ([SeoUrl], [Id], [Dil], [UrlAnahtar], [SablonAnahtar]) VALUES (N'modasen-kahverengi-deri-bot-ayakkabi', 143, 31, N'shop', N'shop')
GO
INSERT [snlg_V1].[TblSiteLinkleri] ([SeoUrl], [Id], [Dil], [UrlAnahtar], [SablonAnahtar]) VALUES (N'malinda-minti-siyah-suet-ayakkabi', 151, 31, N'shop', N'shop')
GO
INSERT [snlg_V1].[TblSiteLinkleri] ([SeoUrl], [Id], [Dil], [UrlAnahtar], [SablonAnahtar]) VALUES (N'cossy-moda-tam-beyaz-gomlek', 148, 31, N'shop', N'shop')
GO
INSERT [snlg_V1].[TblSiteLinkleri] ([SeoUrl], [Id], [Dil], [UrlAnahtar], [SablonAnahtar]) VALUES (N'trendy-kahverengi-hakiki-deri-kemer', 144, 31, N'shop', N'shop')
GO
INSERT [snlg_V1].[TblSiteLinkleri] ([SeoUrl], [Id], [Dil], [UrlAnahtar], [SablonAnahtar]) VALUES (N'ekibimiz', 2389, 31, N'', N'')
GO
INSERT [snlg_V1].[TblSiteLinkleri] ([SeoUrl], [Id], [Dil], [UrlAnahtar], [SablonAnahtar]) VALUES (N'ziyaretci-defteri', 2393, 31, N'', N'')
GO
SET IDENTITY_INSERT [snlg_V1].[TblUlke] ON 

GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (1, N'Afghanistan')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (2, N'Albania')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (3, N'Algeria')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (4, N'American Samoa')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (5, N'Andorra')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (6, N'Angola')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (7, N'Anguilla')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (8, N'Antarctica')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (9, N'Antigua & Barbuda')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (10, N'Argentina')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (11, N'Armenia')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (12, N'Aruba')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (13, N'Australia')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (14, N'Austria')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (15, N'Azerbaijan')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (16, N'Bahamas')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (17, N'Bahrain')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (18, N'Bangladesh')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (19, N'Barbados')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (20, N'Belarus')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (21, N'Belgium')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (22, N'Belize')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (23, N'Benin')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (24, N'Bermuda')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (25, N'Bhutan')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (26, N'Bolivia')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (27, N'Bosnia-Herzegovina')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (28, N'Botswana')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (29, N'Brazil')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (30, N'British Virgin Islands')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (31, N'Brunei')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (32, N'Bulgaria')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (33, N'Burkina Faso')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (34, N'Burundi')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (35, N'Cambodia')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (36, N'Cameroon')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (37, N'Canada')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (38, N'Cape Verde')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (39, N'Cayman Islands')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (40, N'Central Africa')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (41, N'Chad')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (42, N'Chile')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (43, N'China')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (44, N'Colombia')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (45, N'Comoros')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (46, N'Congo')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (47, N'Congo (Dem. Rep.)')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (48, N'Cook Islands')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (49, N'Costa Rica')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (50, N'Croatia')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (51, N'Cuba')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (52, N'Cyprus')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (53, N'Czech Republic')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (54, N'Denmark')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (55, N'Djibouti')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (56, N'Dominica')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (57, N'Dominican Republic')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (58, N'East Timor')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (59, N'Ecuador')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (60, N'Egypt')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (61, N'El Salvador')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (62, N'Equatorial Guinea')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (63, N'Eritrea')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (64, N'Estonia')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (65, N'Ethiopia')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (66, N'Ext. Territ. of Australia')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (67, N'Falkland Islands')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (68, N'Faroe Islands')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (69, N'Fiji')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (70, N'Finland')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (71, N'France')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (72, N'French Guiana')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (73, N'French Polynesia')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (74, N'Gabon')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (75, N'Gambia')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (76, N'Georgia')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (77, N'Germany')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (78, N'Ghana')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (79, N'Gibraltar')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (80, N'Greece')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (81, N'Greenland')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (82, N'Grenada')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (83, N'Guadeloupe')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (84, N'Guam')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (85, N'Guatemala')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (86, N'Guernsey and Alderney')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (87, N'Guinea')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (88, N'Guinea Bissau')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (89, N'Guyana')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (90, N'Haiti')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (91, N'Honduras')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (92, N'Hungary')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (93, N'Iceland')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (94, N'India')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (95, N'Indonesia')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (96, N'Iran')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (97, N'Iraq')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (98, N'Ireland')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (99, N'Israel')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (100, N'Italy')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (101, N'Ivory Coast')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (102, N'Jamaica')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (103, N'Japan')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (104, N'Jersey')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (105, N'Jordan')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (106, N'Kazakhstan')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (107, N'Kenya')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (108, N'Kiribati')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (109, N'Korea (North)')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (110, N'Korea (South)')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (111, N'Kuwait')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (112, N'Kyrgyzstan')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (113, N'Laos')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (114, N'Latvia')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (115, N'Lebanon')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (116, N'Lesotho')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (117, N'Liberia')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (118, N'Libya')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (119, N'Liechtenstein')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (120, N'Lithuania')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (121, N'Luxembourg')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (122, N'Macedonia')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (123, N'Madagascar')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (124, N'Malawi')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (125, N'Malaysia')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (126, N'Maldives')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (127, N'Mali')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (128, N'Malta')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (129, N'Man (Isle of)')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (130, N'Marshall Islands')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (131, N'Martinique')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (132, N'Mauritania')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (133, N'Mauritius')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (134, N'Mayotte')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (135, N'Mexico')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (136, N'Micronesia')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (137, N'Moldova')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (138, N'Monaco')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (139, N'Mongolia')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (140, N'Morocco')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (141, N'Mozambique')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (142, N'Myanmar')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (143, N'Namibia')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (144, N'Nauru')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (145, N'Nepal')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (146, N'Netherlands')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (147, N'Netherlands Antilles')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (148, N'New Caledonia')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (149, N'New Zealand')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (150, N'Nicaragua')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (151, N'Niger')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (152, N'Nigeria')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (153, N'Niue')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (154, N'Norfolk')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (155, N'Northern Mariana Islands')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (156, N'Oman')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (157, N'Pakistan')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (158, N'Palau')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (159, N'Palestine')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (160, N'Panama')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (161, N'Papua New Guinea')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (162, N'Paraguay')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (163, N'Peru')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (164, N'Philippines')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (165, N'Poland')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (166, N'Portugal')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (167, N'Puerto Rico')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (168, N'Qatar')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (169, N'Réunion')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (170, N'Romania')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (171, N'Russia')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (172, N'Rwanda')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (173, N'Sahara')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (174, N'Saint Helena')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (175, N'Saint Kitts and Nevis')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (176, N'Saint Lucia')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (177, N'Saint Pierre & Miquelon')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (178, N'Samoa')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (179, N'San Marino')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (180, N'São Tomé and Príncipe')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (181, N'Saudi Arabia')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (182, N'Senegal')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (183, N'Serbia and Montenegro')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (184, N'Seychelles')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (185, N'Sierra Leone')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (186, N'Singapore')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (187, N'Slovakia')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (188, N'Slovenia')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (189, N'Smaller Territories of the UK')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (190, N'Solomon Islands')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (191, N'Somalia')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (192, N'South Africa')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (193, N'Spain')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (194, N'Sri Lanka')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (195, N'St. Vincent & the Grenadines')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (196, N'Sudan')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (197, N'Suriname')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (198, N'Svalbard and Jan Mayen')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (199, N'Swaziland')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (200, N'Sweden')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (201, N'Switzerland')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (202, N'Syria')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (203, N'Taiwan')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (204, N'Tajikistan')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (205, N'Tanzania')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (206, N'Terres Australes')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (207, N'Thailand')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (208, N'Togo')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (209, N'Tokelau')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (210, N'Tonga')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (211, N'Trinidad and Tobago')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (212, N'Tunisia')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (213, N'Turkmenistan')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (214, N'Turks and Caicos Islands')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (215, N'Tuvalu')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (216, N'Türkiye')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (217, N'Uganda')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (218, N'Ukraine')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (219, N'United Arab Emirates')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (220, N'United Kingdom')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (221, N'United States of America')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (222, N'Uruguay')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (223, N'Uzbekistan')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (224, N'Vanuatu')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (225, N'Vatican')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (226, N'Venezuela')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (227, N'Vietnam')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (228, N'Virgin Islands of the USA')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (229, N'Wallis & Futuna')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (230, N'Yemen')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (231, N'Zambia')
GO
INSERT [snlg_V1].[TblUlke] ([UId], [Ulke]) VALUES (232, N'Zimbabwe')
GO
SET IDENTITY_INSERT [snlg_V1].[TblUlke] OFF
GO
SET IDENTITY_INSERT [snlg_V1].[TblVarsayilanResimler] ON 

GO
INSERT [snlg_V1].[TblVarsayilanResimler] ([AnahtarId], [ResimAnahtar], [ResimYol], [Aciklama]) VALUES (-31998, N'blog', N'/uploads/images/default/article.jpg', N'Resmi olmayan makaleler için')
GO
INSERT [snlg_V1].[TblVarsayilanResimler] ([AnahtarId], [ResimAnahtar], [ResimYol], [Aciklama]) VALUES (-31997, N'blogCtg', NULL, N'Resmi olmayan makale kategorileri için')
GO
INSERT [snlg_V1].[TblVarsayilanResimler] ([AnahtarId], [ResimAnahtar], [ResimYol], [Aciklama]) VALUES (-31996, N'project', N'/uploads/images/default/project.jpg', N'Resmi olmayan projeler için')
GO
INSERT [snlg_V1].[TblVarsayilanResimler] ([AnahtarId], [ResimAnahtar], [ResimYol], [Aciklama]) VALUES (-31995, N'projectCtg', N'/uploads/images/default/project-category.jpg', N'Resmi olmayan proje kategorisi için')
GO
INSERT [snlg_V1].[TblVarsayilanResimler] ([AnahtarId], [ResimAnahtar], [ResimYol], [Aciklama]) VALUES (-31994, N'portfolio', N'/uploads/images/default/portfolio.jpg', N'Resmi olmayan referans için')
GO
INSERT [snlg_V1].[TblVarsayilanResimler] ([AnahtarId], [ResimAnahtar], [ResimYol], [Aciklama]) VALUES (-31993, N'shop', N'/uploads/images/default/product.jpg', N'Resmi olmayan ürün için')
GO
INSERT [snlg_V1].[TblVarsayilanResimler] ([AnahtarId], [ResimAnahtar], [ResimYol], [Aciklama]) VALUES (-31992, N'shopCtg', NULL, N'Resmi olmayan ürün kategorisi için')
GO
INSERT [snlg_V1].[TblVarsayilanResimler] ([AnahtarId], [ResimAnahtar], [ResimYol], [Aciklama]) VALUES (-31991, N'announce', N'/uploads/images/default/announcement.jpg', N'Resmi olmayan duyuru için')
GO
INSERT [snlg_V1].[TblVarsayilanResimler] ([AnahtarId], [ResimAnahtar], [ResimYol], [Aciklama]) VALUES (-31990, N'news', N'/uploads/images/default/news.jpg', N'Resmi olmayan haberler için')
GO
INSERT [snlg_V1].[TblVarsayilanResimler] ([AnahtarId], [ResimAnahtar], [ResimYol], [Aciklama]) VALUES (-31987, N'user', N'/uploads/images/default/user.jpg', N'Resmi olmayan üyeler için (avatar)')
GO
SET IDENTITY_INSERT [snlg_V1].[TblVarsayilanResimler] OFF
GO
