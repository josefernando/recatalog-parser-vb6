VERSION 5.00
Object = "{0BA686C6-F7D3-101A-993E-0000C0EF6F5E}#1.0#0"; "THREED32.OCX"
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Object = "{A8B3B723-0B5A-101B-B22E-00AA0037B2FC}#1.0#0"; "GRID32.OCX"
Object = "{C932BA88-4374-101B-A56C-00AA003668DC}#1.1#0"; "Msmask32.ocx"
Begin VB.Form R1FAB001 
   Appearance      =   0  'Flat
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Consulta Apólice"
   ClientHeight    =   5805
   ClientLeft      =   1305
   ClientTop       =   1845
   ClientWidth     =   8490
   BeginProperty Font 
      Name            =   "MS Sans Serif"
      Size            =   8.25
      Charset         =   0
      Weight          =   700
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   ForeColor       =   &H8000000F&
   Icon            =   "R1FAB001.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   PaletteMode     =   1  'UseZOrder
   Picture         =   "R1FAB001.frx":030A
   ScaleHeight     =   5805
   ScaleWidth      =   8490
   Begin Threed.SSPanel pa3d_status 
      Align           =   2  'Align Bottom
      Height          =   345
      Left            =   0
      TabIndex        =   20
      Top             =   5460
      Width           =   8490
      _Version        =   65536
      _ExtentX        =   14975
      _ExtentY        =   609
      _StockProps     =   15
      Caption         =   "R1FAB001"
      ForeColor       =   8388608
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Arial"
         Size            =   8.26
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      BorderWidth     =   1
      BevelInner      =   1
      Alignment       =   1
      Autosize        =   1
   End
   Begin Threed.SSPanel PA3D_Topo 
      Align           =   1  'Align Top
      Height          =   705
      Left            =   0
      TabIndex        =   17
      Top             =   0
      Width           =   8490
      _Version        =   65536
      _ExtentX        =   14975
      _ExtentY        =   1244
      _StockProps     =   15
      ForeColor       =   -2147483640
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      BorderWidth     =   1
      BevelInner      =   1
      RoundedCorners  =   0   'False
      Alignment       =   8
      Begin Threed.SSCommand cmd_ConsExc 
         Height          =   600
         Left            =   4065
         TabIndex        =   68
         Top             =   45
         Width           =   600
         _Version        =   65536
         _ExtentX        =   1058
         _ExtentY        =   1058
         _StockProps     =   78
         ForeColor       =   8388608
         BevelWidth      =   1
         AutoSize        =   1
         Picture         =   "R1FAB001.frx":0614
      End
      Begin Threed.SSCommand BU3D_Sai 
         Height          =   600
         Left            =   7815
         TabIndex        =   15
         Tag             =   "sai"
         Top             =   45
         Width           =   600
         _Version        =   65536
         _ExtentX        =   1058
         _ExtentY        =   1058
         _StockProps     =   78
         AutoSize        =   1
         Picture         =   "R1FAB001.frx":092E
      End
      Begin Threed.SSCommand bu3d_ok 
         Height          =   600
         Left            =   7200
         TabIndex        =   14
         Top             =   45
         Width           =   600
         _Version        =   65536
         _ExtentX        =   1058
         _ExtentY        =   1058
         _StockProps     =   78
         AutoSize        =   1
         Picture         =   "R1FAB001.frx":0C48
      End
      Begin Threed.SSCommand BU3D_Cancela 
         Height          =   600
         Left            =   6585
         TabIndex        =   13
         Top             =   45
         Width           =   600
         _Version        =   65536
         _ExtentX        =   1058
         _ExtentY        =   1058
         _StockProps     =   78
         AutoSize        =   1
         Picture         =   "R1FAB001.frx":0F62
      End
      Begin Threed.SSCommand bu3d_volta 
         Height          =   600
         Left            =   5970
         TabIndex        =   12
         Tag             =   "Volta"
         Top             =   45
         Width           =   600
         _Version        =   65536
         _ExtentX        =   1058
         _ExtentY        =   1058
         _StockProps     =   78
         Enabled         =   0   'False
         BevelWidth      =   0
         AutoSize        =   1
         Picture         =   "R1FAB001.frx":127C
      End
      Begin Threed.SSCommand bu3d_cons_bd_rgd 
         Height          =   600
         Left            =   3405
         TabIndex        =   66
         Tag             =   "sai"
         Top             =   45
         Width           =   600
         _Version        =   65536
         _ExtentX        =   1058
         _ExtentY        =   1058
         _StockProps     =   78
         AutoSize        =   1
         Picture         =   "R1FAB001.frx":1596
      End
      Begin Threed.SSCommand Cmd_New_Pesquisa 
         Height          =   600
         Left            =   5025
         TabIndex        =   73
         ToolTipText     =   "Utiliza a nova consulta"
         Top             =   45
         Visible         =   0   'False
         Width           =   600
         _Version        =   65536
         _ExtentX        =   1058
         _ExtentY        =   1058
         _StockProps     =   78
         ForeColor       =   8388608
         AutoSize        =   1
         Picture         =   "R1FAB001.frx":18B0
      End
      Begin VB.Image IM_Itau_Seguros 
         Appearance      =   0  'Flat
         Height          =   480
         Left            =   0
         Picture         =   "R1FAB001.frx":23B6
         Top             =   90
         Width           =   1365
      End
   End
   Begin Threed.SSFrame fr3d_Segurado 
      Height          =   4740
      Left            =   45
      TabIndex        =   18
      Top             =   720
      Width           =   8340
      _Version        =   65536
      _ExtentX        =   14711
      _ExtentY        =   8361
      _StockProps     =   14
      ForeColor       =   8388608
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Begin Threed.SSFrame fr3d_TpPesquisa 
         Height          =   2505
         Left            =   120
         TabIndex        =   19
         Top             =   2100
         Width           =   8130
         _Version        =   65536
         _ExtentX        =   14340
         _ExtentY        =   4419
         _StockProps     =   14
         Caption         =   "Outros Tipos de Consulta"
         ForeColor       =   8388608
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Begin VB.TextBox tb_u_niu 
            Appearance      =   0  'Flat
            BackColor       =   &H00FFFFFF&
            ForeColor       =   &H00800000&
            Height          =   285
            Left            =   5040
            MaxLength       =   7
            TabIndex        =   88
            Top             =   1320
            Visible         =   0   'False
            Width           =   1155
         End
         Begin VB.TextBox tb_u_sav 
            Appearance      =   0  'Flat
            BackColor       =   &H00FFFFFF&
            ForeColor       =   &H00800000&
            Height          =   285
            Left            =   3120
            MaxLength       =   13
            TabIndex        =   85
            Top             =   1320
            Visible         =   0   'False
            Width           =   1755
         End
         Begin VB.TextBox tb_u_cbn_sor 
            Appearance      =   0  'Flat
            BackColor       =   &H00FFFFFF&
            ForeColor       =   &H00800000&
            Height          =   285
            Left            =   1800
            MaxLength       =   9
            TabIndex        =   83
            Top             =   1320
            Visible         =   0   'False
            Width           =   1170
         End
         Begin VB.TextBox tb_n_pes 
            Appearance      =   0  'Flat
            BackColor       =   &H00FFFFFF&
            ForeColor       =   &H00800000&
            Height          =   285
            Left            =   240
            TabIndex        =   7
            Top             =   765
            Width           =   5940
         End
         Begin VB.TextBox tb_u_prp 
            Appearance      =   0  'Flat
            BackColor       =   &H00FFFFFF&
            ForeColor       =   &H00800000&
            Height          =   285
            Left            =   240
            MaxLength       =   9
            TabIndex        =   9
            Top             =   1320
            Width           =   1365
         End
         Begin Threed.SSPanel pa3d_Pessoa 
            Height          =   375
            Left            =   6360
            TabIndex        =   8
            Top             =   705
            Width           =   1545
            _Version        =   65536
            _ExtentX        =   2725
            _ExtentY        =   661
            _StockProps     =   15
            ForeColor       =   0
            BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "MS Sans Serif"
               Size            =   8.24
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            BorderWidth     =   1
            BevelOuter      =   0
            BevelInner      =   1
            RoundedCorners  =   0   'False
            Alignment       =   8
            Begin Threed.SSOption op3d_e_pes 
               Height          =   240
               Left            =   60
               TabIndex        =   23
               Top             =   60
               Width           =   690
               _Version        =   65536
               _ExtentX        =   1217
               _ExtentY        =   423
               _StockProps     =   78
               Caption         =   "P. F."
               ForeColor       =   8388608
               BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
                  Name            =   "MS Sans Serif"
                  Size            =   8.24
                  Charset         =   0
                  Weight          =   700
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
            End
            Begin Threed.SSOption op3d_e_pesj 
               Height          =   240
               Left            =   795
               TabIndex        =   24
               Top             =   60
               Width           =   680
               _Version        =   65536
               _ExtentX        =   1191
               _ExtentY        =   423
               _StockProps     =   78
               Caption         =   "P. J."
               ForeColor       =   8388608
               BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
                  Name            =   "MS Sans Serif"
                  Size            =   8.24
                  Charset         =   0
                  Weight          =   700
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
            End
         End
         Begin Threed.SSCheck ch3d_Ramo_Prod 
            Height          =   345
            Left            =   240
            TabIndex        =   6
            Top             =   225
            Width           =   3915
            _Version        =   65536
            _ExtentX        =   6906
            _ExtentY        =   609
            _StockProps     =   78
            Caption         =   "Pesquisar considerando Ramo e Produto"
            ForeColor       =   8388608
            BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "MS Sans Serif"
               Size            =   8.26
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
         End
         Begin Threed.SSFrame fr3d_apo_aut 
            Height          =   795
            Left            =   120
            TabIndex        =   54
            Top             =   1620
            Visible         =   0   'False
            Width           =   7920
            _Version        =   65536
            _ExtentX        =   13970
            _ExtentY        =   1402
            _StockProps     =   14
            ForeColor       =   8388608
            BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Begin VB.TextBox tb_u_chs_aut 
               Appearance      =   0  'Flat
               BackColor       =   &H00FFFFFF&
               ForeColor       =   &H00800000&
               Height          =   285
               Left            =   120
               MaxLength       =   20
               TabIndex        =   10
               Top             =   400
               Width           =   2715
            End
            Begin VB.TextBox tb_u_plc_aut 
               Appearance      =   0  'Flat
               BackColor       =   &H00FFFFFF&
               ForeColor       =   &H00800000&
               Height          =   285
               Left            =   3075
               MaxLength       =   7
               TabIndex        =   11
               Top             =   400
               Width           =   990
            End
            Begin Threed.SSCommand Bu3d_chama_item 
               Height          =   495
               Left            =   6300
               TabIndex        =   72
               Top             =   210
               Width           =   1455
               _Version        =   65536
               _ExtentX        =   2566
               _ExtentY        =   873
               _StockProps     =   78
               Caption         =   "Consulta Itens"
               ForeColor       =   8388608
               Enabled         =   0   'False
               AutoSize        =   1
            End
            Begin VB.Label Lb_u_plc_aut 
               Appearance      =   0  'Flat
               AutoSize        =   -1  'True
               Caption         =   "Placa"
               ForeColor       =   &H00800000&
               Height          =   195
               Left            =   3075
               TabIndex        =   55
               Top             =   195
               Width           =   495
            End
            Begin VB.Label Lb_u_chs_aut 
               Appearance      =   0  'Flat
               AutoSize        =   -1  'True
               Caption         =   "Chassi"
               ForeColor       =   &H00800000&
               Height          =   195
               Left            =   120
               TabIndex        =   56
               Top             =   200
               Width           =   570
            End
         End
         Begin Threed.SSFrame fr3d_apo_rpm 
            Height          =   825
            Left            =   120
            TabIndex        =   25
            Top             =   1590
            Visible         =   0   'False
            Width           =   7890
            _Version        =   65536
            _ExtentX        =   13917
            _ExtentY        =   1455
            _StockProps     =   14
            Caption         =   "Endereço de Risco"
            ForeColor       =   8388608
            BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Begin VB.TextBox tb_uf 
               Appearance      =   0  'Flat
               BackColor       =   &H00FFFFFF&
               ForeColor       =   &H00800000&
               Height          =   285
               Left            =   5085
               MaxLength       =   2
               TabIndex        =   35
               Top             =   450
               Width           =   400
            End
            Begin VB.TextBox tb_n_cdd 
               Appearance      =   0  'Flat
               BackColor       =   &H00FFFFFF&
               ForeColor       =   &H00800000&
               Height          =   285
               Left            =   150
               MaxLength       =   40
               TabIndex        =   34
               ToolTipText     =   "Digite a CIDADE do local de risco."
               Top             =   450
               Width           =   4815
            End
            Begin VB.TextBox tb_u_lgd 
               Appearance      =   0  'Flat
               BackColor       =   &H00FFFFFF&
               ForeColor       =   &H00800000&
               Height          =   285
               Left            =   7080
               MaxLength       =   5
               TabIndex        =   37
               Top             =   450
               Width           =   700
            End
            Begin MSMask.MaskEdBox me_cep 
               Height          =   285
               Left            =   5790
               TabIndex        =   36
               Top             =   450
               Width           =   1150
               _ExtentX        =   2037
               _ExtentY        =   503
               _Version        =   393216
               BackColor       =   16777215
               ForeColor       =   8388608
               MaxLength       =   9
               Mask            =   "#####-###"
               PromptChar      =   "_"
            End
            Begin VB.Label lb_u_lgd 
               Appearance      =   0  'Flat
               AutoSize        =   -1  'True
               Caption         =   "Nr. Logr."
               ForeColor       =   &H00800000&
               Height          =   195
               Left            =   7005
               TabIndex        =   38
               Top             =   240
               Width           =   765
            End
            Begin VB.Label lb_n_cdd 
               Appearance      =   0  'Flat
               AutoSize        =   -1  'True
               Caption         =   "Cidade"
               ForeColor       =   &H00800000&
               Height          =   195
               Left            =   135
               TabIndex        =   39
               Top             =   240
               Width           =   600
            End
            Begin VB.Label lb_uf 
               Appearance      =   0  'Flat
               AutoSize        =   -1  'True
               Caption         =   "Estado"
               ForeColor       =   &H00800000&
               Height          =   195
               Left            =   5085
               TabIndex        =   52
               Top             =   240
               Width           =   600
            End
            Begin VB.Label lb_cep 
               Appearance      =   0  'Flat
               AutoSize        =   -1  'True
               Caption         =   "CEP"
               ForeColor       =   &H00800000&
               Height          =   195
               Left            =   5790
               TabIndex        =   53
               Top             =   240
               Width           =   375
            End
         End
         Begin VB.Label lb_u_niu 
            Appearance      =   0  'Flat
            AutoSize        =   -1  'True
            Caption         =   "Nº do Nius"
            ForeColor       =   &H00800000&
            Height          =   195
            Left            =   5040
            TabIndex        =   87
            Top             =   1100
            Visible         =   0   'False
            Width           =   930
         End
         Begin VB.Label lb_u_sav 
            Appearance      =   0  'Flat
            AutoSize        =   -1  'True
            Caption         =   "Nº do Sav"
            ForeColor       =   &H00800000&
            Height          =   195
            Left            =   3120
            TabIndex        =   86
            Top             =   1100
            Visible         =   0   'False
            Width           =   885
         End
         Begin VB.Label lb_u_cbn_sor 
            Appearance      =   0  'Flat
            AutoSize        =   -1  'True
            Caption         =   "Nº do Sorteio"
            ForeColor       =   &H00800000&
            Height          =   195
            Left            =   1800
            TabIndex        =   84
            Top             =   1100
            Visible         =   0   'False
            Width           =   1155
         End
         Begin VB.Label Lb_u_prp 
            Appearance      =   0  'Flat
            AutoSize        =   -1  'True
            Caption         =   "Proposta"
            ForeColor       =   &H00800000&
            Height          =   195
            Left            =   240
            TabIndex        =   57
            Top             =   1100
            Width           =   765
         End
         Begin VB.Label Lb_n_pes 
            Appearance      =   0  'Flat
            AutoSize        =   -1  'True
            Caption         =   "Segurado"
            ForeColor       =   &H00800000&
            Height          =   195
            Left            =   240
            TabIndex        =   58
            Top             =   555
            Width           =   825
         End
      End
      Begin Threed.SSFrame fr3d_Por_Apolice 
         Height          =   1005
         Left            =   90
         TabIndex        =   62
         Top             =   210
         Width           =   8115
         _Version        =   65536
         _ExtentX        =   14314
         _ExtentY        =   1773
         _StockProps     =   14
         Caption         =   "Por Nº de Apólice"
         ForeColor       =   8388608
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Begin VB.TextBox tb_c_Cia_ita 
            Appearance      =   0  'Flat
            BackColor       =   &H00FFFFFF&
            ForeColor       =   &H00800000&
            Height          =   285
            Left            =   240
            MaxLength       =   2
            TabIndex        =   0
            Top             =   600
            Width           =   420
         End
         Begin VB.TextBox tb_c_Rmo 
            Appearance      =   0  'Flat
            BackColor       =   &H00FFFFFF&
            ForeColor       =   &H00800000&
            Height          =   285
            Left            =   750
            MaxLength       =   2
            TabIndex        =   1
            Top             =   600
            Width           =   510
         End
         Begin VB.TextBox tb_u_Apo_Pnc 
            Appearance      =   0  'Flat
            BackColor       =   &H00FFFFFF&
            ForeColor       =   &H00800000&
            Height          =   285
            Left            =   1380
            MaxLength       =   9
            TabIndex        =   2
            Top             =   600
            Width           =   1350
         End
         Begin VB.TextBox tb_u_Apo_Dpd 
            Appearance      =   0  'Flat
            BackColor       =   &H00FFFFFF&
            ForeColor       =   &H00800000&
            Height          =   285
            Left            =   2820
            MaxLength       =   7
            TabIndex        =   3
            Top             =   600
            Width           =   990
         End
         Begin VB.TextBox tb_u_adi 
            Appearance      =   0  'Flat
            BackColor       =   &H00FFFFFF&
            ForeColor       =   &H00800000&
            Height          =   285
            Left            =   3960
            MaxLength       =   7
            TabIndex        =   4
            Top             =   600
            Width           =   1035
         End
         Begin Threed.SSCheck ch3d_apo_escr 
            Height          =   285
            Left            =   6150
            TabIndex        =   5
            Top             =   240
            Width           =   1845
            _Version        =   65536
            _ExtentX        =   3254
            _ExtentY        =   503
            _StockProps     =   78
            Caption         =   "Apólice Escritural"
            ForeColor       =   8388608
            BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
         End
         Begin VB.Label lb_c_isg 
            Appearance      =   0  'Flat
            BackColor       =   &H00FFFFFF&
            BorderStyle     =   1  'Fixed Single
            ForeColor       =   &H00800000&
            Height          =   285
            Left            =   5130
            TabIndex        =   70
            Top             =   600
            Width           =   1155
         End
         Begin VB.Label lb_c_isg_na 
            Appearance      =   0  'Flat
            AutoSize        =   -1  'True
            Caption         =   "Item"
            ForeColor       =   &H00800000&
            Height          =   195
            Left            =   5160
            TabIndex        =   69
            Top             =   360
            Width           =   375
         End
         Begin VB.Label Lb_u_adi 
            Appearance      =   0  'Flat
            AutoSize        =   -1  'True
            Caption         =   "Aditamento"
            ForeColor       =   &H00800000&
            Height          =   195
            Left            =   3990
            TabIndex        =   59
            Top             =   360
            Width           =   960
         End
         Begin VB.Label Lb_u_apo_dpd 
            Appearance      =   0  'Flat
            Caption         =   "   Apólice Dependente"
            ForeColor       =   &H00800000&
            Height          =   390
            Left            =   2820
            TabIndex        =   60
            Top             =   195
            Width           =   1095
         End
         Begin VB.Label Lb_u_apo_pnc 
            Appearance      =   0  'Flat
            Caption         =   " Apólice Principal"
            ForeColor       =   &H00800000&
            Height          =   420
            Left            =   1470
            TabIndex        =   61
            Top             =   195
            Width           =   795
         End
         Begin VB.Label Lb_c_rmo 
            Appearance      =   0  'Flat
            AutoSize        =   -1  'True
            Caption         =   "Ramo"
            ForeColor       =   &H00800000&
            Height          =   195
            Left            =   750
            TabIndex        =   64
            Top             =   360
            Width           =   495
         End
         Begin VB.Label Lb_c_cia_ita 
            Appearance      =   0  'Flat
            AutoSize        =   -1  'True
            Caption         =   "Cia."
            ForeColor       =   &H00800000&
            Height          =   195
            Left            =   255
            TabIndex        =   63
            Top             =   360
            Width           =   345
         End
      End
      Begin Threed.SSFrame FR3D_U_APO_MFR 
         Height          =   855
         Left            =   90
         TabIndex        =   67
         Top             =   1230
         Width           =   8115
         _Version        =   65536
         _ExtentX        =   14314
         _ExtentY        =   1508
         _StockProps     =   14
         Caption         =   "Por Nº Apólice do Mainframe ou Migração ( Banerj / AGF / Gralha - BCL / Itauprev )"
         ForeColor       =   8388608
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Begin Threed.SSPanel Pa3d_UBB 
            Height          =   555
            Left            =   2160
            TabIndex        =   129
            Top             =   0
            Visible         =   0   'False
            Width           =   2400
            _Version        =   65536
            _ExtentX        =   4233
            _ExtentY        =   979
            _StockProps     =   15
            BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Begin VB.TextBox TB_APO_UBB 
               Appearance      =   0  'Flat
               BackColor       =   &H00FFFFFF&
               ForeColor       =   &H00800000&
               Height          =   285
               Left            =   285
               MaxLength       =   10
               TabIndex        =   130
               Top             =   225
               Width           =   1860
            End
            Begin VB.Label Label1 
               Appearance      =   0  'Flat
               AutoSize        =   -1  'True
               Caption         =   "Apólice UBB"
               ForeColor       =   &H00800000&
               Height          =   195
               Left            =   240
               TabIndex        =   131
               Top             =   0
               Width           =   1080
            End
         End
         Begin Threed.SSPanel Pa3d_UBBVidaPJ 
            Height          =   555
            Left            =   2160
            TabIndex        =   120
            Top             =   240
            Visible         =   0   'False
            Width           =   6120
            _Version        =   65536
            _ExtentX        =   10795
            _ExtentY        =   979
            _StockProps     =   15
            BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Begin VB.TextBox TB_C_SUC_UBB 
               Alignment       =   2  'Center
               Appearance      =   0  'Flat
               BackColor       =   &H00FFFFFF&
               ForeColor       =   &H00800000&
               Height          =   285
               Left            =   285
               MaxLength       =   2
               TabIndex        =   121
               Top             =   225
               Width           =   300
            End
            Begin VB.TextBox TB_RMO_UBB 
               Alignment       =   2  'Center
               Appearance      =   0  'Flat
               BackColor       =   &H00FFFFFF&
               ForeColor       =   &H00800000&
               Height          =   285
               Left            =   885
               MaxLength       =   2
               TabIndex        =   122
               Top             =   225
               Width           =   450
            End
            Begin VB.TextBox TB_SGR_UBB 
               Appearance      =   0  'Flat
               BackColor       =   &H00FFFFFF&
               ForeColor       =   &H00800000&
               Height          =   285
               Left            =   2805
               MaxLength       =   7
               TabIndex        =   126
               Top             =   225
               Width           =   1215
            End
            Begin VB.TextBox TB_U_APO_UBB 
               Appearance      =   0  'Flat
               BackColor       =   &H00FFFFFF&
               ForeColor       =   &H00800000&
               Height          =   285
               Left            =   1540
               MaxLength       =   9
               TabIndex        =   124
               Top             =   225
               Width           =   1070
            End
            Begin VB.Label lb_c_suc_ubb 
               Appearance      =   0  'Flat
               AutoSize        =   -1  'True
               Caption         =   "Filial"
               ForeColor       =   &H00800000&
               Height          =   195
               Left            =   240
               TabIndex        =   128
               Top             =   0
               Width           =   405
            End
            Begin VB.Label lb_c_rmo_ubb 
               Appearance      =   0  'Flat
               AutoSize        =   -1  'True
               Caption         =   "Ramo"
               ForeColor       =   &H00800000&
               Height          =   195
               Left            =   885
               TabIndex        =   127
               Top             =   0
               Width           =   495
            End
            Begin VB.Label lb_sgr_ubb 
               Appearance      =   0  'Flat
               Caption         =   "SubGrupo"
               ForeColor       =   &H00800000&
               Height          =   240
               Left            =   3000
               TabIndex        =   125
               Top             =   0
               Width           =   885
            End
            Begin VB.Label lb_u_apo_ubb 
               Appearance      =   0  'Flat
               Caption         =   " Apólice"
               ForeColor       =   &H00800000&
               Height          =   255
               Left            =   1680
               TabIndex        =   123
               Top             =   0
               Width           =   795
            End
         End
         Begin Threed.SSPanel pa3d_ItauSeguros 
            Height          =   225
            Left            =   2880
            TabIndex        =   115
            Top             =   240
            Visible         =   0   'False
            Width           =   1515
            _Version        =   65536
            _ExtentX        =   2672
            _ExtentY        =   397
            _StockProps     =   15
            BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Begin VB.TextBox TB_C_T_NEG 
               Alignment       =   2  'Center
               Appearance      =   0  'Flat
               BackColor       =   &H00FFFFFF&
               ForeColor       =   &H00800000&
               Height          =   285
               Left            =   285
               MaxLength       =   1
               TabIndex        =   111
               Top             =   225
               Width           =   300
            End
            Begin VB.TextBox TB_RMO_MFR 
               Alignment       =   2  'Center
               Appearance      =   0  'Flat
               BackColor       =   &H00FFFFFF&
               ForeColor       =   &H00800000&
               Height          =   285
               Left            =   885
               MaxLength       =   2
               TabIndex        =   112
               Top             =   225
               Width           =   450
            End
            Begin VB.TextBox TB_ISG_MFR 
               Appearance      =   0  'Flat
               BackColor       =   &H00FFFFFF&
               ForeColor       =   &H00800000&
               Height          =   285
               Left            =   2805
               MaxLength       =   10
               TabIndex        =   114
               Top             =   225
               Width           =   1215
            End
            Begin VB.TextBox TB_U_APO_MFR 
               Appearance      =   0  'Flat
               BackColor       =   &H00FFFFFF&
               ForeColor       =   &H00800000&
               Height          =   285
               Left            =   1540
               MaxLength       =   9
               TabIndex        =   113
               Top             =   225
               Width           =   1070
            End
            Begin VB.Label LB_C_T_NEG 
               Appearance      =   0  'Flat
               AutoSize        =   -1  'True
               Caption         =   "Negócio"
               ForeColor       =   &H00800000&
               Height          =   195
               Left            =   120
               TabIndex        =   119
               Top             =   0
               Width           =   720
            End
            Begin VB.Label LB_RMO_MFR 
               Appearance      =   0  'Flat
               AutoSize        =   -1  'True
               Caption         =   "Ramo"
               ForeColor       =   &H00800000&
               Height          =   195
               Left            =   885
               TabIndex        =   118
               Top             =   0
               Width           =   495
            End
            Begin VB.Label LB_ISG_MFR 
               Appearance      =   0  'Flat
               Caption         =   "Item"
               ForeColor       =   &H00800000&
               Height          =   240
               Left            =   3135
               TabIndex        =   117
               Top             =   0
               Width           =   525
            End
            Begin VB.Label LB_U_APO_MFR 
               Appearance      =   0  'Flat
               Caption         =   " Apólice"
               ForeColor       =   &H00800000&
               Height          =   255
               Left            =   1680
               TabIndex        =   116
               Top             =   0
               Width           =   795
            End
         End
         Begin Threed.SSPanel pa3d_Itauprev 
            Height          =   225
            Left            =   5280
            TabIndex        =   89
            Top             =   540
            Visible         =   0   'False
            Width           =   2730
            _Version        =   65536
            _ExtentX        =   4815
            _ExtentY        =   397
            _StockProps     =   15
            BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Begin VB.TextBox tb_c_pro_itp 
               Appearance      =   0  'Flat
               BackColor       =   &H00FFFFFF&
               ForeColor       =   &H00800000&
               Height          =   285
               Left            =   150
               MaxLength       =   4
               TabIndex        =   90
               Top             =   225
               Width           =   525
            End
            Begin VB.TextBox tb_u_apo_itp 
               Appearance      =   0  'Flat
               BackColor       =   &H00FFFFFF&
               ForeColor       =   &H00800000&
               Height          =   285
               Left            =   1005
               MaxLength       =   9
               TabIndex        =   92
               Text            =   "123456789"
               Top             =   225
               Width           =   1095
            End
            Begin VB.Label lb_Label 
               Appearance      =   0  'Flat
               AutoSize        =   -1  'True
               Caption         =   "Produto"
               ForeColor       =   &H00800000&
               Height          =   195
               Index           =   4
               Left            =   105
               TabIndex        =   93
               Top             =   0
               Width           =   675
            End
            Begin VB.Label lb_Label 
               Appearance      =   0  'Flat
               AutoSize        =   -1  'True
               Caption         =   "Apólice Itauprev"
               ForeColor       =   &H00800000&
               Height          =   195
               Index           =   5
               Left            =   870
               TabIndex        =   91
               Top             =   0
               Width           =   1410
            End
         End
         Begin Threed.SSPanel pa3d_Banerj 
            Height          =   210
            Left            =   2880
            TabIndex        =   97
            Top             =   570
            Visible         =   0   'False
            Width           =   2175
            _Version        =   65536
            _ExtentX        =   3836
            _ExtentY        =   370
            _StockProps     =   15
            BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "MS Sans Serif"
               Size            =   9.74
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Begin VB.TextBox tb_isg_bnj 
               Appearance      =   0  'Flat
               BackColor       =   &H00FFFFFF&
               ForeColor       =   &H00800000&
               Height          =   285
               Left            =   3300
               MaxLength       =   10
               TabIndex        =   104
               Top             =   225
               Width           =   1215
            End
            Begin VB.TextBox tb_u_apo_bnj 
               Appearance      =   0  'Flat
               BackColor       =   &H00FFFFFF&
               ForeColor       =   &H00800000&
               Height          =   285
               Left            =   2100
               MaxLength       =   9
               TabIndex        =   103
               Top             =   225
               Width           =   1050
            End
            Begin VB.TextBox tb_c_suc_bnj 
               Appearance      =   0  'Flat
               BackColor       =   &H00FFFFFF&
               ForeColor       =   &H00800000&
               Height          =   285
               Left            =   810
               MaxLength       =   2
               TabIndex        =   101
               Top             =   225
               Width           =   390
            End
            Begin VB.TextBox tb_e_doc_bnj 
               Appearance      =   0  'Flat
               BackColor       =   &H00FFFFFF&
               ForeColor       =   &H00800000&
               Height          =   285
               Left            =   1500
               MaxLength       =   1
               TabIndex        =   102
               Top             =   225
               Width           =   390
            End
            Begin VB.TextBox tb_c_rmo_bnj 
               Appearance      =   0  'Flat
               BackColor       =   &H00FFFFFF&
               ForeColor       =   &H00800000&
               Height          =   285
               Left            =   180
               MaxLength       =   2
               TabIndex        =   100
               Top             =   225
               Width           =   390
            End
            Begin VB.Label lb_isg_bnj 
               Appearance      =   0  'Flat
               Caption         =   "Item"
               ForeColor       =   &H00800000&
               Height          =   240
               Left            =   3630
               TabIndex        =   110
               Top             =   0
               Width           =   525
            End
            Begin VB.Label lb_u_apo_bnj 
               Appearance      =   0  'Flat
               Caption         =   " Apólice"
               ForeColor       =   &H00800000&
               Height          =   255
               Left            =   2175
               TabIndex        =   109
               Top             =   0
               Width           =   795
            End
            Begin VB.Label lb_e_doc_bnj 
               Appearance      =   0  'Flat
               AutoSize        =   -1  'True
               Caption         =   "T.Doc."
               ForeColor       =   &H00800000&
               Height          =   195
               Left            =   1530
               TabIndex        =   105
               Top             =   0
               Width           =   600
            End
            Begin VB.Label lb_c_suc_bnj 
               Appearance      =   0  'Flat
               AutoSize        =   -1  'True
               Caption         =   "Sucursal"
               ForeColor       =   &H00800000&
               Height          =   195
               Left            =   690
               TabIndex        =   99
               Top             =   0
               Width           =   750
            End
            Begin VB.Label lb_c_rmo_bnj 
               Appearance      =   0  'Flat
               AutoSize        =   -1  'True
               Caption         =   "Ramo"
               ForeColor       =   &H00800000&
               Height          =   195
               Left            =   90
               TabIndex        =   98
               Top             =   0
               Width           =   495
            End
         End
         Begin Threed.SSPanel pa3d_AGF 
            Height          =   225
            Left            =   4470
            TabIndex        =   94
            Top             =   240
            Visible         =   0   'False
            Width           =   1875
            _Version        =   65536
            _ExtentX        =   3307
            _ExtentY        =   397
            _StockProps     =   15
            BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "MS Sans Serif"
               Size            =   9.75
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Begin VB.OptionButton opt_c_af 
               Caption         =   "Com"
               ForeColor       =   &H00800000&
               Height          =   225
               Left            =   2880
               TabIndex        =   108
               Top             =   225
               Width           =   855
            End
            Begin VB.OptionButton opt_s_af 
               Caption         =   "Sem"
               ForeColor       =   &H00800000&
               Height          =   225
               Left            =   3705
               TabIndex        =   107
               Top             =   225
               Width           =   735
            End
            Begin VB.TextBox TB_U_APO_AGF 
               Appearance      =   0  'Flat
               BackColor       =   &H00FFFFFF&
               ForeColor       =   &H00800000&
               Height          =   285
               Left            =   240
               MaxLength       =   15
               TabIndex        =   96
               Top             =   225
               Width           =   2295
            End
            Begin VB.Label lb_a_f 
               Appearance      =   0  'Flat
               Caption         =   "Assistência Funeral"
               ForeColor       =   &H00800000&
               Height          =   240
               Left            =   2910
               TabIndex        =   106
               Top             =   0
               Width           =   1665
            End
            Begin VB.Label LB_U_APO_AGF 
               Appearance      =   0  'Flat
               AutoSize        =   -1  'True
               Caption         =   "nº da apólice AGF"
               ForeColor       =   &H00800000&
               Height          =   195
               Left            =   270
               TabIndex        =   95
               Top             =   0
               Width           =   1560
            End
         End
         Begin Threed.SSPanel pa3d_GralhaAzulBCL 
            Height          =   210
            Left            =   6510
            TabIndex        =   74
            Top             =   270
            Visible         =   0   'False
            Width           =   1470
            _Version        =   65536
            _ExtentX        =   2593
            _ExtentY        =   370
            _StockProps     =   15
            BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "MS Sans Serif"
               Size            =   9.74
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Begin VB.TextBox tb_Certificado 
               Appearance      =   0  'Flat
               BackColor       =   &H00FFFFFF&
               ForeColor       =   &H00800000&
               Height          =   285
               Left            =   1665
               MaxLength       =   7
               TabIndex        =   77
               Top             =   240
               Width           =   950
            End
            Begin VB.TextBox tb_SubEstipulante 
               Appearance      =   0  'Flat
               BackColor       =   &H00FFFFFF&
               ForeColor       =   &H00800000&
               Height          =   285
               Left            =   60
               MaxLength       =   5
               TabIndex        =   75
               Top             =   225
               Width           =   765
            End
            Begin VB.Label lb_Label 
               Appearance      =   0  'Flat
               AutoSize        =   -1  'True
               Caption         =   "Certificado"
               ForeColor       =   &H00800000&
               Height          =   195
               Index           =   1
               Left            =   1680
               TabIndex        =   78
               Top             =   15
               Width           =   930
            End
            Begin VB.Label lb_Label 
               Appearance      =   0  'Flat
               AutoSize        =   -1  'True
               Caption         =   "Ag. Banestado"
               ForeColor       =   &H00800000&
               Height          =   195
               Index           =   0
               Left            =   90
               TabIndex        =   76
               Top             =   0
               Width           =   1260
            End
         End
         Begin VB.ComboBox cb_c_cia_ita 
            Appearance      =   0  'Flat
            BackColor       =   &H00FFFFFF&
            Enabled         =   0   'False
            BeginProperty Font 
               Name            =   "Courier New"
               Size            =   8.25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00800000&
            Height          =   330
            Left            =   120
            Style           =   2  'Dropdown List
            TabIndex        =   71
            Top             =   450
            Width           =   2925
         End
      End
   End
   Begin Threed.SSFrame fr3d_isg 
      Height          =   4665
      Left            =   45
      TabIndex        =   48
      Top             =   1200
      Visible         =   0   'False
      Width           =   8265
      _Version        =   65536
      _ExtentX        =   14579
      _ExtentY        =   8229
      _StockProps     =   14
      Caption         =   "Item Segurado"
      ForeColor       =   8388608
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Begin VB.ListBox li_isg 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00800000&
         Height          =   3810
         Left            =   90
         TabIndex        =   49
         Top             =   675
         Width           =   8115
      End
      Begin VB.Label lb_apolice2 
         Appearance      =   0  'Flat
         Caption         =   "Número da Apólice"
         ForeColor       =   &H00800000&
         Height          =   255
         Left            =   3015
         TabIndex        =   51
         Top             =   225
         Width           =   1695
      End
      Begin VB.Label lb_apolice3 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         ForeColor       =   &H00800000&
         Height          =   255
         Left            =   4740
         TabIndex        =   50
         Top             =   225
         Width           =   3435
      End
   End
   Begin Threed.SSFrame fr3d_Apolices 
      Height          =   4575
      Left            =   45
      TabIndex        =   21
      Top             =   1035
      Visible         =   0   'False
      Width           =   8235
      _Version        =   65536
      _ExtentX        =   14526
      _ExtentY        =   8070
      _StockProps     =   14
      Caption         =   "Apólices/Produto"
      ForeColor       =   8388608
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Begin MSGrid.Grid gr_apo 
         Height          =   3285
         Left            =   150
         TabIndex        =   29
         Top             =   1110
         Width           =   7860
         _Version        =   65536
         _ExtentX        =   13864
         _ExtentY        =   5794
         _StockProps     =   77
         ForeColor       =   8388608
         BackColor       =   16777215
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Cols            =   6
         FixedCols       =   0
         HighLight       =   0   'False
         MouseIcon       =   "R1FAB001.frx":2B30
      End
      Begin VB.Label lb_gr_u_lgd2 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BorderStyle     =   1  'Fixed Single
         ForeColor       =   &H00800000&
         Height          =   255
         Left            =   7245
         TabIndex        =   44
         Top             =   660
         Width           =   750
      End
      Begin VB.Label lb_gr_cep2 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BorderStyle     =   1  'Fixed Single
         ForeColor       =   &H00800000&
         Height          =   255
         Left            =   6180
         TabIndex        =   47
         Top             =   660
         Width           =   1005
      End
      Begin VB.Label lb_gr_c_uf2 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BorderStyle     =   1  'Fixed Single
         ForeColor       =   &H00800000&
         Height          =   255
         Left            =   5490
         TabIndex        =   46
         Top             =   675
         Width           =   615
      End
      Begin VB.Label lb_por_familia2 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         BorderStyle     =   1  'Fixed Single
         ForeColor       =   &H00800000&
         Height          =   255
         Left            =   120
         TabIndex        =   45
         Top             =   675
         Width           =   5265
      End
      Begin VB.Label lb_gr_u_lgd1 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         Caption         =   "Nr. Logr."
         ForeColor       =   &H00800000&
         Height          =   195
         Left            =   7215
         TabIndex        =   40
         Top             =   390
         Width           =   765
      End
      Begin VB.Label lb_por_familia1 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         Caption         =   "Campo especifico por familia"
         ForeColor       =   &H00800000&
         Height          =   195
         Left            =   120
         TabIndex        =   41
         Top             =   480
         Width           =   2445
      End
      Begin VB.Label lb_gr_c_uf1 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         Caption         =   "Estado"
         ForeColor       =   &H00800000&
         Height          =   195
         Left            =   5475
         TabIndex        =   42
         Top             =   345
         Width           =   600
      End
      Begin VB.Label lb_gr_cep1 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         Caption         =   "CEP"
         ForeColor       =   &H00800000&
         Height          =   195
         Left            =   6240
         TabIndex        =   43
         Top             =   360
         Width           =   375
      End
   End
   Begin Threed.SSFrame fr3d_Aditamento 
      Height          =   4695
      Left            =   45
      TabIndex        =   26
      Top             =   810
      Visible         =   0   'False
      Width           =   8235
      _Version        =   65536
      _ExtentX        =   14526
      _ExtentY        =   8281
      _StockProps     =   14
      Caption         =   "Aditamentos"
      ForeColor       =   8388608
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Begin VB.ListBox li_aditamentos 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00800000&
         Height          =   3810
         Left            =   120
         TabIndex        =   27
         Top             =   500
         Width           =   7920
      End
      Begin VB.Label lb_apolice1 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         ForeColor       =   &H00800000&
         Height          =   255
         Left            =   5430
         TabIndex        =   31
         Top             =   195
         Width           =   2565
      End
      Begin VB.Label lb_apolice 
         Appearance      =   0  'Flat
         Caption         =   "Número da Apólice"
         ForeColor       =   &H00800000&
         Height          =   255
         Left            =   3660
         TabIndex        =   30
         Top             =   180
         Width           =   1695
      End
   End
   Begin Threed.SSFrame fr3d_Homonimo 
      Height          =   4695
      Left            =   90
      TabIndex        =   22
      Top             =   900
      Visible         =   0   'False
      Width           =   8250
      _Version        =   65536
      _ExtentX        =   14552
      _ExtentY        =   8281
      _StockProps     =   14
      Caption         =   "Homônimos"
      ForeColor       =   8388608
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Begin VB.ListBox li_Homonimo 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00800000&
         Height          =   3390
         Left            =   120
         TabIndex        =   16
         Top             =   900
         Width           =   7590
      End
      Begin Threed.SSCommand bu3d_prx_hmn 
         Height          =   375
         Left            =   120
         TabIndex        =   65
         Top             =   420
         Width           =   2955
         _Version        =   65536
         _ExtentX        =   5212
         _ExtentY        =   661
         _StockProps     =   78
         Caption         =   "Pesquisa demais homônimos"
         ForeColor       =   8388608
         Outline         =   0   'False
         AutoSize        =   1
      End
      Begin Threed.SSCommand bu3d_prx_hmn_t 
         Height          =   1035
         Left            =   7725
         TabIndex        =   33
         Top             =   900
         Visible         =   0   'False
         Width           =   495
         _Version        =   65536
         _ExtentX        =   873
         _ExtentY        =   1826
         _StockProps     =   78
         ForeColor       =   8388608
         Enabled         =   0   'False
         Outline         =   0   'False
         AutoSize        =   1
         Picture         =   "R1FAB001.frx":2B4C
      End
      Begin Threed.SSCommand bu3d_rto_hmn 
         Height          =   975
         Left            =   7740
         TabIndex        =   32
         Top             =   900
         Visible         =   0   'False
         Width           =   495
         _Version        =   65536
         _ExtentX        =   873
         _ExtentY        =   1720
         _StockProps     =   78
         ForeColor       =   8388608
         Enabled         =   0   'False
         Outline         =   0   'False
         AutoSize        =   1
         Picture         =   "R1FAB001.frx":2E66
      End
   End
   Begin Threed.SSFrame fra_Apolice 
      Height          =   4665
      Left            =   45
      TabIndex        =   79
      Top             =   2925
      Visible         =   0   'False
      Width           =   8280
      _Version        =   65536
      _ExtentX        =   14605
      _ExtentY        =   8229
      _StockProps     =   14
      Caption         =   "Apólices"
      ForeColor       =   8388608
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Begin MSFlexGridLib.MSFlexGrid gr_Apolice 
         Height          =   4020
         Left            =   135
         TabIndex        =   82
         Top             =   540
         Width           =   8070
         _ExtentX        =   14235
         _ExtentY        =   7091
         _Version        =   393216
         Cols            =   6
         FixedCols       =   0
         ForeColor       =   8388608
         ForeColorFixed  =   -2147483635
         BackColorBkg    =   16777215
         FormatString    =   $"R1FAB001.frx":3180
      End
      Begin VB.Label lb_Label 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         ForeColor       =   &H00800000&
         Height          =   255
         Index           =   3
         Left            =   4875
         TabIndex        =   81
         Top             =   225
         Width           =   3315
      End
      Begin VB.Label lb_Label 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         Caption         =   "Número do documento informado"
         ForeColor       =   &H00800000&
         Height          =   195
         Index           =   2
         Left            =   1905
         TabIndex        =   80
         Top             =   225
         Width           =   2805
      End
   End
   Begin VB.Label Lb_marc 
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      Caption         =   "Marca"
      ForeColor       =   &H00800000&
      Height          =   195
      Left            =   0
      TabIndex        =   28
      Top             =   0
      Width           =   540
   End
End
Attribute VB_Name = "R1FAB001"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'+---------------------------------------------------------------------------+
'| Versão:      62                                                           |
'| Alteração:   SS 17247 Campanha carro reserva para correntista             |
'| Autor:       Adelamg                                                      |
'| Data:        05/04/2007                                                   |
'+---------------------------------------------------------------------------+
'| Versão:      63                                                           |
'| Alteração:   SS 28668 Acerto do critério carro reserva para correntista   |
'| Autor:       Adelamg                                                      |
'| Data:        13/08/2007                                                   |
'+---------------------------------------------------------------------------+
'| Versão:      66                                                           |
'| Alteração:   SS 38728 Acerto na consulta despacho informado               |
'| Autor:       Sansouz                                                      |
'| Data:        12/12/2007                                                   |
'+---------------------------------------------------------------------------+
'| Versão:      68                                                           |
'| SS:          SS_42262 Migração Itauprev                                   |
'| Alteração:   Tratar tipo de migração para apresentar que a apólice foi    |
'|              migrada da Itauprev.                                         |
'| Autor:       Emiliol                                                      |
'| Data:        19/05/2008                                                   |
'+---------------------------------------------------------------------------+
'| Versão:      69                                                           |
'| SS:          SS_42262 Migração Itauprev                                   |
'| Alteração:   Alterar e_mig de 9 para 10.                                  |
'| Autor:       Emiliol                                                      |
'| Data:        18/06/2008                                                   |
'+---------------------------------------------------------------------------+
'| Versão:      73                                                           |
'| SS:          SS_42262 Migração Itauprev                                   |
'| Alteração:   Incluir novos domínios do e_mig 11 e 12.                     |
'| Autor:       Emiliol                                                      |
'| Data:        30/09/2008                                                   |
'+---------------------------------------------------------------------------+

Option Explicit
    
Dim e_osg_aux               As String
Dim Param                   As String
Dim i_PesquisaLocal         As Boolean 'Pereira 18/08/2003 --> utilizado na pesquisa por local

'               *****   Paulo

Public pintTipoSelecao         As Integer

Private Sub Su_PorNroNiu()

    Dim i As Integer
    
    ' através do número do Nius seleciona dados da apólice
    If Not Fu_Sel_Niu_Apolice() Then
        Screen.MousePointer = DEFAULT
        MsgBox "Não encontrou Apólice Emitida para o Número Nius Informado!", MB_ICONINFORMATION, txt_msg$
        su_habilita_botao bu3d_ok, True
        su_posiciona_foco tb_u_niu
        Exit Sub
    End If
    
    c_agr_fam_pro$ = dad_apo(i%).c_agr_fam_pro$
    e_fam_pro$ = dad_apo(i%).e_fam_pro$
    u_apo_pnc_ant$ = Empty
    
    Me.Caption = "Consulta Apólice"
    
'*******************************************************
'   Alteração realizada por Opus em 13/01/1999.        *
'   Motivo: run time error no VB5.                     *
'                                                      *
'   Solução: definição da propriedade Visible = True   *
'*******************************************************
    tb_u_niu.Visible = True
    su_Dados_Aditamento tb_u_niu, "Nius sem aditamentos", 9

End Sub

Private Sub su_PorNroSav()
    Dim i As Integer
    
    ' através do número do Sav seleciona dados da apólice
    ' na dbnprod..tb_ctl_emi_sav
    If Not fu_sel_sav_apolice() Then
        Screen.MousePointer = DEFAULT
        MsgBox "Número do Sav não Encontrado!", MB_ICONINFORMATION, txt_msg$
        su_habilita_botao bu3d_ok, True
        su_posiciona_foco tb_u_sav
        Exit Sub
    End If
    
    c_agr_fam_pro$ = dad_apo(i%).c_agr_fam_pro$
    e_fam_pro$ = dad_apo(i%).e_fam_pro$
    u_apo_pnc_ant$ = Empty
    
    Me.Caption = "Consulta Apólice"
    
'*******************************************************
'   Alteração realizada por Opus em 13/01/1999.        *
'   Motivo: run time error no VB5.                     *
'                                                      *
'   Solução: definição da propriedade Visible = True   *
'*******************************************************
    tb_u_sav.Visible = True
    su_Dados_Aditamento tb_u_sav, "Sav sem aditamentos", 9

End Sub

Private Sub su_PorNroSorteio()

    Dim i As Integer
    
    ' através do número do sorteio seleciona dados da apólice
    ' na dbnprod..tb_tit_cpz
    If Not fu_sel_tit_cpz_apolice() Then
        Screen.MousePointer = DEFAULT
        MsgBox "Número do Sorteio não Encontrado!", MB_ICONINFORMATION, txt_msg$
        su_habilita_botao bu3d_ok, True
        su_posiciona_foco tb_u_cbn_sor
        Exit Sub
    End If
    
    c_agr_fam_pro$ = dad_apo(i%).c_agr_fam_pro$
    e_fam_pro$ = dad_apo(i%).e_fam_pro$
    u_apo_pnc_ant$ = Empty
    
    Me.Caption = "Consulta Apólice"
    
'*******************************************************
'   Alteração realizada por Opus em 13/01/1999.        *
'   Motivo: run time error no VB5.                     *
'                                                      *
'   Solução: definição da propriedade Visible = True   *
'*******************************************************
    tb_u_cbn_sor.Visible = True
    su_Dados_Aditamento tb_u_cbn_sor, "Título sem aditamentos", 4

End Sub

Private Sub bu3d_cancela_Click()
    
    'Valdemir - 22/01/2002
    If Not fr3d_Segurado.Visible And Not fr3d_Homonimo.Visible Then
        R1FAB001.fr3d_Homonimo.Visible = True
    End If
  
    ' inicializa controles e variáveis
    su_inicializa_campos True
    
    If fr3d_Segurado.Visible Then
        
        If Trim$(tb_c_Rmo.Text) <> Empty Then
            tb_c_Rmo.SetFocus
        Else
            tb_c_Cia_ita.SetFocus
        End If

    End If
    
    ' limpa as variáveis utilizadas na fonetização
    su_limpa_var_fonet

    'Valdemir - 22/01/2002
    acesso% = 0
    
End Sub

Private Sub BU3D_Cancela_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    
    PA3D_Status.Caption = "R1FAB001 - Cancela Dados da Pesquisa"

End Sub

Private Sub Bu3d_chama_item_Click()

    CONSULTA_POR_ITEM% = True
    bu3d_ok_click

End Sub

Private Sub bu3d_cons_bd_rgd_Click()

    'Fecha conexão
    su_fecha_conexao
    
    'Efetua a chamada do projeto de consulta a base de dados reorganizada

    'v60 Emilio 22/08/2006 - início
    'Obs.: Migração XP para novo catalogador - Função descontinuada
    'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
'    '====================================================================
'    'LUCIANE - 05/07/1999
'    If OSAmbiente = "Windows 3.11" Then
'        ret% = FU_Monitora_Exec(Me, "R1PABH01.EXE ")
'    Else
'        ret% = FU_Monitora_Exe(Me, CG_DIR_EXE1$ + "R1PABH01.EXE ", MinEnableFalse%)
'    End If
    ret% = FU_MonitoraExe(Me, "", "R1PABH01.EXE", "", , MinEnableFalse%)
    'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    'v60 Emilio 22/08/2006 - fim
    
    If Not ret% Then
        Screen.MousePointer = DEFAULT
        MsgBox "Não foi possível executar o projeto." & Chr(13) & "Consulta à Base de Dados Reorganizada.", 48
        SqlConn% = FU_Conecta_Servidor(Servidor_Id%)
        Exit Sub
    End If

    'If Not FU_Monitora_Exec(Me, "R1PABH01.EXE ") Then
    '    screen.MousePointer = DEFAULT
    '    MsgBox "Não foi possível executar o projeto." & Chr(13) & "Consulta à Base de Dados Reorganizada.", 48
    '    Sqlconn% = FU_Conecta_Servidor(servidor_id%)
    '    Exit Sub
    'End If

    'LUCIANE - 05/07/1999
    '======================================================================
    
    'Efetua nova conexão
    SqlConn% = FU_Conecta_Servidor(Servidor_Id%)
    
    Me.Show

End Sub

Private Sub bu3d_cons_bd_rgd_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)

    PA3D_Status.Caption = "R1FAB001 - Consulta Histórico de Apólices."

End Sub

Private Sub bu3d_ok_click()
    
    i_PesquisaLocal = False 'Pereira 18/08/2003 Iniciaiza a variavel
    
    'Informados os dados, pesquisa de acordo c/ acesso definido
        
    If bg_click Then
    
        Screen.MousePointer = HOURGLASS
    
        'Alimenta e_fam_pro, c_agr_fam_pro e c_pro com conteudo do command
        If Not fu_separa_param1(Command$) Then
            MsgBox "Erro na passagem de parâmetros.", 48
            End
        End If
        
        'c_agr_fam_pro$ = c_agr_fam_pro_input$
        
        su_TipoPesquisa
    
        su_habilita_botao bu3d_ok, False
    
        'acesso% = 0 -> pesquisa por número da apólice
        If acesso% = 0 Then
            su_PorNroApolice
        'acesso% = 1 -> tratamento para pesquisa por nome do segurado
        ElseIf acesso% = 1 Then
            su_PorSegurado
        'acesso% = 2 -> consulta pela placa do veículo
        ElseIf acesso% = 2 Then
            su_PorPlacaVeic
        'acesso% = 3 -> pesquisa pelo chassi, chassi + placa, chassi + placa + proposta
        ElseIf acesso% = 3 Then
            su_PorChassi
        'acesso% = 4 -> consulta de apólice por número de proposta
        ElseIf acesso% = 4 Then
            su_PorNroProposta
        'acesso% = 5 -> pesquisa por dados do endereço (Consulta RPM)
        ElseIf acesso% = 5 Then
            su_PorEndereco
        'acesso% = 6 -> obtém o número da nova arquitetura pelo número
        '               do Mainframe para apólices Itaú e Banerj
        ElseIf acesso% = 6 Then
            SU_PorMainframe
            If c_cia_ita_mfr$ = "32" And tb_c_Cia_ita.Text <> "" And tb_c_Rmo.Text <> "" And tb_u_Apo_Pnc.Text <> "" Then
                bu3d_ok_click 'v69 Emilio 03/06/2008
            End If
            Screen.MousePointer = DEFAULT
            Exit Sub
        ElseIf acesso% = 7 Then
            su_PorNroCertificado
            Screen.MousePointer = DEFAULT
            Exit Sub
        'acesso% = 8 -> consulta pelo numero do sorteio
        ElseIf acesso% = 8 Then
            su_PorNroSorteio
        'acesso% = 9 -> consulta pelo numero do sav
        ElseIf acesso% = 9 Then
            su_PorNroSav
        'acesso% = 10 -> consulta pelo numero do Nius
        ElseIf acesso% = 10 Then
            Su_PorNroNiu
            
        ElseIf acesso% = 11 Then
            If (fu_sel_Apo_ita(Trim$(TB_APO_UBB.Text)) = True) Then
              su_PorNroApolice
            Else
              MsgBox "Apólice não encontrada.", , txt_msg$
            End If
        End If
            
        If CONSULTA_ITEM_CALL_CENTER% = True Then
            FORM7_ATIVADO = True
            Me.Hide
            Load R1FAB007
            Exit Sub
        End If
    
        'formata grid
        su_formata_grid gr_apo
        
        'se ok, os dados da 2a. tela devem ser exibidos através de acessos em
        'tabelas
        volta% = False
        Screen.MousePointer = DEFAULT
    End If
End Sub

Private Sub BU3D_Ok_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    
    PA3D_Status.Caption = "R1FAB001 - Confirma Operação"

End Sub

Private Sub bu3d_prx_hmn_click()

    Screen.MousePointer = HOURGLASS

' Verifica-se o array2 (contem todos os homônimos do cliente informado). _
Se a posição atual do 1o. elemento do array + 500 for menor que o número máximo de clientes _
exibidos na tela, deve ser verificado se existem mais clientes a serem pesquisados.
    If pos_array_fonet% + 500 > n_tot_hmn% - 1 Then
' A pesquisa pelos índices fonéticos será efetuada enquanto não se utilizar todos os índices _
    fonéticos faz a pesquisa na tabela
        Do Until fim_fonet%
' Os acessos serão realizados até que se encontrem clientes. Se encontrado algum cliente em _
  qualquer acesso que seja, o processo de busca será interrompido para ser exibido o _
  resultado na tela. _
  A cada 3 acessos, a função fu_procura_cliente retornará para verificar se o processo de _
  busca deve se prosseguir ou se deve ser interrompido dá continuidade à pesquisa do cliente
            If Not fu_procura_cliente() Then
                ' se ocorrer algum erro do Sybase, a busca
                ' será interrompida
                If Err_Syb <> 0 Or Msg_Syb <> 0 Then
                    Screen.MousePointer = DEFAULT
                    MsgBox "Não foi possível consultar Clientes.", , txt_msg$
                    Exit Sub
                End If
            Else
                ' encontrou cliente
                su_habilita_botao bu3d_prx_hmn, True
                
                ' preenche o listbox com os homônimos do clientes encontrados
                su_preenche_lista_clientes pos_array_fonet%, 2
                Screen.MousePointer = DEFAULT
                Exit Do
            End If
        Loop
                        
        ' fim da fonetização (pesquisados todos os índices fonéticos)
        If fim_fonet% Then
            ' Terminado todos os acessos, verifica se o array foi preenchido (indica que foram _
                encontrados clientes).
            Screen.MousePointer = DEFAULT
            
            If li_Homonimo.ListCount = 0 Then
                MsgBox "Processo de seleção ao Cliente finalizado. Cliente não encontrado.", , txt_msg$
                su_posiciona_foco tb_n_pes
                acesso% = 0
                Exit Sub
            Else
                ' exibe última tela de pesquisa a cliente
                If Tela% Then
                    ' preenche o listbox com os homônimos do clientes encontrados
                    su_preenche_lista_clientes pos_array_fonet%, 2
                Else
                    MsgBox "Processo de seleção ao Cliente finalizado.", , txt_msg$
                End If

            End If
        End If
    Else
        ' preenche o listbox com os homônimos do clientes encontrados
        su_preenche_lista_clientes pos_array_fonet%, 2
    End If
    
    ' se existirem clientes no listbox
    If li_Homonimo.ListCount <> 0 Then
        fr3d_Homonimo.Visible = True
        li_aditamentos.Enabled = True
        fr3d_Segurado.Visible = False
        fr3d_Apolices.Visible = False
        su_habilita_botao BU3D_Volta, True
    End If

    Screen.MousePointer = DEFAULT

End Sub

Private Sub bu3d_prx_hmn_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    
    PA3D_Status.Caption = "R1FAB001 - Seleciona demais clientes"

End Sub

Private Sub bu3d_rto_hmn_Click()
        
' Caso seja menor, devem ser exibidos dados da 1a. tela (clientes com o mesmo nome informado)
    If pos_array_fonet% - 500 < 0 Then
        pos_array_fonet% = 0
    End If
    
    ' preenche listbox com homônimos
    su_preenche_lista_clientes pos_array_fonet%, 1

End Sub

Private Sub bu3d_rto_hmn_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
        
    PA3D_Status.Caption = "R1FAB001 - Retorna clientes selecionados"

End Sub

Private Sub BU3d_Sai_Click()
        
    SU_Saida

End Sub

Private Sub bu3d_sai_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    
    PA3D_Status.Caption = "R1FAB001 - Abandona Aplicação"

End Sub

Private Sub BU3D_Volta_Click()
    
    su_inicializa_campos True
    
End Sub

Private Sub bu3d_Volta_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    
    PA3D_Status.Caption = "R1FAB001 - Volta para Janela Anterior"

End Sub

Private Sub cb_c_cia_ita_Click()

    'v68 Emilio 21/05/2008 - início
'    If cb_c_cia_ita.ListIndex = 0 Then
'        c_cia_ita_mfr$ = "1"
'        LB_RMO_MFR.Visible = True: TB_RMO_MFR.Visible = True: 'TB_RMO_MFR.Text = Empty
'        TB_ISG_MFR.Visible = True: LB_ISG_MFR.Visible = True: ' TB_ISG_MFR.Text = Empty
'        TB_C_T_NEG.Visible = True: LB_C_T_NEG.Visible = True: 'TB_C_T_NEG.Text = Empty:
'        LB_U_APO_MFR.Visible = True: TB_U_APO_MFR.Visible = True ' TB_U_APO_MFR.Text = Empty:
'        lb_c_rmo_bnj.Visible = False: tb_c_rmo_bnj.Visible = False: ' tb_c_rmo_bnj.Text = Empty
'        lb_e_doc_bnj.Visible = False: tb_e_doc_bnj.Visible = False ' tb_e_doc_bnj.Text = Empty:
'        tb_c_suc_bnj.Visible = False: lb_c_suc_bnj.Visible = False ' : tb_c_suc_bnj.Text = Empty
'        pnlGralhaAzul.Visible = False
'        TB_U_APO_AGF.Visible = False: LB_U_APO_AGF.Visible = False  'marcelo domingos 25/03/2004
'    ElseIf cb_c_cia_ita.ListIndex = 1 Then
'        c_cia_ita_mfr$ = "7"
'        TB_C_T_NEG.Visible = False: LB_C_T_NEG.Visible = False: TB_C_T_NEG.Text = Empty
'        LB_RMO_MFR.Visible = False: TB_RMO_MFR.Visible = False 'TB_RMO_MFR.Text = Empty:
'        tb_c_rmo_bnj.Visible = True: lb_c_rmo_bnj.Visible = True: 'tb_c_rmo_bnj.Text = Empty
'        lb_c_suc_bnj.Visible = True: tb_c_suc_bnj.Visible = True: 'tb_c_suc_bnj.Text = Empty
'        lb_e_doc_bnj.Visible = True: tb_e_doc_bnj.Visible = True: 'tb_e_doc_bnj.Text = Empty
'        TB_ISG_MFR.Visible = True: LB_ISG_MFR.Visible = True: 'TB_ISG_MFR.Text = Empty
'        'TB_U_APO_MFR.Text = Empty
'        pnlGralhaAzul.Visible = False
'        TB_U_APO_AGF.Visible = False: LB_U_APO_AGF.Visible = False  'marcelo domingos 25/03/2004
'    ElseIf cb_c_cia_ita.ListIndex = 2 Then
'        c_cia_ita_mfr$ = "22"
'        LB_C_T_NEG.Visible = False: TB_C_T_NEG.Visible = False
'        LB_RMO_MFR.Visible = False: TB_RMO_MFR.Visible = False
'        lb_c_rmo_bnj.Visible = False: tb_c_rmo_bnj.Visible = False
'        lb_c_suc_bnj.Visible = False: tb_c_suc_bnj.Visible = False
'        lb_e_doc_bnj.Visible = False: tb_e_doc_bnj.Visible = False
'        LB_ISG_MFR.Visible = False: TB_ISG_MFR.Visible = False
'        pnlGralhaAzul.BevelWidth = 0
'        pnlGralhaAzul.Visible = True
'        TB_U_APO_AGF.Visible = False: LB_U_APO_AGF.Visible = False  'marcelo domingos 25/03/2004
'    ElseIf cb_c_cia_ita.ListIndex = 3 Then
'        c_cia_ita_mfr$ = "9"
'        LB_RMO_MFR.Visible = False: TB_RMO_MFR.Visible = False: 'TB_RMO_MFR.Text = Empty
'        TB_ISG_MFR.Visible = False: LB_ISG_MFR.Visible = False: ' TB_ISG_MFR.Text = Empty
'        TB_C_T_NEG.Visible = False: LB_C_T_NEG.Visible = False: 'TB_C_T_NEG.Text = Empty:
'        LB_U_APO_MFR.Visible = False: TB_U_APO_MFR.Visible = False ' TB_U_APO_MFR.Text = Empty:
'        lb_c_rmo_bnj.Visible = False: tb_c_rmo_bnj.Visible = False: ' tb_c_rmo_bnj.Text = Empty
'        lb_e_doc_bnj.Visible = False: tb_e_doc_bnj.Visible = False ' tb_e_doc_bnj.Text = Empty:
'        tb_c_suc_bnj.Visible = False: lb_c_suc_bnj.Visible = False ' : tb_c_suc_bnj.Text = Empty
'        pnlGralhaAzul.Visible = False
'        TB_U_APO_AGF.Text = ""
'        TB_U_APO_AGF.Visible = True: LB_U_APO_AGF.Visible = True  'marcelo domingos 25/03/2004
'        lb_a_f.Visible = False
'        opt_c_af.Visible = False
'        opt_c_af.Value = False
'        opt_s_af.Visible = False
'        opt_s_af.Value = False
'        c_isg_agf = ""
'    End If
'
'    TB_U_APO_AGF.Text = ""

    '01 - Itaú Seguros
    pa3d_ItauSeguros.BevelWidth = 0
    pa3d_ItauSeguros.Visible = False
    TB_C_T_NEG.Text = ""
    TB_RMO_MFR.Text = ""
    TB_U_APO_MFR.Text = ""
    TB_ISG_MFR.Text = ""
    
    'Início .. Gisely - SS_113265 - 12/11/2009
    '99 - UBB(Vida PJ)
    Pa3d_UBBVidaPJ.BevelWidth = 0
    Pa3d_UBBVidaPJ.Visible = False
    TB_C_SUC_UBB.Text = ""
    TB_RMO_UBB.Text = ""
    TB_U_APO_UBB.Text = ""
    TB_SGR_UBB.Text = ""
    'Fim ..... Gisely - SS_113265 - 12/11/2009
    
    
    '99 - UBB
    Pa3d_UBB.BevelWidth = 0
    Pa3d_UBB.Visible = False
    TB_APO_UBB.Text = ""
    'Fim ..
    
    
    
    '07 - Banerj Seguros
    pa3d_Banerj.BevelWidth = 0
    pa3d_Banerj.Visible = False
    tb_c_rmo_bnj.Text = ""
    tb_c_suc_bnj.Text = ""
    tb_e_doc_bnj.Text = ""
    tb_u_apo_bnj.Text = ""
    tb_isg_bnj.Text = ""
    
    '09 - AGF
    pa3d_AGF.BevelWidth = 0
    pa3d_AGF.Visible = False
    TB_U_APO_AGF.Text = ""
    
    '22 - Gralha Azul - BCL
    pa3d_GralhaAzulBCL.BevelWidth = 0
    pa3d_GralhaAzulBCL.Visible = False
    tb_SubEstipulante.Text = ""
    tb_Certificado.Text = ""
    
    '32 - Itauprev
    pa3d_Itauprev.BevelWidth = 0
    pa3d_Itauprev.Visible = False
    tb_c_pro_itp.Text = ""
    tb_u_apo_itp.Text = ""
    
    If cb_c_cia_ita.ListIndex = -1 Then Exit Sub    '381 - Invalid property array index
    
    c_cia_ita_mfr$ = Trim(Str(cb_c_cia_ita.ItemData(cb_c_cia_ita.ListIndex)))
    
    Select Case c_cia_ita_mfr$
        Case 1, 33   'Itaú Seguros / Cisão Porto Adelamg 21/10/2009
            pa3d_ItauSeguros.Move 3150, 240, 4100, 570
            pa3d_ItauSeguros.Visible = True
            'TB_C_T_NEG.SetFocus                                                                        'v69 Emilio 03/06/2008
            If TB_C_T_NEG.Visible = True And TB_C_T_NEG.Enabled = True Then TB_C_T_NEG.SetFocus         'v69 Emilio 03/06/2008
        Case 7  'Banerj Seguros
            pa3d_Banerj.Move 3150, 240, 4600, 570
            pa3d_Banerj.Visible = True
            'tb_c_rmo_bnj.SetFocus                                                                      'v69 Emilio 03/06/2008
            If tb_c_rmo_bnj.Visible = True And tb_c_rmo_bnj.Enabled = True Then tb_c_rmo_bnj.SetFocus   'v69 Emilio 03/06/2008
        Case 9  'AGF
            pa3d_AGF.Move 3150, 240, 4755, 570
            pa3d_AGF.Visible = True
            'TB_U_APO_AGF.SetFocus                                                                      'v69 Emilio 03/06/2008
            If TB_U_APO_AGF.Visible = True And TB_U_APO_AGF.Enabled = True Then TB_U_APO_AGF.SetFocus   'v69 Emilio 03/06/2008
        
        Case 22 'Gralha Azul - BCL
            pa3d_GralhaAzulBCL.Move 3150, 240, 2760, 570
            pa3d_GralhaAzulBCL.Visible = True
            'tb_SubEstipulante.SetFocus                                                                 'v69 Emilio 03/06/2008
            If tb_SubEstipulante.Visible = True And tb_SubEstipulante.Enabled = True Then tb_SubEstipulante.SetFocus    'v69 Emilio 03/06/2008
        
        Case 32 'Itauprev
            pa3d_Itauprev.Move 3540, 240, 2400, 570
            pa3d_Itauprev.Visible = True
            'tb_c_pro_itp.SetFocus                                                                      'v69 Emilio 03/06/2008
            If tb_c_pro_itp.Visible = True And tb_c_pro_itp.Enabled = True Then tb_c_pro_itp.SetFocus   'v69 Emilio 03/06/2008
        
        Case 88   'UBB
            Pa3d_UBB.Move 3150, 240, 4100, 570
            Pa3d_UBB.Visible = True
            If TB_APO_UBB.Visible = True And TB_APO_UBB.Enabled = True Then TB_APO_UBB.SetFocus
            
        Case 99   'UBB (Vida PJ)                                                                        'Início .. Gisely - SS_113265 - 12/11/2009
            Pa3d_UBBVidaPJ.Move 3150, 240, 4100, 570
            Pa3d_UBBVidaPJ.Visible = True
            'TB_C_SUC_UBB.SetFocus
            If TB_C_SUC_UBB.Visible = True And TB_C_SUC_UBB.Enabled = True Then TB_C_SUC_UBB.SetFocus   'Fim ..... Gisely - SS_113265 - 12/11/2009
    End Select
'v68 Emilio 21/05/2008 - fim

End Sub

Private Sub cb_c_cia_ita_GotFocus()
    'Call Su_LimparCampos(Me)
End Sub

Private Sub ch3d_Ramo_Prod_Click(Value As Integer)
    
    If Value Then
        i_e_osg = "S"
    Else
        i_e_osg = "N"
    End If
    
    e_osg$ = e_osg_aux

End Sub

Private Sub cmd_ConsExc_Click()

    Dim axMotivo        As String
    
    Dim VL_PARM As String
    Dim Fonet01 As String
    Dim Fonet02 As String
    Dim Fonet03 As String
    Dim VL_E_PES As Integer

    Screen.MousePointer = HOURGLASS
    
    'Adriana - 03/09/2001 - Consulta de proposta excluída AUTO - Início
    
    'Patricia - 05/08/2003 - Chamada ao Projeto R1PABK01 para consulta
    'If c_agr_fam_pro$ = "1" Then 'AUTO
    
        If (Trim(tb_u_prp.Text) <> Empty And (Trim(tb_n_pes.Text) <> Empty Or Trim(tb_u_chs_aut.Text) <> Empty Or Trim(tb_u_plc_aut.Text) <> Empty)) Or _
            (Trim(tb_n_pes.Text) <> Empty And (Trim(tb_u_chs_aut.Text) <> Empty Or Trim(tb_u_plc_aut.Text) <> Empty)) Or _
            (Trim(tb_u_chs_aut.Text) <> Empty And Trim(tb_u_plc_aut.Text) <> Empty) Then
            Call SU_MENSAGEM("Só devem ser informados ou a proposta, ou o segurado, ou o chassi ou a placa.", MB_ICONINFORMATION)
            Screen.MousePointer = DEFAULT
            tb_u_prp.SetFocus
            Exit Sub
        End If
            
        'Verificar se existe dados digitados para seleção
        If Trim(tb_u_prp.Text) = Empty And Trim(tb_n_pes.Text) = Empty And Trim(tb_u_chs_aut.Text) = Empty And Trim(tb_u_plc_aut.Text) = Empty Then
            Call SU_MENSAGEM("Não existe dados digitados para a consulta.", MB_ICONINFORMATION)
            Screen.MousePointer = DEFAULT
            tb_u_prp.SetFocus
            Exit Sub
        
        'Consistir proposta
        ElseIf Trim(tb_u_prp.Text) <> Empty Then
            VL_PARM$ = c_agr_fam_pro$ & " | 0 | 1 | " + Trim(tb_u_prp.Text) + " | "
        
        'Consistir segurado
        ElseIf Trim(tb_n_pes.Text) <> Empty Then
            
            If op3d_e_pes.Value = True Then
                VL_E_PES% = 1
            Else
                VL_E_PES% = 2
            End If
            
            'v60 Emilio 22/08/2006 - início
'            ret% = FU_Fonet_Indices(tb_n_pes.Text, VL_E_PES%)
            retFonetiza = clsFonetiza.obterIndiceFonetico(tb_n_pes.Text, VL_E_PES%)
            If retFonetiza <> 0 Then
                Screen.MousePointer = DEFAULT
                MsgBox clsFonetiza.getcodigoErro & "-" & clsFonetiza.gettextoErro
                'TRATAR_ERRO
                Exit Sub
            End If
            
            retFonetiza = clsFonetiza.getcodigoErro
            If retFonetiza <> 0 Then
                Screen.MousePointer = DEFAULT
                MsgBox clsFonetiza.getcodigoErro & "-" & clsFonetiza.gettextoErro
                'TRATAR_ERRO
                Exit Sub
            End If
            
            Fonet_Indices(0) = clsFonetiza.getindiceFonetico(1)
            Fonet_Indices(1) = clsFonetiza.getindiceFonetico(2)
            Fonet_Indices(2) = clsFonetiza.getindiceFonetico(3)
            Fonet_Indices(3) = clsFonetiza.getindiceFonetico(4)
            Fonet_Indices(4) = clsFonetiza.getindiceFonetico(5)
            Fonet_Indices(5) = clsFonetiza.getindiceFonetico(6)
            'v60 Emilio 22/08/2006 - fim
    
            Fonet01 = Fonet_Indices$(0)
            Fonet02 = Fonet_Indices$(1)
            Fonet03 = Fonet_Indices$(2)
                    
            VL_PARM$ = c_agr_fam_pro$ & " | 0 | 2 | " + Trim(Fonet01) + " | " + Trim(Fonet02) + " | " + Trim(Fonet03) + " | "
        
        'Consistir chassis
        ElseIf Trim(tb_u_chs_aut.Text) <> Empty Then
            VL_PARM$ = c_agr_fam_pro$ & " | 0 | 3 | " + Trim(tb_u_chs_aut.Text) + " | "
            
        'Consistir placa
        ElseIf Trim(tb_u_plc_aut.Text) <> Empty Then
            VL_PARM$ = c_agr_fam_pro$ & " | 0 | 4 | " + Trim(tb_u_plc_aut.Text) + " | "
        
        End If
        
        Clipboard.Clear
    
        Clipboard.SetText VL_PARM$
        
        'v60 Emilio 22/08/2006 - início
        'Obs.: Migração XP para novo catalogador - Função descontinuada
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
'        '+--------------------------------------------------------------------------+
'        '| Faz a chamada do projeto de dados de cobrança                            |
'        '+--------------------------------------------------------------------------+
'        ret% = FU_Monitora_Exe(Me, CG_DIR_EXE1$ + "R1PABK01.EXE", FormularioHide%)
        ret% = FU_MonitoraExe(Me, "", "R1PABK01.EXE", "", , FormularioHide%)
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
        'v60 Emilio 22/08/2006 - fim
        
        If Not ret% Then
            MsgBox "Não foi possível executar aplicação de proposta excluída", 16
        End If
    
        Clipboard.Clear
    
    'Adriana - 03/09/2001 - Consulta de proposta excluída AUTO - Fim

 GoTo Sair

'**********************************************************************************
'Patricia 05/08/2003
'    Else 'VIDA/RPM

        If Not FU_PR_WAP_G09010() Then
            Screen.MousePointer = DEFAULT
            Exit Sub
        End If

        'Retornou apenas um registro
        If ctd_lfi% = 1 Then
            axindex% = 0
            R1FAB008.cmbProp.ListIndex = axindex%
            R1FAB008.cmbProp.ListIndex = 0
            R1FAB008.frm_Prop.Visible = True
            R1FAB008.frm_Prop.Enabled = True

            R1FAB008.Show
            Me.Hide

        'Retornou vários registros
        ElseIf ctd_lfi% > 1 Then
            If CALL_CENTER_CORRETOR = True Then
                ctd_lfi% = 0
                'varrer vetor vt_prp_exc
                For ctd_lfi% = 0 To UBound(VT_PRP_EXC)
                    If cck_d_prt_cga$ = VT_PRP_EXC(ctd_lfi%).d_prt_cga$ Then
                        Achou = True
                        axindex% = ctd_lfi%
                    End If
                Next ctd_lfi%
            End If

            'Retornou apenas um registro
            If Achou = True Then
                Me.Hide
                R1FAB008.Show
                R1FAB008.cmbProp.ListIndex = axindex%
                axindex% = 0
            Else
                R1FAB008.Show
                R1FAB008.frm_Prop.Visible = False
                R1FAB008.cmbProp.SetFocus
                R1FAB008.Refresh
                SendKeys "{F4}"
                R1FAB008.frm_Prop.Enabled = True
                Me.Hide
            End If

        'Não retornou nada
        ElseIf ctd_lfi% = 0 Then
            Screen.MousePointer = DEFAULT
            MsgBox "Proposta não consta na Tabela de Excluídas.", 48
            'Dilson - call center corretor - 30/12/2002
            If Volta_CALL_CENTER_CORRETOR = False Then
                BU3d_Sai_Click
                Screen.MousePointer = DEFAULT
                Exit Sub
            End If
            tb_u_prp.Text = Empty
            Exit Sub
        End If
'    End If
'******************************************************************************************
Sair:

    Screen.MousePointer = DEFAULT

End Sub

Private Sub cmd_ConsExc_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
        
    PA3D_Status.Caption = "R1FAB001 - Consulta Propostas Excluídas"

End Sub

Private Sub Cmd_New_Pesquisa_Click()

    'Fecha conexão
    su_fecha_conexao
    
    'v60 Emilio 22/08/2006 - início
    'Obs.: Migração XP para novo catalogador - Função descontinuada
    'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
'    If OSAmbiente = "Windows 3.11" Then
'        ret% = FU_Monitora_Exec(Me, "R1PAB901.EXE ")
'    Else
'        ret% = FU_Monitora_Exe(Me, CG_DIR_EXE1$ + "R1PAB901.EXE ", MinEnableFalse%)
'    End If
    ret% = FU_MonitoraExe(Me, "", "R1PAB901.EXE", "", , MinEnableFalse%)
    'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    'v60 Emilio 22/08/2006 - fim
    
    If Not ret% Then
        Screen.MousePointer = DEFAULT
        MsgBox "Não foi possível executar o projeto." & Chr(13) & "Consulta à Base de Dados Reorganizada.", 48
        SqlConn% = FU_Conecta_Servidor(Servidor_Id%)
        Exit Sub
    End If

    'Efetua nova conexão
    SqlConn% = FU_Conecta_Servidor(Servidor_Id%)
    
    Me.Show
End Sub

Private Sub Form_Activate()
    
    Dim i As Integer
    
    bg_click = True
    
    e_osg$ = e_osg_aux

    Select Case ModoPesquisa
        Case 1, 2 'APO , SEG
        
            tb_c_Cia_ita.Text = Format$(Val(c_cia_ita$), "00")
            tb_c_Rmo.Text = Format$(Val(c_rmo$), "00")
            tb_u_Apo_Pnc.Text = Format(Val(u_apo_pnc$), "000000000")
            tb_u_Apo_Dpd.Text = Format$(Val(u_apo_dpd$), "0000000")
            
            bu3d_ok_click
        
            ModoPesquisa% = False
        
        Case 3 ' CLI
            bu3d_ok_click
        
            ModoPesquisa% = False
        
        Case 4 ' PRP
            bu3d_ok_click
        
            ModoPesquisa% = False
        
        Case 5 ' CHS
            bu3d_ok_click
        
            ModoPesquisa% = False
        
        Case 6 ' PLC
            bu3d_ok_click
        
            ModoPesquisa% = False
        
        Case 7 ' CALL CENTER CORRETOR
            'Dilson - call center corretor - 30/12/2002
            If Volta_CALL_CENTER_CORRETOR = True Then
                BU3d_Sai_Click
            Else
                Volta_CALL_CENTER_CORRETOR = False
                cmd_ConsExc_Click
            End If
        
        Case Else
            If Mudou_Item Then
                ' seleciona valores como default na entrada no projeto
                c_cia_ita$ = "1"
                tb_c_Cia_ita.Text = "1"
                Mudou_Item = False
    
                For i% = 0 To li_isg.ListCount - 1
    
                    If Novo_Item = li_isg.ItemData(i%) Then
                        'Força um Click na lista de Itens
                        li_isg.ListIndex = i%
                        Exit For
                    End If
    
                Next i%
            End If
    
            su_habilita_botao bu3d_ok, False
    End Select
    
    Me.Caption = "Consulta Apólice"
    
    '*****************************************************
    '       Alterado por Opus em 11/02/1999.             *
    '       Motivo: colocar o foco em tb_c_cia_ita       *
    '*****************************************************

   'O frame está visível ? E o TextBox está habilitado ?
    If fr3d_Por_Apolice.Visible And tb_c_Cia_ita.Enabled Then
       tb_c_Cia_ita.SetFocus
    End If

    If acesso% = 7 Then
        fu_sel_Certificado
    End If
    
End Sub

Private Sub Form_DblClick()
        
    MsgBox sg_versao$, MB_ICONINFORMATION, "VERSÃO"

End Sub

Private Sub Form_Load()
        
    Dim Contador        As Integer
    
    DirUser = FU_Diretorio_Usuario()
    If Right(DirUser, 1) <> "\" Then DirUser = DirUser & "\"

    ' marcos 26/09/2000
    
    sg_versao$ = "PROJ: R1PAB049 DATA: 06/08/2008 - PauloFLopes Expansão Número Apólice"

    Screen.MousePointer = HOURGLASS

    'Obtém o caminho do arquivo executável
    CG_DIR_EXE1$ = App.Path
    Bln_Cph_OK = False     ' Boolean de Campanha
    
    If Mid$(Trim$(CG_DIR_EXE1$), 4, 8) = "PRODUCAO" Then
        CG_DIR_EXE1$ = "F:\PRODUCAO\VBDIF\EXEC\"
    Else
        CG_DIR_EXE1$ = "F:\DESENV\VBDIF\EXEC\"
    End If

    SU_Ajusta_Form Me, 3
   
    'Testa se aplicação já está ativa
    SU_Verifica_Duplicidade Me
    
    ' separa parâmetros recebidos por outro projeto
    If Not fu_separa_param1(Command$) Then
        MsgBox "Erro na passagem de parâmetros.", 48
        End
    End If

    Servidor_Id% = SERV_MASCORP_ID
    E_Ope_Vda_Pro$ = "M"

    'Abre conexão com Servidor e verifica Acesso
    If Not fu_abre_servidor("R1FAB001") Then SU_Saida

    'v60 Emilio 22/08/2006 - início
'    'Carga para fonetização
'    If Not FU_Fonet_Carga() Then SU_Saida
    Set clsFonetiza = New PEGFNZ01
    'v60 Emilio 22/08/2006 - fim

    op3d_e_pes.Value = True
    
    su_habilita_botao BU3D_Volta, False
    
    su_habilita_botao bu3d_ok, False
    
'v68 Emilio 21/05/2008 - início
'    cb_c_cia_ita.Clear
'    cb_c_cia_ita.AddItem "Itaú Seguros"
'    cb_c_cia_ita.ItemData(cb_c_cia_ita.NewIndex) = 0
'    cb_c_cia_ita.AddItem "Banerj Seguros"
'    cb_c_cia_ita.ItemData(cb_c_cia_ita.NewIndex) = 1
'    cb_c_cia_ita.AddItem "Gralha Azul - BCL"
'    cb_c_cia_ita.ItemData(cb_c_cia_ita.NewIndex) = 2
'
'    ''marcelo domingos 25/03/2004 - item para migração AGF (INICIO)
'    cb_c_cia_ita.AddItem "AGF"
'    cb_c_cia_ita.ItemData(cb_c_cia_ita.NewIndex) = 3
'    cb_c_cia_ita.ListIndex = 0

    With cb_c_cia_ita
        .AddItem "01 - Itaú Seguros":       .ItemData(.NewIndex) = 1
        .AddItem "07 - Banerj Seguros":     .ItemData(.NewIndex) = 7
        .AddItem "09 - AGF":                .ItemData(.NewIndex) = 9
        .AddItem "22 - Gralha Azul - BCL":  .ItemData(.NewIndex) = 22
        .AddItem "32 - Itauprev":           .ItemData(.NewIndex) = 32
        .AddItem "88 - UBB Auto Tombamento": .ItemData(.NewIndex) = 88
        .AddItem "99 - UBB(Vida PJ)":       .ItemData(.NewIndex) = 99        'Gisely - SS_113265 - 12/11/2009
    End With
'v68 Emilio 21/05/2008 - fim
    
    lb_a_f.Visible = False
    opt_c_af.Visible = False
    opt_c_af.Value = False
    opt_s_af.Visible = False
    opt_s_af.Value = False
    c_isg_agf = ""
    ''marcelo domingos 25/03/2004 - item para migração AGF (FIM)
    
        
    If Mid$(ServerName, 1, 5) = "TPROD" Or Mid$(UCase(Usuario$), 1, 3) = "APO" Then
      Cmd_New_Pesquisa.Visible = True
    End If
   
    ' disponibiliza pesquisas de acordo com o agrupamento
    Select Case Val(c_agr_fam_pro$)
        Case 1      ' AUTO
            fr3d_apo_aut.Visible = True
            lb_u_cbn_sor.Visible = True
            tb_u_cbn_sor.Visible = True
            
            txt_msg$ = "Apólice Auto"
            cb_c_cia_ita.Enabled = True
    ' para seleção de apólices que sejam AUTO somente, pois se não verificado este campo na _
      tabela dbnprod..tb_isg_apo poderão ser pesquisadas apólices de outros agrupamentos
            e_osg$ = "AUT"
        Case 2      ' Saúde
            txt_msg$ = "Apólice Saúde"
            e_osg$ = "PES"
    
        Case 3      ' RPM
            fr3d_apo_rpm.Visible = True
            lb_u_cbn_sor.Visible = True
            tb_u_cbn_sor.Visible = True
            
            txt_msg$ = "Apólice Residência"
            e_osg$ = "IMV"
    
        Case 4      ' VIDA
            cb_c_cia_ita.Enabled = True
            Lb_u_chs_aut.Visible = False: tb_u_chs_aut.Visible = False
            Lb_u_plc_aut.Visible = False: tb_u_plc_aut.Visible = False
            
            lb_u_cbn_sor.Visible = True
            tb_u_cbn_sor.Visible = True
            
            txt_msg$ = "Apólice Vida"
            ' Deverão ser selecionadas apólices Vida Individual e Grupo
            e_osg$ = "PES"

        Case 5      ' Diferenciado
            lb_u_sav.Visible = True
            tb_u_sav.Visible = True
            lb_u_niu.Visible = True
            tb_u_niu.Visible = True
            
            txt_msg$ = "Apólice Diferenciado"
            e_osg$ = "LRS"
        
        Case 6      ' Diferenciado
            lb_u_sav.Visible = True
            tb_u_sav.Visible = True
            lb_u_niu.Visible = True
            tb_u_niu.Visible = True
            
            txt_msg$ = "Apólice Diferenciado"
            e_osg$ = "DVS"
            'e_osg$ = "GRP"
        Case 7      ' DPVAT
            txt_msg$ = "Apólice DPVAT"
            e_osg$ = "DVS"
    
        Case 8      ' DPEM
            txt_msg$ = "Apólice DPEM"
            e_osg$ = "DVS"
    
        'STJ
        Case 9      ' Transporte
            lb_u_sav.Visible = True
            tb_u_sav.Visible = True
            lb_u_niu.Visible = True
            tb_u_niu.Visible = True
            
            txt_msg$ = "Apólice Transporte"
            e_osg$ = "DVS"
            
        Case 0    'Stael 03/03/2000
            'não recebeu família, não disponibiliza consulta por nome
            fr3d_TpPesquisa.Enabled = False
        Case Else
            MsgBox "Código Família/Produto inválido.", MB_ICONEXCLAMATION
    
    End Select

    '06/04/1998 - R1PAB088
    bu3d_cons_bd_rgd.Visible = False
    
    For Contador% = 0 To UBound(Permissoes)
        
        If Permissoes(Contador%) = "R1FABH01" Then
            bu3d_cons_bd_rgd.Visible = True
        End If
    
    Next
    '06/04/1998 - R1PAB088

    e_osg_aux = e_osg$
    i_e_osg = "N"

    Mudou_Item = False
    
    ' cris - 15/01/2002 - inicio
    If Not FU_PR_SAP_SIT_MCF_S10234() Then
        If (Err_Syb <> 0) Or (Msg_Syb <> 0) Then
           Screen.MousePointer = DEFAULT
           MsgBox "Não foi possível selecionar dados de situação de microfilme.", MB_ICONEXCLAMATION, "ATENÇÃO"
            su_habilita_botao bu3d_ok, True
            Exit Sub
        End If
    End If
    ' cris - 15/01/2002 - fim
    
    ' Valdemir - 24/10/2002 - inicio
    If Val(c_agr_fam_pro$) = 1 Or Val(e_fam_pro$) = 4 Or Val(c_agr_fam_pro$) = 4 Then
        If Not fu_sel_tot_tit() Then
            Screen.MousePointer = DEFAULT
            MsgBox "Não foi possível selecionar numero Total de Titulos.", MB_ICONEXCLAMATION, "ATENÇÃO"
            Exit Sub
        End If
    End If
    ' Valdemir - 24/10/2002 - Fim
        
    
    If ModoPesquisa = 8 Then
        CONSULTA_ITEM_CALL_CENTER% = True
                
        If volta_item = True Then
            BU3d_Sai_Click
        Else
            tb_c_Cia_ita.Text = Format$(Val(c_cia_ita$), "00")
            tb_c_Rmo.Text = Format$(Val(c_rmo$), "00")
            tb_u_Apo_Pnc.Text = Format(Val(u_apo_pnc$), "000000000")
            tb_u_Apo_Dpd.Text = Format$(Val(u_apo_dpd$), "0000000")
            tb_n_pes.Text = Trim$(n_pes)
            bg_click = True
            
            bu3d_ok_click
            
            ModoPesquisa% = False
        End If
    End If
    
    Screen.MousePointer = DEFAULT
End Sub

Private Sub Form_QueryUnload(Cancel As Integer, Unloadmode As Integer)
    
    Ind_UnloadMode = Unloadmode
    Cancel = FU_Verifica_Saida(Unloadmode, Me)

End Sub

Private Sub Form_Unload(Cancel As Integer)
    
'20/11/1998 - Luciane/Hirata
'Comando IF foi colocado devido a conversão de VB3 para VB5, porque o VB5 não permite que o _
botão minimizar apareça, sem que o control box esteja habilitado. _
Houve a necessidade controlar o fechamento do form via control box, para que conexões e _
bibliotecas não permanecessem abertas.
        
    If Ind_UnloadMode = 0 Then
        
        If BU3D_Sai.Enabled = True Then
            BU3d_Sai_Click
        Else
            Cancel = True
        End If

    End If

End Sub

Private Sub fr3d_Apolices_DragDrop(Source As Control, X As Single, Y As Single)
        
    apolice% = 1

End Sub

Private Sub fr3d_Apolices_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
        
    PA3D_Status.Caption = "R1FAB001 - Lista de Apólices"

End Sub

Private Sub fr3d_Homonimo_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
        
    PA3D_Status.Caption = "R1FAB001 - Lista de Homônimos"

End Sub

Private Sub fr3d_Por_Apolice_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    
    PA3D_Status.Caption = "R1FAB001 - Consulta as Apólices da Nova Arquitetura"

End Sub

Private Sub fr3d_Segurado_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
        
    PA3D_Status.Caption = "R1FAB001 - Dados do Segurado"

End Sub

Private Sub fr3d_TpPesquisa_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    
    PA3D_Status.Caption = "R1FAB001 - Outros tipos de Consulta"

End Sub

Private Sub FR3D_U_APO_MFR_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    
    PA3D_Status.Caption = "R1FAB001 - Obtém o Número da Apólice da Nova Arquitetura das Apólices Migradas do Mainframe"

End Sub

Private Sub gr_apo_Click()
        
    su_habilita_botao bu3d_ok, True
    
    bu3d_ok.SetFocus
    
    'foi selecionado uma apólice através do grid
    If CONSULTA_POR_ITEM% = True Then
        apolice% = 0
    Else
        apolice% = 1
    End If

    gr_apo.HIGHLIGHT = True
    gr_apo_dblclick

End Sub

Private Sub gr_apo_dblclick()
        
    Dim i As Integer
    
    Screen.MousePointer = HOURGLASS
    
' se pesquisa não for por apólice e existirem várias apólices, deve-se exibir o grid, com _
HighLight = false. Este evento é acionado, porém não é necessário executar o código _
seleciona número da apólice
    gr_apo.Col = 0
    
    'PAULO - 15/12/2000 - GRALHA AZUL
    c_cia_ita$ = Split(gr_apo.Text, ".")(0)     '  PauloFLopes     20/12/2007  Mid$(gr_apo.Text, 1, 2)
    
    c_rmo$ = Split(gr_apo.Text, ".")(1)          '  PauloFLopes     20/12/2007  Mid$(gr_apo.Text, 4, 2)        'Lucimara - 27/12/00
    u_apo_pnc$ = Split(gr_apo.Text, ".")(2)     '  PauloFLopes     20/12/2007  Mid$(gr_apo.Text, 7, 7)    'Lucimara - 27/12/00
    u_apo_dpd$ = Split(gr_apo.Text, ".")(3)     '  PauloFLopes     20/12/2007  Mid$(gr_apo.Text, 15, 1)   'Lucimara - 27/12/00
    C_ISG_PLACA_CHASSI$ = Split(Split(gr_apo.Text, ".")(4), " ")(0) 'Lucimara - 27/12/00
    
    If Not fu_sel_apo_nroapolice() Then
        Screen.MousePointer = DEFAULT
        MsgBox "Apólice não encontrada.", , txt_msg$
        'su_habilita_botao bu3d_ok, True
        'su_posiciona_foco tb_u_Apo_Pnc
        Exit Sub
    End If
            
    'Pesquisa Família/Produto
    'SU_InformaFamProd
    
    c_agr_fam_pro$ = dad_apo(0).c_agr_fam_pro
    
    ' verifica o agrupamento da família
    If Val(c_agr_fam_pro$) = 1 Then ' AUTO
        ' armazena nome do fabricante, linha e modelo do veículo da apólice selecionada
        gr_apo.Col = 1
        ' nome do fabricante
        n_fbr_aut$ = Trim$(gr_apo.Text)
        gr_apo.Col = 2
        ' nome da linha
        n_lin_aut$ = Trim$(gr_apo.Text)
        gr_apo.Col = 3
        ' nome do modelo
        n_mod_aut$ = Trim$(gr_apo.Text)
    ElseIf Val(c_agr_fam_pro$) = 4 Then ' VIDA
        e_osg$ = dad_apo(0).e_osg
    End If
    
    ' seleciona aditamentos da apólice na tabela dbnprod..tb_adi
    If Not fu_sel_adi() Then
        Screen.MousePointer = DEFAULT
        MsgBox "Apólice sem Aditamentos.", , txt_msg$
        
        'Valdemir - 22/01/2002
        'su_habilita_botao bu3d_ok, true
        su_habilita_botao bu3d_ok, False
        apolice% = 0
        
        Exit Sub
    End If
    
    ' carrega a data de início e fim de vigência da apólice para cada aditamento
    If Not fu_carr_d_adi() Then
        Screen.MousePointer = DEFAULT
        Exit Sub
    End If
        
    ' cris - 15/01/2002 - inicio
    Dim j   As Integer
    For i% = 1 To UBound(dad_sit_mcf)
        For j% = 0 To UBound(dad_adi)
            If Val(dad_adi(j%).c_mot_sit_mcf) = Val(dad_sit_mcf(i%).c_mot_sit_mcf) Then
                dad_adi(j%).t_mot_sit_mcf = dad_sit_mcf(i%).t_mot_sit_mcf
                Exit For
            End If
        Next j%
    Next i%
    ' cris - 15/01/2002 - fim
    
    IND_CHAMADA_PLACA_CHASSIS% = False
    If CONSULTA_POR_ITEM% = True Then
        SU_TRATAMENTO_CLIENTE
        FORM7_ATIVADO = True
        IND_CHAMADA_PLACA_CHASSIS% = True
        Me.Hide
        Load R1FAB007
        Exit Sub
    End If
    
' Se for encontrado somente 1 aditamento, não será exibida a tela com a relação dos _
  aditamentos (listbox). Será exibida a 2a. tela.
    If li_aditamentos.ListCount = 1 Or acesso% = 4 Then
' se trata de uma pesquisa por proposta e ao escolher a apólice o aditamento deve vir _
  posicionado c/ a proposta informada na 1a. tela
        If acesso% = 4 Then
' seleciona o elemento do array dad_adi() correspondente à proposta pesquisada
            i% = -1
' se existir somente um aditamento para apólice, não é necessário incrementar o contador _
  para posicionar o aditamento
            Do
                i% = i% + 1
                If Val(u_prp$) = Val(dad_adi(i%).u_prp) Then
                    Exit Do
                End If

            Loop Until i% = UBound(dad_adi)
            
            ' seleciona o aditamento correspondente àquela proposta
            U_ADI$ = dad_adi(i%).U_ADI
            d_ini_vig_adi$ = dad_adi(i%).d_ini_vig_adi
        Else
            i% = 0      ' cris - 15/01/2002
            U_ADI$ = "0"
            d_ini_vig_adi$ = dad_adi(i%).d_ini_vig_adi
        End If
    
        SU_Item_Segurado
    
    ElseIf li_aditamentos.ListCount > 1 Then
' se existirem mais de um aditamento para a apólice, deverá ser exibida a relação c/ todos os aditamentos.
        fr3d_Segurado.Visible = False
        fr3d_Apolices.Visible = False
        fr3d_Aditamento.Visible = True
        li_aditamentos.Enabled = True
        su_habilita_botao BU3D_Volta, True
            
        ' exibe no frame de aditamentos, o número da apólice
        'PauloFLopes - GRALHA AZUL - 4/1/2001
        lb_apolice1.Caption = Format$(c_cia_ita$, "00") & "." & _
                Format$(c_rmo$, "00") & "." & _
                Format(u_apo_pnc$, "000000000") & "." & _
                Format$(u_apo_dpd$, "0000000")
        li_aditamentos.ListIndex = li_aditamentos.ListCount - 1
        fr3d_Aditamento.Visible = False
        fr3d_Apolices.Visible = True
        Exit Sub
    End If
    
    Screen.MousePointer = DEFAULT

End Sub

Private Sub gr_apo_GotFocus()
        
    su_habilita_botao bu3d_ok, False

End Sub

'Private Sub LB_Logo_DblClick()
'
'    ' Valdemir - 24/10/2002 - inicio
'    If Val(c_agr_fam_pro$) = 1 Then
'        MsgBox "Quantidade de Títulos (Auto) Solicitados : " & tot_titulo#, vbInformation, "Mensagem"
'    ElseIf Val(e_fam_pro$) = 4 Or Val(c_agr_fam_pro$) = 4 Then
'        MsgBox "Quantidade de Títulos (RPM e VIDA) Solicitados : " & tot_titulo#, vbInformation, "Mensagem"
'    End If
'    ' Valdemir - 24/10/2002 - fim
'
'End Sub
'
Private Sub li_aditamentos_Click()
  
    If bg_click Then
        su_habilita_botao bu3d_ok, True
        bu3d_ok.SetFocus
        
        ' selecionado aditamento através do listbox
        'aditamento% = True
        
        'Alterado pelo Mario -> Diferenciados
        If c_agr_fam_pro$ <> "5" And c_agr_fam_pro$ <> "6" Then
            U_ADI$ = dad_adi(li_aditamentos.ListIndex).U_ADI
        Else
            U_ADI$ = dad_adi(li_aditamentos.ListCount - 1).U_ADI
            d_ini_vig_adi$ = dad_adi(li_aditamentos.ListCount - 1).d_ini_vig_adi
        End If
    
    End If
    
    li_aditamentos_DblClick

End Sub

Private Sub li_aditamentos_DblClick()
        
    Screen.MousePointer = HOURGLASS
    
    SU_Item_Segurado
    
    Screen.MousePointer = DEFAULT

End Sub

Private Sub li_aditamentos_GotFocus()
        
    su_habilita_botao bu3d_ok, False

End Sub

Private Sub gr_Apolice_Click()
    su_habilita_botao bu3d_ok, True
    
    bu3d_ok.SetFocus
    
    'foi selecionado uma apólice através do grid
    If CONSULTA_POR_ITEM% = True Then
        apolice% = 0
    Else
        apolice% = 1
    End If

    gr_Apolice_DblClick

End Sub

Private Sub gr_Apolice_DblClick()
    Dim i As Integer
    
    Screen.MousePointer = HOURGLASS
    
    c_cia_ita$ = dad_apo(gr_Apolice.Row - 1).c_cia_ita
    
    c_rmo$ = dad_apo(gr_Apolice.Row - 1).c_rmo
    u_apo_pnc$ = dad_apo(gr_Apolice.Row - 1).u_apo_pnc
    u_apo_dpd$ = dad_apo(gr_Apolice.Row - 1).u_apo_dpd
    C_ISG_PLACA_CHASSI$ = dad_apo(gr_Apolice.Row - 1).c_isg
    
    If Not fu_sel_apo_nroapolice() Then
        Screen.MousePointer = DEFAULT
        MsgBox "Apólice não encontrada.", , txt_msg$
        'su_habilita_botao bu3d_ok, True
        'su_posiciona_foco tb_u_Apo_Pnc
        Exit Sub
    End If
            
    'Pesquisa Família / Produto
    'su_InformaFamProd
    
    c_agr_fam_pro$ = dad_apo(0).c_agr_fam_pro
    
     'verifica o agrupamento da família
    If Val(c_agr_fam_pro$) = 1 Then ' AUTO
        ' armazena nome do fabricante, linha e modelo do veículo da
        ' apólice selecionada
        gr_apo.Col = 1
        ' nome do fabricante
        n_fbr_aut$ = Trim$(gr_apo.Text)
        gr_apo.Col = 2
        ' nome da linha
        n_lin_aut$ = Trim$(gr_apo.Text)
        gr_apo.Col = 3
        ' nome do modelo
        n_mod_aut$ = Trim$(gr_apo.Text)
    ElseIf Val(c_agr_fam_pro$) = 4 Then ' VIDA
        e_osg$ = dad_apo(0).e_osg
    End If
    
    ' seleciona aditamentos da apólice na tabela dbnprod..tb_adi
    If Not fu_sel_adi() Then
        Screen.MousePointer = DEFAULT
        MsgBox "Apólice sem Aditamentos.", , txt_msg$
        su_habilita_botao bu3d_ok, True
        Exit Sub
    End If
    
    ' carrega a data de início e fim de vigência da apólice para cada aditamento
    If Not fu_carr_d_adi() Then
        Screen.MousePointer = DEFAULT
        Exit Sub
    End If

    ' cris - 15/01/2002 - inicio
    Dim j   As Integer
    For i% = 1 To UBound(dad_sit_mcf)
        For j% = 0 To UBound(dad_adi)
            If Val(dad_adi(j%).c_mot_sit_mcf) = Val(dad_sit_mcf(i%).c_mot_sit_mcf) Then
                dad_adi(j%).t_mot_sit_mcf = dad_sit_mcf(i%).t_mot_sit_mcf
                Exit For
            End If
        Next j%
    Next i%
    ' cris - 15/01/2002 - fim

    IND_CHAMADA_PLACA_CHASSIS% = False
    If CONSULTA_POR_ITEM% = True Then
        SU_TRATAMENTO_CLIENTE
        FORM7_ATIVADO = True
        IND_CHAMADA_PLACA_CHASSIS% = True
        Me.Hide
        Load R1FAB007
        Exit Sub
    End If

    ' Se for encontrado somente 1 aditamento, não será exibida a tela
    ' com a relação dos aditamentos (listbox). Será exibida a 2a. tela.
    If li_aditamentos.ListCount = 1 Or acesso% = 4 Then
        ' se trata de uma pesquisa por proposta e ao escolher a apólice
        ' o aditamento deve vir posicionado c/ a proposta informada na 1a. tela
        If acesso% = 4 Then
            ' seleciona o elemento do array dad_adi() correspondente à proposta pesquisada
            i% = -1
            
            ' se existir somente um aditamento para apólice, não é necessário incrementar o contador para posicionar o aditamento
            Do
                i% = i% + 1
                If Val(u_prp$) = Val(dad_adi(i%).u_prp) Then
                    Exit Do
                End If

            Loop Until i% = UBound(dad_adi)
            
            ' seleciona o aditamento correspondente àquela proposta
            U_ADI$ = dad_adi(i%).U_ADI
            d_ini_vig_adi$ = dad_adi(i%).d_ini_vig_adi
        Else
            i% = 0      ' cris - 15/01/2002
            U_ADI$ = "0"
            d_ini_vig_adi$ = dad_adi(i%).d_ini_vig_adi
        End If
    
        SU_Item_Segurado
    ElseIf li_aditamentos.ListCount > 1 Then
' se existirem mais de um aditamento para a apólice, deverá ser exibida a relação c/ todos os aditamentos.
        fr3d_Segurado.Visible = False
        fr3d_Apolices.Visible = False
        fr3d_Aditamento.Visible = True
        li_aditamentos.Enabled = True
        su_habilita_botao BU3D_Volta, True
            
        ' exibe no frame de aditamentos, o número da apólice
        'PauloFLopes - GRALHA AZUL - 4/1/2001
        lb_apolice1.Caption = Format$(c_cia_ita$, "00") & "." & _
                Format$(c_rmo$, "00") & "." & _
                Format(u_apo_pnc$, "000000000") & "." & _
                Format$(u_apo_dpd$, "0000000")
        li_aditamentos.ListIndex = li_aditamentos.ListCount - 1
        fr3d_Aditamento.Visible = False
        fr3d_Apolices.Visible = True
        Exit Sub
    End If
    Screen.MousePointer = DEFAULT

End Sub

Private Sub li_homonimo_click()
      
    If bg_click Then
        
        If Not i_PesquisaLocal Then
            c_idt_pes$ = Mid$(li_Homonimo.ItemData(li_Homonimo.ListIndex), 1, 8)
            n_pes$ = UCase$(li_Homonimo.List(li_Homonimo.ListIndex))
        
            'armazena a posição do foco no listbox
            pos_foco_lst% = Val(Mid$(li_Homonimo.List(li_Homonimo.ListIndex), 81, 6))
        
            su_habilita_botao bu3d_ok, True
            bu3d_ok.SetFocus
        Else
            'Pereira 18/08/2003 localiza o objeto segurado de acrodo com a posição da lista
            c_osg$ = dad_loc(li_Homonimo.ListIndex + 1).c_osg
            e_osg$ = dad_loc(li_Homonimo.ListIndex + 1).e_osg
            u_vrs_osg$ = dad_loc(li_Homonimo.ListIndex + 1).u_vrs_osg
            n_uf$ = dad_loc(li_Homonimo.ListIndex + 1).n_uf
            ' seleciona dados do item segurado da apólice (produto RPM)
            If Not fu_sel_his_isg_apo3() Then
                Screen.MousePointer = DEFAULT
                MsgBox "Dados do Item Segurado não encontrados.", , txt_msg$
                su_habilita_botao bu3d_ok, True
                su_posiciona_foco tb_n_cdd
                Exit Sub
            End If
        End If
    End If
    
    li_homonimo_dblclick

End Sub

Private Sub li_homonimo_dblclick()
        
    Screen.MousePointer = HOURGLASS
       
    ' seleciona dados de apólice na tabela dbnprod..tb_cli_apo
    If Not i_PesquisaLocal Then
        If Not fu_sel_cli_apo2() Then
            Screen.MousePointer = DEFAULT
            MsgBox "Não existe Apólice.", , txt_msg$
            Exit Sub
        End If
        
        If Not fu_sel_osg_aut() Then
            Exit Sub
        End If
        
        ' pesquisa dados do histórico de dados técnicos, fabricante, linha
        ' e modelo do auto
        If Not fu_pesquisa_apolice() Then
            Screen.MousePointer = DEFAULT
            li_aditamentos.Clear
            Exit Sub
        End If
    End If
    'carrega os dados da apólice no grid
    su_carrega_apolice
    
    Screen.MousePointer = DEFAULT
    
End Sub

Private Sub li_Homonimo_GotFocus()
        
    su_habilita_botao bu3d_ok, False

End Sub

Private Sub li_isg_click()
  
    ' utilizado para array de dados do Item Segurado
    Dim i   As Integer
    
    If bg_click Then
        c_isg$ = li_isg.ItemData(li_isg.ListIndex)
        n_isg$ = Trim$(li_isg.Text)
        
        ' seleciona dados do Item Segurado
        For i% = 0 To UBound(dad_isg)
            
            If dad_isg(i%).c_isg = c_isg$ Then
                c_seg_reg$ = Trim$(dad_isg(i%).c_seg_reg)
                t_isg$ = Trim$(dad_isg(i%).t_isg)
                c_reg_utl$ = Trim$(dad_isg(i%).c_reg_utl)
                q_moe_vba@ = dad_isg(i%).q_moe_vba
                'c_isg$ = Trim$(dad_isg(i%).c_isg)
                c_osg$ = Trim$(dad_isg(i%).c_osg)
                e_osg$ = Trim$(dad_isg(i%).e_osg)
                u_vrs_osg$ = Trim$(dad_isg(i%).u_vrs_osg)
                Exit For
            End If
        
        Next i%
        
        If c_agr_fam_pro$ = "5" Or c_agr_fam_pro$ = "6" Then
            li_isg_dblclick
        Else
            su_habilita_botao bu3d_ok, True
            bu3d_ok.SetFocus
        End If
    
    End If
    
    li_isg_dblclick

End Sub

Private Sub li_isg_dblclick()
  
    Screen.MousePointer = HOURGLASS
    
    SU_Item_Segurado
    
    Screen.MousePointer = DEFAULT

End Sub

Private Sub me_cep_Change()
        
    ' verifica se todos os campos referentes a endereço estão preenchidos
    If Trim$(tb_n_cdd.Text) <> Empty And Trim$(tb_uf.Text) <> Empty And Len(me_cep.ClipText) = 8 And Trim$(tb_u_lgd.Text) <> Empty Then
        ' habilita botão
        If Not bu3d_ok.Enabled Then
            su_habilita_botao bu3d_ok, True
            
        End If
    Else
        ' desabilita botão
        If bu3d_ok.Enabled Then
            su_habilita_botao bu3d_ok, False
        
        End If
    End If
    
    If Len(me_cep.ClipText) = 8 Then
        SendKeys "{tab}", True 'Modif. por Helder (OPUS), 8/3/99
    End If
    
    c_cep$ = Trim$(Mid$(me_cep.Text, 1, 5) & Mid$(me_cep.Text, 7, 3))

End Sub

Private Sub me_cep_KeyPress(KeyAscii As Integer)
        
    KeyAscii = Asc(UCase$(Chr$(KeyAscii)))

End Sub

Private Sub op3d_e_pes_Click(Value As Integer)
        
    ' tipo de cliente
    e_pes$ = IIf(op3d_e_pes.Value, "F", "J")
    
    ' se nome a ser pesquisado estiver preenchido, habilita botão
    If tb_n_pes.Text = Empty And op3d_e_pes.Value = True Or op3d_e_pesj.Value = True Then
        su_habilita_botao bu3d_ok, False
    Else
        su_habilita_botao bu3d_ok, True
    End If

End Sub

Private Sub op3d_e_pesj_Click(Value As Integer)
    
    ' tipo de cliente
    e_pes$ = IIf(op3d_e_pesj.Value, "J", "F")

    ' se nome a ser pesquisado for informado, habilita botão
    If tb_n_pes.Text = Empty And op3d_e_pes.Value = False Or op3d_e_pesj.Value = False Then
        su_habilita_botao bu3d_ok, False
    Else
        su_habilita_botao bu3d_ok, True
    End If

End Sub

Private Sub opt_c_af_Click()
    

    su_habilita_botao bu3d_ok, opt_c_af.Value
    
    c_isg_agf = "1"
    
End Sub

Private Sub opt_s_af_Click()
    
    su_habilita_botao bu3d_ok, opt_s_af.Value
    
    c_isg_agf = "0"
    
End Sub



Private Sub pa3d_Pessoa_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
        
    PA3D_Status.Caption = "R1FAB001 - Tipo de Pessoa - Física/Jurídica"

End Sub

Private Sub su_Aditamento()

    ' contador auxiliar utilizado para acessar as linhas do array de
    ' dados da apólice
    Dim i As Integer
    
    ' o número da proposta será utilizado para verificar qual
    ' aditamento corresponde à proposta pesquisada.
    ' Posicionamento automático do aditamento correspondente.
    u_prp$ = Trim$(tb_u_prp.Text)
    
    ' verifica se a apólice se encontra na tabela dbnprod..tb_apo
    If Not fu_sel_apo_objeto() Then
        Screen.MousePointer = DEFAULT
        MsgBox "Apólice não encontrada.", , txt_msg$
        su_habilita_botao bu3d_ok, True
        Exit Sub
    Else
        'apólice anterior
        c_cia_ita_ant$ = dad_apo(0).c_cia_ita_ant
        c_rmo_ant$ = dad_apo(0).c_rmo_ant
        u_apo_pnc_ant$ = dad_apo(0).u_apo_pnc_ant
        u_apo_dpd_ant$ = dad_apo(0).u_apo_dpd_ant
    End If
    
    ' seleciona o elemento do array dad_adi() correspondente à
    ' proposta pesquisada
    i% = -1
    
    ' se existir somente um aditamento para apólice, não é necessário
    ' incrementar o contador para posicionar o aditamento
    Do
        i% = i% + 1
        If Val(u_prp$) = Val(dad_adi(i%).u_prp) Then
            Exit Do
        End If
    
    Loop Until i% = UBound(dad_adi)
    
    ' seleciona o aditamento correspondente àquela proposta
    U_ADI$ = dad_adi(i%).U_ADI
    
    SU_Item_Segurado

End Sub

Private Sub su_Dados_Aditamento(n_text As TextBox, Msg As String, acesso As Integer)

'Parâmetros:
'n_text  -> nome do controle (TextBox)
'msg     -> mensagem a ser exibida, conforme o controle
'acesso  -> '0 -> pesquisa por número da apólice
            '1 -> tratamento para pesquisa por nome do segurado
            '2 -> consulta pela placa do veículo
            '3 -> pesquisa pelo chassi, chassi + placa, chassi + placa + proposta
            '4 -> consulta de apólice por número de proposta
            '5 -> pesquisa por dados do endereço (Consulta RPM)
    
    ' contador auxiliar utilizado para acessar as linhas do array de dados da apólice
    Dim i As Integer
        
    ' verifica se existe mais de uma apólice com o mesmo chassi
    'Se consulta por placa ou chassis
    If UBound(dad_apo) > 0 Or (CONSULTA_POR_ITEM% = True) Or (CONSULTA_ITEM_CALL_CENTER% = True) Then
                         
        If acesso% <> 2 And acesso <> 3 Then      'Gabriela - 20/07/2001 - para procura por placa e chassi, não precisa ir buscar estes dados
            If Not fu_sel_osg_aut() Then
                Exit Sub
            End If
        End If  'Gabriela - 20/07/2001
        
        'pesquisa dados da apólice (fabricante, linha e modelo do auto)
        If Not fu_pesquisa_apolice() Then
            su_habilita_botao bu3d_ok, True
            su_posiciona_foco n_text 'tb_u_chs_aut
        Else
            'carrega dados da apólice no grid
            su_carrega_apolice
        End If
        
        Screen.MousePointer = DEFAULT
        Exit Sub
    Else
        'apenas 1 apólice foi encontrada
        c_cia_ita$ = dad_apo(0).c_cia_ita
        c_rmo$ = dad_apo(0).c_rmo
        u_apo_pnc$ = dad_apo(0).u_apo_pnc
        u_apo_dpd$ = dad_apo(0).u_apo_dpd
        d_icl_apo$ = dad_apo(0).d_icl_apo
    
        ' seleciona dados do aditamento na tabela dbnprod..tb_adi
        If Not fu_sel_adi() Then
            Screen.MousePointer = DEFAULT
            MsgBox Msg, , txt_msg$
            su_habilita_botao bu3d_ok, True
            su_posiciona_foco n_text
            Exit Sub
        End If
        
        ' carrega a data de início e fim de vigência da apólice para cada aditamento
        If Not fu_carr_d_adi() Then
            su_posiciona_foco n_text
            Exit Sub
        End If
        
        'Renato 06/08/2002 - Inicio
        If c_agr_fam_pro$ = "9" Then
        
            ' carrega a data de competencia da conta mensal
            If Not fu_carr_d_comp() Then
                Screen.MousePointer = DEFAULT
                Exit Sub
            End If
        
        End If
        'Renato 06/08/2002 - Fim
        
        ' cris - 15/01/2002 - inicio
        Dim j   As Integer
        For i% = 1 To UBound(dad_sit_mcf)
            For j% = 0 To UBound(dad_adi)
                If Val(dad_adi(j%).c_mot_sit_mcf) = Val(dad_sit_mcf(i%).c_mot_sit_mcf) Then
                    dad_adi(j%).t_mot_sit_mcf = dad_sit_mcf(i%).t_mot_sit_mcf
                    'Exit For
                End If
            Next j%
        Next i%
        ' cris - 15/01/2002 - fim

        ' se existir mais de um aditamento, exibe a lista dos aditamentos
        If acesso% <> 0 Then
            If acesso% = 4 Then
                i% = 0
                For i% = 0 To UBound(dad_adi)
                    If Val(dad_adi(i%).u_prp) = Val(Trim(n_text)) Then
                        d_ini_vig_adi$ = dad_adi(0).d_ini_vig_adi
                    End If
                Next
            End If
            su_Verifica_Numero_Adit n_text
        End If
            
    'NAO CHAMAR OUTRA VEZ POIS CHAMOU NA ROTINA su_verifica_numero_adit VALDEMIR - 24/09/1998
        If acesso% = 4 And R1FAB001.li_aditamentos.ListCount > 1 Then
            su_Aditamento
        ElseIf acesso% = 0 Then
            su_NroApolice
        End If
    End If
End Sub

Private Sub su_InformaFamProd()

    ' seleciona texto da família/produto
    If Not fu_sel_spr_fam_pro() Then
        Screen.MousePointer = DEFAULT
        MsgBox "Dados de Família/Produto não encontrados.", , "Consulta Apólice"
        SU_Saida
    End If
    
    Me.Caption = "Consulta Apólice"

End Sub

Private Sub su_NroApolice()
    
    ' verifica se o aditamento foi informado na 1a. tela
    If Trim$(tb_u_adi.Text) = Empty Then
        ' se existir mais de um aditamento, exibe a lista dos
        ' aditamentos
        d_ini_vig_adi$ = dad_adi(0).d_ini_vig_adi
            
        su_Verifica_Numero_Adit tb_u_Apo_Pnc
            
        'Alterado pelo Mario -> Diferenciados
        If c_agr_fam_pro$ = "5" Or c_agr_fam_pro$ = "6" Or c_agr_fam_pro$ = "2" Then
            
            If li_aditamentos.ListCount > 1 Then
                'Escolhe o aditamento e dispara o evento Click
                li_aditamentos.ListIndex = li_aditamentos.ListCount - 1
                fr3d_Segurado.Visible = True
                Exit Sub
            End If
    
        End If
    
    Else
        U_ADI$ = Trim$(tb_u_adi.Text)
        
        ' seleciona dados técnicos da apólice na tabela dbnprod..tb_his_tco_apo
        If Not fu_sel_his_tco_apo() Then
            Screen.MousePointer = DEFAULT
            MsgBox "Dados Técnicos não encontrados.", , txt_msg$
            su_habilita_botao bu3d_ok, True
            su_posiciona_foco tb_u_Apo_Pnc
            Exit Sub
        End If
    
        SU_Item_Segurado
    
    End If

End Sub
Private Sub su_Parametro()

    Param$ = Format(c_cia_ita$, "000")
    Param$ = Param$ & Format(c_rmo$, "000")
    Param$ = Param$ & Format(u_apo_pnc$, "000000000")
    Param$ = Param$ & Format(u_apo_dpd$, "000000000")
    Param$ = Param$ & " " & "APO"
    Param$ = Param$ & " " & "NOVA"
    Param$ = Param$ & " " & Format(c_cia_ita$, "000")
    Param$ = Param$ & " " & Format(c_rmo$, "000")
    Param$ = Param$ & " " & Format(u_apo_pnc$, "000000000")
    Param$ = Param$ & " " & Format(u_apo_dpd$, "000000000")
    Param$ = Param$ & " " & 0

End Sub

Private Sub su_PorChassi()
        
    ' seleciona dados sobre o objeto segurado na dbnprod..tb_osg_aut
    If Not fu_sel_osg_aut2() Then
        Screen.MousePointer = DEFAULT
        su_habilita_botao bu3d_ok, True
        
        ' se a placa foi informada, esta é conferida. Em caso de
        ' placas diferentes, exibe mensagem
        If tb_u_plc_aut.Text <> Empty Then
            MsgBox "Placa não confere com Chassi informado.", , txt_msg$
            su_posiciona_foco tb_u_plc_aut
        Else
            MsgBox "Chassi não encontrado.", , txt_msg$
            su_posiciona_foco tb_u_chs_aut
        End If
        
        Exit Sub
    
    End If
    
    'caso a proposta tbém tenha sido informada, faz a consistência de
    ' proposta válida
    If tb_u_prp.Text <> Empty Then
        ' seleciona número da proposta referente a apólice informada
        ' Tabela dbnprod..tb_ctl_emi_prp
        If Not fu_sel_ctl_emi_prp2() Then
            Screen.MousePointer = DEFAULT
            MsgBox "Proposta não confere com Placa e Chassi informados.", , txt_msg$
            su_habilita_botao bu3d_ok, True
            su_posiciona_foco tb_u_prp
            Exit Sub
        End If
    
    End If
    
'*******************************************************
'   Alteração realizada por Opus em 13/01/1999.        *
'   Motivo: run time error no VB5.                     *
'                                                      *
'   Solução: definição da propriedade Visible = True   *
'*******************************************************
    tb_u_chs_aut.Visible = True
    su_Dados_Aditamento tb_u_chs_aut, "Chassi não encontrado", 3

End Sub


Private Sub su_PorEndereco()
    Dim vsAchouLocal As Boolean 'Pereira 18/08/2003 (Controlar se Localizou Obj por Local)
    
    i_PesquisaLocal = True
    
    ' contador auxiliar utilizado para acessar as linhas do array de
    ' dados da apólice
    Dim i As Integer
    
    ' Fonetização. Traz índices encontrados para o endereço informado
    ' (n_idc1, n_idc2, n_idc3)
    su_Fonetiza Trim$(n_cdd$), 3
    
    ' seleciona código de localidade
    If Not fu_carrega_homonimo2() Then
        Screen.MousePointer = DEFAULT
        MsgBox "Dados de Endereço não encontrados.", , txt_msg$
        su_habilita_botao bu3d_ok, True
        su_posiciona_foco tb_n_cdd
        Exit Sub
    End If
    
    'Pereira 18/08/2003
    vsAchouLocal = False
    
    ReDim Preserve dad_loc(0) 'Pereira Inicializa o Array de Locais
    
    ' seleciona dados do endereço do imóvel
    For i% = 0 To UBound(loc_fonet)
        
        c_loc% = loc_fonet(i%).c_loc
        n_loc$ = Trim$(loc_fonet(i%).n_loc)
        c_uf$ = Trim$(loc_fonet(i%).c_uf)
    
        ' seleciona sigla da Unidade Federal
        If Not fu_sel_uf() Then
            Screen.MousePointer = DEFAULT
            MsgBox "Unidade Federal não encontrada.", , txt_msg$
            su_habilita_botao bu3d_ok, True
            su_posiciona_foco tb_n_cdd
            Exit Sub
        End If
    
        ' seleciona dados do Objeto Segurado
        If fu_sel_osg_imv(i%) Then
            vsAchouLocal = True 'Pereira Marca que existe local para o objeto)
        End If
    
    Next i%
    
    If Not vsAchouLocal Then
        Screen.MousePointer = DEFAULT
        MsgBox "Dados do Imóvel não encontrados.", , txt_msg$
        su_habilita_botao bu3d_ok, True
        su_posiciona_foco tb_n_cdd
        Exit Sub
    End If
    
    ' mais de 1 endereço
    If UBound(dad_loc) > 1 Then
        fr3d_Homonimo.Visible = True
        li_aditamentos.Enabled = True
        
        fr3d_Segurado.Visible = False
        fr3d_Apolices.Visible = False
        
        su_habilita_botao BU3D_Volta, True
        Exit Sub
    End If
    
    c_osg$ = dad_loc(1).c_osg
    e_osg$ = dad_loc(1).e_osg
    u_vrs_osg$ = dad_loc(1).u_vrs_osg
    n_uf$ = dad_loc(1).n_uf
    
    ' seleciona dados do item segurado da apólice (produto RPM)
    If Not fu_sel_his_isg_apo3() Then
        Screen.MousePointer = DEFAULT
        MsgBox "Dados do Item Segurado não encontrados.", , txt_msg$
        su_habilita_botao bu3d_ok, True
        su_posiciona_foco tb_n_cdd
        Exit Sub
    End If
    
'*******************************************************
'   Alteração realizada por Opus em 13/01/1999.        *
'   Motivo: run time error no VB5.                     *
'                                                      *
'   Solução: definição da propriedade Visible = True   *
'*******************************************************
    tb_n_cdd.Visible = True
    su_Dados_Aditamento tb_n_cdd, "Placa sem aditamentos", 5

End Sub

Private Sub SU_PorMainframe()
        
    'se apólice Itaú
    'If c_cia_ita_mfr$ = "1" Or c_cia_ita_mfr$ = "9" Then   'v68 Emilio 22/05/2008
    'If c_cia_ita_mfr$ = "1" Or c_cia_ita_mfr$ = "9" Or c_cia_ita_mfr$ = "32" Then   'v68 Emilio 22/05/2008
    'If c_cia_ita_mfr$ = "1" Or c_cia_ita_mfr$ = "33" Or c_cia_ita_mfr$ = "9" Or c_cia_ita_mfr$ = "32"  Then   'Adelamg 21/10/2009
     If c_cia_ita_mfr$ = "1" Or c_cia_ita_mfr$ = "33" Or c_cia_ita_mfr$ = "9" Or c_cia_ita_mfr$ = "32" Or c_cia_ita_mfr$ = "99" Then   'Gisely - SS_113265 - 12/11/2009
        If Not fu_sel_apo_mfr_ptn_nova() Then
        
            'If c_cia_ita_mfr$ = "1" Then
            If c_cia_ita_mfr$ = "1" Or c_cia_ita_mfr$ = "33" Then 'Adelamg 21/10/2009
                MsgBox "Apólice Itaú do Mainframe não encontrada na Nova Arquitetura.", 48
            'v68 Emilio 22/05/2008 - início
            ElseIf c_cia_ita_mfr$ = "32" Then
                If Not fu_ctl_mvp_g14545() Then
                    MsgBox "Nº de apólice Itauprev não encontrado.", 48
                    If tb_u_apo_itp.Visible = True And tb_u_apo_itp.Enabled = True Then tb_u_apo_itp.SetFocus   'v69 Emilio 03/06/2008
                Else
                    MsgBox msg_mig_itp
                End If
            'v68 Emilio 22/05/2008 - fim
            
            'Início ..Gisely - SS_113265 - 17/11/2009
            ElseIf c_cia_ita_mfr$ = "99" Then
                MsgBox "Nº de apólice UBB Vida PJ não encontrado.", 48
            'Fim .....Gisely - SS_113265 - 17/11/2009
            
            Else
                MsgBox "Nº de apólice AGF não encontrado.", 48
            End If
            
            Exit Sub
        End If
        
        tb_c_Cia_ita.Text = c_cia_ita$
        tb_c_Rmo.Text = c_rmo$
        tb_u_Apo_Pnc.Text = u_apo_pnc$
        tb_u_Apo_Dpd.Text = u_apo_dpd$
        lb_c_isg.Caption = c_isg$
    
    'se apólice Banerj
    ElseIf c_cia_ita_mfr$ = "7" Then
        
        u_apo_mfr_opf$ = Format(c_rmo_bnj$, "00") & Format(c_suc_bnj$, "00") & _
                Format(c_doc_bnj$, "0") & Format(u_apo_pnc_mfr$, "000000000")
        
        'u_ite_apo_mfr$ = Format(TB_ISG_MFR.Text, "0000000000") 'v68 Emilio 22/05/2008
        u_ite_apo_mfr$ = Format(u_isg_mfr, "0000000000")        'v68 Emilio 22/05/2008
        
        If Not fu_sel_apo_mfr_ptn_bnj() Then
            MsgBox "Apólice Banerj do Mainframe não encontrada na Nova Arquitetura.", 48
            Exit Sub
        End If
        
        tb_c_Cia_ita.Text = c_cia_ita$
        tb_c_Rmo.Text = c_rmo$
        tb_u_Apo_Pnc.Text = u_apo_pnc$
        tb_u_Apo_Dpd.Text = u_apo_dpd$
        lb_c_isg.Caption = c_isg$
    End If

End Sub

Private Sub su_PorNroCertificado()

'Dim lstrRegistro        As String
Dim lintTotalLinhas     As Integer
    
    If Trim(tb_SubEstipulante) = Empty And Trim(tb_Certificado) = Empty Then
        MsgBox "Nenhuma agência ou certificado foi informado", vbInformation, "Consulta Apólice"
        tb_SubEstipulante.SetFocus
        Exit Sub
    End If
    
    pintTipoSelecao = 0
    
    If Trim(tb_SubEstipulante) <> Empty Then
        tb_SubEstipulante = Format(tb_SubEstipulante, "00000")
    Else
        tb_SubEstipulante = "00000"
    End If
    
    If Trim(tb_Certificado) = Empty Then
        tb_Certificado = "0000000"
    Else
        tb_Certificado = Format(tb_Certificado, "0000000")
    End If
    
    If Val(tb_SubEstipulante) > 0 And Val(tb_Certificado) > 0 Then
        pintTipoSelecao = 1
    ElseIf Val(tb_SubEstipulante) > 0 And Val(tb_Certificado) = 0 Then
        pintTipoSelecao = 2
    ElseIf Val(tb_SubEstipulante) = 0 And Val(tb_Certificado) > 0 Then
        pintTipoSelecao = 3
    End If
    
    Screen.MousePointer = vbHourglass
    
    If Not fu_sel_Certificado() Then
        MsgBox "Apólice não encontrada.", , txt_msg$
        su_habilita_botao bu3d_ok, True
        su_posiciona_foco tb_u_Apo_Pnc
        Screen.MousePointer = vbNormal
        Exit Sub
    Else
        c_pro$ = dad_apo(0).c_pro
        c_rmo$ = dad_apo(0).c_rmo
      'Limpando o Grid de Apolices
        With gr_Apolice
            For lintTotalLinhas = 1 To .Rows
                .Row = i - 1
                .Col = 0: .Text = Empty
                .Col = 1: .Text = Empty
                .Col = 2: .Text = Empty
                .Col = 3: .Text = Empty
                .Col = 4: .Text = Empty
                .Col = 5: .Text = Empty
            Next
        End With
        
        ReDim gstrN_Abv_Pro(UBound(dad_apo))
        ReDim gstrNome(UBound(dad_apo))
        
        For i = 0 To UBound(dad_apo)
            If Fu_Sel_Produto(i) Then
            
                gstrN_Abv_Pro(i) = Trim(SqlRetData$(SqlConn%, 1))
                
                If Fu_Sel_NomeCliente(i) Then
                
                    gstrNome(i) = Trim(SqlRetData$(SqlConn%, 1))
                    
                    With gr_Apolice
                        .Rows = .Rows + 1
                        .Row = i + 1
                        .Col = 0: .Text = gstrN_Abv_Pro(i)
                        .Col = 1: .Text = gstrNome(i)
                        .Col = 2: .Text = dad_apo(i).c_cia_ita
                        .Col = 3: .Text = dad_apo(i).c_rmo
                        .Col = 4: .Text = dad_apo(i).u_apo_pnc
                        .Col = 5: .Text = Format(dad_apo(i).c_cia_ita_ant, "DD/MM/YYYY")
                    End With
                End If
            End If
        Next
        
        gr_Apolice.Rows = gr_Apolice.Rows - 1
        
        If Not fu_sel_osg_aut() Then
            Exit Sub
        End If

        ' pesquisa fabricante, modelo e linha do veículo
        If Not fu_pesquisa_apolice() Then
            su_habilita_botao bu3d_ok, True
            su_posiciona_foco tb_u_plc_aut
        End If

        tb_u_Apo_Pnc.Visible = True
    
        If gLinhasApolice > 1 Then
            fra_Apolice.Top = 720: fra_Apolice.Left = 45
            fra_Apolice.Visible = True
            lb_Label(3).Caption = tb_SubEstipulante & "-" & tb_Certificado
        Else
            su_Dados_Aditamento tb_u_Apo_Pnc, "Apólice sem aditamentos", 0
        End If
    End If
    Screen.MousePointer = vbNormal
End Sub

Private Sub su_PorNroApolice()

    ' verifica se a apólice informada existe na dbnprod..tb_apo
    If Not fu_sel_apo_nroapolice() Then
        'Luciane - 19/03/1998
        'Caso não exista a apólice na tb_apo, será chamado outro executável
        If Not fu_sel_apo_nroapolice_bd_rgd() Then
            Screen.MousePointer = DEFAULT
            MsgBox "Apólice não encontrada.", , txt_msg$
            su_habilita_botao bu3d_ok, True
            su_posiciona_foco tb_u_Apo_Pnc
            Exit Sub
        Else
            'Fecha conexão
            su_fecha_conexao
        
            'Formata os parâmetros para aplicação
            su_Parametro
        
            'v60 Emilio 22/08/2006 - início
            'Obs.: Migração XP para novo catalogador - Função descontinuada
            'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
'            '======================================================================
'            'LUCIANE - 05/07/1999
'            If OSAmbiente = "Windows 3.11" Then
'                ret% = FU_Monitora_Exec(Me, "RBPHS201.EXE " & Param$)
'            Else
'                ret% = FU_Monitora_Exe(Me, CG_DIR_EXE1$ + "RBPHS201.EXE " & Param$, MinEnableFalse%)
'            End If
            ret% = FU_MonitoraExe(Me, "", "RBPHS201.EXE", Param$, , MinEnableFalse%)
            'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
            'v60 Emilio 22/08/2006 - fim
            
            If Not ret% Then
                Screen.MousePointer = DEFAULT
                MsgBox "Não foi possível executar o projeto." & Chr(13) & "RBPHS201 - Consulta à Base de Dados Reorganizada.", 48
                SqlConn% = FU_Conecta_Servidor(Servidor_Id%)
                Exit Sub
            End If

            'Efetua a chamada do projeto de consulta a base de dados reorganizada
            'If Not FU_Monitora_Exec(Me, "RBPHS201.EXE " & param$) Then
            '    screen.MousePointer = DEFAULT
            '    MsgBox "Não foi possível executar o projeto." & Chr(13) & "Consulta à Base de Dados Reorganizada.", 48
            '    Sqlconn% = FU_Conecta_Servidor(servidor_id%)
            '    Exit Sub
            'End If

            'LUCIANE - 05/07/1999
            '======================================================================

        
            'Efetua nova conexão
            SqlConn% = FU_Conecta_Servidor(Servidor_Id%)
            Me.Show
                
        End If
    
    Else
        ' apólice anterior
        c_cia_ita_ant$ = dad_apo(0).c_cia_ita_ant
        c_rmo_ant$ = dad_apo(0).c_rmo_ant
        u_apo_pnc_ant$ = dad_apo(0).u_apo_pnc_ant
        u_apo_dpd_ant$ = dad_apo(0).u_apo_dpd_ant
        d_icl_apo$ = dad_apo(0).d_icl_apo
    
        If Not fu_sel_apo_nroapolice(True) Then
            Screen.MousePointer = DEFAULT
            MsgBox "Aditamento não encontrado para a apólice informada.", , txt_msg$
            su_habilita_botao bu3d_ok, True
            su_posiciona_foco tb_u_Apo_Pnc
            Exit Sub
        End If
    
        If Not fu_sel_osg_aut() Then
            Exit Sub
        End If
            
        ' pesquisa fabricante, modelo e linha do veículo
        If Not fu_pesquisa_apolice() Then
            su_habilita_botao bu3d_ok, True
            su_posiciona_foco tb_u_plc_aut
        End If
        
'*******************************************************
'   Alteração realizada por Opus em 13/01/1999.        *
'   Motivo: run time error no VB5.                     *
'                                                      *
'   Solução: definição da propriedade Visible = True   *
'*******************************************************
        tb_u_Apo_Pnc.Visible = True
        su_Dados_Aditamento tb_u_Apo_Pnc, "Apólice sem aditamentos", 0
    
    End If
End Sub
Private Sub su_PorNroProposta()

    Dim i As Integer
    
    ' através do número da proposta, seleciona dados da apólice
    ' na dbnprod..tb_ctl_emi_prp
    If Not fu_sel_ctl_emi_prp1() Then
        Screen.MousePointer = DEFAULT
        MsgBox "Proposta não encontrada para Ramo e Produto selecionados no início da consulta!", MB_ICONINFORMATION, txt_msg$
        su_habilita_botao bu3d_ok, True
        su_posiciona_foco tb_u_prp
        Exit Sub
    End If
    
    c_agr_fam_pro$ = dad_apo(i%).c_agr_fam_pro$
    e_fam_pro$ = dad_apo(i%).e_fam_pro$
    u_apo_pnc_ant$ = Empty
    
    Me.Caption = "Consulta Apólice"
    
'*******************************************************
'   Alteração realizada por Opus em 13/01/1999.        *
'   Motivo: run time error no VB5.                     *
'                                                      *
'   Solução: definição da propriedade Visible = True   *
'*******************************************************
    tb_u_prp.Visible = True
    su_Dados_Aditamento tb_u_prp, "Proposta sem aditamentos", 4
            
End Sub

Private Sub su_PorPlacaVeic()

    ' a pesquisa por placa não permite pesquisar placas a confirmar
    If UCase$(Trim$(tb_u_plc_aut.Text)) = "A/C" Then
        Screen.MousePointer = DEFAULT
        MsgBox "Não foi possível pesquisar Placa informada.", , txt_msg$
        Screen.MousePointer = DEFAULT
        su_posiciona_foco tb_u_plc_aut
        Exit Sub
    End If
    
    ' a pesquisa por placa não permite pesquisar placas com final "00000"
    If Len(tb_u_plc_aut.Text) >= 6 Then
        
        If IsNumeric(Mid$(Trim$(tb_u_plc_aut.Text), 3, Len(tb_u_plc_aut.Text) - 3)) Then
            
            If Val(Mid$(Trim$(tb_u_plc_aut.Text), 3, Len(tb_u_plc_aut.Text) - 3)) = 0 Then
                Screen.MousePointer = DEFAULT
                MsgBox "Não foi possível pesquisar Placa informada.", , txt_msg$
                Screen.MousePointer = DEFAULT
                su_posiciona_foco tb_u_plc_aut
                Exit Sub
            End If
    
        ElseIf IsNumeric(Mid$(Trim$(tb_u_plc_aut.Text), 4, Len(tb_u_plc_aut.Text) - 3)) Then
            
            If Val(Mid$(Trim$(tb_u_plc_aut.Text), 4, Len(tb_u_plc_aut.Text) - 3)) = 0 Then
                Screen.MousePointer = DEFAULT
                MsgBox "Não foi possível pesquisar Placa informada.", , txt_msg$
                Screen.MousePointer = DEFAULT
                su_posiciona_foco tb_u_plc_aut
                Exit Sub
            End If
    
        End If
    
    End If
    
    ' seleciona dados do objeto segurado na dbnprod..tb_osg_aut
    If Not fu_sel_osg_aut3() Then
        Screen.MousePointer = DEFAULT
        MsgBox "Placa não encontrada.", , txt_msg$
        su_habilita_botao bu3d_ok, True
        su_posiciona_foco tb_u_plc_aut
        Exit Sub
    End If
    
'*******************************************************
'   Alteração realizada por Opus em 13/01/1999.        *
'   Motivo: run time error no VB5.                     *
'                                                      *
'   Solução: definição da propriedade Visible = True   *
'*******************************************************
    tb_u_plc_aut.Visible = True
    su_Dados_Aditamento tb_u_plc_aut, "Placa sem aditamentos", 2

End Sub

Private Sub su_PorSegurado()

    ' seleciona o tipo de pessoa
    If op3d_e_pes.Value = True Then
        e_pes$ = "F"
        Tipo% = 1
    Else
        e_pes$ = "J"
        Tipo% = 2
    End If
    
    ' Fonetização. Traz índices encontrados para o nome segurado
    '(n_idc1, n_idc2, n_idc3)
    su_Fonetiza Nome$, Tipo%
    
    ' limpa as variáveis utilizadas na fonetização
    su_limpa_var_fonet
    
    ' procura cliente através dos índices fonéticos
    If Not fu_procura_cliente() Then
        Screen.MousePointer = DEFAULT
        ' se ocorreu um erro na seleção dos clientes, exibir
        ' mensagem de erro. Caso não exista o cliente, exibir
        ' a mensagem de que ele realmente não existe
        If (Err_Syb <> 0) Or (Msg_Syb <> 0) Then
            MsgBox "Não foi possível consultar Cliente informado.", , txt_msg$
        Else
            bu3d_prx_hmn_click
        End If
    
    Else
        ' preenche o listbox com os dados dos clientes encontrados
        su_preenche_lista_clientes pos_array_fonet%, 2
        fr3d_Homonimo.Visible = True
        li_aditamentos.Enabled = True
        su_habilita_botao bu3d_prx_hmn, True
        
        fr3d_Segurado.Visible = False
        fr3d_Apolices.Visible = False
        
        su_habilita_botao BU3D_Volta, True
    End If

End Sub

Private Sub su_TipoPesquisa()

'De acordo com os dados informados da tela, determina o tipo de pesquisa
'
'  acesso% = 0 -> pesquisa por número da apólice
'  acesso% = 1 -> tratamento para pesquisa por nome do segurado
'  acesso% = 2 -> consulta pela placa do veículo
'  acesso% = 3 -> pesquisa pelo chassi, chassi + placa, chassi + placa + proposta
'  acesso% = 4 -> consulta de apólice por número de proposta
'  acesso% = 5 -> pesquisa por endereço
'  acesso% = 6 -> obter o número da nova arquitetura pelo número da apólice
'                 Itaú Seguros ou Banerj Seguros ou AGF ou Itauprev do Mainframe
'  Acesso  = 7 -> Pesquisa por Certificado ou SubEstipulante e Certificado (Gralha Azul - BCL)
'  Acesso  = 8 -> Pesquisa por Número do Título

    If Trim$(tb_c_Cia_ita.Text) <> Empty And Trim$(tb_c_Rmo.Text) <> Empty And Trim$(tb_u_Apo_Pnc.Text) <> Empty And Trim$(tb_u_Apo_Dpd.Text) <> Empty Then
        acesso% = 0
    ElseIf Trim$(tb_u_prp.Text) <> Empty And Trim$(tb_u_chs_aut.Text) = Empty And Trim$(tb_u_plc_aut.Text) = Empty Then
        acesso% = 4
    ElseIf Trim$(tb_SubEstipulante) <> Empty Or Trim$(tb_Certificado) <> Empty Then
        acesso% = 7
    ElseIf Trim$(tb_n_pes.Text) <> Empty Then
        acesso% = 1
    ElseIf Trim$(TB_APO_UBB.Text) <> Empty Then
        acesso% = 11
    Else
        
        If Trim$(tb_u_chs_aut.Text) <> Empty Then
            acesso% = 3
        ElseIf Trim$(tb_u_plc_aut.Text) <> Empty Then
            acesso% = 2
        'v68 Emilio 21/05/2008 - início
        'ElseIf (Trim$(TB_C_T_NEG.Text) <> Empty And Trim$(TB_RMO_MFR.Text) <> Empty And Trim$(TB_U_APO_MFR.Text) <> Empty And Trim$(TB_ISG_MFR.Text) <> Empty) Or (Trim$(tb_c_rmo_bnj.Text) <> Empty And Trim$(tb_c_suc_bnj.Text) <> Empty And Trim$(tb_e_doc_bnj.Text) <> Empty And Trim$(TB_U_APO_MFR.Text) <> Empty And Trim$(TB_ISG_MFR.Text) <> Empty) Or (Trim$(TB_U_APO_AGF.Text) <> Empty) Then
        '    acesso% = 6
        'Migração Itaú Seguros
        ElseIf (Trim$(TB_C_T_NEG.Text) <> Empty And Trim$(TB_RMO_MFR.Text) <> Empty And _
                Trim$(TB_U_APO_MFR.Text) <> Empty And Trim$(TB_ISG_MFR.Text) <> Empty) Then
            acesso% = 6
        'Início .. Gisely - SS_113265 - 12/11/2009
        'Migração UBB
        ElseIf (Trim$(TB_C_SUC_UBB.Text) <> Empty And Trim$(TB_RMO_UBB.Text) <> Empty And _
                Trim$(TB_U_APO_UBB.Text) <> Empty And Trim$(TB_SGR_UBB.Text) <> Empty) Then
            acesso% = 6
        'Fim ..... Gisely - SS_113265 - 12/11/2009
        'Migração Banerj Seguros
        ElseIf (Trim$(tb_c_rmo_bnj.Text) <> Empty And Trim$(tb_c_suc_bnj.Text) <> Empty And _
                Trim$(tb_e_doc_bnj.Text) <> Empty And Trim$(tb_u_apo_bnj.Text) <> Empty And _
                Trim$(tb_isg_bnj.Text) <> Empty) Then
            acesso% = 6
        'Migração AGF
        ElseIf (Trim$(TB_U_APO_AGF.Text) <> Empty) Then
            acesso% = 6
        'Migração Itauprev
        ElseIf (Trim$(tb_c_pro_itp.Text) <> Empty And Trim$(tb_u_apo_itp.Text) <> Empty) Then
            acesso% = 6
        'v68 Emilio 21/05/2008 - fim
        ElseIf Trim$(tb_u_cbn_sor.Text) <> Empty Then
            acesso% = 8
        ElseIf Trim$(tb_u_sav.Text) <> Empty Then
            acesso% = 9
        ElseIf Trim$(tb_u_niu.Text) <> Empty Then
            acesso% = 10
        ElseIf Trim$(tb_n_cdd.Text) <> Empty And Trim$(tb_uf.Text) <> Empty And Len(me_cep.ClipText) = 8 And Trim$(tb_u_lgd.Text) <> Empty Then
            acesso% = 5
        Else
            MsgBox "Não foram informados dados corretos para Consulta.", , txt_msg$
            Exit Sub
        End If
    End If

End Sub

Private Sub su_Verifica_Numero_Adit(tb As TextBox)

    'FOI TRAZIDA DO MODULO R1MAB002 - MARIO
    
    ' Se existir somente um aditamento, não será necessário
    ' exibir o listbox com a relação de todos os aditamentos,
    ' exibindo a 2a. tela.
    If R1FAB001.li_aditamentos.ListCount = 1 Then
        SU_Item_Segurado
    Else
        ' se a apólice tiver mais de um aditamento, deverá ser
        ' exibida a lista destes aditamentos. Após a escolha de um
        ' destes aditamentos, será exibida a 2a. tela.
        R1FAB001.fr3d_Segurado.Visible = False
        R1FAB001.fr3d_Apolices.Visible = False
        R1FAB001.fr3d_Homonimo.Visible = False
        R1FAB001.fr3d_Aditamento.Visible = True
        R1FAB001.li_aditamentos.Enabled = True
        su_habilita_botao R1FAB001.BU3D_Volta, False
        
        ' exibe no frame de aditamentos, o número da apólice
        ' referente aos aditamentos
        'PAULO - GRALHA AZUL - 4/1/2001
        R1FAB001.lb_apolice1.Caption = Format$(c_cia_ita$, "00") & "." & _
                Format$(c_rmo$, "00") & "." & _
                Format$(u_apo_pnc$, "000000000") & "." & _
                Format$(u_apo_dpd$, "0000000")
        
        Screen.MousePointer = DEFAULT
    End If
End Sub

Private Sub TB_APO_UBB_Change()
    
    If TB_APO_UBB.Text <> Empty Then
        su_habilita_botao bu3d_ok, True
    Else
        su_habilita_botao bu3d_ok, False
    End If
    
    If Len(TB_APO_UBB.Text) = TB_APO_UBB.MaxLength Then
       If bu3d_ok.Enabled Then
            bu3d_ok.SetFocus
        Else
            SendKeys "{tab}", True
        End If
    End If
End Sub

Private Sub TB_APO_UBB_KeyPress(KeyAscii As Integer)
    Su_Valida_Numero KeyAscii
End Sub


Private Sub tb_c_cia_ita_Change()
        
    c_cia_ita$ = Trim$(tb_c_Cia_ita.Text)
    
    ' se um dos campos de pesquisa estiver selecionado
    'If tb_n_pes.text <> empty Or (tb_c_cia_ita.text <> empty And tb_c_rmo.text <> empty And tb_u_Apo_Pnc.text <> empty And tb_u_apo_dpd.text <> empty) Or tb_u_prp.text <> empty Or tb_u_chs_aut.text <> empty Or tb_u_plc_aut.text <> empty Then
    If tb_n_pes.Text <> Empty Or (tb_c_Cia_ita.Text <> Empty And tb_c_Rmo.Text <> Empty And tb_u_Apo_Pnc.Text <> Empty And tb_u_Apo_Dpd.Text <> Empty) Or tb_u_prp.Text <> Empty Or tb_u_chs_aut.Text <> Empty Or tb_u_plc_aut.Text <> Empty Or (TB_C_T_NEG.Text <> Empty And TB_RMO_MFR.Text <> Empty And TB_U_APO_MFR.Text <> Empty And TB_ISG_MFR.Text <> Empty) Or tb_u_cbn_sor.Text <> Empty Or tb_u_sav.Text <> Empty Or tb_u_niu.Text <> Empty Then
        su_habilita_botao bu3d_ok, True
    Else
        su_habilita_botao bu3d_ok, False
    End If
    
    If Len(tb_c_Cia_ita.Text) = tb_c_Cia_ita.MaxLength Then
        SendKeys "{tab}", True 'Modif. por Helder (OPUS), 8/3/99
    End If
    
End Sub

Private Sub tb_c_Cia_ita_GotFocus()
        
    tb_c_Cia_ita.SelStart = 0
    tb_c_Cia_ita.SelLength = Len(tb_c_Cia_ita.Text)

End Sub

Private Sub tb_c_Cia_ita_KeyPress(KeyAscii As Integer)
        
    'v68 Emilio 21/05/2008 - início
    'If KeyAscii >= Asc("0") And KeyAscii <= Asc("9") Or KeyAscii = KEY_BACK Then
    '
    'Else
    '    KeyAscii = 0
    'End If
    'v68 Emilio 21/05/2008 - fim
    
    Su_Valida_Numero KeyAscii   'v68 Emilio 21/05/2008

End Sub

Private Sub tb_c_cia_ita_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
        
    PA3D_Status.Caption = "R1FAB001 - Cia. Itaú"

End Sub

Private Sub tb_c_pro_itp_Change()
    
    'v68 Emilio 21/05/2008 - início
    c_pro_itp$ = Trim(tb_c_pro_itp.Text)
    
    If (tb_c_pro_itp.Text <> Empty And tb_u_apo_itp.Text <> Empty) Then
        su_habilita_botao bu3d_ok, True
    Else
        su_habilita_botao bu3d_ok, False
    End If
    
    If Len(tb_c_pro_itp.Text) = tb_c_pro_itp.MaxLength Then
        tb_u_apo_itp.SetFocus
    End If
    'v68 Emilio 21/05/2008 - fim
    
End Sub

Private Sub tb_c_pro_itp_GotFocus()

    Su_Marca_Texto tb_c_pro_itp 'v68 Emilio 22/05/2008
    
End Sub

Private Sub tb_c_pro_itp_KeyPress(KeyAscii As Integer)
    
    Su_Valida_Numero KeyAscii   'v68 Emilio 21/05/2008

End Sub

Private Sub tb_c_pro_itp_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    
    PA3D_Status.Caption = "R1FAB001 - Código do Produto da Itauprev"    'v68 Emilio 21/05/2008

End Sub

Private Sub tb_c_rmo_bnj_Change()
    
    c_rmo_bnj$ = Trim(tb_c_rmo_bnj.Text)
    
    'v68 Emilio 21/05/2008 - início
    ' se um dos campos de pesquisa estiver selecionado
    If (tb_c_rmo_bnj.Text <> Empty And tb_c_suc_bnj.Text <> Empty And _
        tb_e_doc_bnj.Text <> Empty And tb_u_apo_bnj.Text <> Empty And _
        tb_isg_bnj.Text <> Empty) Then
    'v68 Emilio 21/05/2008 - fim
        su_habilita_botao bu3d_ok, True
    Else
        su_habilita_botao bu3d_ok, False
    End If

    If Len(tb_c_rmo_bnj.Text) = tb_c_rmo_bnj.MaxLength Then
        SendKeys "{tab}", True 'Modif. por Helder (OPUS), 8/3/99
    End If

End Sub

Private Sub tb_c_rmo_bnj_GotFocus()
    
    'v68 Emilio 22/05/2008 - início
    'tb_c_rmo_bnj.SelStart = 0
    'tb_c_rmo_bnj.SelLength = Len(tb_c_rmo_bnj.Text)
    
    Su_Marca_Texto tb_c_rmo_bnj
    'v68 Emilio 22/05/2008 - fim

End Sub

Private Sub tb_c_rmo_bnj_KeyPress(KeyAscii As Integer)
    
    'v68 Emilio 21/05/2008 - início
    'If KeyAscii >= Asc("0") And KeyAscii <= Asc("9") Or KeyAscii = KEY_BACK Then
    '
    'Else
    '    KeyAscii = 0
    'End If
    'v68 Emilio 21/05/2008 - fim
    
    Su_Valida_Numero KeyAscii   'v68 Emilio 21/05/2008

End Sub

Private Sub tb_c_rmo_bnj_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
        
    PA3D_Status.Caption = "R1FAB001 - Ramo"

End Sub

Private Sub tb_c_Rmo_Change()
        
    c_rmo$ = Trim$(tb_c_Rmo.Text)
    
    ' se um dos campos de pesquisa estiver preenchido
    'If tb_n_pes.text <> empty Or (tb_c_cia_ita.text <> empty And tb_c_rmo.text <> empty And tb_u_Apo_Pnc.text <> empty And tb_u_apo_dpd.text <> empty) Or tb_u_prp.text <> empty Or tb_u_chs_aut.text <> empty Or tb_u_plc_aut.text <> empty Then
    If tb_n_pes.Text <> Empty Or (tb_c_Cia_ita.Text <> Empty And tb_c_Rmo.Text <> Empty And tb_u_Apo_Pnc.Text <> Empty And tb_u_Apo_Dpd.Text <> Empty) Or tb_u_prp.Text <> Empty Or tb_u_chs_aut.Text <> Empty Or tb_u_plc_aut.Text <> Empty Or (TB_C_T_NEG.Text <> Empty And TB_RMO_MFR.Text <> Empty And TB_U_APO_MFR.Text <> Empty And TB_ISG_MFR.Text <> Empty) Or tb_u_cbn_sor.Text <> Empty Or tb_u_sav.Text <> Empty Or tb_u_niu.Text <> Empty Then
        su_habilita_botao bu3d_ok, True
    Else
        su_habilita_botao bu3d_ok, False
    End If
    
    If Len(tb_c_Rmo.Text) = tb_c_Rmo.MaxLength Then
        SendKeys "{tab}", True 'Modif. por Helder (OPUS), 8/3/99
    End If

End Sub

Private Sub tb_c_Rmo_GotFocus()
        
    tb_c_Rmo.SelStart = 0
    tb_c_Rmo.SelLength = Len(tb_c_Rmo.Text)

End Sub

Private Sub tb_c_Rmo_KeyPress(KeyAscii As Integer)
    
    'v68 Emilio 21/05/2008 - início
    'If KeyAscii >= Asc("0") And KeyAscii <= Asc("9") Or KeyAscii = KEY_BACK Then
    '    'Se a tecla for Backspace e o campo estiver vazio, mover o foco para campo anterior
    '    If KeyAscii = 8 And Len(Trim(tb_c_Rmo.Text)) = 0 Then tb_c_Cia_ita.SetFocus 'v56 Emilio 29/06/2006
    'Else
    '    KeyAscii = 0
    'End If
    'v68 Emilio 21/05/2008 - fim
    
    Su_Valida_Numero KeyAscii                               'v68 Emilio 21/05/2008
    Su_Foco_Texto_Anterior KeyAscii, tb_c_Rmo, tb_c_Cia_ita 'v68 Emilio 21/05/2008

End Sub

Private Sub tb_c_Rmo_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
        
    PA3D_Status.Caption = "R1FAB001 - Ramo"

End Sub

Private Sub tb_c_suc_bnj_Change()

    c_suc_bnj$ = tb_c_suc_bnj.Text

    'v68 Emilio 21/05/2008 - início
    ' se um dos campos de pesquisa estiver selecionado
    If (tb_c_rmo_bnj.Text <> Empty And tb_c_suc_bnj.Text <> Empty And _
        tb_e_doc_bnj.Text <> Empty And tb_u_apo_bnj.Text <> Empty And _
        tb_isg_bnj.Text <> Empty) Then
    'v68 Emilio 21/05/2008 - fim
        su_habilita_botao bu3d_ok, True
    Else
        su_habilita_botao bu3d_ok, False
    End If
    
    If Len(tb_c_suc_bnj.Text) = tb_c_suc_bnj.MaxLength Then
        SendKeys "{tab}", True 'Modif. por Helder (OPUS), 8/3/99
    End If
    
End Sub

Private Sub tb_c_suc_bnj_GotFocus()
        
    'v68 Emilio 22/05/2008 - início
    'tb_c_suc_bnj.SelStart = 0
    'tb_c_suc_bnj.SelLength = Len(tb_c_suc_bnj.Text)
    
    Su_Marca_Texto tb_c_suc_bnj
    'v68 Emilio 22/05/2008 - fim
    
End Sub

Private Sub tb_c_suc_bnj_KeyPress(KeyAscii As Integer)
    
    'v68 Emilio 21/05/2008 - início
    'If KeyAscii >= Asc("0") And KeyAscii <= Asc("9") Or KeyAscii = KEY_BACK Then
    '
    'Else
    '    KeyAscii = 0
    'End If
    'v68 Emilio 21/05/2008 - fim
    
    Su_Valida_Numero KeyAscii                                   'v68 Emilio 21/05/2008
    Su_Foco_Texto_Anterior KeyAscii, tb_c_suc_bnj, tb_c_rmo_bnj 'v68 Emilio 21/05/2008

End Sub

Private Sub tb_c_suc_bnj_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
        
    PA3D_Status.Caption = "R1FAB001 - Sucursal"

End Sub

Private Sub TB_C_SUC_UBB_LostFocus()
    If Len(TB_C_SUC_UBB) < 2 Then
        
       c_suc_ubb = Formata_Zeros(TB_C_SUC_UBB.Text, 2)
                      
    End If
End Sub

Private Sub TB_C_T_NEG_Change()

    c_t_neg$ = Trim(TB_C_T_NEG.Text)
    
    'v68 Emilio 21/05/2008 - início
    ' se um dos campos de pesquisa estiver selecionado
    'If tb_n_pes.Text <> Empty Or (tb_c_Cia_ita.Text <> Empty And tb_c_Rmo.Text <> Empty And tb_u_Apo_Pnc.Text <> Empty And tb_u_Apo_Dpd.Text <> Empty) Or tb_u_prp.Text <> Empty Or tb_u_chs_aut.Text <> Empty Or tb_u_plc_aut.Text <> Empty Or (TB_C_T_NEG.Text <> Empty And TB_RMO_MFR.Text <> Empty And TB_U_APO_MFR.Text <> Empty And TB_ISG_MFR.Text <> Empty) Then
    If (TB_C_T_NEG.Text <> Empty And TB_RMO_MFR.Text <> Empty And _
        TB_U_APO_MFR.Text <> Empty And TB_ISG_MFR.Text <> Empty) Then
    'v68 Emilio 21/05/2008 - fim
        su_habilita_botao bu3d_ok, True
    Else
        su_habilita_botao bu3d_ok, False
    End If

    If Len(TB_C_T_NEG.Text) = TB_C_T_NEG.MaxLength Then
        SendKeys "{tab}", True 'Modif. por Helder (OPUS), 8/3/99
    End If

End Sub
Private Sub TB_C_SUC_UBB_Change()

    'Gisely - SS_113265 - 12/11/2009
    
    c_suc_ubb$ = Trim(TB_C_SUC_UBB.Text)
    
    ' se um dos campos de pesquisa estiver selecionado
    If (TB_C_SUC_UBB.Text <> Empty And TB_RMO_UBB.Text <> Empty And _
        TB_U_APO_UBB.Text <> Empty And TB_SGR_UBB.Text <> Empty) Then
        su_habilita_botao bu3d_ok, True
    Else
        su_habilita_botao bu3d_ok, False
    End If

    If Len(TB_C_SUC_UBB.Text) = TB_C_SUC_UBB.MaxLength Then
        SendKeys "{tab}", True
    End If

End Sub
 Private Sub TB_C_SUC_UBB_GotFocus()

    Su_Marca_Texto TB_C_SUC_UBB     'Gisely - SS_113265 - 12/11/2009

End Sub

Private Sub TB_C_T_NEG_GotFocus()

    Su_Marca_Texto TB_C_T_NEG 'v68 Emilio 21/05/2008

End Sub

Private Sub TB_C_T_NEG_KeyPress(KeyAscii As Integer)

    Su_Valida_Numero KeyAscii   'v68 Emilio 22/05/2008
    
End Sub

Private Sub TB_C_SUC_UBB_KeyPress(KeyAscii As Integer)

    Su_Valida_Numero KeyAscii       'Gisely - SS_113265 - 12/11/2009
    
End Sub


Private Sub TB_C_T_NEG_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    
    PA3D_Status.Caption = "R1FAB001 - Código do Tipo de Negócio"

End Sub

Private Sub TB_C_SUC_UBB_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    
    PA3D_Status.Caption = "R1FAB001 - Código da Sucursal"        'Gisely - SS_113265 - 12/11/2009

End Sub
Private Sub tb_Certificado_Change()
'c_rmo_bnj$ = Trim(tb_c_rmo_bnj.Text)
    
    ' se um dos campos de pesquisa estiver selecionado
    If tb_SubEstipulante <> Empty Or (tb_Certificado <> Empty) Then
        su_habilita_botao bu3d_ok, True
    Else
        su_habilita_botao bu3d_ok, False
    End If
    
    If Len(tb_Certificado.Text) = tb_Certificado.MaxLength Then
        SendKeys "{tab}", True 'Modif. por Helder (OPUS), 8/3/99
    End If

End Sub

Private Sub tb_Certificado_GotFocus()
   
    'v68 Emilio 22/05/2008 - início
    'tb_Certificado.SelStart = 0
    'tb_Certificado.SelLength = Len(tb_Certificado.Text)

    Su_Marca_Texto tb_Certificado
    'v68 Emilio 22/05/2008 - fim
    
End Sub

Private Sub tb_Certificado_KeyPress(KeyAscii As Integer)
    
    'v68 Emilio 21/05/2008 - início
    'If KeyAscii >= Asc("0") And KeyAscii <= Asc("9") Or KeyAscii = KEY_BACK Then
    '
    'Else
    '    KeyAscii = 0
    'End If
    'v68 Emilio 21/05/2008 - fim
    
    Su_Valida_Numero KeyAscii                                   'v68 Emilio 21/05/2008
    
End Sub

Private Sub tb_Certificado_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    PA3D_Status.Caption = "R1FAB001 - Certificado"
End Sub

Private Sub tb_e_doc_bnj_Change()

    c_doc_bnj$ = tb_e_doc_bnj.Text
    
    'v68 Emilio 21/05/2008 - início
    ' se um dos campos de pesquisa estiver selecionado
    If (tb_c_rmo_bnj.Text <> Empty And tb_c_suc_bnj.Text <> Empty And _
        tb_e_doc_bnj.Text <> Empty And tb_u_apo_bnj.Text <> Empty And _
        tb_isg_bnj.Text <> Empty) Then
    'v68 Emilio 21/05/2008 - fim
        su_habilita_botao bu3d_ok, True
    Else
        su_habilita_botao bu3d_ok, False
    End If
    
    If Len(tb_e_doc_bnj.Text) = tb_e_doc_bnj.MaxLength Then
        SendKeys "{tab}", True 'Modif. por Helder (OPUS), 8/3/99
    End If

End Sub

Private Sub tb_e_doc_bnj_GotFocus()
        
    'v68 Emilio 22/05/2008 - início
    'tb_e_doc_bnj.SelStart = 0
    'tb_e_doc_bnj.SelLength = Len(tb_e_doc_bnj.Text)
    
    Su_Marca_Texto tb_e_doc_bnj
    'v68 Emilio 22/05/2008 - fim

End Sub

Private Sub tb_e_doc_bnj_KeyPress(KeyAscii As Integer)
    
    'v68 Emilio 21/05/2008 - início
    'If KeyAscii >= Asc("0") And KeyAscii <= Asc("9") Or KeyAscii = KEY_BACK Then
    '
    'Else
    '    KeyAscii = 0
    'End If
    'v68 Emilio 21/05/2008 - fim
    
    Su_Valida_Numero KeyAscii                                     'v68 Emilio 21/05/2008
    Su_Foco_Texto_Anterior KeyAscii, tb_e_doc_bnj, tb_c_suc_bnj   'v68 Emilio 21/05/2008

End Sub

Private Sub tb_e_doc_bnj_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
        
    PA3D_Status.Caption = "R1FAB001 - Tipo de Documento"

End Sub

Private Sub tb_isg_bnj_Change()

    'v68 Emilio 21/05/2008 - início
    u_isg_mfr$ = Trim(tb_isg_bnj.Text)
    
    If (tb_c_rmo_bnj.Text <> Empty And tb_c_suc_bnj.Text <> Empty And _
        tb_e_doc_bnj.Text <> Empty And tb_u_apo_bnj.Text <> Empty And _
        tb_isg_bnj.Text <> Empty) Then
        su_habilita_botao bu3d_ok, True
    Else
        su_habilita_botao bu3d_ok, False
    End If
    
    If Len(tb_isg_bnj.Text) = tb_isg_bnj.MaxLength Then
        
        If bu3d_ok.Enabled Then
            bu3d_ok.SetFocus
        Else
            SendKeys "{tab}", True 'Modif. por Helder (OPUS), 8/3/99
        End If
    
    End If
    'v68 Emilio 21/05/2008 - fim
    
End Sub

Private Sub tb_isg_bnj_GotFocus()
    
    Su_Marca_Texto tb_isg_bnj 'v68 Emilio 21/05/2008

End Sub

Private Sub tb_isg_bnj_KeyPress(KeyAscii As Integer)
    
    Su_Valida_Numero KeyAscii                                   'v68 Emilio 21/05/2008
    Su_Foco_Texto_Anterior KeyAscii, tb_isg_bnj, tb_u_apo_bnj   'v68 Emilio 21/05/2008
       
End Sub

Private Sub tb_isg_bnj_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    
    PA3D_Status.Caption = "R1FAB001 - Número do Item do Banerj"   'v68 Emilio 21/05/2008

End Sub

Private Sub TB_ISG_MFR_Change()

    u_isg_mfr$ = Trim(TB_ISG_MFR.Text)
    
    'v68 Emilio 21/05/2008 - início
    ' se um dos campos de pesquisa estiver selecionado
    If (TB_C_T_NEG.Text <> Empty And TB_RMO_MFR.Text <> Empty And _
        TB_U_APO_MFR.Text <> Empty And TB_ISG_MFR.Text <> Empty) Then
    'v68 Emilio 21/05/2008 - fim
        su_habilita_botao bu3d_ok, True
    Else
        su_habilita_botao bu3d_ok, False
    End If

    If Len(TB_ISG_MFR.Text) = TB_ISG_MFR.MaxLength Then
        
        If bu3d_ok.Enabled Then
            bu3d_ok.SetFocus
        Else
            SendKeys "{tab}", True 'Modif. por Helder (OPUS), 8/3/99
        End If
    
    End If

End Sub

Private Sub TB_RMO_UBB_LostFocus()
    'Gisely - SS_113266 - 12/11/2009

    c_rmo_ubb = Formata_Zeros(TB_RMO_UBB.Text, 2)
    
End Sub

Private Sub TB_SGR_UBB_Change()

    'Gisely - SS_113265 - 12/11/2009
    
    sgr_ubb$ = Trim(TB_SGR_UBB.Text)
    
    ' se um dos campos de pesquisa estiver selecionado
    If (TB_C_SUC_UBB.Text <> Empty And TB_RMO_UBB.Text <> Empty And _
        TB_U_APO_UBB.Text <> Empty And TB_SGR_UBB.Text <> Empty) Then
        su_habilita_botao bu3d_ok, True
    Else
        su_habilita_botao bu3d_ok, False
    End If

    If Len(TB_SGR_UBB.Text) = TB_SGR_UBB.MaxLength Then
        
        If bu3d_ok.Enabled Then
            bu3d_ok.SetFocus
        Else
            SendKeys "{tab}", True
        End If
    
    End If

End Sub


Private Sub TB_ISG_MFR_GotFocus()

    Su_Marca_Texto TB_ISG_MFR   'v68 Emilio 21/05/2008

End Sub

Private Sub TB_SGR_UBB_GotFocus()

    'Gisely - SS_113265 - 12/11/2009

    Su_Marca_Texto TB_SGR_UBB

End Sub
Private Sub TB_ISG_MFR_KeyPress(KeyAscii As Integer)

    Su_Valida_Numero KeyAscii                                   'v68 Emilio 21/05/2008
    Su_Foco_Texto_Anterior KeyAscii, TB_ISG_MFR, TB_U_APO_MFR   'v68 Emilio 21/05/2008
    
End Sub


Private Sub TB_SGR_UBB_KeyPress(KeyAscii As Integer)

    'Gisely - SS_113265 - 12/11/2009

    Su_Valida_Numero KeyAscii
    Su_Foco_Texto_Anterior KeyAscii, TB_SGR_UBB, TB_U_APO_UBB
    
End Sub
Private Sub TB_ISG_MFR_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    
    PA3D_Status.Caption = "R1FAB001 - Número do Item"

End Sub

Private Sub TB_SGR_UBB_LostFocus()
'Gisely - SS_113266 - 12/11/2009

    sgr_ubb = Formata_Zeros(TB_SGR_UBB.Text, 7)
    
End Sub

Private Sub TB_SGR_UBB_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    
    'Gisely - SS_113265 - 12/11/2009
    
    PA3D_Status.Caption = "R1FAB001 - Subgrupo"

End Sub

Private Sub tb_n_cdd_Change()

    ' verifica se todos os campos referentes a endereço estão preenchidos
    If Trim$(tb_n_cdd.Text) <> Empty And Trim$(tb_uf.Text) <> Empty And Len(me_cep.ClipText) = 8 And Trim$(tb_u_lgd.Text) <> Empty Then
        
        If Not bu3d_ok.Enabled Then
            su_habilita_botao bu3d_ok, True
        End If

    Else
        
        If bu3d_ok.Enabled Then
            su_habilita_botao bu3d_ok, False
        End If

    End If


    If Len(tb_n_cdd.Text) = tb_n_cdd.MaxLength Then
        SendKeys "{tab}", True 'Modif. por Helder (OPUS), 8/3/99
    End If

    n_cdd$ = Trim$(tb_n_cdd.Text)

End Sub

Private Sub tb_n_cdd_GotFocus()
        
    tb_n_cdd.SelStart = 0
    tb_n_cdd.SelLength = Len(tb_n_cdd.Text)

End Sub

Private Sub tb_n_cdd_KeyPress(KeyAscii As Integer)
        
    KeyAscii = Asc(UCase$(Chr$(KeyAscii)))

End Sub

Private Sub tb_n_pes_Change()
    
    Nome$ = Trim$(tb_n_pes.Text)
        
    ' se um dos campos de pesquisa estiver preenchido
    'If tb_n_pes.text <> empty Or (tb_c_cia_ita.text <> empty And tb_c_rmo.text <> empty And tb_u_Apo_Pnc.text <> empty And tb_u_apo_dpd.text <> empty) Or tb_u_prp.text <> empty Or tb_u_chs_aut.text <> empty Or tb_u_plc_aut.text <> empty Then
    If tb_n_pes.Text <> Empty Or (tb_c_Cia_ita.Text <> Empty And tb_c_Rmo.Text <> Empty And tb_u_Apo_Pnc.Text <> Empty And tb_u_Apo_Dpd.Text <> Empty) Or tb_u_prp.Text <> Empty Or tb_u_chs_aut.Text <> Empty Or tb_u_plc_aut.Text <> Empty Or (TB_C_T_NEG.Text <> Empty And TB_RMO_MFR.Text <> Empty And TB_U_APO_MFR.Text <> Empty And TB_ISG_MFR.Text <> Empty) Or tb_u_cbn_sor.Text <> Empty Or tb_u_sav.Text <> Empty Or tb_u_niu.Text <> Empty Then
        su_habilita_botao bu3d_ok, True
    Else
        su_habilita_botao bu3d_ok, False
    End If

End Sub

Private Sub tb_n_pes_GotFocus()
        
    tb_n_pes.SelStart = 0
    tb_n_pes.SelLength = Len(tb_n_pes.Text)

End Sub

Private Sub tb_n_pes_KeyPress(KeyAscii As Integer)
        
    KeyAscii = Asc(UCase$(Chr$(KeyAscii)))
    
    If KeyAscii = 13 Then bu3d_ok_click 'v60 Emilio 22/08/2006

End Sub

Private Sub tb_n_pes_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
        
    PA3D_Status.Caption = "R1FAB001 - Nome do Segurado"

End Sub

Private Sub TB_RMO_MFR_Change()
    
    c_rmo_mfr$ = Trim(TB_RMO_MFR.Text)
    
    'v68 Emilio 21/05/2008 - início
    ' se um dos campos de pesquisa estiver selecionado
    'If tb_n_pes.Text <> Empty Or (tb_c_Cia_ita.Text <> Empty And tb_c_Rmo.Text <> Empty And tb_u_Apo_Pnc.Text <> Empty And tb_u_Apo_Dpd.Text <> Empty) Or tb_u_prp.Text <> Empty Or tb_u_chs_aut.Text <> Empty Or tb_u_plc_aut.Text <> Empty Or (TB_C_T_NEG.Text <> Empty And TB_RMO_MFR.Text <> Empty And TB_U_APO_MFR.Text <> Empty And TB_ISG_MFR.Text <> Empty) Then
    If (TB_C_T_NEG.Text <> Empty And TB_RMO_MFR.Text <> Empty And _
        TB_U_APO_MFR.Text <> Empty And TB_ISG_MFR.Text <> Empty) Then
    'v68 Emilio 21/05/2008 - fim
        su_habilita_botao bu3d_ok, True
    Else
        su_habilita_botao bu3d_ok, False
    End If

    If Len(TB_RMO_MFR.Text) = TB_RMO_MFR.MaxLength Then
        SendKeys "{tab}", True 'Modif. por Helder (OPUS), 8/3/99
    End If

End Sub

Private Sub TB_RMO_UBB_Change()
        
    'Gisely - SS_113265 - 12/11/2009
    
    c_rmo_ubb$ = Trim(TB_RMO_UBB.Text)
    
    ' se um dos campos de pesquisa estiver selecionado
    If (TB_C_SUC_UBB.Text <> Empty And TB_RMO_UBB.Text <> Empty And _
        TB_U_APO_UBB.Text <> Empty And TB_SGR_UBB.Text <> Empty) Then
        su_habilita_botao bu3d_ok, True
    Else
        su_habilita_botao bu3d_ok, False
    End If

    If Len(TB_RMO_UBB.Text) = TB_RMO_UBB.MaxLength Then
        SendKeys "{tab}", True
    End If

End Sub


Private Sub TB_RMO_MFR_GotFocus()
    
    Su_Marca_Texto TB_RMO_MFR 'v68 Emilio 21/05/2008

End Sub

Private Sub TB_RMO_UBB_GotFocus()
    
    Su_Marca_Texto TB_RMO_UBB           'Gisely - SS_113265 - 12/11/2009

End Sub

Private Sub TB_RMO_MFR_KeyPress(KeyAscii As Integer)

    Su_Valida_Numero KeyAscii                               'v68 Emilio 21/05/2008
    Su_Foco_Texto_Anterior KeyAscii, TB_RMO_MFR, TB_C_T_NEG 'v68 Emilio 21/05/2008

End Sub

Private Sub TB_RMO_UBB_KeyPress(KeyAscii As Integer)

    'Gisely - SS_113265 - 12/11/2009

    Su_Valida_Numero KeyAscii
    Su_Foco_Texto_Anterior KeyAscii, TB_RMO_UBB, TB_C_SUC_UBB

End Sub
Private Sub TB_RMO_MFR_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)

    PA3D_Status.Caption = "R1FAB001 - Ramo"

End Sub

Private Sub TB_RMO_UBB_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)

    'Gisely - SS_113265 - 12/11/2009

    PA3D_Status.Caption = "R1FAB001 - Ramo"

End Sub
Private Sub tb_SubEstipulante_Change()
    'c_rmo_bnj$ = Trim(tb_c_rmo_bnj.Text)
    
    ' se um dos campos de pesquisa estiver selecionado
    If tb_SubEstipulante <> Empty Or (tb_Certificado <> Empty) Then
        su_habilita_botao bu3d_ok, True
    Else
        su_habilita_botao bu3d_ok, False
    End If
    
    If Len(tb_SubEstipulante.Text) = tb_SubEstipulante.MaxLength Then
        SendKeys "{tab}", True 'Modif. por Helder (OPUS), 8/3/99
    End If

End Sub

Private Sub tb_SubEstipulante_GotFocus()

    'v68 Emilio 22/05/2008 - início
    'tb_SubEstipulante.SelStart = 0
    'tb_SubEstipulante.SelLength = Len(tb_SubEstipulante.Text)

    Su_Marca_Texto tb_SubEstipulante
    'v68 Emilio 22/05/2008 - fim

End Sub

Private Sub tb_SubEstipulante_KeyPress(KeyAscii As Integer)
    
    'v68 Emilio 21/05/2008 - início
    'If KeyAscii >= Asc("0") And KeyAscii <= Asc("9") Or KeyAscii = KEY_BACK Then
    '
    'Else
    '    KeyAscii = 0
    'End If
    'v68 Emilio 21/05/2008 - fim
    
    Su_Valida_Numero KeyAscii   'v68 Emilio 21/05/2008
    
End Sub

Private Sub tb_SubEstipulante_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    PA3D_Status.Caption = "R1FAB001 - Sub-Estipulante"
End Sub

Private Sub tb_u_adi_Change()
        
    U_ADI$ = Trim$(tb_u_adi.Text)
    
    ' se um dos campos de pesquisa estiver preenchido
    'If tb_n_pes.text <> empty Or (tb_c_cia_ita.text <> empty And tb_c_rmo.text <> empty And tb_u_Apo_Pnc.text <> empty And tb_u_apo_dpd.text <> empty) Or tb_u_prp.text <> empty Or tb_u_chs_aut.text <> empty Or tb_u_plc_aut.text <> empty Then
    If tb_n_pes.Text <> Empty Or (tb_c_Cia_ita.Text <> Empty And tb_c_Rmo.Text <> Empty And tb_u_Apo_Pnc.Text <> Empty And tb_u_Apo_Dpd.Text <> Empty) Or tb_u_prp.Text <> Empty Or tb_u_chs_aut.Text <> Empty Or tb_u_plc_aut.Text <> Empty Or (TB_C_T_NEG.Text <> Empty And TB_RMO_MFR.Text <> Empty And TB_U_APO_MFR.Text <> Empty And TB_ISG_MFR.Text <> Empty) Or tb_u_cbn_sor.Text <> Empty Or tb_u_sav.Text <> Empty Or tb_u_niu.Text <> Empty Then
        su_habilita_botao bu3d_ok, True
    End If

End Sub

Private Sub tb_u_adi_GotFocus()
        
    tb_u_adi.SelStart = 0
    tb_u_adi.SelLength = Len(tb_u_adi.Text)

End Sub

Private Sub tb_u_adi_KeyPress(KeyAscii As Integer)
        
    'v68 Emilio 21/05/2008 - início
    'If KeyAscii >= Asc("0") And KeyAscii <= Asc("9") Or KeyAscii = KEY_BACK Then
    '    'Se a tecla for Backspace e o campo estiver vazio, mover o foco para campo anterior
    '    If KeyAscii = 8 And Len(Trim(tb_u_adi.Text)) = 0 Then tb_u_Apo_Dpd.SetFocus 'v56 Emilio 29/06/2006
    'Else
    '    KeyAscii = 0
    'End If
    'v68 Emilio 21/05/2008 - fim
    
    Su_Valida_Numero KeyAscii                               'v68 Emilio 21/05/2008
    Su_Foco_Texto_Anterior KeyAscii, tb_u_adi, tb_u_Apo_Dpd 'v68 Emilio 21/05/2008

End Sub

Private Sub tb_u_adi_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
        
    PA3D_Status.Caption = "R1FAB001 - Número de Aditamento"

End Sub

Private Sub TB_U_APO_AGF_Change()

    lb_a_f.Visible = False
    opt_s_af.Visible = False
    opt_c_af.Visible = False
    c_isg_agf = ""

    u_apo_agf = Trim$(TB_U_APO_AGF.Text)

    If Trim$(u_apo_agf) <> "" Then
    
        If Trim(u_apo_agf) = "43930000483" Then
            su_habilita_botao bu3d_ok, False
            
            MsgBox "Informar se com ou sem assistência funeral", vbInformation + vbOKOnly, "Consulta Apólice"
        
            lb_a_f.Visible = True
            opt_s_af.Visible = True
            opt_c_af.Visible = True
           
            opt_s_af.Value = False
            opt_c_af.Value = False
            
            c_isg_agf = ""
            
            Exit Sub
            
        End If
        
        su_habilita_botao bu3d_ok, True
    Else
        su_habilita_botao bu3d_ok, False
    End If


End Sub

Private Sub TB_U_APO_AGF_GotFocus()

    Su_Marca_Texto TB_U_APO_AGF 'v68 Emilio 22/05/2008

End Sub


Private Sub TB_U_APO_AGF_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)

    PA3D_Status.Caption = "R1FAB001 - Número da Apólice da AGF"  'v68 Emilio 22/05/2008

End Sub

Private Sub tb_u_apo_bnj_Change()
    
    'v68 Emilio 21/05/2008 - início
    u_apo_pnc_mfr$ = Trim(tb_u_apo_bnj.Text)
    
    If (tb_c_rmo_bnj.Text <> Empty And tb_c_suc_bnj.Text <> Empty And _
        tb_e_doc_bnj.Text <> Empty And tb_u_apo_bnj.Text <> Empty And _
        tb_isg_bnj.Text <> Empty) Then
        su_habilita_botao bu3d_ok, True
    Else
        su_habilita_botao bu3d_ok, False
    End If
    
    If Len(tb_u_apo_bnj.Text) = tb_u_apo_bnj.MaxLength Then
        tb_isg_bnj.SetFocus
    End If
    'v68 Emilio 21/05/2008 - fim
    
End Sub

Private Sub tb_u_apo_bnj_GotFocus()

    Su_Marca_Texto tb_u_apo_bnj 'v68 Emilio 21/05/2008
    
End Sub


Private Sub tb_u_apo_bnj_KeyPress(KeyAscii As Integer)
    
    Su_Valida_Numero KeyAscii                                   'v68 Emilio 21/05/2008
    Su_Foco_Texto_Anterior KeyAscii, tb_u_apo_bnj, tb_e_doc_bnj 'v68 Emilio 21/05/2008

End Sub

Private Sub tb_u_apo_bnj_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)

    PA3D_Status.Caption = "R1FAB001 - Número da Apólice do Banerj"  'v68 Emilio 21/05/2008

End Sub

Private Sub tb_u_Apo_Dpd_Change()
        
    u_apo_dpd$ = Trim$(tb_u_Apo_Dpd.Text)
    
    ' se um dos campos de pesquisa estiver preenchido
    'If tb_n_pes.text <> empty Or (tb_c_cia_ita.text <> empty And tb_c_rmo.text <> empty And tb_u_Apo_Pnc.text <> empty And tb_u_apo_dpd.text <> empty) Or tb_u_prp.text <> empty Or tb_u_chs_aut.text <> empty Or tb_u_plc_aut.text <> empty Then
    If tb_n_pes.Text <> Empty Or (tb_c_Cia_ita.Text <> Empty And tb_c_Rmo.Text <> Empty And tb_u_Apo_Pnc.Text <> Empty And tb_u_Apo_Dpd.Text <> Empty) Or tb_u_prp.Text <> Empty Or tb_u_chs_aut.Text <> Empty Or tb_u_plc_aut.Text <> Empty Or (TB_C_T_NEG.Text <> Empty And TB_RMO_MFR.Text <> Empty And TB_U_APO_MFR.Text <> Empty And TB_ISG_MFR.Text <> Empty) Or tb_u_cbn_sor.Text <> Empty Or tb_u_sav.Text <> Empty Or tb_u_niu.Text <> Empty Then
        su_habilita_botao bu3d_ok, True
    Else
        su_habilita_botao bu3d_ok, False
    End If

End Sub

Private Sub tb_u_Apo_Dpd_GotFocus()
        
    tb_u_Apo_Dpd.SelStart = 0
    tb_u_Apo_Dpd.SelLength = Len(tb_u_Apo_Dpd.Text)

End Sub

Private Sub tb_u_Apo_Dpd_KeyPress(KeyAscii As Integer)
        
    'v68 Emilio 21/05/2008 - início
    'If KeyAscii >= Asc("0") And KeyAscii <= Asc("9") Or KeyAscii = KEY_BACK Then
    '    'Se a tecla for Backspace e o campo estiver vazio, mover o foco para campo anterior
    '    If KeyAscii = 8 And Len(Trim(tb_u_Apo_Dpd.Text)) = 0 Then tb_u_Apo_Pnc.SetFocus 'v56 Emilio 29/06/2006
    'ElseIf KeyAscii = 13 Then
    '    bu3d_ok_click
    'Else
    '    KeyAscii = 0
    'End If
    'v68 Emilio 21/05/2008 - fim
    
    If KeyAscii = 13 Then bu3d_ok_click 'v68 Emilio 22/05/2008
    
    Su_Valida_Numero KeyAscii                                   'v68 Emilio 21/05/2008
    Su_Foco_Texto_Anterior KeyAscii, tb_u_Apo_Dpd, tb_u_Apo_Pnc 'v68 Emilio 21/05/2008

End Sub

Private Sub tb_u_Apo_Dpd_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
        
    PA3D_Status.Caption = "R1FAB001 - Número da Apólice Dependente"

End Sub

Private Sub tb_u_apo_itp_Change()

    'v68 Emilio 22/05/2008 - início
    u_apo_itp$ = Trim(tb_u_apo_itp.Text)

    'If (tb_c_pro_itp.Text <> Empty And tb_u_apo_itp.Text <> Empty) Then
    If tb_u_apo_itp.Text <> Empty Then
        su_habilita_botao bu3d_ok, True
    Else
        su_habilita_botao bu3d_ok, False
    End If

    If Len(tb_u_apo_itp.Text) = tb_u_apo_itp.MaxLength Then
        
        If bu3d_ok.Enabled Then
            bu3d_ok.SetFocus
        Else
            SendKeys "{tab}", True 'Modif. por Helder (OPUS), 8/3/99
        End If
    
    End If
    'v68 Emilio 22/05/2008 - fim
    
End Sub

Private Sub tb_u_apo_itp_GotFocus()

    Su_Marca_Texto tb_u_apo_itp 'v68 Emilio 21/05/2008
    
End Sub

Private Sub tb_u_apo_itp_KeyPress(KeyAscii As Integer)

    If KeyAscii = 13 Then bu3d_ok_click 'v68 Emilio 22/05/2008

    Su_Valida_Numero KeyAscii                                   'v68 Emilio 21/05/2008
    Su_Foco_Texto_Anterior KeyAscii, tb_u_apo_itp, tb_c_pro_itp 'v68 Emilio 21/05/2008

End Sub

Private Sub tb_u_apo_itp_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)

    PA3D_Status.Caption = "R1FAB001 - Número da Apólice da Itauprev"    'v68 Emilio 21/05/2008

End Sub

Private Sub TB_U_APO_MFR_Change()
    
    u_apo_pnc_mfr$ = Trim(TB_U_APO_MFR.Text)
    
    'v68 Emilio 21/05/2008 - início
    ' se um dos campos de pesquisa estiver selecionado
    If (TB_C_T_NEG.Text <> Empty And TB_RMO_MFR.Text <> Empty And _
        TB_U_APO_MFR.Text <> Empty And TB_ISG_MFR.Text <> Empty) Then
    'v68 Emilio 21/05/2008 - fim
        su_habilita_botao bu3d_ok, True
    Else
        su_habilita_botao bu3d_ok, False
    End If

    If Len(TB_U_APO_MFR.Text) = TB_U_APO_MFR.MaxLength Then
        SendKeys "{tab}", True 'Modif. por Helder (OPUS), 8/3/99
    End If

End Sub

Private Sub TB_U_APO_UBB_Change()
    
    'Gisely - SS_113265 - 12/11/2009
    
    u_apo_pnc_ubb$ = Trim(TB_U_APO_UBB.Text)
    
    ' se um dos campos de pesquisa estiver selecionado
    If (TB_C_SUC_UBB.Text <> Empty And TB_RMO_UBB.Text <> Empty And _
        TB_U_APO_UBB.Text <> Empty And TB_SGR_UBB.Text <> Empty) Then
        su_habilita_botao bu3d_ok, True
    Else
        su_habilita_botao bu3d_ok, False
    End If

    If Len(TB_U_APO_UBB.Text) = TB_U_APO_UBB.MaxLength Then
        SendKeys "{tab}", True
    End If

End Sub


Private Sub TB_U_APO_MFR_GotFocus()

    Su_Marca_Texto TB_U_APO_MFR 'v68 Emilio 21/05/2008

End Sub

Private Sub TB_U_APO_UBB_GotFocus()

    Su_Marca_Texto TB_U_APO_UBB             'Gisely - SS_113265 - 12/11/2009

End Sub

Private Sub TB_U_APO_MFR_KeyPress(KeyAscii As Integer)

    Su_Valida_Numero KeyAscii                                   'v68 Emilio 21/05/2008
    Su_Foco_Texto_Anterior KeyAscii, TB_U_APO_MFR, TB_RMO_MFR   'v68 Emilio 21/05/2008

End Sub

Private Sub TB_U_APO_UBB_KeyPress(KeyAscii As Integer)

    'GIsely - SS_113265 - 12/11/2009

    Su_Valida_Numero KeyAscii
    Su_Foco_Texto_Anterior KeyAscii, TB_U_APO_UBB, TB_RMO_UBB

End Sub
Private Sub TB_U_APO_MFR_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    
    PA3D_Status.Caption = "R1FAB001 - Número da Apólice do Mainframe"

End Sub


Private Sub TB_U_APO_UBB_LostFocus()
    If Len(TB_U_APO_UBB) < 9 Then
        
       u_apo_pnc_ubb = Formata_Zeros(TB_U_APO_UBB.Text, 9)
                
    End If
End Sub

Private Sub TB_U_APO_UBB_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    
    PA3D_Status.Caption = "R1FAB001 - Número da Apólice"

End Sub
Private Sub tb_u_Apo_Pnc_Change()
        
    u_apo_pnc$ = Trim$(tb_u_Apo_Pnc.Text)
    
    ' se um dos campos de pesquisa estiver preenchido
    'If tb_n_pes.text <> empty Or (tb_c_cia_ita.text <> empty And tb_c_rmo.text <> empty And tb_u_Apo_Pnc.text <> empty And tb_u_apo_dpd.text <> empty) Or tb_u_prp.text <> empty Or tb_u_chs_aut.text <> empty Or tb_u_plc_aut.text <> empty Then
    If tb_n_pes.Text <> Empty Or (tb_c_Cia_ita.Text <> Empty And tb_c_Rmo.Text <> Empty And tb_u_Apo_Pnc.Text <> Empty And tb_u_Apo_Dpd.Text <> Empty) Or tb_u_prp.Text <> Empty Or tb_u_chs_aut.Text <> Empty Or tb_u_plc_aut.Text <> Empty Or (TB_C_T_NEG.Text <> Empty And TB_RMO_MFR.Text <> Empty And TB_U_APO_MFR.Text <> Empty And TB_ISG_MFR.Text <> Empty) Or tb_u_cbn_sor.Text <> Empty Or tb_u_sav.Text <> Empty Or tb_u_niu.Text <> Empty Then
        su_habilita_botao bu3d_ok, True
    Else
        su_habilita_botao bu3d_ok, False
    End If
    
    If Len(tb_u_Apo_Pnc.Text) = tb_u_Apo_Pnc.MaxLength Then
        SendKeys "{tab}", True 'Modif. por Helder (OPUS), 8/3/99
    End If
    
End Sub

Private Sub tb_u_apo_pnc_GotFocus()
        
    tb_u_Apo_Pnc.SelStart = 0
    tb_u_Apo_Pnc.SelLength = Len(tb_u_Apo_Pnc.Text)

End Sub

Private Sub tb_u_Apo_Pnc_KeyPress(KeyAscii As Integer)
    
    'v68 Emilio 21/05/2008 - início
    'If KeyAscii >= Asc("0") And KeyAscii <= Asc("9") Or KeyAscii = KEY_BACK Then
    '    'Se a tecla for Backspace e o campo estiver vazio, mover o foco para campo anterior
    '    If KeyAscii = 8 And Len(Trim(tb_u_Apo_Pnc.Text)) = 0 Then tb_c_Rmo.SetFocus 'v56 Emilio 29/06/2006
    'ElseIf KeyAscii = 13 Then
    '    bu3d_ok_click
    'Else
    '    KeyAscii = 0
    'End If
    'v68 Emilio 21/05/2008 - fim
    
    If KeyAscii = 13 Then bu3d_ok_click 'v68 Emilio 22/05/2008
    
    Su_Valida_Numero KeyAscii                                   'v68 Emilio 21/05/2008
    Su_Foco_Texto_Anterior KeyAscii, tb_u_Apo_Pnc, tb_c_Rmo     'v68 Emilio 21/05/2008
    
    If KeyAscii >= Asc("0") And KeyAscii <= Asc("9") Then tb_u_Apo_Dpd.Text = "0000000"
    
End Sub

Private Sub tb_u_Apo_Pnc_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
        
    PA3D_Status.Caption = "R1FAB001 - Número da Apólice Principal"

End Sub

Private Sub tb_u_cbn_sor_Change()

    u_cbn_sor$ = Trim$(tb_u_cbn_sor.Text)
    'CONSULTA_POR_ITEM% = False

    ' se um dos campos de pesquisa estiver preenchido
    If tb_n_pes.Text <> Empty Or (tb_c_Cia_ita.Text <> Empty And tb_c_Rmo.Text <> Empty And tb_u_Apo_Pnc.Text <> Empty And tb_u_Apo_Dpd.Text <> Empty) Or tb_u_prp.Text <> Empty Or tb_u_chs_aut.Text <> Empty Or tb_u_plc_aut.Text <> Empty Or (TB_C_T_NEG.Text <> Empty And TB_RMO_MFR.Text <> Empty And TB_U_APO_MFR.Text <> Empty And TB_ISG_MFR.Text <> Empty) Or tb_u_cbn_sor.Text <> Empty Or tb_u_sav.Text <> Empty Or tb_u_niu.Text <> Empty Then
        'su_habilita_botao Bu3d_chama_item, False
        su_habilita_botao bu3d_ok, True
    Else
        'su_habilita_botao Bu3d_chama_item, False
        su_habilita_botao bu3d_ok, False
    End If

End Sub

Private Sub tb_u_cbn_sor_GotFocus()

    tb_u_cbn_sor.SelStart = 0
    tb_u_cbn_sor.SelLength = Len(tb_u_cbn_sor.Text)

End Sub


Private Sub tb_u_cbn_sor_KeyPress(KeyAscii As Integer)

    'v68 Emilio 21/05/2008 - início
    'If KeyAscii >= Asc("0") And KeyAscii <= Asc("9") Or KeyAscii = KEY_BACK Then
    '
    'Else
    '    KeyAscii = 0
    'End If
    'v68 Emilio 21/05/2008 - fim
    
    Su_Valida_Numero KeyAscii   'v68 Emilio 21/05/2008

End Sub

Private Sub tb_u_cbn_sor_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)

   PA3D_Status.Caption = "R1FAB001 - Número do Sorteio"

End Sub

Private Sub tb_u_chs_aut_Change()
        
    u_chs_aut$ = Trim$(tb_u_chs_aut.Text)
    CONSULTA_POR_ITEM% = False

    ' se um dos campos de pesquisa estiver preenchido
    If tb_n_pes.Text <> Empty Or (tb_c_Cia_ita.Text <> Empty And tb_c_Rmo.Text <> Empty And tb_u_Apo_Pnc.Text <> Empty And tb_u_Apo_Dpd.Text <> Empty) Or tb_u_prp.Text <> Empty Or tb_u_chs_aut.Text <> Empty Or tb_u_plc_aut.Text <> Empty Or (TB_C_T_NEG.Text <> Empty And TB_RMO_MFR.Text <> Empty And TB_U_APO_MFR.Text <> Empty And TB_ISG_MFR.Text <> Empty) Or tb_u_cbn_sor.Text <> Empty Or tb_u_sav.Text <> Empty Or tb_u_niu.Text <> Empty Then
        su_habilita_botao Bu3d_chama_item, True
        su_habilita_botao bu3d_ok, True
    Else
        su_habilita_botao Bu3d_chama_item, False
        su_habilita_botao bu3d_ok, False
    End If

End Sub

Private Sub tb_u_chs_aut_GotFocus()
        
    tb_u_chs_aut.SelStart = 0
    tb_u_chs_aut.SelLength = Len(tb_u_chs_aut.Text)

End Sub

Private Sub tb_u_chs_aut_KeyPress(KeyAscii As Integer)
        
    KeyAscii = Asc(UCase$(Chr$(KeyAscii)))

End Sub

Private Sub tb_u_chs_aut_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
        
    PA3D_Status.Caption = "R1FAB001 - Número do Chassi"

End Sub

Private Sub tb_u_lgd_Change()
        
    ' verifica se todos os campos referentes a endereço estão preenchidos
    If Trim$(tb_n_cdd.Text) <> Empty And Trim$(tb_uf.Text) <> Empty And Len(me_cep.ClipText) = 8 And Trim$(tb_u_lgd.Text) <> Empty Then
        
        If Not bu3d_ok.Enabled Then
            su_habilita_botao bu3d_ok, True
        End If

    Else
        
        If bu3d_ok.Enabled Then
            su_habilita_botao bu3d_ok, False
        End If

    End If
    
    If Len(tb_u_lgd.Text) = tb_u_lgd.MaxLength Then
        SendKeys "{tab}", True 'Modif. por Helder (OPUS), 8/3/99
    End If
    
    u_lgd$ = Trim$(tb_u_lgd.Text)

End Sub

Private Sub tb_u_lgd_GotFocus()
        
    tb_u_lgd.SelStart = 0
    tb_u_lgd.SelLength = Len(tb_u_lgd.Text)

End Sub

Private Sub tb_u_lgd_KeyPress(KeyAscii As Integer)
    
    'v68 Emilio 21/05/2008 - início
    'If KeyAscii >= Asc("0") And KeyAscii <= Asc("9") Or KeyAscii = KEY_BACK Then
    '
    'Else
    '    KeyAscii = 0
    'End If
    'v68 Emilio 21/05/2008 - fim
    
    Su_Valida_Numero KeyAscii   'v68 Emilio 21/05/2008
    
End Sub

Private Sub tb_u_niu_Change()
    
    u_niu$ = Trim$(tb_u_niu.Text)
    'CONSULTA_POR_ITEM% = False

    ' se um dos campos de pesquisa estiver preenchido
    If tb_n_pes.Text <> Empty Or (tb_c_Cia_ita.Text <> Empty And tb_c_Rmo.Text <> Empty And tb_u_Apo_Pnc.Text <> Empty And tb_u_Apo_Dpd.Text <> Empty) Or tb_u_prp.Text <> Empty Or tb_u_chs_aut.Text <> Empty Or tb_u_plc_aut.Text <> Empty Or (TB_C_T_NEG.Text <> Empty And TB_RMO_MFR.Text <> Empty And TB_U_APO_MFR.Text <> Empty And TB_ISG_MFR.Text <> Empty) Or tb_u_cbn_sor.Text <> Empty Or tb_u_niu.Text <> Empty Then
        'su_habilita_botao Bu3d_chama_item, False
        su_habilita_botao bu3d_ok, True
    Else
        'su_habilita_botao Bu3d_chama_item, False
        su_habilita_botao bu3d_ok, False
    End If

End Sub

Private Sub tb_u_niu_GotFocus()

    tb_u_niu.SelStart = 0
    tb_u_niu.SelLength = Len(tb_u_niu.Text)

End Sub

Private Sub tb_u_niu_KeyPress(KeyAscii As Integer)
    
    Su_Valida_Numero KeyAscii

End Sub

Private Sub tb_u_plc_aut_Change()
        
    u_plc_aut$ = Trim$(tb_u_plc_aut.Text)
    CONSULTA_POR_ITEM% = False

    ' se um dos campos de pesquisa estiver preenchido
    'If tb_n_pes.text <> empty Or (tb_c_cia_ita.text <> empty And tb_c_rmo.text <> empty And tb_u_Apo_Pnc.text <> empty And tb_u_apo_dpd.text <> empty) Or tb_u_prp.text <> empty Or tb_u_chs_aut.text <> empty Or tb_u_plc_aut.text <> empty Then
    If tb_n_pes.Text <> Empty Or (tb_c_Cia_ita.Text <> Empty And tb_c_Rmo.Text <> Empty And tb_u_Apo_Pnc.Text <> Empty And tb_u_Apo_Dpd.Text <> Empty) Or tb_u_prp.Text <> Empty Or tb_u_chs_aut.Text <> Empty Or tb_u_plc_aut.Text <> Empty Or (TB_C_T_NEG.Text <> Empty And TB_RMO_MFR.Text <> Empty And TB_U_APO_MFR.Text <> Empty And TB_ISG_MFR.Text <> Empty) Or tb_u_cbn_sor.Text <> Empty Or tb_u_sav.Text <> Empty Or tb_u_niu.Text <> Empty Then
        su_habilita_botao Bu3d_chama_item, True
        su_habilita_botao bu3d_ok, True
    Else
        su_habilita_botao Bu3d_chama_item, False
        su_habilita_botao bu3d_ok, False
    End If

End Sub

Private Sub tb_u_plc_aut_GotFocus()
        
    tb_u_plc_aut.SelStart = 0
    tb_u_plc_aut.SelLength = Len(tb_u_plc_aut.Text)

End Sub

Private Sub tb_u_plc_aut_KeyPress(KeyAscii As Integer)
        
    KeyAscii = Asc(UCase$(Chr$(KeyAscii)))

End Sub

Private Sub tb_u_plc_aut_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
        
    PA3D_Status.Caption = "R1FAB001 - Número da Placa"

End Sub

Private Sub tb_u_prp_Change()
        
    u_prp$ = Trim$(tb_u_prp.Text)

    ' se um dos campos de pesquisa estiver preenchido
    'If tb_n_pes.text <> empty Or (tb_c_cia_ita.text <> empty And tb_c_rmo.text <> empty And tb_u_Apo_Pnc.text <> empty And tb_u_apo_dpd.text <> empty) Or tb_u_prp.text <> empty Or tb_u_chs_aut.text <> empty Or tb_u_plc_aut.text <> empty Then
    If tb_n_pes.Text <> Empty Or (tb_c_Cia_ita.Text <> Empty And tb_c_Rmo.Text <> Empty And tb_u_Apo_Pnc.Text <> Empty And tb_u_Apo_Dpd.Text <> Empty) Or tb_u_prp.Text <> Empty Or tb_u_chs_aut.Text <> Empty Or tb_u_plc_aut.Text <> Empty Or (TB_C_T_NEG.Text <> Empty And TB_RMO_MFR.Text <> Empty And TB_U_APO_MFR.Text <> Empty And TB_ISG_MFR.Text <> Empty) Or tb_u_cbn_sor.Text <> Empty Or tb_u_sav.Text <> Empty Or tb_u_niu.Text <> Empty Then
        su_habilita_botao bu3d_ok, True
        'su_habilita_botao cmd_ConsExc, True
    Else
        su_habilita_botao bu3d_ok, False
        'su_habilita_botao cmd_ConsExc, False
    End If

End Sub

Private Sub tb_u_prp_GotFocus()
        
    tb_u_prp.SelStart = 0
    tb_u_prp.SelLength = Len(tb_u_prp.Text)

End Sub

Private Sub tb_u_prp_KeyPress(KeyAscii As Integer)
        
    'v68 Emilio 21/05/2008 - início
    'If KeyAscii >= Asc("0") And KeyAscii <= Asc("9") Or KeyAscii = KEY_BACK Then
    '
    'Else
    '    KeyAscii = 0
    'End If
    'v68 Emilio 21/05/2008 - fim
    
    Su_Valida_Numero KeyAscii   'v68 Emilio 21/05/2008

End Sub

Private Sub tb_u_prp_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
        
    PA3D_Status.Caption = "R1FAB001 - Número da Proposta"

End Sub

Private Sub tb_u_sav_Change()

    u_sav$ = Trim$(tb_u_sav.Text)
    'CONSULTA_POR_ITEM% = False

    ' se um dos campos de pesquisa estiver preenchido
    If tb_n_pes.Text <> Empty Or (tb_c_Cia_ita.Text <> Empty And tb_c_Rmo.Text <> Empty And tb_u_Apo_Pnc.Text <> Empty And tb_u_Apo_Dpd.Text <> Empty) Or tb_u_prp.Text <> Empty Or tb_u_chs_aut.Text <> Empty Or tb_u_plc_aut.Text <> Empty Or (TB_C_T_NEG.Text <> Empty And TB_RMO_MFR.Text <> Empty And TB_U_APO_MFR.Text <> Empty And TB_ISG_MFR.Text <> Empty) Or tb_u_cbn_sor.Text <> Empty Or tb_u_sav.Text <> Empty Then
        'su_habilita_botao Bu3d_chama_item, False
        su_habilita_botao bu3d_ok, True
    Else
        'su_habilita_botao Bu3d_chama_item, False
        su_habilita_botao bu3d_ok, False
    End If


End Sub

Private Sub tb_u_sav_GotFocus()

    tb_u_sav.SelStart = 0
    tb_u_sav.SelLength = Len(tb_u_sav.Text)

End Sub


Private Sub tb_uf_Change()
        
    ' verifica se todos os campos referentes a endereço estão preenchidos
    If Trim$(tb_n_cdd.Text) <> Empty And Trim$(tb_uf.Text) <> Empty And Len(me_cep.ClipText) = 8 And Trim$(tb_u_lgd.Text) <> Empty Then
        
        If Not bu3d_ok.Enabled Then
            su_habilita_botao bu3d_ok, True
        End If

    Else
        
        If bu3d_ok.Enabled Then
            su_habilita_botao bu3d_ok, False
        End If

    End If
    
    
    If Len(tb_uf.Text) = tb_uf.MaxLength Then
        SendKeys "{tab}", True 'Modif. por Helder (OPUS), 8/3/99
    End If
    
    c_uf$ = Trim$(tb_uf.Text)

End Sub

Private Sub tb_uf_GotFocus()
        
    tb_uf.SelStart = 0
    tb_uf.SelLength = Len(tb_uf.Text)

End Sub

Private Sub tb_uf_KeyPress(KeyAscii As Integer)
        
    KeyAscii = Asc(UCase$(Chr$(KeyAscii)))

End Sub

Public Sub VBSQL1_Error(SqlConn As Integer, Severity As Integer, errornum As Integer, ErrorStr As String, RetCode As Integer)
        
    SU_Mostra_Erro Severity, errornum, ErrorStr, RetCode

End Sub

Public Sub VBSQL1_Message(SqlConn As Integer, message As Long, State As Integer, Severity As Integer, msgstr As String)
        
    SU_Mostra_Mensagem message, State, Severity, msgstr

End Sub

Sub Su_Marca_Texto(obj_texto As TextBox)

    'v68 Emilio 21/05/2008 - início
    obj_texto.SelStart = 0
    obj_texto.SelLength = Len(obj_texto.Text)
    'v68 Emilio 21/05/2008 - fim

End Sub

Sub Su_Foco_Texto_Anterior(tecla_Back As Integer, obj_origem As TextBox, obj_destino As TextBox)

    'v68 Emilio 21/05/2008 - início
    'Se a tecla for Backspace e o campo origem estiver vazio, mover o foco para campo anterior
    If tecla_Back = CG_KEY_BACKSPACE And Len(Trim(obj_origem.Text)) = 0 Then
        obj_destino.SetFocus
    End If
    'v68 Emilio 21/05/2008 - fim

End Sub

Sub Su_Valida_Numero(tecla As Integer)
    
    'v68 Emilio 21/05/2008 - início
    If (tecla < CG_KEY_ZERO Or tecla > CG_KEY_NOVE) And _
        tecla <> CG_KEY_BACKSPACE Then tecla = 0
    'v68 Emilio 21/05/2008 - fim
    
End Sub
