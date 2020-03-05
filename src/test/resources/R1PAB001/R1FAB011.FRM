VERSION 5.00
Object = "{0BA686C6-F7D3-101A-993E-0000C0EF6F5E}#1.0#0"; "threed32.ocx"
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form R1FAB011 
   Appearance      =   0  'Flat
   Caption         =   "Consulta à apólice - Numero da apólice"
   ClientHeight    =   6285
   ClientLeft      =   1575
   ClientTop       =   1350
   ClientWidth     =   8625
   BeginProperty Font 
      Name            =   "MS Sans Serif"
      Size            =   8.25
      Charset         =   0
      Weight          =   700
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   ForeColor       =   &H80000008&
   Icon            =   "R1FAB011.frx":0000
   MaxButton       =   0   'False
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   6285
   ScaleWidth      =   8625
   Begin Threed.SSPanel pa3d_status 
      Align           =   2  'Align Bottom
      Height          =   345
      Left            =   0
      TabIndex        =   2
      Top             =   5940
      Width           =   8625
      _Version        =   65536
      _ExtentX        =   15214
      _ExtentY        =   609
      _StockProps     =   15
      Caption         =   "R1FAB011"
      ForeColor       =   8388608
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      BevelInner      =   1
      Alignment       =   1
      Autosize        =   1
   End
   Begin Threed.SSPanel PA3D_Topo 
      Align           =   1  'Align Top
      Height          =   730
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   8625
      _Version        =   65536
      _ExtentX        =   15214
      _ExtentY        =   1288
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
      BorderWidth     =   1
      BevelInner      =   1
      RoundedCorners  =   0   'False
      Alignment       =   8
      Begin Threed.SSCommand bu3d_Volta 
         Height          =   600
         Left            =   7830
         TabIndex        =   1
         Tag             =   "sai"
         Top             =   60
         Width           =   600
         _Version        =   65536
         _ExtentX        =   1058
         _ExtentY        =   1058
         _StockProps     =   78
         Picture         =   "R1FAB011.frx":030A
      End
      Begin VB.Image IM_Itau_Seguros 
         Appearance      =   0  'Flat
         Height          =   480
         Left            =   0
         Picture         =   "R1FAB011.frx":0624
         Top             =   120
         Width           =   1365
      End
   End
   Begin Threed.SSPanel PA3D_Campanha 
      Height          =   5235
      Left            =   0
      TabIndex        =   3
      Top             =   690
      Width           =   8625
      _Version        =   65536
      _ExtentX        =   15214
      _ExtentY        =   9234
      _StockProps     =   15
      ForeColor       =   0
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
      Alignment       =   6
      Begin VB.Frame FR3D_CPH_MKT 
         Caption         =   "Campanha de Marketing"
         ForeColor       =   &H00800000&
         Height          =   2235
         Left            =   135
         TabIndex        =   4
         Top             =   180
         Width           =   8295
         Begin VB.Label LB_CPH_MKT 
            Appearance      =   0  'Flat
            AutoSize        =   -1  'True
            Caption         =   "Campanha"
            ForeColor       =   &H00800000&
            Height          =   195
            Left            =   300
            TabIndex        =   14
            Top             =   765
            Width           =   900
         End
         Begin VB.Label LB_OFT_CPH 
            Appearance      =   0  'Flat
            AutoSize        =   -1  'True
            Caption         =   "Oferta              "
            ForeColor       =   &H00800000&
            Height          =   195
            Left            =   300
            TabIndex        =   13
            Top             =   1125
            Width           =   1140
         End
         Begin VB.Label LB_LOT_CPH 
            Appearance      =   0  'Flat
            AutoSize        =   -1  'True
            Caption         =   "Lote                "
            ForeColor       =   &H00800000&
            Height          =   195
            Left            =   300
            TabIndex        =   12
            Top             =   1470
            Width           =   960
         End
         Begin VB.Label LB_CPH 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BorderStyle     =   1  'Fixed Single
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H8000000D&
            Height          =   270
            Left            =   1605
            TabIndex        =   11
            Top             =   720
            Width           =   6570
         End
         Begin VB.Label LB_OFT 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BorderStyle     =   1  'Fixed Single
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H8000000D&
            Height          =   270
            Left            =   1605
            TabIndex        =   10
            Top             =   1080
            Width           =   6555
         End
         Begin VB.Label LB_LOT 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BorderStyle     =   1  'Fixed Single
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H8000000D&
            Height          =   270
            Left            =   1605
            TabIndex        =   9
            Top             =   1440
            Width           =   6540
         End
         Begin VB.Label LB_agr_cph 
            Appearance      =   0  'Flat
            AutoSize        =   -1  'True
            Caption         =   "Agr.Campanha"
            ForeColor       =   &H00800000&
            Height          =   195
            Left            =   300
            TabIndex        =   8
            Top             =   405
            Width           =   1245
         End
         Begin VB.Label lb_t_agr 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BorderStyle     =   1  'Fixed Single
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H8000000D&
            Height          =   270
            Left            =   1605
            TabIndex        =   7
            Top             =   375
            Width           =   6570
         End
         Begin VB.Label lb_agr 
            Appearance      =   0  'Flat
            AutoSize        =   -1  'True
            Caption         =   "Código Agrupamento de Remuneração"
            ForeColor       =   &H00800000&
            Height          =   195
            Left            =   300
            TabIndex        =   6
            Top             =   1860
            Width           =   3270
         End
         Begin VB.Label lb_agr_rmu 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BorderStyle     =   1  'Fixed Single
            ForeColor       =   &H8000000D&
            Height          =   270
            Left            =   3675
            TabIndex        =   5
            Top             =   1830
            Width           =   825
         End
      End
      Begin Threed.SSFrame fr3d_fun_cph 
         Height          =   2460
         Left            =   150
         TabIndex        =   15
         Top             =   2580
         Width           =   8250
         _Version        =   65536
         _ExtentX        =   14552
         _ExtentY        =   4339
         _StockProps     =   14
         Caption         =   "Funcionários da Campanha"
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
         Begin MSFlexGridLib.MSFlexGrid gr_fun_cph 
            Height          =   1935
            Left            =   165
            TabIndex        =   16
            Top             =   375
            Width           =   7920
            _ExtentX        =   13970
            _ExtentY        =   3413
            _Version        =   393216
            Cols            =   5
            FixedCols       =   0
            ForeColor       =   -2147483635
            FocusRect       =   0
            SelectionMode   =   1
         End
      End
   End
End
Attribute VB_Name = "R1FAB011"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Option Explicit

Private Sub BU3D_Volta_Click()
    
    ' retorno para 2a. tela
    volta% = True

    R1FAB002.Show
    Me.Hide
    
End Sub

Private Sub bu3d_Volta_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    
    PA3D_Status.Caption = "R1FAB011 - Retorna à tela anterior"

End Sub

Private Sub Form_Activate()

' utilizado para preencher controles
Dim Texto   As String
    
    Screen.MousePointer = HOURGLASS
    
    Texto$ = Format$(Val(c_cia_ita$), "##") + "."
    Texto$ = Texto$ + Format$(Val(c_rmo$), "##") + "."
    Texto$ = Texto$ + Format$(Val(u_apo_pnc$), "000000000")
    
    Me.Caption = "Consulta à apólice - " & Texto$
    
    'Carrega dados da campanha e funcionarios
    Su_Carrega_Campanha
 
    Screen.MousePointer = DEFAULT

End Sub

Private Sub Form_DblClick()
    
    MsgBox sg_versao$, MB_ICONINFORMATION, "VERSÃO"

End Sub

Private Sub Form_Load()
    
    SU_Ajusta_Form Me, 4

End Sub

Private Sub Form_QueryUnload(CANCEL As Integer, Unloadmode As Integer)
    
    Ind_UnloadMode = Unloadmode
    CANCEL = FU_Verifica_Saida(Unloadmode, Me)

End Sub

Private Sub Form_Unload(CANCEL As Integer)

'20/11/1998 - Luciane/Hirata
'Comando IF foi colocado devido a conversão de VB3 para VB5, porque o VB5
'não permite que o botão minimizar apareça, sem que o control box esteja
'habilitado.
'Houve a necessidade controlar o fechamento do form via control box, para
'que conexões e bibliotecas não permanecessem abertas.

    If Ind_UnloadMode = 0 Then
        
        If BU3D_Volta.Enabled = True Then
            BU3D_Volta_Click
        Else
            CANCEL = True
        End If
    
    End If

End Sub

