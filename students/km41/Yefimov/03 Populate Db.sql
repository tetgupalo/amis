SET IDENTITY_INSERT [dbo].[Users] ON 

GO
INSERT [dbo].[Users] ([id], [username], [isadmin]) VALUES (1, N'admincomp', 1)
GO
SET IDENTITY_INSERT [dbo].[Users] OFF
GO



SET IDENTITY_INSERT [dbo].[Computers] ON 

GO
INSERT [dbo].[Computers] ([id], [name], [video], [videogb], [memory], [hdd], [optidrive], [monit], [moninches]) VALUES (1, N'power white', N'TITAN', 8, 12, 2000, 1, 1, 24)
GO
INSERT [dbo].[Computers] ([id], [name], [video], [videogb], [memory], [hdd], [optidrive], [monit], [moninches]) VALUES (2, N'power black', N'GTX1080', 4, 8, 1000, 1, 1, 22)
GO
INSERT [dbo].[Computers] ([id], [name], [video], [videogb], [memory], [hdd], [optidrive], [monit], [moninches]) VALUES (5, N'strong guy', N'Radeon HD 6870', 4, 8, 1000, 0, 0, NULL)
GO
INSERT [dbo].[Computers] ([id], [name], [video], [videogb], [memory], [hdd], [optidrive], [monit], [moninches]) VALUES (7, N'weak guy', N'Radeon HD 4870', 1, 2, 500, 1, 0, NULL)
GO
INSERT [dbo].[Computers] ([id], [name], [video], [videogb], [memory], [hdd], [optidrive], [monit], [moninches]) VALUES (8, N'ALIENWARE', N'GTX1060', 2, 4, 1000, 0, 1, 19)
GO
SET IDENTITY_INSERT [dbo].[Computers] OFF
GO
SET IDENTITY_INSERT [dbo].[Stores] ON 

GO
INSERT [dbo].[Stores] ([id], [name], [address], [email]) VALUES (1, N'Comfy', N'Киев, ул. В. Гетьмана, 6', N'comfy@i.ua')
GO
INSERT [dbo].[Stores] ([id], [name], [address], [email]) VALUES (2, N'Allo', N'Киев, просп. Победы, 47-А ', N'allo@gmail.com')
GO
INSERT [dbo].[Stores] ([id], [name], [address], [email]) VALUES (3, N'Rozetka', N'Киев, ул. Ярославская, 57', N'rozetka@i.ua')
GO
INSERT [dbo].[Stores] ([id], [name], [address], [email]) VALUES (5, N'MoYo', N'Киев, ул. Большая Васильковская, 18 ', N'moyo@gmail.com')
GO
INSERT [dbo].[Stores] ([id], [name], [address], [email]) VALUES (6, N'Sokol', N'Киев, ул. Семьи Хохловых, 15', N'sokol@i.ua')
GO
SET IDENTITY_INSERT [dbo].[Stores] OFF
GO
SET IDENTITY_INSERT [dbo].[ComputerInStores] ON 

GO
INSERT [dbo].[ComputerInStores] ([id], [computer_id], [store_id], [price], [comment]) VALUES (1, 1, 1, 5000, NULL)
GO
INSERT [dbo].[ComputerInStores] ([id], [computer_id], [store_id], [price], [comment]) VALUES (2, 2, 6, 7002, NULL)
GO
INSERT [dbo].[ComputerInStores] ([id], [computer_id], [store_id], [price], [comment]) VALUES (3, 1, 2, 5300, NULL)
GO
INSERT [dbo].[ComputerInStores] ([id], [computer_id], [store_id], [price], [comment]) VALUES (4, 2, 3, 6900.25, NULL)
GO
SET IDENTITY_INSERT [dbo].[ComputerInStores] OFF
GO