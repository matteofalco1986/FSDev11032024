USE [Pizzeria]
GO
/****** Object:  Table [dbo].[Goods]    Script Date: 15/03/2024 16:51:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Goods](
	[GoodId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Image] [nvarchar](255) NULL,
	[Price] [money] NOT NULL,
	[Ingredients] [nvarchar](2500) NOT NULL,
 CONSTRAINT [PK_Goods] PRIMARY KEY CLUSTERED 
(
	[GoodId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderGoods1]    Script Date: 15/03/2024 16:51:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderGoods1](
	[OrderId] [int] NOT NULL,
	[GoodId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_OrderGoods] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC,
	[GoodId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 15/03/2024 16:51:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[DeliveryAddress] [nvarchar](255) NOT NULL,
	[Notes] [nvarchar](255) NOT NULL,
	[Date] [datetime] NULL,
	[Evaso] [bit] NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 15/03/2024 16:51:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](20) NOT NULL,
	[Password] [nvarchar](255) NOT NULL,
	[Role] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Goods] ON 

INSERT [dbo].[Goods] ([GoodId], [Name], [Image], [Price], [Ingredients]) VALUES (1, N'Margherita', N'https://www.dominos.jp/ManagedAssets/JP/product/90/JP_90_en_hero_991.png', 7.0000, N'Pomodoro, mozzarella, basilico fresco, olio extra vergine d''oliva.')
INSERT [dbo].[Goods] ([GoodId], [Name], [Image], [Price], [Ingredients]) VALUES (2, N'Capricciosa', N'https://www.dominos.com.au/ManagedAssets/OLO/eStore/All/Product/AU/Capriciosa/CapriciosaProductImageLargeENDefault20140804_122840.png', 8.5000, N'Pomodoro, mozzarella, prosciutto cotto, funghi, carciofi, olive nere, olio extra vergine d''oliva.')
INSERT [dbo].[Goods] ([GoodId], [Name], [Image], [Price], [Ingredients]) VALUES (3, N'Diavola', N'https://www.dominospizza.pl/getmedia/87c223a9-428c-4f7d-a93d-875ea4bb1b53/520x520-diavola_1.png', 9.0000, N'Pomodoro, mozzarella, salame piccante, peperoncini freschi, olio extra vergine d''oliva.')
INSERT [dbo].[Goods] ([GoodId], [Name], [Image], [Price], [Ingredients]) VALUES (4, N'Quattro Formaggi', N'https://www.dominos.jp/ManagedAssets/JP/product/237/JP_237_en_hero_991.png', 10.0000, N'Mozzarella, gorgonzola, parmigiano reggiano, taleggio, noce moscata.')
INSERT [dbo].[Goods] ([GoodId], [Name], [Image], [Price], [Ingredients]) VALUES (5, N'Ortolana Fresca', N'https://pizzalassassino.ro/wp-content/uploads/2021/06/Pizza-Ortolana.png', 9.5000, N'Pomodoro, mozzarella, melanzane grigliate, peperoni, zucchine, cipolla rossa, olio extra vergine d''oliva.')
INSERT [dbo].[Goods] ([GoodId], [Name], [Image], [Price], [Ingredients]) VALUES (6, N'Rustica ', N'https://isaporidelceliaco.com/wp-content/uploads/2021/03/Pizza-patate-e-salsiccia.jpg', 8.0000, N'Pomodoro, mozzarella, salsiccia, patate al forno, rosmarino.')
INSERT [dbo].[Goods] ([GoodId], [Name], [Image], [Price], [Ingredients]) VALUES (7, N'Tartufo Nero', N'https://positano.lv/wp-content/uploads/2021/12/Tartufo-bianca-1.png', 12.0000, N'Mozzarella di bufala, crema di tartufo nero, funghi porcini, parmigiano reggiano, prezzemolo.')
INSERT [dbo].[Goods] ([GoodId], [Name], [Image], [Price], [Ingredients]) VALUES (8, N'Bufalina', N'https://emiliaeats.com/wp-content/uploads/2021/03/bufala-png-copy.png', 11.0000, N'Pomodoro, mozzarella di bufala, basilico fresco, olio extra vergine d''oliva.')
INSERT [dbo].[Goods] ([GoodId], [Name], [Image], [Price], [Ingredients]) VALUES (9, N'Mare e Monti', N'https://maamapizza.ee/wp-content/uploads/2017/03/FruttiDiMare2021.png', 13.0000, N'Pomodoro, mozzarella, gamberetti, funghi porcini, prezzemolo, aglio.')
INSERT [dbo].[Goods] ([GoodId], [Name], [Image], [Price], [Ingredients]) VALUES (10, N'Calzone Classico', N'https://i.pngimg.me/thumb/f/720/comdlpng6952642.jpg', 8.5000, N'Pomodoro, mozzarella, prosciutto cotto, funghi, ricotta, olio extra vergine d''oliva.')
INSERT [dbo].[Goods] ([GoodId], [Name], [Image], [Price], [Ingredients]) VALUES (11, N'Americana', N'https://w7.pngwing.com/pngs/526/288/png-transparent-cooked-pizza-pizza-delivery-italian-cuisine-pizza-food-image-file-formats-recipe-thumbnail.png', 9.0000, N'Pomodoro, mozzarella, wurstel, patatine fritte..')
INSERT [dbo].[Goods] ([GoodId], [Name], [Image], [Price], [Ingredients]) VALUES (12, N'Napoletana', N'https://banner2.cleanpng.com/20180811/wow/kisspng-neapolitan-pizza-neapolitan-cuisine-italian-cuisin-pizza-fest-e-shopping-il-gusto-di-piano-di-sorren-5b6fa4e876b2f5.0031116815340433684862.jpg', 7.5000, N'Pomodoro, mozzarella, acciughe, capperi, origano.')
INSERT [dbo].[Goods] ([GoodId], [Name], [Image], [Price], [Ingredients]) VALUES (13, N'Salmone Affumicato', N'https://image.similarpng.com/very-thumbnail/2022/02/Seafood-pizza-isolated-on-transparent-background-PNG.png', 12.5000, N'Mozzarella, salmone affumicato, rucola, scaglie di parmigiano, limone.')
INSERT [dbo].[Goods] ([GoodId], [Name], [Image], [Price], [Ingredients]) VALUES (14, N'Pesto Genovese', N'https://static.vecteezy.com/system/resources/previews/024/106/531/non_2x/baked-frozen-pizza-with-cheese-and-pesto-on-transparent-background-png.png', 10.5000, N'Mozzarella, pesto alla genovese, pinoli, parmigiano reggiano, pomodorini.')
INSERT [dbo].[Goods] ([GoodId], [Name], [Image], [Price], [Ingredients]) VALUES (15, N'Carbonara', N'https://banner2.cleanpng.com/20180806/ozy/kisspng-california-style-pizza-carbonara-sicilian-pizza-ba-pizza-carbonara-burguer-la-teja-5b68dddfdfc888.0261233015335991999166.jpg', 10.0000, N'Mozzarella, guanciale, uovo, pepe nero, parmigiano reggiano.')
INSERT [dbo].[Goods] ([GoodId], [Name], [Image], [Price], [Ingredients]) VALUES (16, N'Piccante Mexicana', N'https://icon2.cleanpng.com/20180708/lsl/kisspng-california-style-pizza-sicilian-pizza-take-out-new-veg-pizza-5b426a67ac36f9.2027771815310792717054.jpg', 9.5000, N'Pomodoro, mozzarella, carne macinata speziata, jalapeños, cipolla rossa, mais.')
INSERT [dbo].[Goods] ([GoodId], [Name], [Image], [Price], [Ingredients]) VALUES (17, N'Prosciutto e Fichi', N'https://p7.hiclipart.com/preview/286/586/474/california-style-pizza-prosciutto-sicilian-pizza-ham-pizza.jpg', 11.0000, N'Mozzarella, prosciutto crudo, fichi freschi, rucola, scaglie di parmigiano.')
INSERT [dbo].[Goods] ([GoodId], [Name], [Image], [Price], [Ingredients]) VALUES (18, N'Quattro Stagioni', N'https://upload.wikimedia.org/wikipedia/commons/4/42/Pizza_Quattro_Stagioni_transparent.png', 8.5000, N'Pomodoro, mozzarella, prosciutto cotto, funghi, carciofi, olive nere.')
INSERT [dbo].[Goods] ([GoodId], [Name], [Image], [Price], [Ingredients]) VALUES (19, N'Hawaii', N'https://image.similarpng.com/very-thumbnail/2022/02/Hawaiian-pizza-on-transparent-background-PNG.png', 8.0000, N'Pomodoro, mozzarella, prosciutto cotto, ananas.')
INSERT [dbo].[Goods] ([GoodId], [Name], [Image], [Price], [Ingredients]) VALUES (20, N'Gorgonzola e Pere', N'https://banner2.cleanpng.com/20180330/bbw/kisspng-pizza-manakish-italian-cuisine-food-black-garlic-garlic-5abdde86bd16e8.7993992215223927107745.jpg', 10.5000, N' Mozzarella, gorgonzola dolce, pere, noci, miele.')
INSERT [dbo].[Goods] ([GoodId], [Name], [Image], [Price], [Ingredients]) VALUES (21, N'Vegana Delizia', N'https://image.similarpng.com/very-thumbnail/2020/05/vegetarian-pizza-png.png', 9.5000, N'Pomodoro, mozzarella vegana, zucchine grigliate, melanzane, peperoni, spinaci freschi, tofu affumicato, basilico.')
INSERT [dbo].[Goods] ([GoodId], [Name], [Image], [Price], [Ingredients]) VALUES (22, N'Marinara', N'https://ducaspizza.com/wp-content/uploads/Marinara-Ducas-Pizza.png', 6.0000, N'Pomodoro, aglio, origano, olio extra vergine d''oliva.')
INSERT [dbo].[Goods] ([GoodId], [Name], [Image], [Price], [Ingredients]) VALUES (23, N'Boscaiola', N'https://image.similarpng.com/very-thumbnail/2022/03/Delicious-pizza-with-mushrooms-on-transparent-background-PNG.png', 11.0000, N'Base di pomodoro, mozzarella di bufala, funghi porcini freschi, salsiccia, tartufo nero, cipolla rossa caramellata, olio extra vergine di oliva, pecorino, basilico fresco.')
SET IDENTITY_INSERT [dbo].[Goods] OFF
GO
INSERT [dbo].[OrderGoods1] ([OrderId], [GoodId], [Quantity]) VALUES (3, 2, 1)
INSERT [dbo].[OrderGoods1] ([OrderId], [GoodId], [Quantity]) VALUES (3, 3, 1)
INSERT [dbo].[OrderGoods1] ([OrderId], [GoodId], [Quantity]) VALUES (3, 4, 1)
INSERT [dbo].[OrderGoods1] ([OrderId], [GoodId], [Quantity]) VALUES (3, 7, 4)
INSERT [dbo].[OrderGoods1] ([OrderId], [GoodId], [Quantity]) VALUES (3, 8, 1)
INSERT [dbo].[OrderGoods1] ([OrderId], [GoodId], [Quantity]) VALUES (4, 2, 2)
INSERT [dbo].[OrderGoods1] ([OrderId], [GoodId], [Quantity]) VALUES (4, 4, 1)
INSERT [dbo].[OrderGoods1] ([OrderId], [GoodId], [Quantity]) VALUES (4, 6, 1)
INSERT [dbo].[OrderGoods1] ([OrderId], [GoodId], [Quantity]) VALUES (4, 7, 1)
INSERT [dbo].[OrderGoods1] ([OrderId], [GoodId], [Quantity]) VALUES (5, 2, 1)
INSERT [dbo].[OrderGoods1] ([OrderId], [GoodId], [Quantity]) VALUES (5, 3, 1)
INSERT [dbo].[OrderGoods1] ([OrderId], [GoodId], [Quantity]) VALUES (5, 4, 2)
INSERT [dbo].[OrderGoods1] ([OrderId], [GoodId], [Quantity]) VALUES (5, 7, 2)
INSERT [dbo].[OrderGoods1] ([OrderId], [GoodId], [Quantity]) VALUES (5, 8, 1)
INSERT [dbo].[OrderGoods1] ([OrderId], [GoodId], [Quantity]) VALUES (6, 2, 1)
INSERT [dbo].[OrderGoods1] ([OrderId], [GoodId], [Quantity]) VALUES (6, 3, 2)
INSERT [dbo].[OrderGoods1] ([OrderId], [GoodId], [Quantity]) VALUES (6, 6, 5)
INSERT [dbo].[OrderGoods1] ([OrderId], [GoodId], [Quantity]) VALUES (6, 7, 1)
INSERT [dbo].[OrderGoods1] ([OrderId], [GoodId], [Quantity]) VALUES (6, 8, 1)
INSERT [dbo].[OrderGoods1] ([OrderId], [GoodId], [Quantity]) VALUES (10, 2, 1)
INSERT [dbo].[OrderGoods1] ([OrderId], [GoodId], [Quantity]) VALUES (10, 3, 2)
INSERT [dbo].[OrderGoods1] ([OrderId], [GoodId], [Quantity]) VALUES (10, 7, 1)
INSERT [dbo].[OrderGoods1] ([OrderId], [GoodId], [Quantity]) VALUES (14, 2, 1)
INSERT [dbo].[OrderGoods1] ([OrderId], [GoodId], [Quantity]) VALUES (14, 3, 1)
INSERT [dbo].[OrderGoods1] ([OrderId], [GoodId], [Quantity]) VALUES (14, 4, 1)
INSERT [dbo].[OrderGoods1] ([OrderId], [GoodId], [Quantity]) VALUES (14, 8, 1)
INSERT [dbo].[OrderGoods1] ([OrderId], [GoodId], [Quantity]) VALUES (15, 2, 1)
INSERT [dbo].[OrderGoods1] ([OrderId], [GoodId], [Quantity]) VALUES (15, 3, 3)
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([OrderId], [UserId], [DeliveryAddress], [Notes], [Date], [Evaso]) VALUES (3, 4, N'Via di qua, 33', N'Mi fanno male le mani', CAST(N'2024-03-15T14:20:38.000' AS DateTime), 1)
INSERT [dbo].[Orders] ([OrderId], [UserId], [DeliveryAddress], [Notes], [Date], [Evaso]) VALUES (4, 4, N'Via fumagalli, 35', N'Uno dei miei parenti e obeso', CAST(N'2024-03-15T14:22:45.000' AS DateTime), 1)
INSERT [dbo].[Orders] ([OrderId], [UserId], [DeliveryAddress], [Notes], [Date], [Evaso]) VALUES (5, 4, N'Via bologna, 13', N'Ahia che male', CAST(N'2024-03-15T14:25:51.000' AS DateTime), 0)
INSERT [dbo].[Orders] ([OrderId], [UserId], [DeliveryAddress], [Notes], [Date], [Evaso]) VALUES (6, 4, N'Via firenze, 32', N'Mi serve un coltello', CAST(N'2024-03-15T14:46:14.000' AS DateTime), 1)
INSERT [dbo].[Orders] ([OrderId], [UserId], [DeliveryAddress], [Notes], [Date], [Evaso]) VALUES (10, 4, N'sdsdfsdf', N'sdfsdfsdf', CAST(N'2024-03-15T15:30:48.000' AS DateTime), 1)
INSERT [dbo].[Orders] ([OrderId], [UserId], [DeliveryAddress], [Notes], [Date], [Evaso]) VALUES (14, 4, N'Via le mani, 32', N'Non ho le mani', CAST(N'2024-03-15T16:05:28.000' AS DateTime), 0)
INSERT [dbo].[Orders] ([OrderId], [UserId], [DeliveryAddress], [Notes], [Date], [Evaso]) VALUES (15, 4, N'Via ciao 32', N'Ciao ciao ciao', CAST(N'2024-03-15T16:36:30.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserId], [Username], [Password], [Role]) VALUES (1, N'admin', N'admin', N'admin')
INSERT [dbo].[Users] ([UserId], [Username], [Password], [Role]) VALUES (2, N'carlo', N'peppeleppe', N'user')
INSERT [dbo].[Users] ([UserId], [Username], [Password], [Role]) VALUES (3, N'cicciobello', N'tipuzzalalito', N'user')
INSERT [dbo].[Users] ([UserId], [Username], [Password], [Role]) VALUES (4, N'brambilla', N'fumagalli', N'user')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT ((0)) FOR [Evaso]
GO
ALTER TABLE [dbo].[OrderGoods1]  WITH CHECK ADD  CONSTRAINT [FK_OrderGoods_Goods] FOREIGN KEY([GoodId])
REFERENCES [dbo].[Goods] ([GoodId])
GO
ALTER TABLE [dbo].[OrderGoods1] CHECK CONSTRAINT [FK_OrderGoods_Goods]
GO
ALTER TABLE [dbo].[OrderGoods1]  WITH CHECK ADD  CONSTRAINT [FK_OrderGoods_Orders] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([OrderId])
GO
ALTER TABLE [dbo].[OrderGoods1] CHECK CONSTRAINT [FK_OrderGoods_Orders]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Users]
GO
