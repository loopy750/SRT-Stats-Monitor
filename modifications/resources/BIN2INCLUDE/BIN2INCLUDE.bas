$VersionInfo:CompanyName=SpriggsySpriggs
$VersionInfo:FileDescription=BIN2INCLUDE
$VersionInfo:LegalCopyright=(c) 2019-2020 SpriggsySpriggs
$VersionInfo:ProductName=BIN2INCLUDE
$VersionInfo:Web=https://github.com/SpriggsySpriggs/BIN2INCLUDE
$VersionInfo:Comments=Converts a binary file into an INCLUDE-able
$VersionInfo:FILEVERSION#=2,5,0,1
$VersionInfo:PRODUCTVERSION#=2,5,0,1
__binary
__makeshortcut
$If 32BIT Then
        CONST OFN_ALLOWMULTISELECT = &H200& '  Allows the user to select more than one file, not recommended!
        CONST OFN_CREATEPROMPT = &H2000& '     Prompts if a file not found should be created(GetOpenFileName only).
        CONST OFN_EXTENSIONDIFFERENT = &H400& 'Allows user to specify file extension other than default extension.
        CONST OFN_FILEMUSTEXIST = &H1000& '    Chechs File name exists(GetOpenFileName only).
        CONST OFN_HIDEREADONLY = &H4& '        Hides read-only checkbox(GetOpenFileName only)
        CONST OFN_NOCHANGEDIR = &H8& '         Restores the current directory to original value if user changed
        CONST OFN_NODEREFERENCELINKS = &H100000& 'Returns path and file name of selected shortcut(.LNK) file instead of file referenced.
        CONST OFN_NONETWORKBUTTON = &H20000& ' Hides and disables the Network button.
        CONST OFN_NOREADONLYRETURN = &H8000& ' Prevents selection of read-only files, or files in read-only subdirectory.
        CONST OFN_NOVALIDATE = &H100& '        Allows invalid file name characters.
        CONST OFN_OVERWRITEPROMPT = &H2& '     Prompts if file already exists(GetSaveFileName only)
        CONST OFN_PATHMUSTEXIST = &H800& '     Checks Path name exists (set with OFN_FILEMUSTEXIST).
        CONST OFN_READONLY = &H1& '            Checks read-only checkbox. Returns if checkbox is checked
        CONST OFN_SHAREAWARE = &H4000& '       Ignores sharing violations in networking
        CONST OFN_SHOWHELP = &H10& '           Shows the help button (useless!)
        DEFINT A-Z
        TYPE FILEDIALOGTYPE
        lStructSize AS LONG '        For the DLL call
        hwndOwner AS LONG '          Dialog will hide behind window when not set correctly
        hInstance AS LONG '          Handle to a module that contains a dialog box template.
        lpstrFilter AS _OFFSET '     Pointer of the string of file filters
        lpstrCustFilter AS _OFFSET
        nMaxCustFilter AS LONG
        nFilterIndex AS LONG '       One based starting filter index to use when dialog is called
        lpstrFile AS _OFFSET '       String full of 0's for the selected file name
        nMaxFile AS LONG '           Maximum length of the string stuffed with 0's minus 1
        lpstrFileTitle AS _OFFSET '  Same as lpstrFile
        nMaxFileTitle AS LONG '      Same as nMaxFile
        lpstrInitialDir AS _OFFSET ' Starting directory
        lpstrTitle AS _OFFSET '      Dialog title
        flags AS LONG '              Dialog flags
        nFileOffset AS INTEGER '     Zero-based offset from path beginning to file name string pointed to by lpstrFile
        nFileExtension AS INTEGER '  Zero-based offset from path beginning to file extension string pointed to by lpstrFile.
        lpstrDefExt AS _OFFSET '     Default/selected file extension
        lCustData AS LONG
        lpfnHook AS LONG
        lpTemplateName AS _OFFSET
        END TYPE
        DECLARE DYNAMIC LIBRARY "comdlg32" ' Library declarations using _OFFSET types
        FUNCTION GetOpenFileNameA& (DIALOGPARAMS AS FILEDIALOGTYPE) ' The Open file dialog
        FUNCTION GetSaveFileNameA& (DIALOGPARAMS AS FILEDIALOGTYPE) ' The Save file dialog
        END DECLARE
$Else
    __OpenFile
$End If
Dim Shared OFile As String
Dim Shared SFile As String
DefInt A-Z
DECLARE FUNCTION E$ (B$)
_Title "BIN2INCLUDE"
$ExeIcon:'.\binary.ico'
_Icon
Dim Shared BIN2INCLUDE As Long
Dim Shared SelectedFileTB As Long
Dim Shared OpenBT As Long
Dim Shared CONVERTBT As Long
Dim Shared SaveBT As Long
Dim Shared OutputFileTB As Long
Dim Shared ListBox1 As Long
Dim Shared ClearLogBT As Long
Dim Shared BIN2BASRB As Long
Dim Shared PIC2MEMRB As Long
Dim Shared ResetBT As Long
Declare Library
    Function __UI_GetPID Alias getpid ()
End Declare
Declare CustomType Library
    Sub __UI_MemCopy Alias memcpy (ByVal dest As _Offset, Byval source As _Offset, Byval bytes As Long)
End Declare
Declare Library "falcon"
    Sub uprint_extra (ByVal x&, Byval y&, Byval chars%&, Byval length%&, Byval kern&, Byval do_render&, txt_width&, Byval charpos%&, charcount&, Byval colour~&, Byval max_width&)
    Function uprint (ByVal x&, Byval y&, chars$, Byval txt_len&, Byval colour~&, Byval max_width&)
    Function uprintwidth (chars$, Byval txt_len&, Byval max_width&)
    Function uheight& ()
    Function falcon_uspacing& Alias uspacing ()
    Function uascension& ()
End Declare
$If WIN Then
    Declare Library
        Function __UI_MB& Alias MessageBox (ByVal ignore&, message$, title$, Byval type&)
        Function GetSystemMetrics& (ByVal WhichMetric&)
    End Declare
    Const __UI_SM_SWAPBUTTON = 23
$Else
        DECLARE LIBRARY ""
        FUNCTION __UI_MB& ALIAS MessageBox (BYVAL ignore&, message$, title$, BYVAL type&)
        END DECLARE
$End If
$ScreenHide
_ControlChr Off
Type __UI_ControlTYPE
    ID As Long
    ParentID As Long
    PreviousParentID As Long
    ContextMenuID As Long
    Type As Integer
    Name As String * 40
    ParentName As String * 40
    SubMenu As _Byte
    MenuPanelID As Long
    SourceControl As Long
    Top As Integer
    Left As Integer
    Width As Integer
    Height As Integer
    Canvas As Long
    HelperCanvas As Long
    TransparentColor As _Unsigned Long
    Stretch As _Byte
    PreviousStretch As _Byte
    Font As Integer
    PreviousFont As Integer
    BackColor As _Unsigned Long
    ForeColor As _Unsigned Long
    SelectedForeColor As _Unsigned Long
    SelectedBackColor As _Unsigned Long
    BackStyle As _Byte
    HasBorder As _Byte
    BorderSize As Integer
    Padding As Integer
    Encoding As Long
    Align As _Byte
    VAlign As _Byte
    BorderColor As _Unsigned Long
    Value As _Float
    PreviousValue As _Float
    Min As _Float
    Max As _Float
    Interval As _Float
    MinInterval As _Float
    HotKey As Integer
    HotKeyOffset As Integer
    HotKeyPosition As Integer
    ShowPercentage As _Byte
    AutoScroll As _Byte
    AutoSize As _Byte
    InputViewStart As Long
    PreviousInputViewStart As Long
    LastVisibleItem As Integer
    ItemHeight As Integer
    HasVScrollbar As _Byte
    VScrollbarButton2Top As Integer
    HoveringVScrollbarButton As _Byte
    ThumbHeight As Integer
    ThumbTop As Integer
    VScrollbarRatio As Single
    Cursor As Long
    PasswordField As _Byte
    PrevCursor As Long
    FieldArea As Long
    PreviousFieldArea As Long
    TextIsSelected As _Byte
    BypassSelectOnFocus As _Byte
    Multiline As _Byte
    NumericOnly As _Byte
    FirstVisibleLine As Long
    PrevFirstVisibleLine As Long
    CurrentLine As Long
    PrevCurrentLine As Long
    VisibleCursor As Long
    PrevVisibleCursor As Long
    ControlIsSelected As _Byte
    LeftOffsetFromFirstSelected As Integer
    TopOffsetFromFirstSelected As Integer
    SelectionLength As Long
    SelectionStart As Long
    WordWrap As _Byte
    CanResize As _Byte
    CanHaveFocus As _Byte
    Disabled As _Byte
    Hidden As _Byte
    PreviouslyHidden As _Byte
    CenteredWindow As _Byte
    ControlState As _Byte
    ChildrenRedrawn As _Byte
    FocusState As Long
    LastChange As Single
    Redraw As _Byte
    BulletStyle As _Byte
    MenuItemGroup As Integer
    KeyCombo As Long
End Type
Type __UI_Types
    Name As String * 16
    Count As Long
    TurnsInto As Integer
    DefaultHeight As Integer
    MinimumHeight As Integer
    DefaultWidth As Integer
    MinimumWidth As Integer
    RestrictResize As _Byte
End Type
Type __UI_ThemeImagesType
    FileName As String * 32
    Handle As Long
End Type
Type __UI_WordWrapHistoryType
    StringSlot As Long
    Width As Integer
    LongestLine As Integer
    Font As Long
    TotalLines As Integer
End Type
Type __UI_KeyCombos
    Combo As String * 14 '         "CTRL+SHIFT+F12"
    FriendlyCombo As String * 14 ' "Ctrl+Shift+F12"
    ControlID As Long
End Type
ReDim Shared Caption(1 To 100) As String
ReDim Shared __UI_TempCaptions(1 To 100) As String
ReDim Shared Text(1 To 100) As String
ReDim Shared __UI_TempTexts(1 To 100) As String
ReDim Shared Mask(1 To 100) As String
ReDim Shared __UI_TempMask(1 To 100) As String
ReDim Shared ToolTip(0 To 100) As String
ReDim Shared __UI_TempTips(1 To 100) As String
ReDim Shared Control(0 To 100) As __UI_ControlTYPE
ReDim Shared ControlDrawOrder(0) As Long
ReDim Shared __UI_ThemeImages(0 To 100) As __UI_ThemeImagesType
ReDim Shared __UI_WordWrapHistoryTexts(1 To 100) As String
ReDim Shared __UI_WordWrapHistoryResults(1 To 100) As String
ReDim Shared __UI_WordWrapHistory(1 To 100) As __UI_WordWrapHistoryType
ReDim Shared __UI_ThisLineChars(0) As Long, __UI_FocusedTextBoxChars(0) As Long
ReDim Shared __UI_ActiveMenu(0 To 100) As Long, __UI_ParentMenu(0 To 100) As Long
ReDim Shared __UI_KeyCombo(0 To 100) As __UI_KeyCombos
Dim Shared __UI_TotalKeyCombos As Long, __UI_BypassKeyCombos As _Byte
Dim Shared table1252$(255), table437$(255)
Dim Shared __UI_MouseLeft As Integer, __UI_MouseTop As Integer
Dim Shared __UI_MouseWheel As Integer, __UI_MouseButtonsSwap As _Byte
Dim Shared __UI_PrevMouseLeft As Integer, __UI_PrevMouseTop As Integer
Dim Shared __UI_MouseButton1 As _Byte, __UI_MouseButton2 As _Byte
Dim Shared __UI_MouseIsDown As _Byte, __UI_MouseDownOnID As Long
Dim Shared __UI_Mouse2IsDown As _Byte, __UI_Mouse2DownOnID As Long
Dim Shared __UI_PreviousMouseDownOnID As Long
Dim Shared __UI_KeyIsDown As _Byte, __UI_KeyDownOnID As Long
Dim Shared __UI_ShiftIsDown As _Byte, __UI_CtrlIsDown As _Byte
Dim Shared __UI_AltIsDown As _Byte, __UI_ShowHotKeys As _Byte, __UI_AltCombo$
Dim Shared __UI_LastMouseClick As Single, __UI_MouseDownOnScrollbar As Single
Dim Shared __UI_DragX As Integer, __UI_DragY As Integer
Dim Shared __UI_DefaultButtonID As Long
Dim Shared __UI_KeyHit As Long, __UI_KeepFocus As _Byte
Dim Shared __UI_Focus As Long, __UI_PreviousFocus As Long, __UI_KeyboardFocus As _Byte
Dim Shared __UI_HoveringID As Long, __UI_LastHoveringID As Long, __UI_BelowHoveringID As Long
Dim Shared __UI_IsDragging As _Byte, __UI_DraggingID As Long
Dim Shared __UI_IsResizing As _Byte, __UI_ResizingID As Long
Dim Shared __UI_ResizeHandleHover As _Byte
Dim Shared __UI_IsSelectingText As _Byte, __UI_IsSelectingTextOnID As Long
Dim Shared __UI_SelectedText As String, __UI_SelectionLength As Long
Dim Shared __UI_StateHasChanged As _Byte
Dim Shared __UI_DraggingThumb As _Byte, __UI_ThumbDragTop As Integer
Dim Shared __UI_DraggingThumbOnID As Long
Dim Shared __UI_HasInput As _Byte, __UI_ProcessInputTimer As Single
Dim Shared __UI_UnloadSignal As _Byte, __UI_HasResized As _Byte
Dim Shared __UI_ExitTriggered As _Byte
Dim Shared __UI_Loaded As _Byte
Dim Shared __UI_EventsTimer As Integer, __UI_RefreshTimer As Integer
Dim Shared __UI_ActiveDropdownList As Long, __UI_ParentDropdownList As Long
Dim Shared __UI_TotalActiveMenus As Long, __UI_ActiveMenuIsContextMenu As _Byte
Dim Shared __UI_SubMenuDelay As Single, __UI_HoveringSubMenu As _Byte
Dim Shared __UI_TopMenuBarItem As Long
Dim Shared __UI_ActiveTipID As Long, __UI_TipTimer As Single, __UI_PreviousTipID As Long
Dim Shared __UI_ActiveTipTop As Integer, __UI_ActiveTipLeft As Integer
Dim Shared __UI_FormID As Long, __UI_HasMenuBar As Long
Dim Shared __UI_ScrollbarWidth As Integer, __UI_ScrollbarButtonHeight As Integer
Dim Shared __UI_MenuBarOffset As Integer, __UI_MenuItemOffset As Integer
Dim Shared __UI_NewMenuBarTextLeft As Integer, __UI_DefaultCaptionIndent As Integer
Dim Shared __UI_ForceRedraw As _Byte, __UI_AutoRefresh As _Byte
Dim Shared __UI_CurrentTitle As String
Dim Shared __UI_DesignMode As _Byte, __UI_FirstSelectedID As Long
Dim Shared __UI_WaitMessage As String, __UI_TotalSelectedControls As Long
Dim Shared __UI_WaitMessageHandle As Long, __UI_EditorMode As _Byte
Dim Shared __UI_LastRenderedLineWidth As Long, __UI_LastRenderedCharCount As Long
Dim Shared __UI_SelectionRectangleTop As Integer, __UI_SelectionRectangleLeft As Integer
Dim Shared __UI_SelectionRectangle As _Byte
Dim Shared __UI_CantShowContextMenu As _Byte, __UI_ShowPositionAndSize As _Byte
Dim Shared __UI_ShowInvisibleControls As _Byte, __UI_Snapped As _Byte
Dim Shared __UI_SnappedByProximityX As _Byte, __UI_SnappedByProximityY As _Byte
Dim Shared __UI_SnappedX As Integer, __UI_SnappedY As Integer
Dim Shared __UI_SnappedXID As Long, __UI_SnappedYID As Long
Dim Shared __UI_SnapLines As _Byte, __UI_SnapDistance As Integer, __UI_SnapDistanceFromForm As Integer
Dim Shared __UI_FrameRate As Single, __UI_Font8Offset As Integer, __UI_Font16Offset As Integer
Dim Shared __UI_ClipboardCheck$, __UI_MenuBarOffsetV As Integer
Dim Shared __UI_KeepScreenHidden As _Byte, __UI_MaxBorderSize As Integer
Dim Shared __UI_InternalContextMenus As Long, __UI_DidClick As _Byte
Dim Shared __UI_ContextMenuSourceID As Long
Dim Shared __UI_FKey(1 To 12) As Long
Dim Shared __UI_Type(0 To 18) As __UI_Types
__UI_Type(__UI_Type_Form).Name = "Form"
__UI_Type(__UI_Type_Frame).Name = "Frame"
__UI_Type(__UI_Type_Frame).DefaultWidth = 230
__UI_Type(__UI_Type_Frame).DefaultHeight = 150
__UI_Type(__UI_Type_Button).Name = "Button"
__UI_Type(__UI_Type_Button).DefaultWidth = 80
__UI_Type(__UI_Type_Button).DefaultHeight = 23
__UI_Type(__UI_Type_Label).Name = "Label"
__UI_Type(__UI_Type_Label).DefaultWidth = 150
__UI_Type(__UI_Type_Label).DefaultHeight = 23
__UI_Type(__UI_Type_CheckBox).Name = "CheckBox"
__UI_Type(__UI_Type_CheckBox).DefaultWidth = 150
__UI_Type(__UI_Type_CheckBox).DefaultHeight = 23
__UI_Type(__UI_Type_CheckBox).TurnsInto = __UI_Type_ToggleSwitch
__UI_Type(__UI_Type_RadioButton).Name = "RadioButton"
__UI_Type(__UI_Type_RadioButton).DefaultWidth = 150
__UI_Type(__UI_Type_RadioButton).DefaultHeight = 23
__UI_Type(__UI_Type_TextBox).Name = "TextBox"
__UI_Type(__UI_Type_TextBox).DefaultWidth = 120
__UI_Type(__UI_Type_TextBox).DefaultHeight = 23
__UI_Type(__UI_Type_ProgressBar).Name = "ProgressBar"
__UI_Type(__UI_Type_ProgressBar).DefaultWidth = 300
__UI_Type(__UI_Type_ProgressBar).DefaultHeight = 23
__UI_Type(__UI_Type_ListBox).Name = "ListBox"
__UI_Type(__UI_Type_ListBox).DefaultWidth = 200
__UI_Type(__UI_Type_ListBox).DefaultHeight = 200
__UI_Type(__UI_Type_ListBox).TurnsInto = __UI_Type_DropdownList
__UI_Type(__UI_Type_DropdownList).Name = "DropdownList"
__UI_Type(__UI_Type_DropdownList).DefaultWidth = 200
__UI_Type(__UI_Type_DropdownList).DefaultHeight = 23
__UI_Type(__UI_Type_DropdownList).TurnsInto = __UI_Type_ListBox
__UI_Type(__UI_Type_MenuBar).Name = "MenuBar"
__UI_Type(__UI_Type_MenuBar).TurnsInto = __UI_Type_ContextMenu
__UI_Type(__UI_Type_MenuBar).RestrictResize = __UI_CantResizeV
__UI_Type(__UI_Type_MenuItem).Name = "MenuItem"
__UI_Type(__UI_Type_MenuItem).RestrictResize = __UI_CantResizeV
__UI_Type(__UI_Type_MenuPanel).Name = "MenuPanel"
__UI_Type(__UI_Type_PictureBox).Name = "PictureBox"
__UI_Type(__UI_Type_PictureBox).DefaultWidth = 230
__UI_Type(__UI_Type_PictureBox).DefaultHeight = 150
__UI_Type(__UI_Type_TrackBar).Name = "TrackBar"
__UI_Type(__UI_Type_TrackBar).DefaultWidth = 300
__UI_Type(__UI_Type_TrackBar).DefaultHeight = 40
__UI_Type(__UI_Type_TrackBar).MinimumHeight = 30
__UI_Type(__UI_Type_TrackBar).RestrictResize = __UI_CantResizeV
__UI_Type(__UI_Type_ContextMenu).Name = "ContextMenu"
__UI_Type(__UI_Type_ContextMenu).TurnsInto = __UI_Type_MenuBar
__UI_Type(__UI_Type_ContextMenu).RestrictResize = __UI_CantResize
__UI_Type(__UI_Type_ContextMenu).DefaultWidth = 22
__UI_Type(__UI_Type_ContextMenu).DefaultHeight = 22
__UI_Type(__UI_Type_Font).Name = "Font"
__UI_Type(__UI_Type_ToggleSwitch).Name = "ToggleSwitch"
__UI_Type(__UI_Type_ToggleSwitch).DefaultWidth = 40
__UI_Type(__UI_Type_ToggleSwitch).DefaultHeight = 17
__UI_Type(__UI_Type_ToggleSwitch).TurnsInto = __UI_Type_CheckBox
__UI_RestoreFKeys
Const True = -1, False = 0
Const __UI_Version = "v1.1"
Const __UI_VersionNumber = 11
Const __UI_VersionIsBeta = 0
Const __UI_CopyrightSpan = "2016-2019"
__UI_SubMenuDelay = .4
__UI_SnapDistance = 5
__UI_SnapDistanceFromForm = 10
__UI_MaxBorderSize = 10
__UI_Font8Offset = 5
__UI_Font16Offset = 3
__UI_ClipboardCheck$ = "InForm" + String$(2, 10) + "BEGIN CONTROL DATA" + Chr$(10) + String$(60, 45) + Chr$(10)
__UI_ThemeSetup
__UI_InternalMenus
__UI_LoadForm
__UI_Init
Do
    _Limit 1
Loop
System
__UI_ErrorHandler:
Resume Next
Function uspacing&
    uspacing& = uheight + (((_Font = 8) * -1) * __UI_Font8Offset + ((_Font = 16) * -1) * __UI_Font16Offset)
End Function
Sub __UI_InternalMenus
    Dim __UI_NewID As Long
    __UI_NewID = __UI_NewControl(__UI_Type_ContextMenu, "__UI_PreviewMenu", 0, 0, 0, 0, 0)
    Control(__UI_NewID).Font = SetFont("segoeui.ttf?arial.ttf?/Library/Fonts/Arial.ttf?InForm/resources/NotoMono-Regular.ttf?cour.ttf", 12)
    __UI_NewID = __UI_NewControl(__UI_Type_MenuItem, "__UI_PreviewMenuNewMenuBar", 0, 0, 0, 0, __UI_GetID("__UI_PreviewMenu"))
    SetCaption __UI_GetID("__UI_PreviewMenuNewMenuBar"), "New &MenuBar control"
    __UI_NewID = __UI_NewControl(__UI_Type_MenuItem, "__UI_PreviewMenuNewContextMenu", 0, 0, 0, 0, __UI_GetID("__UI_PreviewMenu"))
    SetCaption __UI_GetID("__UI_PreviewMenuNewContextMenu"), "New ContextMen&u control-"
    __UI_NewID = __UI_NewControl(__UI_Type_MenuItem, "__UI_PreviewMenuShowInvisibleControls", 0, 0, 0, 0, __UI_GetID("__UI_PreviewMenu"))
    SetCaption __UI_GetID("__UI_PreviewMenuShowInvisibleControls"), "Sho&w invisible controls-"
    ToolTip(__UI_NewID) = "Toogles the display of invisible items (e.g. ContextMenu controls)"
    __UI_NewID = __UI_NewControl(__UI_Type_MenuItem, "__UI_PreviewMenuSetDefaultButton", 0, 0, 0, 0, __UI_GetID("__UI_PreviewMenu"))
    SetCaption __UI_GetID("__UI_PreviewMenuSetDefaultButton"), "&Set as default button-"
    ToolTip(__UI_NewID) = "The default button can be triggered with Enter even if it doesn't have focus at run time."
    __UI_NewID = __UI_NewControl(__UI_Type_MenuItem, "__UI_PreviewMenuConvertType", 0, 0, 0, 0, __UI_GetID("__UI_PreviewMenu"))
    SetCaption __UI_GetID("__UI_PreviewMenuConvertType"), "Co&nvert to type-"
    __UI_NewID = __UI_NewControl(__UI_Type_MenuItem, "__UI_PreviewMenuImageOriginalSize", 0, 0, 0, 0, __UI_GetID("__UI_PreviewMenu"))
    SetCaption __UI_GetID("__UI_PreviewMenuImageOriginalSize"), "Restore &image dimensions-"
    __UI_NewID = __UI_NewControl(__UI_Type_MenuItem, "__UI_PreviewMenuNumericOnly", 0, 0, 0, 0, __UI_GetID("__UI_PreviewMenu"))
    SetCaption __UI_GetID("__UI_PreviewMenuNumericOnly"), "Validate .Min/.Ma&x bounds-"
    __UI_NewID = __UI_NewControl(__UI_Type_MenuItem, "__UI_PreviewMenuAlignLeft", 0, 0, 0, 0, __UI_GetID("__UI_PreviewMenu"))
    SetCaption __UI_GetID("__UI_PreviewMenuAlignLeft"), "Align &Left"
    __UI_NewID = __UI_NewControl(__UI_Type_MenuItem, "__UI_PreviewMenuAlignRight", 0, 0, 0, 0, __UI_GetID("__UI_PreviewMenu"))
    SetCaption __UI_GetID("__UI_PreviewMenuAlignRight"), "Align &Right"
    __UI_NewID = __UI_NewControl(__UI_Type_MenuItem, "__UI_PreviewMenuAlignTops", 0, 0, 0, 0, __UI_GetID("__UI_PreviewMenu"))
    SetCaption __UI_GetID("__UI_PreviewMenuAlignTops"), "Align T&op"
    __UI_NewID = __UI_NewControl(__UI_Type_MenuItem, "__UI_PreviewMenuAlignBottoms", 0, 0, 0, 0, __UI_GetID("__UI_PreviewMenu"))
    SetCaption __UI_GetID("__UI_PreviewMenuAlignBottoms"), "Align &Bottom-"
    __UI_NewID = __UI_NewControl(__UI_Type_MenuItem, "__UI_PreviewMenuAlignCentersV", 0, 0, 0, 0, __UI_GetID("__UI_PreviewMenu"))
    SetCaption __UI_GetID("__UI_PreviewMenuAlignCentersV"), "Align cent&ers Vertically"
    __UI_NewID = __UI_NewControl(__UI_Type_MenuItem, "__UI_PreviewMenuAlignCentersH", 0, 0, 0, 0, __UI_GetID("__UI_PreviewMenu"))
    SetCaption __UI_GetID("__UI_PreviewMenuAlignCentersH"), "Ali&gn centers Horizontally"
    __UI_NewID = __UI_NewControl(__UI_Type_MenuItem, "__UI_PreviewMenuAlignCenterV", 0, 0, 0, 0, __UI_GetID("__UI_PreviewMenu"))
    SetCaption __UI_GetID("__UI_PreviewMenuAlignCenterV"), "Center &Vertically (group)"
    __UI_NewID = __UI_NewControl(__UI_Type_MenuItem, "__UI_PreviewMenuAlignCenterH", 0, 0, 0, 0, __UI_GetID("__UI_PreviewMenu"))
    SetCaption __UI_GetID("__UI_PreviewMenuAlignCenterH"), "Center &Horizontally (group)-"
    __UI_NewID = __UI_NewControl(__UI_Type_MenuItem, "__UI_PreviewMenuDistributeV", 0, 0, 0, 0, __UI_GetID("__UI_PreviewMenu"))
    SetCaption __UI_GetID("__UI_PreviewMenuDistributeV"), "Distribute Verticall&y"
    __UI_NewID = __UI_NewControl(__UI_Type_MenuItem, "__UI_PreviewMenuDistributeH", 0, 0, 0, 0, __UI_GetID("__UI_PreviewMenu"))
    SetCaption __UI_GetID("__UI_PreviewMenuDistributeH"), "Distribute Hori&zontally-"
    __UI_NewID = __UI_NewControl(__UI_Type_MenuItem, "__UI_PreviewMenuCut", 0, 0, 0, 0, __UI_GetID("__UI_PreviewMenu"))
    SetCaption __UI_GetID("__UI_PreviewMenuCut"), "Cu&t"
    __UI_NewID = __UI_NewControl(__UI_Type_MenuItem, "__UI_PreviewMenuCopy", 0, 0, 0, 0, __UI_GetID("__UI_PreviewMenu"))
    SetCaption __UI_GetID("__UI_PreviewMenuCopy"), "&Copy"
    __UI_NewID = __UI_NewControl(__UI_Type_MenuItem, "__UI_PreviewMenuPaste", 0, 0, 0, 0, __UI_GetID("__UI_PreviewMenu"))
    SetCaption __UI_GetID("__UI_PreviewMenuPaste"), "&Paste"
    __UI_NewID = __UI_NewControl(__UI_Type_MenuItem, "__UI_PreviewMenuDelete", 0, 0, 0, 0, __UI_GetID("__UI_PreviewMenu"))
    SetCaption __UI_GetID("__UI_PreviewMenuDelete"), "&Delete-"
    __UI_NewID = __UI_NewControl(__UI_Type_MenuItem, "__UI_PreviewMenuSelect", 0, 0, 0, 0, __UI_GetID("__UI_PreviewMenu"))
    SetCaption __UI_GetID("__UI_PreviewMenuSelect"), "Select &All"
    Dim prevDest As Long
    prevDest = _Dest
    Control(__UI_GetID("__UI_PreviewMenuAlignLeft")).HelperCanvas = _NewImage(48, 16, 32)
    _Dest Control(__UI_GetID("__UI_PreviewMenuAlignLeft")).HelperCanvas
    Line (0, 0)-(1, 16), _RGB32(105, 105, 105), BF
    Line (3, 2)-(14, 7), _RGB32(255, 255, 255), BF
    Line (3, 2)-(14, 7), _RGB32(105, 105, 105), B
    Line (3, 10)-(10, 14), _RGB32(105, 105, 105), BF
    Line (16, 0)-Step(1, 16), _RGB32(255, 255, 255), BF
    Line (19, 2)-Step(11, 5), _RGB32(105, 105, 105), BF
    Line (19, 2)-Step(11, 5), _RGB32(255, 255, 255), B
    Line (19, 10)-Step(7, 4), _RGB32(255, 255, 255), BF
    Line (32, 0)-Step(1, 16), Darken(__UI_DefaultColor(__UI_Type_Form, 2), 80), BF
    Line (35, 2)-Step(11, 5), Darken(__UI_DefaultColor(__UI_Type_Form, 2), 80), BF
    Line (35, 2)-Step(11, 5), Darken(__UI_DefaultColor(__UI_Type_Form, 2), 80), B
    Line (35, 10)-Step(7, 4), Darken(__UI_DefaultColor(__UI_Type_Form, 2), 80), BF
    Control(__UI_GetID("__UI_PreviewMenuAlignRight")).HelperCanvas = _NewImage(48, 16, 32)
    _Dest Control(__UI_GetID("__UI_PreviewMenuAlignRight")).HelperCanvas
    Line (14, 0)-Step(1, 16), _RGB32(105, 105, 105), BF
    Line (1, 2)-Step(11, 5), _RGB32(255, 255, 255), BF
    Line (1, 2)-Step(11, 5), _RGB32(105, 105, 105), B
    Line (5, 10)-Step(7, 4), _RGB32(105, 105, 105), BF
    Line (14 + 16, 0)-Step(1, 16), _RGB32(255, 255, 255), BF
    Line (1 + 16, 2)-Step(11, 5), _RGB32(105, 105, 105), BF
    Line (1 + 16, 2)-Step(11, 5), _RGB32(255, 255, 255), B
    Line (5 + 16, 10)-Step(7, 4), _RGB32(255, 255, 255), BF
    Line (14 + 32, 0)-Step(1, 16), Darken(__UI_DefaultColor(__UI_Type_Form, 2), 80), BF
    Line (1 + 32, 2)-Step(11, 5), Darken(__UI_DefaultColor(__UI_Type_Form, 2), 80), BF
    Line (1 + 32, 2)-Step(11, 5), Darken(__UI_DefaultColor(__UI_Type_Form, 2), 80), B
    Line (5 + 32, 10)-Step(7, 4), Darken(__UI_DefaultColor(__UI_Type_Form, 2), 80), BF
    Control(__UI_GetID("__UI_PreviewMenuAlignTops")).HelperCanvas = _NewImage(48, 16, 32)
    _Dest Control(__UI_GetID("__UI_PreviewMenuAlignTops")).HelperCanvas
    Line (0, 0)-Step(16, 1), _RGB32(105, 105, 105), BF
    Line (2, 3)-Step(5, 11), _RGB32(255, 255, 255), BF
    Line (2, 3)-Step(4, 11), _RGB32(105, 105, 105), B
    Line (9, 3)-Step(4, 7), _RGB32(105, 105, 105), BF
    Line (0 + 16, 0)-Step(16, 1), _RGB32(255, 255, 255), BF
    Line (2 + 16, 3)-Step(5, 11), _RGB32(105, 105, 105), BF
    Line (2 + 16, 3)-Step(4, 11), _RGB32(255, 255, 255), B
    Line (9 + 16, 3)-Step(4, 7), _RGB32(255, 255, 255), BF
    Line (0 + 32, 0)-Step(16, 1), Darken(__UI_DefaultColor(__UI_Type_Form, 2), 80), BF
    Line (2 + 32, 3)-Step(5, 11), Darken(__UI_DefaultColor(__UI_Type_Form, 2), 80), BF
    Line (2 + 32, 3)-Step(4, 11), Darken(__UI_DefaultColor(__UI_Type_Form, 2), 80), B
    Line (9 + 32, 3)-Step(4, 7), Darken(__UI_DefaultColor(__UI_Type_Form, 2), 80), BF
    Control(__UI_GetID("__UI_PreviewMenuAlignBottoms")).HelperCanvas = _NewImage(48, 16, 32)
    _Dest Control(__UI_GetID("__UI_PreviewMenuAlignBottoms")).HelperCanvas
    Line (0, 14)-Step(16, 1), _RGB32(105, 105, 105), BF
    Line (2, 1)-Step(5, 11), _RGB32(255, 255, 255), BF
    Line (2, 1)-Step(5, 11), _RGB32(105, 105, 105), B
    Line (9, 5)-Step(4, 7), _RGB32(105, 105, 105), BF
    Line (0 + 16, 14)-Step(16, 1), _RGB32(255, 255, 255), BF
    Line (2 + 16, 1)-Step(5, 11), _RGB32(105, 105, 105), BF
    Line (2 + 16, 1)-Step(5, 11), _RGB32(255, 255, 255), B
    Line (9 + 16, 5)-Step(4, 7), _RGB32(255, 255, 255), BF
    Line (0 + 32, 14)-Step(16, 1), Darken(__UI_DefaultColor(__UI_Type_Form, 2), 80), BF
    Line (2 + 32, 1)-Step(5, 11), Darken(__UI_DefaultColor(__UI_Type_Form, 2), 80), BF
    Line (2 + 32, 1)-Step(5, 11), Darken(__UI_DefaultColor(__UI_Type_Form, 2), 80), B
    Line (9 + 32, 5)-Step(4, 7), Darken(__UI_DefaultColor(__UI_Type_Form, 2), 80), BF
    Control(__UI_GetID("__UI_PreviewMenuAlignCentersV")).HelperCanvas = _NewImage(48, 16, 32)
    _Dest Control(__UI_GetID("__UI_PreviewMenuAlignCentersV")).HelperCanvas
    Line (0, 7)-Step(16, 1), _RGB32(105, 105, 105), BF
    Line (2, 2)-Step(5, 11), _RGB32(255, 255, 255), BF
    Line (2, 2)-Step(5, 11), _RGB32(105, 105, 105), B
    Line (9, 4)-Step(4, 7), _RGB32(105, 105, 105), BF
    Line (0 + 16, 7)-Step(16, 1), _RGB32(255, 255, 255), BF
    Line (2 + 16, 2)-Step(5, 11), _RGB32(105, 105, 105), BF
    Line (2 + 16, 2)-Step(5, 11), _RGB32(255, 255, 255), B
    Line (9 + 16, 4)-Step(4, 7), _RGB32(255, 255, 255), BF
    Line (0 + 32, 7)-Step(16, 1), Darken(__UI_DefaultColor(__UI_Type_Form, 2), 80), BF
    Line (2 + 32, 2)-Step(5, 11), Darken(__UI_DefaultColor(__UI_Type_Form, 2), 80), BF
    Line (2 + 32, 2)-Step(5, 11), Darken(__UI_DefaultColor(__UI_Type_Form, 2), 80), B
    Line (9 + 32, 4)-Step(4, 7), Darken(__UI_DefaultColor(__UI_Type_Form, 2), 80), BF
    Control(__UI_GetID("__UI_PreviewMenuAlignCentersH")).HelperCanvas = _NewImage(48, 16, 32)
    _Dest Control(__UI_GetID("__UI_PreviewMenuAlignCentersH")).HelperCanvas
    Line (7, 0)-Step(1, 16), _RGB32(105, 105, 105), BF
    Line (2, 2)-Step(11, 5), _RGB32(255, 255, 255), BF
    Line (2, 2)-Step(11, 5), _RGB32(105, 105, 105), B
    Line (4, 9)-Step(7, 4), _RGB32(105, 105, 105), BF
    Line (7 + 16, 0)-Step(1, 16), _RGB32(255, 255, 255), BF
    Line (2 + 16, 2)-Step(11, 5), _RGB32(105, 105, 105), BF
    Line (2 + 16, 2)-Step(11, 5), _RGB32(255, 255, 255), B
    Line (4 + 16, 9)-Step(7, 4), _RGB32(255, 255, 255), BF
    Line (7 + 32, 0)-Step(1, 16), Darken(__UI_DefaultColor(__UI_Type_Form, 2), 80), BF
    Line (2 + 32, 2)-Step(11, 5), Darken(__UI_DefaultColor(__UI_Type_Form, 2), 80), BF
    Line (2 + 32, 2)-Step(11, 5), Darken(__UI_DefaultColor(__UI_Type_Form, 2), 80), B
    Line (4 + 32, 9)-Step(7, 4), Darken(__UI_DefaultColor(__UI_Type_Form, 2), 80), BF
    _Dest prevDest
End Sub
Sub SetFrameRate (FPS As _Unsigned Integer)
    If FPS >= 30 Then
        __UI_FrameRate = 1 / FPS
    Else
        __UI_FrameRate = 1 / 30
    End If
    If __UI_RefreshTimer = 0 Then
        __UI_RefreshTimer = _FreeTimer
        On Timer(__UI_RefreshTimer, __UI_FrameRate) __UI_UpdateDisplay
    Else
        Timer(__UI_RefreshTimer) Off
        Timer(__UI_RefreshTimer) Free
        __UI_RefreshTimer = _FreeTimer
        On Timer(__UI_RefreshTimer, __UI_FrameRate) __UI_UpdateDisplay
        Timer(__UI_RefreshTimer) On
    End If
End Sub
Sub SetFocus (id As Long)
    If __UI_Focus = id Then Exit Sub
    If Control(id).CanHaveFocus = False Or Control(id).Hidden = True Or Control(id).Disabled = True Then Exit Sub
    __UI_Focus = id
    If Control(id).Type = __UI_Type_TextBox Then
        If Control(id).BypassSelectOnFocus = False Then
            Control(id).TextIsSelected = True
            Control(id).SelectionStart = 0
            Control(id).Cursor = Len(Text(id))
        End If
    End If
End Sub
Sub __UI_Init
    Dim i As Long, b$
    SetFrameRate 30
    __UI_BeforeInit
    If __UI_KeepScreenHidden = False Then _ScreenShow
    If __UI_FormID = 0 Then System
    Screen _NewImage(Control(__UI_FormID).Width, Control(__UI_FormID).Height, 32)
    Color Control(__UI_FormID).ForeColor, Control(__UI_FormID).BackColor
    If Control(__UI_FormID).Font > 0 Then _Font Control(__UI_FormID).Font
    b$ = "Initializing..."
    GoSub ShowMessage
    _Icon
    If Control(__UI_FormID).CenteredWindow Then _ScreenMove _Middle
    If Control(__UI_FormID).Font = 0 Then Control(__UI_FormID).Font = SetFont("", 8)
    If Caption(__UI_FormID) = "" Then Caption(__UI_FormID) = RTrim$(Control(__UI_FormID).Name)
    If Not __UI_DesignMode Then
        Dim __UI_NewID As Long
        __UI_NewID = __UI_NewControl(__UI_Type_ContextMenu, "__UI_TextFieldMenu", 0, 0, 0, 0, 0)
        For i = 1 To UBound(Control)
            If Control(i).Type = __UI_Type_TextBox And Control(i).ContextMenuID = 0 Then
                Control(i).ContextMenuID = __UI_NewID
            End If
        Next
        __UI_NewID = __UI_NewControl(__UI_Type_MenuItem, "__UI_TextMenuCut", 0, 0, 0, 0, __UI_GetID("__UI_TextFieldMenu"))
        SetCaption __UI_GetID("__UI_TextMenuCut"), "Cu&t"
        __UI_NewID = __UI_NewControl(__UI_Type_MenuItem, "__UI_TextMenuCopy", 0, 0, 0, 0, __UI_GetID("__UI_TextFieldMenu"))
        SetCaption __UI_GetID("__UI_TextMenuCopy"), "&Copy"
        __UI_NewID = __UI_NewControl(__UI_Type_MenuItem, "__UI_TextMenuPaste", 0, 0, 0, 0, __UI_GetID("__UI_TextFieldMenu"))
        SetCaption __UI_GetID("__UI_TextMenuPaste"), "&Paste"
        __UI_NewID = __UI_NewControl(__UI_Type_MenuItem, "__UI_TextMenuDelete", 0, 0, 0, 0, __UI_GetID("__UI_TextFieldMenu"))
        SetCaption __UI_GetID("__UI_TextMenuDelete"), "&Delete-"
        __UI_NewID = __UI_NewControl(__UI_Type_MenuItem, "__UI_TextMenuSelect", 0, 0, 0, 0, __UI_GetID("__UI_TextFieldMenu"))
        SetCaption __UI_GetID("__UI_TextMenuSelect"), "Select &all"
    End If
    _DisplayOrder _Software , _Hardware
    _Display
    __UI_AssignIDs
    __UI_OnLoad
    __UI_EventsTimer = _FreeTimer
    On Timer(__UI_EventsTimer, .008) __UI_DoEvents
    Timer(__UI_EventsTimer) On
    Timer(__UI_RefreshTimer) On
    __UI_AutoRefresh = True
    __UI_Loaded = True
    Exit Sub
    ShowMessage:
    Cls
    __UI_PrintString _Width / 2 - _PrintWidth(b$) / 2, _Height / 2 - _FontHeight / 2, b$
    _Display
    Return
End Sub
Function __UI_GetProperMouseButton%% (Which%%)
    $If WIN Then
        If GetSystemMetrics(__UI_SM_SWAPBUTTON) = 0 Then
            __UI_GetProperMouseButton%% = _MouseButton(Which%%)
        Else
            If Which%% = 1 Then
                __UI_GetProperMouseButton%% = _MouseButton(2)
            ElseIf Which%% = 2 Then
                __UI_GetProperMouseButton%% = _MouseButton(1)
            End If
        End If
        __UI_MouseButtonsSwap = False
    $Else
            IF __UI_MouseButtonsSwap THEN
            IF Which%% = 1 THEN
            __UI_GetProperMouseButton%% = _MOUSEBUTTON(2)
            ELSEIF Which%% = 2 THEN
            __UI_GetProperMouseButton%% = _MOUSEBUTTON(1)
            END IF
            ELSE
            __UI_GetProperMouseButton%% = _MOUSEBUTTON(Which%%)
            END IF
    $End If
End Function
Sub __UI_ProcessInput
    Dim OldScreen&, i As Long, j As Long
    Dim ContainerOffsetTop As Integer, ContainerOffsetLeft As Integer
    Static __UI_CurrentResizeStatus As _Byte, __UI_CurrentBackColor As _Unsigned Long
    __UI_HasInput = False
    __UI_ExitTriggered = _Exit
    If __UI_ExitTriggered And 1 Then __UI_ExitTriggered = True: __UI_HasInput = True
    If _ScreenX = -32000 And _ScreenY = -32000 Then
        Exit Sub
    End If
    __UI_MouseWheel = 0
    If __UI_MouseIsDown Then __UI_HasInput = True
    If _MouseInput Then
        __UI_HasInput = True
        __UI_MouseWheel = __UI_MouseWheel + _MouseWheel
        If __UI_GetProperMouseButton%%(1) = __UI_MouseButton1 And __UI_GetProperMouseButton%%(2) = __UI_MouseButton2 Then
            Do While _MouseInput
                __UI_MouseWheel = __UI_MouseWheel + _MouseWheel
                If Not (__UI_GetProperMouseButton%%(1) = __UI_MouseButton1 And __UI_GetProperMouseButton%%(2) = __UI_MouseButton2) Then Exit Do
            Loop
        End If
        __UI_MouseButton1 = __UI_GetProperMouseButton%%(1)
        __UI_MouseButton2 = __UI_GetProperMouseButton%%(2)
        __UI_MouseLeft = _MouseX
        __UI_MouseTop = _MouseY
    End If
    If __UI_PrevMouseLeft <> __UI_MouseLeft Or __UI_PrevMouseTop <> __UI_MouseTop Or __UI_DidClick Or __UI_HoveringSubMenu Then
        __UI_PrevMouseLeft = __UI_MouseLeft
        __UI_PrevMouseTop = __UI_MouseTop
        __UI_DidClick = False
        Dim TempHover As Long
        __UI_BelowHoveringID = 0
        For i = 1 To UBound(Control)
            If Control(i).ID > 0 And Control(i).Type <> __UI_Type_MenuItem And ((Control(i).Hidden = False And __UI_DesignMode = False) Or (__UI_DesignMode = True)) Then
                If Control(i).Type = __UI_Type_ContextMenu And __UI_DesignMode And __UI_ShowInvisibleControls = False Then _Continue
                If Control(i).Hidden = True And __UI_ShowInvisibleControls = False Then _Continue
                Control(i).HoveringVScrollbarButton = 0
                If Control(i).ParentID > 0 Then
                    If Control(Control(i).ParentID).Hidden = True Then _Continue
                    ContainerOffsetTop = Control(Control(i).ParentID).Top
                    ContainerOffsetLeft = Control(Control(i).ParentID).Left
                    If __UI_MouseLeft >= ContainerOffsetLeft And __UI_MouseLeft <= ContainerOffsetLeft + Control(Control(i).ParentID).Width - 1 And __UI_MouseTop >= ContainerOffsetTop And __UI_MouseTop <= ContainerOffsetTop + Control(Control(i).ParentID).Height - 1 Then
                        If __UI_MouseLeft >= ContainerOffsetLeft + Control(i).Left And __UI_MouseLeft <= ContainerOffsetLeft + Control(i).Left + Control(i).Width - 1 And __UI_MouseTop >= ContainerOffsetTop + Control(i).Top And __UI_MouseTop <= ContainerOffsetTop + Control(i).Top + Control(i).Height - 1 Then
                            __UI_BelowHoveringID = TempHover
                            TempHover = Control(i).ID
                            If Control(i).HasVScrollbar And __UI_IsDragging = False Then
                                If __UI_MouseLeft >= ContainerOffsetLeft + Control(i).Left + Control(i).Width - __UI_ScrollbarWidth Then
                                    If __UI_MouseTop <= Control(i).Top + ContainerOffsetTop + __UI_ScrollbarButtonHeight And __UI_DraggingThumb = False Then
                                        Control(i).HoveringVScrollbarButton = 1
                                        Control(i).PreviousInputViewStart = 0
                                    ElseIf __UI_MouseTop >= Control(i).Top + ContainerOffsetTop + Control(i).Height - __UI_ScrollbarButtonHeight And __UI_DraggingThumb = False Then
                                        Control(i).HoveringVScrollbarButton = 2
                                        Control(i).PreviousInputViewStart = 0
                                    ElseIf __UI_MouseTop >= ContainerOffsetTop + Control(i).ThumbTop And __UI_MouseTop <= ContainerOffsetTop + Control(i).ThumbTop + Control(i).ThumbHeight Then
                                        Control(i).HoveringVScrollbarButton = 3
                                        Control(i).PreviousInputViewStart = 0
                                    Else
                                        If __UI_MouseTop < ContainerOffsetTop + Control(i).ThumbTop Then
                                            Control(i).HoveringVScrollbarButton = 4
                                        Else
                                            Control(i).HoveringVScrollbarButton = 5
                                        End If
                                        Control(i).PreviousInputViewStart = 0
                                    End If
                                End If
                            End If
                        End If
                    End If
                Else
                    ContainerOffsetTop = 0
                    ContainerOffsetLeft = 0
                    If __UI_MouseLeft >= Control(i).Left And __UI_MouseLeft <= Control(i).Left + Control(i).Width - 1 And __UI_MouseTop >= Control(i).Top And __UI_MouseTop <= Control(i).Top + Control(i).Height - 1 Then
                        __UI_BelowHoveringID = TempHover
                        TempHover = Control(i).ID
                        If Control(i).Type = __UI_Type_ContextMenu And __UI_DesignMode Then
                            Exit For
                        End If
                        If Control(i).HasVScrollbar And __UI_IsDragging = False Then
                            If __UI_MouseLeft >= ContainerOffsetLeft + Control(i).Left + Control(i).Width - __UI_ScrollbarWidth Then
                                If __UI_MouseTop <= Control(i).Top + ContainerOffsetTop + __UI_ScrollbarButtonHeight And __UI_DraggingThumb = False Then
                                    Control(i).HoveringVScrollbarButton = 1
                                    Control(i).PreviousInputViewStart = 0
                                ElseIf __UI_MouseTop >= Control(i).Top + ContainerOffsetTop + Control(i).Height - __UI_ScrollbarButtonHeight And __UI_DraggingThumb = False Then
                                    Control(i).HoveringVScrollbarButton = 2
                                    Control(i).PreviousInputViewStart = 0
                                ElseIf __UI_MouseTop >= ContainerOffsetTop + Control(i).ThumbTop And __UI_MouseTop <= ContainerOffsetTop + Control(i).ThumbTop + Control(i).ThumbHeight Then
                                    Control(i).HoveringVScrollbarButton = 3
                                    Control(i).PreviousInputViewStart = 0
                                Else
                                    If __UI_MouseTop < ContainerOffsetTop + Control(i).ThumbTop Then
                                        Control(i).HoveringVScrollbarButton = 4
                                        Control(i).PreviousInputViewStart = 0
                                    Else
                                        Control(i).HoveringVScrollbarButton = 5
                                        Control(i).PreviousInputViewStart = 0
                                    End If
                                End If
                            End If
                        End If
                    End If
                End If
            End If
        Next
        If Control(TempHover).Type = __UI_Type_MenuPanel Then
            Dim ParentMenu As Long
            For i = __UI_TotalActiveMenus To 1 Step -1
                If __UI_ActiveMenu(i) = TempHover Then
                    ParentMenu = __UI_ParentMenu(i)
                    Exit For
                End If
            Next
            _Font Control(TempHover).Font
            For i = 1 To UBound(Control)
                If Control(i).ParentID = ParentMenu And Control(i).Hidden = False Then
                    If __UI_MouseTop >= Control(TempHover).Top + Control(i).Top And __UI_MouseTop <= Control(TempHover).Top + Control(i).Top + Control(i).Height - 1 Then
                        Control(TempHover).Value = __UI_Focus
                        TempHover = Control(i).ID
                        __UI_Focus = Control(i).ID
                        For j = __UI_TotalActiveMenus To 1 Step -1
                            If __UI_ParentMenu(j) = Control(i).ID Or __UI_ParentMenu(j) = ParentMenu Then
                                Exit For
                            Else
                                __UI_DestroyControl Control(__UI_ActiveMenu(j))
                            End If
                        Next
                        Exit For 'as no menu items will overlap in a panel
                    End If
                End If
            Next
        End If
        __UI_HoveringID = TempHover
        If Control(__UI_HoveringID).Type = __UI_Type_Frame And Control(__UI_BelowHoveringID).ParentID = Control(__UI_HoveringID).ID Then
            Swap __UI_HoveringID, __UI_BelowHoveringID
        End If
        If __UI_DesignMode And __UI_IsResizing = False And __UI_IsDragging = False Then
            __UI_ResizeHandleHover = 0
            If Control(__UI_HoveringID).ControlIsSelected And Control(__UI_HoveringID).Type <> __UI_Type_MenuBar And Control(__UI_HoveringID).Type <> __UI_Type_MenuItem Then
                If __UI_MouseLeft >= Control(__UI_HoveringID).Left + Control(Control(__UI_HoveringID).ParentID).Left + Control(__UI_HoveringID).Width - 8 And __UI_MouseTop >= Control(__UI_HoveringID).Top + Control(Control(__UI_HoveringID).ParentID).Top + Control(__UI_HoveringID).Height / 2 - 4 And __UI_MouseTop <= Control(__UI_HoveringID).Top + Control(Control(__UI_HoveringID).ParentID).Top + Control(__UI_HoveringID).Height / 2 + 4 Then
                    If __UI_Type(Control(__UI_HoveringID).Type).RestrictResize <> __UI_CantResizeH And __UI_Type(Control(__UI_HoveringID).Type).RestrictResize <> __UI_CantResize Then
                        __UI_ResizeHandleHover = 1 'Right
                    End If
                ElseIf __UI_MouseLeft >= Control(__UI_HoveringID).Left + Control(Control(__UI_HoveringID).ParentID).Left + Control(__UI_HoveringID).Width / 2 - 4 And __UI_MouseLeft <= Control(__UI_HoveringID).Left + Control(Control(__UI_HoveringID).ParentID).Left + Control(__UI_HoveringID).Width / 2 + 4 And __UI_MouseTop >= Control(__UI_HoveringID).Top + Control(Control(__UI_HoveringID).ParentID).Top + Control(__UI_HoveringID).Height / 2 - 4 And __UI_MouseTop >= Control(__UI_HoveringID).Top + Control(Control(__UI_HoveringID).ParentID).Top + Control(__UI_HoveringID).Height - 8 Then
                    If __UI_Type(Control(__UI_HoveringID).Type).RestrictResize <> __UI_CantResizeV And __UI_Type(Control(__UI_HoveringID).Type).RestrictResize <> __UI_CantResize Then
                        __UI_ResizeHandleHover = 2 'Bottom
                    End If
                ElseIf __UI_MouseLeft <= Control(__UI_HoveringID).Left + Control(Control(__UI_HoveringID).ParentID).Left + 8 And __UI_MouseTop >= Control(__UI_HoveringID).Top + Control(Control(__UI_HoveringID).ParentID).Top + Control(__UI_HoveringID).Height / 2 - 4 And __UI_MouseTop <= Control(__UI_HoveringID).Top + Control(Control(__UI_HoveringID).ParentID).Top + Control(__UI_HoveringID).Height / 2 + 4 Then
                    If __UI_Type(Control(__UI_HoveringID).Type).RestrictResize <> __UI_CantResizeH And __UI_Type(Control(__UI_HoveringID).Type).RestrictResize <> __UI_CantResize Then
                        __UI_ResizeHandleHover = 3 'Left
                    End If
                ElseIf __UI_MouseLeft >= Control(__UI_HoveringID).Left + Control(Control(__UI_HoveringID).ParentID).Left + Control(__UI_HoveringID).Width / 2 - 4 And __UI_MouseLeft <= Control(__UI_HoveringID).Left + Control(Control(__UI_HoveringID).ParentID).Left + Control(__UI_HoveringID).Width / 2 + 4 And __UI_MouseTop <= Control(__UI_HoveringID).Top + Control(Control(__UI_HoveringID).ParentID).Top + 8 Then
                    If __UI_Type(Control(__UI_HoveringID).Type).RestrictResize <> __UI_CantResizeV And __UI_Type(Control(__UI_HoveringID).Type).RestrictResize <> __UI_CantResize Then
                        __UI_ResizeHandleHover = 4 'Top
                    End If
                ElseIf __UI_MouseLeft >= Control(__UI_HoveringID).Left + Control(Control(__UI_HoveringID).ParentID).Left + Control(__UI_HoveringID).Width - 8 And __UI_MouseTop <= Control(__UI_HoveringID).Top + Control(Control(__UI_HoveringID).ParentID).Top + 8 Then
                    If __UI_Type(Control(__UI_HoveringID).Type).RestrictResize = False Then
                        __UI_ResizeHandleHover = 5 'Top-right
                    End If
                ElseIf __UI_MouseLeft <= Control(__UI_HoveringID).Left + Control(Control(__UI_HoveringID).ParentID).Left + 8 And __UI_MouseTop <= Control(__UI_HoveringID).Top + Control(Control(__UI_HoveringID).ParentID).Top + 8 Then
                    If __UI_Type(Control(__UI_HoveringID).Type).RestrictResize = False Then
                        __UI_ResizeHandleHover = 6 'Top-left
                    End If
                ElseIf __UI_MouseLeft >= Control(__UI_HoveringID).Left + Control(Control(__UI_HoveringID).ParentID).Left + Control(__UI_HoveringID).Width - 8 And __UI_MouseTop >= Control(__UI_HoveringID).Top + Control(Control(__UI_HoveringID).ParentID).Top + Control(__UI_HoveringID).Height - 8 Then
                    If __UI_Type(Control(__UI_HoveringID).Type).RestrictResize = False Then
                        __UI_ResizeHandleHover = 7 'Bottom-right
                    End If
                ElseIf __UI_MouseLeft <= Control(__UI_HoveringID).Left + Control(Control(__UI_HoveringID).ParentID).Left + 8 And __UI_MouseTop >= Control(__UI_HoveringID).Top + Control(Control(__UI_HoveringID).ParentID).Top + Control(__UI_HoveringID).Height - 8 Then
                    If __UI_Type(Control(__UI_HoveringID).Type).RestrictResize = False Then
                        __UI_ResizeHandleHover = 8 'Bottom-left
                    End If
                End If
            End If
        End If
        If Control(__UI_Focus).Type = __UI_Type_MenuBar And Control(__UI_HoveringID).Type = __UI_Type_MenuBar Then
            If __UI_TotalActiveMenus = 0 Then
                __UI_Focus = __UI_HoveringID
            End If
        ElseIf __UI_TotalActiveMenus > 0 And Control(__UI_HoveringID).Type = __UI_Type_MenuBar And __UI_ActiveMenuIsContextMenu = False And __UI_DesignMode = False Then
            If __UI_ParentMenu(__UI_TotalActiveMenus) <> __UI_HoveringID And Not Control(__UI_HoveringID).Disabled Then
                __UI_CloseAllMenus
                __UI_ActivateMenu Control(__UI_HoveringID), False
                __UI_ForceRedraw = True
            ElseIf Control(__UI_HoveringID).Disabled Then
                __UI_CloseAllMenus
                __UI_Focus = __UI_HoveringID
            End If
        Else
            If __UI_HoveringID <> __UI_LastHoveringID And Control(__UI_HoveringID).Type = __UI_Type_MenuItem And Control(__UI_HoveringID).SubMenu And __UI_DesignMode = False Then
                Control(__UI_HoveringID).LastChange = Timer
                __UI_HoveringSubMenu = True
            ElseIf __UI_HoveringID = __UI_LastHoveringID And Control(__UI_HoveringID).Type = __UI_Type_MenuItem And Control(__UI_HoveringID).SubMenu Then
                If Timer - Control(__UI_HoveringID).LastChange >= __UI_SubMenuDelay Then
                    __UI_ActivateMenu Control(__UI_HoveringID), False
                    __UI_HoveringSubMenu = False
                End If
            End If
        End If
    End If
    If __UI_HoveringID <> __UI_LastHoveringID Or __UI_MouseButton1 Or __UI_MouseButton2 Then
        __UI_TipTimer = Timer
        __UI_ActiveTipID = 0
    Else
        If __UI_HoveringID <> __UI_ActiveTipID And __UI_HoveringID > 0 And Not __UI_IsDragging Then
            If Timer - __UI_TipTimer >= __UI_ToolTipTimeOut Then
                If Len(ToolTip(__UI_HoveringID)) > 0 Then
                    __UI_ActiveTipID = __UI_HoveringID
                    __UI_ActiveTipTop = __UI_MouseTop + 16
                    __UI_ActiveTipLeft = __UI_MouseLeft
                End If
            End If
        End If
    End If
    __UI_KeyHit = _KeyHit
    If __UI_KeyHit Then __UI_HasInput = True
    If __UI_DesignMode = False Then
        If Control(__UI_FormID).CanResize <> __UI_CurrentResizeStatus Then
            __UI_CurrentResizeStatus = Control(__UI_FormID).CanResize
            If __UI_CurrentResizeStatus Then
                _Resize On
            Else
                _Resize Off
            End If
        End If
    End If
    Dim CheckResize As _Byte
    CheckResize = _Resize
    If (CheckResize And Control(__UI_FormID).CanResize) Or (CheckResize And __UI_DesignMode) Or __UI_CurrentBackColor <> Control(__UI_FormID).BackColor Or Control(__UI_FormID).Width <> _Width(0) Or Control(__UI_FormID).Height <> _Height(0) Then
        _Delay .1
        If CheckResize Then
            Control(__UI_FormID).Width = _ResizeWidth
            Control(__UI_FormID).Height = _ResizeHeight
        End If
        If Control(__UI_FormID).Width > 0 And Control(__UI_FormID).Height > 0 Then
            __UI_CurrentBackColor = Control(__UI_FormID).BackColor
            __UI_HasResized = 2 'Indicate this process is in the middle
            OldScreen& = _Display
            Screen _NewImage(Control(__UI_FormID).Width, Control(__UI_FormID).Height, 32)
            _FreeImage OldScreen&
            If Control(__UI_FormID).Canvas <> 0 Then _FreeImage Control(__UI_FormID).Canvas
            Control(__UI_FormID).Canvas = _NewImage(Control(__UI_FormID).Width, Control(__UI_FormID).Height, 32)
            _Dest Control(__UI_FormID).Canvas
            Color Control(__UI_FormID).ForeColor, Control(__UI_FormID).BackColor
            Cls
            If __UI_HasMenuBar = True Then
                _Font Control(__UI_FormID).Font
                __UI_MenuBarOffsetV = falcon_uspacing& + (((_Font = 8) * -1) * __UI_Font8Offset + ((_Font = 16) * -1) * __UI_Font16Offset) + 5 + 2
                Line (0, __UI_MenuBarOffsetV - 1)-Step(Control(__UI_FormID).Width - 1, 0), Darken(Control(__UI_FormID).BackColor, 80)
                Line (0, __UI_MenuBarOffsetV)-Step(Control(__UI_FormID).Width - 1, 0), Darken(Control(__UI_FormID).BackColor, 120)
                __UI_RefreshMenuBar
            Else
                __UI_MenuBarOffsetV = 0
            End If
            _Dest 0
            If Len(__UI_CurrentTitle) Then _Title __UI_CurrentTitle
            __UI_HasResized = True
            __UI_HasInput = True
        End If
    End If
    If __UI_CurrentTitle <> Caption(__UI_FormID) Then
        __UI_CurrentTitle = _Title$ 'Caption(__UI_FormID)
        _Title __UI_CurrentTitle
        __UI_HasInput = True
    End If
    __UI_ProcessInputTimer = Timer
End Sub
Sub __UI_UpdateDisplay
    Static ActiveTipPanel As Long
    Dim i As Long, TempCaption$, PrevDest As Long, TempParentID As Long
    Dim OverlayisVisible As _Byte, OverlayReset As _Byte
    Dim ContainerOffsetLeft As Integer, ContainerOffsetTop As Integer
    Dim ControlState As _Byte '1 = Normal; 2 = Hover/focus; 3 = Mouse down; 4 = Disabled;
    If __UI_AutoRefresh = False Then Exit Sub
    __UI_BeforeUpdateDisplay
    If _ScreenX = -32000 And _ScreenY = -32000 Then
        Exit Sub
    End If
    On Error GoTo __UI_ErrorHandler
    For i = 1 To UBound(Control)
        If Control(i).Type = __UI_Type_Frame Then
            Control(i).ParentID = 0 'Enforce no frames inside frames
            Control(i).Value = 0 'Reset children counter
            If _Width(Control(i).Canvas) <> Control(i).Width Or _Height(Control(i).Canvas) <> Control(i).Height Then
                _FreeImage Control(i).Canvas
                Control(i).Canvas = _NewImage(Control(i).Width, Control(i).Height, 32)
            End If
            _Dest Control(i).Canvas
            Color , Control(i).BackColor
            Cls
        Else
            If Control(i).ParentID > 0 And Control(i).Type <> __UI_Type_MenuItem Then
                Control(Control(i).ParentID).Value = Control(Control(i).ParentID).Value + 1
            End If
        End If
    Next
    _Dest 0
    If __UI_ForceRedraw Then 'Restore main window hardware bg
        _FreeImage Control(__UI_FormID).Canvas
        Control(__UI_FormID).Canvas = _NewImage(Control(__UI_FormID).Width, Control(__UI_FormID).Height, 32)
        _Dest Control(__UI_FormID).Canvas
        Color Control(__UI_FormID).ForeColor, Control(__UI_FormID).BackColor
        Cls
        If __UI_HasMenuBar Then
            _Font Control(__UI_FormID).Font
            __UI_MenuBarOffsetV = falcon_uspacing& + (((_Font = 8) * -1) * __UI_Font8Offset + ((_Font = 16) * -1) * __UI_Font16Offset) + 5 + 2
            Line (0, falcon_uspacing& + (((_Font = 8) * -1) * __UI_Font8Offset + ((_Font = 16) * -1) * __UI_Font16Offset) + 5 + 1)-Step(Control(__UI_FormID).Width - 1, 0), Darken(Control(__UI_FormID).BackColor, 80)
            Line (0, falcon_uspacing& + (((_Font = 8) * -1) * __UI_Font8Offset + ((_Font = 16) * -1) * __UI_Font16Offset) + 5 + 2)-Step(Control(__UI_FormID).Width - 1, 0), Darken(Control(__UI_FormID).BackColor, 120)
        Else
            __UI_MenuBarOffsetV = 0
        End If
        _Dest 0
    End If
    Dim iCount As Long
    For iCount = 1 To UBound(ControlDrawOrder)
        i = ControlDrawOrder(iCount)
        If Control(i).ID > 0 Then
            If Control(i).ParentID > 0 And Control(i).Type <> __UI_Type_MenuItem Then
                _Dest Control(Control(i).ParentID).Canvas
            Else
                _Dest 0
            End If
            If Control(i).Hidden = True And __UI_DesignMode = True And __UI_ShowInvisibleControls = True Then
                Line (Control(i).Left, Control(i).Top)-Step(Control(i).Width - 1, Control(i).Height - 1), _RGBA32(127, 127, 127, 80), BF
                _Font 8
                _PrintMode _KeepBackground
                Color _RGBA32(0, 0, 0, 150)
                _PrintString (Control(i).Left + 1, Control(i).Top + 1), RTrim$(Control(i).Name)
                _PrintString (Control(i).Left + 1, Control(i).Top + 1 + falcon_uspacing&), "(hidden)"
                GoTo BypassDisplay
            ElseIf Control(i).Hidden = True Then
                GoTo BypassDisplay
            End If
            If ((__UI_MouseIsDown And i = __UI_MouseDownOnID) Or (__UI_KeyIsDown And i = __UI_KeyDownOnID And __UI_KeyDownOnID = __UI_Focus)) And Not Control(i).Disabled Then
                ControlState = 3
            ElseIf (i = __UI_HoveringID And Control(i).Type = __UI_Type_MenuBar) Then
                ControlState = 2
            ElseIf (i = __UI_HoveringID And Control(i).Type <> __UI_Type_MenuBar And Not Control(i).Disabled) Then
                ControlState = 2
            ElseIf Control(i).Disabled Then
                ControlState = 4
            Else
                ControlState = 1
            End If
            Select Case Control(i).Type
                Case __UI_Type_Form
                    If __UI_HasResized <> 2 Then
                        If Control(i).Canvas < -1 Then _PutImage (0, 0), Control(i).Canvas, 0
                    Else
                        Paint (0, 0), Control(i).BackColor
                    End If
                Case __UI_Type_Button
                    __UI_DrawButton Control(i), ControlState
                Case __UI_Type_Label
                    AutoSizeLabel Control(i)
                    __UI_DrawLabel Control(i), ControlState
                Case __UI_Type_RadioButton
                    __UI_DrawRadioButton Control(i), ControlState
                Case __UI_Type_CheckBox
                    __UI_StateHasChanged = False
                    __UI_DrawCheckBox Control(i), ControlState
                    If __UI_StateHasChanged Then __UI_ValueChanged i
                Case __UI_Type_ProgressBar
                    __UI_DrawProgressBar Control(i), ControlState
                Case __UI_Type_TrackBar
                    Control(i).Value = _Round(Control(i).Value)
                    Control(i).Interval = _Round(Control(i).Interval)
                    Control(i).MinInterval = _Round(Control(i).MinInterval)
                    __UI_StateHasChanged = False
                    __UI_DrawTrackBar Control(i), ControlState
                    If __UI_StateHasChanged Then __UI_ValueChanged i
                Case __UI_Type_TextBox
                    If __UI_EditorMode = False And Control(i).NumericOnly = __UI_NumericWithBounds And __UI_Focus <> i Then
                        __UI_ValidateBounds i
                        If Text(i) <> LTrim$(Str$(Control(i).Value)) Then
                            Text(i) = LTrim$(Str$(Control(i).Value))
                        End If
                    End If
                    Dim ss1 As Long, ss2 As Long
                    __UI_FillSelectedText ss1, ss2
                    __UI_StateHasChanged = False
                    __UI_DrawTextBox Control(i), ControlState
                    If __UI_StateHasChanged Then
                        __UI_TextChanged i
                        If Control(__UI_Focus).NumericOnly Then
                            Control(__UI_Focus).Value = Val(Text(__UI_Focus))
                            __UI_ValidateBounds __UI_Focus
                        End If
                    End If
                Case __UI_Type_ListBox
                    If Control(i).InputViewStart <= 0 Then Control(i).InputViewStart = 1
                    __UI_StateHasChanged = False
                    __UI_DrawListBox Control(i), ControlState
                    If __UI_StateHasChanged Then __UI_ValueChanged i
                Case __UI_Type_DropdownList
                    __UI_StateHasChanged = False
                    __UI_DrawDropdownList Control(i), ControlState
                    If __UI_StateHasChanged Then __UI_ValueChanged i
                Case __UI_Type_MenuBar
                    __UI_DrawMenuBar Control(i), ControlState
                Case __UI_Type_PictureBox
                    __UI_DrawPictureBox Control(i), ControlState
                Case __UI_Type_ToggleSwitch
                    __UI_StateHasChanged = False
                    __UI_DrawToggleSwitch Control(i), ControlState
                    If __UI_StateHasChanged Then __UI_ValueChanged i
            End Select
        End If
        BypassDisplay:
        If __UI_Snapped Then
            If OverlayReset = False Then
                OverlayReset = True
                If Control(__UI_FormID).HelperCanvas <> 0 Then _FreeImage Control(__UI_FormID).HelperCanvas
                Control(__UI_FormID).HelperCanvas = _NewImage(Control(__UI_FormID).Width, Control(__UI_FormID).Height, 32)
                _Dest Control(__UI_FormID).HelperCanvas
                Cls , _RGBA32(0, 0, 0, 0)
            Else
                _Dest Control(__UI_FormID).HelperCanvas
            End If
            OverlayisVisible = True
            If __UI_Snapped Then
                Dim X1 As Integer, X2 As Integer
                Dim Y1 As Integer, Y2 As Integer
                ContainerOffsetLeft = Control(Control(__UI_DraggingID).ParentID).Left
                ContainerOffsetTop = Control(Control(__UI_DraggingID).ParentID).Top
                If __UI_SnappedY >= 0 And __UI_SnappedByProximityY = 0 Then
                    X1 = 0
                    X2 = _Width
                    Line (X1, __UI_SnappedY)-Step(X2, 0), Control(__UI_FormID).SelectedBackColor
                ElseIf __UI_SnappedY >= 0 And __UI_SnappedByProximityY > 0 Then
                    Select Case __UI_SnappedByProximityY
                        Case 1 'bottom of dragged control to top of snapped control
                            X1 = Control(__UI_DraggingID).Left + Control(__UI_DraggingID).Width / 2
                            If X1 < Control(__UI_SnappedXID).Left + 1 Then X1 = Control(__UI_SnappedXID).Left + 1
                            If X1 > Control(__UI_SnappedXID).Left + Control(__UI_SnappedXID).Width - 1 Then X1 = Control(__UI_SnappedXID).Left + Control(__UI_SnappedXID).Width - 1
                            Y1 = Control(__UI_DraggingID).Top + Control(__UI_DraggingID).Height
                            For X1 = X1 - 1 To X1 + 1
                                Line (X1 + ContainerOffsetLeft, Y1 + ContainerOffsetTop)-Step(0, __UI_SnapDistance), Control(__UI_FormID).SelectedBackColor
                            Next
                        Case 2 'top of dragged control to bottom of snapped control
                            X1 = Control(__UI_DraggingID).Left + Control(__UI_DraggingID).Width / 2
                            If X1 < Control(__UI_SnappedXID).Left + 1 Then X1 = Control(__UI_SnappedXID).Left + 1
                            If X1 > Control(__UI_SnappedXID).Left + Control(__UI_SnappedXID).Width - 1 Then X1 = Control(__UI_SnappedXID).Left + Control(__UI_SnappedXID).Width - 1
                            Y1 = Control(__UI_DraggingID).Top
                            For X1 = X1 - 1 To X1 + 1
                                Line (X1 + ContainerOffsetLeft, Y1 + ContainerOffsetTop)-Step(0, -__UI_SnapDistance), Control(__UI_FormID).SelectedBackColor
                            Next
                        Case 3 'snapped to top of form
                            X1 = Control(__UI_DraggingID).Left + Control(__UI_DraggingID).Width / 2
                            If X1 < 1 Then X1 = 1
                            If X1 > Control(__UI_FormID).Width - 2 Then X1 = Control(__UI_FormID).Width - 2
                            Y1 = Control(__UI_DraggingID).Top
                            For X1 = X1 - 1 To X1 + 1
                                Line (X1 + ContainerOffsetLeft, Y1 + ContainerOffsetTop)-Step(0, -__UI_SnapDistanceFromForm), Control(__UI_FormID).SelectedBackColor
                            Next
                        Case 4 'snapped to bottom of form
                            X1 = Control(__UI_DraggingID).Left + Control(__UI_DraggingID).Width / 2
                            If X1 < 1 Then X1 = 1
                            If X1 > Control(__UI_FormID).Width - 2 Then X1 = Control(__UI_FormID).Width - 2
                            Y1 = Control(__UI_DraggingID).Top + Control(__UI_DraggingID).Height
                            For X1 = X1 - 1 To X1 + 1
                                Line (X1 + ContainerOffsetLeft, Y1 + ContainerOffsetTop)-Step(0, __UI_SnapDistanceFromForm), Control(__UI_FormID).SelectedBackColor
                            Next
                    End Select
                End If
                If __UI_SnappedX >= 0 And __UI_SnappedByProximityX = 0 Then
                    Y1 = 0
                    Y2 = _Height
                    Line (__UI_SnappedX, Y1)-Step(0, Y2), Control(__UI_FormID).SelectedBackColor
                ElseIf __UI_SnappedX >= 0 And __UI_SnappedByProximityX > 0 Then
                    Select Case __UI_SnappedByProximityX
                        Case 1 'left of dragged control to right of snapped control
                            X1 = Control(__UI_SnappedXID).Left + Control(__UI_SnappedXID).Width
                            Y1 = Control(__UI_DraggingID).Top + Control(__UI_DraggingID).Height / 2
                            If Y1 < Control(__UI_SnappedXID).Top + 1 Then Y1 = Control(__UI_SnappedXID).Top + 1
                            If Y1 > Control(__UI_SnappedXID).Top + Control(__UI_SnappedXID).Height - 1 Then Y1 = Control(__UI_SnappedXID).Top + Control(__UI_SnappedXID).Height - 1
                            For Y1 = Y1 - 1 To Y1 + 1
                                Line (X1 + ContainerOffsetLeft, Y1 + ContainerOffsetTop)-Step(__UI_SnapDistance, 0), Control(__UI_FormID).SelectedBackColor
                            Next
                        Case 2 'right of dragged control to left of snapped control
                            X1 = Control(__UI_SnappedXID).Left
                            Y1 = Control(__UI_DraggingID).Top + Control(__UI_DraggingID).Height / 2
                            If Y1 < Control(__UI_SnappedXID).Top + 1 Then Y1 = Control(__UI_SnappedXID).Top + 1
                            If Y1 > Control(__UI_SnappedXID).Top + Control(__UI_SnappedXID).Height - 1 Then Y1 = Control(__UI_SnappedXID).Top + Control(__UI_SnappedXID).Height - 1
                            For Y1 = Y1 - 1 To Y1 + 1
                                Line (X1 + ContainerOffsetLeft, Y1 + ContainerOffsetTop)-Step(-__UI_SnapDistance, 0), Control(__UI_FormID).SelectedBackColor
                            Next
                        Case 3 'snapped to left side of form
                            X1 = Control(__UI_DraggingID).Left
                            Y1 = Control(__UI_DraggingID).Top + Control(__UI_DraggingID).Height / 2
                            If Y1 < 1 Then Y1 = 1
                            If Y1 > Control(__UI_FormID).Height - 2 Then Y1 = Control(__UI_FormID).Height - 2
                            For Y1 = Y1 - 1 To Y1 + 1
                                Line (X1 + ContainerOffsetLeft, Y1 + ContainerOffsetTop)-Step(-__UI_SnapDistanceFromForm, 0), Control(__UI_FormID).SelectedBackColor
                            Next
                        Case 4 'snapped to right side of form
                            X1 = Control(__UI_DraggingID).Left + Control(__UI_DraggingID).Width
                            Y1 = Control(__UI_DraggingID).Top + Control(__UI_DraggingID).Height / 2
                            If Y1 < 1 Then Y1 = 1
                            If Y1 > Control(__UI_FormID).Height - 2 Then Y1 = Control(__UI_FormID).Height - 2
                            For Y1 = Y1 - 1 To Y1 + 1
                                Line (X1 + ContainerOffsetLeft, Y1 + ContainerOffsetTop)-Step(__UI_SnapDistanceFromForm, 0), Control(__UI_FormID).SelectedBackColor
                            Next
                    End Select
                End If
            End If
            _Dest 0
        End If
        If Control(i).ControlIsSelected Then
            If OverlayReset = False Then
                OverlayReset = True
                If Control(__UI_FormID).HelperCanvas <> 0 Then _FreeImage Control(__UI_FormID).HelperCanvas
                Control(__UI_FormID).HelperCanvas = _NewImage(Control(__UI_FormID).Width, Control(__UI_FormID).Height, 32)
                _Dest Control(__UI_FormID).HelperCanvas
                Cls , _RGBA32(0, 0, 0, 0)
            Else
                _Dest Control(__UI_FormID).HelperCanvas
            End If
            OverlayisVisible = True
            If Control(i).Type = __UI_Type_MenuItem Then
                TempParentID = Control(i).ParentID
                Control(i).ParentID = Control(i).MenuPanelID
                Line (Control(i).Left + Control(Control(i).ParentID).Left - 2, Control(i).Top + Control(Control(i).ParentID).Top - 2)-Step(Control(Control(i).ParentID).Width + 3, Control(i).Height + 3), _RGB32(0, 0, 0), B , 21845
            Else
                TempParentID = 0
                Line (Control(i).Left + Control(Control(i).ParentID).Left - 2, Control(i).Top + Control(Control(i).ParentID).Top - 2)-Step(Control(i).Width + 3, Control(i).Height + 3), _RGB32(0, 0, 0), B , 21845
            End If
            If Not __UI_IsDragging Then
                If __UI_Type(Control(i).Type).RestrictResize <> __UI_CantResizeH And __UI_Type(Control(i).Type).RestrictResize <> __UI_CantResize Then
                    If Control(i).Type = __UI_Type_MenuItem Then
                        Line (Control(i).Left + Control(Control(i).ParentID).Left + Control(Control(i).ParentID).Width - 8, Control(i).Top + Control(Control(i).ParentID).Top + Control(i).Height / 2 - 4)-Step(7, 7), _RGB32(255, 255, 255), BF
                        Line (Control(i).Left + Control(Control(i).ParentID).Left + Control(Control(i).ParentID).Width - 8, Control(i).Top + Control(Control(i).ParentID).Top + Control(i).Height / 2 - 4)-Step(7, 7), _RGB32(0, 0, 0), B
                    Else
                        Line (Control(i).Left + Control(Control(i).ParentID).Left + Control(i).Width - 8, Control(i).Top + Control(Control(i).ParentID).Top + Control(i).Height / 2 - 4)-Step(7, 7), _RGB32(255, 255, 255), BF
                        Line (Control(i).Left + Control(Control(i).ParentID).Left + Control(i).Width - 8, Control(i).Top + Control(Control(i).ParentID).Top + Control(i).Height / 2 - 4)-Step(7, 7), _RGB32(0, 0, 0), B
                    End If
                    Line (Control(i).Left + Control(Control(i).ParentID).Left, Control(i).Top + Control(Control(i).ParentID).Top + Control(i).Height / 2 - 4)-Step(7, 7), _RGB32(255, 255, 255), BF
                    Line (Control(i).Left + Control(Control(i).ParentID).Left, Control(i).Top + Control(Control(i).ParentID).Top + Control(i).Height / 2 - 4)-Step(7, 7), _RGB32(0, 0, 0), B
                End If
                If __UI_Type(Control(i).Type).RestrictResize <> __UI_CantResizeV And __UI_Type(Control(i).Type).RestrictResize <> __UI_CantResize Then
                    Line (Control(i).Left + Control(Control(i).ParentID).Left + Control(i).Width / 2 - 4, Control(i).Top + Control(Control(i).ParentID).Top + Control(i).Height - 8)-Step(7, 7), _RGB32(255, 255, 255), BF
                    Line (Control(i).Left + Control(Control(i).ParentID).Left + Control(i).Width / 2 - 4, Control(i).Top + Control(Control(i).ParentID).Top + Control(i).Height - 8)-Step(7, 7), _RGB32(0, 0, 0), B
                    Line (Control(i).Left + Control(Control(i).ParentID).Left + Control(i).Width / 2 - 4, Control(i).Top + Control(Control(i).ParentID).Top)-Step(7, 7), _RGB32(255, 255, 255), BF
                    Line (Control(i).Left + Control(Control(i).ParentID).Left + Control(i).Width / 2 - 4, Control(i).Top + Control(Control(i).ParentID).Top)-Step(7, 7), _RGB32(0, 0, 0), B
                End If
                If __UI_Type(Control(i).Type).RestrictResize = False Then
                    Line (Control(i).Left + Control(Control(i).ParentID).Left + Control(i).Width - 8, Control(i).Top + Control(Control(i).ParentID).Top + Control(i).Height - 8)-Step(7, 7), _RGB32(255, 255, 255), BF
                    Line (Control(i).Left + Control(Control(i).ParentID).Left + Control(i).Width - 8, Control(i).Top + Control(Control(i).ParentID).Top + Control(i).Height - 8)-Step(7, 7), _RGB32(0, 0, 0), B
                    Line (Control(i).Left + Control(Control(i).ParentID).Left, Control(i).Top + Control(Control(i).ParentID).Top + Control(i).Height - 8)-Step(7, 7), _RGB32(255, 255, 255), BF
                    Line (Control(i).Left + Control(Control(i).ParentID).Left, Control(i).Top + Control(Control(i).ParentID).Top + Control(i).Height - 8)-Step(7, 7), _RGB32(0, 0, 0), B
                    Line (Control(i).Left + Control(Control(i).ParentID).Left + Control(i).Width - 8, Control(i).Top + Control(Control(i).ParentID).Top)-Step(7, 7), _RGB32(255, 255, 255), BF
                    Line (Control(i).Left + Control(Control(i).ParentID).Left + Control(i).Width - 8, Control(i).Top + Control(Control(i).ParentID).Top)-Step(7, 7), _RGB32(0, 0, 0), B
                    Line (Control(i).Left + Control(Control(i).ParentID).Left, Control(i).Top + Control(Control(i).ParentID).Top)-Step(7, 7), _RGB32(255, 255, 255), BF
                    Line (Control(i).Left + Control(Control(i).ParentID).Left, Control(i).Top + Control(Control(i).ParentID).Top)-Step(7, 7), _RGB32(0, 0, 0), B
                End If
            End If
            If TempParentID > 0 Then Control(i).ParentID = TempParentID
            _Dest 0
        End If
        If Control(i).ParentID > 0 And Control(i).Type <> __UI_Type_MenuItem Then
            Dim CheckChildControls As Long, NoMoreChildren As _Byte, ThisParent As Long
            ThisParent = Control(i).ParentID
            NoMoreChildren = True
            For CheckChildControls = i + 1 To UBound(Control)
                If Control(CheckChildControls).ParentID = ThisParent Then
                    NoMoreChildren = False
                    Exit For
                End If
            Next
            If NoMoreChildren Then
                __UI_DrawFrame Control(ThisParent)
            End If
        End If
    Next
    For i = 1 To UBound(Control)
        If Control(i).Type = __UI_Type_Frame And Control(i).Value = 0 Then
            __UI_DrawFrame Control(i)
        End If
    Next
    If __UI_DesignMode And __UI_SelectionRectangle Then
        If OverlayReset = False Then
            OverlayReset = True
            If Control(__UI_FormID).HelperCanvas <> 0 Then _FreeImage Control(__UI_FormID).HelperCanvas
            Control(__UI_FormID).HelperCanvas = _NewImage(Control(__UI_FormID).Width, Control(__UI_FormID).Height, 32)
            _Dest Control(__UI_FormID).HelperCanvas
            Cls , _RGBA32(0, 0, 0, 0)
        Else
            _Dest Control(__UI_FormID).HelperCanvas
        End If
        OverlayisVisible = True
        Line (__UI_SelectionRectangleLeft, __UI_SelectionRectangleTop)-(__UI_MouseLeft, __UI_MouseTop), _RGBA32(0, 177, 255, 150), BF
        Line (__UI_SelectionRectangleLeft, __UI_SelectionRectangleTop)-(__UI_MouseLeft, __UI_MouseTop), _RGB32(39, 188, 244), B
        _Dest 0
    End If
    If __UI_TotalSelectedControls > 0 And __UI_Snapped = False And __UI_ShowPositionAndSize Then
        If Control(__UI_FormID).Width > 0 And Control(__UI_FormID).Height > 0 Then
            If OverlayReset = False Then
                OverlayReset = True
                If Control(__UI_FormID).HelperCanvas <> 0 Then _FreeImage Control(__UI_FormID).HelperCanvas
                Control(__UI_FormID).HelperCanvas = _NewImage(Control(__UI_FormID).Width, Control(__UI_FormID).Height, 32)
                _Dest Control(__UI_FormID).HelperCanvas
                Cls , _RGBA32(0, 0, 0, 0)
            Else
                _Dest Control(__UI_FormID).HelperCanvas
            End If
            i = __UI_FirstSelectedID
            If Control(__UI_HoveringID).ControlIsSelected Then i = __UI_HoveringID
            If Control(i).Type <> __UI_Type_ContextMenu And Control(i).Type <> __UI_Type_MenuBar And Control(i).Type <> __UI_Type_MenuItem Then
                OverlayisVisible = True
                Dim SizeAndPosition1$, SizeAndPosition2$, pw&
                Dim InfoLeft As Integer, InfoTop As Integer
                _Font Control(__UI_FormID).Font
                SizeAndPosition1$ = LTrim$(Str$(Control(i).Left)) + "," + LTrim$(Str$(Control(i).Top))
                pw& = __UI_PrintWidth(SizeAndPosition1$)
                SizeAndPosition2$ = LTrim$(Str$(Control(i).Width)) + "x" + LTrim$(Str$(Control(i).Height))
                If __UI_PrintWidth(SizeAndPosition2$) > pw& Then pw& = __UI_PrintWidth(SizeAndPosition2$)
                InfoLeft = Control(Control(i).ParentID).Left + Control(i).Left
                If InfoLeft < 0 Then InfoLeft = 0
                If InfoLeft + pw& + 4 > Control(__UI_FormID).Width Then InfoLeft = Control(__UI_FormID).Width - (pw& + 4)
                InfoTop = Control(Control(i).ParentID).Top + Control(i).Top + Control(i).Height + 2
                If InfoTop < 0 Then InfoTop = 0
                If InfoTop + uspacing& * 2 + 4 > Control(__UI_FormID).Height Then InfoTop = Control(__UI_FormID).Height - (uspacing& * 2 + 4)
                IF InfoLeft < Control(Control(i).ParentID).Left + Control(i).Left + Control(i).Width AND _
                    Control(Control(i).ParentID).Left + Control(i).Left < InfoLeft + pw& + 4 AND _
                    InfoTop < Control(Control(i).ParentID).Top + Control(i).Top + Control(i).Height + 2 AND _
                    Control(Control(i).ParentID).Top + Control(i).Top < InfoTop + uspacing& * 2 + 4 THEN
                    InfoTop = Control(Control(i).ParentID).Top + Control(i).Top - (uspacing& * 2 + 4)
                End If
                IF __UI_MouseLeft >= InfoLeft AND __UI_MouseLeft <= InfoLeft + pw& + 4 AND _
                    __UI_MouseTop >= InfoTop AND __UI_MouseTop <= InfoTop + uspacing& * 2 + 4 THEN
                    InfoLeft = InfoLeft + Control(i).Width
                End If
                __UI_ShadowBox InfoLeft, InfoTop, pw& + 4, uspacing& * 2 + 4, __UI_DefaultColor(__UI_Type_Form, 6), 40, 5
                Color _RGB32(0, 0, 0)
                __UI_PrintString InfoLeft + 3, InfoTop + 3, SizeAndPosition1$
                __UI_PrintString InfoLeft + 3, InfoTop + 3 + uspacing&, SizeAndPosition2$
            End If
            _Dest 0
        End If
    End If
    For i = 1 To __UI_TotalActiveMenus
        If Left$(Control(__UI_ActiveMenu(i)).Name, 5) <> "__UI_" Then
            __UI_DrawMenuPanel Control(__UI_ActiveMenu(i)), __UI_ParentMenu(i)
        End If
    Next
    If OverlayisVisible Then
        If Control(__UI_FormID).HelperCanvas < -1 Then
            __UI_MakeHardwareImage Control(__UI_FormID).HelperCanvas
            _PutImage , Control(__UI_FormID).HelperCanvas
        End If
    End If
    If __UI_DesignMode = True And __UI_ShowInvisibleControls = True Then
        For i = 1 To UBound(Control)
            If Control(i).Type = __UI_Type_ContextMenu And Left$(Control(i).Name, 5) <> "__UI_" Then
                __UI_DrawContextMenuHandle Control(i), Control(i).ControlState
            End If
        Next
    End If
    For i = 1 To __UI_TotalActiveMenus
        If Left$(Control(__UI_ActiveMenu(i)).Name, 5) = "__UI_" Then
            __UI_DrawMenuPanel Control(__UI_ActiveMenu(i)), __UI_ParentMenu(i)
        End If
    Next
    Static PanelWidth As Integer, PanelHeight As Integer
    If __UI_ActiveTipID > 0 Then
        If __UI_ActiveTipID <> __UI_PreviousTipID Or ToolTip(__UI_ActiveTipID) <> __UI_TempTips(__UI_ActiveTipID) Then
            __UI_PreviousTipID = __UI_ActiveTipID
            ToolTip(__UI_ActiveTipID) = RestoreCHR$(ToolTip(__UI_ActiveTipID))
            __UI_TempTips(__UI_ActiveTipID) = ToolTip(__UI_ActiveTipID)
            Dim ThisLine%, TextTop%
            Dim FindLF As Long, TotalLines As Integer, LongestLine As Integer, TempLine$
            _Font Control(__UI_FormID).Font
            TempCaption$ = __UI_WordWrap(Replace(ToolTip(__UI_ActiveTipID), "\n", Chr$(10), False, 0), Control(__UI_FormID).Width / 2, LongestLine, TotalLines)
            PanelWidth = LongestLine + 16
            If TotalLines = 1 Then
                PanelHeight = uspacing& + 8
            Else
                PanelHeight = (TotalLines * uspacing&) + 8
            End If
            If ActiveTipPanel <> 0 Then _FreeImage ActiveTipPanel
            ActiveTipPanel = _NewImage(PanelWidth, PanelHeight, 32)
            _Dest ActiveTipPanel
            _Font Control(__UI_FormID).Font
            __UI_ShadowBox 0, 0, PanelWidth - 6, PanelHeight - 6, __UI_DefaultColor(__UI_Type_Form, 6), 40, 5
            Color __UI_DefaultColor(__UI_Type_Form, 1)
            If TotalLines = 1 Then
                __UI_PrintString _Width \ 2 - __UI_PrintWidth(TempCaption$) \ 2 - 1.75, _Height \ 2 - uheight& \ 2 - 1.75, TempCaption$
            Else
                Do While Len(TempCaption$)
                    ThisLine% = ThisLine% + 1
                    TextTop% = 3 + ThisLine% * uspacing& - uspacing&
                    FindLF& = InStr(TempCaption$, Chr$(1))
                    If FindLF& > 0 Then
                        TempLine$ = Left$(TempCaption$, FindLF& - 1)
                        TempCaption$ = Mid$(TempCaption$, FindLF& + 1)
                    Else
                        TempLine$ = TempCaption$
                        TempCaption$ = ""
                        If ThisLine% = 1 Then TextTop% = ((_Height \ 2) - uspacing& \ 2)
                    End If
                    __UI_PrintString 5, TextTop%, TempLine$
                Loop
            End If
            Line (0, 0)-(_Width - 6, _Height - 6), __UI_DefaultColor(__UI_Type_Form, 5), B
            __UI_MakeHardwareImage ActiveTipPanel
        End If
        _Dest 0
        If __UI_ActiveTipTop + PanelHeight > Control(__UI_FormID).Height Then
            __UI_ActiveTipTop = Control(__UI_FormID).Height - PanelHeight
            If __UI_ActiveTipTop < 0 Then __UI_ActiveTipTop = 0
        End If
        If __UI_ActiveTipLeft + PanelWidth > Control(__UI_FormID).Width Then
            __UI_ActiveTipLeft = Control(__UI_FormID).Width - PanelWidth
            If __UI_ActiveTipLeft < 0 Then __UI_ActiveTipLeft = 0
        End If
        _PutImage (__UI_ActiveTipLeft, __UI_ActiveTipTop), ActiveTipPanel
    End If
    If __UI_IsDragging And __UI_DraggingID > 0 And __UI_DraggingID <> __UI_FormID And (_KeyDown(100305) = 0 And _KeyDown(100306) = 0) And __UI_SnapLines Then
        Static DragTip As Long, TipPanelWidth As Integer
        If DragTip = 0 Then
            _Font Control(__UI_FormID).Font
            TempCaption$ = "Hold Ctrl to bypass snapping"
            TipPanelWidth = __UI_PrintWidth(TempCaption$) + 10
            PanelHeight = uspacing& + 5 + 5
            DragTip = _NewImage(TipPanelWidth, PanelHeight, 32)
            _Dest DragTip
            _Font Control(__UI_FormID).Font
            __UI_ShadowBox 0, 0, TipPanelWidth - 6, PanelHeight - 6, __UI_DefaultColor(__UI_Type_Form, 6), 40, 5
            Color __UI_DefaultColor(__UI_Type_Form, 1)
            __UI_PrintString _Width \ 2 - __UI_PrintWidth(TempCaption$) \ 2 - 1.75, _Height \ 2 - uspacing& \ 2 - 1.75, TempCaption$
            Line (0, 0)-(_Width - 6, _Height - 6), __UI_DefaultColor(__UI_Type_Form, 5), B
            __UI_MakeHardwareImage DragTip
        End If
        _Dest 0
        If __UI_Snapped Then
            X1 = _Width \ 2 - TipPanelWidth \ 2
            Y1 = 0
            If Control(__UI_DraggingID).Top <= _Height(DragTip) Then
                _PutImage (X1, Control(__UI_FormID).Height - _Height(DragTip)), DragTip
            Else
                _PutImage (X1, 0), DragTip
            End If
        End If
    ElseIf __UI_IsResizing And Control(__UI_ResizingID).Type = __UI_Type_Label And Control(__UI_ResizingID).AutoSize = True Then
        Static ResizeTip As Long, ResizeTipPanelWidth As Integer
        If ResizeTip = 0 Then
            _Font Control(__UI_FormID).Font
            TempCaption$ = "Can't resize a label when .AutoSize = True"
            ResizeTipPanelWidth = __UI_PrintWidth(TempCaption$) + 10
            PanelHeight = uspacing& + 5 + 5
            ResizeTip = _NewImage(ResizeTipPanelWidth, PanelHeight, 32)
            _Dest ResizeTip
            _Font Control(__UI_FormID).Font
            __UI_ShadowBox 0, 0, ResizeTipPanelWidth - 6, PanelHeight - 6, __UI_DefaultColor(__UI_Type_Form, 6), 40, 5
            Color __UI_DefaultColor(__UI_Type_Form, 1)
            __UI_PrintString _Width \ 2 - __UI_PrintWidth(TempCaption$) \ 2 - 1.75, _Height \ 2 - uspacing& \ 2 - 1.75, TempCaption$
            Line (0, 0)-(_Width - 6, _Height - 6), __UI_DefaultColor(__UI_Type_Form, 5), B
            __UI_MakeHardwareImage ResizeTip
        End If
        _Dest 0
        X1 = _Width \ 2 - ResizeTipPanelWidth \ 2
        Y1 = 0
        If Control(__UI_ResizingID).Top <= _Height(ResizeTip) Then
            _PutImage (X1, Control(__UI_FormID).Height - _Height(ResizeTip)), ResizeTip
        Else
            _PutImage (X1, 0), ResizeTip
        End If
    End If
    __UI_ForceRedraw = False
    Static WaitMessageSetup As _Byte, PrevWaitMessage As String
    Dim NoInputMessage$
    If Timer - __UI_ProcessInputTimer > 2 Then
        If __UI_WaitMessageHandle = 0 Then
            __UI_WaitMessageHandle = _NewImage(_Width(0), _Height(0), 32)
        ElseIf _Width(__UI_WaitMessageHandle) <> _Width(0) Or _Height(__UI_WaitMessageHandle) <> _Height(0) Then
            _FreeImage __UI_WaitMessageHandle
            __UI_WaitMessageHandle = _NewImage(_Width(0), _Height(0), 32)
        End If
        If WaitMessageSetup = False Or PrevWaitMessage <> __UI_WaitMessage Then
            PrevWaitMessage = __UI_WaitMessage
            WaitMessageSetup = True
            PrevDest = _Dest
            _Dest __UI_WaitMessageHandle
            Line (0, 0)-Step(_Width, _Height), _RGBA32(0, 0, 0, 170), BF
            _Font Control(__UI_FormID).Font
            _PrintMode _KeepBackground
            NoInputMessage$ = "Please wait..."
            Color _RGB32(0, 0, 0)
            __UI_PrintString _Width / 2 - __UI_PrintWidth(NoInputMessage$) / 2 + 1, _Height \ 2 - uspacing + 1, NoInputMessage$
            Color _RGB32(255, 255, 255)
            __UI_PrintString _Width / 2 - __UI_PrintWidth(NoInputMessage$) / 2, _Height \ 2 - uspacing, NoInputMessage$
            If Len(__UI_WaitMessage) > 0 Then
                If Left$(__UI_WaitMessage, 1) <> "(" Then __UI_WaitMessage = "(" + __UI_WaitMessage + ")"
                Color _RGB32(0, 0, 0)
                __UI_PrintString _Width / 2 - __UI_PrintWidth(__UI_WaitMessage) / 2 + 1, _Height \ 2 + uspacing + 1, __UI_WaitMessage
                Color _RGB32(255, 255, 255)
                __UI_PrintString _Width / 2 - __UI_PrintWidth(__UI_WaitMessage) / 2, _Height \ 2 + uspacing, __UI_WaitMessage
            End If
            _Dest PrevDest
            __UI_MakeHardwareImage __UI_WaitMessageHandle
        End If
        If _Exit Then System 'Can't force user to wait...
        _PutImage , __UI_WaitMessageHandle
    End If
    For i = 1 To 2
        If ControlDrawOrder(UBound(ControlDrawOrder)) = 0 Then __UI_ExpandControlDrawOrder -1
    Next i 'run that a couple times for good measure
    _Display
End Sub
Sub __UI_EventDispatcher
    Static __UI_LastMouseIconSet As _Byte
    Static __UI_LastMouseDownEvent As Single
    Static __UI_MouseDownTop As Integer, __UI_MouseDownLeft As Integer
    Static __UI_JustOpenedMenu As _Byte
    Static OriginalDragX As Integer, OriginalDragY As Integer
    Dim i As Long, j As Long, ThisItem%, TempParent As Long
    Dim ContainerOffsetLeft As Integer, ContainerOffsetTop As Integer
    If __UI_HoveringID = 0 And __UI_Focus = 0 Then Exit Sub
    If Control(__UI_HoveringID).ParentID > 0 And Control(__UI_HoveringID).Type <> __UI_Type_MenuItem Then
        ContainerOffsetLeft = Control(Control(__UI_HoveringID).ParentID).Left
        ContainerOffsetTop = Control(Control(__UI_HoveringID).ParentID).Top
    End If
    If __UI_ExitTriggered Then
        __UI_UnloadSignal = True
        __UI_BeforeUnload
        If __UI_UnloadSignal Then System
    End If
    If __UI_HasResized Then __UI_FormResized: __UI_HasResized = False
    If __UI_LastHoveringID <> __UI_HoveringID Or __UI_HoveringID = __UI_ActiveDropdownList Then
        If __UI_LastHoveringID Then __UI_MouseLeave __UI_LastHoveringID
        __UI_MouseEnter __UI_HoveringID
        Static LastMouseLeft As Integer, LastMouseTop As Integer
        If Not __UI_DraggingThumb And __UI_HoveringID = __UI_ActiveDropdownList And Control(__UI_HoveringID).HoveringVScrollbarButton = 0 And LastMouseTop <> __UI_MouseTop Then
            LastMouseTop = __UI_MouseTop
            If Control(__UI_HoveringID).Font > 0 Then _Font Control(__UI_HoveringID).Font
            ThisItem% = ((__UI_MouseTop - (ContainerOffsetTop + Control(__UI_HoveringID).Top) - (Abs(Control(__UI_HoveringID).HasBorder) * __UI_DefaultCaptionIndent)) \ Control(__UI_HoveringID).ItemHeight) + Control(__UI_HoveringID).InputViewStart
            If ThisItem% >= Control(__UI_HoveringID).Min And ThisItem% <= Control(__UI_HoveringID).Max Then
                Control(__UI_HoveringID).Value = ThisItem%
                If Control(__UI_HoveringID).PreviousValue <> Control(__UI_HoveringID).Value Then
                    __UI_ValueChanged __UI_HoveringID
                    Control(__UI_HoveringID).PreviousValue = Control(__UI_HoveringID).Value
                    Control(__UI_HoveringID).Redraw = True
                End If
            End If
        ElseIf Control(__UI_HoveringID).Type = __UI_Type_MenuBar And LastMouseLeft <> __UI_MouseLeft Then
            LastMouseLeft = __UI_MouseLeft
            If __UI_TotalActiveMenus > 0 And __UI_ParentMenu(__UI_TotalActiveMenus) <> __UI_HoveringID Then
                If __UI_ActiveMenuIsContextMenu = False And __UI_DesignMode = False Then
                    __UI_ActivateMenu Control(__UI_HoveringID), False
                    __UI_ForceRedraw = True
                End If
            End If
        End If
        If Control(__UI_Focus).Type = __UI_Type_MenuItem And Control(__UI_HoveringID).Type <> __UI_Type_MenuItem Then
            __UI_Focus = __UI_ActiveMenu(__UI_TotalActiveMenus)
        End If
    End If
    $If WIN OR MAC Then
        If __UI_ResizeHandleHover = 1 Or __UI_ResizeHandleHover = 3 Then
            If __UI_LastMouseIconSet <> 3 Then
                __UI_LastMouseIconSet = 3
                _MouseShow "horizontal"
            End If
        ElseIf __UI_ResizeHandleHover = 2 Or __UI_ResizeHandleHover = 4 Then
            If __UI_LastMouseIconSet <> 4 Then
                __UI_LastMouseIconSet = 4
                _MouseShow "vertical"
            End If
        ElseIf __UI_ResizeHandleHover = 5 Or __UI_ResizeHandleHover = 8 Then
            If __UI_LastMouseIconSet <> 5 Then
                __UI_LastMouseIconSet = 5
                _MouseShow "topright_bottomleft"
            End If
        ElseIf __UI_ResizeHandleHover = 6 Or __UI_ResizeHandleHover = 7 Then
            If __UI_LastMouseIconSet <> 6 Then
                __UI_LastMouseIconSet = 6
                _MouseShow "topleft_bottomright"
            End If
        ElseIf Control(__UI_HoveringID).Type = __UI_Type_TextBox And Not __UI_DesignMode Then
            If Control(__UI_HoveringID).HasVScrollbar And __UI_MouseLeft >= Control(__UI_HoveringID).Left + Control(Control(__UI_HoveringID).ParentID).Left + Control(__UI_HoveringID).Width - __UI_ScrollbarWidth - 1 Then
                If __UI_LastMouseIconSet <> 0 Then
                    __UI_LastMouseIconSet = 0
                    _MouseShow "default"
                End If
            Else
                If __UI_LastMouseIconSet <> 2 Then
                    __UI_LastMouseIconSet = 2
                    _MouseShow "text"
                End If
            End If
        Else
            If __UI_LastMouseIconSet <> 0 Then
                __UI_LastMouseIconSet = 0
                _MouseShow "default"
            End If
        End If
    $End If
    Dim __UI_FocusSearch As Long
    If __UI_KeyHit = 9 And __UI_IsDragging = False Then 'TAB
        If __UI_DesignMode Then
            __UI_FocusSearch = __UI_FirstSelectedID
            For i = 1 To UBound(Control)
                Control(i).ControlIsSelected = False
            Next
            Do
                If _KeyDown(100304) Or _KeyDown(100303) Then
                    __UI_FocusSearch = __UI_FocusSearch - 1
                    If __UI_FocusSearch < 1 Then __UI_FocusSearch = UBound(Control)
                Else
                    __UI_FocusSearch = __UI_FocusSearch + 1
                    If __UI_FocusSearch > UBound(Control) Then __UI_FocusSearch = 0
                End If
                If __UI_FocusSearch = __UI_FirstSelectedID Then
                    Control(__UI_FocusSearch).ControlIsSelected = True
                    Exit Do
                End If
                If Control(__UI_FocusSearch).ID > 0 And Control(__UI_FocusSearch).Type <> __UI_Type_Form And Control(__UI_FocusSearch).Type <> __UI_Type_MenuPanel And Control(__UI_FocusSearch).Type <> __UI_Type_Font And UCase$(Left$(Control(__UI_FocusSearch).Name, 5)) <> "__UI_" Then
                    If Control(__UI_FocusSearch).Type <> __UI_Type_MenuItem Then
                        __UI_CloseAllMenus
                        __UI_TotalSelectedControls = 1
                        __UI_FirstSelectedID = __UI_FocusSearch
                        Control(__UI_FocusSearch).ControlIsSelected = True
                        If Control(__UI_FocusSearch).Type = __UI_Type_MenuBar Or Control(__UI_FocusSearch).Type = __UI_Type_ContextMenu Then
                            __UI_ActivateMenu Control(__UI_FocusSearch), False
                        End If
                        Exit Do
                    Else
                        If __UI_ParentMenu(__UI_TotalActiveMenus) = Control(__UI_FocusSearch).ParentID Then
                            __UI_TotalSelectedControls = 1
                            __UI_FirstSelectedID = __UI_FocusSearch
                            Control(__UI_FocusSearch).ControlIsSelected = True
                            Exit Do
                        End If
                    End If
                End If
            Loop
        Else
            __UI_KeyboardFocus = True
            __UI_FocusSearch = __UI_Focus
            Do
                If _KeyDown(100304) Or _KeyDown(100303) Then
                    __UI_FocusSearch = __UI_FocusSearch - 1
                    If __UI_FocusSearch < 1 Then __UI_FocusSearch = UBound(Control)
                Else
                    __UI_FocusSearch = __UI_FocusSearch + 1
                    If __UI_FocusSearch > UBound(Control) Then __UI_FocusSearch = 0
                End If
                If __UI_FocusSearch = __UI_Focus Then
                    Exit Do
                End If
                If Control(__UI_FocusSearch).CanHaveFocus And Control(__UI_FocusSearch).Disabled = False And Control(__UI_FocusSearch).Hidden = False And Control(Control(__UI_FocusSearch).ParentID).Disabled = False And Control(Control(__UI_FocusSearch).ParentID).Hidden = False Then
                    If __UI_Focus <> __UI_FocusSearch Then __UI_KeepFocus = False: __UI_FocusOut __UI_Focus
                    If __UI_KeepFocus = False Then
                        __UI_Focus = __UI_FocusSearch
                        If Control(__UI_Focus).Type = __UI_Type_TextBox And Control(__UI_Focus).Multiline = False Then
                            If Control(__UI_Focus).BypassSelectOnFocus = False Then
                                Control(__UI_Focus).Cursor = Len(Text(__UI_Focus))
                                Control(__UI_Focus).SelectionStart = 0
                                Control(__UI_Focus).TextIsSelected = True
                            End If
                        End If
                        __UI_FocusIn __UI_Focus
                    End If
                    Exit Do
                End If
            Loop
        End If
    End If
    If __UI_DesignMode = False Then
        If __UI_ActiveDropdownList > 0 And ((__UI_Focus <> __UI_ActiveDropdownList And __UI_Focus <> __UI_ParentDropdownList) Or __UI_KeyHit = 27) Then
            __UI_Focus = __UI_ParentDropdownList
            __UI_DestroyControl Control(__UI_ActiveDropdownList)
            __UI_KeyHit = 0
        ElseIf __UI_TotalActiveMenus > 0 And (__UI_Focus <> __UI_ActiveMenu(__UI_TotalActiveMenus) And __UI_Focus <> __UI_ParentMenu(__UI_TotalActiveMenus)) Then
            If Control(__UI_Focus).Type <> __UI_Type_MenuItem Then
                __UI_CloseAllMenus
                __UI_ForceRedraw = True
            End If
        End If
    End If
    If __UI_MouseWheel And Not __UI_DesignMode Then
        If (Control(__UI_HoveringID).Type = __UI_Type_ListBox And Not Control(__UI_HoveringID).Disabled) Then
            Control(__UI_HoveringID).InputViewStart = Control(__UI_HoveringID).InputViewStart + __UI_MouseWheel
            If Control(__UI_HoveringID).InputViewStart + Control(__UI_HoveringID).LastVisibleItem > Control(__UI_HoveringID).Max Then
                Control(__UI_HoveringID).InputViewStart = Control(__UI_HoveringID).Max - Control(__UI_HoveringID).LastVisibleItem + 1
            End If
        ElseIf (__UI_ActiveDropdownList > 0 And __UI_Focus = __UI_ActiveDropdownList And __UI_ParentDropdownList = __UI_HoveringID) Then
            Control(__UI_ActiveDropdownList).InputViewStart = Control(__UI_ActiveDropdownList).InputViewStart + __UI_MouseWheel
            If Control(__UI_ActiveDropdownList).InputViewStart + Control(__UI_ActiveDropdownList).LastVisibleItem > Control(__UI_ActiveDropdownList).Max Then
                Control(__UI_ActiveDropdownList).InputViewStart = Control(__UI_ActiveDropdownList).Max - Control(__UI_ActiveDropdownList).LastVisibleItem + 1
            End If
        ElseIf (Control(__UI_Focus).Type = __UI_Type_DropdownList And Not Control(__UI_Focus).Disabled) Then
            Control(__UI_Focus).Value = Control(__UI_Focus).Value + __UI_MouseWheel
            If Control(__UI_Focus).Value < 1 Then Control(__UI_Focus).Value = 1
            If Control(__UI_Focus).Value > Control(__UI_Focus).Max Then Control(__UI_Focus).Value = Control(__UI_Focus).Max
            If Control(__UI_Focus).PreviousValue <> Control(__UI_Focus).Value Then
                __UI_ValueChanged __UI_Focus
                Control(__UI_Focus).PreviousValue = Control(__UI_Focus).Value
                Control(__UI_Focus).Redraw = True
            End If
        ElseIf Control(__UI_Focus).Type = __UI_Type_TextBox And Control(__UI_Focus).Multiline Then
            Dim TotalLines As Long
            TotalLines = __UI_CountLines(__UI_Focus)
            _Font Control(__UI_Focus).Font
            If TotalLines > Control(__UI_Focus).Height \ uspacing& Then
                Control(__UI_Focus).FirstVisibleLine = Control(__UI_Focus).FirstVisibleLine + __UI_MouseWheel
                If Control(__UI_Focus).FirstVisibleLine < 1 Then Control(__UI_Focus).FirstVisibleLine = 1
                If Control(__UI_Focus).FirstVisibleLine > TotalLines - Control(__UI_Focus).Height \ uspacing& + 1 Then
                    Control(__UI_Focus).FirstVisibleLine = TotalLines - Control(__UI_Focus).Height \ uspacing& + 1
                End If
            End If
        End If
    End If
    If __UI_MouseButton2 Then
        If __UI_Mouse2IsDown = False Then
            __UI_Mouse2IsDown = True
            __UI_DidClick = True
            __UI_Mouse2DownOnID = __UI_HoveringID
        Else
        End If
    Else
        If __UI_Mouse2IsDown Then
            __UI_Mouse2IsDown = False
            __UI_Mouse2DownOnID = 0
            If __UI_DesignMode Then
                Dim RightClickSelect As _Byte
                RightClickSelect = True
                GoSub DesignModeClickToSelect
                RightClickSelect = False
                Control(__UI_GetID("__UI_PreviewMenuShowInvisibleControls")).Value = __UI_ShowInvisibleControls
                If __UI_TotalSelectedControls = 0 Then
                    Control(__UI_GetID("__UI_PreviewMenuAlignLeft")).Hidden = True
                    Control(__UI_GetID("__UI_PreviewMenuAlignRight")).Hidden = True
                    Control(__UI_GetID("__UI_PreviewMenuAlignTops")).Hidden = True
                    Control(__UI_GetID("__UI_PreviewMenuAlignBottoms")).Hidden = True
                    Control(__UI_GetID("__UI_PreviewMenuAlignCenterV")).Hidden = True
                    Control(__UI_GetID("__UI_PreviewMenuAlignCenterH")).Hidden = True
                    Control(__UI_GetID("__UI_PreviewMenuAlignCentersV")).Hidden = True
                    Control(__UI_GetID("__UI_PreviewMenuAlignCentersH")).Hidden = True
                    Control(__UI_GetID("__UI_PreviewMenuDistributeV")).Hidden = True
                    Control(__UI_GetID("__UI_PreviewMenuDistributeH")).Hidden = True
                    Control(__UI_GetID("__UI_PreviewMenuCut")).Disabled = True
                    Control(__UI_GetID("__UI_PreviewMenuCopy")).Disabled = True
                    Control(__UI_GetID("__UI_PreviewMenuDelete")).Disabled = True
                    Control(__UI_GetID("__UI_PreviewMenuImageOriginalSize")).Hidden = True
                    Control(__UI_GetID("__UI_PreviewMenuNumericOnly")).Hidden = True
                    Control(__UI_GetID("__UI_PreviewMenuSetDefaultButton")).Hidden = True
                    Control(__UI_GetID("__UI_PreviewMenuShowInvisibleControls")).Hidden = False
                    Control(__UI_GetID("__UI_PreviewMenuConvertType")).Hidden = True
                    Control(__UI_GetID("__UI_PreviewMenuNewMenuBar")).Hidden = False
                    Control(__UI_GetID("__UI_PreviewMenuNewContextMenu")).Hidden = False
                ElseIf __UI_TotalSelectedControls = 1 Then
                    Control(__UI_GetID("__UI_PreviewMenuAlignLeft")).Hidden = True
                    Control(__UI_GetID("__UI_PreviewMenuAlignRight")).Hidden = True
                    Control(__UI_GetID("__UI_PreviewMenuAlignTops")).Hidden = True
                    Control(__UI_GetID("__UI_PreviewMenuAlignBottoms")).Hidden = True
                    If Control(__UI_FirstSelectedID).Type <> __UI_Type_ContextMenu And Control(__UI_FirstSelectedID).Type <> __UI_Type_MenuBar And Control(__UI_FirstSelectedID).Type <> __UI_Type_MenuItem Then
                        Control(__UI_GetID("__UI_PreviewMenuAlignCenterV")).Hidden = False
                        Control(__UI_GetID("__UI_PreviewMenuAlignCenterH")).Hidden = False
                        SetCaption __UI_GetID("__UI_PreviewMenuAlignCenterV"), "Center &Vertically"
                        SetCaption __UI_GetID("__UI_PreviewMenuAlignCenterH"), "Center &Horizontally-"
                        Control(__UI_GetID("__UI_PreviewMenuNewMenuBar")).Hidden = True
                        Control(__UI_GetID("__UI_PreviewMenuNewContextMenu")).Hidden = True
                        Control(__UI_GetID("__UI_PreviewMenuShowInvisibleControls")).Hidden = True
                    Else
                        Control(__UI_GetID("__UI_PreviewMenuNewMenuBar")).Hidden = False
                        Control(__UI_GetID("__UI_PreviewMenuNewContextMenu")).Hidden = False
                        Control(__UI_GetID("__UI_PreviewMenuShowInvisibleControls")).Hidden = False
                        Control(__UI_GetID("__UI_PreviewMenuAlignCenterV")).Hidden = True
                        Control(__UI_GetID("__UI_PreviewMenuAlignCenterH")).Hidden = True
                    End If
                    If Control(__UI_FirstSelectedID).Type = __UI_Type_PictureBox And Len(Text(__UI_FirstSelectedID)) > 0 Then
                        IF Control(__UI_FirstSelectedID).Height - (Control(__UI_FirstSelectedID).BorderSize * ABS(Control(__UI_FirstSelectedID).HasBorder)) <> _HEIGHT(Control(__UI_FirstSelectedID).HelperCanvas) OR _
                           Control(__UI_FirstSelectedID).Width - (Control(__UI_FirstSelectedID).BorderSize * ABS(Control(__UI_FirstSelectedID).HasBorder)) <> _WIDTH(Control(__UI_FirstSelectedID).HelperCanvas) THEN
                            Control(__UI_GetID("__UI_PreviewMenuImageOriginalSize")).Hidden = False
                            SetCaption __UI_GetID("__UI_PreviewMenuImageOriginalSize"), "Restore &image dimensions (" + LTrim$(Str$(_Width(Control(__UI_FirstSelectedID).HelperCanvas))) + "x" + LTrim$(Str$(_Height(Control(__UI_FirstSelectedID).HelperCanvas))) + ")-"
                        Else
                            Control(__UI_GetID("__UI_PreviewMenuImageOriginalSize")).Hidden = True
                        End If
                    Else
                        Control(__UI_GetID("__UI_PreviewMenuImageOriginalSize")).Hidden = True
                    End If
                    If Control(__UI_FirstSelectedID).Type = __UI_Type_TextBox Then
                        If Control(__UI_FirstSelectedID).NumericOnly = True Then
                            Control(__UI_GetID("__UI_PreviewMenuNumericOnly")).Hidden = False
                            Control(__UI_GetID("__UI_PreviewMenuNumericOnly")).Value = False
                        ElseIf Control(__UI_FirstSelectedID).NumericOnly = __UI_NumericWithBounds Then
                            Control(__UI_GetID("__UI_PreviewMenuNumericOnly")).Hidden = False
                            Control(__UI_GetID("__UI_PreviewMenuNumericOnly")).Value = True
                        Else
                            Control(__UI_GetID("__UI_PreviewMenuNumericOnly")).Hidden = True
                        End If
                    Else
                        Control(__UI_GetID("__UI_PreviewMenuNumericOnly")).Hidden = True
                        Control(__UI_GetID("__UI_PreviewMenuNumericOnly")).Value = False
                    End If
                    If Control(__UI_FirstSelectedID).Type = __UI_Type_Button Then
                        If __UI_FirstSelectedID <> __UI_DefaultButtonID Then
                            Control(__UI_GetID("__UI_PreviewMenuSetDefaultButton")).Hidden = False
                            Control(__UI_GetID("__UI_PreviewMenuSetDefaultButton")).Value = False
                        Else
                            Control(__UI_GetID("__UI_PreviewMenuSetDefaultButton")).Hidden = False
                            Control(__UI_GetID("__UI_PreviewMenuSetDefaultButton")).Value = True
                        End If
                    Else
                        Control(__UI_GetID("__UI_PreviewMenuSetDefaultButton")).Hidden = True
                    End If
                    Control(__UI_GetID("__UI_PreviewMenuAlignCentersV")).Hidden = True
                    Control(__UI_GetID("__UI_PreviewMenuAlignCentersH")).Hidden = True
                    Control(__UI_GetID("__UI_PreviewMenuDistributeV")).Hidden = True
                    Control(__UI_GetID("__UI_PreviewMenuDistributeH")).Hidden = True
                    Control(__UI_GetID("__UI_PreviewMenuCut")).Disabled = False
                    Control(__UI_GetID("__UI_PreviewMenuCopy")).Disabled = False
                    Control(__UI_GetID("__UI_PreviewMenuDelete")).Disabled = False
                    If __UI_Type(Control(__UI_FirstSelectedID).Type).TurnsInto Then
                        Control(__UI_GetID("__UI_PreviewMenuConvertType")).Hidden = False
                        SetCaption __UI_GetID("__UI_PreviewMenuConvertType"), "Co&nvert to " + RTrim$(__UI_Type(__UI_Type(Control(__UI_FirstSelectedID).Type).TurnsInto).Name) + "-"
                    ElseIf Control(__UI_FirstSelectedID).Type = __UI_Type_TextBox Then
                        Control(__UI_GetID("__UI_PreviewMenuConvertType")).Hidden = False
                        If Control(__UI_FirstSelectedID).NumericOnly = False Then
                            SetCaption __UI_GetID("__UI_PreviewMenuConvertType"), "Co&nvert to NumericTextBox-"
                        Else
                            SetCaption __UI_GetID("__UI_PreviewMenuConvertType"), "Co&nvert to TextBox-"
                        End If
                    Else
                        Control(__UI_GetID("__UI_PreviewMenuConvertType")).Hidden = True
                    End If
                ElseIf __UI_TotalSelectedControls = 2 Then
                    Control(__UI_GetID("__UI_PreviewMenuNewMenuBar")).Hidden = True
                    Control(__UI_GetID("__UI_PreviewMenuNewContextMenu")).Hidden = True
                    Control(__UI_GetID("__UI_PreviewMenuShowInvisibleControls")).Hidden = True
                    Control(__UI_GetID("__UI_PreviewMenuAlignLeft")).Hidden = False
                    Control(__UI_GetID("__UI_PreviewMenuAlignRight")).Hidden = False
                    Control(__UI_GetID("__UI_PreviewMenuAlignTops")).Hidden = False
                    Control(__UI_GetID("__UI_PreviewMenuAlignBottoms")).Hidden = False
                    Control(__UI_GetID("__UI_PreviewMenuAlignCenterV")).Hidden = False
                    Control(__UI_GetID("__UI_PreviewMenuAlignCenterH")).Hidden = False
                    SetCaption __UI_GetID("__UI_PreviewMenuAlignCenterV"), "Center &Vertically (group)"
                    SetCaption __UI_GetID("__UI_PreviewMenuAlignCenterH"), "Center &Horizontally (group)-"
                    Control(__UI_GetID("__UI_PreviewMenuAlignCentersV")).Hidden = False
                    Control(__UI_GetID("__UI_PreviewMenuAlignCentersH")).Hidden = False
                    Control(__UI_GetID("__UI_PreviewMenuDistributeV")).Hidden = True
                    Control(__UI_GetID("__UI_PreviewMenuDistributeH")).Hidden = True
                    Control(__UI_GetID("__UI_PreviewMenuCut")).Disabled = False
                    Control(__UI_GetID("__UI_PreviewMenuCopy")).Disabled = False
                    Control(__UI_GetID("__UI_PreviewMenuDelete")).Disabled = False
                    Control(__UI_GetID("__UI_PreviewMenuImageOriginalSize")).Hidden = True
                    Control(__UI_GetID("__UI_PreviewMenuSetDefaultButton")).Hidden = True
                    Control(__UI_GetID("__UI_PreviewMenuNumericOnly")).Hidden = True
                    GoTo AddConvertMenu
                Else
                    Control(__UI_GetID("__UI_PreviewMenuNewMenuBar")).Hidden = True
                    Control(__UI_GetID("__UI_PreviewMenuNewContextMenu")).Hidden = True
                    Control(__UI_GetID("__UI_PreviewMenuShowInvisibleControls")).Hidden = True
                    Control(__UI_GetID("__UI_PreviewMenuAlignLeft")).Hidden = False
                    Control(__UI_GetID("__UI_PreviewMenuAlignRight")).Hidden = False
                    Control(__UI_GetID("__UI_PreviewMenuAlignTops")).Hidden = False
                    Control(__UI_GetID("__UI_PreviewMenuAlignBottoms")).Hidden = False
                    Control(__UI_GetID("__UI_PreviewMenuAlignCenterV")).Hidden = False
                    Control(__UI_GetID("__UI_PreviewMenuAlignCenterH")).Hidden = False
                    SetCaption __UI_GetID("__UI_PreviewMenuAlignCenterV"), "Center &Vertically (group)"
                    SetCaption __UI_GetID("__UI_PreviewMenuAlignCenterH"), "Center &Horizontally (group)-"
                    Control(__UI_GetID("__UI_PreviewMenuAlignCentersV")).Hidden = False
                    Control(__UI_GetID("__UI_PreviewMenuAlignCentersH")).Hidden = False
                    Control(__UI_GetID("__UI_PreviewMenuDistributeV")).Hidden = False
                    Control(__UI_GetID("__UI_PreviewMenuDistributeH")).Hidden = False
                    Control(__UI_GetID("__UI_PreviewMenuCut")).Disabled = False
                    Control(__UI_GetID("__UI_PreviewMenuCopy")).Disabled = False
                    Control(__UI_GetID("__UI_PreviewMenuDelete")).Disabled = False
                    Control(__UI_GetID("__UI_PreviewMenuImageOriginalSize")).Hidden = True
                    Control(__UI_GetID("__UI_PreviewMenuSetDefaultButton")).Hidden = True
                    Control(__UI_GetID("__UI_PreviewMenuNumericOnly")).Hidden = True
                    AddConvertMenu:
                    If __UI_Type(Control(__UI_FirstSelectedID).Type).TurnsInto Or Control(__UI_FirstSelectedID).Type = __UI_Type_TextBox Then
                        Dim SearchType As Integer, AddConvertMenuCheck As _Byte
                        SearchType = Control(__UI_FirstSelectedID).Type
                        AddConvertMenuCheck = True
                        For i = 1 To UBound(Control)
                            If Control(i).ControlIsSelected Then
                                If Control(i).Type <> SearchType Then
                                    AddConvertMenuCheck = False
                                    Exit For
                                End If
                            End If
                        Next
                        If AddConvertMenuCheck Then
                            Control(__UI_GetID("__UI_PreviewMenuConvertType")).Hidden = False
                            If SearchType = __UI_Type_TextBox Then
                                If Control(__UI_FirstSelectedID).NumericOnly = False Then
                                    SetCaption __UI_GetID("__UI_PreviewMenuConvertType"), "Co&nvert to NumericTextBox-"
                                Else
                                    SetCaption __UI_GetID("__UI_PreviewMenuConvertType"), "Co&nvert to TextBox-"
                                End If
                            Else
                                SetCaption __UI_GetID("__UI_PreviewMenuConvertType"), "Co&nvert to " + RTrim$(__UI_Type(__UI_Type(Control(__UI_FirstSelectedID).Type).TurnsInto).Name) + "-"
                            End If
                        Else
                            Control(__UI_GetID("__UI_PreviewMenuConvertType")).Hidden = True
                        End If
                    Else
                        Control(__UI_GetID("__UI_PreviewMenuConvertType")).Hidden = True
                    End If
                End If
                If Left$(_Clipboard$, Len(__UI_ClipboardCheck$)) = __UI_ClipboardCheck$ Then
                    Control(__UI_GetID("__UI_PreviewMenuPaste")).Disabled = False
                Else
                    Control(__UI_GetID("__UI_PreviewMenuPaste")).Disabled = True
                End If
                If Control(__UI_HoveringID).Type = __UI_Type_MenuBar Then
                    Control(__UI_GetID("__UI_PreviewMenuCut")).Disabled = True
                    Control(__UI_GetID("__UI_PreviewMenuCopy")).Disabled = True
                End If
                If __UI_HoveringID > 0 And Control(__UI_HoveringID).Type <> __UI_Type_MenuItem And Control(__UI_HoveringID).Type <> __UI_Type_MenuPanel Then __UI_ActivateMenu Control(__UI_GetID("__UI_PreviewMenu")), False
                __UI_CantShowContextMenu = False
                If Control(__UI_ActiveMenu(__UI_TotalActiveMenus)).Height > Control(__UI_FormID).Height Or Control(__UI_ActiveMenu(__UI_TotalActiveMenus)).Width > Control(__UI_FormID).Width Then
                    __UI_CantShowContextMenu = True
                End If
            ElseIf Control(__UI_HoveringID).ContextMenuID > 0 And Control(__UI_HoveringID).Disabled = False Then
                __UI_Focus = __UI_HoveringID
                __UI_PreviousFocus = __UI_Focus
                If Control(__UI_HoveringID).ContextMenuID = __UI_GetID("__UI_TextFieldMenu") Then
                    If Control(__UI_HoveringID).TextIsSelected Then
                        Control(__UI_GetID("__UI_TextMenuCut")).Disabled = False
                        Control(__UI_GetID("__UI_TextMenuCopy")).Disabled = False
                        Control(__UI_GetID("__UI_TextMenuDelete")).Disabled = False
                    Else
                        Control(__UI_GetID("__UI_TextMenuCut")).Disabled = True
                        Control(__UI_GetID("__UI_TextMenuCopy")).Disabled = True
                        Control(__UI_GetID("__UI_TextMenuDelete")).Disabled = True
                    End If
                    If Len(_Clipboard$) > 0 Then
                        Control(__UI_GetID("__UI_TextMenuPaste")).Disabled = False
                    Else
                        Control(__UI_GetID("__UI_TextMenuPaste")).Disabled = True
                    End If
                End If
                __UI_ContextMenuSourceID = __UI_HoveringID
                __UI_ActivateMenu Control(Control(__UI_HoveringID).ContextMenuID), False
            End If
        End If
    End If
    If __UI_MouseButton1 Then
        If __UI_MouseIsDown = False Then
            __UI_DidClick = True
            __UI_MouseDownTop = __UI_MouseTop
            __UI_MouseDownLeft = __UI_MouseLeft
            If __UI_DesignMode Then
                If Left$(Control(__UI_HoveringID).Name, 5) = "__UI_" Then GoTo ProcessClick
                DesignModeClickToSelect:
                If RightClickSelect And (Control(__UI_HoveringID).Type = __UI_Type_MenuPanel Or Left$(Control(__UI_HoveringID).Name, 5) = "__UI_") Then Return
                If __UI_TotalActiveMenus > 0 And Control(__UI_HoveringID).Type <> __UI_Type_MenuPanel Then
                    If Control(__UI_Focus).Type <> __UI_Type_MenuItem Then
                        __UI_CloseAllMenus
                        __UI_ForceRedraw = True
                    End If
                End If
                If _KeyDown(100305) Or _KeyDown(100306) Then
                    If Control(__UI_HoveringID).Type <> __UI_Type_Frame And Control(__UI_HoveringID).Type <> __UI_Type_Form And Control(__UI_HoveringID).Type <> __UI_Type_Font And Control(__UI_HoveringID).Type <> __UI_Type_MenuItem And Control(__UI_HoveringID).Type <> __UI_Type_MenuPanel And Control(__UI_HoveringID).Type <> __UI_Type_ContextMenu And Control(__UI_HoveringID).Type <> __UI_Type_MenuBar Then
                        If Control(__UI_HoveringID).ControlIsSelected = False And Control(__UI_HoveringID).ParentID = Control(__UI_FirstSelectedID).ParentID And Control(__UI_FirstSelectedID).Type <> __UI_Type_Frame Then
                            Control(__UI_HoveringID).ControlIsSelected = True
                            __UI_TotalSelectedControls = __UI_TotalSelectedControls + 1
                        ElseIf Control(__UI_HoveringID).ControlIsSelected = True Then
                            Control(__UI_HoveringID).ControlIsSelected = False
                            __UI_TotalSelectedControls = __UI_TotalSelectedControls - 1
                            If __UI_TotalSelectedControls = 1 Then
                                For i = 1 To UBound(Control)
                                    If Control(i).ControlIsSelected Then __UI_FirstSelectedID = i: Exit For
                                Next
                            ElseIf __UI_TotalSelectedControls > 0 And __UI_FirstSelectedID = __UI_HoveringID Then
                                For i = 1 To UBound(Control)
                                    If Control(i).ControlIsSelected Then __UI_FirstSelectedID = i: Exit For
                                Next
                            End If
                        End If
                    End If
                ElseIf _KeyDown(100303) Or _KeyDown(100304) Then
                    If __UI_FirstSelectedID <> __UI_HoveringID And Control(__UI_HoveringID).Type <> __UI_Type_Frame And Control(__UI_HoveringID).Type <> __UI_Type_Form And Control(__UI_HoveringID).Type <> __UI_Type_Font And Control(__UI_HoveringID).Type <> __UI_Type_MenuItem And Control(__UI_HoveringID).Type <> __UI_Type_MenuPanel And Control(__UI_HoveringID).Type <> __UI_Type_ContextMenu And Control(__UI_HoveringID).Type <> __UI_Type_MenuBar Then
                        If Control(__UI_FirstSelectedID).ParentID = Control(__UI_HoveringID).ParentID Then
                            __UI_SelectionRectangleLeft = Control(__UI_FirstSelectedID).Left + Control(__UI_FirstSelectedID).Width / 2
                            __UI_SelectionRectangleTop = Control(__UI_FirstSelectedID).Top + Control(__UI_FirstSelectedID).Height / 2
                            GoTo DoSelectionRectangle
                        End If
                    End If
                Else
                    If Control(__UI_HoveringID).Type = __UI_Type_MenuPanel And Left$(Control(__UI_GetParentMenu(__UI_HoveringID)).Name, 5) <> "__UI_" Then
                        Dim TempValue As Long
                        TempParent = __UI_GetParentMenu(__UI_HoveringID)
                        TempValue = __UI_NewControl(__UI_Type_MenuItem, "", 0, 0, 0, 0, TempParent)
                        SetCaption TempValue, RTrim$(Control(TempValue).Name)
                        For i = __UI_TotalActiveMenus To __UI_GetActiveMenuIndex(__UI_HoveringID) Step -1
                            __UI_DestroyControl Control(__UI_ActiveMenu(i))
                        Next
                        __UI_ActivateMenu Control(TempParent), False
                        For i = 1 To UBound(Control)
                            Control(i).ControlIsSelected = False
                        Next
                        Control(TempValue).ControlIsSelected = True
                        __UI_ActivateMenu Control(TempValue), False
                        __UI_ForceRedraw = True
                        __UI_TotalSelectedControls = 1
                        __UI_FirstSelectedID = TempValue
                    ElseIf Control(__UI_HoveringID).Type = __UI_Type_Form And __UI_MouseTop <= (uspacing& + 5) Then
                        If __UI_HasMenuBar Then
                            __UI_KeyPress 224
                        End If
                    Else
                        If Control(__UI_HoveringID).ControlIsSelected = False Then
                            For i = 1 To UBound(Control)
                                Control(i).ControlIsSelected = False
                            Next
                            __UI_TotalSelectedControls = 0
                            __UI_FirstSelectedID = 0
                            If Control(__UI_HoveringID).Type <> __UI_Type_Form And Control(__UI_HoveringID).Type <> __UI_Type_Font And Control(__UI_HoveringID).Type <> __UI_Type_MenuPanel Then
                                If Control(__UI_HoveringID).Type = __UI_Type_ContextMenu And __UI_ShowInvisibleControls = False Then GoTo SkipInvisibleControl
                                Control(__UI_HoveringID).ControlIsSelected = True
                                __UI_TotalSelectedControls = 1
                                __UI_FirstSelectedID = __UI_HoveringID
                                If Control(__UI_HoveringID).Type = __UI_Type_MenuItem Or Control(__UI_HoveringID).Type = __UI_Type_MenuBar Or (Control(__UI_HoveringID).Type = __UI_Type_ContextMenu And __UI_ShowInvisibleControls) Then
                                    __UI_ActivateMenu Control(__UI_HoveringID), False
                                    __UI_JustOpenedMenu = True
                                End If
                                SkipInvisibleControl:
                            End If
                        Else
                            If Control(__UI_FirstSelectedID).Type = __UI_Type_Frame And (Timer - __UI_LastMouseDownEvent < .5 And (__UI_MouseTop = __UI_MouseDownTop And __UI_MouseLeft = __UI_MouseDownLeft)) Then
                                __UI_KeyPress 221
                            End If
                        End If
                    End If
                End If
                If RightClickSelect Then Return
            ElseIf Control(__UI_HoveringID).CanHaveFocus And Not Control(__UI_HoveringID).Disabled Then
                Static JustEnteredTextBox As Single
                If __UI_Focus <> __UI_HoveringID Then
                    __UI_KeepFocus = False: __UI_FocusOut __UI_Focus
                    If __UI_KeepFocus = False Then
                        __UI_Focus = __UI_HoveringID
                        If Control(__UI_Focus).Type = __UI_Type_TextBox Then JustEnteredTextBox = Timer
                        __UI_FocusIn __UI_Focus
                    End If
                End If
            Else
                If Control(__UI_HoveringID).Type = __UI_Type_MenuBar And __UI_TotalActiveMenus > 0 And __UI_HoveringID = __UI_ParentMenu(__UI_TotalActiveMenus) Then
                    __UI_Focus = __UI_PreviousFocus
                ElseIf Control(__UI_HoveringID).Type = __UI_Type_MenuBar And (__UI_TotalActiveMenus = 0 Or __UI_ActiveMenuIsContextMenu) Then
                    __UI_CloseAllMenus
                    __UI_ActivateMenu Control(__UI_HoveringID), False
                    __UI_JustOpenedMenu = True
                ElseIf Control(__UI_HoveringID).Type = __UI_Type_MenuItem Then
                Else
                    If __UI_Focus > 0 Then __UI_KeepFocus = False: __UI_FocusOut __UI_Focus
                    If __UI_KeepFocus = False Then __UI_Focus = 0
                End If
            End If
            __UI_MouseIsDown = True
            __UI_MouseDownOnID = __UI_HoveringID
            If __UI_DesignMode And __UI_MouseDownOnID = __UI_FormID Then
                __UI_SelectionRectangle = True
                __UI_SelectionRectangleTop = __UI_MouseTop
                __UI_SelectionRectangleLeft = __UI_MouseLeft
            Else
                __UI_SelectionRectangle = False
            End If
            If Not __UI_DesignMode Then
                If Control(__UI_Focus).Type = __UI_Type_TextBox And Not Control(__UI_Focus).Disabled Then
                    _Font Control(__UI_Focus).Font
                    If Control(__UI_HoveringID).HoveringVScrollbarButton = 1 Or Control(__UI_HoveringID).HoveringVScrollbarButton = 2 Or Control(__UI_HoveringID).HoveringVScrollbarButton = 4 Or Control(__UI_HoveringID).HoveringVScrollbarButton = 5 Then
                        __UI_MouseDownOnScrollbar = Timer
                    ElseIf Control(__UI_HoveringID).HoveringVScrollbarButton = 3 Then
                        If Not __UI_DraggingThumb Then
                            __UI_DraggingThumb = True
                            __UI_ThumbDragTop = __UI_MouseTop
                            __UI_DraggingThumbOnID = __UI_HoveringID
                        End If
                    Else
                        If Timer - JustEnteredTextBox <= .3 Then
                            If Control(__UI_Focus).Multiline Then
                                GoTo PositionCursorMultilineTB
                            Else
                                If Control(__UI_Focus).BypassSelectOnFocus = False Then
                                    Control(__UI_Focus).Cursor = Len(Text(__UI_Focus))
                                    Control(__UI_Focus).SelectionStart = 0
                                    Control(__UI_Focus).TextIsSelected = True
                                End If
                            End If
                        Else
                            Static WholeWordSelection As _Byte, WholeWordCursor As Long, WholeWordSelStart As Long
                            Control(__UI_Focus).TextIsSelected = False
                            __UI_FillSelectedText 0, 0
                            WholeWordSelection = False
                            WholeWordCursor = 0
                            WholeWordSelStart = 0
                            If Control(__UI_Focus).Multiline And Control(__UI_Focus).HoveringVScrollbarButton = 0 Then
                                PositionCursorMultilineTB:
                                Dim ThisLine$, ThisLineLen As Long, ThisLineStart As Long
                                TotalLines = __UI_CountLines(__UI_Focus)
                                Control(__UI_Focus).CurrentLine = Control(__UI_Focus).FirstVisibleLine - 1 + (__UI_MouseTop - Control(__UI_Focus).Top - Control(Control(__UI_Focus).ParentID).Top) / uspacing&
                                If Control(__UI_Focus).CurrentLine > TotalLines Then Control(__UI_Focus).CurrentLine = TotalLines
                                If Control(__UI_Focus).CurrentLine = 0 Then Control(__UI_Focus).CurrentLine = 1
                                ThisLine$ = __UI_GetTextBoxLine(__UI_Focus, Control(__UI_Focus).CurrentLine, ThisLineStart)
                                ThisLineLen = Len(ThisLine$)
                                __UI_PrintString _Width + 10, _Height + 10, ThisLine$
                                For i = 1 To __UI_LastRenderedCharCount
                                    If (__UI_MouseLeft - Control(__UI_Focus).Left - Control(Control(__UI_Focus).ParentID).Left) >= __UI_ThisLineChars(i - 1) And (__UI_MouseLeft - Control(__UI_Focus).Left - Control(Control(__UI_Focus).ParentID).Left) <= __UI_ThisLineChars(i) Then
                                        Control(__UI_Focus).Cursor = ThisLineStart + i - 2
                                        Exit For
                                    End If
                                Next
                                If i > __UI_LastRenderedCharCount Then Control(__UI_Focus).Cursor = ThisLineStart + ThisLineLen - 1
                                Control(__UI_Focus).SelectionStart = Control(__UI_Focus).Cursor
                            Else
                                Static LastCursorReposition#, LastCursorID As Long, LastCursor As Long
                                Static JustSelectedAWord#, ContinuedSelection As _Byte
                                If Timer - LastCursorReposition# < .3 And LastCursorID = __UI_Focus And i <= __UI_LastRenderedCharCount And LastCursor = Control(__UI_Focus).Cursor Then
                                    Const SEP$ = " ,.?!;:()=+-*/"
                                    If InStr(SEP$, Mid$(Text(__UI_Focus), Control(__UI_Focus).Cursor + 1, 1)) = 0 Then
                                        RepositionCursorWholeWord:
                                        Do
                                            Control(__UI_Focus).Cursor = Control(__UI_Focus).Cursor - 1
                                            If Control(__UI_Focus).Cursor = 0 Then Exit Do
                                        Loop While InStr(SEP$, Mid$(Text(__UI_Focus), Control(__UI_Focus).Cursor + 1, 1)) = 0
                                        Control(__UI_Focus).Cursor = Control(__UI_Focus).Cursor + 1
                                        If ContinuedSelection Then Return
                                        RepositionSelStartWholeWord:
                                        Do
                                            Control(__UI_Focus).SelectionStart = Control(__UI_Focus).SelectionStart + 1
                                            If Control(__UI_Focus).SelectionStart = Len(Text(__UI_Focus)) Then Exit Do
                                        Loop While InStr(SEP$, Mid$(Text(__UI_Focus), Control(__UI_Focus).SelectionStart + 1, 1)) = 0
                                        Do
                                            If Control(__UI_Focus).SelectionStart = Len(Text(__UI_Focus)) Then Exit Do
                                            If Mid$(Text(__UI_Focus), Control(__UI_Focus).SelectionStart + 1, 1) = " " Then
                                                Control(__UI_Focus).SelectionStart = Control(__UI_Focus).SelectionStart + 1
                                            Else
                                                Exit Do
                                            End If
                                        Loop
                                        If ContinuedSelection Then Return
                                        Control(__UI_Focus).TextIsSelected = True
                                        JustSelectedAWord# = Timer
                                        WholeWordSelection = True
                                        WholeWordCursor = Control(__UI_Focus).Cursor
                                        WholeWordSelStart = Control(__UI_Focus).SelectionStart
                                    End If
                                Else
                                    If Timer - JustSelectedAWord# > .3 Then
                                        Control(__UI_Focus).TextIsSelected = False
                                        __UI_FillSelectedText 0, 0
                                        __UI_PrintString _Width + 10, _Height + 10, Text(__UI_Focus)
                                        For i = 1 To __UI_LastRenderedCharCount
                                            If (__UI_MouseLeft - Control(__UI_Focus).Left - Control(Control(__UI_Focus).ParentID).Left + Control(__UI_Focus).InputViewStart) >= __UI_ThisLineChars(i - 1) And (__UI_MouseLeft - Control(__UI_Focus).Left - Control(Control(__UI_Focus).ParentID).Left) + Control(__UI_Focus).InputViewStart <= __UI_ThisLineChars(i) Then
                                                Control(__UI_Focus).Cursor = i - 1
                                                Exit For
                                            End If
                                        Next
                                        If i > __UI_LastRenderedCharCount Then Control(__UI_Focus).Cursor = Len(Text(__UI_Focus))
                                        Control(__UI_Focus).SelectionStart = Control(__UI_Focus).Cursor
                                    End If
                                End If
                                LastCursorReposition# = Timer
                                LastCursorID = __UI_Focus
                                LastCursor = Control(__UI_Focus).Cursor
                            End If
                            __UI_IsSelectingText = True
                            __UI_IsSelectingTextOnID = __UI_Focus
                        End If
                    End If
                ElseIf Control(__UI_HoveringID).Type = __UI_Type_ListBox And Not Control(__UI_HoveringID).Disabled Then
                    If Control(__UI_HoveringID).HoveringVScrollbarButton = 1 Or Control(__UI_HoveringID).HoveringVScrollbarButton = 2 Or Control(__UI_HoveringID).HoveringVScrollbarButton = 4 Or Control(__UI_HoveringID).HoveringVScrollbarButton = 5 Then
                        __UI_MouseDownOnScrollbar = Timer
                    ElseIf Control(__UI_HoveringID).HoveringVScrollbarButton = 3 Then
                        If Not __UI_DraggingThumb Then
                            __UI_DraggingThumb = True
                            __UI_ThumbDragTop = __UI_MouseTop
                            __UI_DraggingThumbOnID = __UI_HoveringID
                        End If
                    End If
                End If
            End If
            __UI_MouseDown __UI_HoveringID
            __UI_LastMouseDownEvent = Timer
        Else
            If __UI_DesignMode Then
                If __UI_ResizeHandleHover = 0 And (__UI_MouseTop <> __UI_MouseDownTop Or __UI_MouseLeft <> __UI_MouseDownLeft) Then
                    If __UI_IsDragging = False And __UI_SelectionRectangle = False Then
                        __UI_IsDragging = True
                        __UI_DraggingID = __UI_HoveringID
                        For i = 1 To UBound(Control)
                            If Control(i).ControlIsSelected And Control(i).Type = __UI_Type_Frame Then
                                __UI_DraggingID = i
                                For i = 1 To UBound(Control)
                                    If i <> __UI_DraggingID Then
                                        If Control(i).ControlIsSelected Then
                                            Control(i).ControlIsSelected = False
                                            __UI_TotalSelectedControls = __UI_TotalSelectedControls - 1
                                        End If
                                    End If
                                Next
                                Exit For
                            End If
                        Next
                        If Control(__UI_FirstSelectedID).Type = __UI_Type_ContextMenu Or Control(__UI_FirstSelectedID).Type = __UI_Type_MenuBar Or Control(__UI_FirstSelectedID).Type = __UI_Type_MenuItem Then
                            __UI_DraggingID = 0
                            __UI_IsDragging = False
                            __UI_MouseDownOnID = 0
                        Else
                            __UI_MouseDownOnID = 0
                            __UI_DragY = __UI_MouseTop
                            __UI_DragX = __UI_MouseLeft
                            OriginalDragX = __UI_DragX - Control(__UI_DraggingID).Left - Control(Control(__UI_DraggingID).ParentID).Left
                            OriginalDragY = __UI_DragY - Control(__UI_DraggingID).Top - Control(Control(__UI_DraggingID).ParentID).Top
                            If __UI_TotalSelectedControls > 1 Then
                                For i = 1 To UBound(Control)
                                    If i <> __UI_DraggingID Then
                                        Control(i).LeftOffsetFromFirstSelected = Control(__UI_DraggingID).Left - Control(i).Left
                                        Control(i).TopOffsetFromFirstSelected = Control(__UI_DraggingID).Top - Control(i).Top
                                    End If
                                Next
                            End If
                        End If
                    End If
                Else
                    If __UI_IsResizing = False And __UI_SelectionRectangle = False And Control(__UI_FirstSelectedID).Type <> __UI_Type_MenuBar And Control(__UI_FirstSelectedID).Type <> __UI_Type_MenuItem Then
                        __UI_IsResizing = True
                        __UI_ResizingID = __UI_HoveringID
                        __UI_MouseDownOnID = 0
                        __UI_DragY = __UI_MouseTop
                        __UI_DragX = __UI_MouseLeft
                    End If
                End If
            End If
            If Timer - JustEnteredTextBox < .3 Then JustEnteredTextBox = Timer
            If __UI_IsSelectingText Then
                _Font (Control(__UI_IsSelectingTextOnID).Font)
                If Not Control(__UI_IsSelectingTextOnID).Multiline Then
                    __UI_PrintString _Width + 10, _Height + 10, Text(__UI_Focus)
                    If Not WholeWordSelection Then
                        If __UI_MouseLeft > Control(__UI_Focus).Left + Control(Control(__UI_Focus).ParentID).Left And __UI_MouseLeft < Control(__UI_Focus).Left + Control(Control(__UI_Focus).ParentID).Left + Control(__UI_Focus).Width Then
                            For i = 1 To __UI_LastRenderedCharCount
                                If (__UI_MouseLeft - Control(__UI_Focus).Left - Control(Control(__UI_Focus).ParentID).Left + Control(__UI_Focus).InputViewStart) >= __UI_ThisLineChars(i - 1) And (__UI_MouseLeft - Control(__UI_Focus).Left - Control(Control(__UI_Focus).ParentID).Left) + Control(__UI_Focus).InputViewStart <= __UI_ThisLineChars(i) Then
                                    Control(__UI_Focus).Cursor = i - 1
                                    Exit For
                                End If
                            Next
                            If i > __UI_LastRenderedCharCount Then Control(__UI_Focus).Cursor = Len(Text(__UI_Focus))
                        ElseIf __UI_MouseLeft < Control(__UI_Focus).Left + Control(Control(__UI_Focus).ParentID).Left Then
                            Control(__UI_Focus).Cursor = 0
                        ElseIf __UI_MouseLeft > Control(__UI_Focus).Left + Control(Control(__UI_Focus).ParentID).Left + Control(__UI_Focus).Width Then
                            Control(__UI_Focus).Cursor = Len(Text(__UI_Focus))
                        End If
                        If Control(__UI_IsSelectingTextOnID).Cursor <> Control(__UI_IsSelectingTextOnID).SelectionStart Then
                            Control(__UI_IsSelectingTextOnID).TextIsSelected = True
                        Else
                            Control(__UI_IsSelectingTextOnID).TextIsSelected = False
                        End If
                    Else
                        Dim TempCursor As Long
                        If __UI_MouseLeft > Control(__UI_Focus).Left + Control(Control(__UI_Focus).ParentID).Left And __UI_MouseLeft < Control(__UI_Focus).Left + Control(Control(__UI_Focus).ParentID).Left + Control(__UI_Focus).Width Then
                            For i = 1 To __UI_LastRenderedCharCount
                                If (__UI_MouseLeft - Control(__UI_Focus).Left - Control(Control(__UI_Focus).ParentID).Left + Control(__UI_Focus).InputViewStart) >= __UI_ThisLineChars(i - 1) And (__UI_MouseLeft - Control(__UI_Focus).Left - Control(Control(__UI_Focus).ParentID).Left) + Control(__UI_Focus).InputViewStart <= __UI_ThisLineChars(i) Then
                                    TempCursor = i - 1
                                    Exit For
                                End If
                            Next
                        ElseIf __UI_MouseLeft < Control(__UI_Focus).Left + Control(Control(__UI_Focus).ParentID).Left Then
                            TempCursor = 0
                        ElseIf __UI_MouseLeft > Control(__UI_Focus).Left + Control(Control(__UI_Focus).ParentID).Left + Control(__UI_Focus).Width Then
                            TempCursor = Len(Text(__UI_Focus))
                        End If
                        ContinuedSelection = True
                        If TempCursor < WholeWordCursor Then Control(__UI_Focus).Cursor = TempCursor: GoSub RepositionCursorWholeWord
                        If TempCursor > WholeWordSelStart Then Control(__UI_Focus).SelectionStart = TempCursor: GoSub RepositionSelStartWholeWord
                        If TempCursor > WholeWordCursor And TempCursor < WholeWordSelStart Then Control(__UI_Focus).Cursor = WholeWordCursor: Control(__UI_Focus).SelectionStart = WholeWordSelStart
                        ContinuedSelection = False
                    End If
                Else
                    TotalLines = __UI_CountLines(__UI_IsSelectingTextOnID)
                    Control(__UI_IsSelectingTextOnID).CurrentLine = Control(__UI_IsSelectingTextOnID).FirstVisibleLine - 1 + (__UI_MouseTop - Control(__UI_IsSelectingTextOnID).Top - Control(Control(__UI_IsSelectingTextOnID).ParentID).Top) / uspacing&
                    If Control(__UI_IsSelectingTextOnID).CurrentLine > TotalLines Then Control(__UI_IsSelectingTextOnID).CurrentLine = TotalLines
                    If Control(__UI_IsSelectingTextOnID).CurrentLine = 0 Then Control(__UI_IsSelectingTextOnID).CurrentLine = 1
                    ThisLine$ = __UI_GetTextBoxLine(__UI_IsSelectingTextOnID, Control(__UI_IsSelectingTextOnID).CurrentLine, ThisLineStart)
                    ThisLineLen = Len(ThisLine$)
                    __UI_PrintString _Width + 10, _Height + 10, ThisLine$
                    For i = 1 To __UI_LastRenderedCharCount
                        If (__UI_MouseLeft - Control(__UI_IsSelectingTextOnID).Left - Control(Control(__UI_IsSelectingTextOnID).ParentID).Left) >= __UI_ThisLineChars(i - 1) And (__UI_MouseLeft - Control(__UI_IsSelectingTextOnID).Left - Control(Control(__UI_IsSelectingTextOnID).ParentID).Left) <= __UI_ThisLineChars(i) Then
                            Control(__UI_IsSelectingTextOnID).Cursor = ThisLineStart + i - 2
                            Exit For
                        End If
                    Next
                    If i > __UI_LastRenderedCharCount Then Control(__UI_IsSelectingTextOnID).Cursor = ThisLineStart + ThisLineLen - 1
                    If Control(__UI_IsSelectingTextOnID).Cursor <> Control(__UI_IsSelectingTextOnID).SelectionStart Then
                        Control(__UI_IsSelectingTextOnID).TextIsSelected = True
                    End If
                End If
            End If
            If Not __UI_SelectionRectangle Then
                If __UI_MouseDownOnID <> __UI_HoveringID And __UI_MouseDownOnID > 0 Then
                    If Control(__UI_HoveringID).Type = __UI_Type_MenuItem Or Control(__UI_HoveringID).Type = __UI_Type_MenuPanel Then
                        __UI_MouseDownOnID = __UI_HoveringID
                    Else
                        __UI_PreviousMouseDownOnID = __UI_MouseDownOnID
                        __UI_MouseDownOnID = 0
                    End If
                ElseIf __UI_HoveringID = __UI_PreviousMouseDownOnID And __UI_PreviousMouseDownOnID > 0 Then
                    __UI_MouseDownOnID = __UI_PreviousMouseDownOnID
                    __UI_PreviousMouseDownOnID = 0
                ElseIf __UI_MouseDownOnID = __UI_HoveringID Then
                    If Control(__UI_MouseDownOnID).Type = __UI_Type_ListBox Then
                        If Not Control(__UI_MouseDownOnID).Disabled And Control(__UI_MouseDownOnID).HoveringVScrollbarButton = 1 And Timer - __UI_MouseDownOnScrollbar > .3 Then
                            Control(__UI_MouseDownOnID).InputViewStart = Control(__UI_MouseDownOnID).InputViewStart - 1
                            __UI_MouseDownOnScrollbar = Timer - .25
                        ElseIf Not Control(__UI_MouseDownOnID).Disabled And Control(__UI_MouseDownOnID).HoveringVScrollbarButton = 2 And Timer - __UI_MouseDownOnScrollbar > .3 Then
                            If Control(__UI_MouseDownOnID).InputViewStart + Control(__UI_MouseDownOnID).LastVisibleItem <= Control(__UI_MouseDownOnID).Max Then
                                Control(__UI_MouseDownOnID).InputViewStart = Control(__UI_MouseDownOnID).InputViewStart + 1
                            End If
                            __UI_MouseDownOnScrollbar = Timer - .25
                        ElseIf Not Control(__UI_MouseDownOnID).Disabled And Control(__UI_MouseDownOnID).HoveringVScrollbarButton = 4 And Timer - __UI_MouseDownOnScrollbar < .3 Then
                            Control(__UI_MouseDownOnID).InputViewStart = Control(__UI_MouseDownOnID).InputViewStart - (Control(__UI_MouseDownOnID).LastVisibleItem - 1)
                            __UI_MouseDownOnScrollbar = Timer - .25
                        ElseIf Not Control(__UI_MouseDownOnID).Disabled And Control(__UI_MouseDownOnID).HoveringVScrollbarButton = 5 And Timer - __UI_MouseDownOnScrollbar < .3 Then
                            Control(__UI_MouseDownOnID).InputViewStart = Control(__UI_MouseDownOnID).InputViewStart + (Control(__UI_MouseDownOnID).LastVisibleItem - 1)
                            If Control(__UI_MouseDownOnID).InputViewStart > Control(__UI_MouseDownOnID).Max - Control(__UI_MouseDownOnID).LastVisibleItem - 1 Then
                                Control(__UI_MouseDownOnID).InputViewStart = Control(__UI_MouseDownOnID).Max - Control(__UI_MouseDownOnID).LastVisibleItem - 1
                            End If
                            __UI_MouseDownOnScrollbar = Timer - .25
                        End If
                    ElseIf Control(__UI_MouseDownOnID).Type = __UI_Type_TextBox Then
                        _Font Control(__UI_MouseDownOnID).Font
                        If Not Control(__UI_MouseDownOnID).Disabled And Control(__UI_MouseDownOnID).HoveringVScrollbarButton = 1 And Timer - __UI_MouseDownOnScrollbar > .3 Then
                            Control(__UI_MouseDownOnID).FirstVisibleLine = Control(__UI_MouseDownOnID).FirstVisibleLine - 1
                            If Control(__UI_MouseDownOnID).FirstVisibleLine < 0 Then Control(__UI_MouseDownOnID).FirstVisibleLine = 1
                        ElseIf Not Control(__UI_MouseDownOnID).Disabled And Control(__UI_MouseDownOnID).HoveringVScrollbarButton = 2 And Timer - __UI_MouseDownOnScrollbar > .3 Then
                            If Control(__UI_MouseDownOnID).FirstVisibleLine < __UI_CountLines(__UI_MouseDownOnID) - Control(__UI_MouseDownOnID).Height \ uspacing& + 1 Then
                                Control(__UI_MouseDownOnID).FirstVisibleLine = Control(__UI_MouseDownOnID).FirstVisibleLine + 1
                            End If
                        ElseIf Not Control(__UI_MouseDownOnID).Disabled And Control(__UI_MouseDownOnID).HoveringVScrollbarButton = 4 And Timer - __UI_MouseDownOnScrollbar < .3 Then
                            Control(__UI_MouseDownOnID).InputViewStart = Control(__UI_MouseDownOnID).InputViewStart - (Control(__UI_MouseDownOnID).LastVisibleItem - 1)
                        ElseIf Not Control(__UI_MouseDownOnID).Disabled And Control(__UI_MouseDownOnID).HoveringVScrollbarButton = 5 And Timer - __UI_MouseDownOnScrollbar < .3 Then
                            Control(__UI_MouseDownOnID).InputViewStart = Control(__UI_MouseDownOnID).InputViewStart + (Control(__UI_MouseDownOnID).LastVisibleItem - 1)
                            If Control(__UI_MouseDownOnID).InputViewStart > Control(__UI_MouseDownOnID).Max - Control(__UI_MouseDownOnID).LastVisibleItem - 1 Then
                                Control(__UI_MouseDownOnID).InputViewStart = Control(__UI_MouseDownOnID).Max - Control(__UI_MouseDownOnID).LastVisibleItem - 1
                            End If
                        End If
                    End If
                    If Control(__UI_MouseDownOnID).Type = __UI_Type_TrackBar And Not Control(__UI_MouseDownOnID).Disabled Then
                        Control(__UI_HoveringID).Value = __UI_MAP((__UI_MouseLeft - (ContainerOffsetLeft + Control(__UI_HoveringID).Left)), 0, Control(__UI_HoveringID).Width, Control(__UI_HoveringID).Min, Control(__UI_HoveringID).Max)
                        If Control(__UI_HoveringID).Value < Control(__UI_HoveringID).Min Then
                            Control(__UI_HoveringID).Value = Control(__UI_HoveringID).Min
                        End If
                        If Control(__UI_HoveringID).Value > Control(__UI_HoveringID).Max Then
                            Control(__UI_HoveringID).Value = Control(__UI_HoveringID).Max
                        End If
                    End If
                End If
            End If
            If __UI_MouseDownOnID = 0 And Control(__UI_PreviousMouseDownOnID).Type = __UI_Type_TrackBar And Not Control(__UI_PreviousMouseDownOnID).Disabled Then
                Control(__UI_PreviousMouseDownOnID).Value = __UI_MAP((__UI_MouseLeft - (Control(Control(__UI_PreviousMouseDownOnID).ParentID).Left + Control(__UI_PreviousMouseDownOnID).Left)), 0, Control(__UI_PreviousMouseDownOnID).Width, Control(__UI_PreviousMouseDownOnID).Min, Control(__UI_PreviousMouseDownOnID).Max)
                If Control(__UI_PreviousMouseDownOnID).Value > Control(__UI_PreviousMouseDownOnID).Max Then Control(__UI_PreviousMouseDownOnID).Value = Control(__UI_PreviousMouseDownOnID).Max
                If Control(__UI_PreviousMouseDownOnID).Value < Control(__UI_PreviousMouseDownOnID).Min Then Control(__UI_PreviousMouseDownOnID).Value = Control(__UI_PreviousMouseDownOnID).Min
            End If
        End If
    Else
        If __UI_MouseIsDown Then
            If __UI_IsDragging Then
                __UI_IsDragging = False
                __UI_DraggingID = 0
                __UI_Snapped = 0
                __UI_SnappedByProximityX = False
                __UI_SnappedByProximityY = False
                __UI_ForceRedraw = True
            End If
            If __UI_IsResizing Then
                __UI_IsResizing = False
                __UI_ResizingID = 0
            End If
            If __UI_DraggingThumb Then
                __UI_DraggingThumb = False
                __UI_DraggingThumbOnID = 0
            End If
            If __UI_PreviousMouseDownOnID > 0 Then
                __UI_MouseUp __UI_PreviousMouseDownOnID
            Else
                If __UI_MouseDownOnID > 0 Then __UI_MouseUp __UI_MouseDownOnID
            End If
            If Not __UI_DesignMode And __UI_MouseDownOnID = __UI_HoveringID And __UI_HoveringID > 0 Then
                If Not Control(__UI_HoveringID).Disabled Then
                    Select Case Control(__UI_HoveringID).Type
                        Case __UI_Type_RadioButton
                            SetRadioButtonValue __UI_HoveringID
                        Case __UI_Type_CheckBox, __UI_Type_ToggleSwitch
                            Control(__UI_HoveringID).Value = Not Control(__UI_HoveringID).Value
                            __UI_ValueChanged __UI_HoveringID
                            Control(__UI_HoveringID).LastChange = Timer
                        Case __UI_Type_TextBox
                            If Control(__UI_HoveringID).HasVScrollbar And __UI_MouseLeft >= Control(__UI_HoveringID).Left + Control(__UI_HoveringID).Width - 25 + ContainerOffsetLeft Then
                                If __UI_MouseTop >= Control(__UI_HoveringID).Top + ContainerOffsetTop And Not Control(__UI_HoveringID).Disabled And __UI_MouseTop <= Control(__UI_HoveringID).Top + ContainerOffsetTop + __UI_ScrollbarButtonHeight Then
                                    Control(__UI_MouseDownOnID).FirstVisibleLine = Control(__UI_MouseDownOnID).FirstVisibleLine - 1
                                    If Control(__UI_MouseDownOnID).FirstVisibleLine < 0 Then Control(__UI_MouseDownOnID).FirstVisibleLine = 1
                                ElseIf __UI_MouseTop >= Control(__UI_HoveringID).VScrollbarButton2Top + ContainerOffsetTop And Not Control(__UI_HoveringID).Disabled Then
                                    If Control(__UI_MouseDownOnID).FirstVisibleLine < __UI_CountLines(__UI_MouseDownOnID) - Control(__UI_MouseDownOnID).Height \ uspacing& + 1 Then
                                        Control(__UI_MouseDownOnID).FirstVisibleLine = Control(__UI_MouseDownOnID).FirstVisibleLine + 1
                                    End If
                                End If
                            Else
                                If Timer - JustEnteredTextBox > .3 Then
                                    _Font (Control(__UI_HoveringID).Font)
                                End If
                            End If
                        Case __UI_Type_ListBox
                            If Control(__UI_HoveringID).HasVScrollbar And __UI_MouseLeft >= Control(__UI_HoveringID).Left + Control(__UI_HoveringID).Width - 25 + ContainerOffsetLeft Then
                                If __UI_MouseTop >= Control(__UI_HoveringID).Top + ContainerOffsetTop And Not Control(__UI_HoveringID).Disabled And __UI_MouseTop <= Control(__UI_HoveringID).Top + ContainerOffsetTop + __UI_ScrollbarButtonHeight Then
                                    Control(__UI_HoveringID).InputViewStart = Control(__UI_HoveringID).InputViewStart - 1
                                ElseIf __UI_MouseTop >= Control(__UI_HoveringID).VScrollbarButton2Top + ContainerOffsetTop And Not Control(__UI_HoveringID).Disabled Then
                                    If Control(__UI_HoveringID).InputViewStart + Control(__UI_HoveringID).LastVisibleItem <= Control(__UI_HoveringID).Max Then
                                        Control(__UI_HoveringID).InputViewStart = Control(__UI_HoveringID).InputViewStart + 1
                                    End If
                                End If
                            Else
                                _Font Control(__UI_HoveringID).Font
                                ThisItem% = ((__UI_MouseTop - (ContainerOffsetTop + Control(__UI_HoveringID).Top) - (Abs(Control(__UI_HoveringID).HasBorder) * __UI_DefaultCaptionIndent)) \ Control(__UI_HoveringID).ItemHeight) + Control(__UI_HoveringID).InputViewStart
                                If ThisItem% >= Control(__UI_HoveringID).Min And ThisItem% <= Control(__UI_HoveringID).Max Then
                                    Control(__UI_HoveringID).Value = ThisItem%
                                Else
                                    Control(__UI_HoveringID).Value = 0
                                End If
                                If __UI_HoveringID = __UI_ActiveDropdownList Then
                                    __UI_Focus = __UI_ParentDropdownList
                                    Control(__UI_ParentDropdownList).Value = Control(__UI_ActiveDropdownList).Value
                                    If Control(__UI_ParentDropdownList).PreviousValue <> Control(__UI_ParentDropdownList).Value Then
                                        __UI_ValueChanged __UI_ParentDropdownList
                                        Control(__UI_ParentDropdownList).PreviousValue = Control(__UI_ParentDropdownList).Value
                                        Control(__UI_ParentDropdownList).Redraw = True
                                    End If
                                    __UI_DestroyControl Control(__UI_ActiveDropdownList)
                                Else
                                    If Control(__UI_HoveringID).PreviousValue <> Control(__UI_HoveringID).Value Then
                                        __UI_ValueChanged __UI_HoveringID
                                        Control(__UI_HoveringID).PreviousValue = Control(__UI_HoveringID).Value
                                        Control(__UI_HoveringID).Redraw = True
                                    End If
                                End If
                            End If
                        Case __UI_Type_DropdownList
                            If __UI_ActiveDropdownList = 0 Then
                                __UI_ActivateDropdownlist Control(__UI_HoveringID)
                            Else
                                __UI_DestroyControl Control(__UI_ActiveDropdownList)
                            End If
                        Case __UI_Type_MenuBar
                            If __UI_TotalActiveMenus > 0 And Not __UI_JustOpenedMenu Then
                                __UI_Focus = __UI_PreviousFocus
                            End If
                        Case __UI_Type_MenuItem
                            If Control(__UI_HoveringID).SubMenu Then
                                __UI_ActivateMenu Control(__UI_HoveringID), False
                            Else
                                __UI_Focus = __UI_PreviousFocus
                                __UI_DestroyControl Control(__UI_ActiveMenu(__UI_TotalActiveMenus))
                                __UI_ForceRedraw = True
                                If Control(__UI_HoveringID).BulletStyle = __UI_Bullet Then SetRadioButtonValue __UI_HoveringID
                            End If
                    End Select
                    __UI_LastMouseClick = Timer
                    __UI_JustOpenedMenu = False
                    __UI_MouseDownOnID = 0
                    ProcessClick:
                    If RTrim$(Control(Control(__UI_HoveringID).ParentID).Name) = "__UI_TextFieldMenu" Or RTrim$(Control(Control(__UI_HoveringID).ParentID).Name) = "__UI_PreviewMenu" Then
                        If RTrim$(Control(Control(__UI_HoveringID).ParentID).Name) = "__UI_TextFieldMenu" Then
                            __UI_Focus = __UI_PreviousFocus
                        ElseIf RTrim$(Control(Control(__UI_HoveringID).ParentID).Name) = "__UI_PreviewMenu" Then
                            __UI_DestroyControl Control(__UI_ActiveMenu(__UI_TotalActiveMenus))
                        End If
                        ProcessHotkey:
                        __UI_FillSelectedText 0, 0
                        If UCase$(Left$(Control(__UI_HoveringID).Name, 16)) = "__UI_PREVIEWMENU" Then __UI_KeyPress 216
                        Select Case UCase$(RTrim$(Control(__UI_HoveringID).Name))
                            Case "__UI_TEXTMENUCUT"
                                If Len(__UI_SelectedText) > 0 Then
                                    _Clipboard$ = __UI_SelectedText
                                    __UI_DeleteSelection
                                End If
                            Case "__UI_TEXTMENUCOPY"
                                If Len(__UI_SelectedText) > 0 Then _Clipboard$ = __UI_SelectedText
                            Case "__UI_TEXTMENUPASTE"
                                Dim ContextMenuPaste As _Byte
                                ContextMenuPaste = True
                                GoSub PasteIntoTextBox
                            Case "__UI_TEXTMENUDELETE"
                                __UI_DeleteSelection
                            Case "__UI_TEXTMENUSELECT"
                                If Len(Text(__UI_Focus)) > 0 Then
                                    Control(__UI_Focus).Cursor = Len(Text(__UI_Focus))
                                    Control(__UI_Focus).SelectionStart = 0
                                    Control(__UI_Focus).TextIsSelected = True
                                End If
                            Case "__UI_PREVIEWMENUALIGNLEFT"
                                __UI_KeyPress 201
                            Case "__UI_PREVIEWMENUALIGNRIGHT"
                                __UI_KeyPress 202
                            Case "__UI_PREVIEWMENUALIGNTOPS"
                                __UI_KeyPress 203
                            Case "__UI_PREVIEWMENUALIGNBOTTOMS"
                                __UI_KeyPress 204
                            Case "__UI_PREVIEWMENUALIGNCENTERSV"
                                __UI_KeyPress 205
                            Case "__UI_PREVIEWMENUALIGNCENTERSH"
                                __UI_KeyPress 206
                            Case "__UI_PREVIEWMENUALIGNCENTERV"
                                __UI_KeyPress 207
                            Case "__UI_PREVIEWMENUALIGNCENTERH"
                                __UI_KeyPress 208
                            Case "__UI_PREVIEWMENUDISTRIBUTEV"
                                __UI_KeyPress 209
                            Case "__UI_PREVIEWMENUDISTRIBUTEH"
                                __UI_KeyPress 210
                            Case "__UI_PREVIEWMENUIMAGEORIGINALSIZE"
                                If Len(Text(__UI_FirstSelectedID)) Then
                                    __UI_RestoreImageOriginalSize
                                End If
                            Case UCase$("__UI_PreviewMenuNumericOnly")
                                __UI_KeyPress 223
                            Case UCase$("__UI_PreviewMenuSetDefaultButton")
                                If __UI_DefaultButtonID = __UI_FirstSelectedID Then
                                    __UI_DefaultButtonID = 0
                                Else
                                    __UI_DefaultButtonID = __UI_FirstSelectedID
                                End If
                            Case UCase$("__UI_PreviewMenuNewMenuBar")
                                __UI_KeyPress 224
                            Case UCase$("__UI_PreviewMenuShowInvisibleControls")
                                __UI_KeyPress 227
                            Case UCase$("__UI_PreviewMenuConvertType")
                                __UI_KeyPress 225
                            Case UCase$("__UI_PreviewMenuNewContextMenu")
                                __UI_KeyPress 226
                            Case "__UI_PREVIEWMENUCUT": GoTo ControlCut
                            Case "__UI_PREVIEWMENUCOPY": GoTo ControlCopy
                            Case "__UI_PREVIEWMENUPASTE": GoTo ControlPaste
                            Case "__UI_PREVIEWMENUDELETE": GoTo ControlDelete
                            Case "__UI_PREVIEWMENUSELECT": GoTo ControlSelect
                        End Select
                        __UI_KeyPress __UI_Focus
                    Else
                        __UI_Click __UI_HoveringID
                        __UI_KeyHit = 0
                    End If
                Else
                    __UI_CloseAllMenus
                    __UI_Focus = __UI_PreviousFocus
                    __UI_ForceRedraw = True
                End If
            End If
            __UI_IsSelectingText = False
            __UI_IsSelectingTextOnID = 0
            __UI_MouseIsDown = False
            __UI_MouseDownOnID = 0
            __UI_PreviousMouseDownOnID = 0
            __UI_SelectionRectangle = False
        End If
    End If
    If __UI_IsDragging And __UI_DraggingID = __UI_FormID Then __UI_IsDragging = False
    __UI_Snapped = False
    __UI_SnappedByProximityX = False
    __UI_SnappedByProximityY = False
    __UI_SnappedX = -1
    __UI_SnappedY = -1
    Dim SetNewParent As _Byte, LeftOffset As Integer, TopOffset As Integer
    If __UI_IsDragging And __UI_DraggingID > 0 Then
        If Control(__UI_DraggingID).Type <> __UI_Type_Frame Then
            If Control(__UI_BelowHoveringID).Type = __UI_Type_Frame Or Control(__UI_HoveringID).Type = __UI_Type_Frame Then
                If Control(__UI_HoveringID).Type = __UI_Type_Frame Then __UI_BelowHoveringID = __UI_HoveringID
                If Control(__UI_FirstSelectedID).ParentID <> __UI_BelowHoveringID Then
                    SetNewParent = True
                    LeftOffset = Control(__UI_BelowHoveringID).Left
                    TopOffset = Control(__UI_BelowHoveringID).Top
                End If
            ElseIf Control(__UI_BelowHoveringID).Type = __UI_Type_Form Or __UI_BelowHoveringID = 0 Then
                If Control(__UI_FirstSelectedID).ParentID > 0 Then
                    LeftOffset = Control(Control(__UI_FirstSelectedID).ParentID).Left
                    TopOffset = Control(Control(__UI_FirstSelectedID).ParentID).Top
                    __UI_BelowHoveringID = 0
                    SetNewParent = True
                End If
            End If
        End If
        For i = 1 To UBound(Control)
            If Control(i).ControlIsSelected Then
                Control(i).Top = Control(i).Top + (__UI_MouseTop - __UI_DragY)
                Control(i).Left = Control(i).Left + (__UI_MouseLeft - __UI_DragX)
                If SetNewParent Then
                    Control(i).ParentID = __UI_BelowHoveringID
                    Control(i).ParentName = Control(__UI_BelowHoveringID).Name
                    If __UI_BelowHoveringID = 0 Then
                        Control(i).Top = Control(i).Top + TopOffset
                        Control(i).Left = Control(i).Left + LeftOffset
                    Else
                        Control(i).Top = Control(i).Top - TopOffset
                        Control(i).Left = Control(i).Left - LeftOffset
                    End If
                End If
            End If
        Next
        If (_KeyDown(100305) = 0 And _KeyDown(100306) = 0) And __UI_SnapLines Then
            Dim MouseXOffset As Integer, MouseYOffset As Integer
            Dim XSnapOffset As Integer, YSnapOffset As Integer
            Dim PrevXSnapOffset As Integer, PrevYSnapOffset As Integer
            PrevXSnapOffset = 10
            PrevYSnapOffset = 10
            MouseYOffset = Abs(__UI_MouseTop - (Control(__UI_DraggingID).Top + Control(Control(__UI_DraggingID).ParentID).Top + OriginalDragY))
            MouseXOffset = Abs(__UI_MouseLeft - (Control(__UI_DraggingID).Left + Control(Control(__UI_DraggingID).ParentID).Left + OriginalDragX))
            If Control(__UI_DraggingID).ParentID = 0 Then
                XSnapOffset = Control(__UI_DraggingID).Left
                If XSnapOffset >= __UI_SnapDistanceFromForm / 2 And XSnapOffset <= __UI_SnapDistanceFromForm And MouseXOffset < 10 Then
                    Control(__UI_DraggingID).Left = __UI_SnapDistanceFromForm
                    __UI_Snapped = True
                    __UI_SnappedX = __UI_SnapDistanceFromForm
                    __UI_SnappedByProximityX = 3
                End If
                XSnapOffset = Abs((Control(__UI_DraggingID).Left + Control(__UI_DraggingID).Width + __UI_SnapDistanceFromForm) - Control(__UI_FormID).Width)
                If XSnapOffset < __UI_SnapDistanceFromForm And MouseXOffset < 10 Then
                    Control(__UI_DraggingID).Left = Control(__UI_FormID).Width - (Control(__UI_DraggingID).Width + __UI_SnapDistanceFromForm)
                    __UI_Snapped = True
                    __UI_SnappedX = Control(__UI_DraggingID).Left
                    __UI_SnappedByProximityX = 4
                End If
                YSnapOffset = Control(__UI_DraggingID).Top
                If YSnapOffset >= __UI_SnapDistanceFromForm / 2 And YSnapOffset <= __UI_SnapDistanceFromForm And MouseYOffset < 10 Then
                    Control(__UI_DraggingID).Top = __UI_SnapDistanceFromForm
                    __UI_Snapped = True
                    __UI_SnappedY = __UI_SnapDistanceFromForm
                    __UI_SnappedByProximityY = 3
                End If
                YSnapOffset = Abs((Control(__UI_DraggingID).Top + Control(__UI_DraggingID).Height + __UI_SnapDistanceFromForm) - Control(__UI_FormID).Height)
                If YSnapOffset < __UI_SnapDistanceFromForm And MouseYOffset < 10 Then
                    Control(__UI_DraggingID).Top = Control(__UI_FormID).Height - (Control(__UI_DraggingID).Height + __UI_SnapDistanceFromForm)
                    __UI_Snapped = True
                    __UI_SnappedY = Control(__UI_DraggingID).Top
                    __UI_SnappedByProximityY = 4
                End If
                YSnapOffset = Abs(((Control(__UI_FormID).Height - __UI_MenuBarOffsetV) / 2 + __UI_MenuBarOffsetV) - (Control(__UI_DraggingID).Top + Control(__UI_DraggingID).Height / 2))
                If YSnapOffset < 5 And MouseYOffset < 10 Then
                    Control(__UI_DraggingID).Top = (Control(__UI_FormID).Height - __UI_MenuBarOffsetV) / 2 + __UI_MenuBarOffsetV - Control(__UI_DraggingID).Height / 2
                    __UI_Snapped = True
                    __UI_SnappedY = (Control(__UI_FormID).Height - __UI_MenuBarOffsetV) / 2 + __UI_MenuBarOffsetV
                End If
                XSnapOffset = Abs((Control(__UI_FormID).Width / 2) - (Control(__UI_DraggingID).Left + Control(__UI_DraggingID).Width / 2))
                If XSnapOffset < 5 And MouseXOffset < 10 Then
                    Control(__UI_DraggingID).Left = Control(__UI_FormID).Width / 2 - Control(__UI_DraggingID).Width / 2
                    __UI_Snapped = True
                    __UI_SnappedX = Control(__UI_FormID).Width / 2
                End If
            End If
            For i = 1 To UBound(Control)
                IF Control(i).ParentID = Control(__UI_DraggingID).ParentID AND Control(i).Type > 0 AND _
                    i <> __UI_DraggingID AND Control(i).Type <> __UI_Type_ContextMenu AND Control(i).Type <> __UI_Type_Form AND Control(i).Type <> __UI_Type_Font AND Control(i).Type <> __UI_Type_MenuItem AND Control(i).Type <> __UI_Type_MenuBar AND Control(i).Type <> __UI_Type_MenuPanel AND _
                    Control(i).ControlIsSelected = False THEN
                    YSnapOffset = Abs((Control(i).Top + Control(Control(i).ParentID).Top) - (Control(__UI_DraggingID).Top + Control(Control(__UI_DraggingID).ParentID).Top))
                    If YSnapOffset < 5 And YSnapOffset < PrevYSnapOffset And MouseYOffset < 10 Then
                        PrevYSnapOffset = YSnapOffset
                        Control(__UI_DraggingID).Top = Control(i).Top + Control(Control(i).ParentID).Top
                        __UI_Snapped = True
                        __UI_SnappedY = Control(i).Top + Control(Control(i).ParentID).Top
                        __UI_SnappedYID = i
                    End If
                    YSnapOffset = Abs((Control(i).Top + Control(i).Height / 2 + Control(Control(i).ParentID).Top) - (Control(__UI_DraggingID).Top + Control(__UI_DraggingID).Height / 2 + Control(Control(__UI_DraggingID).ParentID).Top))
                    If YSnapOffset < 5 And YSnapOffset < PrevYSnapOffset And MouseYOffset < 10 Then
                        PrevYSnapOffset = YSnapOffset
                        Control(__UI_DraggingID).Top = Control(i).Top + Control(i).Height / 2 - Control(__UI_DraggingID).Height / 2 + Control(Control(i).ParentID).Top
                        __UI_Snapped = True
                        __UI_SnappedY = Control(i).Top + Control(i).Height / 2 + Control(Control(i).ParentID).Top
                        __UI_SnappedYID = i
                    End If
                    YSnapOffset = Abs((Control(i).Top + Control(i).Height + Control(Control(i).ParentID).Top) - (Control(__UI_DraggingID).Top + Control(__UI_DraggingID).Height + Control(Control(__UI_DraggingID).ParentID).Top))
                    If YSnapOffset < 5 And YSnapOffset < PrevYSnapOffset And MouseYOffset < 10 Then
                        PrevYSnapOffset = YSnapOffset
                        Control(__UI_DraggingID).Top = Control(i).Top + Control(i).Height - Control(__UI_DraggingID).Height + Control(Control(i).ParentID).Top
                        __UI_Snapped = True
                        __UI_SnappedY = Control(i).Top + Control(i).Height + Control(Control(i).ParentID).Top
                        __UI_SnappedYID = i
                    End If
                    XSnapOffset = Abs((Control(i).Left + Control(Control(i).ParentID).Left) - (Control(__UI_DraggingID).Left + Control(Control(__UI_DraggingID).ParentID).Left))
                    If XSnapOffset < 5 And XSnapOffset < PrevXSnapOffset And MouseXOffset < 10 Then
                        PrevXSnapOffset = XSnapOffset
                        Control(__UI_DraggingID).Left = Control(i).Left + Control(Control(i).ParentID).Left
                        __UI_Snapped = True
                        __UI_SnappedX = Control(i).Left + Control(Control(i).ParentID).Left
                        __UI_SnappedXID = i
                    End If
                    XSnapOffset = Abs((Control(i).Left + Control(i).Width / 2 + Control(Control(i).ParentID).Left) - (Control(__UI_DraggingID).Left + Control(__UI_DraggingID).Width / 2 + Control(Control(__UI_DraggingID).ParentID).Left))
                    If XSnapOffset < 5 And XSnapOffset < PrevXSnapOffset And MouseXOffset < 10 Then
                        PrevXSnapOffset = XSnapOffset
                        Control(__UI_DraggingID).Left = Control(i).Left + Control(i).Width / 2 - Control(__UI_DraggingID).Width / 2 + Control(Control(i).ParentID).Left
                        __UI_Snapped = True
                        __UI_SnappedX = Control(i).Left + Control(i).Width / 2 + Control(Control(i).ParentID).Left
                        __UI_SnappedXID = i
                    End If
                    XSnapOffset = Abs((Control(i).Left + Control(i).Width + Control(Control(i).ParentID).Left) - (Control(__UI_DraggingID).Left + Control(__UI_DraggingID).Width + Control(Control(__UI_DraggingID).ParentID).Left))
                    If XSnapOffset < 5 And XSnapOffset < PrevXSnapOffset And MouseXOffset < 10 Then
                        PrevXSnapOffset = XSnapOffset
                        Control(__UI_DraggingID).Left = Control(i).Left + Control(i).Width - Control(__UI_DraggingID).Width + Control(Control(i).ParentID).Left
                        __UI_Snapped = True
                        __UI_SnappedX = Control(i).Left + Control(i).Width + Control(Control(i).ParentID).Left
                        __UI_SnappedXID = i
                    End If
                    XSnapOffset = Abs((Control(i).Left + Control(i).Width + Control(Control(i).ParentID).Left + __UI_SnapDistance) - (Control(__UI_DraggingID).Left + Control(Control(__UI_DraggingID).ParentID).Left))
                    If XSnapOffset < 5 And XSnapOffset < PrevXSnapOffset And MouseXOffset < 10 Then
                        IF (Control(__UI_DraggingID).Top <= Control(i).Top + Control(i).Height AND _
                           Control(__UI_DraggingID).Top >= Control(i).Top) OR _
                           (Control(__UI_DraggingID).Top + Control(__UI_DraggingID).Height >= Control(i).Top AND _
                           Control(__UI_DraggingID).Top + Control(__UI_DraggingID).Height <= Control(i).Top + Control(i).Height) THEN
                            PrevXSnapOffset = XSnapOffset
                            Control(__UI_DraggingID).Left = Control(i).Left + Control(i).Width + Control(Control(i).ParentID).Left + __UI_SnapDistance
                            __UI_Snapped = True
                            __UI_SnappedX = Control(i).Left + Control(i).Width + Control(Control(i).ParentID).Left + __UI_SnapDistance
                            __UI_SnappedXID = i
                            __UI_SnappedByProximityX = 1
                        End If
                    End If
                    XSnapOffset = Abs((Control(i).Left - __UI_SnapDistance) - (Control(__UI_DraggingID).Left + Control(__UI_DraggingID).Width + Control(Control(__UI_DraggingID).ParentID).Left))
                    If XSnapOffset < 5 And XSnapOffset < PrevXSnapOffset And MouseXOffset < 10 Then
                        IF (Control(__UI_DraggingID).Top <= Control(i).Top + Control(i).Height AND _
                           Control(__UI_DraggingID).Top >= Control(i).Top) OR _
                           (Control(__UI_DraggingID).Top + Control(__UI_DraggingID).Height >= Control(i).Top AND _
                           Control(__UI_DraggingID).Top + Control(__UI_DraggingID).Height <= Control(i).Top + Control(i).Height) THEN
                            PrevXSnapOffset = XSnapOffset
                            Control(__UI_DraggingID).Left = Control(i).Left - Control(__UI_DraggingID).Width - __UI_SnapDistance
                            __UI_Snapped = True
                            __UI_SnappedX = Control(i).Left - Control(__UI_DraggingID).Width - __UI_SnapDistance
                            __UI_SnappedXID = i
                            __UI_SnappedByProximityX = 2
                        End If
                    End If
                    YSnapOffset = Abs((Control(i).Top + Control(Control(i).ParentID).Top - __UI_SnapDistance) - (Control(__UI_DraggingID).Top + Control(__UI_DraggingID).Height + Control(Control(__UI_DraggingID).ParentID).Top))
                    If YSnapOffset < 5 And YSnapOffset < PrevYSnapOffset And MouseYOffset < 10 Then
                        IF (Control(__UI_DraggingID).Left <= Control(i).Left + Control(i).Width AND _
                           Control(__UI_DraggingID).Left >= Control(i).Left) OR _
                           (Control(__UI_DraggingID).Left + Control(__UI_DraggingID).Width >= Control(i).Left AND _
                           Control(__UI_DraggingID).Left + Control(__UI_DraggingID).Width <= Control(i).Left + Control(i).Width) THEN
                            PrevYSnapOffset = YSnapOffset
                            Control(__UI_DraggingID).Top = Control(i).Top + Control(Control(i).ParentID).Top - Control(__UI_DraggingID).Height - __UI_SnapDistance
                            __UI_Snapped = True
                            __UI_SnappedY = Control(i).Top + Control(Control(i).ParentID).Top - Control(__UI_DraggingID).Height - __UI_SnapDistance
                            __UI_SnappedYID = i
                            __UI_SnappedByProximityY = 1
                        End If
                    End If
                    YSnapOffset = Abs((Control(i).Top + Control(i).Height + Control(Control(i).ParentID).Top + __UI_SnapDistance) - (Control(__UI_DraggingID).Top + Control(Control(__UI_DraggingID).ParentID).Top))
                    If YSnapOffset < 5 And YSnapOffset < PrevYSnapOffset And MouseYOffset < 10 Then
                        IF (Control(__UI_DraggingID).Left <= Control(i).Left + Control(i).Width AND _
                           Control(__UI_DraggingID).Left >= Control(i).Left) OR _
                           (Control(__UI_DraggingID).Left + Control(__UI_DraggingID).Width >= Control(i).Left AND _
                           Control(__UI_DraggingID).Left + Control(__UI_DraggingID).Width <= Control(i).Left + Control(i).Width) THEN
                            PrevYSnapOffset = YSnapOffset
                            Control(__UI_DraggingID).Top = Control(i).Top + Control(Control(i).ParentID).Top + Control(i).Height + __UI_SnapDistance
                            __UI_Snapped = True
                            __UI_SnappedY = Control(i).Top + Control(Control(i).ParentID).Top + Control(i).Height + __UI_SnapDistance
                            __UI_SnappedYID = i
                            __UI_SnappedByProximityY = 2
                        End If
                    End If
                End If
            Next
        End If
        If (_KeyDown(100305) Or _KeyDown(100306)) Then __UI_Snapped = False: __UI_SnappedX = -1: __UI_SnappedY = -1
        If __UI_SnappedX = -1 Then Control(__UI_DraggingID).Left = __UI_MouseLeft - OriginalDragX
        If __UI_SnappedY = -1 Then Control(__UI_DraggingID).Top = __UI_MouseTop - OriginalDragY
        Control(__UI_DraggingID).Left = Control(__UI_DraggingID).Left - Control(Control(__UI_DraggingID).ParentID).Left
        Control(__UI_DraggingID).Top = Control(__UI_DraggingID).Top - Control(Control(__UI_DraggingID).ParentID).Top
        If __UI_TotalSelectedControls > 1 Then
            For i = 1 To UBound(Control)
                If Control(i).ControlIsSelected And i <> __UI_DraggingID Then
                    Control(i).Left = Control(__UI_DraggingID).Left - Control(i).LeftOffsetFromFirstSelected
                    Control(i).Top = Control(__UI_DraggingID).Top - Control(i).TopOffsetFromFirstSelected
                End If
            Next
        End If
        __UI_DragY = __UI_MouseTop
        __UI_DragX = __UI_MouseLeft
    End If
    If __UI_IsResizing And __UI_ResizingID > 0 Then
        __UI_ForceRedraw = True
        For i = 1 To UBound(Control)
            If Control(i).ControlIsSelected Then
                If __UI_ResizeHandleHover = 1 Then
                    If __UI_Type(Control(i).Type).RestrictResize = __UI_CantResizeH Or __UI_Type(Control(__UI_HoveringID).Type).RestrictResize = __UI_CantResize Then _Continue
                    If __UI_ShiftIsDown Then
                        Control(i).Width = Control(i).Width + (2 * (__UI_MouseLeft - __UI_DragX)): If Control(i).Width < 4 Then Control(i).Width = 4
                        If Control(i).Width > 4 Then Control(i).Left = Control(i).Left - (__UI_MouseLeft - __UI_DragX)
                    Else
                        Control(i).Width = Control(i).Width + (__UI_MouseLeft - __UI_DragX): If Control(i).Width < 4 Then Control(i).Width = 4
                    End If
                End If
                If __UI_ResizeHandleHover = 2 Then
                    If __UI_Type(Control(i).Type).RestrictResize = __UI_CantResizeV Or __UI_Type(Control(__UI_HoveringID).Type).RestrictResize = __UI_CantResize Then _Continue
                    If __UI_ShiftIsDown Then
                        Control(i).Height = Control(i).Height + (2 * (__UI_MouseTop - __UI_DragY)): If Control(i).Height < 4 Then Control(i).Height = 4
                        If Control(i).Height > 4 Then Control(i).Top = Control(i).Top - (__UI_MouseTop - __UI_DragY)
                    Else
                        Control(i).Height = Control(i).Height + (__UI_MouseTop - __UI_DragY): If Control(i).Height < 4 Then Control(i).Height = 4
                    End If
                End If
                If __UI_ResizeHandleHover = 3 Then
                    If __UI_Type(Control(i).Type).RestrictResize = __UI_CantResizeH Or __UI_Type(Control(__UI_HoveringID).Type).RestrictResize = __UI_CantResize Then _Continue
                    If __UI_ShiftIsDown Then
                        Control(i).Width = Control(i).Width - (2 * (__UI_MouseLeft - __UI_DragX)): If Control(i).Width < 4 Then Control(i).Width = 4
                        If Control(i).Width > 4 Then Control(i).Left = Control(i).Left + (__UI_MouseLeft - __UI_DragX)
                    Else
                        Control(i).Width = Control(i).Width - (__UI_MouseLeft - __UI_DragX): If Control(i).Width < 4 Then Control(i).Width = 4 Else Control(i).Left = Control(i).Left + (__UI_MouseLeft - __UI_DragX)
                    End If
                End If
                If __UI_ResizeHandleHover = 4 Then
                    If __UI_Type(Control(i).Type).RestrictResize = __UI_CantResizeV Or __UI_Type(Control(__UI_HoveringID).Type).RestrictResize = __UI_CantResize Then _Continue
                    If __UI_ShiftIsDown Then
                        Control(i).Height = Control(i).Height - (2 * (__UI_MouseTop - __UI_DragY)): If Control(i).Height < 4 Then Control(i).Height = 4
                        If Control(i).Height > 4 Then Control(i).Top = Control(i).Top + (__UI_MouseTop - __UI_DragY)
                    Else
                        Control(i).Height = Control(i).Height - (__UI_MouseTop - __UI_DragY): If Control(i).Height < 4 Then Control(i).Height = 4 Else Control(i).Top = Control(i).Top + (__UI_MouseTop - __UI_DragY)
                    End If
                End If
                Dim OldAlignmentY As Integer
                If __UI_ResizeHandleHover = 5 Then
                    If __UI_ShiftIsDown Then
                        If __UI_Type(Control(i).Type).RestrictResize <> __UI_CantResizeH And __UI_Type(Control(__UI_HoveringID).Type).RestrictResize <> __UI_CantResize Then
                            Control(i).Width = Control(i).Width + (2 * (__UI_MouseLeft - __UI_DragX)): If Control(i).Width < 4 Then Control(i).Width = 4
                            If Control(i).Width > 4 Then Control(i).Left = Control(i).Left - (__UI_MouseLeft - __UI_DragX)
                        End If
                        If __UI_Type(Control(i).Type).RestrictResize = __UI_CantResizeV Or __UI_Type(Control(__UI_HoveringID).Type).RestrictResize = __UI_CantResize Then _Continue
                        Control(i).Height = Control(i).Height - (2 * (__UI_MouseTop - __UI_DragY)): If Control(i).Height < 4 Then Control(i).Height = 4
                        If Control(i).Height > 4 Then Control(i).Top = Control(i).Top + (__UI_MouseTop - __UI_DragY)
                        If Control(i).Type = __UI_Type_PictureBox And Len(Text(i)) > 0 Then
                            OldAlignmentY = Control(i).Top + Control(i).Height / 2
                            Control(i).Height = (_Height(Control(i).HelperCanvas) / _Width(Control(i).HelperCanvas)) * Control(i).Width
                            Control(i).Top = OldAlignmentY - Control(i).Height / 2
                        End If
                    Else
                        If __UI_Type(Control(i).Type).RestrictResize <> __UI_CantResizeV And __UI_Type(Control(__UI_HoveringID).Type).RestrictResize <> __UI_CantResize Then
                            Control(i).Height = Control(i).Height - (__UI_MouseTop - __UI_DragY): If Control(i).Height < 4 Then Control(i).Height = 4 Else Control(i).Top = Control(i).Top + (__UI_MouseTop - __UI_DragY)
                        End If
                        If __UI_Type(Control(i).Type).RestrictResize = __UI_CantResizeH Or __UI_Type(Control(__UI_HoveringID).Type).RestrictResize = __UI_CantResize Then _Continue
                        Control(i).Width = Control(i).Width + (__UI_MouseLeft - __UI_DragX): If Control(i).Width < 4 Then Control(i).Width = 4
                        If Control(i).Type = __UI_Type_PictureBox And Len(Text(i)) > 0 Then
                            OldAlignmentY = Control(i).Top + Control(i).Height
                            Control(i).Height = (_Height(Control(i).HelperCanvas) / _Width(Control(i).HelperCanvas)) * Control(i).Width
                            Control(i).Top = OldAlignmentY - Control(i).Height
                        End If
                    End If
                End If
                If __UI_ResizeHandleHover = 6 Then
                    If __UI_ShiftIsDown Then
                        If __UI_Type(Control(i).Type).RestrictResize <> __UI_CantResizeH And __UI_Type(Control(__UI_HoveringID).Type).RestrictResize <> __UI_CantResize Then
                            Control(i).Width = Control(i).Width - (2 * (__UI_MouseLeft - __UI_DragX)): If Control(i).Width < 4 Then Control(i).Width = 4
                            If Control(i).Width > 4 Then Control(i).Left = Control(i).Left + (__UI_MouseLeft - __UI_DragX)
                        End If
                        If __UI_Type(Control(i).Type).RestrictResize = __UI_CantResizeV Or __UI_Type(Control(__UI_HoveringID).Type).RestrictResize = __UI_CantResize Then _Continue
                        Control(i).Height = Control(i).Height - (2 * (__UI_MouseTop - __UI_DragY)): If Control(i).Height < 4 Then Control(i).Height = 4
                        If Control(i).Height > 4 Then Control(i).Top = Control(i).Top + (__UI_MouseTop - __UI_DragY)
                        If Control(i).Type = __UI_Type_PictureBox And Len(Text(i)) > 0 Then
                            OldAlignmentY = Control(i).Top + Control(i).Height / 2
                            Control(i).Height = (_Height(Control(i).HelperCanvas) / _Width(Control(i).HelperCanvas)) * Control(i).Width
                            Control(i).Top = OldAlignmentY - Control(i).Height / 2
                        End If
                    Else
                        If __UI_Type(Control(i).Type).RestrictResize <> __UI_CantResizeV And __UI_Type(Control(__UI_HoveringID).Type).RestrictResize <> __UI_CantResize Then
                            Control(i).Height = Control(i).Height - (__UI_MouseTop - __UI_DragY): If Control(i).Height < 4 Then Control(i).Height = 4 Else Control(i).Top = Control(i).Top + (__UI_MouseTop - __UI_DragY)
                        End If
                        If __UI_Type(Control(i).Type).RestrictResize = __UI_CantResizeH Or __UI_Type(Control(__UI_HoveringID).Type).RestrictResize = __UI_CantResize Then _Continue
                        Control(i).Width = Control(i).Width - (__UI_MouseLeft - __UI_DragX): If Control(i).Width < 4 Then Control(i).Width = 4 Else Control(i).Left = Control(i).Left + (__UI_MouseLeft - __UI_DragX)
                        If Control(i).Type = __UI_Type_PictureBox And Len(Text(i)) > 0 Then
                            OldAlignmentY = Control(i).Top + Control(i).Height
                            Control(i).Height = (_Height(Control(i).HelperCanvas) / _Width(Control(i).HelperCanvas)) * Control(i).Width
                            Control(i).Top = OldAlignmentY - Control(i).Height
                        End If
                    End If
                End If
                If __UI_ResizeHandleHover = 7 Then
                    If __UI_ShiftIsDown Then
                        If __UI_Type(Control(i).Type).RestrictResize <> __UI_CantResizeH And __UI_Type(Control(__UI_HoveringID).Type).RestrictResize <> __UI_CantResize Then
                            Control(i).Width = Control(i).Width + (2 * (__UI_MouseLeft - __UI_DragX)): If Control(i).Width < 4 Then Control(i).Width = 4
                            If Control(i).Width > 4 Then Control(i).Left = Control(i).Left - (__UI_MouseLeft - __UI_DragX)
                        End If
                        If __UI_Type(Control(i).Type).RestrictResize = __UI_CantResizeV Or __UI_Type(Control(__UI_HoveringID).Type).RestrictResize = __UI_CantResize Then _Continue
                        Control(i).Height = Control(i).Height + (2 * (__UI_MouseTop - __UI_DragY)): If Control(i).Height < 4 Then Control(i).Height = 4
                        If Control(i).Height > 4 Then Control(i).Top = Control(i).Top - (__UI_MouseTop - __UI_DragY)
                        If Control(i).Type = __UI_Type_PictureBox And Len(Text(i)) > 0 Then
                            OldAlignmentY = Control(i).Top + Control(i).Height / 2
                            Control(i).Height = (_Height(Control(i).HelperCanvas) / _Width(Control(i).HelperCanvas)) * Control(i).Width
                            Control(i).Top = OldAlignmentY - Control(i).Height / 2
                        End If
                    Else
                        If __UI_Type(Control(i).Type).RestrictResize <> __UI_CantResizeV And __UI_Type(Control(__UI_HoveringID).Type).RestrictResize <> __UI_CantResize Then
                            Control(i).Height = Control(i).Height + (__UI_MouseTop - __UI_DragY): If Control(i).Height < 4 Then Control(i).Height = 4
                        End If
                        If __UI_Type(Control(i).Type).RestrictResize = __UI_CantResizeH Or __UI_Type(Control(__UI_HoveringID).Type).RestrictResize = __UI_CantResize Then _Continue
                        Control(i).Width = Control(i).Width + (__UI_MouseLeft - __UI_DragX): If Control(i).Width < 4 Then Control(i).Width = 4
                        If Control(i).Type = __UI_Type_PictureBox And Len(Text(i)) > 0 Then
                            Control(i).Height = (_Height(Control(i).HelperCanvas) / _Width(Control(i).HelperCanvas)) * Control(i).Width
                        End If
                    End If
                End If
                If __UI_ResizeHandleHover = 8 Then
                    If __UI_ShiftIsDown Then
                        If __UI_Type(Control(i).Type).RestrictResize <> __UI_CantResizeH And __UI_Type(Control(__UI_HoveringID).Type).RestrictResize <> __UI_CantResize Then
                            Control(i).Width = Control(i).Width - (2 * (__UI_MouseLeft - __UI_DragX)): If Control(i).Width < 4 Then Control(i).Width = 4
                            If Control(i).Width > 4 Then Control(i).Left = Control(i).Left + (__UI_MouseLeft - __UI_DragX)
                        End If
                        If __UI_Type(Control(i).Type).RestrictResize = __UI_CantResizeV Or __UI_Type(Control(__UI_HoveringID).Type).RestrictResize = __UI_CantResize Then _Continue
                        Control(i).Height = Control(i).Height + (2 * (__UI_MouseTop - __UI_DragY)): If Control(i).Height < 4 Then Control(i).Height = 4
                        If Control(i).Height > 4 Then Control(i).Top = Control(i).Top - (__UI_MouseTop - __UI_DragY)
                        If Control(i).Type = __UI_Type_PictureBox And Len(Text(i)) > 0 Then
                            OldAlignmentY = Control(i).Top + Control(i).Height / 2
                            Control(i).Height = (_Height(Control(i).HelperCanvas) / _Width(Control(i).HelperCanvas)) * Control(i).Width
                            Control(i).Top = OldAlignmentY - Control(i).Height / 2
                        End If
                    Else
                        If __UI_Type(Control(i).Type).RestrictResize <> __UI_CantResizeV And __UI_Type(Control(__UI_HoveringID).Type).RestrictResize <> __UI_CantResize Then
                            Control(i).Height = Control(i).Height + (__UI_MouseTop - __UI_DragY): If Control(i).Height < 4 Then Control(i).Height = 4
                        End If
                        If __UI_Type(Control(i).Type).RestrictResize = __UI_CantResizeH Or __UI_Type(Control(__UI_HoveringID).Type).RestrictResize = __UI_CantResize Then _Continue
                        Control(i).Width = Control(i).Width - (__UI_MouseLeft - __UI_DragX): If Control(i).Width < 4 Then Control(i).Width = 4 Else Control(i).Left = Control(i).Left + (__UI_MouseLeft - __UI_DragX)
                        If Control(i).Type = __UI_Type_PictureBox And Len(Text(i)) > 0 Then
                            Control(i).Height = (_Height(Control(i).HelperCanvas) / _Width(Control(i).HelperCanvas)) * Control(i).Width
                        End If
                    End If
                End If
            End If
        Next
        __UI_DragY = __UI_MouseTop
        __UI_DragX = __UI_MouseLeft
    End If
    If __UI_DraggingThumb = True Then
        If Control(__UI_DraggingThumbOnID).Type = __UI_Type_ListBox Then
            If __UI_MouseTop >= Control(__UI_DraggingThumbOnID).Top + Control(Control(__UI_DraggingThumbOnID).ParentID).Top + __UI_ScrollbarButtonHeight And __UI_MouseTop <= Control(__UI_DraggingThumbOnID).Top + Control(Control(__UI_DraggingThumbOnID).ParentID).Top + Control(__UI_DraggingThumbOnID).Height - __UI_ScrollbarButtonHeight Then
                Control(__UI_DraggingThumbOnID).InputViewStart = Control(__UI_DraggingThumbOnID).InputViewStart + ((__UI_MouseTop - __UI_ThumbDragTop) * Control(__UI_DraggingThumbOnID).VScrollbarRatio)
                If Control(__UI_DraggingThumbOnID).InputViewStart + Control(__UI_DraggingThumbOnID).LastVisibleItem - 1 > Control(__UI_DraggingThumbOnID).Max Then Control(__UI_DraggingThumbOnID).InputViewStart = Control(__UI_DraggingThumbOnID).Max - Control(__UI_DraggingThumbOnID).LastVisibleItem + 1
                __UI_ThumbDragTop = __UI_MouseTop
            ElseIf __UI_MouseTop < Control(__UI_DraggingThumbOnID).Top + Control(Control(__UI_DraggingThumbOnID).ParentID).Top + __UI_ScrollbarButtonHeight Then
                Control(__UI_DraggingThumbOnID).InputViewStart = 1
            ElseIf __UI_MouseTop > Control(__UI_DraggingThumbOnID).Top + Control(Control(__UI_DraggingThumbOnID).ParentID).Top + Control(__UI_DraggingThumbOnID).Height - __UI_ScrollbarButtonHeight Then
                Control(__UI_DraggingThumbOnID).InputViewStart = Control(__UI_DraggingThumbOnID).Max - Control(__UI_DraggingThumbOnID).LastVisibleItem + 1
            End If
        ElseIf Control(__UI_DraggingThumbOnID).Type = __UI_Type_TextBox Then
            _Font Control(__UI_DraggingThumbOnID).Font
            If __UI_MouseTop >= Control(__UI_DraggingThumbOnID).Top + Control(Control(__UI_DraggingThumbOnID).ParentID).Top + __UI_ScrollbarButtonHeight And __UI_MouseTop <= Control(__UI_DraggingThumbOnID).Top + Control(Control(__UI_DraggingThumbOnID).ParentID).Top + Control(__UI_DraggingThumbOnID).Height - __UI_ScrollbarButtonHeight Then
                Control(__UI_DraggingThumbOnID).FirstVisibleLine = Control(__UI_DraggingThumbOnID).FirstVisibleLine + ((__UI_MouseTop - __UI_ThumbDragTop) * Control(__UI_DraggingThumbOnID).VScrollbarRatio)
                __UI_ThumbDragTop = __UI_MouseTop
            ElseIf __UI_MouseTop < Control(__UI_DraggingThumbOnID).Top + Control(Control(__UI_DraggingThumbOnID).ParentID).Top + __UI_ScrollbarButtonHeight Then
                Control(__UI_DraggingThumbOnID).FirstVisibleLine = 1
            ElseIf __UI_MouseTop > Control(__UI_DraggingThumbOnID).Top + Control(Control(__UI_DraggingThumbOnID).ParentID).Top + Control(__UI_DraggingThumbOnID).Height - __UI_ScrollbarButtonHeight Then
                Control(__UI_DraggingThumbOnID).FirstVisibleLine = __UI_CountLines(__UI_DraggingThumbOnID) - Control(__UI_DraggingThumbOnID).Height \ uspacing&
            End If
        End If
    End If
    If __UI_SelectionRectangle Then
        DoSelectionRectangle:
        Dim tsmx As Integer, tmx As Integer
        Dim tsmy As Integer, tmy As Integer
        Dim parentOffsetX As Integer, parentOffsetY As Integer
        Dim selectingInFrame As _Byte, thisParent As Long
        tsmx = __UI_SelectionRectangleLeft: tmx = __UI_MouseLeft
        tsmy = __UI_SelectionRectangleTop: tmy = __UI_MouseTop
        parentOffsetX = 0: parentOffsetY = 0
        selectingInFrame = False
        If tsmx > tmx Then Swap tsmx, tmx
        If tsmy > tmy Then Swap tsmy, tmy
        If (_KeyDown(100303) Or _KeyDown(100304)) And __UI_FirstSelectedID > 0 And __UI_SelectionRectangle = False Then
            If Control(__UI_FirstSelectedID).ParentID = Control(__UI_HoveringID).ParentID Then
                thisParent = Control(__UI_FirstSelectedID).ParentID
                parentOffsetX = Control(thisParent).Left
                parentOffsetY = Control(thisParent).Top
                selectingInFrame = True
            End If
        End If
        __UI_TotalSelectedControls = 0
        For i = 1 To UBound(Control)
            Control(i).ControlIsSelected = False
            If Control(i).Type <> __UI_Type_Form And Control(i).Type <> __UI_Type_Font And Control(i).Type <> __UI_Type_MenuBar And Control(i).Type <> __UI_Type_MenuItem And Control(i).Type <> __UI_Type_MenuPanel And Control(i).Type <> __UI_Type_ContextMenu Then
                If selectingInFrame Then
                    If Control(i).ParentID = thisParent Then
                        IF tsmx < Control(i).Left + Control(i).Width + Control(thisParent).Left AND _
                            Control(i).Left + Control(thisParent).Left < tmx AND _
                            tsmy < Control(i).Top + Control(i).Height + Control(thisParent).Top AND _
                            Control(i).Top + Control(thisParent).Top < tmy THEN
                            Control(i).ControlIsSelected = True
                            __UI_TotalSelectedControls = __UI_TotalSelectedControls + 1
                            If __UI_TotalSelectedControls = 1 Then __UI_FirstSelectedID = i
                        End If
                    End If
                Else
                    If Control(i).ParentID = 0 Then
                        IF tsmx < Control(i).Left + Control(i).Width AND _
                            Control(i).Left < tmx AND _
                            tsmy < Control(i).Top + Control(i).Height AND _
                            Control(i).Top < tmy THEN
                            Control(i).ControlIsSelected = True
                            __UI_TotalSelectedControls = __UI_TotalSelectedControls + 1
                            If __UI_TotalSelectedControls = 1 Then __UI_FirstSelectedID = i
                        End If
                    End If
                End If
            End If
        Next
    End If
    If __UI_KeyHit = 100303 Or __UI_KeyHit = 100304 Then __UI_ShiftIsDown = True
    If __UI_KeyHit = -100303 Or __UI_KeyHit = -100304 Then __UI_ShiftIsDown = False
    If __UI_KeyHit = 100305 Or __UI_KeyHit = 100306 Then __UI_CtrlIsDown = True
    If __UI_KeyHit = -100305 Or __UI_KeyHit = -100306 Then __UI_CtrlIsDown = False
    If __UI_KeyHit = 100307 Or __UI_KeyHit = 100308 Then __UI_AltIsDown = True
    If __UI_KeyHit = -100307 Or __UI_KeyHit = -100308 Then __UI_AltIsDown = False
    Dim DoCombo As _Byte
    DoCombo = False
    If __UI_BypassKeyCombos = False And __UI_DesignMode = False And __UI_AltIsDown = False And __UI_KeyHit > 0 And __UI_TotalActiveMenus = 0 Then
        Dim ComboKey As String
        Dim tempCombo$
        For i = 1 To __UI_TotalKeyCombos
            If __UI_KeyCombo(i).ControlID <= 0 Then _Continue 'handled internally
            ComboKey = ""
            tempCombo$ = RTrim$(UCase$(__UI_KeyCombo(i).Combo))
            For j = Len(tempCombo$) To 1 Step -1
                If Mid$(tempCombo$, j, 1) = "+" Then
                    ComboKey = Mid$(tempCombo$, j + 1)
                    Exit For
                End If
            Next
            If ComboKey = "" Then ComboKey = tempCombo$
            If (InStr(tempCombo$, "SHIFT+") > 0) <> __UI_ShiftIsDown Then _Continue
            If (InStr(tempCombo$, "CTRL+") > 0) <> __UI_CtrlIsDown Then _Continue
            If Left$(ComboKey, 1) = "F" Then
                If Val(Mid$(ComboKey, 2)) >= 1 And Val(Mid$(ComboKey, 2)) <= 12 Then
                    If __UI_KeyHit = __UI_FKey(Val(Mid$(ComboKey, 2))) Then
                        DoCombo = True
                        Exit For
                    End If
                Else
                    If __UI_KeyHit = Asc("F") Or __UI_KeyHit = Asc("f") Then
                        DoCombo = True
                        Exit For
                    End If
                End If
            Else
                If __UI_KeyHit = Asc(ComboKey) Or __UI_KeyHit = Asc(LCase$(ComboKey)) Then
                    DoCombo = True
                    Exit For
                End If
            End If
        Next
        If DoCombo Then
            If Control(__UI_KeyCombo(i).ControlID).Disabled = False And Control(__UI_KeyCombo(i).ControlID).Hidden = False Then
                If Control(__UI_KeyCombo(i).ControlID).Type = __UI_Type_RadioButton Then
                    SetRadioButtonValue __UI_KeyCombo(i).ControlID
                ElseIf Control(__UI_KeyCombo(i).ControlID).Type = __UI_Type_CheckBox Or Control(__UI_KeyCombo(i).ControlID).Type = __UI_Type_ToggleSwitch Then
                    Control(__UI_KeyCombo(i).ControlID).Value = Not Control(__UI_KeyCombo(i).ControlID).Value
                    __UI_ValueChanged __UI_KeyCombo(i).ControlID
                    Control(__UI_KeyCombo(i).ControlID).LastChange = Timer
                ElseIf Control(__UI_KeyCombo(i).ControlID).Type = __UI_Type_MenuItem Then
                    If Control(__UI_KeyCombo(i).ControlID).BulletStyle = __UI_Bullet Then SetRadioButtonValue __UI_KeyCombo(i).ControlID
                End If
                __UI_Click __UI_KeyCombo(i).ControlID
            End If
            Exit Sub
        End If
    End If
    If Not __UI_DesignMode Then
        If __UI_AltIsDown And Control(__UI_Focus).Type = __UI_Type_MenuBar Then
            __UI_Focus = __UI_PreviousFocus
            __UI_AltIsDown = False
            __UI_ForceRedraw = True 'Trigger a global redraw
        ElseIf __UI_AltIsDown And __UI_TotalActiveMenus > 0 Then
            __UI_Focus = __UI_PreviousFocus
            __UI_CloseAllMenus
            __UI_ForceRedraw = True
            __UI_KeyHit = 0
            __UI_AltIsDown = False
        ElseIf __UI_AltIsDown Then
            If Not __UI_ShowHotKeys Then
                __UI_ShowHotKeys = True
                __UI_ForceRedraw = True 'Trigger a global redraw
            End If
            Select Case __UI_KeyHit
                Case 48 To 57, 65 To 90, 97 To 122 'Alphanumeric
                    __UI_AltCombo$ = __UI_AltCombo$ + Chr$(__UI_KeyHit)
                    If __UI_KeyHit >= 97 Then __UI_KeyHit = __UI_KeyHit - 32 'Turn to capitals
                    If __UI_KeyHit > 0 Then
                        For i = 1 To UBound(Control)
                            If Control(i).HotKey = __UI_KeyHit And Not Control(i).Disabled And Control(i).Type <> __UI_Type_MenuItem Then
                                Select Case Control(i).Type
                                    Case __UI_Type_Button
                                        If Control(i).CanHaveFocus Then __UI_Focus = Control(i).ID
                                        __UI_Click Control(i).ID
                                    Case __UI_Type_RadioButton
                                        If Control(i).CanHaveFocus Then __UI_Focus = Control(i).ID
                                        SetRadioButtonValue Control(i).ID
                                        __UI_Click Control(i).ID
                                    Case __UI_Type_CheckBox
                                        If Control(i).CanHaveFocus Then __UI_Focus = Control(i).ID
                                        Control(i).Value = Not Control(i).Value
                                        __UI_Click Control(i).ID
                                        __UI_ValueChanged Control(i).ID
                                    Case __UI_Type_Frame
                                        For j = i + 1 To UBound(Control)
                                            If Control(j).ParentID = Control(i).ID And Control(j).CanHaveFocus And Not Control(j).Disabled Then
                                                __UI_Focus = Control(j).ID
                                                Exit For
                                            End If
                                        Next
                                    Case __UI_Type_Label
                                        For j = i + 1 To UBound(Control)
                                            If Control(j).ParentID = Control(i).ParentID And Control(j).CanHaveFocus And Not Control(j).Disabled Then
                                                __UI_Focus = Control(j).ID
                                                Exit For
                                            End If
                                        Next
                                    Case __UI_Type_MenuBar
                                        If __UI_TotalActiveMenus = 0 Then
                                            __UI_PreviousFocus = __UI_Focus
                                            __UI_ActivateMenu Control(i), True
                                            __UI_ForceRedraw = True
                                            Control(__UI_ActiveMenu(__UI_TotalActiveMenus)).Value = __UI_Focus
                                            __UI_KeyHit = 0
                                            __UI_AltIsDown = False
                                        End If
                                End Select
                                Exit For
                            End If
                        Next
                    End If
                    __UI_KeyHit = 0
            End Select
        Else
            If __UI_ShowHotKeys Then
                __UI_ShowHotKeys = False
                __UI_ForceRedraw = True 'Trigger a global redraw
                If Len(__UI_AltCombo$) Then
                    If Val(__UI_AltCombo$) >= 32 And Val(__UI_AltCombo$) <= 254 Then
                        __UI_KeyHit = Val(__UI_AltCombo$)
                    End If
                    __UI_AltCombo$ = ""
                Else
                    If __UI_HasMenuBar And __UI_ActiveDropdownList = 0 Then
                        __UI_PreviousFocus = __UI_Focus
                        __UI_Focus = __UI_FirstMenuBarControl
                    End If
                End If
            End If
        End If
    End If
    If __UI_DesignMode Then
        If __UI_KeyHit = 27 Then
            For i = 1 To UBound(Control)
                Control(i).ControlIsSelected = False
            Next
            __UI_TotalSelectedControls = 0
            __UI_FirstSelectedID = 0
        End If
    End If
    If __UI_Focus > 0 And __UI_KeyHit <> 0 And __UI_DesignMode = False Then
        __UI_KeyPress __UI_Focus
        __UI_KeyboardFocus = True
        If __UI_IsDragging = False And __UI_KeyHit = -13 And Not Control(__UI_Focus).Disabled Then
            If Control(__UI_Focus).Type = __UI_Type_Button Or Control(__UI_Focus).Type = __UI_Type_MenuItem Then
                i = __UI_Focus
                If Control(__UI_Focus).Type = __UI_Type_MenuItem Then
                    If Control(__UI_Focus).SubMenu Then
                        __UI_ActivateMenu Control(__UI_Focus), True
                    Else
                        __UI_Focus = __UI_PreviousFocus
                        __UI_CloseAllMenus
                        __UI_ForceRedraw = True
                        __UI_KeyHit = 0
                    End If
                End If
                __UI_HoveringID = i
                GoTo ProcessClick
            ElseIf Control(__UI_Focus).Type = __UI_Type_ListBox And __UI_Focus = __UI_ActiveDropdownList Then
                __UI_Focus = __UI_ParentDropdownList
                Control(__UI_ParentDropdownList).Value = Control(__UI_ActiveDropdownList).Value
                __UI_DestroyControl Control(__UI_ActiveDropdownList)
                If Control(__UI_Focus).PreviousValue <> Control(__UI_Focus).Value Then
                    __UI_ValueChanged __UI_Focus
                    Control(__UI_Focus).PreviousValue = Control(__UI_Focus).Value
                    Control(__UI_Focus).Redraw = True
                End If
            ElseIf Control(__UI_Focus).Type = __UI_Type_MenuBar Then
                __UI_ActivateMenu Control(__UI_Focus), True
            ElseIf Control(__UI_Focus).Type = __UI_Type_TextBox And Control(__UI_Focus).Multiline Then
            ElseIf __UI_Focus <> __UI_DefaultButtonID And __UI_DefaultButtonID > 0 Then
                __UI_Click __UI_DefaultButtonID
            End If
        Else
            Select Case Control(__UI_Focus).Type
                Case __UI_Type_TrackBar
                    Select Case __UI_KeyHit
                        Case 19200 'Left
                            If Control(__UI_Focus).Value > Control(__UI_Focus).Min Then
                                If __UI_CtrlIsDown Then
                                    If Control(__UI_Focus).MinInterval > 0 And Control(__UI_Focus).MinInterval < Control(__UI_Focus).Interval Then
                                        Control(__UI_Focus).Value = Control(__UI_Focus).Value - Control(__UI_Focus).MinInterval
                                    Else
                                        Control(__UI_Focus).Value = Control(__UI_Focus).Value - Control(__UI_Focus).Interval
                                    End If
                                Else
                                    Control(__UI_Focus).Value = Control(__UI_Focus).Value - Control(__UI_Focus).Interval
                                End If
                                IF Control(__UI_Focus).Value < Control(__UI_Focus).Min THEN _
                                    Control(__UI_Focus).Value = Control(__UI_Focus).Min
                            End If
                        Case 19712 'Right
                            If Control(__UI_Focus).Value < Control(__UI_Focus).Max Then
                                If __UI_CtrlIsDown Then
                                    Control(__UI_Focus).Value = Control(__UI_Focus).Value + Control(__UI_Focus).MinInterval
                                Else
                                    Control(__UI_Focus).Value = Control(__UI_Focus).Value + Control(__UI_Focus).Interval
                                End If
                                IF Control(__UI_Focus).Value > Control(__UI_Focus).Max THEN _
                                    Control(__UI_Focus).Value = Control(__UI_Focus).Max
                            End If
                        Case 18176 'Home
                            Control(__UI_Focus).Value = Control(__UI_Focus).Min
                        Case 20224 'End
                            Control(__UI_Focus).Value = Control(__UI_Focus).Max
                    End Select
                Case __UI_Type_MenuBar
                    Select Case __UI_KeyHit
                        Case 48 To 57, 65 To 90, 97 To 122 'Alphanumeric
                            If __UI_KeyHit >= 97 Then __UI_KeyHit = __UI_KeyHit - 32 'Turn to capitals
                            If __UI_CtrlIsDown = False Then
                                For i = 1 To UBound(Control)
                                    If Control(i).HotKey = __UI_KeyHit And Not Control(i).Disabled And Control(i).Type = __UI_Type_MenuBar Then
                                        If __UI_TotalActiveMenus = 0 Then
                                            __UI_ActivateMenu Control(i), True
                                            Control(__UI_ActiveMenu(__UI_TotalActiveMenus)).Value = __UI_Focus
                                            __UI_ForceRedraw = True
                                            __UI_KeyHit = 0
                                        End If
                                        Exit For
                                    End If
                                Next
                            End If
                        Case 27 'Esc
                            __UI_Focus = __UI_PreviousFocus
                            __UI_KeyHit = 0
                        Case 19200 'Left
                            __UI_Focus = __UI_PreviousMenuBarControl(__UI_Focus)
                        Case 19712 'Right
                            __UI_Focus = __UI_NextMenuBarControl(__UI_Focus)
                        Case 18432, 20480 'Up, down
                            __UI_ActivateMenu Control(__UI_Focus), True
                            __UI_KeyHit = 0
                    End Select
                Case __UI_Type_MenuPanel, __UI_Type_MenuItem
                    HandleDesignMenu:
                    Select Case __UI_KeyHit
                        Case 48 To 57, 65 To 90, 97 To 122 'Alphanumeric
                            If __UI_CtrlIsDown = False Then
                                If __UI_KeyHit >= 97 Then __UI_KeyHit = __UI_KeyHit - 32 'Turn to capitals
                                For i = 1 To UBound(Control)
                                    If Control(i).HotKey = __UI_KeyHit And Not Control(i).Disabled And Control(i).Type = __UI_Type_MenuItem And Control(i).ParentID = __UI_ParentMenu(__UI_TotalActiveMenus) Then
                                        If Left$(Control(i).Name, 5) = "__UI_" Then
                                            __UI_HoveringID = i
                                            GoTo ProcessHotkey
                                        Else
                                            If Control(i).SubMenu Then
                                                __UI_KeyHit = 0
                                                __UI_Focus = Control(i).ID
                                                __UI_ForceRedraw = True
                                                _Delay .1
                                                __UI_ActivateMenu Control(i), True
                                            Else
                                                __UI_Focus = __UI_PreviousFocus
                                                __UI_CloseAllMenus
                                                __UI_ForceRedraw = True
                                                __UI_KeyHit = 0
                                                __UI_Click i
                                            End If
                                        End If
                                        Exit For
                                    End If
                                Next
                            End If
                        Case 27 'Esc
                            If __UI_TotalActiveMenus > 1 Then
                                __UI_Focus = __UI_ParentMenu(__UI_TotalActiveMenus)
                                __UI_DestroyControl Control(__UI_ActiveMenu(__UI_TotalActiveMenus))
                            ElseIf __UI_TotalActiveMenus = 1 Then
                                __UI_Focus = __UI_ParentMenu(__UI_TotalActiveMenus)
                                __UI_CloseAllMenus
                            ElseIf __UI_TotalActiveMenus > 0 And __UI_ActiveMenuIsContextMenu Then
                                __UI_CloseAllMenus
                                __UI_Focus = __UI_PreviousFocus
                            End If
                            __UI_KeyHit = 0
                        Case 19200 'Left
                            If __UI_TotalActiveMenus > 1 Then
                                __UI_Focus = __UI_ParentMenu(__UI_TotalActiveMenus)
                                __UI_DestroyControl Control(__UI_ActiveMenu(__UI_TotalActiveMenus))
                            ElseIf __UI_TotalActiveMenus = 1 Then
                                If __UI_ActiveMenuIsContextMenu = False Then
                                    __UI_CloseAllMenus
                                    __UI_ActivateMenu Control(__UI_PreviousMenuBarControl(__UI_TopMenuBarItem)), True
                                    __UI_ForceRedraw = True
                                End If
                            End If
                            __UI_KeyHit = 0
                        Case 19712 'Right
                            If Control(__UI_Focus).SubMenu Then
                                __UI_ActivateMenu Control(__UI_Focus), True
                            Else
                                If __UI_ActiveMenuIsContextMenu = False Then
                                    __UI_CloseAllMenus
                                    __UI_ActivateMenu Control(__UI_NextMenuBarControl(__UI_TopMenuBarItem)), True
                                    __UI_ForceRedraw = True
                                End If
                            End If
                            __UI_KeyHit = 0
                        Case 18432 'Up
                            __UI_Focus = __UI_PreviousMenuItem(__UI_Focus)
                            Control(__UI_ActiveMenu(__UI_TotalActiveMenus)).Value = Control(__UI_Focus).ID
                        Case 20480 'Down
                            __UI_Focus = __UI_NextMenuItem(__UI_Focus)
                            Control(__UI_ActiveMenu(__UI_TotalActiveMenus)).Value = Control(__UI_Focus).ID
                    End Select
                Case __UI_Type_Button, __UI_Type_RadioButton, __UI_Type_CheckBox, __UI_Type_ToggleSwitch
                    Select Case __UI_KeyHit
                        Case 32
                            If __UI_IsDragging = False And Not Control(__UI_Focus).Disabled Then
                                If __UI_KeyIsDown = False And __UI_KeyDownOnID = 0 Then
                                    __UI_KeyDownOnID = __UI_Focus
                                    __UI_KeyIsDown = True
                                End If
                            End If
                        Case -32
                            If __UI_IsDragging = False And Not Control(__UI_Focus).Disabled Then
                                If __UI_KeyIsDown And __UI_Focus = __UI_KeyDownOnID Then
                                    If Control(__UI_KeyDownOnID).Type = __UI_Type_RadioButton Then
                                        SetRadioButtonValue __UI_KeyDownOnID
                                    ELSEIF Control(__UI_KeyDownOnID).Type = __UI_Type_CheckBox OR _
                                           Control(__UI_KeyDownOnID).Type = __UI_Type_ToggleSwitch THEN
                                        Control(__UI_KeyDownOnID).Value = Not Control(__UI_KeyDownOnID).Value
                                        __UI_ValueChanged __UI_KeyDownOnID
                                        Control(__UI_KeyDownOnID).LastChange = Timer
                                    End If
                                    __UI_KeyDownOnID = 0
                                    __UI_KeyIsDown = False
                                    __UI_Click __UI_Focus
                                End If
                            End If
                        Case 18432, 20480 'Up, down
                            If (Control(__UI_Focus).Type = __UI_Type_RadioButton Or Control(__UI_Focus).Type = __UI_Type_CheckBox) Then
                                __UI_FocusSearch = __UI_Focus
                                Do
                                    If _KeyDown(100304) Or _KeyDown(100303) Then
                                        __UI_FocusSearch = (__UI_FocusSearch + UBound(Control) - 2) Mod UBound(Control) + 1
                                    Else
                                        __UI_FocusSearch = __UI_FocusSearch Mod UBound(Control) + 1
                                    End If
                                    If __UI_FocusSearch = __UI_Focus Then
                                        Exit Do
                                    End If
                                    If Control(__UI_FocusSearch).CanHaveFocus And Not Control(__UI_FocusSearch).Disabled And Control(__UI_Focus).Type = Control(__UI_FocusSearch).Type Then
                                        __UI_KeepFocus = False: __UI_FocusOut __UI_Focus
                                        If __UI_KeepFocus = False Then
                                            __UI_Focus = __UI_FocusSearch
                                            __UI_FocusIn __UI_Focus
                                            If Control(__UI_FocusSearch).Type = __UI_Type_RadioButton Then SetRadioButtonValue __UI_Focus
                                        End If
                                        Exit Do
                                    End If
                                Loop
                            End If
                    End Select
                Case __UI_Type_ListBox, __UI_Type_DropdownList
                    If Not Control(__UI_Focus).Disabled And Control(__UI_Focus).Max > 0 Then
                        _Font (Control(__UI_Focus).Font)
                        Select EveryCase __UI_KeyHit
                            Case 32 To 254 'Printable ASCII characters
                                Dim CurrentItem%
                                CurrentItem% = Control(__UI_Focus).Value
                                __UI_ListBoxSearchItem Control(__UI_Focus)
                                If CurrentItem% <> Control(__UI_Focus).Value Then
                                    If Control(__UI_Focus).Value < Control(__UI_Focus).InputViewStart Then
                                        Control(__UI_Focus).InputViewStart = Control(__UI_Focus).Value
                                    ElseIf Control(__UI_Focus).Value > Control(__UI_Focus).InputViewStart + Control(__UI_Focus).LastVisibleItem - 1 Then
                                        Control(__UI_Focus).InputViewStart = Control(__UI_Focus).Value - Control(__UI_Focus).LastVisibleItem + 1
                                    End If
                                End If
                            Case 18432 'Up
                                If Control(__UI_Focus).Value > 1 Then
                                    Control(__UI_Focus).Value = Control(__UI_Focus).Value - 1
                                    If Control(__UI_Focus).PreviousValue <> Control(__UI_Focus).Value Then
                                        __UI_ValueChanged __UI_Focus
                                        Control(__UI_Focus).PreviousValue = Control(__UI_Focus).Value
                                        Control(__UI_Focus).Redraw = True
                                    End If
                                End If
                            Case 20480 'Down
                                If __UI_AltIsDown Then
                                    If Control(__UI_Focus).Type = __UI_Type_DropdownList Then
                                        __UI_ActivateDropdownlist Control(__UI_Focus)
                                    End If
                                Else
                                    If Control(__UI_Focus).Value < Control(__UI_Focus).Max Then
                                        Control(__UI_Focus).Value = Control(__UI_Focus).Value + 1
                                        If Control(__UI_Focus).PreviousValue <> Control(__UI_Focus).Value Then
                                            __UI_ValueChanged __UI_Focus
                                            Control(__UI_Focus).PreviousValue = Control(__UI_Focus).Value
                                            Control(__UI_Focus).Redraw = True
                                        End If
                                    End If
                                End If
                            Case 18688 'Page up
                                Control(__UI_Focus).Value = Control(__UI_Focus).Value - Control(__UI_Focus).LastVisibleItem
                                If Control(__UI_Focus).Value < 1 Then Control(__UI_Focus).Value = 1
                                If Control(__UI_Focus).PreviousValue <> Control(__UI_Focus).Value Then
                                    __UI_ValueChanged __UI_Focus
                                    Control(__UI_Focus).PreviousValue = Control(__UI_Focus).Value
                                    Control(__UI_Focus).Redraw = True
                                End If
                            Case 20736 'Page down
                                If Control(__UI_Focus).Value < Control(__UI_Focus).Max - Control(__UI_Focus).LastVisibleItem Then
                                    Control(__UI_Focus).Value = Control(__UI_Focus).Value + Control(__UI_Focus).LastVisibleItem - 1
                                Else
                                    Control(__UI_Focus).Value = Control(__UI_Focus).Max
                                End If
                                If Control(__UI_Focus).PreviousValue <> Control(__UI_Focus).Value Then
                                    __UI_ValueChanged __UI_Focus
                                    Control(__UI_Focus).PreviousValue = Control(__UI_Focus).Value
                                    Control(__UI_Focus).Redraw = True
                                End If
                            Case 18176 'Home
                                Control(__UI_Focus).Value = 1
                                If Control(__UI_Focus).PreviousValue <> Control(__UI_Focus).Value Then
                                    __UI_ValueChanged __UI_Focus
                                    Control(__UI_Focus).PreviousValue = Control(__UI_Focus).Value
                                    Control(__UI_Focus).Redraw = True
                                End If
                            Case 20224 'End
                                Control(__UI_Focus).Value = Control(__UI_Focus).Max
                                If Control(__UI_Focus).PreviousValue <> Control(__UI_Focus).Value Then
                                    __UI_ValueChanged __UI_Focus
                                    Control(__UI_Focus).PreviousValue = Control(__UI_Focus).Value
                                    Control(__UI_Focus).Redraw = True
                                End If
                            Case 18432, 20480, 18688, 20736, 18176, 20224
                                If Control(__UI_Focus).Value < Control(__UI_Focus).InputViewStart Then
                                    Control(__UI_Focus).InputViewStart = Control(__UI_Focus).Value
                                ElseIf Control(__UI_Focus).Value > Control(__UI_Focus).InputViewStart + Control(__UI_Focus).LastVisibleItem - 1 Then
                                    Control(__UI_Focus).InputViewStart = Control(__UI_Focus).Value - Control(__UI_Focus).LastVisibleItem + 1
                                End If
                        End Select
                    End If
                Case __UI_Type_TextBox
                    Dim Clip$, FindLF&
                    Dim s1 As Long, s2 As Long
                    If Not Control(__UI_Focus).Disabled Then
                        Select EveryCase __UI_KeyHit
                            Case 32 To 254 'Printable ASCII characters
                                If __UI_KeyHit = Asc("v") Or __UI_KeyHit = Asc("V") Then 'Paste from clipboard (Ctrl+V)
                                    If __UI_CtrlIsDown Then
                                        PasteIntoTextBox:
                                        If Control(__UI_Focus).Multiline Then
                                            Clip$ = Replace(_Clipboard$, Chr$(13) + Chr$(10), Chr$(10), False, 0)
                                            If Len(Clip$) > 0 Then
                                                If Not Control(__UI_Focus).TextIsSelected Then
                                                    If Control(__UI_Focus).Cursor = Len(Text(__UI_Focus)) Then
                                                        Text(__UI_Focus) = Text(__UI_Focus) + Clip$
                                                        Control(__UI_Focus).Cursor = Len(Text(__UI_Focus))
                                                    Else
                                                        Text(__UI_Focus) = Left$(Text(__UI_Focus), Control(__UI_Focus).Cursor) + Clip$ + Mid$(Text(__UI_Focus), Control(__UI_Focus).Cursor + 1)
                                                        Control(__UI_Focus).Cursor = Control(__UI_Focus).Cursor + Len(Clip$)
                                                    End If
                                                Else
                                                End If
                                                __UI_TextChanged __UI_Focus
                                                If Control(__UI_Focus).NumericOnly Then
                                                    Control(__UI_Focus).Value = Val(Text(__UI_Focus))
                                                    __UI_ValidateBounds __UI_Focus
                                                End If
                                            End If
                                            If ContextMenuPaste Then
                                                ContextMenuPaste = False
                                                Return
                                            End If
                                            __UI_KeyHit = 0
                                        Else
                                            Clip$ = _Clipboard$
                                            FindLF& = InStr(Clip$, Chr$(13))
                                            If FindLF& > 0 Then Clip$ = Left$(Clip$, FindLF& - 1)
                                            FindLF& = InStr(Clip$, Chr$(10))
                                            If FindLF& > 0 Then Clip$ = Left$(Clip$, FindLF& - 1)
                                            If Len(Clip$) > 0 Then
                                                If Len(Mask(__UI_Focus)) > 0 Then
                                                    Dim NumericClip$
                                                    NumericClip$ = ""
                                                    For i = 1 To Len(Clip$)
                                                        If Asc(Clip$, i) >= 48 And Asc(Clip$, i) <= 57 Then
                                                            NumericClip$ = NumericClip$ + Chr$(Asc(Clip$, i))
                                                        End If
                                                    Next
                                                    If Len(NumericClip$) Then
                                                        Text(__UI_Focus) = ""
                                                        For i = 1 To Len(Mask(__UI_Focus))
                                                            Select Case Mid$(Mask(__UI_Focus), i, 1)
                                                                Case "0", "9", "#"
                                                                    If Len(NumericClip$) Then
                                                                        Text(__UI_Focus) = Text(__UI_Focus) + Left$(NumericClip$, 1)
                                                                        NumericClip$ = Mid$(NumericClip$, 2)
                                                                    Else
                                                                        Text(__UI_Focus) = Text(__UI_Focus) + "_"
                                                                    End If
                                                                Case Else
                                                                    Text(__UI_Focus) = Text(__UI_Focus) + Mid$(Mask(__UI_Focus), i, 1)
                                                            End Select
                                                        Next
                                                    End If
                                                Else
                                                    If Control(__UI_Focus).NumericOnly Then
                                                        If Not isNumber(Clip$) Then Clip$ = ""
                                                    End If
                                                    If Len(Clip$) Then
                                                        If Not Control(__UI_Focus).TextIsSelected Then
                                                            If Control(__UI_Focus).Cursor = Len(Text(__UI_Focus)) Then
                                                                Text(__UI_Focus) = Text(__UI_Focus) + Clip$
                                                                Control(__UI_Focus).Cursor = Len(Text(__UI_Focus))
                                                            Else
                                                                Text(__UI_Focus) = Left$(Text(__UI_Focus), Control(__UI_Focus).Cursor) + Clip$ + Mid$(Text(__UI_Focus), Control(__UI_Focus).Cursor + 1)
                                                                Control(__UI_Focus).Cursor = Control(__UI_Focus).Cursor + Len(Clip$)
                                                            End If
                                                        Else
                                                            s1 = Control(__UI_Focus).SelectionStart
                                                            s2 = Control(__UI_Focus).Cursor
                                                            If s1 > s2 Then Swap s1, s2
                                                            Text(__UI_Focus) = Left$(Text(__UI_Focus), s1) + Clip$ + Mid$(Text(__UI_Focus), s2 + 1)
                                                            Control(__UI_Focus).Cursor = s1 + Len(Clip$)
                                                            Control(__UI_Focus).TextIsSelected = False
                                                            __UI_FillSelectedText 0, 0
                                                        End If
                                                    End If
                                                End If
                                                __UI_TextChanged __UI_Focus
                                                If Control(__UI_Focus).NumericOnly Then
                                                    Control(__UI_Focus).Value = Val(Text(__UI_Focus))
                                                    __UI_ValidateBounds __UI_Focus
                                                End If
                                            End If
                                            If ContextMenuPaste Then
                                                ContextMenuPaste = False
                                                Return
                                            End If
                                            __UI_KeyHit = 0
                                        End If
                                    End If
                                ElseIf __UI_KeyHit = Asc("c") Or __UI_KeyHit = Asc("C") Then 'Copy selection to clipboard (Ctrl+C)
                                    If __UI_CtrlIsDown Then
                                        __UI_FillSelectedText 0, 0
                                        If Len(__UI_SelectedText) > 0 Then _Clipboard$ = __UI_SelectedText
                                        __UI_KeyHit = 0
                                    End If
                                ElseIf __UI_KeyHit = Asc("x") Or __UI_KeyHit = Asc("X") Then 'Cut selection to clipboard (Ctrl+X)
                                    If __UI_CtrlIsDown Then
                                        __UI_FillSelectedText 0, 0
                                        If Len(__UI_SelectedText) > 0 Then
                                            _Clipboard$ = __UI_SelectedText
                                            __UI_DeleteSelection
                                            __UI_TextChanged __UI_Focus
                                            If Control(__UI_Focus).NumericOnly Then
                                                Control(__UI_Focus).Value = Val(Text(__UI_Focus))
                                                __UI_ValidateBounds __UI_Focus
                                            End If
                                        End If
                                        __UI_KeyHit = 0
                                    End If
                                ElseIf __UI_KeyHit = Asc("a") Or __UI_KeyHit = Asc("A") Then 'Select all text (Ctrl+A)
                                    If __UI_CtrlIsDown Then
                                        Control(__UI_Focus).Cursor = Len(Text(__UI_Focus))
                                        Control(__UI_Focus).SelectionStart = 0
                                        Control(__UI_Focus).TextIsSelected = True
                                        __UI_KeyHit = 0
                                    End If
                                End If
                                If Control(__UI_Focus).NumericOnly Then
                                    If __UI_KeyHit = 45 Then
                                        If InStr(Text(__UI_Focus), "-") > 0 Then
                                            If InStr(__UI_SelectedText, "-") = 0 Then
                                                __UI_KeyHit = 0
                                            End If
                                        Else
                                            If (Control(__UI_Focus).Cursor > 0 And Control(__UI_Focus).TextIsSelected = False) Then
                                                __UI_KeyHit = 0
                                            End If
                                        End If
                                    ElseIf __UI_KeyHit = 46 Then
                                        If InStr(Text(__UI_Focus), ".") > 0 Then
                                            If InStr(__UI_SelectedText, ".") = 0 Then
                                                __UI_KeyHit = 0
                                            End If
                                        Else
                                            If Control(__UI_Focus).Cursor = 0 And Left$(Text(__UI_Focus), 1) = "-" Then
                                                __UI_KeyHit = 0
                                            End If
                                        End If
                                    ElseIf __UI_KeyHit < 48 Or __UI_KeyHit > 57 Then
                                        __UI_KeyHit = 0
                                    End If
                                End If
                                If __UI_KeyHit Then
                                    If __UI_KeyHit = 13 Then __UI_KeyHit = 10
                                    If Mask(__UI_Focus) = "" Or Control(__UI_Focus).Multiline Then
                                        If Not Control(__UI_Focus).TextIsSelected Then
                                            If Control(__UI_Focus).Cursor = Len(Text(__UI_Focus)) Then
                                                If (Control(__UI_Focus).Max > 0 And Len(Text(__UI_Focus)) < Control(__UI_Focus).Max) Or Control(__UI_Focus).Max = 0 Then
                                                    Text(__UI_Focus) = Text(__UI_Focus) + Chr$(__UI_KeyHit)
                                                    Control(__UI_Focus).Cursor = Control(__UI_Focus).Cursor + Len(Chr$(__UI_KeyHit))
                                                End If
                                            Else
                                                If (Control(__UI_Focus).Max > 0 And Len(Text(__UI_Focus)) < Control(__UI_Focus).Max) Or Control(__UI_Focus).Max = 0 Then
                                                    Text(__UI_Focus) = Left$(Text(__UI_Focus), Control(__UI_Focus).Cursor) + Chr$(__UI_KeyHit) + Mid$(Text(__UI_Focus), Control(__UI_Focus).Cursor + 1)
                                                    Control(__UI_Focus).Cursor = Control(__UI_Focus).Cursor + 1
                                                End If
                                            End If
                                        Else
                                            s1 = Control(__UI_Focus).SelectionStart
                                            s2 = Control(__UI_Focus).Cursor
                                            If s1 > s2 Then Swap s1, s2
                                            Text(__UI_Focus) = Left$(Text(__UI_Focus), s1) + Chr$(__UI_KeyHit) + Mid$(Text(__UI_Focus), s2 + 1)
                                            Control(__UI_Focus).TextIsSelected = False
                                            __UI_SelectedText = ""
                                            __UI_SelectionLength = 0
                                            Control(__UI_Focus).Cursor = s1 + 1
                                        End If
                                    Else
                                        If Control(__UI_Focus).TextIsSelected Then
                                            __UI_DeleteSelectionMasked
                                        End If
                                        If __UI_KeyHit >= 48 And __UI_KeyHit <= 57 Then
                                            Do
                                                Select Case Mid$(Mask(__UI_Focus), Control(__UI_Focus).Cursor + 1, 1)
                                                    Case "0", "9", "#"
                                                        Mid$(Text(__UI_Focus), Control(__UI_Focus).Cursor + 1, 1) = Chr$(__UI_KeyHit)
                                                        Control(__UI_Focus).Cursor = Control(__UI_Focus).Cursor + 1
                                                        Exit Do
                                                    Case Else
                                                        If Control(__UI_Focus).Cursor < Len(Mask(__UI_Focus)) Then
                                                            Control(__UI_Focus).Cursor = Control(__UI_Focus).Cursor + 1
                                                        Else
                                                            Exit Do
                                                        End If
                                                End Select
                                            Loop
                                        End If
                                    End If
                                    __UI_TextChanged __UI_Focus
                                    If Control(__UI_Focus).NumericOnly Then
                                        Control(__UI_Focus).Value = Val(Text(__UI_Focus))
                                        __UI_ValidateBounds __UI_Focus
                                    End If
                                End If
                            Case 8 'Backspace
                                If Mask(__UI_Focus) = "" Or Control(__UI_Focus).Multiline Then
                                    If Len(Text(__UI_Focus)) > 0 Then
                                        If Not Control(__UI_Focus).TextIsSelected Then
                                            If Control(__UI_Focus).Cursor = Len(Text(__UI_Focus)) Then
                                                If Control(__UI_Focus).Multiline And Right$(Text(__UI_Focus), 1) = Chr$(10) Then
                                                    Control(__UI_Focus).CurrentLine = Control(__UI_Focus).CurrentLine - 1
                                                End If
                                                Text(__UI_Focus) = Left$(Text(__UI_Focus), Len(Text(__UI_Focus)) - 1)
                                                Control(__UI_Focus).Cursor = Control(__UI_Focus).Cursor - 1
                                            ElseIf Control(__UI_Focus).Cursor >= 1 Then
                                                If Control(__UI_Focus).Multiline And Mid$(Text(__UI_Focus), Control(__UI_Focus).Cursor, 1) = Chr$(10) Then
                                                    Control(__UI_Focus).CurrentLine = Control(__UI_Focus).CurrentLine - 1
                                                End If
                                                Text(__UI_Focus) = Left$(Text(__UI_Focus), Control(__UI_Focus).Cursor - 1) + Mid$(Text(__UI_Focus), Control(__UI_Focus).Cursor + 1)
                                                Control(__UI_Focus).Cursor = Control(__UI_Focus).Cursor - 1
                                            End If
                                        Else
                                            __UI_DeleteSelection
                                        End If
                                        __UI_TextChanged __UI_Focus
                                        If Control(__UI_Focus).NumericOnly Then
                                            Control(__UI_Focus).Value = Val(Text(__UI_Focus))
                                            __UI_ValidateBounds __UI_Focus
                                        End If
                                    End If
                                Else
                                    If Not Control(__UI_Focus).TextIsSelected Then
                                        If Control(__UI_Focus).Cursor = Len(Text(__UI_Focus)) Then
                                            Text(__UI_Focus) = Left$(Text(__UI_Focus), Len(Text(__UI_Focus)) - 1)
                                            Control(__UI_Focus).Cursor = Control(__UI_Focus).Cursor - 1
                                        ElseIf Control(__UI_Focus).Cursor >= 1 Then
                                            If Control(__UI_Focus).Multiline And Mid$(Text(__UI_Focus), Control(__UI_Focus).Cursor, 1) = Chr$(10) Then
                                                Control(__UI_Focus).CurrentLine = Control(__UI_Focus).CurrentLine - 1
                                            End If
                                            Text(__UI_Focus) = Left$(Text(__UI_Focus), Control(__UI_Focus).Cursor - 1) + Mid$(Text(__UI_Focus), Control(__UI_Focus).Cursor + 1)
                                            Control(__UI_Focus).Cursor = Control(__UI_Focus).Cursor - 1
                                        End If
                                        Text(__UI_Focus) = __UI_MaskToText$(__UI_Focus)
                                    Else
                                        __UI_DeleteSelectionMasked
                                    End If
                                    __UI_TextChanged __UI_Focus
                                    If Control(__UI_Focus).NumericOnly Then
                                        Control(__UI_Focus).Value = Val(Text(__UI_Focus))
                                        __UI_ValidateBounds __UI_Focus
                                    End If
                                End If
                            Case 21248 'Delete
                                If Len(Mask(__UI_Focus)) = 0 Then
                                    If Not Control(__UI_Focus).TextIsSelected Then
                                        If Len(Text(__UI_Focus)) > 0 Then
                                            If Control(__UI_Focus).Cursor = 0 Then
                                                Text(__UI_Focus) = Right$(Text(__UI_Focus), Len(Text(__UI_Focus)) - 1)
                                            ElseIf Control(__UI_Focus).Cursor > 0 And Control(__UI_Focus).Cursor <= Len(Text(__UI_Focus)) - 1 Then
                                                Text(__UI_Focus) = Left$(Text(__UI_Focus), Control(__UI_Focus).Cursor) + Mid$(Text(__UI_Focus), Control(__UI_Focus).Cursor + 2)
                                            End If
                                            __UI_TextChanged __UI_Focus
                                            If Control(__UI_Focus).NumericOnly Then
                                                Control(__UI_Focus).Value = Val(Text(__UI_Focus))
                                                __UI_ValidateBounds __UI_Focus
                                            End If
                                        End If
                                    Else
                                        __UI_DeleteSelection
                                        __UI_TextChanged __UI_Focus
                                        If Control(__UI_Focus).NumericOnly Then
                                            Control(__UI_Focus).Value = Val(Text(__UI_Focus))
                                            __UI_ValidateBounds __UI_Focus
                                        End If
                                    End If
                                Else
                                    If Not Control(__UI_Focus).TextIsSelected Then
                                        If Len(Text(__UI_Focus)) > 0 Then
                                            If Control(__UI_Focus).Cursor < Len(Text(__UI_Focus)) Then
                                                Mid$(Text(__UI_Focus), Control(__UI_Focus).Cursor + 1, 1) = Mid$(__UI_EmptyMask$(__UI_Focus), Control(__UI_Focus).Cursor + 1, 1)
                                                __UI_TextChanged __UI_Focus
                                                If Control(__UI_Focus).NumericOnly Then
                                                    Control(__UI_Focus).Value = Val(Text(__UI_Focus))
                                                    __UI_ValidateBounds __UI_Focus
                                                End If
                                            End If
                                        End If
                                    Else
                                        __UI_DeleteSelectionMasked
                                        __UI_TextChanged __UI_Focus
                                        If Control(__UI_Focus).NumericOnly Then
                                            Control(__UI_Focus).Value = Val(Text(__UI_Focus))
                                            __UI_ValidateBounds __UI_Focus
                                        End If
                                    End If
                                End If
                            Case 19200 'Left arrow key
                                __UI_CheckSelection __UI_Focus
                                If __UI_CtrlIsDown Then
                                    If Control(__UI_Focus).Cursor > 0 Then
                                        Do
                                            Control(__UI_Focus).Cursor = Control(__UI_Focus).Cursor - 1
                                            If Control(__UI_Focus).Cursor = 0 Then Exit Do
                                        Loop Until InStr(SEP$, Mid$(Text(__UI_Focus), Control(__UI_Focus).Cursor + 1, 1)) = 0
                                        Do
                                            Control(__UI_Focus).Cursor = Control(__UI_Focus).Cursor - 1
                                            If Control(__UI_Focus).Cursor = 0 Then Exit Do
                                        Loop While InStr(SEP$, Mid$(Text(__UI_Focus), Control(__UI_Focus).Cursor + 1, 1)) = 0
                                        Control(__UI_Focus).Cursor = Control(__UI_Focus).Cursor + 1
                                    End If
                                Else
                                    If Control(__UI_Focus).Cursor > 0 Then Control(__UI_Focus).Cursor = Control(__UI_Focus).Cursor - 1
                                End If
                                If Mid$(Text(__UI_Focus), Control(__UI_Focus).Cursor + 1, 1) = Chr$(10) Then Control(__UI_Focus).CurrentLine = Control(__UI_Focus).CurrentLine - 1
                            Case 19712 'Right arrow key
                                __UI_CheckSelection __UI_Focus
                                If __UI_CtrlIsDown Then
                                    If Control(__UI_Focus).Cursor < Len(Text(__UI_Focus)) Then
                                        Do
                                            Control(__UI_Focus).Cursor = Control(__UI_Focus).Cursor + 1
                                            If Control(__UI_Focus).Cursor > Len(Text(__UI_Focus)) Then Exit Do
                                        Loop While InStr(SEP$, Mid$(Text(__UI_Focus), Control(__UI_Focus).Cursor + 1, 1)) = 0
                                        Control(__UI_Focus).Cursor = Control(__UI_Focus).Cursor + 1
                                    End If
                                Else
                                    If Control(__UI_Focus).Cursor < Len(Text(__UI_Focus)) Then Control(__UI_Focus).Cursor = Control(__UI_Focus).Cursor + 1
                                End If
                                If Mid$(Text(__UI_Focus), Control(__UI_Focus).Cursor, 1) = Chr$(10) Then Control(__UI_Focus).CurrentLine = Control(__UI_Focus).CurrentLine + 1
                            Case 18432 'Up arrow key
                                If Control(__UI_Focus).Multiline Then
                                    If Control(__UI_Focus).CurrentLine > 1 Then
                                        Control(__UI_Focus).CurrentLine = Control(__UI_Focus).CurrentLine - 1
                                    End If
                                End If
                            Case 20480 'Down arrow key
                                If Control(__UI_Focus).Multiline Then
                                    If Control(__UI_Focus).CurrentLine < __UI_CountLines(__UI_Focus) Then
                                        Control(__UI_Focus).CurrentLine = Control(__UI_Focus).CurrentLine + 1
                                    End If
                                End If
                            Case 18432, 20480 'For both up and down keys
                                If Control(__UI_Focus).Multiline Then
                                    ThisLineLen = Len(__UI_GetTextBoxLine(__UI_Focus, Control(__UI_Focus).CurrentLine, ThisLineStart))
                                    Control(__UI_Focus).Cursor = ThisLineStart + Control(__UI_Focus).VisibleCursor - 1
                                    If Control(__UI_Focus).Cursor > ThisLineStart + ThisLineLen - 1 Then
                                        Control(__UI_Focus).Cursor = ThisLineStart + ThisLineLen - 1
                                    End If
                                End If
                            Case 18176 'Home
                                __UI_CheckSelection __UI_Focus
                                If Control(__UI_Focus).Multiline Then
                                    If __UI_CtrlIsDown Then
                                        Control(__UI_Focus).Cursor = 0
                                        Control(__UI_Focus).CurrentLine = 1
                                    Else
                                        Control(__UI_Focus).Cursor = Control(__UI_Focus).Cursor - Control(__UI_Focus).VisibleCursor
                                    End If
                                Else
                                    Control(__UI_Focus).Cursor = 0
                                End If
                            Case 20224 'End
                                __UI_CheckSelection __UI_Focus
                                If Control(__UI_Focus).Multiline Then
                                    If __UI_CtrlIsDown Then
                                        Control(__UI_Focus).Cursor = Len(Text(__UI_Focus))
                                        Control(__UI_Focus).CurrentLine = __UI_CountLines(__UI_Focus)
                                    Else
                                        ThisLineLen = Len(__UI_GetTextBoxLine(__UI_Focus, Control(__UI_Focus).CurrentLine, ThisLineStart))
                                        Control(__UI_Focus).Cursor = ThisLineStart + ThisLineLen - 1
                                    End If
                                Else
                                    Control(__UI_Focus).Cursor = Len(Text(__UI_Focus))
                                End If
                        End Select
                        If Control(__UI_Focus).Multiline Then
                            _Font Control(__UI_Focus).Font
                            If Control(__UI_Focus).CurrentLine < Control(__UI_Focus).FirstVisibleLine Then
                                Control(__UI_Focus).FirstVisibleLine = Control(__UI_Focus).CurrentLine
                            ElseIf Control(__UI_Focus).CurrentLine + 1 > Control(__UI_Focus).FirstVisibleLine + Control(__UI_Focus).Height \ uspacing& Then
                                Control(__UI_Focus).FirstVisibleLine = Control(__UI_Focus).CurrentLine - Control(__UI_Focus).Height \ uspacing& + 1
                            End If
                        End If
                    End If
            End Select
        End If
    ElseIf __UI_DesignMode And __UI_KeyHit <> 0 Then 'No buttons will respond while in design mode
        If __UI_TotalActiveMenus > 0 And Left$(Control(__UI_ParentMenu(__UI_TotalActiveMenus)).Name, 5) = "__UI_" Then GoTo HandleDesignMenu
        Select Case __UI_KeyHit
            Case Asc("Z"), Asc("z")
                If __UI_CtrlIsDown Then
                    __UI_KeyPress 214
                End If
            Case Asc("Y"), Asc("y")
                If __UI_CtrlIsDown Then
                    __UI_KeyPress 215
                End If
            Case Asc("A"), Asc("a")
                If __UI_CtrlIsDown Then
                    ControlSelect:
                    __UI_KeyPress 221
                End If
            Case Asc("X"), Asc("x")
                If __UI_CtrlIsDown And __UI_TotalSelectedControls > 0 Then
                    ControlCut:
                    __UI_KeyPress 216
                    __UI_KeyPress 219
                End If
            Case Asc("C"), Asc("c")
                If __UI_CtrlIsDown And __UI_TotalSelectedControls > 0 Then
                    ControlCopy:
                    __UI_KeyPress 217
                End If
            Case Asc("V"), Asc("v")
                If __UI_CtrlIsDown Then
                    ControlPaste:
                    Clip$ = _Clipboard$
                    If Left$(Clip$, Len(__UI_ClipboardCheck$)) = __UI_ClipboardCheck$ Then
                        __UI_KeyPress 218
                    End If
                End If
            Case 21248 'Delete
                ControlDelete:
                __UI_KeyPress 216
                __UI_KeyPress 220
            Case 19200 'Left arrow key
                __UI_KeyPress 216
                For i = 1 To UBound(Control)
                    If Control(i).ControlIsSelected And Control(i).Type <> __UI_Type_MenuBar And Control(i).Type <> __UI_Type_MenuItem Then
                        If __UI_ShiftIsDown Then
                            Control(i).Width = Control(i).Width - 1
                            __UI_IsResizing = True
                            __UI_ResizingID = i
                        Else
                            Control(i).Left = Control(i).Left - 1
                        End If
                    End If
                Next
            Case 19712 'Right arrow key
                __UI_KeyPress 216
                For i = 1 To UBound(Control)
                    If Control(i).ControlIsSelected And Control(i).Type <> __UI_Type_MenuBar And Control(i).Type <> __UI_Type_MenuItem Then
                        If __UI_ShiftIsDown Then
                            Control(i).Width = Control(i).Width + 1
                            __UI_IsResizing = True
                            __UI_ResizingID = i
                        Else
                            Control(i).Left = Control(i).Left + 1
                        End If
                    End If
                Next
            Case 18432 'Up arrow key
                __UI_KeyPress 216
                For i = 1 To UBound(Control)
                    If Control(i).ControlIsSelected And Control(i).Type <> __UI_Type_MenuBar And Control(i).Type <> __UI_Type_MenuItem Then
                        If __UI_ShiftIsDown Then
                            __UI_IsResizing = True
                            __UI_ResizingID = i
                            Control(i).Height = Control(i).Height - 1
                        Else
                            Control(i).Top = Control(i).Top - 1
                        End If
                    End If
                Next
            Case 20480 'Down arrow key
                __UI_KeyPress 216
                For i = 1 To UBound(Control)
                    If Control(i).ControlIsSelected And Control(i).Type <> __UI_Type_MenuBar And Control(i).Type <> __UI_Type_MenuItem Then
                        If __UI_ShiftIsDown Then
                            Control(i).Height = Control(i).Height + 1
                            __UI_IsResizing = True
                            __UI_ResizingID = i
                        Else
                            Control(i).Top = Control(i).Top + 1
                        End If
                    End If
                Next
        End Select
        If __UI_TotalActiveMenus > 0 Then __UI_ActivateMenu Control(__UI_ParentMenu(__UI_TotalActiveMenus)), False
    ElseIf __UI_KeyHit <> 0 Then 'No control has focus
        If __UI_IsDragging = False And __UI_KeyHit = -13 And __UI_DefaultButtonID > 0 Then
            __UI_Click __UI_DefaultButtonID
            __UI_KeyHit = 0
        End If
    End If
    __UI_LastHoveringID = __UI_HoveringID
End Sub
Sub __UI_ValidateBounds (this As Long)
    If Control(this).NumericOnly = __UI_NumericWithBounds Then
        If Control(this).Value < Control(this).Min Then
            Control(this).Value = Control(this).Min
        End If
        If Control(this).Value > Control(this).Max Then
            Control(this).Value = Control(this).Max
        End If
    End If
End Sub
Sub AutoSizeLabel (this As __UI_ControlTYPE)
    Dim tempFont As Long, tempCenter As Integer
    Dim autoWidth As Integer, autoHeight As Integer
    If this.AutoSize = False Then Exit Sub
    If this.WordWrap = False Then
        tempFont = _Font
        _Font this.Font
        autoWidth = __UI_PrintWidth(Caption(this.ID))
        If this.Padding Then autoWidth = autoWidth + this.Padding * 2
        If this.HasBorder Then autoWidth = autoWidth + (__UI_DefaultCaptionIndent + this.BorderSize) * 2
        If this.Width <> autoWidth Or this.Height <> uspacing + 6 Then
            this.Width = autoWidth
            autoHeight = uspacing + 6
            If this.HasBorder Then autoHeight = autoHeight + this.BorderSize * 2
            If this.Height <> autoHeight Then
                tempCenter = this.Top + this.Height / 2
                this.Height = autoHeight
                this.Top = tempCenter - this.Height / 2
            End If
            this.Redraw = True
        End If
        _Font tempFont
    End If
End Sub
Function Darken~& (WhichColor~&, ByHowMuch%)
    Darken~& = _RGB32(_Red32(WhichColor~&) * (ByHowMuch% / 100), _Green32(WhichColor~&) * (ByHowMuch% / 100), _Blue32(WhichColor~&) * (ByHowMuch% / 100))
End Function
Function isNumber%% (__a$)
    Dim i As Long, a As Integer, dp As _Byte, a$
    a$ = LTrim$(RTrim$(__a$))
    If Len(a$) = 0 Then Exit Function
    For i = 1 To Len(a$)
        a = Asc(Mid$(a$, i, 1))
        If a = 45 Then
            If i <> 1 Then Exit Function
            _Continue
        End If
        If a = 46 Then
            If dp = 1 Then Exit Function
            dp = 1
            _Continue
        End If
        If a >= 48 And a <= 57 Then _Continue
        Exit Function
    Next
    isNumber%% = True
End Function
Function RegisterKeyCombo (__Combo$, id As Long)
    Dim i As Long, j As Long, Combo$
    If Control(id).ID = 0 Then Exit Function
    If Len(LTrim$(RTrim$(__Combo$))) = 0 Then
        If id > 0 Then
            For i = 1 To __UI_TotalKeyCombos
                If __UI_KeyCombo(i).ControlID = id Then
                    Control(__UI_KeyCombo(i).ControlID).KeyCombo = 0
                    __UI_KeyCombo(i).ControlID = 0
                    Exit For
                End If
            Next
        End If
        Exit Function
    End If
    Combo$ = UCase$(LTrim$(RTrim$(__Combo$)))
    If InStr(Combo$, "CTRL+") = 0 Then
        If Left$(Combo$, 1) = "F" And (Val(Mid$(Combo$, 2)) >= 1 And Val(Mid$(Combo$, 2)) <= 12) Then
        ElseIf Left$(Combo$, 7) = "SHIFT+F" And (Val(Mid$(Combo$, 8)) >= 1 And Val(Mid$(Combo$, 8)) <= 12) Then
        Else
            Exit Function
        End If
    End If
    For i = 1 To __UI_TotalKeyCombos
        If RTrim$(__UI_KeyCombo(i).Combo) = Combo$ Then
            If __UI_KeyCombo(i).ControlID >= 0 Then
                For j = 1 To __UI_TotalKeyCombos
                    If __UI_KeyCombo(j).ControlID = id Then
                        Control(__UI_KeyCombo(j).ControlID).KeyCombo = 0
                        __UI_KeyCombo(j).ControlID = 0
                    End If
                Next
                Control(__UI_KeyCombo(i).ControlID).KeyCombo = 0
                __UI_KeyCombo(i).ControlID = id
                Control(id).KeyCombo = i
                RegisterKeyCombo = True
                Exit Function
            Else
                Exit Function
            End If
        End If
    Next
    If __UI_TotalKeyCombos + 1 > UBound(__UI_KeyCombo) Then
        ReDim _Preserve __UI_KeyCombo(0 To UBound(__UI_KeyCombo) + 100) As __UI_KeyCombos
    End If
    __UI_TotalKeyCombos = __UI_TotalKeyCombos + 1
    __UI_KeyCombo(__UI_TotalKeyCombos).Combo = Combo$
    __UI_KeyCombo(__UI_TotalKeyCombos).FriendlyCombo = __UI_FriendlyCombo(Combo$)
    For i = 1 To __UI_TotalKeyCombos
        If __UI_KeyCombo(i).ControlID = id Then
            __UI_KeyCombo(i).ControlID = 0
        End If
    Next
    __UI_KeyCombo(__UI_TotalKeyCombos).ControlID = id
    Control(id).KeyCombo = __UI_TotalKeyCombos
    RegisterKeyCombo = True
End Function
Function __UI_FriendlyCombo$ (__Combo$)
    Dim i As Long, isCapital As _Byte
    Dim Combo$
    isCapital = True
    For i = 1 To Len(__Combo$)
        If isCapital Then
            Combo$ = Combo$ + UCase$(Mid$(__Combo$, i, 1))
            isCapital = False
        Else
            Combo$ = Combo$ + LCase$(Mid$(__Combo$, i, 1))
        End If
        If Right$(Combo$, 1) = "+" Then isCapital = True
    Next
    __UI_FriendlyCombo$ = Combo$
End Function
Sub __UI_RestoreFKeys
    Restore __UI_FKeysData
    Dim i As Long
    For i = 1 To 12
        Read __UI_FKey(i)
    Next
    __UI_FKeysData:
    Data 15104,15360,15616,15872,16128,16384
    Data 16640,16896,17152,17408,34048,34304
End Sub
Sub __UI_RestoreImageOriginalSize
    Dim KeepCenterX As Integer, KeepCenterY As Integer
    KeepCenterY = Control(__UI_FirstSelectedID).Top + Control(__UI_FirstSelectedID).Height / 2
    KeepCenterX = Control(__UI_FirstSelectedID).Left + Control(__UI_FirstSelectedID).Width / 2
    Control(__UI_FirstSelectedID).Height = _Height(Control(__UI_FirstSelectedID).HelperCanvas) + Control(__UI_FirstSelectedID).BorderSize * Abs(Control(__UI_FirstSelectedID).HasBorder)
    Control(__UI_FirstSelectedID).Width = _Width(Control(__UI_FirstSelectedID).HelperCanvas) + Control(__UI_FirstSelectedID).BorderSize * Abs(Control(__UI_FirstSelectedID).HasBorder)
    Control(__UI_FirstSelectedID).Top = KeepCenterY - Control(__UI_FirstSelectedID).Height / 2
    Control(__UI_FirstSelectedID).Left = KeepCenterX - Control(__UI_FirstSelectedID).Width / 2
    Control(__UI_FirstSelectedID).Redraw = True
End Sub
Function __UI_MaskToText$ (id As Long)
    Dim i As Long
    Dim Text$
    Text$ = Text(id)
    If Len(Text$) < Len(Mask(id)) Then Text$ = Text$ + Space$(Len(Mask(id)) - Len(Text$))
    For i = 1 To Len(Mask(id))
        Select Case Mid$(Mask(id), i, 1)
            Case "0", "9", "#"
                If Mid$(Text$, i, 1) <> Mid$(Mask(id), i, 1) And Asc(Text$, i) >= 48 And Asc(Text$, i) <= 57 Then
                ElseIf Mid$(Text$, i, 1) <> Mid$(Mask(id), i, 1) Then
                    Mid$(Text$, i, 1) = "_"
                End If
            Case Else
                Mid$(Text$, i, 1) = Mid$(Mask(id), i, 1)
        End Select
    Next
    __UI_MaskToText$ = Text$
End Function
Function RawText$ (id As Long)
    Dim t$, c$, i As Integer
    If Mask(id) = "" Then
        RawText$ = Text(id)
    Else
        For i = 1 To Len(Mask(id))
            c$ = Mid$(Text(id), i, 1)
            Select Case Mid$(Mask(id), i, 1)
                Case "0", "9", "#"
                    If c$ <> "_" Then
                        t$ = t$ + c$
                    Else
                        t$ = t$ + " "
                    End If
            End Select
        Next
        RawText$ = t$
    End If
End Function
Function __UI_EmptyMask$ (id As Long)
    Dim i As Long
    Dim Text$
    For i = 1 To Len(Mask(id))
        Select Case Mid$(Mask(id), i, 1)
            Case "0", "9", "#"
                Text$ = Text$ + "_"
            Case Else
                Text$ = Text$ + Mid$(Mask(id), i, 1)
        End Select
    Next
    __UI_EmptyMask$ = Text$
End Function
Function __UI_GetID (ControlName$)
    Dim i As Long, ControlSearch$
    ControlSearch$ = UCase$(RTrim$(ControlName$))
    If Len(ControlSearch$) = 0 Then Exit Function
    For i = 1 To UBound(Control)
        If Control(i).ID > 0 And UCase$(RTrim$(Control(i).Name)) = ControlSearch$ Then
            __UI_GetID = i
            Exit Function
        End If
    Next
End Function
Function __UI_GetFontID (FontHandle&)
    Dim i As Long
    For i = 1 To UBound(Control)
        If Control(i).Type = __UI_Type_Font And Control(i).Value = FontHandle& Then
            __UI_GetFontID = i
            Exit Function
        End If
    Next
End Function
Function SetFont& (__NewFontFile As String, NewFontSize As Integer)
    Dim NextSlot As Long, i As Long
    Dim NewFontFile As String, PassedFontFile As String, FindSep As Long
    Dim TotalPassedFonts As Long
    ReDim PassedFonts(10) As String
    PassedFontFile = __NewFontFile
    Do
        FindSep = InStr(PassedFontFile, "?")
        If FindSep > 0 Then
            NewFontFile = Left$(PassedFontFile, FindSep - 1)
            PassedFontFile = RTrim$(LTrim$(Mid$(PassedFontFile, FindSep + 1)))
        Else
            NewFontFile = RTrim$(LTrim$(PassedFontFile))
        End If
        TotalPassedFonts = TotalPassedFonts + 1
        If TotalPassedFonts > UBound(PassedFonts) Then ReDim _Preserve PassedFonts(UBound(PassedFonts) + 9) As String
        PassedFonts(TotalPassedFonts) = NewFontFile
        For NextSlot = 1 To UBound(Control)
            If Control(NextSlot).Type = __UI_Type_Font Then
                If (UCase$(ToolTip(NextSlot)) = UCase$(__NewFontFile)) And Control(NextSlot).Max = NewFontSize Then
                    SetFont& = Control(NextSlot).Value
                    Exit Function
                End If
            End If
        Next
    Loop While FindSep > 0
    __UI_Type(__UI_Type_Font).Count = __UI_Type(__UI_Type_Font).Count + 1
    For NextSlot = UBound(Control) To 1 Step -1
        If Control(NextSlot).ID <> 0 Then
            NextSlot = NextSlot + 1
            Exit For
        Else
            If NextSlot = 1 Then NextSlot = UBound(Control) + 1: Exit For
        End If
    Next
    If NextSlot = UBound(Control) + 1 Then
        ReDim _Preserve Control(0 To NextSlot + 99) As __UI_ControlTYPE
        ReDim _Preserve Caption(1 To NextSlot + 99) As String
        ReDim _Preserve __UI_TempCaptions(1 To NextSlot + 99) As String
        ReDim _Preserve Text(1 To NextSlot + 99) As String
        ReDim _Preserve __UI_TempTexts(1 To NextSlot + 99) As String
        ReDim _Preserve Mask(1 To NextSlot + 99) As String
        ReDim _Preserve __UI_TempMask(1 To NextSlot + 99) As String
        ReDim _Preserve ToolTip(0 To NextSlot + 99) As String
        ReDim _Preserve __UI_TempTips(0 To NextSlot + 99) As String
    End If
    Control(NextSlot).ID = NextSlot
    Control(NextSlot).Type = __UI_Type_Font
    Control(NextSlot).Name = "Font" + LTrim$(Str$(__UI_Type(__UI_Type_Font).Count))
    NewFontFile = ""
    For i = 1 To TotalPassedFonts
        If _FileExists(PassedFonts(i)) Or _FileExists("C:\Windows\Fonts\" + PassedFonts(i)) Then
            NewFontFile = PassedFonts(i)
            Exit For
        End If
    Next
    If NewFontFile = "" Then
        If NewFontSize <> 8 And NewFontSize <> 16 Then
            Control(NextSlot).Value = 16
            Control(NextSlot).Max = 16
        Else
            Control(NextSlot).Value = NewFontSize
            Control(NextSlot).Max = NewFontSize
        End If
        SetFont& = Control(NextSlot).Value
    Else
        Control(NextSlot).Value = _LoadFont(NewFontFile, NewFontSize)
        Control(NextSlot).Max = NewFontSize
        Text(NextSlot) = NewFontFile
        ToolTip(NextSlot) = __NewFontFile 'save the original string passed
        SetFont& = Control(NextSlot).Value
        If Control(NextSlot).Value <= 0 Then
            __UI_DestroyControl Control(NextSlot)
            SetFont& = 16
        End If
    End If
End Function
Sub __UI_AdjustNewMenuBarTopHeight (NextSlot As Long)
    Dim TempCanvas As Long, PrevDest As Long
    If _PixelSize = 0 Then
        TempCanvas = _NewImage(10, 10, 32)
        PrevDest = _Dest
        _Dest TempCanvas
    End If
    If Control(__UI_FormID).Font Then _Font Control(__UI_FormID).Font
    Control(NextSlot).Height = falcon_uspacing& + (((_Font = 8) * -1) * __UI_Font8Offset + ((_Font = 16) * -1) * __UI_Font16Offset) + 5
    Control(NextSlot).Top = 0
    If TempCanvas <> 0 Then
        _Dest PrevDest
        _FreeImage TempCanvas
    End If
    If __UI_HasMenuBar = False Then
        __UI_HasMenuBar = True
        If Control(__UI_FormID).Canvas <> 0 Then _FreeImage Control(__UI_FormID).Canvas
        Control(__UI_FormID).Canvas = _NewImage(Control(__UI_FormID).Width, Control(__UI_FormID).Height, 32)
        _Dest Control(__UI_FormID).Canvas
        Color Control(__UI_FormID).ForeColor, Control(__UI_FormID).BackColor
        Cls
        If Control(__UI_FormID).Font Then _Font Control(__UI_FormID).Font
        __UI_MenuBarOffsetV = falcon_uspacing& + (((_Font = 8) * -1) * __UI_Font8Offset + ((_Font = 16) * -1) * __UI_Font16Offset) + 5 + 2
        Line (0, falcon_uspacing& + (((_Font = 8) * -1) * __UI_Font8Offset + ((_Font = 16) * -1) * __UI_Font16Offset) + 5 + 1)-Step(Control(__UI_FormID).Width - 1, 0), Darken(Control(__UI_FormID).BackColor, 80)
        Line (0, falcon_uspacing& + (((_Font = 8) * -1) * __UI_Font8Offset + ((_Font = 16) * -1) * __UI_Font16Offset) + 5 + 2)-Step(Control(__UI_FormID).Width - 1, 0), Darken(Control(__UI_FormID).BackColor, 120)
        _Dest 0
    End If
End Sub
Function __UI_NewControl (ControlType As Integer, ControlName As String, NewWidth As Integer, NewHeight As Integer, NewLeft As Integer, NewTop As Integer, ParentID As Long)
    Dim NextSlot As Long, i As Long
    Static InternalMenus As Long, FirstControl As _Byte
    If ControlType = 0 Then Exit Function
    __UI_ExpandControlDrawOrder 1
    __UI_Type(ControlType).Count = __UI_Type(ControlType).Count + 1
    If ControlType = __UI_Type_MenuItem And Left$(ControlName, 5) = "__UI_" Then InternalMenus = InternalMenus + 1
    If ControlType = __UI_Type_ContextMenu And Left$(ControlName, 5) = "__UI_" Then __UI_InternalContextMenus = __UI_InternalContextMenus + 1
    If ControlName = "" Then
        If ControlType = __UI_Type_MenuItem Then
            ControlName = RTrim$(__UI_Type(ControlType).Name) + LTrim$(Str$(__UI_Type(ControlType).Count - InternalMenus))
        ElseIf ControlType = __UI_Type_ContextMenu Then
            ControlName = RTrim$(__UI_Type(ControlType).Name) + LTrim$(Str$(__UI_Type(ControlType).Count - __UI_InternalContextMenus))
        Else
            ControlName = RTrim$(__UI_Type(ControlType).Name) + LTrim$(Str$(__UI_Type(ControlType).Count))
        End If
    End If
    If ControlType <> __UI_Type_Font Then
        i = 1
        Do
            If __UI_GetID(ControlName) = 0 Then Exit Do
            i = i + 1
            ControlName = ControlName + "_" + LTrim$(Str$(i))
        Loop
    End If
    If FirstControl = False Then
        NextSlot = 1
        FirstControl = True
    Else
        For NextSlot = UBound(Control) To 1 Step -1
            If Control(NextSlot).ID <> 0 Then
                NextSlot = NextSlot + 1
                Exit For
            Else
                If NextSlot = 1 Then NextSlot = UBound(Control) + 1: Exit For
            End If
        Next
    End If
    ControlDrawOrder(UBound(ControlDrawOrder)) = NextSlot
    If NextSlot = UBound(Control) + 1 Then
        ReDim _Preserve Control(0 To NextSlot + 99) As __UI_ControlTYPE
        ReDim _Preserve Caption(1 To NextSlot + 99) As String
        ReDim _Preserve __UI_TempCaptions(1 To NextSlot + 99) As String
        ReDim _Preserve Text(1 To NextSlot + 99) As String
        ReDim _Preserve __UI_TempTexts(1 To NextSlot + 99) As String
        ReDim _Preserve Mask(1 To NextSlot + 99) As String
        ReDim _Preserve __UI_TempMask(1 To NextSlot + 99) As String
        ReDim _Preserve ToolTip(0 To NextSlot + 99) As String
        ReDim _Preserve __UI_TempTips(0 To NextSlot + 99) As String
    End If
    Control(NextSlot).ID = NextSlot
    Control(NextSlot).Type = ControlType
    Control(NextSlot).Name = ControlName
    If ControlType = __UI_Type_Form And __UI_FormID = 0 Then __UI_FormID = NextSlot
    Control(NextSlot).ParentID = ParentID
    Control(NextSlot).ParentName = Control(ParentID).Name
    If ControlType = __UI_Type_MenuItem Then
        If Control(ParentID).Type = __UI_Type_MenuItem Then
            Control(ParentID).SubMenu = True
        End If
    End If
    If (ControlType <> __UI_Type_Form And ParentID = 0) Then
        Control(NextSlot).Font = Control(__UI_FormID).Font
    ElseIf (ControlType <> __UI_Type_Frame And ParentID > 0) Then
        Control(NextSlot).Font = Control(ParentID).Font
    End If
    Control(NextSlot).Width = NewWidth
    Control(NextSlot).Height = NewHeight
    Control(NextSlot).Left = NewLeft
    Control(NextSlot).Top = NewTop
    Control(NextSlot).ForeColor = __UI_DefaultColor(ControlType, 1)
    Control(NextSlot).BackColor = __UI_DefaultColor(ControlType, 2)
    Control(NextSlot).SelectedForeColor = __UI_DefaultColor(ControlType, 3)
    Control(NextSlot).SelectedBackColor = __UI_DefaultColor(ControlType, 4)
    Control(NextSlot).BorderColor = __UI_DefaultColor(ControlType, 5)
    If ControlType = __UI_Type_MenuBar Then
        __UI_AdjustNewMenuBarTopHeight NextSlot
    End If
    If ControlType = __UI_Type_ToggleSwitch Or ControlType = __UI_Type_TrackBar Or ControlType = __UI_Type_TextBox Or ControlType = __UI_Type_Button Or ControlType = __UI_Type_CheckBox Or ControlType = __UI_Type_RadioButton Or ControlType = __UI_Type_ListBox Or ControlType = __UI_Type_DropdownList Then
        Control(NextSlot).CanHaveFocus = True
    End If
    If ControlType = __UI_Type_Frame Then
        If NewWidth = 0 Then NewWidth = 10
        If NewHeight = 0 Then NewHeight = 10
        Control(NextSlot).Canvas = _NewImage(NewWidth, NewHeight, 32)
    End If
    If __UI_DesignMode Then
    Else
        If ControlType = __UI_Type_TextBox Then
            Control(NextSlot).ContextMenuID = __UI_GetID("__UI_TextFieldMenu")
        End If
    End If
    If ControlType = __UI_Type_ProgressBar Then
        Control(NextSlot).Max = 100
        Caption(NextSlot) = "\#"
    End If
    If ControlType = __UI_Type_TrackBar Then
        Control(NextSlot).Max = 10
        Control(NextSlot).Interval = 1
    End If
    If ControlType = __UI_Type_Form Then
        Control(__UI_FormID).Canvas = _NewImage(NewWidth, NewHeight, 32)
        _Dest Control(__UI_FormID).Canvas
        Color Control(__UI_FormID).ForeColor, Control(__UI_FormID).BackColor
        Cls
        _Dest 0
    End If
    If (ControlType = __UI_Type_PictureBox And __UI_DesignMode) Or ControlType = __UI_Type_TextBox Or ControlType = __UI_Type_Frame Or ControlType = __UI_Type_ListBox Or ControlType = __UI_Type_DropdownList Then
        Control(NextSlot).HasBorder = True
        Control(NextSlot).BorderSize = 1
    End If
    If ControlType = __UI_Type_PictureBox Then
        Control(NextSlot).HelperCanvas = _NewImage(NewWidth, NewHeight, 32)
        If __UI_DesignMode Then Control(NextSlot).Stretch = True
        Control(NextSlot).Align = __UI_Center
        Control(NextSlot).VAlign = __UI_Middle
    End If
    If ControlType = __UI_Type_Label And __UI_DesignMode Then Control(NextSlot).VAlign = __UI_Middle
    __UI_NewControl = NextSlot
End Function
Sub __UI_DestroyControl (This As __UI_ControlTYPE)
    Dim i As Long, uw As Long
    __UI_AutoRefresh = False
    If This.ID > 0 Then
        Caption(This.ID) = ""
        __UI_TempCaptions(This.ID) = ""
        Text(This.ID) = ""
        __UI_TempTexts(This.ID) = ""
        ToolTip(This.ID) = ""
        __UI_TempTips(This.ID) = ""
        Mask(This.ID) = ""
        If This.Type = __UI_Type_ListBox Then
            If __UI_ActiveDropdownList = This.ID Then
                __UI_ActiveDropdownList = 0
                __UI_ParentDropdownList = 0
            End If
        ElseIf This.Type = __UI_Type_MenuPanel Then
            For i = 1 To UBound(Control)
                If Control(i).MenuPanelID = This.ID Then
                    If Control(i).ControlIsSelected Then
                        Control(i).ControlIsSelected = False
                    End If
                End If
            Next
            If Control(This.SourceControl).Type = __UI_Type_ContextMenu Then
                __UI_ActiveMenuIsContextMenu = False
            End If
            __UI_TotalActiveMenus = __UI_TotalActiveMenus - 1
            If __UI_TotalActiveMenus < 0 Then __UI_TotalActiveMenus = 0
        End If
        __UI_Type(This.Type).Count = __UI_Type(This.Type).Count - 1
        If This.Font > 0 And This.Font <> 8 And This.Font <> 16 Then
            For i = 1 To UBound(Control)
                If Control(i).Type <> __UI_Type_Font Then
                    If This.ID <> i And This.Font = Control(i).Font Then Exit For
                End If
            Next
            If i > UBound(Control) Then
                __UI_DestroyControl Control(__UI_GetFontID(This.Font))
                This.Font = 0
            End If
        Else
            This.Font = 0
        End If
    End If
    Dim EmptyControl As __UI_ControlTYPE
    If This.Canvas <> 0 Then _FreeImage This.Canvas: This.Canvas = 0
    If This.HelperCanvas <> 0 Then _FreeImage This.HelperCanvas: This.HelperCanvas = 0
    If This.ControlIsSelected Then This.ControlIsSelected = False: __UI_TotalSelectedControls = __UI_TotalSelectedControls - 1
    uw& = GetControlDrawOrder(This.ID)
    ControlDrawOrder(uw&) = 0
    This = EmptyControl
    __UI_HasMenuBar = (__UI_FirstMenuBarControl > 0)
    __UI_AutoRefresh = True
End Sub
Sub SetCaption (ThisID As Long, TempCaption$)
    Dim FindSep%, NewCaption$, FindEscape%
    Dim PrevFont As Long, TempCanvas As Long, PrevDest As Long
    If ThisID = 0 Then Exit Sub
    NewCaption$ = RestoreCHR$(TempCaption$)
    StartSearchForSep:
    FindSep% = InStr(FindSep% + 1, NewCaption$, "&")
    If FindSep% > 0 And FindSep% < Len(NewCaption$) Then
        If FindSep% > 1 Then
            If Asc(NewCaption$, FindSep% - 1) = 92 Then
                GoTo StartSearchForSep
            End If
        End If
        NewCaption$ = Left$(NewCaption$, FindSep% - 1) + Mid$(NewCaption$, FindSep% + 1)
        Control(ThisID).HotKey = Asc(UCase$(NewCaption$), FindSep%)
        Control(ThisID).HotKeyPosition = FindSep%
        FindEscape% = InStr(NewCaption$, "\&")
        Do While FindEscape% > 0
            If FindEscape% < FindSep% Then
                FindSep% = FindSep% - 1
            End If
            NewCaption$ = Left$(NewCaption$, FindEscape% - 1) + Mid$(NewCaption$, FindEscape% + 1)
            FindEscape% = InStr(NewCaption$, "\&")
        Loop
        PrevFont = _Font
        If _PixelSize = 0 Then
            TempCanvas = _NewImage(10, 10, 32)
            PrevDest = _Dest
            _Dest TempCanvas
        End If
        _Font (Control(ThisID).Font)
        If Control(ThisID).HotKeyPosition = 1 Then
            Control(ThisID).HotKeyOffset = 0
        Else
            Control(ThisID).HotKeyOffset = __UI_PrintWidth(Left$(NewCaption$, Control(ThisID).HotKeyPosition - 1))
        End If
        If TempCanvas <> 0 Then
            _Dest PrevDest
            _FreeImage TempCanvas
        End If
        _Font PrevFont
    Else
        Control(ThisID).HotKey = 0
    End If
    NewCaption$ = Replace$(NewCaption$, "\n", Chr$(10), False, 0)
    Caption(ThisID) = NewCaption$
End Sub
Sub BeginDraw (ThisID As Long)
    If Control(ThisID).Type <> __UI_Type_PictureBox Then Exit Sub
    _Dest Control(ThisID).HelperCanvas
End Sub
Sub EndDraw (ThisID As Long)
    If Control(ThisID).Type <> __UI_Type_PictureBox Then Exit Sub
    _Dest 0
    Control(ThisID).Redraw = True
End Sub
Sub LoadImage (This As __UI_ControlTYPE, File$)
    Dim PrevDest As Long, ErrorMessage$
    Static NotFoundImage As Long
    If This.HelperCanvas <> 0 Then _FreeImage This.HelperCanvas
    If _FileExists(File$) Then
        This.HelperCanvas = _LoadImage(File$, 32)
        If This.HelperCanvas >= -1 Then
            This.HelperCanvas = IconPreview(File$)
            If This.HelperCanvas >= -1 Then ErrorMessage$ = "Unable to load file:"
        End If
    Else
        If File$ = "" Then
            If This.Type = __UI_Type_PictureBox Then
                This.HelperCanvas = _NewImage(This.Width, This.Height, 32)
            End If
        Else
            ErrorMessage$ = "Missing image file:"
        End If
    End If
    If Len(ErrorMessage$) Then
        If NotFoundImage = 0 Then NotFoundImage = __UI_LoadThemeImage("notfound.png")
        PrevDest = _Dest
        This.HelperCanvas = _NewImage(This.Width, This.Height, 32)
        _Dest This.HelperCanvas
        _PrintMode _KeepBackground
        _Font (This.Font)
        Cls , _RGBA32(0, 0, 0, 0)
        _PutImage (This.Width / 2 - _Width(NotFoundImage) / 2, This.Height / 2 - _Height(NotFoundImage) / 2), NotFoundImage
        Color This.ForeColor
        __UI_PrintString 5, 5, ErrorMessage$
        __UI_PrintString 5, 5 + uspacing&, File$
        _Dest PrevDest
        Text(This.ID) = ""
    Else
        If This.Type = __UI_Type_PictureBox Or This.Type = __UI_Type_Button Or This.Type = __UI_Type_MenuItem Then
            Text(This.ID) = File$
        End If
    End If
    This.Redraw = True
End Sub
Sub __UI_ClearColor (Image&, Left As _Unsigned Long, Top As Integer)
    Dim PrevSource As Long
    If Not Image& < -1 Then Exit Sub
    If Top = -1 Then
        _ClearColor Left, Image&
    Else
        PrevSource = _Source
        _Source Image&
        _ClearColor Point(Left, Top), Image&
        _Source PrevSource
    End If
End Sub
Sub __UI_ClearHelperCanvasColor (This As __UI_ControlTYPE, Left As Integer, Top As Integer)
    Dim PrevSource As Long
    If Not This.HelperCanvas < -1 Then Exit Sub
    PrevSource = _Source
    _Source This.HelperCanvas
    This.TransparentColor = Point(Left, Top)
    _ClearColor This.TransparentColor, This.HelperCanvas
    _Source PrevSource
End Sub
Function __UI_LoadThemeImage& (FileName$)
    Dim A$, i&, B$, C%, F$, C$, t%, B&, X$, btemp$, BASFILE$
    Dim MemoryBlock As _MEM, TempImage As Long, NextSlot As Long
    Dim NewWidth As Integer, NewHeight As Integer
    For NextSlot = 1 To UBound(__UI_ThemeImages)
        If UCase$(RTrim$(__UI_ThemeImages(NextSlot).FileName)) = UCase$(FileName$) Then
            __UI_LoadThemeImage& = __UI_ThemeImages(NextSlot).Handle
            Exit Function
        ElseIf RTrim$(__UI_ThemeImages(NextSlot).FileName) = "" Then
        End If
    Next
    A$ = __UI_ImageData$(FileName$)
    If Len(A$) = 0 Then Exit Function
    NewWidth = CVI(Left$(A$, 2))
    NewHeight = CVI(Mid$(A$, 3, 2))
    A$ = Mid$(A$, 5)
    For i& = 1 To Len(A$) Step 4: B$ = Mid$(A$, i&, 4)
        If InStr(1, B$, "%") Then
            For C% = 1 To Len(B$): F$ = Mid$(B$, C%, 1)
                If F$ <> "%" Then C$ = C$ + F$
            Next: B$ = C$
            End If: For t% = Len(B$) To 1 Step -1
            B& = B& * 64 + Asc(Mid$(B$, t%)) - 48
            Next: X$ = "": For t% = 1 To Len(B$) - 1
            X$ = X$ + Chr$(B& And 255): B& = B& \ 256
    Next: btemp$ = btemp$ + X$: Next
    BASFILE$ = btemp$
    TempImage = _NewImage(NewWidth, NewHeight, 32)
    MemoryBlock = _MemImage(TempImage)
    __UI_MemCopy MemoryBlock.OFFSET, _Offset(BASFILE$), Len(BASFILE$)
    _MemFree MemoryBlock
    If NextSlot > UBound(__UI_ThemeImages) Then
        ReDim _Preserve __UI_ThemeImages(1 To NextSlot + 99) As __UI_ThemeImagesType
    End If
    __UI_ThemeImages(NextSlot).FileName = FileName$
    __UI_ThemeImages(NextSlot).Handle = TempImage
    __UI_LoadThemeImage& = TempImage
End Function
Sub SetRadioButtonValue (id As Long)
    Dim i As Long
    If Control(id).Type = __UI_Type_MenuItem And Control(id).BulletStyle <> __UI_Bullet Then
        Control(id).Value = Not Control(id).Value
        Exit Sub
    End If
    If Control(id).Type = __UI_Type_MenuItem Or Control(id).Type = __UI_Type_RadioButton Then
        For i = 1 To UBound(Control)
            Select Case Control(id).Type
                Case __UI_Type_RadioButton
                    If Control(i).Type = __UI_Type_RadioButton And Control(i).ParentID = Control(id).ParentID Then
                        If Control(i).Value Then
                            Control(i).Value = False
                            __UI_ValueChanged i
                        End If
                    End If
                Case __UI_Type_MenuItem
                    If (Control(i).Type = __UI_Type_MenuItem And Control(i).BulletStyle = __UI_Bullet) And Control(i).ParentID = Control(id).ParentID Then
                        If Control(i).MenuItemGroup = Control(id).MenuItemGroup Then
                            Control(i).Value = False
                        End If
                    End If
            End Select
        Next
        Control(id).Value = True
        If Control(id).Type = __UI_Type_RadioButton Then __UI_ValueChanged id
        Control(id).Redraw = True
    End If
End Sub
Sub __UI_CheckSelection (id)
    If Not Control(id).Multiline Then
        If __UI_ShiftIsDown Then
            If Not Control(id).TextIsSelected Then
                Control(id).TextIsSelected = True
                Control(id).SelectionStart = Control(id).Cursor
            End If
        Else
            Control(id).TextIsSelected = False
            __UI_FillSelectedText 0, 0
        End If
    End If
End Sub
Sub __UI_FillSelectedText (__ss1 As Long, __ss2 As Long)
    Dim i As Long
    i = __UI_Focus
    __UI_SelectedText = ""
    __UI_SelectionLength = 0
    If Control(i).Type = __UI_Type_TextBox And Control(i).TextIsSelected Then
        Dim s1 As Long, s2 As Long
        Dim ss1 As Long, ss2 As Long
        s1 = Control(i).SelectionStart
        s2 = Control(i).Cursor
        If s1 > s2 Then
            Swap s1, s2
            If Control(i).InputViewStart > 1 Then
                ss1 = s1 - Control(i).InputViewStart + 1
            Else
                ss1 = s1
            End If
            ss2 = s2 - s1
            If ss1 + ss2 > Control(i).FieldArea Then ss2 = Control(i).FieldArea - ss1
        Else
            ss1 = s1
            ss2 = s2 - s1
            If ss1 < Control(i).InputViewStart Then ss1 = 0: ss2 = s2 - Control(i).InputViewStart + 1
            If ss1 > Control(i).InputViewStart Then ss1 = ss1 - Control(i).InputViewStart + 1: ss2 = s2 - s1
        End If
        __UI_SelectedText = Mid$(Text(i), s1 + 1, s2 - s1)
        __UI_SelectionLength = Len(__UI_SelectedText)
        __ss1 = ss1
        __ss2 = ss2
    End If
End Sub
Sub __UI_DeleteSelection
    Dim s1 As Long, s2 As Long
    If Not Control(__UI_Focus).Multiline Then
        s1 = Control(__UI_Focus).SelectionStart
        s2 = Control(__UI_Focus).Cursor
        If s1 > s2 Then Swap s1, s2
        Text(__UI_Focus) = Left$(Text(__UI_Focus), s1) + Mid$(Text(__UI_Focus), s2 + 1)
        Control(__UI_Focus).TextIsSelected = False
        __UI_FillSelectedText 0, 0
        Control(__UI_Focus).Cursor = s1
    End If
End Sub
Sub __UI_DeleteSelectionMasked
    Dim s1 As Long, s2 As Long
    s1 = Control(__UI_Focus).SelectionStart
    s2 = Control(__UI_Focus).Cursor
    If s1 > s2 Then Swap s1, s2
    Mid$(Text(__UI_Focus), s1 + 1, s2 - s1) = Mid$(__UI_EmptyMask$(__UI_Focus), s1 + 1, s2 - s1)
    Control(__UI_Focus).TextIsSelected = False
    __UI_FillSelectedText 0, 0
    Control(__UI_Focus).Cursor = s1
End Sub
Sub __UI_CursorAdjustments (This As Long)
    If Not Control(This).Multiline And Control(This).Type = __UI_Type_TextBox Then
        If Control(This).VisibleCursor >= (Control(This).Width - ((Control(This).BorderSize + __UI_DefaultCaptionIndent) * Abs(Control(This).HasBorder))) Then
            Control(This).InputViewStart = __UI_FocusedTextBoxChars(Control(This).Cursor) - Control(This).Width / 2 'Control(This).InputViewStart + Control(This).Width / 4
        ElseIf Control(This).VisibleCursor <= 0 Then
            Control(This).InputViewStart = __UI_FocusedTextBoxChars(Control(This).Cursor) - Control(This).Width / 2 'Control(This).InputViewStart - Control(This).Width / 4
        End If
        If Control(This).InputViewStart < 0 Then Control(This).InputViewStart = 0
    ElseIf Control(This).Multiline And Control(This).Type = __UI_Type_TextBox Then
    End If
End Sub
Function Replace$ (TempText$, SubString$, NewString$, CaseSensitive As _Byte, TotalReplacements As Long)
    Dim FindSubString As Long, Text$
    If Len(TempText$) = 0 Then Exit Function
    Text$ = TempText$
    TotalReplacements = 0
    Do
        If CaseSensitive Then
            FindSubString = InStr(FindSubString + 1, Text$, SubString$)
        Else
            FindSubString = InStr(FindSubString + 1, UCase$(Text$), UCase$(SubString$))
        End If
        If FindSubString = 0 Then Exit Do
        If Left$(SubString$, 1) = "\" Then 'Escape sequence
            If Mid$(Text$, FindSubString - 1, 1) <> "\" Then
                Text$ = Left$(Text$, FindSubString - 1) + NewString$ + Mid$(Text$, FindSubString + Len(SubString$))
                TotalReplacements = TotalReplacements + 1
            End If
        Else
            Text$ = Left$(Text$, FindSubString - 1) + NewString$ + Mid$(Text$, FindSubString + Len(SubString$))
            TotalReplacements = TotalReplacements + 1
        End If
    Loop
    Replace$ = Text$
End Function
Function __UI_CountLines& (id As Long)
    Dim FindLF As Long, TotalLines As Long
    If Len(Text(id)) = 0 Then Exit Function
    FindLF = InStr(Text(id), Chr$(10))
    If FindLF = 0 Then
        __UI_CountLines& = 1
        Exit Function
    End If
    TotalLines = 2
    Do
        FindLF = InStr(FindLF + 1, Text(id), Chr$(10))
        If FindLF = 0 Then
            __UI_CountLines& = TotalLines
            Exit Function
        End If
        TotalLines = TotalLines + 1
    Loop
End Function
Function __UI_GetTextBoxLine$ (id As Long, LineNumber As Long, StartPosition As Long)
    Dim This As __UI_ControlTYPE, ThisLine As Long, FindLF As Long, LastLF As Long
    This = Control(id)
    StartPosition = 1
    If Not This.Multiline Then
        __UI_GetTextBoxLine$ = Text(id)
        Exit Function
    End If
    FindLF = InStr(Text(id), Chr$(10))
    If LineNumber = 1 Then
        If FindLF = 0 Then
            __UI_GetTextBoxLine$ = Text(id)
            Exit Function
        Else
            __UI_GetTextBoxLine$ = Left$(Text(id), FindLF - 1)
            Exit Function
        End If
    End If
    ThisLine = 2
    Do
        LastLF = FindLF
        FindLF = InStr(LastLF + 1, Text(id), Chr$(10))
        If FindLF > 0 Then
            If ThisLine = LineNumber Then
                __UI_GetTextBoxLine$ = Mid$(Text(id), LastLF + 1, FindLF - LastLF - 1)
                StartPosition = LastLF + 1
                Exit Function
            End If
        Else
            If ThisLine = LineNumber Then
                __UI_GetTextBoxLine$ = Mid$(Text(id), LastLF + 1)
                StartPosition = LastLF + 1
            End If
            Exit Function
        End If
        ThisLine = ThisLine + 1
    Loop
    StartPosition = 0
End Function
Sub AddItem (WhichListBox As Long, TempItem$)
    Dim ThisID As Long, prevFont As Long
    Dim BorderOffset As Integer, Item$
    ThisID = WhichListBox
    If Control(ThisID).Type <> __UI_Type_ListBox And Control(ThisID).Type <> __UI_Type_DropdownList Then Exit Sub
    Item$ = Replace$(RestoreCHR$(TempItem$), Chr$(13), Chr$(10), False, 0)
    Text(ThisID) = Text(ThisID) + Item$ + Chr$(13)
    Control(ThisID).Max = Control(ThisID).Max + 1
    If Control(ThisID).AutoScroll Then
        prevFont = _Font
        BorderOffset = Abs(Control(ThisID).HasBorder) * 5
        _Font Control(ThisID).Font
        If Control(ThisID).Max > Fix((Control(ThisID).Height - BorderOffset) / Control(ThisID).ItemHeight) Then
            Control(ThisID).InputViewStart = Control(ThisID).Max - Fix((Control(ThisID).Height - BorderOffset) / Control(ThisID).ItemHeight) + 1
        End If
        _Font prevFont
    End If
    Control(ThisID).LastVisibleItem = 0 'Reset this var so it'll be recalculated
    Control(ThisID).Redraw = True
End Sub
Sub RemoveItem (WhichListBox As Long, ItemToRemove As Integer)
    Dim This As __UI_ControlTYPE, TempText$, ThisItem%, FindLF&, TempCaption$
    This = Control(WhichListBox)
    If This.Type <> __UI_Type_ListBox And This.Type <> __UI_Type_DropdownList Then Exit Sub
    If ItemToRemove > This.Max Then Exit Sub
    TempText$ = Text(This.ID)
    Text(This.ID) = ""
    ThisItem% = 0
    Do While Len(TempText$)
        ThisItem% = ThisItem% + 1
        FindLF& = InStr(TempText$, Chr$(13))
        If FindLF& Then
            TempCaption$ = Left$(TempText$, FindLF& - 1)
            TempText$ = Mid$(TempText$, FindLF& + 1)
        Else
            TempCaption$ = TempText$
            TempText$ = ""
        End If
        If ThisItem% <> ItemToRemove Then Text(This.ID) = Text(This.ID) + TempCaption$ + Chr$(13)
    Loop
    This.Max = This.Max - 1
    This.LastVisibleItem = 0 'Reset this var so it'll be recalculated
    If This.Value = ItemToRemove Then
        This.Value = 0
    ElseIf This.Value > ItemToRemove Then
        This.Value = This.Value - 1
    End If
    Control(This.ID) = This
    Control(This.ID).Redraw = True
End Sub
Sub ResetList (WhichListBox As Long)
    Dim This As __UI_ControlTYPE
    This = Control(WhichListBox)
    If This.Type <> __UI_Type_ListBox And This.Type <> __UI_Type_DropdownList Then Exit Sub
    Text(This.ID) = ""
    This.Max = 0
    This.LastVisibleItem = 0 'Reset this var so it'll be recalculated
    This.InputViewStart = 1
    This.Value = 0
    Control(This.ID) = This
    Control(This.ID).Redraw = True
End Sub
Sub ReplaceItem (WhichListBox As Long, ItemToReplace As Integer, NewText$)
    Dim This As __UI_ControlTYPE, TempText$, ThisItem%, FindLF&, TempCaption$
    This = Control(WhichListBox)
    If This.Type <> __UI_Type_ListBox And This.Type <> __UI_Type_DropdownList Then Exit Sub
    If ItemToReplace > This.Max Then Exit Sub
    TempText$ = Text(This.ID)
    Text(This.ID) = ""
    ThisItem% = 0
    Do While Len(TempText$)
        ThisItem% = ThisItem% + 1
        FindLF& = InStr(TempText$, Chr$(13))
        If FindLF& Then
            TempCaption$ = Left$(TempText$, FindLF& - 1)
            TempText$ = Mid$(TempText$, FindLF& + 1)
        Else
            TempCaption$ = TempText$
            TempText$ = ""
        End If
        If ThisItem% <> ItemToReplace Then
            Text(This.ID) = Text(This.ID) + TempCaption$ + Chr$(13)
        Else
            Text(This.ID) = Text(This.ID) + NewText$ + Chr$(13)
        End If
    Loop
    Control(This.ID).Redraw = True
End Sub
Function SelectItem%% (id As Long, __Item$)
    Dim b$, Item$, i As Long
    If Control(id).Type <> __UI_Type_ListBox And Control(id).Type <> __UI_Type_DropdownList Then
        Exit Function
    End If
    Item$ = RTrim$(LTrim$(__Item$))
    If Len(Item$) = 0 Then Exit Function
    For i = 1 To Control(id).Max
        b$ = GetItem$(id, i)
        If b$ = Item$ Then
            Control(id).Value = i
            Control(id).Redraw = True
            SelectItem%% = True
            Exit Function
        End If
    Next
End Function
Function GetItem$ (id As Long, Item As Long)
    Dim This As __UI_ControlTYPE, ThisItem As Long, FindLF As Long, LastLF As Long
    This = Control(id)
    FindLF = InStr(Text(id), Chr$(13))
    If Item = 1 Then
        If FindLF = 0 Then
            GetItem$ = Text(id)
            Exit Function
        Else
            GetItem$ = Left$(Text(id), FindLF - 1)
            Exit Function
        End If
    End If
    ThisItem = 2
    Do
        LastLF = FindLF
        FindLF = InStr(LastLF + 1, Text(id), Chr$(13))
        If FindLF > 0 Then
            If ThisItem = Item Then
                GetItem$ = Mid$(Text(id), LastLF + 1, FindLF - LastLF - 1)
                Exit Function
            End If
        Else
            If ThisItem = Item Then
                GetItem$ = Mid$(Text(id), LastLF + 1)
            End If
            Exit Function
        End If
        ThisItem = ThisItem + 1
    Loop
End Function
Sub __UI_ListBoxSearchItem (This As __UI_ControlTYPE)
    Static SearchPattern$, LastListKeyHit As Single
    Dim ThisItem%, FindLF&, TempCaption$, TempText$
    Dim ListItems$(1 To This.Max)
    TempText$ = Text(This.ID)
    Do While Len(TempText$)
        ThisItem% = ThisItem% + 1
        FindLF& = InStr(TempText$, Chr$(13))
        If FindLF& Then
            TempCaption$ = Left$(TempText$, FindLF& - 1)
            TempText$ = Mid$(TempText$, FindLF& + 1)
        Else
            TempCaption$ = TempText$
            TempText$ = ""
        End If
        ListItems$(ThisItem%) = TempCaption$
    Loop
    If Timer - LastListKeyHit < 1 Then
        SearchPattern$ = SearchPattern$ + UCase$(Chr$(__UI_KeyHit))
        ThisItem% = This.Value
    Else
        SearchPattern$ = UCase$(Chr$(__UI_KeyHit))
        ThisItem% = This.Value + 1
        If ThisItem% > This.Max Then ThisItem% = 1
    End If
    Do
        If UCase$(Left$(ListItems$(ThisItem%), Len(SearchPattern$))) = SearchPattern$ Then
            This.Value = ThisItem%
            __UI_ValueChanged This.ID
            Exit Do
        End If
        ThisItem% = ThisItem% + 1
        If ThisItem% > This.Max Then ThisItem% = 1
        If ThisItem% = This.Value Then Exit Do
    Loop
    LastListKeyHit = Timer
End Sub
Sub __UI_PrintString (Left As Integer, Top As Integer, Text$)
    Dim Utf$
    If Left$(Text$, 1) = Chr$(7) And (_Font = 8 Or _Font = 16) Then
        Utf$ = Text$
    Else
        If Control(__UI_FormID).Encoding = 1252 Then
            Utf$ = FromCP1252$(Text$)
        Else 'Default to 437
            Utf$ = FromCP437$(Text$)
        End If
    End If
    ReDim __UI_ThisLineChars(Len(Utf$)) As Long
    uprint_extra Left, Top, _Offset(Utf$), Len(Utf$), True, True, __UI_LastRenderedLineWidth, _Offset(__UI_ThisLineChars()), __UI_LastRenderedCharCount, _DefaultColor, 0
    ReDim _Preserve __UI_ThisLineChars(__UI_LastRenderedCharCount) As Long
End Sub
Function __UI_PrintWidth& (Text$)
    __UI_PrintWidth& = uprintwidth(Text$, Len(Text$), 0)
End Function
Function __UI_WordWrap$ (PassedText As String, Width As Integer, LongestLine As Integer, Lines As Integer)
    Dim Temp$, TempCaption$, FindSep As Long, PrevSep As Long
    Dim NextSlot As Long, TempLine$, i As Long, Text As String
    Dim ThisLineWidth As Integer
    Text = RTrim$(PassedText)
    If Text = "" Then Lines = 1: Exit Function
    For i = 1 To UBound(__UI_WordWrapHistoryTexts)
        If __UI_WordWrapHistoryTexts(i) = "" Then Exit For
        If __UI_WordWrapHistoryTexts(i) = Text Then
            If __UI_WordWrapHistory(i).Width = Width And __UI_WordWrapHistory(i).Font = _Font Then
                __UI_WordWrap$ = __UI_WordWrapHistoryResults(i)
                Lines = __UI_WordWrapHistory(i).TotalLines
                LongestLine = __UI_WordWrapHistory(i).LongestLine
                Exit Function
            Else
                Exit For
            End If
        End If
    Next
    NextSlot = i
    If NextSlot > UBound(__UI_WordWrapHistory) Then
        ReDim _Preserve __UI_WordWrapHistory(1 To NextSlot + 99) As __UI_WordWrapHistoryType
        ReDim _Preserve __UI_WordWrapHistoryTexts(1 To NextSlot + 99) As String
        ReDim _Preserve __UI_WordWrapHistoryResults(1 To NextSlot + 99) As String
    End If
    __UI_WordWrapHistoryTexts(NextSlot) = Text
    __UI_WordWrapHistory(NextSlot).Width = Width
    __UI_WordWrapHistory(NextSlot).Font = _Font
    Lines = 0
    LongestLine = 0
    TempCaption$ = Text
    If __UI_PrintWidth&(TempCaption$) > Width Then
        Do While Len(TempCaption$)
            FindSep = InStr(TempCaption$, Chr$(10)) 'process the passed text line by line
            If FindSep > 0 Then
                TempLine$ = Left$(TempCaption$, FindSep - 1)
                TempCaption$ = Mid$(TempCaption$, FindSep + 1)
            Else
                TempLine$ = TempCaption$
                TempCaption$ = ""
            End If
            Do While Len(TempLine$)
                If __UI_PrintWidth&(TempLine$) < Width Then
                    If Len(Temp$) > 0 Then Temp$ = Temp$ + Chr$(1)
                    ThisLineWidth = __UI_PrintWidth(TempLine$)
                    If LongestLine < ThisLineWidth Then LongestLine = ThisLineWidth
                    Temp$ = Temp$ + TempLine$
                    TempLine$ = ""
                    Lines = Lines + 1
                Else
                    PrevSep = 0
                    Do
                        FindSep = InStr(PrevSep + 1, TempLine$, " ")
                        If FindSep > 0 Then
                            If __UI_PrintWidth(Left$(TempLine$, FindSep - 1)) > Width Then
                                If PrevSep = 0 Then
                                    If Len(Temp$) > 0 Then Temp$ = Temp$ + Chr$(1)
                                    Temp$ = Temp$ + Left$(TempLine$, FindSep - 1)
                                    TempLine$ = Mid$(TempLine$, FindSep + 1)
                                    Lines = Lines + 1
                                    Exit Do
                                Else
                                    If Len(Temp$) > 0 Then Temp$ = Temp$ + Chr$(1)
                                    Temp$ = Temp$ + Left$(TempLine$, PrevSep - 1)
                                    ThisLineWidth = __UI_PrintWidth(Left$(TempLine$, PrevSep - 1))
                                    If LongestLine < ThisLineWidth Then LongestLine = ThisLineWidth
                                    TempLine$ = Mid$(TempLine$, PrevSep + 1)
                                    Lines = Lines + 1
                                    Exit Do
                                End If
                            End If
                            PrevSep = FindSep
                        Else
                            If PrevSep > 0 Then
                                If Len(Temp$) > 0 Then Temp$ = Temp$ + Chr$(1)
                                Temp$ = Temp$ + Left$(TempLine$, PrevSep - 1)
                                ThisLineWidth = __UI_PrintWidth(Left$(TempLine$, PrevSep - 1))
                                If LongestLine < ThisLineWidth Then LongestLine = ThisLineWidth
                                TempLine$ = Mid$(TempLine$, PrevSep + 1)
                                Lines = Lines + 1
                                Exit Do
                            Else
                                If Len(Temp$) > 0 Then Temp$ = Temp$ + Chr$(1)
                                Temp$ = Temp$ + TempLine$
                                ThisLineWidth = __UI_PrintWidth(TempLine$)
                                If LongestLine < ThisLineWidth Then LongestLine = ThisLineWidth
                                TempLine$ = ""
                                Lines = Lines + 1
                                Exit Do
                            End If
                        End If
                    Loop
                End If
            Loop
        Loop
        __UI_WordWrap$ = Temp$
        __UI_WordWrapHistoryResults(NextSlot) = Temp$
        __UI_WordWrapHistory(NextSlot).TotalLines = Lines
        __UI_WordWrapHistory(NextSlot).LongestLine = LongestLine
    Else
        Lines = 1
        LongestLine = 0
        Temp$ = TempCaption$
        FindSep = InStr(TempCaption$, Chr$(10))
        If FindSep > 0 Then
            Temp$ = ""
            Lines = 0
            Do While Len(TempCaption$)
                FindSep = InStr(TempCaption$, Chr$(10))
                If FindSep > 0 Then
                    Lines = Lines + 1
                    If Len(Temp$) > 0 Then Temp$ = Temp$ + Chr$(1)
                    Temp$ = Temp$ + Left$(TempCaption$, FindSep - 1)
                    ThisLineWidth = __UI_PrintWidth(Left$(TempCaption$, FindSep - 1))
                    If LongestLine < ThisLineWidth Then LongestLine = ThisLineWidth
                    TempCaption$ = Mid$(TempCaption$, FindSep + 1)
                Else
                    Lines = Lines + 1
                    Temp$ = Temp$ + Chr$(1) + TempCaption$
                    Exit Do
                End If
            Loop
        Else
            LongestLine = __UI_PrintWidth(TempCaption$)
        End If
        __UI_WordWrap$ = Temp$
        __UI_WordWrapHistoryResults(NextSlot) = Temp$
        __UI_WordWrapHistory(NextSlot).TotalLines = Lines
        __UI_WordWrapHistory(NextSlot).LongestLine = LongestLine
    End If
End Function
Function MessageBox& (Message$, Title$, Setup As Long)
    _Delay .1 'So the interface can redraw before the messagebox kicks in
    If Title$ = "" Then Title$ = __UI_CurrentTitle
    $If WIN Then
        MessageBox& = __UI_MB(0, Replace(Message$, "\n", Chr$(10), False, 0) + Chr$(0), Title$ + Chr$(0), Setup + MsgBox_SystemModal + MsgBox_SetForeground)
    $Else
            IF (Setup AND 4) THEN
            MessageBox& = __UI_MB(0, Replace(Message$, "\n", CHR$(10), False, 0) + CHR$(0), Title$ + CHR$(0), 4)
            ELSE
            MessageBox& = __UI_MB(0, Replace(Message$, "\n", CHR$(10), False, 0) + CHR$(0), Title$ + CHR$(0), 0)
            END IF
    $End If
End Function
Function __UI_MAP! (value!, minRange!, maxRange!, newMinRange!, newMaxRange!)
    __UI_MAP! = ((value! - minRange!) / (maxRange! - minRange!)) * (newMaxRange! - newMinRange!) + newMinRange!
End Function
Sub __UI_ActivateDropdownlist (This As __UI_ControlTYPE)
    If Not This.Disabled Then
        __UI_ParentDropdownList = This.ID
        __UI_ActiveDropdownList = __UI_NewControl(__UI_Type_ListBox, RTrim$(This.Name) + Chr$(254) + "DropdownList", 0, 0, 0, 0, 0)
        Text(__UI_ActiveDropdownList) = Text(This.ID)
        Control(__UI_ActiveDropdownList).Left = This.Left + Control(This.ParentID).Left
        Control(__UI_ActiveDropdownList).Width = This.Width
        Control(__UI_ActiveDropdownList).Top = This.Top + This.Height + Control(This.ParentID).Top
        Dim MaxVisible As Integer
        If This.Max > 14 Then MaxVisible = 14 Else MaxVisible = This.Max
        _Font This.Font
        Control(__UI_ActiveDropdownList).Height = (uspacing& + (((_Font = 8) * -1) * __UI_Font8Offset + ((_Font = 16) * -1) * __UI_Font16Offset) + 3) * (MaxVisible + .5)
        If Control(__UI_ActiveDropdownList).Top + Control(__UI_ActiveDropdownList).Height > Control(__UI_FormID).Height Then
            Control(__UI_ActiveDropdownList).Top = Control(__UI_FormID).Height - Control(__UI_ActiveDropdownList).Height
        End If
        Control(__UI_ActiveDropdownList).Max = This.Max
        Control(__UI_ActiveDropdownList).Value = This.Value
        Control(__UI_ActiveDropdownList).ForeColor = This.ForeColor
        Control(__UI_ActiveDropdownList).BackColor = This.BackColor
        Control(__UI_ActiveDropdownList).SelectedForeColor = This.SelectedForeColor
        Control(__UI_ActiveDropdownList).SelectedBackColor = This.SelectedBackColor
        Control(__UI_ActiveDropdownList).Font = This.Font
        Control(__UI_ActiveDropdownList).HasBorder = True
        Control(__UI_ActiveDropdownList).BorderSize = 1
        Control(__UI_ActiveDropdownList).BorderColor = _RGB32(0, 0, 0)
        Control(__UI_ActiveDropdownList).CanHaveFocus = True
        Control(__UI_ActiveDropdownList).InputViewStart = 1
        Control(__UI_ActiveDropdownList).LastVisibleItem = MaxVisible
        __UI_Focus = __UI_ActiveDropdownList
        If Control(__UI_Focus).Value < Control(__UI_Focus).InputViewStart Then
            Control(__UI_Focus).InputViewStart = Control(__UI_Focus).Value
        ElseIf Control(__UI_Focus).Value > Control(__UI_Focus).InputViewStart + Control(__UI_Focus).LastVisibleItem - 1 Then
            Control(__UI_Focus).InputViewStart = Control(__UI_Focus).Value - Control(__UI_Focus).LastVisibleItem + 1
        End If
    End If
End Sub
Sub __UI_CloseAllMenus
    Dim i As Long
    For i = 1 To UBound(Control)
        If Control(i).Type = __UI_Type_MenuPanel Then
            __UI_DestroyControl Control(i)
        End If
    Next
End Sub
Function __UI_GetActiveMenuIndex (id As Long)
    Dim i As Long
    For i = 1 To __UI_TotalActiveMenus
        If __UI_ActiveMenu(i) = id Then
            __UI_GetActiveMenuIndex = i
            Exit Function
        End If
    Next
End Function
Function __UI_GetParentMenu (id As Long)
    Dim i As Long
    For i = 1 To __UI_TotalActiveMenus
        If __UI_ActiveMenu(i) = id Then
            __UI_GetParentMenu = __UI_ParentMenu(i)
            Exit Function
        End If
    Next
End Function
Sub __UI_ActivateMenu (This As __UI_ControlTYPE, SelectFirstItem As _Byte)
    Dim i As Long, ItemHeight As Single, TotalItems As Integer
    Dim CurrentGroup As Integer, ComboSpacing As Integer
    If Not This.Disabled Then
        If This.Type = __UI_Type_ContextMenu Then __UI_CloseAllMenus: __UI_ForceRedraw = True
        If __UI_GetID(RTrim$(This.Name) + Chr$(254) + "Panel") > 0 Then
            __UI_ActiveMenu(__UI_TotalActiveMenus) = __UI_GetID(RTrim$(This.Name) + Chr$(254) + "Panel")
            If Not __UI_DesignMode Then Exit Sub
        Else
            If __UI_TotalActiveMenus + 1 > UBound(__UI_ActiveMenu) Then
                Exit Sub
            End If
            __UI_ActiveMenu(__UI_TotalActiveMenus + 1) = __UI_NewControl(__UI_Type_MenuPanel, RTrim$(This.Name) + Chr$(254) + "Panel", 0, 0, 0, 0, 0)
            __UI_TotalActiveMenus = __UI_TotalActiveMenus + 1
            If __UI_ActiveMenu(__UI_TotalActiveMenus) = 0 Then
                __UI_TotalActiveMenus = __UI_TotalActiveMenus - 1
                Exit Sub
            End If
        End If
        Control(__UI_ActiveMenu(__UI_TotalActiveMenus)).SourceControl = This.ID
        __UI_ParentMenu(__UI_TotalActiveMenus) = This.ID
        Control(__UI_ActiveMenu(__UI_TotalActiveMenus)).Font = This.Font
        _Font (This.Font)
        If This.Type = __UI_Type_MenuBar Then
            Control(__UI_ActiveMenu(__UI_TotalActiveMenus)).Left = This.Left
            Control(__UI_ActiveMenu(__UI_TotalActiveMenus)).Top = falcon_uspacing& + (((_Font = 8) * -1) * __UI_Font8Offset + ((_Font = 16) * -1) * __UI_Font16Offset) + 3
            __UI_TopMenuBarItem = This.ID
        ElseIf This.Type = __UI_Type_MenuItem Then
            Control(__UI_ActiveMenu(__UI_TotalActiveMenus)).Left = Control(This.MenuPanelID).Left + Control(This.MenuPanelID).Width - __UI_MenuItemOffset / 4
            Control(__UI_ActiveMenu(__UI_TotalActiveMenus)).Top = Control(This.MenuPanelID).Top + This.Top
        ElseIf This.Type = __UI_Type_ContextMenu Then
            If __UI_DesignMode And Left$(This.Name, 5) <> "__UI_" Then
                Control(__UI_ActiveMenu(__UI_TotalActiveMenus)).Left = This.Left + This.Width
                Control(__UI_ActiveMenu(__UI_TotalActiveMenus)).Top = Control(__UI_FormID).Height
            Else
                Control(__UI_ActiveMenu(__UI_TotalActiveMenus)).Left = __UI_MouseLeft
                Control(__UI_ActiveMenu(__UI_TotalActiveMenus)).Top = __UI_MouseTop
            End If
            __UI_ActiveMenuIsContextMenu = True
        End If
        ItemHeight = falcon_uspacing& + (((_Font = 8) * -1) * __UI_Font8Offset + ((_Font = 16) * -1) * __UI_Font16Offset) + 3
        Control(__UI_ActiveMenu(__UI_TotalActiveMenus)).Height = (((_Font = 8) * -1) * 3 + falcon_uspacing&) / 4
        Control(__UI_ActiveMenu(__UI_TotalActiveMenus)).Width = 0
        CurrentGroup = 1
        ComboSpacing = 0
        For i = 1 To UBound(Control)
            If Control(i).ParentID = This.ID And Not Control(i).Hidden Then
                TotalItems = TotalItems + 1
                Control(i).Width = __UI_MenuItemOffset * 2 + __UI_PrintWidth(Caption(i))
                If Control(i).KeyCombo > 0 Then
                    If __UI_MenuItemOffset + __UI_PrintWidth(RTrim$(__UI_KeyCombo(Control(i).KeyCombo).FriendlyCombo)) > ComboSpacing Then
                        ComboSpacing = __UI_MenuItemOffset + __UI_PrintWidth(RTrim$(__UI_KeyCombo(Control(i).KeyCombo).FriendlyCombo))
                    End If
                End If
                If Control(__UI_ActiveMenu(__UI_TotalActiveMenus)).Width < Control(i).Width Then
                    Control(__UI_ActiveMenu(__UI_TotalActiveMenus)).Width = Control(i).Width
                End If
                Control(i).Top = Control(__UI_ActiveMenu(__UI_TotalActiveMenus)).Height
                Control(i).Height = ItemHeight
                Control(i).MenuPanelID = Control(__UI_ActiveMenu(__UI_TotalActiveMenus)).ID
                Control(__UI_ActiveMenu(__UI_TotalActiveMenus)).Height = Control(__UI_ActiveMenu(__UI_TotalActiveMenus)).Height + ItemHeight
                Control(i).MenuItemGroup = CurrentGroup
                If Right$(Caption(i), 1) = "-" Then 'Separator
                    Control(__UI_ActiveMenu(__UI_TotalActiveMenus)).Height = Control(__UI_ActiveMenu(__UI_TotalActiveMenus)).Height + ItemHeight / 3
                    CurrentGroup = CurrentGroup + 1
                End If
            End If
        Next
        Control(__UI_ActiveMenu(__UI_TotalActiveMenus)).Height = Control(__UI_ActiveMenu(__UI_TotalActiveMenus)).Height + (((((_Font = 8) * -1) * __UI_Font8Offset + ((_Font = 16) * -1) * __UI_Font16Offset) + falcon_uspacing&) / 4)
        If Control(__UI_ActiveMenu(__UI_TotalActiveMenus)).Width = 0 Then Control(__UI_ActiveMenu(__UI_TotalActiveMenus)).Width = Control(__UI_FormID).Width / 4
        Control(__UI_ActiveMenu(__UI_TotalActiveMenus)).Width = Control(__UI_ActiveMenu(__UI_TotalActiveMenus)).Width + ComboSpacing
        If __UI_DesignMode And Left$(This.Name, 5) <> "__UI_" Then Control(__UI_ActiveMenu(__UI_TotalActiveMenus)).Height = Control(__UI_ActiveMenu(__UI_TotalActiveMenus)).Height + ItemHeight
        If Control(__UI_ActiveMenu(__UI_TotalActiveMenus)).Left + Control(__UI_ActiveMenu(__UI_TotalActiveMenus)).Width > Control(__UI_FormID).Width Then
            Control(__UI_ActiveMenu(__UI_TotalActiveMenus)).Left = Control(__UI_FormID).Width - Control(__UI_ActiveMenu(__UI_TotalActiveMenus)).Width - 5
            If This.Type = __UI_Type_MenuItem Then
                Control(__UI_ActiveMenu(__UI_TotalActiveMenus)).Left = Control(This.MenuPanelID).Left - Control(__UI_ActiveMenu(__UI_TotalActiveMenus)).Width + __UI_MenuItemOffset / 4
            End If
        End If
        If Control(__UI_ActiveMenu(__UI_TotalActiveMenus)).Top + Control(__UI_ActiveMenu(__UI_TotalActiveMenus)).Height > Control(__UI_FormID).Height Then
            Control(__UI_ActiveMenu(__UI_TotalActiveMenus)).Top = Control(__UI_FormID).Height - Control(__UI_ActiveMenu(__UI_TotalActiveMenus)).Height - 5
            If __UI_DesignMode And Left$(This.Name, 5) <> "__UI_" Then Control(__UI_ActiveMenu(__UI_TotalActiveMenus)).Top = Control(__UI_ActiveMenu(__UI_TotalActiveMenus)).Top - This.Height
        End If
        If SelectFirstItem And Not __UI_DesignMode And TotalItems > 0 Then
            __UI_Focus = __UI_NextMenuItem(0)
        Else
            If TotalItems = 0 Then
                Control(__UI_ActiveMenu(__UI_TotalActiveMenus)).Width = __UI_MenuItemOffset * 2 + __UI_PrintWidth("Add new")
            End If
            __UI_Focus = __UI_ActiveMenu(__UI_TotalActiveMenus)
        End If
    End If
End Sub
Sub __UI_DoEvents
    __UI_ProcessInput
    If __UI_HasInput Then
        __UI_EventDispatcher
    End If
End Sub
Function __UI_TrimAt0$ (Text$)
    If InStr(Text$, Chr$(0)) > 0 Then
        __UI_TrimAt0$ = Left$(Text$, InStr(Text$, Chr$(0)) - 1)
    Else
        __UI_TrimAt0$ = Text$
    End If
End Function
Sub __UI_MakeHardwareImageFromCanvas (This As __UI_ControlTYPE)
    Dim TempCanvas As Long
    If This.ID = 0 Or This.Canvas = 0 Or __UI_DesignMode = True Then Exit Sub
    If This.ParentID = 0 Then
        TempCanvas = _CopyImage(This.Canvas, 33)
        If This.Canvas <> 0 Then _FreeImage This.Canvas
        This.Canvas = TempCanvas
    End If
End Sub
Sub __UI_MakeHardwareImage (This As Long)
    Dim TempCanvas As Long
    If __UI_DesignMode = True Then Exit Sub
    TempCanvas = _CopyImage(This, 33)
    _FreeImage This
    This = TempCanvas
End Sub
Function __UI_FirstMenuBarControl
    Dim i As Long
    For i = 1 To UBound(Control)
        If Control(i).ID > 0 And Control(i).Type = __UI_Type_MenuBar And Not Control(i).Hidden Then
            __UI_FirstMenuBarControl = i
            Exit Function
        End If
    Next
End Function
Function __UI_NextMenuBarControl (CurrentMenuBarControl)
    Dim i As Long
    i = CurrentMenuBarControl
    Do
        i = i + 1
        If i > UBound(Control) Then i = 1
        If i = CurrentMenuBarControl Then Exit Do
        If Control(i).Type = __UI_Type_MenuBar And Not Control(i).Hidden And Not Control(i).Disabled Then
            Exit Do
        End If
    Loop
    __UI_NextMenuBarControl = i
End Function
Function __UI_PreviousMenuBarControl (CurrentMenuBarControl)
    Dim i As Long
    i = CurrentMenuBarControl
    Do
        i = i - 1
        If i < 1 Then i = UBound(Control)
        If i = CurrentMenuBarControl Then Exit Do
        If Control(i).Type = __UI_Type_MenuBar And Not Control(i).Hidden And Not Control(i).Disabled Then
            Exit Do
        End If
    Loop
    __UI_PreviousMenuBarControl = i
End Function
Function __UI_NextMenuItem (CurrentMenuItemControl)
    Dim i As Long
    i = CurrentMenuItemControl
    Do
        i = i + 1
        If i > UBound(Control) Then i = 1
        If i = CurrentMenuItemControl Then Exit Do
        If Control(i).Type = __UI_Type_MenuItem And Not Control(i).Hidden And Control(i).ParentID = __UI_ParentMenu(__UI_TotalActiveMenus) Then
            Exit Do
        End If
    Loop
    __UI_NextMenuItem = i
End Function
Function __UI_PreviousMenuItem (CurrentMenuItemControl)
    Dim i As Long
    i = CurrentMenuItemControl
    Do
        i = i - 1
        If i < 1 Then i = UBound(Control)
        If i = CurrentMenuItemControl Then Exit Do
        If Control(i).Type = __UI_Type_MenuItem And Not Control(i).Hidden And Control(i).ParentID = __UI_ParentMenu(__UI_TotalActiveMenus) Then
            Exit Do
        End If
    Loop
    __UI_PreviousMenuItem = i
End Function
Sub __UI_RefreshMenuBar
    Dim LeftOffset As Integer, i As Long
    Dim TotalItems As Integer, LastMenuItem As Long
    _Font (Control(__UI_FormID).Font)
    For i = 1 To UBound(Control)
        If Control(i).ID > 0 Then
            If Control(i).Type = __UI_Type_MenuBar And Not Control(i).Hidden Then
                TotalItems = TotalItems + 1
                If TotalItems = 1 Then
                    LeftOffset = __UI_MenuBarOffset
                Else
                    LeftOffset = LeftOffset + Control(LastMenuItem).Width
                End If
                Control(i).Width = __UI_MenuBarOffset + __UI_PrintWidth(Caption(i)) + __UI_MenuBarOffset
                If Control(i).Align = __UI_Left Then
                    Control(i).Left = LeftOffset
                Else
                    Control(i).Left = Control(__UI_FormID).Width - 1 - __UI_MenuBarOffset - Control(i).Width
                End If
                LastMenuItem = i
                __UI_NewMenuBarTextLeft = Control(i).Left + Control(i).Width
            End If
        End If
    Next
End Sub
Function FromCP437$ (source$)
    Static init&
    If init& = 0 Then
        Dim i&
        For i& = 0 To 127
            table437$(i&) = Chr$(i&)
        Next i&
        table437$(7) = Chr$(226) + Chr$(151) + Chr$(143) 'UTF-8 e2978f
        table437$(128) = Chr$(&HE2) + Chr$(&H82) + Chr$(&HAC)
        table437$(128) = Chr$(&HC3) + Chr$(&H87)
        table437$(129) = Chr$(&HC3) + Chr$(&HBC)
        table437$(130) = Chr$(&HC3) + Chr$(&HA9)
        table437$(131) = Chr$(&HC3) + Chr$(&HA2)
        table437$(132) = Chr$(&HC3) + Chr$(&HA4)
        table437$(133) = Chr$(&HC3) + Chr$(&HA0)
        table437$(134) = Chr$(&HC3) + Chr$(&HA5)
        table437$(135) = Chr$(&HC3) + Chr$(&HA7)
        table437$(136) = Chr$(&HC3) + Chr$(&HAA)
        table437$(137) = Chr$(&HC3) + Chr$(&HAB)
        table437$(138) = Chr$(&HC3) + Chr$(&HA8)
        table437$(139) = Chr$(&HC3) + Chr$(&HAF)
        table437$(140) = Chr$(&HC3) + Chr$(&HAE)
        table437$(141) = Chr$(&HC3) + Chr$(&HAC)
        table437$(142) = Chr$(&HC3) + Chr$(&H84)
        table437$(143) = Chr$(&HC3) + Chr$(&H85)
        table437$(144) = Chr$(&HC3) + Chr$(&H89)
        table437$(145) = Chr$(&HC3) + Chr$(&HA6)
        table437$(146) = Chr$(&HC3) + Chr$(&H86)
        table437$(147) = Chr$(&HC3) + Chr$(&HB4)
        table437$(148) = Chr$(&HC3) + Chr$(&HB6)
        table437$(149) = Chr$(&HC3) + Chr$(&HB2)
        table437$(150) = Chr$(&HC3) + Chr$(&HBB)
        table437$(151) = Chr$(&HC3) + Chr$(&HB9)
        table437$(152) = Chr$(&HC3) + Chr$(&HBF)
        table437$(153) = Chr$(&HC3) + Chr$(&H96)
        table437$(154) = Chr$(&HC3) + Chr$(&H9C)
        table437$(155) = Chr$(&HC2) + Chr$(&HA2)
        table437$(156) = Chr$(&HC2) + Chr$(&HA3)
        table437$(157) = Chr$(&HC2) + Chr$(&HA5)
        table437$(158) = Chr$(&HE2) + Chr$(&H82) + Chr$(&HA7)
        table437$(159) = Chr$(&HC6) + Chr$(&H92)
        table437$(160) = Chr$(&HC3) + Chr$(&HA1)
        table437$(161) = Chr$(&HC3) + Chr$(&HAD)
        table437$(162) = Chr$(&HC3) + Chr$(&HB3)
        table437$(163) = Chr$(&HC3) + Chr$(&HBA)
        table437$(164) = Chr$(&HC3) + Chr$(&HB1)
        table437$(165) = Chr$(&HC3) + Chr$(&H91)
        table437$(166) = Chr$(&HC2) + Chr$(&HAA)
        table437$(167) = Chr$(&HC2) + Chr$(&HBA)
        table437$(168) = Chr$(&HC2) + Chr$(&HBF)
        table437$(169) = Chr$(&HE2) + Chr$(&H8C) + Chr$(&H90)
        table437$(170) = Chr$(&HC2) + Chr$(&HAC)
        table437$(171) = Chr$(&HC2) + Chr$(&HBD)
        table437$(172) = Chr$(&HC2) + Chr$(&HBC)
        table437$(173) = Chr$(&HC2) + Chr$(&HA1)
        table437$(174) = Chr$(&HC2) + Chr$(&HAB)
        table437$(175) = Chr$(&HC2) + Chr$(&HBB)
        table437$(176) = Chr$(&HE2) + Chr$(&H96) + Chr$(&H91)
        table437$(177) = Chr$(&HE2) + Chr$(&H96) + Chr$(&H92)
        table437$(178) = Chr$(&HE2) + Chr$(&H96) + Chr$(&H93)
        table437$(179) = Chr$(&HE2) + Chr$(&H94) + Chr$(&H82)
        table437$(180) = Chr$(&HE2) + Chr$(&H94) + Chr$(&HA4)
        table437$(181) = Chr$(&HE2) + Chr$(&H95) + Chr$(&HA1)
        table437$(182) = Chr$(&HE2) + Chr$(&H95) + Chr$(&HA2)
        table437$(183) = Chr$(&HE2) + Chr$(&H95) + Chr$(&H96)
        table437$(184) = Chr$(&HE2) + Chr$(&H95) + Chr$(&H95)
        table437$(185) = Chr$(&HE2) + Chr$(&H95) + Chr$(&HA3)
        table437$(186) = Chr$(&HE2) + Chr$(&H95) + Chr$(&H91)
        table437$(187) = Chr$(&HE2) + Chr$(&H95) + Chr$(&H97)
        table437$(188) = Chr$(&HE2) + Chr$(&H95) + Chr$(&H9D)
        table437$(189) = Chr$(&HE2) + Chr$(&H95) + Chr$(&H9C)
        table437$(190) = Chr$(&HE2) + Chr$(&H95) + Chr$(&H9B)
        table437$(191) = Chr$(&HE2) + Chr$(&H94) + Chr$(&H90)
        table437$(192) = Chr$(&HE2) + Chr$(&H94) + Chr$(&H94)
        table437$(193) = Chr$(&HE2) + Chr$(&H94) + Chr$(&HB4)
        table437$(194) = Chr$(&HE2) + Chr$(&H94) + Chr$(&HAC)
        table437$(195) = Chr$(&HE2) + Chr$(&H94) + Chr$(&H9C)
        table437$(196) = Chr$(&HE2) + Chr$(&H94) + Chr$(&H80)
        table437$(197) = Chr$(&HE2) + Chr$(&H94) + Chr$(&HBC)
        table437$(198) = Chr$(&HE2) + Chr$(&H95) + Chr$(&H9E)
        table437$(199) = Chr$(&HE2) + Chr$(&H95) + Chr$(&H9F)
        table437$(200) = Chr$(&HE2) + Chr$(&H95) + Chr$(&H9A)
        table437$(201) = Chr$(&HE2) + Chr$(&H95) + Chr$(&H94)
        table437$(202) = Chr$(&HE2) + Chr$(&H95) + Chr$(&HA9)
        table437$(203) = Chr$(&HE2) + Chr$(&H95) + Chr$(&HA6)
        table437$(204) = Chr$(&HE2) + Chr$(&H95) + Chr$(&HA0)
        table437$(205) = Chr$(&HE2) + Chr$(&H95) + Chr$(&H90)
        table437$(206) = Chr$(&HE2) + Chr$(&H95) + Chr$(&HAC)
        table437$(207) = Chr$(&HE2) + Chr$(&H95) + Chr$(&HA7)
        table437$(208) = Chr$(&HE2) + Chr$(&H95) + Chr$(&HA8)
        table437$(209) = Chr$(&HE2) + Chr$(&H95) + Chr$(&HA4)
        table437$(210) = Chr$(&HE2) + Chr$(&H95) + Chr$(&HA5)
        table437$(211) = Chr$(&HE2) + Chr$(&H95) + Chr$(&H99)
        table437$(212) = Chr$(&HE2) + Chr$(&H95) + Chr$(&H98)
        table437$(213) = Chr$(&HE2) + Chr$(&H95) + Chr$(&H92)
        table437$(214) = Chr$(&HE2) + Chr$(&H95) + Chr$(&H93)
        table437$(215) = Chr$(&HE2) + Chr$(&H95) + Chr$(&HAB)
        table437$(216) = Chr$(&HE2) + Chr$(&H95) + Chr$(&HAA)
        table437$(217) = Chr$(&HE2) + Chr$(&H94) + Chr$(&H98)
        table437$(218) = Chr$(&HE2) + Chr$(&H94) + Chr$(&H8C)
        table437$(219) = Chr$(&HE2) + Chr$(&H96) + Chr$(&H88)
        table437$(220) = Chr$(&HE2) + Chr$(&H96) + Chr$(&H84)
        table437$(221) = Chr$(&HE2) + Chr$(&H96) + Chr$(&H8C)
        table437$(222) = Chr$(&HE2) + Chr$(&H96) + Chr$(&H90)
        table437$(223) = Chr$(&HE2) + Chr$(&H96) + Chr$(&H80)
        table437$(224) = Chr$(&HCE) + Chr$(&HB1)
        table437$(225) = Chr$(&HC3) + Chr$(&H9F)
        table437$(226) = Chr$(&HCE) + Chr$(&H93)
        table437$(227) = Chr$(&HCF) + Chr$(&H80)
        table437$(228) = Chr$(&HCE) + Chr$(&HA3)
        table437$(229) = Chr$(&HCF) + Chr$(&H83)
        table437$(230) = Chr$(&HC2) + Chr$(&HB5)
        table437$(231) = Chr$(&HCF) + Chr$(&H84)
        table437$(232) = Chr$(&HCE) + Chr$(&HA6)
        table437$(233) = Chr$(&HCE) + Chr$(&H98)
        table437$(234) = Chr$(&HCE) + Chr$(&HA9)
        table437$(235) = Chr$(&HCE) + Chr$(&HB4)
        table437$(236) = Chr$(&HE2) + Chr$(&H88) + Chr$(&H9E)
        table437$(237) = Chr$(&HCF) + Chr$(&H86)
        table437$(238) = Chr$(&HCE) + Chr$(&HB5)
        table437$(239) = Chr$(&HE2) + Chr$(&H88) + Chr$(&HA9)
        table437$(240) = Chr$(&HE2) + Chr$(&H89) + Chr$(&HA1)
        table437$(241) = Chr$(&HC2) + Chr$(&HB1)
        table437$(242) = Chr$(&HE2) + Chr$(&H89) + Chr$(&HA5)
        table437$(243) = Chr$(&HE2) + Chr$(&H89) + Chr$(&HA4)
        table437$(244) = Chr$(&HE2) + Chr$(&H8C) + Chr$(&HA0)
        table437$(245) = Chr$(&HE2) + Chr$(&H8C) + Chr$(&HA1)
        table437$(246) = Chr$(&HC3) + Chr$(&HB7)
        table437$(247) = Chr$(&HE2) + Chr$(&H89) + Chr$(&H88)
        table437$(248) = Chr$(&HC2) + Chr$(&HB0)
        table437$(249) = Chr$(&HE2) + Chr$(&H88) + Chr$(&H99)
        table437$(250) = Chr$(&HC2) + Chr$(&HB7)
        table437$(251) = Chr$(&HE2) + Chr$(&H88) + Chr$(&H9A)
        table437$(252) = Chr$(&HE2) + Chr$(&H81) + Chr$(&HBF)
        table437$(253) = Chr$(&HC2) + Chr$(&HB2)
        table437$(254) = Chr$(&HE2) + Chr$(&H96) + Chr$(&HA0)
        table437$(255) = Chr$(&HC2) + Chr$(&HA0)
        init& = -1
    End If
    FromCP437$ = UTF8$(source$, table437$())
End Function
Function FromCP1252$ (source$)
    Static init&
    If init& = 0 Then
        Dim i&
        For i& = 0 To 127
            table1252$(i&) = Chr$(i&)
        Next i&
        table1252$(7) = Chr$(226) + Chr$(151) + Chr$(143) 'UTF-8 e2978f
        table1252$(128) = Chr$(&HE2) + Chr$(&H82) + Chr$(&HAC)
        table1252$(130) = Chr$(&HE2) + Chr$(&H80) + Chr$(&H9A)
        table1252$(131) = Chr$(&HC6) + Chr$(&H92)
        table1252$(132) = Chr$(&HE2) + Chr$(&H80) + Chr$(&H9E)
        table1252$(133) = Chr$(&HE2) + Chr$(&H80) + Chr$(&HA6)
        table1252$(134) = Chr$(&HE2) + Chr$(&H80) + Chr$(&HA0)
        table1252$(135) = Chr$(&HE2) + Chr$(&H80) + Chr$(&HA1)
        table1252$(136) = Chr$(&HCB) + Chr$(&H86)
        table1252$(137) = Chr$(&HE2) + Chr$(&H80) + Chr$(&HB0)
        table1252$(138) = Chr$(&HC5) + Chr$(&HA0)
        table1252$(139) = Chr$(&HE2) + Chr$(&H80) + Chr$(&HB9)
        table1252$(140) = Chr$(&HC5) + Chr$(&H92)
        table1252$(142) = Chr$(&HC5) + Chr$(&HBD)
        table1252$(145) = Chr$(&HE2) + Chr$(&H80) + Chr$(&H98)
        table1252$(146) = Chr$(&HE2) + Chr$(&H80) + Chr$(&H99)
        table1252$(147) = Chr$(&HE2) + Chr$(&H80) + Chr$(&H9C)
        table1252$(148) = Chr$(&HE2) + Chr$(&H80) + Chr$(&H9D)
        table1252$(149) = Chr$(&HE2) + Chr$(&H80) + Chr$(&HA2)
        table1252$(150) = Chr$(&HE2) + Chr$(&H80) + Chr$(&H93)
        table1252$(151) = Chr$(&HE2) + Chr$(&H80) + Chr$(&H94)
        table1252$(152) = Chr$(&HCB) + Chr$(&H9C)
        table1252$(153) = Chr$(&HE2) + Chr$(&H84) + Chr$(&HA2)
        table1252$(154) = Chr$(&HC5) + Chr$(&HA1)
        table1252$(155) = Chr$(&HE2) + Chr$(&H80) + Chr$(&HBA)
        table1252$(156) = Chr$(&HC5) + Chr$(&H93)
        table1252$(158) = Chr$(&HC5) + Chr$(&HBE)
        table1252$(159) = Chr$(&HC5) + Chr$(&HB8)
        table1252$(160) = Chr$(&HC2) + Chr$(&HA0)
        table1252$(161) = Chr$(&HC2) + Chr$(&HA1)
        table1252$(162) = Chr$(&HC2) + Chr$(&HA2)
        table1252$(163) = Chr$(&HC2) + Chr$(&HA3)
        table1252$(164) = Chr$(&HC2) + Chr$(&HA4)
        table1252$(165) = Chr$(&HC2) + Chr$(&HA5)
        table1252$(166) = Chr$(&HC2) + Chr$(&HA6)
        table1252$(167) = Chr$(&HC2) + Chr$(&HA7)
        table1252$(168) = Chr$(&HC2) + Chr$(&HA8)
        table1252$(169) = Chr$(&HC2) + Chr$(&HA9)
        table1252$(170) = Chr$(&HC2) + Chr$(&HAA)
        table1252$(171) = Chr$(&HC2) + Chr$(&HAB)
        table1252$(172) = Chr$(&HC2) + Chr$(&HAC)
        table1252$(173) = Chr$(&HC2) + Chr$(&HAD)
        table1252$(174) = Chr$(&HC2) + Chr$(&HAE)
        table1252$(175) = Chr$(&HC2) + Chr$(&HAF)
        table1252$(176) = Chr$(&HC2) + Chr$(&HB0)
        table1252$(177) = Chr$(&HC2) + Chr$(&HB1)
        table1252$(178) = Chr$(&HC2) + Chr$(&HB2)
        table1252$(179) = Chr$(&HC2) + Chr$(&HB3)
        table1252$(180) = Chr$(&HC2) + Chr$(&HB4)
        table1252$(181) = Chr$(&HC2) + Chr$(&HB5)
        table1252$(182) = Chr$(&HC2) + Chr$(&HB6)
        table1252$(183) = Chr$(&HC2) + Chr$(&HB7)
        table1252$(184) = Chr$(&HC2) + Chr$(&HB8)
        table1252$(185) = Chr$(&HC2) + Chr$(&HB9)
        table1252$(186) = Chr$(&HC2) + Chr$(&HBA)
        table1252$(187) = Chr$(&HC2) + Chr$(&HBB)
        table1252$(188) = Chr$(&HC2) + Chr$(&HBC)
        table1252$(189) = Chr$(&HC2) + Chr$(&HBD)
        table1252$(190) = Chr$(&HC2) + Chr$(&HBE)
        table1252$(191) = Chr$(&HC2) + Chr$(&HBF)
        table1252$(192) = Chr$(&HC3) + Chr$(&H80)
        table1252$(193) = Chr$(&HC3) + Chr$(&H81)
        table1252$(194) = Chr$(&HC3) + Chr$(&H82)
        table1252$(195) = Chr$(&HC3) + Chr$(&H83)
        table1252$(196) = Chr$(&HC3) + Chr$(&H84)
        table1252$(197) = Chr$(&HC3) + Chr$(&H85)
        table1252$(198) = Chr$(&HC3) + Chr$(&H86)
        table1252$(199) = Chr$(&HC3) + Chr$(&H87)
        table1252$(200) = Chr$(&HC3) + Chr$(&H88)
        table1252$(201) = Chr$(&HC3) + Chr$(&H89)
        table1252$(202) = Chr$(&HC3) + Chr$(&H8A)
        table1252$(203) = Chr$(&HC3) + Chr$(&H8B)
        table1252$(204) = Chr$(&HC3) + Chr$(&H8C)
        table1252$(205) = Chr$(&HC3) + Chr$(&H8D)
        table1252$(206) = Chr$(&HC3) + Chr$(&H8E)
        table1252$(207) = Chr$(&HC3) + Chr$(&H8F)
        table1252$(208) = Chr$(&HC3) + Chr$(&H90)
        table1252$(209) = Chr$(&HC3) + Chr$(&H91)
        table1252$(210) = Chr$(&HC3) + Chr$(&H92)
        table1252$(211) = Chr$(&HC3) + Chr$(&H93)
        table1252$(212) = Chr$(&HC3) + Chr$(&H94)
        table1252$(213) = Chr$(&HC3) + Chr$(&H95)
        table1252$(214) = Chr$(&HC3) + Chr$(&H96)
        table1252$(215) = Chr$(&HC3) + Chr$(&H97)
        table1252$(216) = Chr$(&HC3) + Chr$(&H98)
        table1252$(217) = Chr$(&HC3) + Chr$(&H99)
        table1252$(218) = Chr$(&HC3) + Chr$(&H9A)
        table1252$(219) = Chr$(&HC3) + Chr$(&H9B)
        table1252$(220) = Chr$(&HC3) + Chr$(&H9C)
        table1252$(221) = Chr$(&HC3) + Chr$(&H9D)
        table1252$(222) = Chr$(&HC3) + Chr$(&H9E)
        table1252$(223) = Chr$(&HC3) + Chr$(&H9F)
        table1252$(224) = Chr$(&HC3) + Chr$(&HA0)
        table1252$(225) = Chr$(&HC3) + Chr$(&HA1)
        table1252$(226) = Chr$(&HC3) + Chr$(&HA2)
        table1252$(227) = Chr$(&HC3) + Chr$(&HA3)
        table1252$(228) = Chr$(&HC3) + Chr$(&HA4)
        table1252$(229) = Chr$(&HC3) + Chr$(&HA5)
        table1252$(230) = Chr$(&HC3) + Chr$(&HA6)
        table1252$(231) = Chr$(&HC3) + Chr$(&HA7)
        table1252$(232) = Chr$(&HC3) + Chr$(&HA8)
        table1252$(233) = Chr$(&HC3) + Chr$(&HA9)
        table1252$(234) = Chr$(&HC3) + Chr$(&HAA)
        table1252$(235) = Chr$(&HC3) + Chr$(&HAB)
        table1252$(236) = Chr$(&HC3) + Chr$(&HAC)
        table1252$(237) = Chr$(&HC3) + Chr$(&HAD)
        table1252$(238) = Chr$(&HC3) + Chr$(&HAE)
        table1252$(239) = Chr$(&HC3) + Chr$(&HAF)
        table1252$(240) = Chr$(&HC3) + Chr$(&HB0)
        table1252$(241) = Chr$(&HC3) + Chr$(&HB1)
        table1252$(242) = Chr$(&HC3) + Chr$(&HB2)
        table1252$(243) = Chr$(&HC3) + Chr$(&HB3)
        table1252$(244) = Chr$(&HC3) + Chr$(&HB4)
        table1252$(245) = Chr$(&HC3) + Chr$(&HB5)
        table1252$(246) = Chr$(&HC3) + Chr$(&HB6)
        table1252$(247) = Chr$(&HC3) + Chr$(&HB7)
        table1252$(248) = Chr$(&HC3) + Chr$(&HB8)
        table1252$(249) = Chr$(&HC3) + Chr$(&HB9)
        table1252$(250) = Chr$(&HC3) + Chr$(&HBA)
        table1252$(251) = Chr$(&HC3) + Chr$(&HBB)
        table1252$(252) = Chr$(&HC3) + Chr$(&HBC)
        table1252$(253) = Chr$(&HC3) + Chr$(&HBD)
        table1252$(254) = Chr$(&HC3) + Chr$(&HBE)
        table1252$(255) = Chr$(&HC3) + Chr$(&HBF)
        init& = -1
    End If
    FromCP1252$ = UTF8$(source$, table1252$())
End Function
Function UTF8$ (source$, table$())
    Dim i As Long, dest$
    For i = 1 To Len(source$)
        dest$ = dest$ + table$(Asc(source$, i))
    Next i
    UTF8$ = dest$
End Function
Function GetControlDrawOrder& (ctrlRef As Long)
    Dim i As Long
    For i& = 1 To UBound(ControlDrawOrder)
        If ControlDrawOrder(i&) = ctrlRef Then GetControlDrawOrder& = i&: Exit Function
    Next i&
End Function
Sub __UI_ExpandControlDrawOrder (size&)
    ReDim _Preserve ControlDrawOrder(UBound(ControlDrawOrder) + size&) As Long
End Sub
Function IconPreview& (IconFile$)
    Dim IconFileNum As Integer
    Dim Preferred As Integer, Largest As Integer
    Dim i As Long, a$
    Type ICONTYPE
        Reserved As Integer: ID As Integer: Count As Integer
    End Type
    Type ICONENTRY
        PWidth As _Unsigned _Byte: PDepth As _Unsigned _Byte
        NumColors As _Byte: RES2 As _Byte
        NumberPlanes As Integer: BitsPerPixel As Integer
        DataSize As Long: DataOffset As Long
    End Type
    Type BMPENTRY
        ID As String * 2: Size As Long: Res1 As Integer: Res2 As Integer: Offset As Long
    End Type
    Type BMPHeader
        Hsize As Long: PWidth As Long: PDepth As Long
        Planes As Integer: BPP As Integer
        Compression As Long: ImageBytes As Long
        Xres As Long: Yres As Long: NumColors As Long: SigColors As Long
    End Type
    Dim ICO As ICONTYPE
    Dim BMP As BMPENTRY
    Dim BMPHeader As BMPHeader
    If _FileExists(IconFile$) = 0 Then Exit Function
    IconFileNum = FreeFile
    Open IconFile$ For Binary As #IconFileNum
    Get #IconFileNum, 1, ICO
    If ICO.ID <> 1 Then Close #IconFileNum: Exit Function
    Dim Entry(ICO.Count) As ICONENTRY
    Preferred = 0
    Largest = 0
    For i = 1 To ICO.Count
        Get #IconFileNum, , Entry(i)
        If Entry(i).BitsPerPixel = 32 Then
            If Entry(i).PWidth = 0 Then Entry(i).PWidth = 256
            If Entry(i).PWidth > Largest Then Largest = Entry(i).PWidth: Preferred = i
        End If
    Next
    If Preferred = 0 Then Exit Function
    a$ = Space$(Entry(Preferred).DataSize)
    Get #IconFileNum, Entry(Preferred).DataOffset + 1, a$
    Close #IconFileNum
    If Left$(a$, 4) = Chr$(137) + "PNG" Then
        Open IconFile$ + ".preview.png" For Binary As #IconFileNum
        Put #IconFileNum, 1, a$
        Close #IconFileNum
        i = _LoadImage(IconFile$ + ".preview.png", 32)
        If i = -1 Then i = 0
        IconPreview& = i
        Kill IconFile$ + ".preview.png"
        Exit Function
    Else
        BMP.ID = "BM"
        BMP.Size = Len(BMP) + Len(BMPHeader) + Len(a$)
        BMP.Offset = Len(BMP) + Len(BMPHeader)
        BMPHeader.Hsize = 40
        BMPHeader.PWidth = Entry(Preferred).PWidth
        BMPHeader.PDepth = Entry(Preferred).PDepth: If BMPHeader.PDepth = 0 Then BMPHeader.PDepth = 256
        BMPHeader.Planes = 1
        BMPHeader.BPP = 32
        Open IconFile$ + ".preview.bmp" For Binary As #IconFileNum
        Put #IconFileNum, 1, BMP
        Put #IconFileNum, , BMPHeader
        a$ = Mid$(a$, 41)
        Put #IconFileNum, , a$
        Close #IconFileNum
        i = _LoadImage(IconFile$ + ".preview.bmp", 32)
        If i < -1 Then 'Loaded properly
            _Source i
            If Point(0, 0) = _RGB32(0, 0, 0) Then _ClearColor _RGB32(0, 0, 0), i
            _Source 0
        Else
            i = 0
        End If
        IconPreview& = i
        Kill IconFile$ + ".preview.bmp"
        Exit Function
    End If
End Function
Function RestoreCHR$ (__Text$)
    Dim Text$, BackSlash As Long, SemiColon As Long
    Dim j As Long, tempNum$
    Text$ = __Text$
    If InStr(Text$, "\") = 0 Then
        RestoreCHR$ = Text$
        Exit Function
    End If
    Do
        BackSlash = InStr(BackSlash + 1, Text$, "\")
        If BackSlash = 0 Then Exit Do
        SemiColon = InStr(BackSlash + 1, Text$, ";")
        If SemiColon = 0 Then _Continue
        If Mid$(Text$, BackSlash + 1, 1) = "\" Then
            Text$ = Left$(Text$, BackSlash) + Mid$(Text$, BackSlash + 2)
            _Continue
        End If
        tempNum$ = ""
        For j = BackSlash + 1 To SemiColon - 1
            If Asc(Text$, j) < 48 Or Asc(Text$, j) > 57 Then tempNum$ = "": Exit For
            tempNum$ = tempNum$ + Mid$(Text$, j, 1)
        Next
        If Len(tempNum$) Then
            Text$ = Left$(Text$, BackSlash - 1) + Chr$(Val(tempNum$)) + Mid$(Text$, SemiColon + 1)
        End If
    Loop
    RestoreCHR$ = Text$
End Function
Sub __UI_DrawButton (This As __UI_ControlTYPE, ControlState As _Byte)
    Dim TempCaption$
    Dim PrevDest As Long, TempControlState As _Byte
    Static ControlImage As Long
    Const ButtonHeight = 21
    Const ButtonWidth = 18
    If ControlImage = 0 Then ControlImage = __UI_LoadThemeImage("button.png")
    TempControlState = ControlState
    If TempControlState = 1 Then
        If (This.ID = __UI_DefaultButtonID And This.ID <> __UI_Focus And Control(__UI_Focus).Type <> __UI_Type_Button) Or This.ID = __UI_Focus Then
            TempControlState = 5
        End If
    End If
    IF This.Redraw OR This.ControlState <> TempControlState OR This.FocusState <> (__UI_Focus = This.ID) OR Caption(This.ID) <> __UI_TempCaptions(This.ID) OR This.PreviousParentID <> This.ParentID OR __UI_ForceRedraw _
       OR This.Font <> This.PreviousFont THEN
        This.Redraw = False
        This.ControlState = TempControlState
        This.PreviousFont = This.Font
        This.FocusState = __UI_Focus = This.ID
        __UI_TempCaptions(This.ID) = Caption(This.ID)
        This.PreviousParentID = This.ParentID
        If This.ParentID Then Control(This.ParentID).ChildrenRedrawn = True
        If This.Canvas <> 0 Then
            _FreeImage This.Canvas
        End If
        This.Canvas = _NewImage(This.Width, This.Height, 32)
        PrevDest = _Dest
        _Dest This.Canvas
        _Font (This.Font)
        Cls , _RGBA32(0, 0, 0, 0)
        TempCaption$ = __UI_TrimAt0$(Caption(This.ID))
        _PutImage (0, 3)-(This.Width - 1, This.Height - 4), ControlImage, , (3, TempControlState * ButtonHeight - ButtonHeight + 3)-Step(11, ButtonHeight - 7)
        Dim IconWidth As Integer, IconHeight As Integer
        If This.HelperCanvas < -1 Then
            If Len(TempCaption$) Then
                IconHeight = This.Height - 6
                IconWidth = _Width(This.HelperCanvas) * IconHeight / _Height(This.HelperCanvas)
                _PutImage ((This.Width \ 2 - __UI_PrintWidth&(TempCaption$) \ 2) - ((IconWidth / 2) + 5), This.Height / 2 - ((This.Height - 4) / 2) + 1)-Step(IconWidth - 1, IconHeight - 1), This.HelperCanvas
            Else
                Dim PictureOffsetX As Integer, PictureOffsetY As Integer
                If This.ControlState = 3 Then
                    PictureOffsetX = 1
                    PictureOffsetY = 1
                End If
                IconHeight = This.Height - 6
                IconWidth = _Width(This.HelperCanvas) * (IconHeight / _Height(This.HelperCanvas))
                _PutImage (This.Width \ 2 - ((IconWidth \ 2)) + PictureOffsetX, This.Height / 2 - ((This.Height - 4) / 2) + 1 + PictureOffsetY)-Step(IconWidth - 1, IconHeight - 1), This.HelperCanvas
            End If
        End If
        _PutImage (3, 0)-Step(This.Width - 6, 3), ControlImage, , (3, TempControlState * ButtonHeight - ButtonHeight)-Step(11, 3)
        _PutImage (3, This.Height - 3)-Step(This.Width - 6, 3), ControlImage, , (3, TempControlState * ButtonHeight - ButtonHeight + 18)-Step(11, 3)
        _PutImage (0, 2)-Step(2, This.Height - 4), ControlImage, , (0, TempControlState * ButtonHeight - ButtonHeight + 2)-Step(2, ButtonHeight - 6)
        _PutImage (0, 0), ControlImage, , (0, TempControlState * ButtonHeight - ButtonHeight)-Step(2, 2)
        _PutImage (0, This.Height - 3), ControlImage, , (0, TempControlState * ButtonHeight - 3)-Step(2, 2)
        _PutImage (This.Width - 3, 2)-Step(2, This.Height - 4), ControlImage, , (ButtonWidth - 3, TempControlState * ButtonHeight - ButtonHeight + 2)-Step(2, ButtonHeight - 6)
        _PutImage (This.Width - 2, 0), ControlImage, , (ButtonWidth - 2, TempControlState * ButtonHeight - ButtonHeight)-Step(2, 2)
        _PutImage (This.Width - 3, This.Height - 3), ControlImage, , (ButtonWidth - 3, TempControlState * ButtonHeight - 3)-Step(2, 2)
        If Not This.Disabled Then
            Color This.ForeColor
        Else
            Color Darken(Control(__UI_FormID).BackColor, 80)
        End If
        __UI_PrintString (IconWidth / 2) + (This.Width \ 2 - __UI_PrintWidth&(TempCaption$) \ 2), ((This.Height \ 2) - uheight& \ 2), TempCaption$
        If (This.HotKey > 0 And (__UI_ShowHotKeys And Not This.Disabled)) Or (This.HotKey > 0 And __UI_DesignMode) Then
            Line ((This.Width \ 2 - __UI_PrintWidth&(TempCaption$) \ 2) + This.HotKeyOffset, ((This.Height \ 2) + uheight& \ 2))-Step(__UI_PrintWidth&(Chr$(This.HotKey)) - 1, 0), This.ForeColor
        End If
        If __UI_Focus = This.ID And __UI_KeyboardFocus Then
            Line (2, 2)-Step(This.Width - 5, This.Height - 5), _RGB32(0, 0, 0), B , 21845
        End If
        __UI_MakeHardwareImageFromCanvas This
        _Dest PrevDest
    End If
    If This.Canvas Then _PutImage (This.Left, This.Top), This.Canvas
End Sub
Sub __UI_DrawLabel (This As __UI_ControlTYPE, ControlState As _Byte)
    Dim PrevDest As Long, i As Long
    Dim CaptionIndent As Integer, TempCaption$, TempLine$
    IF This.Redraw OR This.ControlState <> ControlState OR Caption(This.ID) <> __UI_TempCaptions(This.ID) OR This.PreviousParentID <> This.ParentID OR __UI_ForceRedraw _
       OR This.PreviousFont <> This.Font THEN
        This.Redraw = False
        This.ControlState = ControlState
        This.PreviousFont = This.Font
        __UI_TempCaptions(This.ID) = Caption(This.ID)
        If This.ParentID Then Control(This.ParentID).ChildrenRedrawn = True
        This.PreviousParentID = This.ParentID
        If This.Canvas <> 0 Then
            _FreeImage This.Canvas
        End If
        This.Canvas = _NewImage(This.Width, This.Height, 32)
        PrevDest = _Dest
        _Dest This.Canvas
        _Font This.Font
        If This.HasBorder Then
            If This.BorderSize > __UI_MaxBorderSize Then
                This.BorderSize = __UI_MaxBorderSize
            ElseIf This.BorderSize < 1 Then
                This.BorderSize = 1
            End If
            CaptionIndent = __UI_DefaultCaptionIndent + This.BorderSize
        End If
        If This.BackStyle = __UI_Opaque Then
            Cls , This.BackColor
        Else
            Cls , _RGBA32(0, 0, 0, 0)
        End If
        If Not This.Disabled Then
            Color This.ForeColor
        Else
            Color Darken(Control(__UI_FormID).BackColor, 80)
        End If
        Dim CaptionLeft As Integer, FindLF&, FindSep&, ThisLine%
        Dim CaptionLeftFirstLine As Integer, CaptionTopFirstLine As Integer, TextTop%
        Dim TotalLines As Integer
        If This.WordWrap Then
            TempCaption$ = __UI_TrimAt0$(__UI_WordWrap(Caption(This.ID), This.Width - ((CaptionIndent + This.Padding) * 2), 0, TotalLines))
            Do While Len(TempCaption$)
                ThisLine% = ThisLine% + 1
                If This.VAlign = __UI_Top Then
                    TextTop% = CaptionIndent + ThisLine% * uspacing& - uspacing&
                ElseIf This.VAlign = __UI_Middle Then
                    If TotalLines < This.Height \ uspacing& Then
                        TextTop% = (This.Height \ 2) - ((TotalLines * uspacing& - uspacing&) \ 2) - uspacing& \ 2 + (((ThisLine%) * uspacing& - uspacing&))
                    Else
                        TextTop% = CaptionIndent + ThisLine% * uspacing& - uspacing&
                    End If
                ElseIf This.VAlign = __UI_Bottom Then
                    TextTop% = This.Height - CaptionIndent - (TotalLines * uspacing&) + (ThisLine% * uspacing& - uspacing&)
                End If
                FindSep& = InStr(TempCaption$, Chr$(1)) 'Search for soft breaks
                FindLF& = InStr(TempCaption$, Chr$(10)) 'Search for hard breaks
                If (FindSep& > 0 And FindLF& > 0 And FindSep& < FindLF&) Or (FindSep& > 0 And FindLF& = 0) Then
                    TempLine$ = Left$(TempCaption$, FindSep& - 1)
                    TempCaption$ = Mid$(TempCaption$, FindSep& + 1)
                ElseIf FindSep& = 0 Then
                    If FindLF& > 0 Then
                        TempLine$ = Left$(TempCaption$, FindLF& - 1)
                        TempCaption$ = Mid$(TempCaption$, FindLF& + 1)
                    Else
                        TempLine$ = TempCaption$
                        TempCaption$ = ""
                    End If
                End If
                Select Case This.Align
                    Case __UI_Left
                        CaptionLeft = CaptionIndent + This.Padding
                    Case __UI_Center
                        CaptionLeft = (This.Width \ 2 - __UI_PrintWidth&(TempLine$) \ 2)
                    Case __UI_Right
                        CaptionLeft = (This.Width - __UI_PrintWidth&(TempLine$)) - (CaptionIndent + This.Padding)
                End Select
                __UI_PrintString CaptionLeft, TextTop%, TempLine$
                If ThisLine% = 1 Then CaptionLeftFirstLine = CaptionLeft: CaptionTopFirstLine = TextTop%
            Loop
            If (This.HotKey > 0 And (__UI_ShowHotKeys And Not This.Disabled)) Or (This.HotKey > 0 And __UI_DesignMode) Then
                Line (CaptionLeftFirstLine + This.HotKeyOffset, CaptionTopFirstLine + uspacing&)-Step(__UI_PrintWidth&(Chr$(This.HotKey)) - 1, 0), This.ForeColor
            End If
        Else
            TempCaption$ = __UI_TrimAt0$(Caption(This.ID))
            Select Case This.Align
                Case __UI_Left
                    CaptionLeft = CaptionIndent + This.Padding
                Case __UI_Center
                    CaptionLeft = (This.Width \ 2 - __UI_PrintWidth&(TempCaption$) \ 2)
                Case __UI_Right
                    CaptionLeft = This.Width - __UI_PrintWidth&(TempCaption$) - (CaptionIndent + This.Padding)
            End Select
            If This.VAlign = __UI_Top Then
                TextTop% = CaptionIndent
            ElseIf This.VAlign = __UI_Middle Then
                TextTop% = (This.Height \ 2) - uspacing& \ 2
            ElseIf This.VAlign = __UI_Bottom Then
                TextTop% = This.Height - CaptionIndent - uspacing&
            End If
            CaptionLeftFirstLine = CaptionLeft
            __UI_PrintString CaptionLeft, TextTop%, TempCaption$
            If (This.HotKey > 0 And (__UI_ShowHotKeys And Not This.Disabled)) Or (This.HotKey > 0 And __UI_DesignMode) Then
                Line (CaptionLeftFirstLine + This.HotKeyOffset, (TextTop% + uspacing&))-Step(__UI_PrintWidth&(Chr$(This.HotKey)) - 1, 0), This.ForeColor
            End If
        End If
        If This.HasBorder Then
            For i = 0 To This.BorderSize - 1
                Line (i, i)-Step(This.Width - 1 - i * 2, This.Height - 1 - i * 2), This.BorderColor, B
            Next
        End If
        __UI_MakeHardwareImageFromCanvas This
        _Dest PrevDest
    End If
    If This.Canvas Then _PutImage (This.Left, This.Top), This.Canvas
End Sub
Sub __UI_DrawToggleSwitch (This As __UI_ControlTYPE, ControlState As _Byte)
    Dim PrevDest As Long
    Dim CaptionIndent As Integer
    Const ImageHeight = 15
    Const ImageWidth = 30
    IF This.Redraw OR This.ControlState <> ControlState OR TIMER - This.LastChange < .5 OR This.FocusState <> (__UI_Focus = This.ID) OR Caption(This.ID) <> __UI_TempCaptions(This.ID) OR This.Value <> This.PreviousValue OR This.PreviousParentID <> This.ParentID _
       OR __UI_ForceRedraw OR This.PreviousFont <> This.Font THEN
        This.Redraw = False
        This.ControlState = ControlState
        This.PreviousFont = This.Font
        This.FocusState = __UI_Focus = This.ID
        If This.PreviousValue <> This.Value Then
            __UI_StateHasChanged = True
            This.PreviousValue = This.Value
        End If
        __UI_TempCaptions(This.ID) = Caption(This.ID)
        If This.ParentID Then Control(This.ParentID).ChildrenRedrawn = True
        This.PreviousParentID = This.ParentID
        If This.Canvas <> 0 Then
            _FreeImage This.Canvas
        End If
        If This.Height < ImageHeight Then This.Height = ImageHeight
        If This.Width < ImageWidth Then This.Width = ImageWidth
        This.Canvas = _NewImage(This.Width + 1, This.Height + 1, 32)
        PrevDest = _Dest
        _Dest This.Canvas
        _Font This.Font
        If This.BackStyle = __UI_Opaque Then
            Cls , This.BackColor
        Else
            Cls , _RGBA32(0, 0, 0, 0)
        End If
        CaptionIndent = 0
        Dim AnimationOffset As Single
        AnimationOffset = __UI_MAP(Timer - This.LastChange, 0, .2, This.Width / 2, 0)
        If AnimationOffset < 0 Then AnimationOffset = 0
        If AnimationOffset > This.Width / 2 Then AnimationOffset = This.Width / 2
        If This.Value Then
            If Not This.Disabled Then
                Line (0, 0)-(This.Width, This.Height), This.SelectedBackColor, BF
            Else
                Line (0, 0)-(This.Width, This.Height), Darken(This.SelectedBackColor, 150), BF
            End If
            Line (This.Width / 2 + 4 - AnimationOffset, 4)-Step(This.Width / 2 - 8, This.Height - 8), This.SelectedForeColor, BF
            Line (0, 0)-(This.Width, This.Height), This.BorderColor, B
        Else
            If Not This.Disabled Then
                Line (0, 0)-(This.Width, This.Height), This.BackColor, BF
            Else
                Line (0, 0)-(This.Width, This.Height), Darken(This.BackColor, 80), BF
            End If
            Line (4 + AnimationOffset, 4)-Step(This.Width / 2 - 8, This.Height - 8), This.ForeColor, BF
            Line (0, 0)-(This.Width, This.Height), This.BorderColor, B
        End If
        If __UI_Focus = This.ID And __UI_KeyboardFocus Then
            Line (1, 1)-Step(This.Width - 2, This.Height - 2), _RGB32(0, 0, 0), B , 21845
        End If
        __UI_MakeHardwareImageFromCanvas This
        _Dest PrevDest
    End If
    If This.Canvas Then _PutImage (This.Left, This.Top), This.Canvas
End Sub
Sub __UI_DrawRadioButton (This As __UI_ControlTYPE, ControlState As _Byte)
    Dim PrevDest As Long
    Dim CaptionIndent As Integer, TempCaption$
    Static ControlImage As Long
    Const ImageHeight = 13
    Const ImageWidth = 13
    If ControlImage = 0 Then ControlImage = __UI_LoadThemeImage("radiobutton.png")
    IF This.Redraw OR This.ControlState <> ControlState OR This.FocusState <> (__UI_Focus = This.ID) OR Caption(This.ID) <> __UI_TempCaptions(This.ID) OR This.Value <> This.PreviousValue OR This.PreviousParentID <> This.ParentID _
       OR __UI_ForceRedraw OR This.PreviousFont <> This.Font THEN
        This.Redraw = False
        This.PreviousFont = This.Font
        This.ControlState = ControlState
        This.FocusState = __UI_Focus = This.ID
        This.PreviousValue = This.Value
        __UI_TempCaptions(This.ID) = Caption(This.ID)
        If This.ParentID Then Control(This.ParentID).ChildrenRedrawn = True
        This.PreviousParentID = This.ParentID
        If This.Canvas <> 0 Then
            _FreeImage This.Canvas
        End If
        If This.Height < ImageHeight Then This.Height = ImageHeight
        This.Canvas = _NewImage(This.Width + 1, This.Height + 1, 32)
        PrevDest = _Dest
        _Dest This.Canvas
        _Font This.Font
        If This.BackStyle = __UI_Opaque Then
            Cls , This.BackColor
        Else
            Cls , _RGBA32(0, 0, 0, 0)
        End If
        CaptionIndent = 0
        If This.HasBorder Then
            CaptionIndent = 5
            Line (0, 0)-Step(This.Width - 1, This.Height - 1), This.BorderColor, B
        End If
        If This.Value Then ControlState = ControlState + 4
        _PutImage (0, This.Height \ 2 - (ImageHeight \ 2))-Step(ImageWidth - 1, ImageHeight - 1), ControlImage, , (0, ControlState * ImageHeight - ImageHeight)-Step(12, 12)
        CaptionIndent = CaptionIndent + ImageWidth * 1.5
        TempCaption$ = __UI_TrimAt0$(Caption(This.ID))
        If Not This.Disabled Then
            Color This.ForeColor
        Else
            Color Darken(Control(__UI_FormID).BackColor, 80)
        End If
        __UI_PrintString CaptionIndent, ((This.Height \ 2) - uspacing& \ 2) + 1, TempCaption$
        If (This.HotKey > 0 And (__UI_ShowHotKeys And Not This.Disabled)) Or (This.HotKey > 0 And __UI_DesignMode) Then
            Line (CaptionIndent + This.HotKeyOffset, ((This.Height \ 2) + uspacing& \ 2))-Step(__UI_PrintWidth(Chr$(This.HotKey)) - 1, 0), This.ForeColor
        End If
        If __UI_Focus = This.ID And __UI_KeyboardFocus Then
            Line (CaptionIndent - 1, 0)-Step(This.Width - CaptionIndent - 1, This.Height - 1), _RGB32(0, 0, 0), B , 21845
        End If
        __UI_MakeHardwareImageFromCanvas This
        _Dest PrevDest
    End If
    If This.Canvas Then _PutImage (This.Left, This.Top), This.Canvas
End Sub
Sub __UI_DrawCheckBox (This As __UI_ControlTYPE, ControlState As _Byte)
    Dim PrevDest As Long
    Dim CaptionIndent As Integer, TempCaption$
    Static ControlImage As Long
    Const ImageHeight = 13
    Const ImageWidth = 13
    If ControlImage = 0 Then ControlImage = __UI_LoadThemeImage("checkbox.png")
    IF This.Redraw OR This.ControlState <> ControlState OR This.FocusState <> (__UI_Focus = This.ID) OR Caption(This.ID) <> __UI_TempCaptions(This.ID) OR This.Value <> This.PreviousValue OR This.PreviousParentID <> This.ParentID _
       OR __UI_ForceRedraw OR This.PreviousFont <> This.Font THEN
        This.Redraw = False
        This.ControlState = ControlState
        This.PreviousFont = This.Font
        This.FocusState = __UI_Focus = This.ID
        If This.PreviousValue <> This.Value Then
            __UI_StateHasChanged = True
            This.PreviousValue = This.Value
        End If
        __UI_TempCaptions(This.ID) = Caption(This.ID)
        If This.ParentID Then Control(This.ParentID).ChildrenRedrawn = True
        This.PreviousParentID = This.ParentID
        If This.Canvas <> 0 Then
            _FreeImage This.Canvas
        End If
        If This.Height < ImageHeight Then This.Height = ImageHeight
        This.Canvas = _NewImage(This.Width + 2, This.Height + 2, 32)
        PrevDest = _Dest
        _Dest This.Canvas
        _Font This.Font
        If This.BackStyle = __UI_Opaque Then
            Cls , This.BackColor
        Else
            Cls , _RGBA32(0, 0, 0, 0)
        End If
        CaptionIndent = 0
        If This.Value Then ControlState = ControlState + 4
        _PutImage (0, This.Height \ 2 - (ImageHeight \ 2))-Step(ImageWidth - 1, ImageHeight - 1), ControlImage, , (0, ControlState * ImageHeight - ImageHeight)-Step(ImageWidth - 1, ImageHeight - 1)
        CaptionIndent = CaptionIndent + ImageWidth * 1.5
        TempCaption$ = __UI_TrimAt0$(Caption(This.ID))
        If Not This.Disabled Then
            Color This.ForeColor
        Else
            Color Darken(Control(__UI_FormID).BackColor, 80)
        End If
        __UI_PrintString CaptionIndent, ((This.Height \ 2) - uspacing& \ 2) + 1, TempCaption$
        If (This.HotKey > 0 And (__UI_ShowHotKeys And Not This.Disabled)) Or (This.HotKey > 0 And __UI_DesignMode) Then
            Line (CaptionIndent + This.HotKeyOffset, ((This.Height \ 2) + uspacing& \ 2))-Step(__UI_PrintWidth(Chr$(This.HotKey)) - 1, 0), This.ForeColor
        End If
        If __UI_Focus = This.ID And __UI_KeyboardFocus Then
            Line (CaptionIndent - 1, 0)-Step(This.Width - CaptionIndent - 1, This.Height - 1), _RGB32(0, 0, 0), B , 21845
        End If
        __UI_MakeHardwareImageFromCanvas This
        _Dest PrevDest
    End If
    If This.Canvas Then _PutImage (This.Left, This.Top), This.Canvas
End Sub
Sub __UI_DrawProgressBar (This As __UI_ControlTYPE, ControlState)
    Dim PrevDest As Long, Temp&
    Dim TempCaption$
    Static ControlImage_Track As Long, ControlImage_Chunk As Long
    If ControlImage_Chunk = 0 Then ControlImage_Chunk = __UI_LoadThemeImage("progresschunk.png")
    If ControlImage_Track = 0 Then ControlImage_Track = __UI_LoadThemeImage("progresstrack.png")
    IF This.Redraw OR This.ControlState <> ControlState OR This.FocusState <> (__UI_Focus = This.ID) OR Caption(This.ID) <> __UI_TempCaptions(This.ID) OR This.Value <> This.PreviousValue OR This.PreviousParentID <> This.ParentID _
       OR __UI_ForceRedraw OR This.PreviousFont <> This.Font THEN
        This.Redraw = False
        This.PreviousFont = This.Font
        This.ControlState = ControlState
        This.FocusState = __UI_Focus = This.ID
        This.PreviousValue = This.Value
        __UI_TempCaptions(This.ID) = Caption(This.ID)
        If This.ParentID Then Control(This.ParentID).ChildrenRedrawn = True
        This.PreviousParentID = This.ParentID
        If This.Canvas <> 0 Then
            _FreeImage This.Canvas
        End If
        This.Canvas = _NewImage(This.Width, This.Height, 32)
        PrevDest = _Dest
        _Dest This.Canvas
        _Font (This.Font)
        Cls , _RGBA32(0, 0, 0, 0)
        _PutImage (5, 4)-Step(This.Width - 9, This.Height - 8), ControlImage_Track, , (5, 4)-Step(0, 11)
        _PutImage (0, 0), ControlImage_Track, , (0, 0)-(4, 4) 'top corner
        _PutImage (0, This.Height - 3), ControlImage_Track, , (0, 16)-Step(3, 2) 'bottom corner
        _PutImage (0, 4)-(4, This.Height - 4), ControlImage_Track, , (0, 4)-Step(4, 11) 'vertical stretch
        _PutImage (This.Width - 4, 0), ControlImage_Track, , (6, 0)-Step(2, 3) 'top corner
        _PutImage (This.Width - 4, This.Height - 3), ControlImage_Track, , (6, 16)-Step(2, 3) 'bottom corner
        _PutImage (This.Width - 4, 4)-Step(2, This.Height - 8), ControlImage_Track, , (6, 4)-Step(2, 11) 'vertical stretch
        _PutImage (4, 0)-Step(This.Width - 9, 3), ControlImage_Track, , (4, 0)-Step(1, 3)
        _PutImage (4, This.Height - 3)-Step(This.Width - 9, 2), ControlImage_Track, , (4, 16)-Step(1, 2)
        If This.Value Then
            _PutImage (4, 3)-Step(((This.Width - 9) / This.Max) * This.Value, This.Height - 7), ControlImage_Chunk
        End If
        If This.ShowPercentage And Len(Caption(This.ID)) > 0 Then
            Dim ProgressString$, ReplaceCode%
            ProgressString$ = LTrim$(Str$(Fix((This.Value / This.Max) * 100))) + "%"
            If Len(Caption(This.ID)) Then
                TempCaption$ = __UI_TrimAt0$(Caption(This.ID))
                ReplaceCode% = InStr(TempCaption$, "\#")
                If ReplaceCode% Then
                    TempCaption$ = Left$(TempCaption$, ReplaceCode% - 1) + ProgressString$ + Mid$(TempCaption$, ReplaceCode% + 2)
                End If
            Else
                TempCaption$ = ProgressString$
            End If
            If Not This.Disabled Then
                Color This.ForeColor
            Else
                Color Darken(Control(__UI_FormID).BackColor, 70)
            End If
            Temp& = __UI_PrintWidth(TempCaption$)
            __UI_PrintString This.Width \ 2 - Temp& \ 2, This.Height \ 2 - uspacing& \ 2 + 1, TempCaption$
        End If
        __UI_MakeHardwareImageFromCanvas This
        _Dest PrevDest
    End If
    If This.Canvas Then _PutImage (This.Left, This.Top), This.Canvas
End Sub
Sub __UI_DrawTrackBar (This As __UI_ControlTYPE, ControlState)
    Dim PrevDest As Long, i As Long, TempControlState As _Byte
    Static ControlImage_Track As Long, ControlImage_Slider As Long
    Const SliderHeight = 21
    Const SliderWidth = 11
    If ControlImage_Track = 0 Then ControlImage_Track = __UI_LoadThemeImage("slidertrack.png")
    If ControlImage_Slider = 0 Then
        ControlImage_Slider = __UI_LoadThemeImage("sliderdown.png")
        __UI_ClearColor ControlImage_Slider, 0, 0
    End If
    TempControlState = ControlState
    If This.Disabled Then TempControlState = 5
    IF This.Redraw OR This.ControlState <> TempControlState OR This.FocusState <> (__UI_Focus = This.ID) OR This.Value <> This.PreviousValue OR This.PreviousParentID <> This.ParentID _
       OR __UI_ForceRedraw OR This.PreviousFont <> This.Font THEN
        This.Redraw = False
        This.ControlState = TempControlState
        This.PreviousFont = This.Font
        This.FocusState = __UI_Focus = This.ID
        If This.PreviousValue <> This.Value Then
            __UI_StateHasChanged = True
            This.PreviousValue = This.Value
        End If
        If This.ParentID Then Control(This.ParentID).ChildrenRedrawn = True
        This.PreviousParentID = This.ParentID
        If This.Canvas <> 0 Then
            _FreeImage This.Canvas
        End If
        This.Canvas = _NewImage(This.Width, This.Height, 32)
        PrevDest = _Dest
        _Dest This.Canvas
        _Font (This.Font)
        Cls , _RGBA32(0, 0, 0, 0)
        _PutImage (3, 10), ControlImage_Track, , (0, 0)-Step(1, 4)
        _PutImage (5, 10)-Step(This.Width - 10, 5), ControlImage_Track, , (2, 0)-Step(0, 4)
        _PutImage (This.Width - 4, 10), ControlImage_Track, , (3, 0)-Step(1, 4)
        Dim IntervalSize As Integer, MinIntervalSize As Integer
        MinIntervalSize = 2
        Line (5, 30)-Step(0, 3), This.BorderColor
        If This.Interval = 0 Then This.Interval = 1
        If This.MinInterval > This.Interval Then
            This.MinInterval = 0
        ElseIf This.MinInterval < This.Interval And This.MinInterval > 0 Then
            For i = This.Min To This.Max Step This.MinInterval
                Line (__UI_MAP(i, This.Min, This.Max, 5, This.Width - 6), 30)-Step(0, MinIntervalSize), This.BorderColor
            Next i
        End If
        If This.MinInterval > 0 Then IntervalSize = 5 Else IntervalSize = 2
        For i = This.Min To This.Max Step This.Interval
            Line (__UI_MAP(i, This.Min, This.Max, 5, This.Width - 6), 30)-Step(0, IntervalSize), This.BorderColor
        Next i
        Line (5 + (This.Width - SliderWidth), 30)-Step(0, 3), This.BorderColor
        _PutImage (__UI_MAP(This.Value, This.Min, This.Max, 0, This.Width - SliderWidth), 2), ControlImage_Slider, , (0, TempControlState * SliderHeight - SliderHeight)-Step(SliderWidth - 1, SliderHeight - 1)
        If __UI_Focus = This.ID And __UI_KeyboardFocus Then
            Line (0, 0)-Step(This.Width - 1, This.Height - 1), _RGB32(0, 0, 0), B , 21845
        End If
        __UI_MakeHardwareImageFromCanvas This
        _Dest PrevDest
    End If
    If This.Canvas Then _PutImage (This.Left, This.Top), This.Canvas
End Sub
Sub __UI_DrawTextBox (This As __UI_ControlTYPE, ControlState)
    Dim PrevDest As Long
    Dim CaptionIndent As Integer, i As Long, TempCaption$
    Static SetCursor#, cursorBlink%%
    If This.FirstVisibleLine = 0 Then This.FirstVisibleLine = 1
    If This.CurrentLine = 0 Then This.CurrentLine = 1
    __UI_CursorAdjustments This.ID
    IF This.Redraw OR This.ControlState <> ControlState OR _
        This.FocusState <> (__UI_Focus = This.ID) OR _
        Caption(This.ID) <> __UI_TempCaptions(This.ID) OR _
        Text(This.ID) <> __UI_TempTexts(This.ID) OR _
        (TIMER - SetCursor# > .3 AND __UI_Focus = This.ID) OR _
        (__UI_SelectionLength <> This.SelectionLength AND __UI_Focus = This.ID) OR _
        This.Cursor <> This.PrevCursor OR This.PreviousParentID <> This.ParentID OR _
        This.VisibleCursor <> This.PrevVisibleCursor OR _
        This.FirstVisibleLine <> This.PrevFirstVisibleLine OR _
        This.CurrentLine <> This.PrevCurrentLine OR _
        Mask(This.ID) <> __UI_TempMask(This.ID) OR _
        This.PreviousFont <> This.Font OR _
        __UI_ForceRedraw THEN
        This.Redraw = False
        This.ControlState = ControlState
        This.PreviousFont = This.Font
        This.FocusState = __UI_Focus = This.ID
        __UI_TempCaptions(This.ID) = Caption(This.ID)
        If Mask(This.ID) <> __UI_TempMask(This.ID) Then
            If Not __UI_EditorMode Then Mask(This.ID) = RestoreCHR$(Mask(This.ID))
            __UI_TempMask(This.ID) = Mask(This.ID)
            Text(This.ID) = __UI_EmptyMask(This.ID)
        End If
        If __UI_TempTexts(This.ID) <> Text(This.ID) Then
            __UI_StateHasChanged = True
            If Not __UI_EditorMode Then Text(This.ID) = RestoreCHR$(Text(This.ID))
            __UI_TempTexts(This.ID) = Text(This.ID)
        End If
        This.SelectionLength = __UI_SelectionLength
        This.PrevCursor = This.Cursor
        This.PrevVisibleCursor = This.VisibleCursor
        If This.ParentID Then Control(This.ParentID).ChildrenRedrawn = True
        This.PreviousParentID = This.ParentID
        This.PrevFirstVisibleLine = This.FirstVisibleLine
        This.PrevCurrentLine = This.CurrentLine
        If This.Canvas <> 0 Then
            _FreeImage This.Canvas
        End If
        This.Canvas = _NewImage(This.Width, This.Height, 32)
        PrevDest = _Dest
        _Dest This.Canvas
        _Font (This.Font)
        _PrintMode _KeepBackground
        Cls , This.BackColor
        TempCaption$ = __UI_TrimAt0$(Caption(This.ID))
        CaptionIndent = 0
        If This.HasBorder Then
            If This.BorderSize > __UI_MaxBorderSize Then
                This.BorderSize = __UI_MaxBorderSize
            ElseIf This.BorderSize < 1 Then
                This.BorderSize = 1
            End If
            CaptionIndent = __UI_DefaultCaptionIndent + This.BorderSize
        End If
        If Not This.Disabled And (Len(Text(This.ID)) Or This.Multiline) Then
            Color This.ForeColor, This.BackColor
        Else
            Color Darken(Control(__UI_FormID).BackColor, 80), This.BackColor
        End If
        Static c As _Unsigned Long
        If c = 0 Then
            c = _RGBA32(_Red32(This.SelectedBackColor), _Green32(This.SelectedBackColor), _Blue32(This.SelectedBackColor), 70)
        End If
        If Not This.Multiline Then
            Dim ThisTempText$
            ThisTempText$ = __UI_TrimAt0$(Text(This.ID))
            If Len(ThisTempText$) > 0 And This.PasswordField = True Then
                ThisTempText$ = String$(Len(ThisTempText$), 7)
            End If
            If ((__UI_Focus = This.ID) Or (This.ID = __UI_PreviousFocus And __UI_ParentMenu(__UI_TotalActiveMenus) = This.ContextMenuID)) And Not This.Disabled Then
                If Len(Text(This.ID)) Then
                    __UI_PrintString CaptionIndent - This.InputViewStart, ((This.Height \ 2) - uspacing& \ 2), ThisTempText$
                Else
                    __UI_PrintString CaptionIndent, ((This.Height \ 2) - uspacing& \ 2), TempCaption$
                End If
                If This.TextIsSelected Then
                    Line (CaptionIndent - This.InputViewStart + __UI_ThisLineChars(This.SelectionStart), ((This.Height \ 2) - uspacing& \ 2))-(CaptionIndent - This.InputViewStart + __UI_ThisLineChars(This.Cursor), ((This.Height \ 2) - uspacing& \ 2) + uspacing&), c, BF
                End If
                If Timer - SetCursor# > .3 Then
                    SetCursor# = Timer
                    cursorBlink%% = Not cursorBlink%%
                End If
                If _WindowHasFocus = False Then cursorBlink%% = False
                If This.Cursor > UBound(__UI_ThisLineChars) Then This.Cursor = UBound(__UI_ThisLineChars)
                This.VisibleCursor = CaptionIndent + __UI_ThisLineChars(This.Cursor) - This.InputViewStart
                Static PrevFocusedText$
                If PrevFocusedText$ <> ThisTempText$ Then
                    PrevFocusedText$ = ThisTempText$
                    ReDim __UI_FocusedTextBoxChars(UBound(__UI_ThisLineChars)) As Long
                    Dim M1 As _MEM, M2 As _MEM
                    M1 = _Mem(__UI_ThisLineChars())
                    M2 = _Mem(__UI_FocusedTextBoxChars())
                    _MemCopy M1, M1.OFFSET, M1.SIZE To M2, M2.OFFSET
                    _MemFree M1
                    _MemFree M2
                End If
                Select Case Mid$(Mask(This.ID), This.Cursor + 1, 1)
                    Case "0", "9", "#" 'Digit placeholders
                        Line (This.VisibleCursor, ((This.Height \ 2) - uspacing& \ 2))-Step(__UI_ThisLineChars(This.Cursor + 1) - __UI_ThisLineChars(This.Cursor), uspacing&), c, BF
                    Case Else
                        If cursorBlink%% Then
                            Line (This.VisibleCursor, ((This.Height \ 2) - uspacing& \ 2))-Step(0, uspacing&), _RGB32(0, 0, 0)
                        End If
                End Select
            Else
                If Len(Text(This.ID)) Then
                    __UI_PrintString CaptionIndent, ((This.Height \ 2) - uspacing& \ 2), ThisTempText$
                Else
                    If Len(Mask(This.ID)) = 0 Then
                        __UI_PrintString CaptionIndent, ((This.Height \ 2) - uspacing& \ 2), TempCaption$
                    Else
                        Text(This.ID) = __UI_EmptyMask$(This.ID)
                    End If
                End If
            End If
        Else
            Dim ThisTop As Integer, TempLine As String
            Dim TotalLines As Integer
            Dim s1 As Long, s2 As Long
            Static PrevTotalLines As Long
            If This.TextIsSelected Then
                s1 = This.SelectionStart + 1
                s2 = This.Cursor + 1
                If s1 > s2 Then Swap s1, s2
            End If
            ThisTop = CaptionIndent - uspacing&
            TempCaption$ = __UI_TrimAt0$(__UI_WordWrap(Text(This.ID), This.Width - __UI_ScrollbarWidth - 5, 0, TotalLines))
            If This.HelperCanvas = 0 Or PrevTotalLines <> TotalLines Then
                PrevTotalLines = TotalLines
                If This.HelperCanvas < -1 Then _FreeImage This.HelperCanvas
                This.HelperCanvas = _NewImage(This.Width - __UI_ScrollbarWidth, TotalLines * uspacing& + uspacing& / 2)
            End If
            _Dest This.HelperCanvas
            _Font This.Font
            Cls , This.BackColor
            If Timer - SetCursor# > .3 Then
                SetCursor# = Timer
                cursorBlink%% = Not cursorBlink%%
            End If
            Do While Len(TempCaption$)
                Dim ThisLine%, TextTop%, FindSep&, FindLF&, CaptionLeft As Integer
                ThisLine% = ThisLine% + 1
                TextTop% = CaptionIndent + ThisLine% * uspacing& - uspacing&
                FindSep& = InStr(TempCaption$, Chr$(1)) 'Search for soft breaks
                FindLF& = InStr(TempCaption$, Chr$(10)) 'Search for hard breaks
                If (FindSep& > 0 And FindLF& > 0 And FindSep& < FindLF&) Or (FindSep& > 0 And FindLF& = 0) Then
                    TempLine$ = Left$(TempCaption$, FindSep& - 1)
                    TempCaption$ = Mid$(TempCaption$, FindSep& + 1)
                ElseIf FindSep& = 0 Then
                    If FindLF& > 0 Then
                        TempLine$ = Left$(TempCaption$, FindLF& - 1)
                        TempCaption$ = Mid$(TempCaption$, FindLF& + 1)
                    Else
                        TempLine$ = TempCaption$
                        TempCaption$ = ""
                    End If
                End If
                CaptionLeft = CaptionIndent
                __UI_PrintString CaptionLeft, TextTop%, TempLine$
            Loop
            If This.ID = __UI_Focus Then
                For i = Control(__UI_Focus).Cursor To 0 Step -1
                    If Mid$(Text(__UI_Focus), i, 1) = Chr$(10) Or i = 0 Then
                        Control(__UI_Focus).VisibleCursor = Control(__UI_Focus).Cursor - i
                        Exit For
                    End If
                Next
            End If
            _Dest This.Canvas
            _PutImage (0, 0), This.HelperCanvas
            If TotalLines > This.Height \ uspacing& Then
                This.HasVScrollbar = True
                __UI_DrawVScrollBar This, ControlState
            Else
                This.HasVScrollbar = False
                __UI_DrawVScrollBar This, 4 'ControlState = 4 (Disabled)
            End If
        End If
        If This.HasBorder Then
            For i = 0 To This.BorderSize - 1
                Line (i, i)-Step(This.Width - 1 - i * 2, This.Height - 1 - i * 2), This.BorderColor, B
            Next
        End If
        __UI_MakeHardwareImageFromCanvas This
        _Dest PrevDest
    End If
    If This.Canvas Then _PutImage (This.Left, This.Top), This.Canvas
End Sub
Sub __UI_DrawListBox (This As __UI_ControlTYPE, ControlState)
    Dim PrevDest As Long, i As Long
    Dim CaptionIndent As Integer, TempCaption$
    IF This.Redraw OR This.ControlState <> ControlState OR This.FocusState <> (__UI_Focus = This.ID) OR This.PreviousValue <> This.Value OR Text(This.ID) <> __UI_TempTexts(This.ID) OR This.PreviousInputViewStart <> This.InputViewStart OR This.PreviousParentID <> This.ParentID _
       OR __UI_ForceRedraw OR This.PreviousFont <> This.Font THEN
        This.Redraw = False
        This.PreviousFont = This.Font
        This.ControlState = ControlState
        This.FocusState = __UI_Focus = This.ID
        If This.PreviousValue <> This.Value Then
            __UI_StateHasChanged = True
            This.PreviousValue = This.Value
        End If
        This.PreviousInputViewStart = This.InputViewStart
        __UI_TempTexts(This.ID) = Text(This.ID)
        If This.ParentID Then Control(This.ParentID).ChildrenRedrawn = True
        This.PreviousParentID = This.ParentID
        If This.Canvas <> 0 Then
            _FreeImage This.Canvas
        End If
        If This.Width + This.Height > 0 Then
            This.Canvas = _NewImage(This.Width, This.Height, 32)
        Else
            Exit Sub
        End If
        PrevDest = _Dest
        _Dest This.Canvas
        _Font (This.Font)
        If This.BackStyle = __UI_Opaque Then
            Cls , This.BackColor
        Else
            Cls , _RGBA32(0, 0, 0, 0)
        End If
        If This.HasBorder Then
            If This.BorderSize > __UI_MaxBorderSize Then
                This.BorderSize = __UI_MaxBorderSize
            ElseIf This.BorderSize < 1 Then
                This.BorderSize = 1
            End If
            CaptionIndent = __UI_DefaultCaptionIndent + This.BorderSize
        End If
        If Len(Text(This.ID)) Then
            Dim TempText$, FindLF&, ThisItem%, ThisItemTop%
            Dim ItemHeight As Integer, LastVisibleItem As Integer
            ItemHeight = uspacing + (((_Font = 8) * -1) * __UI_Font8Offset + ((_Font = 16) * -1) * __UI_Font16Offset) + 3
            This.ItemHeight = ItemHeight
            TempText$ = __UI_TrimAt0$(Text(This.ID))
            ThisItem% = 0
            Do While Len(TempText$)
                ThisItem% = ThisItem% + 1
                FindLF& = InStr(TempText$, Chr$(13))
                If FindLF& Then
                    TempCaption$ = Left$(TempText$, FindLF& - 1)
                    TempText$ = Mid$(TempText$, FindLF& + 1)
                Else
                    TempCaption$ = TempText$
                    TempText$ = ""
                End If
                If ThisItem% >= This.InputViewStart Then
                    ThisItemTop% = ((ThisItem% - This.InputViewStart + 1) * ItemHeight - ItemHeight) + CaptionIndent
                    If ThisItemTop% + ItemHeight > This.Height Then Exit Do
                    LastVisibleItem = LastVisibleItem + 1
                    If ThisItem% = This.Value And __UI_Focus = This.ID Then Caption(This.ID) = TempCaption$
                    If Not This.Disabled Then
                        Color This.ForeColor
                    Else
                        Color Darken(Control(__UI_FormID).BackColor, 80)
                    End If
                    If ThisItem% = This.Value Then
                        If __UI_Focus = This.ID Then
                            Color This.SelectedForeColor, This.SelectedBackColor
                            Line (CaptionIndent, ThisItemTop% - 1)-Step(This.Width - CaptionIndent * 2, ItemHeight), This.SelectedBackColor, BF
                        Else
                            Line (CaptionIndent, ThisItemTop% - 1)-Step(This.Width - CaptionIndent * 2, ItemHeight), _RGBA32(0, 0, 0, 50), BF
                        End If
                    End If
                    Select Case This.Align
                        Case __UI_Left
                            __UI_PrintString CaptionIndent * 2, ThisItemTop% + ((ItemHeight - uspacing&) / 2), TempCaption$
                        Case __UI_Center
                            __UI_PrintString (This.Width \ 2 - __UI_PrintWidth(TempCaption$) \ 2), ThisItemTop% + ((ItemHeight - uspacing&) / 2), TempCaption$
                        Case __UI_Right
                            __UI_PrintString (This.Width - __UI_PrintWidth(TempCaption$)) - CaptionIndent, ThisItemTop% + ((ItemHeight - uspacing&) / 2), TempCaption$
                    End Select
                End If
            Loop
            If This.LastVisibleItem < LastVisibleItem Then This.LastVisibleItem = LastVisibleItem
            If This.Max > This.LastVisibleItem Then
                This.HasVScrollbar = True
                __UI_DrawVScrollBar This, ControlState
            Else
                This.HasVScrollbar = False
            End If
        End If
        If This.HasBorder Then
            For i = 0 To This.BorderSize - 1
                Line (i, i)-Step(This.Width - 1 - i * 2, This.Height - 1 - i * 2), This.BorderColor, B
            Next
        End If
        __UI_MakeHardwareImageFromCanvas This
        _Dest PrevDest
    End If
    If This.Canvas Then _PutImage (This.Left, This.Top), This.Canvas
End Sub
Sub __UI_DrawVScrollBar (TempThis As __UI_ControlTYPE, ControlState As _Byte)
    Dim TrackHeight As Integer, ThumbHeight As Integer, ThumbTop As Integer
    Dim Ratio As Single
    Dim This As __UI_ControlTYPE
    Static ControlImage_Button As Long, ControlImage_Track As Long
    Static ControlImage_Thumb As Long
    Const ImageHeight_Button = 17
    Const ImageWidth_Button = 17
    Const ImageHeight_Thumb = 22
    Const ImageWidth_Thumb = 15
    If ControlImage_Button = 0 Then ControlImage_Button = __UI_LoadThemeImage("scrollbuttons.png")
    If ControlImage_Track = 0 Then ControlImage_Track = __UI_LoadThemeImage("scrolltrack.png")
    If ControlImage_Thumb = 0 Then ControlImage_Thumb = __UI_LoadThemeImage("scrollthumb.png")
    This = TempThis
    _Font This.Font
    If This.Type = __UI_Type_ListBox Then
        This.Min = 0
        This.Max = This.Max - This.LastVisibleItem
        This.Value = This.InputViewStart - 1
        This.Left = This.Width - __UI_ScrollbarWidth - 1
        This.Top = 1
        This.Height = This.Height - 1
        This.Width = __UI_ScrollbarWidth
    ElseIf This.Type = __UI_Type_TextBox Then
        This.Min = 0
        This.Max = __UI_CountLines(This.ID) - This.Height \ uspacing&
        This.Value = This.FirstVisibleLine - 1
        This.Left = This.Width - __UI_ScrollbarWidth - 1
        This.Top = 1
        This.Height = This.Height - 1
        This.Width = __UI_ScrollbarWidth
    End If
    TrackHeight = This.Height - __UI_ScrollbarButtonHeight * 2 - 1
    Ratio = (This.Max) / TrackHeight
    ThumbHeight = TrackHeight - This.Height * Ratio
    If ThumbHeight < 22 Then ThumbHeight = 22
    If ThumbHeight > TrackHeight Then ThumbHeight = TrackHeight
    ThumbTop = This.Top + (TrackHeight - ThumbHeight) * (This.Value / This.Max)
    TempThis.ThumbTop = TempThis.Top + ThumbTop + __UI_ScrollbarButtonHeight
    If ControlState <> 4 Then
        _PutImage (This.Left, This.Top)-Step(ImageWidth_Button - 1, This.Height - 1), ControlImage_Track, , (0, 1 * ImageHeight_Button - ImageHeight_Button)-Step(ImageWidth_Button - 1, ImageHeight_Button - 1)
    Else
        _PutImage (This.Left, This.Top)-Step(ImageWidth_Button - 1, This.Height - 1), ControlImage_Track, , (0, 4 * ImageHeight_Button - ImageHeight_Button)-Step(ImageWidth_Button - 1, ImageHeight_Button - 1)
    End If
    If __UI_MouseDownOnID = This.ID And This.HoveringVScrollbarButton = 4 And __UI_DraggingThumb = False Then
        _PutImage (This.Left, This.Top)-Step(ImageWidth_Button - 1, ThumbTop + ThumbHeight + __UI_ScrollbarButtonHeight - 1), ControlImage_Track, , (0, 3 * ImageHeight_Button - ImageHeight_Button)-Step(ImageWidth_Button - 1, ImageHeight_Button - 1)
    ElseIf __UI_MouseDownOnID = This.ID And This.HoveringVScrollbarButton = 5 And __UI_DraggingThumb = False Then
        _PutImage (This.Left, This.Top + ThumbTop + __UI_ScrollbarButtonHeight)-Step(ImageWidth_Button - 1, This.Height - (This.Top + ThumbTop + __UI_ScrollbarButtonHeight) - 1), ControlImage_Track, , (0, 3 * ImageHeight_Button - ImageHeight_Button)-Step(ImageWidth_Button - 1, ImageHeight_Button - 1)
    End If
    If ControlState = 4 Then
        _PutImage (This.Left, This.Top)-Step(ImageWidth_Button - 1, ImageHeight_Button - 1), ControlImage_Button, , (0, 4 * ImageHeight_Button - ImageHeight_Button)-Step(ImageWidth_Button - 1, ImageHeight_Button - 1)
    ElseIf This.HoveringVScrollbarButton = 1 And __UI_MouseDownOnID = This.ID Then
        _PutImage (This.Left, This.Top)-Step(ImageWidth_Button - 1, ImageHeight_Button - 1), ControlImage_Button, , (0, 3 * ImageHeight_Button - ImageHeight_Button)-Step(ImageWidth_Button - 1, ImageHeight_Button - 1)
    ElseIf This.HoveringVScrollbarButton = 1 Then
        _PutImage (This.Left, This.Top)-Step(ImageWidth_Button - 1, ImageHeight_Button - 1), ControlImage_Button, , (0, 2 * ImageHeight_Button - ImageHeight_Button)-Step(ImageWidth_Button - 1, ImageHeight_Button - 1)
    Else
        _PutImage (This.Left, This.Top)-Step(ImageWidth_Button - 1, ImageHeight_Button - 1), ControlImage_Button, , (0, 1 * ImageHeight_Button - ImageHeight_Button)-Step(ImageWidth_Button - 1, ImageHeight_Button - 1)
    End If
    If ControlState = 4 Then
        _PutImage (This.Left, This.Top + This.Height - ImageHeight_Button - 1)-Step(ImageWidth_Button - 1, ImageHeight_Button - 1), ControlImage_Button, , (0, 8 * ImageHeight_Button - ImageHeight_Button)-Step(ImageWidth_Button - 1, ImageHeight_Button - 1)
    ElseIf This.HoveringVScrollbarButton = 2 And __UI_MouseDownOnID = This.ID Then
        _PutImage (This.Left, This.Top + This.Height - ImageHeight_Button - 1)-Step(ImageWidth_Button - 1, ImageHeight_Button - 1), ControlImage_Button, , (0, 7 * ImageHeight_Button - ImageHeight_Button)-Step(ImageWidth_Button - 1, ImageHeight_Button - 1)
    ElseIf This.HoveringVScrollbarButton = 2 Then
        _PutImage (This.Left, This.Top + This.Height - ImageHeight_Button - 1)-Step(ImageWidth_Button - 1, ImageHeight_Button - 1), ControlImage_Button, , (0, 6 * ImageHeight_Button - ImageHeight_Button)-Step(ImageWidth_Button - 1, ImageHeight_Button - 1)
    Else
        _PutImage (This.Left, This.Top + This.Height - ImageHeight_Button - 1)-Step(ImageWidth_Button - 1, ImageHeight_Button - 1), ControlImage_Button, , (0, 5 * ImageHeight_Button - ImageHeight_Button)-Step(ImageWidth_Button - 1, ImageHeight_Button - 1)
    End If
    If ControlState = 4 Then
    ElseIf __UI_DraggingThumb = True Then
        _PutImage (This.Left + 1, ThumbTop + __UI_ScrollbarButtonHeight)-Step(ImageWidth_Thumb - 2, ThumbHeight - 1), ControlImage_Thumb, , (0, 3 * ImageHeight_Thumb - ImageHeight_Thumb + 2)-Step(ImageWidth_Thumb - 1, ImageHeight_Thumb - 5)
        _PutImage (This.Left + 1, ThumbTop + __UI_ScrollbarButtonHeight)-Step(ImageWidth_Thumb - 2, 1), ControlImage_Thumb, , (0, 3 * ImageHeight_Thumb - ImageHeight_Thumb)-Step(ImageWidth_Thumb - 1, 1)
        _PutImage (This.Left + 1, ThumbTop + __UI_ScrollbarButtonHeight + ThumbHeight - 2)-Step(ImageWidth_Thumb - 2, 1), ControlImage_Thumb, , (0, 3 * ImageHeight_Thumb - 4)-Step(ImageWidth_Thumb - 1, 3)
    ElseIf This.HoveringVScrollbarButton = 3 And __UI_DraggingThumb = False Then
        _PutImage (This.Left + 1, ThumbTop + __UI_ScrollbarButtonHeight)-Step(ImageWidth_Thumb - 2, ThumbHeight - 1), ControlImage_Thumb, , (0, 2 * ImageHeight_Thumb - ImageHeight_Thumb + 2)-Step(ImageWidth_Thumb - 1, ImageHeight_Thumb - 5)
        _PutImage (This.Left + 1, ThumbTop + __UI_ScrollbarButtonHeight)-Step(ImageWidth_Thumb - 2, 1), ControlImage_Thumb, , (0, 2 * ImageHeight_Thumb - ImageHeight_Thumb)-Step(ImageWidth_Thumb - 1, 1)
        _PutImage (This.Left + 1, ThumbTop + __UI_ScrollbarButtonHeight + ThumbHeight - 2)-Step(ImageWidth_Thumb - 2, 1), ControlImage_Thumb, , (0, 2 * ImageHeight_Thumb - 4)-Step(ImageWidth_Thumb - 1, 3)
    Else
        _PutImage (This.Left + 1, ThumbTop + __UI_ScrollbarButtonHeight)-Step(ImageWidth_Thumb - 2, ThumbHeight - 1), ControlImage_Thumb, , (0, 1 * ImageHeight_Thumb - ImageHeight_Thumb + 2)-Step(ImageWidth_Thumb - 1, ImageHeight_Thumb - 5)
        _PutImage (This.Left + 1, ThumbTop + __UI_ScrollbarButtonHeight)-Step(ImageWidth_Thumb - 2, 1), ControlImage_Thumb, , (0, 1 * ImageHeight_Thumb - ImageHeight_Thumb)-Step(ImageWidth_Thumb - 1, 1)
        _PutImage (This.Left + 1, ThumbTop + __UI_ScrollbarButtonHeight + ThumbHeight - 2)-Step(ImageWidth_Thumb - 2, 1), ControlImage_Thumb, , (0, 1 * ImageHeight_Thumb - 4)-Step(ImageWidth_Thumb - 1, 3)
    End If
    TempThis.VScrollbarButton2Top = This.Top + This.Height - ImageHeight_Button - 1
    TempThis.ThumbHeight = ThumbHeight
    TempThis.VScrollbarRatio = Ratio
End Sub
Sub __UI_DrawDropdownList (This As __UI_ControlTYPE, ControlState)
    Dim PrevDest As Long, i As Long
    Dim CaptionIndent As Integer, TempCaption$
    Static ControlImage As Long
    Static ControlImage_Arrow As Long
    Const ButtonHeight = 21
    Const ButtonWidth = 18
    Const ArrowWidth = 9
    Const ArrowHeight = 9
    If ControlImage = 0 Then ControlImage = __UI_LoadThemeImage("button.png")
    If ControlImage_Arrow = 0 Then
        ControlImage_Arrow = __UI_LoadThemeImage("arrows.png")
        __UI_ClearColor ControlImage_Arrow, 0, 0
    End If
    IF This.Redraw OR This.ControlState <> ControlState OR _
        This.FocusState <> (__UI_Focus = This.ID) OR _
        This.PreviousValue <> This.Value OR _
        Text(This.ID) <> __UI_TempTexts(This.ID) OR _
        This.PreviousInputViewStart <> This.InputViewStart OR _
        This.PreviousParentID <> This.ParentID OR _
        This.PreviousFont <> This.Font OR _
        __UI_ForceRedraw THEN
        This.Redraw = False
        This.ControlState = ControlState
        This.PreviousFont = This.Font
        This.FocusState = __UI_Focus = This.ID
        If This.PreviousValue <> This.Value Then
            __UI_StateHasChanged = True
            This.PreviousValue = This.Value
        End If
        This.PreviousInputViewStart = This.InputViewStart
        __UI_TempTexts(This.ID) = Text(This.ID)
        If This.ParentID Then Control(This.ParentID).ChildrenRedrawn = True
        This.PreviousParentID = This.ParentID
        If This.Canvas <> 0 Then
            _FreeImage This.Canvas
        End If
        This.Canvas = _NewImage(This.Width, This.Height, 32)
        PrevDest = _Dest
        _Dest This.Canvas
        _Font This.Font
        If This.BackStyle = __UI_Opaque Then
            Cls , This.BackColor
        Else
            Cls , _RGBA32(0, 0, 0, 0)
        End If
        If This.HasBorder Then
            If This.BorderSize > __UI_MaxBorderSize Then
                This.BorderSize = __UI_MaxBorderSize
            ElseIf This.BorderSize < 1 Then
                This.BorderSize = 1
            End If
            CaptionIndent = __UI_DefaultCaptionIndent + This.BorderSize
            For i = 0 To This.BorderSize - 1
                Line (i, i)-Step(This.Width - 1 - i * 2, This.Height - 1 - i * 2), This.BorderColor, B
            Next
        End If
        Dim TempText$, ThisItem%, FindLF&, ThisItemTop%
        If This.Value > 0 Then
            If Len(Text(This.ID)) Then
                TempText$ = Text(This.ID)
                ThisItem% = 0
                Do While Len(TempText$)
                    ThisItem% = ThisItem% + 1
                    FindLF& = InStr(TempText$, Chr$(13))
                    If FindLF& Then
                        TempCaption$ = Left$(TempText$, FindLF& - 1)
                        TempText$ = Mid$(TempText$, FindLF& + 1)
                    Else
                        TempCaption$ = TempText$
                        TempText$ = ""
                    End If
                    If ThisItem% = This.Value Then
                        ThisItemTop% = This.Height \ 2 - uspacing& \ 2 + 1
                        If ThisItem% = This.Value And __UI_Focus = This.ID Then Caption(This.ID) = TempCaption$
                        If Not This.Disabled Then
                            Color This.ForeColor
                        Else
                            Color Darken(Control(__UI_FormID).BackColor, 80)
                        End If
                        If __UI_Focus = This.ID Then
                            Color This.SelectedForeColor
                            Line (CaptionIndent, 3)-Step(This.Width - CaptionIndent * 2, This.Height - 7), This.SelectedBackColor, BF
                        End If
                        Select Case This.Align
                            Case __UI_Left
                                __UI_PrintString CaptionIndent * 2, ThisItemTop%, TempCaption$
                            Case __UI_Center
                                __UI_PrintString (This.Width \ 2 - __UI_PrintWidth(TempCaption$) \ 2), ThisItemTop%, TempCaption$
                            Case __UI_Right
                                __UI_PrintString (This.Width - __UI_PrintWidth(TempCaption$)) - CaptionIndent, ThisItemTop%, TempCaption$
                        End Select
                        Exit Do
                    End If
                Loop
            End If
        End If
        Dim DropdownState As _Byte
        If __UI_TotalActiveMenus > 0 And __UI_ParentDropdownList = This.ID Then
            DropdownState = 3
        ElseIf (This.ID = __UI_HoveringID Or This.ID = __UI_ParentDropdownList) And Not This.Disabled Then
            DropdownState = 2
        ElseIf This.Disabled = True Then
            DropdownState = 4
        Else
            DropdownState = 1
        End If
        _PutImage (This.Width - (__UI_ScrollbarWidth + 2), 3)-(This.Width - 1, This.Height - 4), ControlImage, , (3, DropdownState * ButtonHeight - ButtonHeight + 3)-Step(11, ButtonHeight - 7)
        _PutImage (This.Width - (__UI_ScrollbarWidth + 1), 0)-Step(__UI_ScrollbarWidth - 2, 3), ControlImage, , (3, DropdownState * ButtonHeight - ButtonHeight)-Step(11, 3)
        _PutImage (This.Width - (__UI_ScrollbarWidth + 1), This.Height - 3)-Step(__UI_ScrollbarWidth - 2, 3), ControlImage, , (3, DropdownState * ButtonHeight - ButtonHeight + 18)-Step(11, 3)
        _PutImage (This.Width - (__UI_ScrollbarWidth + 2), 2)-Step(2, This.Height - 4), ControlImage, , (0, DropdownState * ButtonHeight - ButtonHeight + 2)-Step(2, ButtonHeight - 6)
        _PutImage (This.Width - (__UI_ScrollbarWidth + 2), 0), ControlImage, , (0, DropdownState * ButtonHeight - ButtonHeight)-Step(2, 2)
        _PutImage (This.Width - (__UI_ScrollbarWidth + 2), This.Height - 3), ControlImage, , (0, DropdownState * ButtonHeight - 3)-Step(2, 2)
        _PutImage (This.Width - 3, 2)-Step(2, This.Height - 4), ControlImage, , (ButtonWidth - 3, DropdownState * ButtonHeight - ButtonHeight + 2)-Step(2, ButtonHeight - 6)
        _PutImage (This.Width - 2, 0), ControlImage, , (ButtonWidth - 2, DropdownState * ButtonHeight - ButtonHeight)-Step(2, 2)
        _PutImage (This.Width - 3, This.Height - 3), ControlImage, , (ButtonWidth - 3, DropdownState * ButtonHeight - 3)-Step(2, 2)
        _PutImage (This.Width - 1 - (__UI_ScrollbarWidth / 2) - ArrowWidth / 2, This.Height / 2 - ArrowHeight / 2), ControlImage_Arrow, , (0, (DropdownState + 4) * ArrowHeight - ArrowHeight)-Step(ArrowWidth - 1, ArrowHeight - 1)
        __UI_MakeHardwareImageFromCanvas This
        _Dest PrevDest
    End If
    If This.Canvas Then _PutImage (This.Left, This.Top), This.Canvas
End Sub
Sub __UI_DrawFrame (This As __UI_ControlTYPE)
    Dim TempCaption$, CaptionIndent As Integer, Temp&
    Dim TempCanvas As Long
    Static ControlImage As Long
    If ControlImage = 0 Then
        ControlImage = __UI_LoadThemeImage("frame.png")
        __UI_ClearColor ControlImage, 0, 0
    End If
    IF This.Redraw OR This.PreviouslyHidden <> This.Hidden OR This.ChildrenRedrawn OR Caption(This.ID) <> __UI_TempCaptions(This.ID) OR This.HelperCanvas = 0 OR (__UI_IsDragging AND Control(__UI_DraggingID).ParentID = This.ID) OR This.Value <> This.PreviousValue OR __UI_ForceRedraw _
       OR __UI_DesignMode OR This.PreviousFont <> This.Font THEN
        This.Redraw = False
        This.ChildrenRedrawn = False
        This.PreviousFont = This.Font
        This.PreviousValue = This.Value
        This.PreviouslyHidden = This.Hidden
        __UI_TempCaptions(This.ID) = Caption(This.ID)
        _Font This.Font
        TempCanvas = _NewImage(This.Width, This.Height + uspacing& \ 2, 32)
        _Dest TempCanvas
        _Font This.Font
        If Len(Caption(This.ID)) > 0 Then TempCaption$ = " " + __UI_TrimAt0$(Caption(This.ID)) + " "
        _Font This.Font
        If This.Hidden = False Then
            If This.BackStyle = __UI_Opaque Then
                Cls , This.BackColor
            Else
                Cls , _RGBA32(0, 0, 0, 0)
            End If
            CaptionIndent = 0
            If This.HasBorder Then CaptionIndent = 5
            If Not This.Disabled Then
                Color This.ForeColor
            Else
                Color Darken(Control(__UI_FormID).BackColor, 80)
            End If
            _PutImage (CaptionIndent, CaptionIndent + uspacing& \ 2), This.Canvas, TempCanvas, (CaptionIndent, CaptionIndent)-(This.Width, This.Height)
            If This.HasBorder Then
                _PutImage (0, uspacing& \ 2), ControlImage, , (0, 0)-Step(2, 2)
                _PutImage (This.Width - 3, uspacing& \ 2), ControlImage, , (19, 0)-Step(2, 2)
                _PutImage (0, This.Height + uspacing& \ 2 - 3), ControlImage, , (0, 17)-Step(2, 2)
                _PutImage (This.Width - 3, This.Height + uspacing& \ 2 - 3), ControlImage, , (19, 17)-Step(2, 2)
                _PutImage (0, uspacing& \ 2 + 2)-(0, This.Height + uspacing& \ 2 - 4), ControlImage, , (0, 3)-(0, 16)
                _PutImage (This.Width - 1, uspacing& \ 2 + 2)-(This.Width - 1, This.Height + uspacing& \ 2 - 4), ControlImage, , (0, 3)-(0, 16)
                _PutImage (3, uspacing& \ 2)-Step(This.Width - 6, 0), ControlImage, , (3, 0)-Step(15, 0)
                _PutImage (3, This.Height + uspacing& \ 2 - 1)-Step(This.Width - 6, 0), ControlImage, , (3, 0)-Step(15, 0)
            End If
            Dim CaptionLeft As Integer
            If Len(TempCaption$) > 0 Then
                Select Case This.Align
                    Case __UI_Left
                        CaptionLeft = CaptionIndent
                    Case __UI_Center
                        CaptionLeft = (This.Width \ 2 - __UI_PrintWidth(TempCaption$) \ 2)
                    Case __UI_Right
                        CaptionLeft = (This.Width - __UI_PrintWidth(TempCaption$)) - CaptionIndent
                End Select
                Line (CaptionLeft, 0)-Step(__UI_PrintWidth(TempCaption$), uspacing&), This.BackColor, BF
                __UI_PrintString CaptionLeft, 0, TempCaption$
                If (This.HotKey > 0 And (__UI_ShowHotKeys And Not This.Disabled)) Or (This.HotKey > 0 And __UI_DesignMode) Then
                    Temp& = __UI_PrintWidth(Chr$(This.HotKey))
                    Line (CaptionLeft + Temp& + This.HotKeyOffset, uheight&)-Step(Temp& - 1, 0), This.ForeColor
                End If
            End If
        End If
        __UI_MakeHardwareImage TempCanvas
        If This.HelperCanvas <> 0 Then _FreeImage This.HelperCanvas
        This.HelperCanvas = TempCanvas
        _Dest 0
    End If
    _Font This.Font
    If This.HelperCanvas < -1 Then _PutImage (This.Left, This.Top - uspacing& \ 2), This.HelperCanvas
End Sub
Sub __UI_DrawMenuBar (This As __UI_ControlTYPE, ControlState As _Byte)
    Dim PrevDest As Long, TempCaption$
    Dim Temp&
    IF This.Redraw OR This.FocusState <> (__UI_Focus = This.ID) OR This.Value <> This.PreviousValue OR This.ControlState <> ControlState OR Caption(This.ID) <> __UI_TempCaptions(This.ID) _
       OR __UI_ForceRedraw OR This.PreviousFont <> This.Font THEN
        This.Redraw = False
        This.ControlState = ControlState
        This.PreviousFont = This.Font
        This.PreviousValue = This.Value
        If Caption(This.ID) <> __UI_TempCaptions(This.ID) Then
            __UI_RefreshMenuBar
        End If
        __UI_TempCaptions(This.ID) = Caption(This.ID)
        This.FocusState = (__UI_Focus = This.ID)
        If This.Canvas <> 0 Then
            _FreeImage This.Canvas
        End If
        This.Canvas = _NewImage(This.Width, This.Height, 32)
        PrevDest = _Dest
        _Dest This.Canvas
        _Font (This.Font)
        Cls , This.BackColor
        TempCaption$ = __UI_TrimAt0$(Caption(This.ID))
        IF __UI_Focus = This.ID OR _
           (__UI_ParentMenu(__UI_TotalActiveMenus) = This.ID AND (Control(__UI_Focus).Type = __UI_Type_MenuPanel OR Control(__UI_Focus).Type = __UI_Type_MenuItem)) OR _
           (__UI_HoveringID = This.ID AND (Control(__UI_Focus).Type <> __UI_Type_MenuPanel AND Control(__UI_Focus).Type <> __UI_Type_MenuBar AND Control(__UI_Focus).Type <> __UI_Type_MenuItem)) THEN
            Line (0, 0)-Step(This.Width - 1, This.Height - 1), This.SelectedBackColor, BF
            Color This.SelectedForeColor
        Else
            Color This.ForeColor
        End If
        If This.Disabled Then
            Color Darken(Control(__UI_FormID).BackColor, 80)
        End If
        __UI_PrintString __UI_MenuBarOffset, ((This.Height \ 2) - (falcon_uspacing& + (((_Font = 8) * -1) * __UI_Font8Offset + ((_Font = 16) * -1) * __UI_Font16Offset)) \ 2), TempCaption$
        If This.HotKey > 0 And (__UI_AltIsDown Or Control(__UI_Focus).Type = __UI_Type_MenuBar Or __UI_DesignMode) Then
            Temp& = __UI_PrintWidth(Chr$(This.HotKey))
            Line (__UI_MenuBarOffset + This.HotKeyOffset, ((This.Height \ 2) + (falcon_uspacing& + (((_Font = 8) * -1) * __UI_Font8Offset + ((_Font = 16) * -1) * __UI_Font16Offset)) \ 2) - 1)-Step(Temp& - 1, 0), _DefaultColor
        End If
        If __UI_DesignMode Then
            If This.Left + This.Width = __UI_NewMenuBarTextLeft Then
                _Dest Control(__UI_FormID).Canvas
                Color Darken(Control(__UI_FormID).BackColor, 80)
                _Font (This.Font)
                Line (__UI_NewMenuBarTextLeft + __UI_MenuBarOffset, ((This.Height \ 2) - (falcon_uspacing& + (((_Font = 8) * -1) * __UI_Font8Offset + ((_Font = 16) * -1) * __UI_Font16Offset)) \ 2))-Step(__UI_PrintWidth("Add new"), (falcon_uspacing& + (((_Font = 8) * -1) * __UI_Font8Offset + ((_Font = 16) * -1) * __UI_Font16Offset))), Control(__UI_FormID).BackColor, BF
                __UI_PrintString __UI_NewMenuBarTextLeft + __UI_MenuBarOffset, ((This.Height \ 2) - (falcon_uspacing& + (((_Font = 8) * -1) * __UI_Font8Offset + ((_Font = 16) * -1) * __UI_Font16Offset)) \ 2), "Add new"
            End If
        End If
        __UI_MakeHardwareImageFromCanvas This
        _Dest PrevDest
    End If
    If This.Canvas Then _PutImage (This.Left, This.Top), This.Canvas
End Sub
Sub __UI_DrawMenuPanel (This As __UI_ControlTYPE, Parent As Long)
    Dim PrevDest As Long, TempCaption$
    Dim Temp&
    Dim CheckMarkIndex As _Byte
    Static ControlImage As Long, SubMenuArrow As Long
    Const CheckMarkWidth = 7
    Const CheckMarkHeight = 7
    If ControlImage = 0 Then
        ControlImage = __UI_LoadThemeImage("menucheckmark.bmp")
        __UI_ClearColor ControlImage, 0, 0
    End If
    If SubMenuArrow = 0 Then
        SubMenuArrow = _NewImage(4, 7, 32)
        PrevDest = _Dest
        _Dest SubMenuArrow
        Line (0, 0)-(3, 3), _RGB32(0, 0, 0)
        Line -(0, 6), _RGB32(0, 0, 0)
        Line -(0, 0), _RGB32(0, 0, 0)
        Paint (2, 3), _RGB32(0, 0, 0)
        _Dest PrevDest
    End If
    IF This.Redraw OR This.Value <> This.PreviousValue OR This.FocusState <> (__UI_Focus = This.ID) _
       OR __UI_ForceRedraw OR This.PreviousFont <> This.Font THEN
        This.Redraw = False
        This.FocusState = (__UI_Focus = This.ID)
        This.PreviousFont = This.Font
        This.PreviousValue = This.Value
        If This.Canvas <> 0 Then
            _FreeImage This.Canvas
        End If
        This.Canvas = _NewImage(This.Width + 5, This.Height + 5, 32)
        PrevDest = _Dest
        _Dest This.Canvas
        _Font (This.Font)
        Color , _RGBA32(0, 0, 0, 0)
        Cls
        __UI_ShadowBox 0, 0, This.Width - 1, This.Height - 1, _RGB32(255, 255, 255), 40, 5
        Line (0, 0)-Step(This.Width - 1, This.Height - 1), This.BorderColor, B
        Dim i As Long, HasSeparator As _Byte
        For i = 1 To UBound(Control)
            If Control(i).Type = __UI_Type_MenuItem And Not Control(i).Hidden And Control(i).ParentID = Parent Then
                TempCaption$ = __UI_TrimAt0$(Caption(i))
                If Right$(TempCaption$, 1) = "-" Then
                    HasSeparator = True
                    TempCaption$ = Left$(TempCaption$, Len(TempCaption$) - 1)
                Else
                    HasSeparator = False
                End If
                If __UI_Focus = i Or (__UI_HoveringID = i And __UI_Focus = i) Then
                    Line (3, Control(i).Top)-Step(This.Width - 7, Control(i).Height - 1), This.SelectedBackColor, BF
                    Color This.SelectedForeColor
                    CheckMarkIndex = 2
                Else
                    Color This.ForeColor
                    CheckMarkIndex = 1
                End If
                If Control(i).Disabled Then
                    Color Darken(Control(__UI_FormID).BackColor, 80)
                    CheckMarkIndex = 3
                End If
                __UI_PrintString Control(i).Left + __UI_MenuItemOffset, Control(i).Top + Control(i).Height \ 2 - uheight& \ 2, TempCaption$
                If Control(i).KeyCombo > 0 Then
                    __UI_PrintString Control(i).Left + This.Width - __UI_MenuItemOffset - __UI_PrintWidth(RTrim$(__UI_KeyCombo(Control(i).KeyCombo).FriendlyCombo)), Control(i).Top + Control(i).Height \ 2 - uheight& \ 2, RTrim$(__UI_KeyCombo(Control(i).KeyCombo).FriendlyCombo)
                End If
                If Control(i).SubMenu Then
                    _PutImage (This.Width - __UI_MenuItemOffset / 2, Control(i).Top + Control(i).Height / 2 - 3), SubMenuArrow
                End If
                If Control(i).HotKey > 0 Then
                    Temp& = __UI_PrintWidth(Chr$(Control(i).HotKey))
                    Line (Control(i).Left + __UI_MenuItemOffset + Control(i).HotKeyOffset, Control(i).Top + Control(i).Height \ 2 + uheight& \ 2 - 1)-Step(Temp& - 1, 0), _DefaultColor
                End If
                If Control(i).Value = True Then
                    If Control(i).BulletStyle = __UI_Bullet%% Then
                        __UI_PrintString __UI_MenuItemOffset \ 2 - __UI_PrintWidth(Chr$(7)) \ 2, Control(i).Top + Control(i).Height \ 2 - uheight \ 2, Chr$(7)
                    Else
                        _PutImage (__UI_MenuItemOffset \ 2 - CheckMarkWidth \ 2, Control(i).Top + Control(i).Height \ 2 - CheckMarkHeight \ 2), ControlImage, , (0, CheckMarkIndex * CheckMarkHeight - CheckMarkHeight)-Step(6, 6)
                    End If
                Else
                    Dim IconWidth As Integer, IconHeight As Integer
                    If Control(i).HelperCanvas < -1 Then
                        If _Height(Control(i).HelperCanvas) = 16 And _Width(Control(i).HelperCanvas) Mod 16 = 0 Then
                            Select Case CheckMarkIndex
                                Case 1 'normal
                                    _PutImage (3, Control(i).Top + Control(i).Height / 2 - 8)-Step(15, 15), Control(i).HelperCanvas, , (0, 0)-Step(15, 15)
                                Case 2 'hovered/selected
                                    If _Width(Control(i).HelperCanvas) >= 32 Then
                                        _PutImage (3, Control(i).Top + Control(i).Height / 2 - 8)-Step(15, 15), Control(i).HelperCanvas, , (16, 0)-Step(15, 15)
                                    Else
                                        _PutImage (3, Control(i).Top + Control(i).Height / 2 - 8)-Step(15, 15), Control(i).HelperCanvas, , (0, 0)-Step(15, 15)
                                    End If
                                Case 3 'disabled
                                    If _Width(Control(i).HelperCanvas) >= 48 Then
                                        _PutImage (3, Control(i).Top + Control(i).Height / 2 - 8)-Step(15, 15), Control(i).HelperCanvas, , (32, 0)-Step(15, 15)
                                    Else
                                        _PutImage (3, Control(i).Top + Control(i).Height / 2 - 8)-Step(15, 15), Control(i).HelperCanvas, , (0, 0)-Step(15, 15)
                                    End If
                            End Select
                        Else
                            IconHeight = 16
                            IconWidth = _Width(Control(i).HelperCanvas) * IconHeight / _Height(Control(i).HelperCanvas)
                            _PutImage (3, Control(i).Top + Control(i).Height / 2 - IconHeight / 2)-Step(IconWidth - 1, IconHeight - 1), Control(i).HelperCanvas
                        End If
                    End If
                End If
                If HasSeparator Then
                    Line (4, Control(i).Top + Control(i).Height + 3)-Step(This.Width - 9, 0), This.BorderColor
                End If
            End If
        Next
        If __UI_DesignMode And Left$(This.Name, 5) <> "__UI_" Then
            Color Darken(Control(__UI_FormID).BackColor, 80)
            __UI_PrintString __UI_MenuItemOffset, This.Height - (uheight& + 6), "Add new"
        End If
        __UI_MakeHardwareImageFromCanvas This
        _Dest PrevDest
    End If
    If This.Canvas Then _PutImage (This.Left, This.Top), This.Canvas
End Sub
Sub __UI_DrawContextMenuHandle (This As __UI_ControlTYPE, ControlState As _Byte)
    Dim PrevDest As Long
    Dim i As Long
    If This.Redraw Or Control(__UI_FormID).Height <> This.PreviousValue Or This.ControlState <> ControlState Or __UI_ForceRedraw Then
        This.Redraw = False
        This.ControlState = ControlState
        This.PreviousValue = Control(__UI_FormID).Height
        If This.Canvas <> 0 Then
            _FreeImage This.Canvas
        End If
        This.Canvas = _NewImage(This.Width, This.Height, 32)
        This.Top = Control(__UI_FormID).Height - This.Height - __UI_SnapDistanceFromForm
        PrevDest = _Dest
        _Dest This.Canvas
        _Font This.Font
        Select Case This.ControlState
            Case 1
                Color This.SelectedBackColor, This.SelectedForeColor
            Case 2
                Color This.SelectedForeColor, This.SelectedBackColor
        End Select
        Cls
        If This.HelperCanvas < -1 Then
            _PutImage ((_Width - _Width(This.HelperCanvas)) / 2, (_Height - _Height(This.HelperCanvas)) / 2), This.HelperCanvas
        End If
        i = 0
        Line (i, i)-Step(This.Width - 1 - i * 2, This.Height - 1 - i * 2), This.BorderColor, B
        __UI_MakeHardwareImageFromCanvas This
        _Dest PrevDest
    End If
    If This.Canvas Then _PutImage (This.Left, This.Top), This.Canvas
End Sub
Sub __UI_DrawPictureBox (This As __UI_ControlTYPE, ControlState As _Byte)
    Dim PrevDest As Long, TheX As Integer, TheY As Integer
    Dim i As Long
    IF This.Redraw OR This.Stretch <> This.PreviousStretch OR This.PreviousValue <> This.HelperCanvas OR This.ControlState <> ControlState OR This.PreviousParentID <> This.ParentID _
       OR __UI_ForceRedraw OR This.PreviousFont <> This.Font THEN
        This.Redraw = False
        This.ControlState = ControlState
        This.PreviousFont = This.Font
        If This.ParentID Then Control(This.ParentID).ChildrenRedrawn = True
        This.PreviousParentID = This.ParentID
        This.PreviousValue = This.HelperCanvas
        This.PreviousStretch = This.Stretch
        If This.Canvas <> 0 Then
            _FreeImage This.Canvas
        End If
        This.Canvas = _NewImage(This.Width, This.Height, 32)
        PrevDest = _Dest
        _Dest This.Canvas
        If This.BackStyle = __UI_Opaque Then
            Cls , This.BackColor
        Else
            Cls , _RGBA32(0, 0, 0, 0)
        End If
        If This.HasBorder Then
            If This.BorderSize > __UI_MaxBorderSize Then
                This.BorderSize = __UI_MaxBorderSize
            ElseIf This.BorderSize < 1 Then
                This.BorderSize = 1
            End If
        End If
        If This.Stretch Then
            _PutImage (This.BorderSize * Abs(This.HasBorder), This.BorderSize * Abs(This.HasBorder))-(This.Width - (This.BorderSize * Abs(This.HasBorder) + 1), This.Height - (This.BorderSize * Abs(This.HasBorder) + 1)), This.HelperCanvas, This.Canvas
        Else
            TheX = This.BorderSize * Abs(This.HasBorder) 'Default = Left
            If This.Align = __UI_Center Then TheX = This.Width / 2 - _Width(This.HelperCanvas) / 2
            If This.Align = __UI_Right Then TheX = This.Width - 1 - _Width(This.HelperCanvas) - (This.BorderSize * Abs(This.HasBorder))
            TheY = This.BorderSize * Abs(This.HasBorder) 'Default = Top
            If This.VAlign = __UI_Middle Then TheY = This.Height / 2 - _Height(This.HelperCanvas) / 2
            If This.VAlign = __UI_Bottom Then TheY = This.Height - 1 - _Height(This.HelperCanvas) - (This.BorderSize * Abs(This.HasBorder))
            _PutImage (TheX, TheY), This.HelperCanvas, This.Canvas
        End If
        If This.HasBorder Then
            For i = 0 To This.BorderSize - 1
                Line (i, i)-Step(This.Width - 1 - i * 2, This.Height - 1 - i * 2), This.BorderColor, B
            Next
        End If
        __UI_MakeHardwareImageFromCanvas This
        _Dest PrevDest
    End If
    If This.Canvas Then _PutImage (This.Left, This.Top), This.Canvas
End Sub
Sub __UI_ShadowBox (bX As Integer, bY As Integer, bW As Integer, bH As Integer, C As Long, shadowLevel As Integer, shadowSize As Integer)
    Dim i As Integer
    For i = 1 To shadowSize
        Line (bX + i, bY + i)-Step(bW, bH), _RGBA32(0, 0, 0, shadowLevel - (shadowLevel / shadowSize) * i), BF
    Next i
    Line (bX, bY)-Step(bW, bH), C, BF
End Sub
Function __UI_Type_Form%%: __UI_Type_Form%% = 1: End Function
Function __UI_Type_Frame%%: __UI_Type_Frame%% = 2: End Function
Function __UI_Type_Button%%: __UI_Type_Button%% = 3: End Function
Function __UI_Type_Label%%: __UI_Type_Label%% = 4: End Function
Function __UI_Type_CheckBox%%: __UI_Type_CheckBox%% = 5: End Function
Function __UI_Type_RadioButton%%: __UI_Type_RadioButton%% = 6: End Function
Function __UI_Type_TextBox%%: __UI_Type_TextBox%% = 7: End Function
Function __UI_Type_ProgressBar%%: __UI_Type_ProgressBar%% = 8: End Function
Function __UI_Type_ListBox%%: __UI_Type_ListBox%% = 9: End Function
Function __UI_Type_DropdownList%%: __UI_Type_DropdownList%% = 10: End Function
Function __UI_Type_MenuBar%%: __UI_Type_MenuBar%% = 11: End Function
Function __UI_Type_MenuItem%%: __UI_Type_MenuItem%% = 12: End Function
Function __UI_Type_MenuPanel%%: __UI_Type_MenuPanel%% = 13: End Function
Function __UI_Type_PictureBox%%: __UI_Type_PictureBox%% = 14: End Function
Function __UI_Type_TrackBar%%: __UI_Type_TrackBar%% = 15: End Function
Function __UI_Type_ContextMenu%%: __UI_Type_ContextMenu%% = 16: End Function
Function __UI_Type_Font%%: __UI_Type_Font%% = 17: End Function
Function __UI_Type_ToggleSwitch%%: __UI_Type_ToggleSwitch%% = 18: End Function
Function __UI_Opaque%%: __UI_Opaque%% = 0: End Function
Function __UI_Transparent%%: __UI_Transparent%% = -1: End Function
Function __UI_Left%%: __UI_Left%% = 0: End Function
Function __UI_Center%%: __UI_Center%% = 1: End Function
Function __UI_Right%%: __UI_Right%% = 2: End Function
Function __UI_Top%%: __UI_Top%% = 0: End Function
Function __UI_Middle%%: __UI_Middle%% = 1: End Function
Function __UI_Bottom%%: __UI_Bottom%% = 2: End Function
Function __UI_NumericWithoutBounds%%: __UI_NumericWithoutBounds%% = True: End Function
Function __UI_NumericWithBounds%%: __UI_NumericWithBounds%% = 2: End Function
Function __UI_CheckMark%%: __UI_CheckMark%% = 0: End Function
Function __UI_Bullet%%: __UI_Bullet%% = 1: End Function
Function MsgBox_OkOnly%%: MsgBox_OkOnly%% = 0: End Function
Function MsgBox_OkCancel%%: MsgBox_OkCancel%% = 1: End Function
Function MsgBox_AbortRetryIgnore%%: MsgBox_AbortRetryIgnore%% = 2: End Function
Function MsgBox_YesNoCancel%%: MsgBox_YesNoCancel%% = 3: End Function
Function MsgBox_YesNo%%: MsgBox_YesNo%% = 4: End Function
Function MsgBox_RetryCancel%%: MsgBox_RetryCancel%% = 5: End Function
Function MsgBox_CancelTryagainContinue%%: MsgBox_CancelTryagainContinue%% = 6: End Function
Function MsgBox_Critical%: MsgBox_Critical% = 16: End Function
Function MsgBox_Question%: MsgBox_Question% = 32: End Function
Function MsgBox_Exclamation%: MsgBox_Exclamation% = 48: End Function
Function MsgBox_Information%: MsgBox_Information% = 64: End Function
Function MsgBox_DefaultButton1%: MsgBox_DefaultButton1% = 0: End Function
Function MsgBox_DefaultButton2%: MsgBox_DefaultButton2% = 256: End Function
Function MsgBox_DefaultButton3%: MsgBox_DefaultButton3% = 512: End Function
Function MsgBox_Defaultbutton4%: MsgBox_Defaultbutton4% = 768: End Function
Function MsgBox_AppModal%%: MsgBox_AppModal%% = 0: End Function
Function MsgBox_SystemModal%: MsgBox_SystemModal% = 4096: End Function
Function MsgBox_SetForeground&: MsgBox_SetForeground& = 65536: End Function
Function MsgBox_Ok%%: MsgBox_Ok%% = 1: End Function
Function MsgBox_Cancel%%: MsgBox_Cancel%% = 2: End Function
Function MsgBox_Abort%%: MsgBox_Abort%% = 3: End Function
Function MsgBox_Retry%%: MsgBox_Retry%% = 4: End Function
Function MsgBox_Ignore%%: MsgBox_Ignore%% = 5: End Function
Function MsgBox_Yes%%: MsgBox_Yes%% = 6: End Function
Function MsgBox_No%%: MsgBox_No%% = 7: End Function
Function MsgBox_Tryagain%%: MsgBox_Tryagain%% = 10: End Function
Function MsgBox_Continue%%: MsgBox_Continue%% = 11: End Function
Function __UI_ToolTipTimeOut!: __UI_ToolTipTimeOut! = .8: End Function
Function __UI_CantResizeV%%: __UI_CantResizeV%% = 1: End Function
Function __UI_CantResizeH%%: __UI_CantResizeH%% = 2: End Function
Function __UI_CantResize%%: __UI_CantResize%% = 3: End Function
Sub __UI_ThemeSetup
    __UI_ScrollbarWidth = 17
    __UI_ScrollbarButtonHeight = 17
    __UI_MenuBarOffset = 8
    __UI_MenuItemOffset = 22
    __UI_DefaultCaptionIndent = 5
End Sub
Function __UI_DefaultColor~& (ControlType As _Byte, Attribute As _Byte)
    Dim Colors(1 To 6) As _Unsigned Long
    Colors(1) = _RGB32(0, 0, 0)
    IF ControlType <> __UI_Type_Form AND Control(__UI_FormID).ForeColor <> Colors(1) THEN _
        Colors(1) = Control(__UI_FormID).ForeColor
    Colors(2) = _RGB32(235, 233, 237)
    IF ControlType <> __UI_Type_Form AND Control(__UI_FormID).BackColor <> Colors(2) THEN _
        Colors(2) = Control(__UI_FormID).BackColor
    Colors(3) = _RGB32(255, 255, 255)
    IF ControlType <> __UI_Type_Form AND Control(__UI_FormID).SelectedForeColor <> Colors(3) THEN _
        Colors(3) = Control(__UI_FormID).SelectedForeColor
    Colors(4) = _RGB32(78, 150, 216)
    IF ControlType <> __UI_Type_Form AND Control(__UI_FormID).SelectedBackColor <> Colors(4) THEN _
        Colors(4) = Control(__UI_FormID).SelectedBackColor
    Colors(5) = _RGB32(167, 166, 170)
    IF ControlType <> __UI_Type_Form AND Control(__UI_FormID).BorderColor <> Colors(5) THEN _
        Colors(5) = Control(__UI_FormID).BorderColor
    Colors(6) = _RGB32(255, 255, 225)
    Select Case ControlType
        Case __UI_Type_TextBox, __UI_Type_ListBox, __UI_Type_DropdownList
            Colors(2) = _RGB32(255, 255, 255)
    End Select
    __UI_DefaultColor~& = Colors(Attribute)
End Function
Function __UI_ImageData$ (File$)
    Dim A$
    Select Case LCase$(File$)
        Case "scrollhbuttons.bmp"
            A$ = MKI$(17) + MKI$(136) 'Width, Height
            A$ = A$ + "okNhoC?g8o?[D2hoAWKYo3=^Tn?dhBjo@S;Yo3=^Tn?dhBjo@S;Yo3=^Tn?dhBjo@S;Yo3=^Tnocg>joY6IOoC?g8ooo^7noaVIQ"
            A$ = A$ + "o;_f6ooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo_lJKloaVIQoo_kQoO\IFhooooooooo"
            A$ = A$ + "ooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooO\IFhookNho7KV5noooooooconoo?okooo"
            A$ = A$ + "l_oooconoo?okoool_oooconoo?okoool_oooconoo?okoool_ooooooo7KV5noo^7noaVIQooooooooeknooG_kooOm^oooekno"
            A$ = A$ + "oG_kooOm^oooeknooG_kooOm^oooeknooG_kooOm^oooooooaVIQoo_kQoO\IFhooooooookRooo_;nooo^hoookRooo_;nooo^h"
            A$ = A$ + "o?7IKmoo_;nooo^hoookRooo_;nooo^hooooooO\IFhookNho7KV5noooooooOndoooiCoooW?mooOndoooiCooLT]eocAfFoooi"
            A$ = A$ + "CoooW?mooOndoooiCoooW?moooooo7KV5noo^7noaVIQoooooo_mN[lofk]boK_g:o_mN[locAfFo?7IKmoLT]eofk]boK_g:o_m"
            A$ = A$ + "N[lofk]boK_g:oooooooaVIQoo_kQoO\IFhooooook^e2o_kF;lo^K]`o?7IKmoLT]eocAfFok^e2o_kF;lo^K]`ok^e2o_kF;lo"
            A$ = A$ + "^K]`ooooooO\IFhookNho7KV5nooooooY7M_oWNdmnOjAgkoY7M_o?7IKmoLT]eocAfFoWNdmnOjAgkoY7M_oWNdmnOjAgkooooo"
            A$ = A$ + "o7KV5noo^7noaVIQoooooo?j@ckoX3=_oS>dln?j@ckoX3=_o?7IKmoLT]eoX3=_oS>dln?j@ckoX3=_oS>dlnooooooaVIQoo_k"
            A$ = A$ + "QoO\IFhooooooS>dln?j@ckoX3=_oS>dln?j@ckoX3=_o?7IKm?j@ckoX3=_oS>dln?j@ckoX3=_ooooooO\IFhookNho7KV5noo"
            A$ = A$ + "ooooX3=_oS>dln?j@ckoX3=_oS>dln?j@ckoX3=_oS>dln?j@ckoX3=_oS>dln?j@ckoooooo7KV5noo^7noaVIQoooooo?j@cko"
            A$ = A$ + "X3=_oS>dln?j@ckoX3=_oS>dln?j@ckoX3=_oS>dln?j@ckoX3=_oS>dlnooooooaVIQoo_kQoO\IFhooooooS>dln?j@ckoX3=_"
            A$ = A$ + "oS>dln?j@ckoX3=_oS>dln?j@ckoX3=_oS>dln?j@ckoX3=_ooooooO\IFhookNho7KV5nOnQglofk]boK_g:o_mN[lofk]boK_g"
            A$ = A$ + ":o_mN[lofk]boK_g:o_mN[lofk]boK_g:o_mN[loi7Nco7KV5noo^7nooo^hoS:Tlm_^Rjhoj:ZSo[[X>n_^Rjhoj:ZSo[[X>n_^"
            A$ = A$ + "Rjhoj:ZSo[[X>n_^Rjhoj:ZSo[[X>noY?^gooSneoo_kQo?mLSlonIVDokWIBm_OV9eonIVDokWIBm_OV9eonIVDokWIBm_OV9eo"
            A$ = A$ + "nIVDokWIBm_OV9eonIVDokWIBm?mLSlookNhokWIBm_lJKlooooooooooooooooooooooooooooooooooooooooooooooooooooo"
            A$ = A$ + "oooooooooooob[]aokWIBmoo^7nonIVDoooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo"
            A$ = A$ + "oooooooonIVDoo_kQo_OV9eooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo_O"
            A$ = A$ + "V9eookNhokWIBmoooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooookWIBmoo^7no"
            A$ = A$ + "nIVDoooooooooooooooooooooooooooooooooooooo?Qk]fooooooooooooooooooooooooooooooooonIVDoo_kQo_OV9eooooo"
            A$ = A$ + "ooonioookWooo_OnooonioookWoo4^gJoChN[mookWooo_OnooonioookWooo_Onoooooo_OV9eookNhokWIBmooooooo7oiooOl"
            A$ = A$ + "WoooaOnoo7oioChN[m?Qk]fo4^gJooOlWoooaOnoo7oiooOlWoooaOnooooookWIBmoo^7nonIVDooooooooW?mooOndoooiCo?Q"
            A$ = A$ + "k]fo4^gJoChN[mooW?mooOndoooiCoooW?mooOndoooiCooooooonIVDoo_kQo_OV9eooooooGOg9oOmMWloegMboGOg9o?Qk]fo"
            A$ = A$ + "4^gJoChN[mOmMWloegMboGOg9oOmMWloegMboooooo_OV9eookNhokWIBmoooooo_Om`oone3ookG?lo_Om`oone3o?Qk]fo4^gJ"
            A$ = A$ + "oone3ookG?lo_Om`oone3ookG?looooookWIBmoo^7nonIVDooooooOkE7lo]GM`ogNe1oOkE7lo]GM`ogNe1o?Qk]fo]GM`ogNe"
            A$ = A$ + "1oOkE7lo]GM`ogNe1ooooooonIVDoo_kQo_OV9eoooooogNe1oOkE7lo]GM`ogNe1oOkE7lo]GM`ogNe1oOkE7lo]GM`ogNe1oOk"
            A$ = A$ + "E7lo]GM`oooooo_OV9eookNhokWIBmoooooo]GM`ogNe1oOkE7lo]GM`ogNe1oOkE7lo]GM`ogNe1oOkE7lo]GM`ogNe1oOkE7lo"
            A$ = A$ + "oooookWIBmoo^7nonIVDooooooOkE7lo]GM`ogNe1oOkE7lo]GM`ogNe1oOkE7lo]GM`ogNe1oOkE7lo]GM`ogNe1ooooooonIVD"
            A$ = A$ + "oo_kQo_OV9eoi7NcoK_g:o_mN[lofk]boK_g:o_mN[lofk]boK_g:o_mN[lofk]boK_g:o_mN[lofk]boWOh=o_OV9eookNhoook"
            A$ = A$ + "Ro_OV9eonIVDokWIBm_OV9eonIVDokWIBm_OV9eonIVDokWIBm_OV9eonIVDokWIBm_OV9eonIVDoo?jGooo^7noX3=_okWIBm_O"
            A$ = A$ + "V9eonIVDokWIBm_OV9eonIVDokWIBm_OV9eonIVDokWIBm_OV9eonIVDokWIBm_OV9eoI7L[oo_kQo_OV9eodc=booombooog;oo"
            A$ = A$ + "oO_looombooog;oooO_looombooog;oooO_looombooog;oooO_loC?g8o_OV9eookNhokWIBmooooooOOl\oomacnog7?koOOl\"
            A$ = A$ + "oomacnog7?koOOl\oomacnog7?koOOl\oomacnog7?kooooookWIBmoo^7nonIVDoooooookG?lo_Om`oone3ookG?lo_Om`oone"
            A$ = A$ + "3ookG?lo_Om`oone3ookG?lo_Om`oone3ooooooonIVDoo_kQo_OV9eooooook_iBo_nRkloj;^co[_h>o_nRkloj;^co_oh?oon"
            A$ = A$ + "Solok?ncok_iBo_oV;monK^doooooo_OV9eookNhokWIBmooooooo;Ojoo_kQooo^7nookNhoo_kQooo^7no4^gJoookRooo`Gno"
            A$ = A$ + "o;Ojoo_lYooobWnooooookWIBmoo^7nonIVDooooooooooooog?oooOolooomcooog?ooChN[m?Qk]fook_ooo_onooonkoooooo"
            A$ = A$ + "oooooooooooonIVDoo_kQo_OV9eooooooooooooooooooooooooooo?Qk]fo4^gJoChN[moooooooooooooooooooooooooooooo"
            A$ = A$ + "oo_OV9eookNhokWIBmoooooooooooooooooooooo4^gJoChN[m?Qk]fooooooooooooooooooooooooooooooooooooookWIBmoo"
            A$ = A$ + "^7nonIVDoooooooooooooooooooooooooooo4^gJoChN[m?Qk]fooooooooooooooooooooooooooooooooonIVDoo_kQo_OV9eo"
            A$ = A$ + "oooooooooooooooooooooooooooooooo4^gJoChN[moooooooooooooooooooooooooooooooo_OV9eookNhokWIBmoooooooooo"
            A$ = A$ + "oooooooooooooooooooooooooooo4^gJoooooooooooooooooooooooooooooooookWIBmoo^7nonIVDoooooooooooooooooooo"
            A$ = A$ + "oooooooooooooooooooooooooooooooooooooooooooooooooooooooonIVDoo_kQo_OV9eooooooooooooooooooooooooooooo"
            A$ = A$ + "oooooooooooooooooooooooooooooooooooooooooooooo_OV9eookNhokWIBm?cd2jooooooooooooooooooooooooooooooooo"
            A$ = A$ + "oooooooooooooooooooooooooooooooo<C;XokWIBmoo^7nonIVDokWIBm?cd2jo<C;Xoc<]Pn?cd2jo<C;Xoc<]Pn?cd2jo<C;X"
            A$ = A$ + "oc<]Pn?cd2jo<C;Xoc<]Pn_OV9eonIVDoo_kQo?f0cjonIVDokWIBm_OV9eonIVDokWIBm_OV9eonIVDokWIBm_OV9eonIVDokWI"
            A$ = A$ + "Bm_OV9eonIVDokWIBm_djJjookNhoo?okooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo"
            A$ = A$ + "ooooooooooOkOooo^7noooooooomboooaOnooo^hooOkOooo\gmoo_>gooOjHoooYSmooSneoo?jGoooWGmonK^dooolZooooooo"
            A$ = A$ + "oOndoo_kQoooooooo7oiooombooofonoo?_joo_lYoooaOnoo7oiooOlWooo`Gnooo>ioookRooo]omooONeooooooOnQglookNh"
            A$ = A$ + "oooooooo_;nooKokooOm^ooobWnoo7oiooOlWooo`Gnooo>ioookTooo_;nookNhooOkOoooWGmoooooo7Of5ooo^7noooooooOk"
            A$ = A$ + "Ooooc[noo;OjooOlWooo`Gnoo3Oioo?lUooo^7noogngooOkOooo]omoogngoo?jGooooooo\C=`oo_kQoooooooo_>gooOlWooo"
            A$ = A$ + "aOnoo7oioo?lUooo`Gnoo3Oio;Lb9ooo]omoogngooOkOooo]omooSneoooooo?j@ckookNhoooooooo[cmoo7oiooOlWooo`Gno"
            A$ = A$ + "o3Oioo?lUo_`9Wlo2WLbooOkOooo\gmoogngoo?kMoooXOmooooooK^cjnoo^7noooooooOjHooo`Gnoo7oiooOlWoooaOno2WLb"
            A$ = A$ + "o;Lb9o_`9WloocNgoo?kMooo\gmoocNgoo?jGoooooooUgL^oo_kQooooooooSneoo?lUooo`Gnoo3Oio;Lb9o_`9Wlo2WLboo?k"
            A$ = A$ + "Mooo\gmoocNgoo?kMooo[cmooONeooooooOi=WkookNhooooooooWGmooo>ioookTooo_Cnooo>io;Lb9o_`9Wlo2WLbooOkOooo"
            A$ = A$ + "\gmoocNgooojLoooWGmooooooGNcinoo^7nooooooooiEooo_;nooo>ioookTooo_Cnooo^ho;Lb9o_`9Wloo_>gooojLooo[cmo"
            A$ = A$ + "o[^foooiEoooooooUgL^oo_kQooooooooOndoo_kQooo_;nooo^hoookRooo_;nookNho;Lb9ooo\gmoo_>goo_jJoooYSmooOnd"
            A$ = A$ + "ooooooOi=WkookNhooooooooW?moogngoo_kQooo^7nookNhoo_kQooo]omoocNgoo?kMooo[cmoo[^foo?jGo_oV;mooooooGNc"
            A$ = A$ + "inoo^7nooooooc?i@ooo[cmoocNgooOkOooo]omoocNgoo?kMooo[cmoo[^fooOjHoooXOmooONeogOiAoooooooUgL^oo_kQooo"
            A$ = A$ + "ooooo;OjoooiCoooWGmooONeoooiEoooWGmooONeoooiEoooWGmooOndoooiCoOoU7moo7oiooooooojCokookNhoc?i@ooooooo"
            A$ = A$ + "oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooodc=booOkOooo^7noo?_jo3?f4oOi=WkoR[\]"
            A$ = A$ + "ok]abnOg57koMGL\ogMaanOg57koMGL\ogMaanOg57koOOl\oWNdmnoofonoogngoo_kQo?mLSlo\B9Po7M^Un?dhBjo@S;Yo3=^"
            A$ = A$ + "Tn?dhBjo@S;Yo3=^Tn?dhBjo@S;Yo3=^Tn?dhBjo?OkXoWJTmm?mLSlookNho7KV5n_lJKlooooooooooooooooooooooooooooo"
            A$ = A$ + "oooooooooooooooooooooooooooooooooooob[]ao7KV5noo^7noaVIQoooooooooooooooooooooooooooooooooooooooooooo"
            A$ = A$ + "ooooooooooooooooooooooooooooooooaVIQoo_kQoO\IFhooooooo?okoool_oooconoo?okoool_oooconoo?okoool_ooocon"
            A$ = A$ + "oo?okoool_oooconooooooO\IFhookNho7KV5noooooooG_kooOm^oooeknooG_kooOm^oooeknooG_kooOm^oooeknooG_kooOm"
            A$ = A$ + "^oooeknoooooo7KV5noo^7noaVIQoooooooo_;nooo^hoookRooo_;nocAfFoookRooo_;nooo^hoookRooo_;nooo^hoookRooo"
            A$ = A$ + "ooooaVIQoo_kQoO\IFhooooooooiCoooW?mooOndoooiCooLT]eocAfFoooiCoooW?mooOndoooiCoooW?mooOndooooooO\IFho"
            A$ = A$ + "okNho7KV5noooooofk]boK_g:o_mN[lofk]bo?7IKmoLT]eocAfFoK_g:o_mN[lofk]boK_g:o_mN[loooooo7KV5noo^7noaVIQ"
            A$ = A$ + "oooooo_kF;lo^K]`ok^e2o_kF;lo^K]`o?7IKmoLT]eocAfFok^e2o_kF;lo^K]`ok^e2oooooooaVIQoo_kQoO\IFhooooooWNd"
            A$ = A$ + "mnOjAgkoY7M_oWNdmnoLT]eocAfFo?7IKmOjAgkoY7M_oWNdmnOjAgkoY7M_ooooooO\IFhookNho7KV5nooooooX3=_oS>dln?j"
            A$ = A$ + "@ckoX3=_o?7IKmoLT]eoX3=_oS>dln?j@ckoX3=_oS>dln?j@ckoooooo7KV5noo^7noaVIQoooooo?j@ckoX3=_oS>dln?j@cko"
            A$ = A$ + "cAfFoS>dln?j@ckoX3=_oS>dln?j@ckoX3=_oS>dlnooooooaVIQoo_kQoO\IFhooooooS>dln?j@ckoX3=_oS>dln?j@ckoX3=_"
            A$ = A$ + "oS>dln?j@ckoX3=_oS>dln?j@ckoX3=_ooooooO\IFhookNho7KV5nooooooX3=_oS>dln?j@ckoX3=_oS>dln?j@ckoX3=_oS>d"
            A$ = A$ + "ln?j@ckoX3=_oS>dln?j@ckoooooo7KV5noo^7noaVIQoooooo?j@ckoX3=_oS>dln?j@ckoX3=_oS>dln?j@ckoX3=_oS>dln?j"
            A$ = A$ + "@ckoX3=_oS>dlnooooooaVIQoo_kQoO\IFhoi7NcoK_g:o_mN[lofk]boK_g:o_mN[lofk]boK_g:o_mN[lofk]boK_g:o_mN[lo"
            A$ = A$ + "fk]boWOh=oO\IFhookNhoookRo?Z@bgoj:ZSo[[X>n_^Rjhoj:ZSo[[X>n_^Rjhoj:ZSo[[X>n_^Rjhoj:ZSo[[X>n_^RjhoWnhN"
            A$ = A$ + "oo?jGooo^7nodc=bokWIBm_OV9eonIVDokWIBm_OV9eonIVDokWIBm_OV9eonIVDokWIBm_OV9eonIVDokWIBm_OV9eodc=boo_k"
            A$ = A$ + "Qo_OV9eob[]aooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo;_f6o_OV9eookNhokWIBmoo"
            A$ = A$ + "oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooookWIBmoo^7nonIVDoooooooooooo"
            A$ = A$ + "oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooonIVDoo_kQo_OV9eooooooooooooooooooooo"
            A$ = A$ + "oooooooooooooooooooooooooooooooooooooooooooooooooooooo_OV9eookNhokWIBmoooooooooooooooooooooooooooChN"
            A$ = A$ + "[moooooooooooooooooooooooooooooooooooooooooookWIBmoo^7nonIVDooooooookWooo_OnooonioookWoo4^gJoChN[moo"
            A$ = A$ + "kWooo_OnooonioookWooo_OnoooniooooooonIVDoo_kQo_OV9eoooooooOlWoooaOnoo7oiooOlWo?Qk]fo4^gJoChN[mooaOno"
            A$ = A$ + "o7oiooOlWoooaOnoo7oioooooo_OV9eookNhokWIBmoooooooOndoooiCoooW?mooOndoooiCo?Qk]fo4^gJoChN[mooW?mooOnd"
            A$ = A$ + "oooiCoooW?mooooookWIBmoo^7nonIVDooooooOmMWloegMboGOg9oOmMWlo4^gJoChN[m?Qk]foegMboGOg9oOmMWloegMboGOg"
            A$ = A$ + "9ooooooonIVDoo_kQo_OV9eooooooone3ookG?lo_Om`oone3o?Qk]fo4^gJoone3ookG?lo_Om`oone3ookG?lo_Om`oooooo_O"
            A$ = A$ + "V9eookNhokWIBmoooooo]GM`ogNe1oOkE7lo]GM`oChN[mOkE7lo]GM`ogNe1oOkE7lo]GM`ogNe1oOkE7looooookWIBmoo^7no"
            A$ = A$ + "nIVDooooooOkE7lo]GM`ogNe1oOkE7lo]GM`ogNe1oOkE7lo]GM`ogNe1oOkE7lo]GM`ogNe1ooooooonIVDoo_kQo_OV9eooooo"
            A$ = A$ + "ogNe1oOkE7lo]GM`ogNe1oOkE7lo]GM`ogNe1oOkE7lo]GM`ogNe1oOkE7lo]GM`oooooo_OV9eookNhokWIBmoooooo]GM`ogNe"
            A$ = A$ + "1oOkE7lo]GM`ogNe1oOkE7lo]GM`ogNe1oOkE7lo]GM`ogNe1oOkE7looooookWIBmoo^7nonIVDoWOh=o_mN[lofk]boK_g:o_m"
            A$ = A$ + "N[lofk]boK_g:o_mN[lofk]boK_g:o_mN[lofk]boK_g:oOnQglonIVDoo_kQooo_;nonIVDokWIBm_OV9eonIVDokWIBm_OV9eo"
            A$ = A$ + "nIVDokWIBm_OV9eonIVDokWIBm_OV9eonIVDokWIBmooXOmookNhoS>dln_OV9eonIVDokWIBm_OV9eonIVDokWIBm_OV9eonIVD"
            A$ = A$ + "okWIBm_OV9eonIVDokWIBm_OV9eonIVDoWM`]noo^7nonIVDoC?g8ooog;oooO_looombooog;oooO_looombooog;oooO_looom"
            A$ = A$ + "booog;oooO_looombo?mLSlonIVDoo_kQo_OV9eooooooomacnog7?koOOl\oomacnog7?koOOl\oomacnog7?koOOl\oomacnog"
            A$ = A$ + "7?koOOl\oooooo_OV9eookNhokWIBmoooooo_Om`oone3ookG?lo_Om`oone3ookG?lo_Om`oone3ookG?lo_Om`oone3ookG?lo"
            A$ = A$ + "oooookWIBmoo^7nonIVDoooooo_oV;moj;^co[_h>o_nRkloj;^co[_h>oonSolok?nco_oh?o_oV;monK^dok_iBooooooonIVD"
            A$ = A$ + "oo_kQo_OV9eooooooo_lYooo^7nookNhoo_kQo?Qk]fookNhoookRooo_;noo3Oioo_lYooobWnoo;Ojoooooo_OV9eookNhokWI"
            A$ = A$ + "BmooooooooooooOolooomcooog?ooChN[m?Qk]fook_ooo_onooonkoook_ooooooooooooooooookWIBmoo^7nonIVDoooooooo"
            A$ = A$ + "oooooooooooooooooooo4^gJoChN[m?Qk]fooooooooooooooooooooooooooooooooonIVDoo_kQo_OV9eooooooooooooooooo"
            A$ = A$ + "oooooooooooooooo4^gJoChN[m?Qk]fooooooooooooooooooooooooooo_OV9eookNhokWIBmoooooooooooooooooooooooooo"
            A$ = A$ + "oChN[m?Qk]fo4^gJoooooooooooooooooooooooooooooooookWIBmoo^7nonIVDoooooooooooooooooooooooooooo4^gJoChN"
            A$ = A$ + "[moooooooooooooooooooooooooooooooooooooonIVDoo_kQo_OV9eooooooooooooooooooooooooooo?Qk]fooooooooooooo"
            A$ = A$ + "oooooooooooooooooooooooooooooo_OV9eookNhokWIBmoooooooooooooooooooooooooooooooooooooooooooooooooooooo"
            A$ = A$ + "oooooooooooooooooooookWIBmoo^7nonIVDoooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo"
            A$ = A$ + "oooooooooooonIVDoo_kQo_OV9eo<C;Xoooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooc<]"
            A$ = A$ + "Pn_OV9eookNhokWIBm_OV9eo<C;Xoc<]Pn?cd2jo<C;Xoc<]Pn?cd2jo<C;Xoc<]Pn?cd2jo<C;Xoc<]Pn?cd2jonIVDokWIBmoo"
            A$ = A$ + "^7noH3<[okWIBm_OV9eonIVDokWIBm_OV9eonIVDokWIBm_OV9eonIVDokWIBm_OV9eonIVDokWIBm_OV9eoB[[Yoo_kQoool_oo"
            A$ = A$ + "oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo]omookNhoooooooog;ooo7oi"
            A$ = A$ + "oookRooo]omoocNgooojLoooYSmooW>foo?jGoooXOmooONeok_iBoooc[nooooooooiCooo^7noooooooOlWooog;oooKokoool"
            A$ = A$ + "ZooobWnoo7oiooOlWoooaOnoo3OioookTooo_;noogngoooiEoooooooi7Ncoo_kQooooooooo^hoo_m_oooeknoo;OjooOlWooo"
            A$ = A$ + "aOnoo3OioookTooo_Cnooo^hoo_kQooo]omooONeooooooOlIGlookNhoooooooo]omoo?_joo_lYoooaOnoo3Oioo?lUooo`Gno"
            A$ = A$ + "okNhooOkOooo]omoogngooOkOoooXOmooooooc>e0ooo^7noooooooojLoooaOnoo7oiooOlWooo`Gno2WLboo?lUooo]omoogng"
            A$ = A$ + "ooOkOooo]omoogngoo?jGoooooooX3=_oo_kQoooooooo_>gooOlWoooaOnoo3Oioo?lUo_`9Wlo2WLbooOkOooo]omoocNgooOk"
            A$ = A$ + "Oooo\gmooSneoooooo_i>[kookNhooooooooYSmoo3OiooOlWoooaOnoo7oio;Lb9o_`9Wlo2WLboo?kMooo\gmoocNgoo?kMooo"
            A$ = A$ + "XOmooooooGNcinoo^7nooooooo?jGooo`Gnoo3Oioo?lUooo^7nookNho;Lb9o_`9Wlo2WLboo?kMooo\gmoo_>goooiEooooooo"
            A$ = A$ + "UgL^oo_kQooooooooONeoookTooo_Cnooo>ioookTo_`9Wlo2WLbo;Lb9ooo]omoocNgoo?kMooo[cmooONeooooooOi=WkookNh"
            A$ = A$ + "ooooooooWGmooo^hoookTooo_Cnooo>io;Lb9o_`9WloogngooojLooo[cmoo_>goo_jJoooWGmooooooGNcinoo^7nooooooooi"
            A$ = A$ + "Cooo^7nooo^hoookRooo_;no2WLboo_kQooo]omoocNgooojLoooZ[mooW>foooiCoooooooUgL^oo_kQooooooooOndooOkOooo"
            A$ = A$ + "^7nookNhoo_kQooo^7noogngoo?kMooo\gmoo_>goo_jJoooXOmonK^dooooooOi=WkookNhoooooo?oT3moo_>goo?kMooo]omo"
            A$ = A$ + "ogngoo?kMooo\gmoo_>goo_jJoooYSmooSneoooiEoOoU7mooooooGNcinoo^7nooooooo_lYoooW?mooONeoooiEoooWGmooONe"
            A$ = A$ + "oooiEoooWGmooONeoooiCoooW?momGNdooOlWooooooo[?m_oo_kQo?oT3mooooooooooooooooooooooooooooooooooooooooo"
            A$ = A$ + "oooooooooooooooooooooooooooooC?g8ooo]omookNhooolZo?lHCloUgL^o;^bfn_g6;koMGL\ogMaanOg57koMGL\ogMaanOg"
            A$ = A$ + "57koMGL\oomacnOjAgkooKokooOk%Oo?"
        Case "scrollhthumb.bmp"
            A$ = MKI$(22) + MKI$(60)
            A$ = A$ + "ogngooOkOooo]omoogngooOkOooo]omoogngooOkOooo]omoogngooOkOooo]omoogngooOkOooo]omoogngooOkOooo]omoogng"
            A$ = A$ + "ooOkOooo]omoogngo7Of5oobcnioC_kYo?m^WnodkNjoC_kYo?m^WnodkNjoC_kYo?m^WnodkNjoC_kYo?m^WnodkNjoC_kYo?m^"
            A$ = A$ + "WnodkNjoC_kYo?m^WnodkNjo4c:VoWNdmnO\IFhoo[omoooooooooooooooooooooooooooooooooooooooooooooooooooooooo"
            A$ = A$ + "oooooooooooooooooooooooooooooooooooooooooo_ngoO\IFhoaVIQoooooooog;oooO_looombooog;oooO_looombooog;oo"
            A$ = A$ + "oO_looombooog;oooO_looombooog;oooO_looombooog;oooO_looomboooooooaVIQo7KV5noooooooo^hoookRooo_;nooo^h"
            A$ = A$ + "oookRooo_;nooo^hoookRooo_;nooo^hoookRooo_;nooo^hoookRooo_;nooo^hoookRooo_;noooooo7KV5nO\IFhooooooook"
            A$ = A$ + "Rooo_;nooo^hoookRooo_;nooo^hoookRooo_;nooo^hoookRooo_;nooo^hoookRooo_;nooo^hoookRooo_;nooo^hooooooO\"
            A$ = A$ + "IFhoaVIQoooooooo\gmoo_>gooojLooo\gmoo_>gooojLooo[cmoo_>goo?kMooo[cmoo_>goo?kMooo[cmoo_>gooojLooo[cmo"
            A$ = A$ + "o_>gooojLoooooooaVIQo7KV5noooooooOndok_iBo_oV;mooOndok_iBo_oV;monK^doooiCoooW?monK^dok_iBoooW?monK^d"
            A$ = A$ + "ok_iBo_oV;mooOndok_iBoooW?moooooo7KV5nO\IFhooooooOog;oomO_logomboS?h<o?nPcloh3>coS?h<oomO_logomboOog"
            A$ = A$ + ";oomO_loh3>coS?h<o?nPcloh3>coOog;oomO_loh3>cooooooO\IFhoaVIQooooooOlIGloaWMao7Of5oOlIGloaWMao7Of5oOl"
            A$ = A$ + "IGloaWMao7Of5oOlIGloaWMao7Of5oOlIGloaWMao7Of5oOlIGloaWMao7Of5oooooooaVIQo7KV5noooooo[?m_o_ndon?kD3lo"
            A$ = A$ + "[?m_o_ndon?kD3lo[?m_oc>e0oojCoko[?m_oc>e0oojCoko[?m_oc>e0oojCoko\C=`o_ndonojCokoooooo7KV5nO\IFhooooo"
            A$ = A$ + "oWNdmnOjAgkoY7M_oWNdmnOjAgkoY7M_oWNdmnOjAgkoY7M_oWNdmnOjAgkoY7M_oWNdmnOjAgkoY7M_oWNdmnOjAgkoY7M_oooo"
            A$ = A$ + "ooO\IFhoaVIQoooooo_jBkkoZ;]_o[^dnn_jBkkoZ;]_o[^dnn_jBkkoZ;]_o[^dnn_jBkkoZ;]_o[^dnn_jBkkoZ;]_o[^dnn_j"
            A$ = A$ + "BkkoZ;]_o[^dnnooooooaVIQo7KV5n_mN[loTc<^oC>chn?i<SkoTc<^oC>chn?i<SkoTc<^oC>chn?i<SkoTc<^oC>chn?i<Sko"
            A$ = A$ + "Tc<^oC>chn?i<SkoTc<^oC>chn?i<Skofk]bok[YBnoo^7noEgKZo[[X>n_^Rjhoj:ZSo[[X>n_^Rjhoj:ZSo[[X>n_^Rjhoj:ZS"
            A$ = A$ + "o[[X>n_^Rjhoj:ZSo[[X>n_^Rjhoj:ZSo[[X>n_^Rjhoj:ZSoS=`\noo^7noogngooOkOooo]omoogngooOkOooo]omoogngooOk"
            A$ = A$ + "Oooo]omoogngooOkOooo]omoogngooOkOooo]omoogngooOkOooo]omoogngooOkOooo]omoogngoomacn_OV9eonIVDokWIBm_O"
            A$ = A$ + "V9eonIVDokWIBm_OV9eonIVDokWIBm_OV9eonIVDokWIBm_OV9eonIVDokWIBm_OV9eonIVDokWIBm_OV9eonIVDoomacn_OV9eo"
            A$ = A$ + "b[]aoooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo"
            A$ = A$ + "o;_f6o_OV9eonIVDoooooooonkoook_ooo_onooonkoook_ooo_onooonkoook_ooo_onooonkoook_ooo_onooonkoook_ooo_o"
            A$ = A$ + "nooonkoook_ooo_onooooooonIVDokWIBmoooooooKokoo_m_oooeknooKokoo_m_ooofonooKokoo_m_oooeknooG_kooOm^ooo"
            A$ = A$ + "eknooG_koo_m_ooofonooKokoo_m_ooofonooooookWIBm_OV9eooooooo_lYooobWnoo;Ojoo_lYooobWnoo;Ojoo_lYooobWno"
            A$ = A$ + "o;Ojoo_lYooobWnoo;Ojoo_lYooobWnoo;Ojoo_lYooobWnoo;Ojoooooo_OV9eonIVDoooooooo_Cnooo^hoookRooo_Cnooo^h"
            A$ = A$ + "oookRooo_;nooo^hoookTooo_;nooo^hoookTooo_;nooo^hoookRooo_;nooo^hoookRooooooonIVDokWIBmoooooooSneoo?j"
            A$ = A$ + "GoooWGmooSneoooiEoooWGmooSneoo?jGoooXOmooSneoooiEoooXOmooONeoooiEoooXOmooSneoooiEoooXOmooooookWIBm_O"
            A$ = A$ + "V9eooooooS?h<o?nPcloh3>coWOh=oOnQgloi7NcoWOh=o?nPcloh3>coS?h<o?nPcloi7NcoWOh=oOnQgloi7NcoS?h<o?nPclo"
            A$ = A$ + "i7Ncoooooo_OV9eonIVDoooooo?lHClo`S=ao3?f4o?lHClo`S=ao3?f4oOlIGlo`S=ao3?f4o?lHClo`S=ao3?f4o?lHClo`S=a"
            A$ = A$ + "o7Of5o?lHClo`S=ao3?f4ooooooonIVDokWIBmooooooZ;]_oWNdmn_jBkkoY7M_oWNdmn_jBkkoZ;]_o[^dnn_jBkkoY7M_o[^d"
            A$ = A$ + "nnOjAgkoY7M_o[^dnn_jBkkoZ;]_o[^dnn_jBkkooooookWIBm_OV9eooooooOncknoi?_koWol^oOncknoi?_koWol^oOncknoi"
            A$ = A$ + "?_koWol^oOncknoi?_koWol^oOncknoi?_koWol^oOncknoi?_koWol^oooooo_OV9eonIVDooooooOjAgkoY7M_oWNdmnOjAgko"
            A$ = A$ + "Y7M_oWNdmnOjAgkoY7M_oWNdmnOjAgkoY7M_oWNdmnOjAgkoY7M_oWNdmnOjAgkoY7M_oWNdmnoooooonIVDokWIBmomO_loQWL]"
            A$ = A$ + "o7NbenOh9GkoQWL]o7NbenOh9GkoQWL]o7NbenOh9GkoQWL]o7NbenOh9GkoQWL]o7NbenOh9GkoQWL]o7NbenOh9GkogombokWI"
            A$ = A$ + "Bmog7?konIVDokWIBm_OV9eonIVDokWIBm_OV9eonIVDokWIBm_OV9eonIVDokWIBm_OV9eonIVDokWIBm_OV9eonIVDokWIBm_O"
            A$ = A$ + "V9eonIVDokWIBmog7?koogngooOkOooo]omoogngooOkOooo]omoogngooOkOooo]omoogngooOkOooo]omoogngooOkOooo]omo"
            A$ = A$ + "ogngooOkOooo]omoogngooOkOooo]omoogngoS>dln_H:IcoRYT=o;VBfl_H:IcoRYT=o;VBfl_H:IcoRYT=o;VBfl_H:IcoRYT="
            A$ = A$ + "o;VBfl_H:IcoRYT=o;VBfl_H:IcoRYT=o;VBfl_H:IcoRYT=oWM`]n_H:Icodc=booombooog;oooO_looombooog;oooO_looom"
            A$ = A$ + "booog;oooO_looombooog;oooO_looombooog;oooO_looombooog;oooO_loC?g8o_H:IcoRYT=oooooooh;OkoS_l]o?nbgnoh"
            A$ = A$ + ";OkoS_l]o?nbgnoh;OkoS_l]o?nbgnoh;OkoS_l]o?nbgnoh;OkoS_l]o?nbgnoh;OkoS_l]o?nbgnooooooRYT=o;VBfloooooo"
            A$ = A$ + "X3=_oS>dln?j@ckoX3=_oS>dln?j@ckoX3=_oS>dln?j@ckoX3=_oS>dln?j@ckoX3=_oS>dln?j@ckoX3=_oS>dln?j@ckooooo"
            A$ = A$ + "o;VBfl_H:IcooooooWNdmn?j@ckoY7M_oS>dln?j@ckoY7M_oS>dlnOjAgkoY7M_oS>dlnOjAgkoX3=_oS>dlnOjAgkoX3=_oWNd"
            A$ = A$ + "mnOjAgkoY7M_oooooo_H:IcoRYT=oooooo?lHClo`S=ao3?f4o?lHClo`S=ao7Of5oOlIGlo`S=ao3?f4o?lHClo`S=ao3?f4o?l"
            A$ = A$ + "HCloaWMao7Of5o?lHClo`S=ao3?f4oooooooRYT=o;VBfloooooolC>doc?i@oonSololC>doc?i@o?oT3molC>doc?i@o?oT3mo"
            A$ = A$ + "lC>do_oh?o?oT3molC>doc?i@o?oT3molC>do_oh?o?oT3moooooo;VBfl_H:Icooooooo_kQooo]omoogngoo_kQooo]omoogng"
            A$ = A$ + "ooOkOooo]omookNhooOkOooo]omookNhooOkOooo]omoogngooOkOooo]omoogngoooooo_H:IcoRYT=oooooooobWnoo;Ojoo_l"
            A$ = A$ + "YooobWnoo;Ojoo_lYooobWnoo;Ojoo_lYooobWnoo;Ojoo_lYooobWnoo;Ojoo_lYooobWnoo;Ojoo_lYoooooooRYT=o;VBfloo"
            A$ = A$ + "oooooOOlooomaooog7oooOOlooomaooog7oooOOlooombooog7oooOOlooomaooog7oooOOlooomaooog;oooOOlooombooog7oo"
            A$ = A$ + "ooooo;VBfl_H:IcoooooooOolooomcooog?oooOolooomcooog?oooOolooomcooog?oooOolooomcooog?oooOolooomcooog?o"
            A$ = A$ + "ooOolooomcoooconoooooo_H:IcoRYT=oc<]Pnoooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo"
            A$ = A$ + "oooooooooooooooooooooooooooooooooo?cd2joRYT=o;VBfl_H:Ico<C;Xoc<]Pn?cd2jo<C;Xoc<]Pn?cd2jo<C;Xoc<]Pn?c"
            A$ = A$ + "d2jo<C;Xoc<]Pn?cd2jo<C;Xoc<]Pn?cd2jo<C;Xoc<]Pn?cd2joRYT=o;VBfl?f0cjoRYT=o;VBfl_H:IcoRYT=o;VBfl_H:Ico"
            A$ = A$ + "RYT=o;VBfl_H:IcoRYT=o;VBfl_H:IcoRYT=o;VBfl_H:IcoRYT=o;VBfl_H:IcoRYT=o;VBfl_djJjoogngooOkOooo]omoogng"
            A$ = A$ + "ooOkOooo]omoogngooOkOooo]omoogngooOkOooo]omoogngooOkOooo]omoogngooOkOooo]omoogngooOkOooo]omoogngooon"
            A$ = A$ + "iooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo"
            A$ = A$ + "ooooWol^ooolZooooooooOOlooOlWo_oV;mooONeoooiCo_oV;mooONeoooiCo_oV;mooONeoooiCo_oV;mooONeoooiEoooWGmo"
            A$ = A$ + "oW>foo_jJoooZ[moo;Ojoooooooh;OkoooooooOlWooog7oooo>ioo?lUooo`Gnooo>ioo?lUooo`Gnooo>ioo?lUooo`Gnooo>i"
            A$ = A$ + "oo?lUooo`Gnooo>ioo?lUooo`Gnooo>iogOiAoooooooK?l[oooooooo^7nooG_koo?lUoooaOnoo3Oioo?lUoooaOnoo3Oioo?l"
            A$ = A$ + "UoooaOnoo3Oioo?lUoooaOnoo3Oioo?lUoooaOnoo3Oioo?lUo_oV;moooooo[]`^nooooooocNgooolZooo`Gnoo3Oioo?lUooo"
            A$ = A$ + "`Gnoo3Oioo?lUooo`Gnoo3Oioo?lUooo`Gnoo3Oioo?lUooo`Gnoo3Oioo?lUooo`GnonK^dooooooOf1gjooooooo_jJooobWno"
            A$ = A$ + "oo>ioookTooo_Cnooo>ioookTooo_Cnooo>ioookTooo_Cnooo>ioookTooo_Cnooo>ioookTooo_Cnooo>iok_iBoooooooI7L["
            A$ = A$ + "ooooooooYSmoo7oioookTooo^7nookNhoookTooo^7nookNhoookTooo^7nookNhoookTooo^7nookNhoookTooo^7nookNhoook"
            A$ = A$ + "To_oV;mooooooWM`]noooooooONeooOlWooo^7noogngoo_kQooo^7noogngoo_kQooo^7noogngoo_kQooo^7noogngoo_kQooo"
            A$ = A$ + "^7noogngoo_kQooo^7nonK^doooooo_f2kjooooooooiEoooaOnoo_>gooojLooo[cmoo_>gooojLooo[cmoo_>gooojLooo[cmo"
            A$ = A$ + "o_>gooojLooo[cmoo_>gooojLooo[cmoo_>gok_iBoooooooJ;\[oooooo_oV;mookNhooOjHoooZ[moo[^fooOjHoooZ[moo[^f"
            A$ = A$ + "ooOjHoooZ[moo[^fooOjHoooZ[moo[^fooOjHoooZ[moo[^fooOjHoOoU7moooooo_m`_noooooolC>dooojLoooYSmoo[^fooOj"
            A$ = A$ + "HoooYSmoo[^fooOjHoooYSmoo[^fooOjHoooYSmoo[^fooOjHoooYSmoo[^fooOjHoooYSmok?ncooooooOg57koooooooolZo_o"
            A$ = A$ + "V;monK^doooiCo_oV;monK^doooiCo_oV;monK^doooiCo_oV;monK^doooiCo_oV;monK^doooiCo_oV;monK^dooOlWooooooo"
            A$ = A$ + "Vk\^oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo"
            A$ = A$ + "oooooooooooo`S=aooOm^ooo\gmooSneo;_f6o_h:KkoR[\]o;^bfn_h:KkoR[\]o;^bfn_h:KkoR[\]o;^bfn_h:KkoR[\]o;^b"
            A$ = A$ + "fn_h:KkoR[\]o;^bfn_h:Kko[?m_oo?kMooo\gmo%%%0"
        Case "scrollhtrack.bmp"
            A$ = MKI$(17) + MKI$(68)
            A$ = A$ + "oW>fooOjHoooYSmooW>fooOjHoooYSmooW>fooOjHoooYSmooW>fooOjHoooYSmooW>fooOjHoooYSmooW>fooOjHooo_Cnooo>i"
            A$ = A$ + "oookTooo_Cnooo>ioookTooo_Cnooo>ioookTooo_Cnooo>ioookTooo_Cnooo>ioookTooo_Cnooo>ioo?lUooo`Gnoo3Oioo?l"
            A$ = A$ + "Uooo`Gnoo3Oioo?lUooo`Gnoo3Oioo?lUooo`Gnoo3Oioo?lUooo`Gnoo3Oioo?lUooo`Gnoo3Oioo?lUooo`Gnoo3Oioo?lUooo"
            A$ = A$ + "`Gnoo3Oioo?lUooo`Gnoo3Oioo?lUooo`Gnoo3Oioo?lUooo`Gnoo3Oioo?lUoooaOnoo7oiooOlWoooaOnoo7oiooOlWoooaOno"
            A$ = A$ + "o7oiooOlWoooaOnoo7oiooOlWoooaOnoo7oiooOlWoooaOnoo7oioo_lYooobWnoo;Ojoo_lYooobWnoo;Ojoo_lYooobWnoo;Oj"
            A$ = A$ + "oo_lYooobWnoo;Ojoo_lYooobWnoo;Ojoo_lYooobWnooC?koo?m\ooodcnooC?koo?m\ooodcnooC?koo?m\ooodcnooC?koo?m"
            A$ = A$ + "\ooodcnooC?koo?m\ooodcnooC?koo?m\ooofonooKokoo_m_ooofonooKokoo_m_ooofonooKokoo_m_ooofonooKokoo_m_ooo"
            A$ = A$ + "fonooKokoo_m_ooofonooKokooombooog;oooO_looombooog;oooO_looombooog;oooO_looombooog;oooO_looombooog;oo"
            A$ = A$ + "oO_looombooog;oooS?moo?ndooohCoooS?moo?ndooohCoooS?moo?ndooohCoooS?moo?ndooohCoooS?moo?ndooohCoooS?m"
            A$ = A$ + "oo?ndoooiKoooW_mooOnfoooiKoooW_mooOnfoooiKoooW_mooOnfoooiKoooW_mooOnfoooiKoooW_mooOnfoooiKoooW_mooOn"
            A$ = A$ + "foooiKoooW_mooOnfoooiKoooW_mooOnfoooiKoooW_mooOnfoooiKoooW_mooOnfoooiKoooW_mooOnfoooiKooo[omoo_ngooo"
            A$ = A$ + "jOooo[omoo_ngooojOooo[omoo_ngooojOooo[omoo_ngooojOooo[omoo_ngooojOooo[omoo_ngoookWooo_OnooonioookWoo"
            A$ = A$ + "o_OnooonioookWooo_OnooonioookWooo_OnooonioookWooo_OnooonioookWooo_OnooonioookWooo_OnooonioookWooo_On"
            A$ = A$ + "ooonioookWooo_OnooonioookWooo_OnooonioookWooo_OnooonioookWooo_OnooonioookWooo_OnooonioookWooo_Onooon"
            A$ = A$ + "ioookWooo_OnooonioookWooo_OnooonioookWooo_OnooonioooYSmooW>fooOjHoooYSmooW>fooOjHoooYSmooW>fooOjHooo"
            A$ = A$ + "YSmooW>fooOjHoooYSmooW>fooOjHoooYSmooW>fooOjHoooYSmooW>fooOjHoooYSmooW>fooOjHoooYSmooW>fooOjHoooYSmo"
            A$ = A$ + "oW>fooOjHoooYSmooW>fooOjHoooYSmooo>ioookTooo_Cnooo>ioookTooo_Cnooo>ioookTooo_Cnooo>ioookTooo_Cnooo>i"
            A$ = A$ + "oookTooo_Cnooo>ioookTooo`Gnoo3Oioo?lUooo`Gnoo3Oioo?lUooo`Gnoo3Oioo?lUooo`Gnoo3Oioo?lUooo`Gnoo3Oioo?l"
            A$ = A$ + "Uooo`Gnoo3Oioo?lUooo`Gnoo3Oioo?lUooo`Gnoo3Oioo?lUooo`Gnoo3Oioo?lUooo`Gnoo3Oioo?lUooo`Gnoo3Oioo?lUooo"
            A$ = A$ + "`Gnoo7oiooOlWoooaOnoo7oiooOlWoooaOnoo7oiooOlWoooaOnoo7oiooOlWoooaOnoo7oiooOlWoooaOnoo7oiooOlWooobWno"
            A$ = A$ + "o;Ojoo_lYooobWnoo;Ojoo_lYooobWnoo;Ojoo_lYooobWnoo;Ojoo_lYooobWnoo;Ojoo_lYooobWnoo;Ojoo?m\ooodcnooC?k"
            A$ = A$ + "oo?m\ooodcnooC?koo?m\ooodcnooC?koo?m\ooodcnooC?koo?m\ooodcnooC?koo?m\ooodcnooKokoo_m_ooofonooKokoo_m"
            A$ = A$ + "_ooofonooKokoo_m_ooofonooKokoo_m_ooofonooKokoo_m_ooofonooKokoo_m_ooog;oooO_looombooog;oooO_looombooo"
            A$ = A$ + "g;oooO_looombooog;oooO_looombooog;oooO_looombooog;oooO_loo?ndooohCoooS?moo?ndooohCoooS?moo?ndooohCoo"
            A$ = A$ + "oS?moo?ndooohCoooS?moo?ndooohCoooS?moo?ndooohCoooW_mooOnfoooiKoooW_mooOnfoooiKoooW_mooOnfoooiKoooW_m"
            A$ = A$ + "ooOnfoooiKoooW_mooOnfoooiKoooW_mooOnfoooiKoooW_mooOnfoooiKoooW_mooOnfoooiKoooW_mooOnfoooiKoooW_mooOn"
            A$ = A$ + "foooiKoooW_mooOnfoooiKoooW_moo_ngooojOooo[omoo_ngooojOooo[omoo_ngooojOooo[omoo_ngooojOooo[omoo_ngooo"
            A$ = A$ + "jOooo[omoo_ngooojOooo_OnooonioookWooo_OnooonioookWooo_OnooonioookWooo_OnooonioookWooo_OnooonioookWoo"
            A$ = A$ + "o_OnooonioookWooo_OnooonioookWooo_OnooonioookWooo_OnooonioookWooo_OnooonioookWooo_OnooonioookWooo_On"
            A$ = A$ + "ooonioookWooo_OnooonioookWooo_OnooonioookWooo_OnooonioookWooo_OnooonioookWooo_OnooonioookWoooW>fooOj"
            A$ = A$ + "HoooYSmooW>fooOjHoooYSmooW>fooOjHoooYSmooW>fooOjHoooYSmooW>fooOjHoooYSmooW>fooOjHo?h8CkoPS<]o3>bdn?h"
            A$ = A$ + "8CkoPS<]o3>bdn?h8CkoPS<]o3>bdn?h8CkoPS<]o3>bdn?h8CkoPS<]o3>bdn?h8CkoPS<]o;_f6o_lJKlob[]ao;_f6o_lJKlo"
            A$ = A$ + "b[]ao;_f6o_lJKlob[]ao;_f6o_lJKlob[]ao;_f6o_lJKlob[]ao;_f6o_lJKlodc=boC?g8o?mLSlodc=boC?g8o?mLSlodc=b"
            A$ = A$ + "oC?g8o?mLSlodc=boC?g8o?mLSlodc=boC?g8o?mLSlodc=boC?g8o?mLSlodc=boC?g8o?mLSlodc=boC?g8o?mLSlodc=boC?g"
            A$ = A$ + "8o?mLSlodc=boC?g8o?mLSlodc=boC?g8o?mLSlodc=boS?h<o?nPcloh3>coS?h<o?nPcloh3>coS?h<o?nPcloh3>coS?h<o?n"
            A$ = A$ + "Pcloh3>coS?h<o?nPcloh3>coS?h<o?nPcloi7NcoWOh=oOnQgloi7NcoWOh=oOnQgloi7NcoWOh=oOnQgloi7NcoWOh=oOnQglo"
            A$ = A$ + "i7NcoWOh=oOnQgloi7NcoWOh=oooW?mooOndoooiCoooW?mooOndoooiCoooW?mooOndoooiCoooW?mooOndoooiCoooW?mooOnd"
            A$ = A$ + "oooiCoooW?mooOndooOjHoooYSmooW>fooOjHoooYSmooW>fooOjHoooYSmooW>fooOjHoooYSmooW>fooOjHoooYSmooW>fooOj"
            A$ = A$ + "HoooYSmooo^hoookRooo_;nooo^hoookRooo_;nooo^hoookRooo_;nooo^hoookRooo_;nooo^hoookRooo_;nooo^hoookRooo"
            A$ = A$ + "aOnoo7oiooOlWoooaOnoo7oiooOlWoooaOnoo7oiooOlWoooaOnoo7oiooOlWoooaOnoo7oiooOlWoooaOnoo7oiooolZoooc[no"
            A$ = A$ + "o?_jooolZoooc[noo?_jooolZoooc[noo?_jooolZoooc[noo?_jooolZoooc[noo?_jooolZoooc[noo?_jooolZoooc[noo?_j"
            A$ = A$ + "ooolZoooc[noo?_jooolZoooc[noo?_jooolZoooc[noo?_jooolZoooc[noo?_jooolZoooeknooG_kooOm^oooeknooG_kooOm"
            A$ = A$ + "^oooeknooG_kooOm^oooeknooG_kooOm^oooeknooG_kooOm^oooeknooG_kooombooog;oooO_looombooog;oooO_looombooo"
            A$ = A$ + "g;oooO_looombooog;oooO_looombooog;oooO_looombooog;oooO_looombooog;oooO_looombooog;oooO_looombooog;oo"
            A$ = A$ + "oO_looombooog;oooO_looombooog;oooO_looombooog;oooO_looombooog;oooO_looombooog;oooO_looombooog;oooO_l"
            A$ = A$ + "ooombooog;oooO_looombooog;oooO_lo3>bdn?h8CkoPS<]o3>bdn?h8CkoPS<]o3>bdn?h8CkoPS<]o3>bdn?h8CkoPS<]o3>b"
            A$ = A$ + "dn?h8CkoPS<]o3>bdn?h8CkooW>fooOjHoooYSmooW>fooOjHoooYSmooW>fooOjHoooYSmooW>fooOjHoooYSmooW>fooOjHooo"
            A$ = A$ + "YSmooW>fooOjHooo_Cnooo>ioookTooo_Cnooo>ioookTooo_Cnooo>ioookTooo_Cnooo>ioookTooo_Cnooo>ioookTooo_Cno"
            A$ = A$ + "oo>ioo?lUooo`Gnoo3Oioo?lUooo`Gnoo3Oioo?lUooo`Gnoo3Oioo?lUooo`Gnoo3Oioo?lUooo`Gnoo3Oioo?lUooo`Gnoo3Oi"
            A$ = A$ + "oo?lUooo`Gnoo3Oioo?lUooo`Gnoo3Oioo?lUooo`Gnoo3Oioo?lUooo`Gnoo3Oioo?lUooo`Gnoo3Oioo?lUoooaOnoo7oiooOl"
            A$ = A$ + "WoooaOnoo7oiooOlWoooaOnoo7oiooOlWoooaOnoo7oiooOlWoooaOnoo7oiooOlWoooaOnoo7oioo_lYooobWnoo;Ojoo_lYooo"
            A$ = A$ + "bWnoo;Ojoo_lYooobWnoo;Ojoo_lYooobWnoo;Ojoo_lYooobWnoo;Ojoo_lYooobWnooC?koo?m\ooodcnooC?koo?m\ooodcno"
            A$ = A$ + "oC?koo?m\ooodcnooC?koo?m\ooodcnooC?koo?m\ooodcnooC?koo?m\ooofonooKokoo_m_ooofonooKokoo_m_ooofonooKok"
            A$ = A$ + "oo_m_ooofonooKokoo_m_ooofonooKokoo_m_ooofonooKokooombooog;oooO_looombooog;oooO_looombooog;oooO_looom"
            A$ = A$ + "booog;oooO_looombooog;oooO_looombooog;oooS?moo?ndooohCoooS?moo?ndooohCoooS?moo?ndooohCoooS?moo?ndooo"
            A$ = A$ + "hCoooS?moo?ndooohCoooS?moo?ndoooiKoooW_mooOnfoooiKoooW_mooOnfoooiKoooW_mooOnfoooiKoooW_mooOnfoooiKoo"
            A$ = A$ + "oW_mooOnfoooiKoooW_mooOnfoooiKoooW_mooOnfoooiKoooW_mooOnfoooiKoooW_mooOnfoooiKoooW_mooOnfoooiKoooW_m"
            A$ = A$ + "ooOnfoooiKooo[omoo_ngooojOooo[omoo_ngooojOooo[omoo_ngooojOooo[omoo_ngooojOooo[omoo_ngooojOooo[omoo_n"
            A$ = A$ + "goookWooo_OnooonioookWooo_OnooonioookWooo_OnooonioookWooo_OnooonioookWooo_OnooonioookWooo_Onoooniooo"
            A$ = A$ + "kWooo_OnooonioookWooo_OnooonioookWooo_OnooonioookWooo_OnooonioookWooo_OnooonioookWooo_OnooonioookWoo"
            A$ = A$ + "o_OnooonioookWooo_OnooonioookWooo_OnooonioookWooo_OnooonioookWooo_OnooonioooYSmooW>fooOjHoooYSmooW>f"
            A$ = A$ + "ooOjHoooYSmooW>fooOjHoooYSmooW>fooOjHoooYSmooW>fooOjHoooYSmooW>f%%o3"
        Case "menucheckmark.bmp"
            A$ = MKI$(7) + MKI$(21)
            A$ = A$ + "o3`ooo?0oooo0looo3`ooo?0oooo0loo0000oo?0oooo0looo3`ooo?0oooo0loo0000o3000l?000`oo3`ooo?0oooo0loo0000"
            A$ = A$ + "o3000l?000`o0000o3000loo0loo0000o3000l?000`oo3`oo3000l?000`o0000o3000l?000`oo3`ooo?0oooo0loo0000o300"
            A$ = A$ + "0l?000`oo3`ooo?0oooo0looo3`ooo?0oo?000`oo3`ooo?0oooo0looo3`ooo?0oooo0looo3`ooo?0oooo0looo3`ooooooooo"
            A$ = A$ + "0looo3`ooo?0oooo0looo3`ooooooooooooooooooo?0oooo0looo3`oooooooooooooooooooooooooooooo3`ooooooooooooo"
            A$ = A$ + "oooooo?0oooooooooooooooooooooooooooooo?0oooo0looo3`ooooooooooooooooooo?0oooo0looo3`ooo?0oooo0loooooo"
            A$ = A$ + "oo?0oooo0looo3`ooo?0oooo0looo3`ooo?0oooo0looo3`ooo?0oo_ZVNjoo3`ooo?0oooo0looo3`ooo?0oo_ZVNjoZJjYo[ZY"
            A$ = A$ + "Wnoo0looo3`ooo?0oo_ZVNjoZJjYo[ZYWn_ZVNjoZJjYoo?0oo_ZVNjoZJjYo[ZYWnoo0looZJjYo[ZYWn_ZVNjoZJjYo[ZYWnoo"
            A$ = A$ + "0looo3`ooo?0oo_ZVNjoZJjYo[ZYWnoo0looo3`ooo?0oooo0looo3`oo[ZYWnoo0looo3`ooo?0oooo0loo%%%0"
        Case "slidertrack.png"
            A$ = MKI$(5) + MKI$(5)
            A$ = A$ + "EcMgoc;`0oOVLfiodS?nok>meoO[a:ko7g\coWNlboOlfOoog[_noCiUHn?i[cnoY7_lo[^lco_onkooIb9WoG]eFo?h]3ooaKom"
            A$ = A$ + "oO_njoocCCmom:l`oooooo?mhSoo^COm%%o3"
        Case "frame.png"
            A$ = MKI$(22) + MKI$(20)
            A$ = A$ + "o3`ooo?0ooOfEKmoIG]eoWMeFoOfEKmoIG]eoWMeFoOfEKmoIG]eoWMeFoOfEKmoIG]eoWMeFoOfEKmoIG]eoWMeFoOfEKmoIG]e"
            A$ = A$ + "ooKdAooo0looo3`ooo?0ooOfEKmoIG]eoo?0oooo0looo3`ooo?0oooo0looo3`ooo?0oooo0looo3`ooo?0oooo0looo3`ooo?0"
            A$ = A$ + "oooo0looo3`ooo?0oo?aC?moIG]eoo?0ooOfEKmoIG]eoo?0oooo0looo3`ooo?0oooo0looo3`ooo?0oooo0looo3`ooo?0oooo"
            A$ = A$ + "0looo3`ooo?0oooo0looo3`ooo?0oooo0looo3`ooGldCoOfEKmoIG]eoo?0oooo0looo3`ooo?0oooo0looo3`ooo?0oooo0loo"
            A$ = A$ + "o3`ooo?0oooo0looo3`ooo?0oooo0looo3`ooo?0oooo0looo3`ooo?0oooo0looo6MdoWMeFooo0looo3`ooo?0oooo0looo3`o"
            A$ = A$ + "oo?0oooo0looo3`ooo?0oooo0looo3`ooo?0oooo0looo3`ooo?0oooo0looo3`ooo?0oooo0looo3`ooWMeFoOfEKmoo3`ooo?0"
            A$ = A$ + "oooo0looo3`ooo?0oooo0looo3`ooo?0oooo0looo3`ooo?0oooo0looo3`ooo?0oooo0looo3`ooo?0oooo0looo3`ooo?0ooOf"
            A$ = A$ + "EKmoIG]eoo?0oooo0looo3`ooo?0oooo0looo3`ooo?0oooo0looo3`ooo?0oooo0looo3`ooo?0oooo0looo3`ooo?0oooo0loo"
            A$ = A$ + "o3`ooo?0oooo0looIG]eoWMeFooo0looo3`ooo?0oooo0looo3`ooo?0oooo0looo3`ooo?0oooo0looo3`ooo?0oooo0looo3`o"
            A$ = A$ + "oo?0oooo0looo3`ooo?0oooo0looo3`ooWMeFoOfEKmoo3`ooo?0oooo0looo3`ooo?0oooo0looo3`ooo?0oooo0looo3`ooo?0"
            A$ = A$ + "oooo0looo3`ooo?0oooo0looo3`ooo?0oooo0looo3`ooo?0ooOfEKmoIG]eoo?0oooo0looo3`ooo?0oooo0looo3`ooo?0oooo"
            A$ = A$ + "0looo3`ooo?0oooo0looo3`ooo?0oooo0looo3`ooo?0oooo0looo3`ooo?0oooo0looIG]eoWMeFooo0looo3`ooo?0oooo0loo"
            A$ = A$ + "o3`ooo?0oooo0looo3`ooo?0oooo0looo3`ooo?0oooo0looo3`ooo?0oooo0looo3`ooo?0oooo0looo3`ooWMeFoOfEKmoo3`o"
            A$ = A$ + "oo?0oooo0looo3`ooo?0oooo0looo3`ooo?0oooo0looo3`ooo?0oooo0looo3`ooo?0oooo0looo3`ooo?0oooo0looo3`ooo?0"
            A$ = A$ + "ooOfEKmoIG]eoo?0oooo0looo3`ooo?0oooo0looo3`ooo?0oooo0looo3`ooo?0oooo0looo3`ooo?0oooo0looo3`ooo?0oooo"
            A$ = A$ + "0looo3`ooo?0oooo0looIG]eoWMeFooo0looo3`ooo?0oooo0looo3`ooo?0oooo0looo3`ooo?0oooo0looo3`ooo?0oooo0loo"
            A$ = A$ + "o3`ooo?0oooo0looo3`ooo?0oooo0looo3`ooWMeFoOfEKmoo3`ooo?0oooo0looo3`ooo?0oooo0looo3`ooo?0oooo0looo3`o"
            A$ = A$ + "oo?0oooo0looo3`ooo?0oooo0looo3`ooo?0oooo0looo3`ooo?0ooOfEKmoIG]eoo?0oooo0looo3`ooo?0oooo0looo3`ooo?0"
            A$ = A$ + "oooo0looo3`ooo?0oooo0looo3`ooo?0oooo0looo3`ooo?0oooo0looo3`ooo?0oooo0looIG]eoWMeFooo0looo3`ooo?0oooo"
            A$ = A$ + "0looo3`ooo?0oooo0looo3`ooo?0oooo0looo3`ooo?0oooo0looo3`ooo?0oooo0looo3`ooo?0oooo0looo3`oooKdAoOfEKmo"
            A$ = A$ + "IG]eoo?0oooo0looo3`ooo?0oooo0looo3`ooo?0oooo0looo3`ooo?0oooo0looo3`ooo?0oooo0looo3`ooo?0oooo0looo3`o"
            A$ = A$ + "oGldCoOfEKmoo3`ooWMeFoOfEKmoo3`ooo?0oooo0looo3`ooo?0oooo0looo3`ooo?0oooo0looo3`ooo?0oooo0looo3`ooo?0"
            A$ = A$ + "oooo0looo3`ooCldCoOfEKmoo3`ooo?0oooo0looIG]eoWMeFoOfEKmoIG]eoWMeFoOfEKmoIG]eoWMeFoOfEKmoIG]eoWMeFoOf"
            A$ = A$ + "EKmoIG]eoWMeFoOfEKmoIG]eoWMeFoo_A7moo3`ooo?0%oo?"
        Case "arrows.png"
            A$ = MKI$(9) + MKI$(144)
            A$ = A$ + "o3`ooo?0oooo0looo3`ooo?0oooo0looo3`ooo?0oooo0looo3`ooo?0oooo0looo3`oo?7IKmoo0looo3`ooo?0oooo0looo3`o"
            A$ = A$ + "oo?0oooo0loocAfFo?7IKmoLT]eoo3`ooo?0oooo0looo3`ooo?0oooLT]eocAfFo?7IKmoLT]eocAfFoo?0oooo0looo3`oo?7I"
            A$ = A$ + "KmoLT]eocAfFoo?0oooLT]eocAfFo?7IKmoo0loocAfFo?7IKmoLT]eoo3`ooo?0oooo0loocAfFo?7IKmoLT]eoo3`oo?7IKmoo"
            A$ = A$ + "0looo3`ooo?0oooo0looo3`oo?7IKmoo0looo3`ooo?0oooo0looo3`ooo?0oooo0looo3`ooo?0oooo0looo3`ooo?0oooo0loo"
            A$ = A$ + "o3`ooo?0oooo0looo3`ooo?0oooo0looo3`ooo?0oooo0looo3`ooo?0oooo0looo3`ooo?0oooo0looo3`ooo?0oooo0looo3`o"
            A$ = A$ + "oChN[moo0looo3`ooo?0oooo0looo3`ooo?0oooo0loo4^gJoChN[m?Qk]foo3`ooo?0oooo0looo3`ooo?0oo?Qk]fo4^gJoChN"
            A$ = A$ + "[m?Qk]fo4^gJoo?0oooo0looo3`ooChN[m?Qk]fo4^gJoo?0oo?Qk]fo4^gJoChN[moo0loo4^gJoChN[m?Qk]foo3`ooo?0oooo"
            A$ = A$ + "0loo4^gJoChN[m?Qk]foo3`ooChN[moo0looo3`ooo?0oooo0looo3`ooChN[moo0looo3`ooo?0oooo0looo3`ooo?0oooo0loo"
            A$ = A$ + "o3`ooo?0oooo0looo3`ooo?0oooo0looo3`ooo?0oooo0looo3`ooo?0oooo0looo3`ooo?0oooo0looo3`ooo?0oooo0looo3`o"
            A$ = A$ + "oo?0oooo0looo3`ooo?0oooo0looo3`ooChN[moo0looo3`ooo?0oooo0looo3`ooo?0oooo0loo4^gJoChN[m?Qk]foo3`ooo?0"
            A$ = A$ + "oooo0looo3`ooo?0oo?Qk]fo4^gJoChN[m?Qk]fo4^gJoo?0oooo0looo3`ooChN[m?Qk]fo4^gJoo?0oo?Qk]fo4^gJoChN[moo"
            A$ = A$ + "0loo4^gJoChN[m?Qk]foo3`ooo?0oooo0loo4^gJoChN[m?Qk]foo3`ooChN[moo0looo3`ooo?0oooo0looo3`ooChN[moo0loo"
            A$ = A$ + "o3`ooo?0oooo0looo3`ooo?0oooo0looo3`ooo?0oooo0looo3`ooo?0oooo0looo3`ooo?0oooo0looo3`ooo?0oooo0looo3`o"
            A$ = A$ + "oo?0oooo0looo3`ooo?0oooo0looo3`ooo?0oooo0looo3`ooo?0oooo0looo3`oo?nbgnoo0looo3`ooo?0oooo0looo3`ooo?0"
            A$ = A$ + "oooo0looS_l]o?nbgnoh;Okoo3`ooo?0oooo0looo3`ooo?0oooh;OkoS_l]o?nbgnoh;OkoS_l]oo?0oooo0looo3`oo?nbgnoh"
            A$ = A$ + ";OkoS_l]oo?0oooh;OkoS_l]o?nbgnoo0looS_l]o?nbgnoh;Okoo3`ooo?0oooo0looS_l]o?nbgnoh;Okoo3`oo?nbgnoo0loo"
            A$ = A$ + "o3`ooo?0oooo0looo3`oo?nbgnoo0looo3`ooo?0oooo0looo3`ooo?0oooo0looo3`ooo?0oooo0looo3`ooo?0oooo0looo3`o"
            A$ = A$ + "oo?0oooo0looo3`ooo?0oooo0looo3`ooo?0oooo0looo3`ooo?0oooo0looo3`ooo?0oooo0looo3`ooo?0oooo0looo3`ooo?0"
            A$ = A$ + "oooo0looo3`ooo?0oooo0looo3`oo?7IKmoo0looo3`ooo?0oooo0looo3`oo?7IKmoo0loocAfFo?7IKmoLT]eoo3`ooo?0oooo"
            A$ = A$ + "0loocAfFo?7IKmoLT]eoo3`oo?7IKmoLT]eocAfFoo?0oooLT]eocAfFo?7IKmoo0looo3`ooo?0oooLT]eocAfFo?7IKmoLT]eo"
            A$ = A$ + "cAfFoo?0oooo0looo3`ooo?0oooo0loocAfFo?7IKmoLT]eoo3`ooo?0oooo0looo3`ooo?0oooo0looo3`oo?7IKmoo0looo3`o"
            A$ = A$ + "oo?0oooo0looo3`ooo?0oooo0looo3`ooo?0oooo0looo3`ooo?0oooo0looo3`ooo?0oooo0looo3`ooo?0oooo0looo3`ooo?0"
            A$ = A$ + "oooo0looo3`ooo?0oooo0looo3`ooo?0oooo0looo3`ooo?0oooo0looo3`ooChN[moo0looo3`ooo?0oooo0looo3`ooChN[moo"
            A$ = A$ + "0loo4^gJoChN[m?Qk]foo3`ooo?0oooo0loo4^gJoChN[m?Qk]foo3`ooChN[m?Qk]fo4^gJoo?0oo?Qk]fo4^gJoChN[moo0loo"
            A$ = A$ + "o3`ooo?0oo?Qk]fo4^gJoChN[m?Qk]fo4^gJoo?0oooo0looo3`ooo?0oooo0loo4^gJoChN[m?Qk]foo3`ooo?0oooo0looo3`o"
            A$ = A$ + "oo?0oooo0looo3`ooChN[moo0looo3`ooo?0oooo0looo3`ooo?0oooo0looo3`ooo?0oooo0looo3`ooo?0oooo0looo3`ooo?0"
            A$ = A$ + "oooo0looo3`ooo?0oooo0looo3`ooo?0oooo0looo3`ooo?0oooo0looo3`ooo?0oooo0looo3`ooo?0oooo0looo3`ooChN[moo"
            A$ = A$ + "0looo3`ooo?0oooo0looo3`ooChN[moo0loo4^gJoChN[m?Qk]foo3`ooo?0oooo0loo4^gJoChN[m?Qk]foo3`ooChN[m?Qk]fo"
            A$ = A$ + "4^gJoo?0oo?Qk]fo4^gJoChN[moo0looo3`ooo?0oo?Qk]fo4^gJoChN[m?Qk]fo4^gJoo?0oooo0looo3`ooo?0oooo0loo4^gJ"
            A$ = A$ + "oChN[m?Qk]foo3`ooo?0oooo0looo3`ooo?0oooo0looo3`ooChN[moo0looo3`ooo?0oooo0looo3`ooo?0oooo0looo3`ooo?0"
            A$ = A$ + "oooo0looo3`ooo?0oooo0looo3`ooo?0oooo0looo3`ooo?0oooo0looo3`ooo?0oooo0looo3`ooo?0oooo0looo3`ooo?0oooo"
            A$ = A$ + "0looo3`ooo?0oooo0looo3`oo?nbgnoo0looo3`ooo?0oooo0looo3`oo?nbgnoo0looS_l]o?nbgnoh;Okoo3`ooo?0oooo0loo"
            A$ = A$ + "S_l]o?nbgnoh;Okoo3`oo?nbgnoh;OkoS_l]oo?0oooh;OkoS_l]o?nbgnoo0looo3`ooo?0oooh;OkoS_l]o?nbgnoh;OkoS_l]"
            A$ = A$ + "oo?0oooo0looo3`ooo?0oooo0looS_l]o?nbgnoh;Okoo3`ooo?0oooo0looo3`ooo?0oooo0looo3`oo?nbgnoo0looo3`ooo?0"
            A$ = A$ + "oooo0looo3`ooo?0oooo0looo3`ooo?0oooo0looo3`ooo?0oooo0looo3`ooo?0oooo0looo3`oo?7IKmoo0looo3`ooo?0oooo"
            A$ = A$ + "0looo3`ooo?0oooo0loocAfFo?7IKmoLT]eoo3`ooo?0oooo0looo3`ooo?0oooLT]eocAfFo?7IKmoo0looo3`ooo?0oooo0loo"
            A$ = A$ + "o3`oo?7IKmoLT]eocAfFoo?0oooo0looo3`ooo?0oooo0loocAfFo?7IKmoLT]eoo3`ooo?0oooo0looo3`ooo?0oooo0looo3`o"
            A$ = A$ + "o?7IKmoLT]eocAfFoo?0oooo0looo3`ooo?0oooo0looo3`ooo?0oooLT]eocAfFo?7IKmoo0looo3`ooo?0oooo0looo3`ooo?0"
            A$ = A$ + "oooo0loocAfFo?7IKmoLT]eoo3`ooo?0oooo0looo3`ooo?0oooo0looo3`oo?7IKmoo0looo3`ooo?0oooo0looo3`ooo?0oooo"
            A$ = A$ + "0looo3`ooChN[moo0looo3`ooo?0oooo0looo3`ooo?0oooo0loo4^gJoChN[m?Qk]foo3`ooo?0oooo0looo3`ooo?0oo?Qk]fo"
            A$ = A$ + "4^gJoChN[moo0looo3`ooo?0oooo0looo3`ooChN[m?Qk]fo4^gJoo?0oooo0looo3`ooo?0oooo0loo4^gJoChN[m?Qk]foo3`o"
            A$ = A$ + "oo?0oooo0looo3`ooo?0oooo0looo3`ooChN[m?Qk]fo4^gJoo?0oooo0looo3`ooo?0oooo0looo3`ooo?0oo?Qk]fo4^gJoChN"
            A$ = A$ + "[moo0looo3`ooo?0oooo0looo3`ooo?0oooo0loo4^gJoChN[m?Qk]foo3`ooo?0oooo0looo3`ooo?0oooo0looo3`ooChN[moo"
            A$ = A$ + "0looo3`ooo?0oooo0looo3`ooo?0oooo0looo3`ooChN[moo0looo3`ooo?0oooo0looo3`ooo?0oooo0loo4^gJoChN[m?Qk]fo"
            A$ = A$ + "o3`ooo?0oooo0looo3`ooo?0oo?Qk]fo4^gJoChN[moo0looo3`ooo?0oooo0looo3`ooChN[m?Qk]fo4^gJoo?0oooo0looo3`o"
            A$ = A$ + "oo?0oooo0loo4^gJoChN[m?Qk]foo3`ooo?0oooo0looo3`ooo?0oooo0looo3`ooChN[m?Qk]fo4^gJoo?0oooo0looo3`ooo?0"
            A$ = A$ + "oooo0looo3`ooo?0oo?Qk]fo4^gJoChN[moo0looo3`ooo?0oooo0looo3`ooo?0oooo0loo4^gJoChN[m?Qk]foo3`ooo?0oooo"
            A$ = A$ + "0looo3`ooo?0oooo0looo3`ooChN[moo0looo3`ooo?0oooo0looo3`ooo?0oooo0looo3`oo?nbgnoo0looo3`ooo?0oooo0loo"
            A$ = A$ + "o3`ooo?0oooo0looS_l]o?nbgnoh;Okoo3`ooo?0oooo0looo3`ooo?0oooh;OkoS_l]o?nbgnoo0looo3`ooo?0oooo0looo3`o"
            A$ = A$ + "o?nbgnoh;OkoS_l]oo?0oooo0looo3`ooo?0oooo0looS_l]o?nbgnoh;Okoo3`ooo?0oooo0looo3`ooo?0oooo0looo3`oo?nb"
            A$ = A$ + "gnoh;OkoS_l]oo?0oooo0looo3`ooo?0oooo0looo3`ooo?0oooh;OkoS_l]o?nbgnoo0looo3`ooo?0oooo0looo3`ooo?0oooo"
            A$ = A$ + "0looS_l]o?nbgnoh;Okoo3`ooo?0oooo0looo3`ooo?0oooo0looo3`oo?nbgnoo0looo3`ooo?0oooo0looo3`ooo?0oooo0loo"
            A$ = A$ + "cAfFoo?0oooo0looo3`ooo?0oooo0looo3`ooo?0oooLT]eocAfFo?7IKmoo0looo3`ooo?0oooo0looo3`ooo?0oooo0loocAfF"
            A$ = A$ + "o?7IKmoLT]eoo3`ooo?0oooo0looo3`ooo?0oooo0looo3`oo?7IKmoLT]eocAfFoo?0oooo0looo3`ooo?0oooo0looo3`ooo?0"
            A$ = A$ + "oooLT]eocAfFo?7IKmoo0looo3`ooo?0oooo0looo3`oo?7IKmoLT]eocAfFoo?0oooo0looo3`ooo?0oooo0loocAfFo?7IKmoL"
            A$ = A$ + "T]eoo3`ooo?0oooo0looo3`ooo?0oooLT]eocAfFo?7IKmoo0looo3`ooo?0oooo0looo3`ooo?0oooo0loocAfFoo?0oooo0loo"
            A$ = A$ + "o3`ooo?0oooo0looo3`ooo?0oooo0loo4^gJoo?0oooo0looo3`ooo?0oooo0looo3`ooo?0oo?Qk]fo4^gJoChN[moo0looo3`o"
            A$ = A$ + "oo?0oooo0looo3`ooo?0oooo0loo4^gJoChN[m?Qk]foo3`ooo?0oooo0looo3`ooo?0oooo0looo3`ooChN[m?Qk]fo4^gJoo?0"
            A$ = A$ + "oooo0looo3`ooo?0oooo0looo3`ooo?0oo?Qk]fo4^gJoChN[moo0looo3`ooo?0oooo0looo3`ooChN[m?Qk]fo4^gJoo?0oooo"
            A$ = A$ + "0looo3`ooo?0oooo0loo4^gJoChN[m?Qk]foo3`ooo?0oooo0looo3`ooo?0oo?Qk]fo4^gJoChN[moo0looo3`ooo?0oooo0loo"
            A$ = A$ + "o3`ooo?0oooo0loo4^gJoo?0oooo0looo3`ooo?0oooo0looo3`ooo?0oooo0loo4^gJoo?0oooo0looo3`ooo?0oooo0looo3`o"
            A$ = A$ + "oo?0oo?Qk]fo4^gJoChN[moo0looo3`ooo?0oooo0looo3`ooo?0oooo0loo4^gJoChN[m?Qk]foo3`ooo?0oooo0looo3`ooo?0"
            A$ = A$ + "oooo0looo3`ooChN[m?Qk]fo4^gJoo?0oooo0looo3`ooo?0oooo0looo3`ooo?0oo?Qk]fo4^gJoChN[moo0looo3`ooo?0oooo"
            A$ = A$ + "0looo3`ooChN[m?Qk]fo4^gJoo?0oooo0looo3`ooo?0oooo0loo4^gJoChN[m?Qk]foo3`ooo?0oooo0looo3`ooo?0oo?Qk]fo"
            A$ = A$ + "4^gJoChN[moo0looo3`ooo?0oooo0looo3`ooo?0oooo0loo4^gJoo?0oooo0looo3`ooo?0oooo0looo3`ooo?0oooo0looS_l]"
            A$ = A$ + "oo?0oooo0looo3`ooo?0oooo0looo3`ooo?0oooh;OkoS_l]o?nbgnoo0looo3`ooo?0oooo0looo3`ooo?0oooo0looS_l]o?nb"
            A$ = A$ + "gnoh;Okoo3`ooo?0oooo0looo3`ooo?0oooo0looo3`oo?nbgnoh;OkoS_l]oo?0oooo0looo3`ooo?0oooo0looo3`ooo?0oooh"
            A$ = A$ + ";OkoS_l]o?nbgnoo0looo3`ooo?0oooo0looo3`oo?nbgnoh;OkoS_l]oo?0oooo0looo3`ooo?0oooo0looS_l]o?nbgnoh;Oko"
            A$ = A$ + "o3`ooo?0oooo0looo3`ooo?0oooh;OkoS_l]o?nbgnoo0looo3`ooo?0oooo0looo3`ooo?0oooo0looS_l]oo?0oooo0looo3`o"
            A$ = A$ + "oo?0oooo0loo%%%0"
        Case "scrolltrack.png"
            A$ = MKI$(17) + MKI$(68)
            A$ = A$ + "oW>foookTooo`Gnoo3OiooOlWooobWnooC?koo_m_ooog;oooS?mooOnfoooiKooo[omooonioookWooo_OnooOjHoooYSmooo>i"
            A$ = A$ + "oo?lUooo`Gnoo7oioo_lYooodcnooKokooombooohCoooW_mooOnfooojOooo_OnooonioookWoooW>fooOjHooo_Cnoo3Oioo?l"
            A$ = A$ + "UoooaOnoo;Ojoo?m\ooofonooO_loo?ndoooiKoooW_moo_ngoookWooo_OnooonioooYSmooW>foookTooo`Gnoo3OiooOlWooo"
            A$ = A$ + "bWnooC?koo_m_ooog;oooS?mooOnfoooiKooo[omooonioookWooo_OnooOjHoooYSmooo>ioo?lUooo`Gnoo7oioo_lYooodcno"
            A$ = A$ + "oKokooombooohCoooW_mooOnfooojOooo_OnooonioookWoooW>fooOjHooo_Cnoo3Oioo?lUoooaOnoo;Ojoo?m\ooofonooO_l"
            A$ = A$ + "oo?ndoooiKoooW_moo_ngoookWooo_OnooonioooYSmooW>foookTooo`Gnoo3OiooOlWooobWnooC?koo_m_ooog;oooS?mooOn"
            A$ = A$ + "foooiKooo[omooonioookWooo_OnooOjHoooYSmooo>ioo?lUooo`Gnoo7oioo_lYooodcnooKokooombooohCoooW_mooOnfooo"
            A$ = A$ + "jOooo_OnooonioookWoooW>fooOjHooo_Cnoo3Oioo?lUoooaOnoo;Ojoo?m\ooofonooO_loo?ndoooiKoooW_moo_ngoookWoo"
            A$ = A$ + "o_OnooonioooYSmooW>foookTooo`Gnoo3OiooOlWooobWnooC?koo_m_ooog;oooS?mooOnfoooiKooo[omooonioookWooo_On"
            A$ = A$ + "ooOjHoooYSmooo>ioo?lUooo`Gnoo7oioo_lYooodcnooKokooombooohCoooW_mooOnfooojOooo_OnooonioookWoooW>fooOj"
            A$ = A$ + "Hooo_Cnoo3Oioo?lUoooaOnoo;Ojoo?m\ooofonooO_loo?ndoooiKoooW_moo_ngoookWooo_OnooonioooYSmooW>foookTooo"
            A$ = A$ + "`Gnoo3OiooOlWooobWnooC?koo_m_ooog;oooS?mooOnfoooiKooo[omooonioookWooo_OnooOjHoooYSmooo>ioo?lUooo`Gno"
            A$ = A$ + "o7oioo_lYooodcnooKokooombooohCoooW_mooOnfooojOooo_OnooonioookWoooW>fooOjHooo_Cnoo3Oioo?lUoooaOnoo;Oj"
            A$ = A$ + "oo?m\ooofonooO_loo?ndoooiKoooW_moo_ngoookWooo_OnooonioooYSmooW>foookTooo`Gnoo3OiooOlWooobWnooC?koo_m"
            A$ = A$ + "_ooog;oooS?mooOnfoooiKooo[omooonioookWooo_OnooOjHoooYSmooo>ioo?lUooo`Gnoo7oioo_lYooodcnooKokooombooo"
            A$ = A$ + "hCoooW_mooOnfooojOooo_OnooonioookWoooW>fooOjHooo_Cnoo3Oioo?lUoooaOnoo;Ojoo?m\ooofonooO_loo?ndoooiKoo"
            A$ = A$ + "oW_moo_ngoookWooo_OnooonioooYSmooW>foookTooo`Gnoo3OiooOlWooobWnooC?koo_m_ooog;oooS?mooOnfoooiKooo[om"
            A$ = A$ + "ooonioookWooo_OnooOjHoooYSmooo>ioo?lUooo`Gnoo7oioo_lYooodcnooKokooombooohCoooW_mooOnfooojOooo_Onooon"
            A$ = A$ + "ioookWoooW>fooOjHooo_Cnoo3Oioo?lUoooaOnoo;Ojoo?m\ooofonooO_loo?ndoooiKoooW_moo_ngoookWooo_Onoooniooo"
            A$ = A$ + "YSmooW>foookTooo`Gnoo3OiooOlWooobWnooC?koo_m_ooog;oooS?mooOnfoooiKooo[omooonioookWooo_OnooOjHoooYSmo"
            A$ = A$ + "oo>ioo?lUooo`Gnoo7oioo_lYooodcnooKokooombooohCoooW_mooOnfooojOooo_OnooonioookWoooW>fooOjHooo_Cnoo3Oi"
            A$ = A$ + "oo?lUoooaOnoo;Ojoo?m\ooofonooO_loo?ndoooiKoooW_moo_ngoookWooo_OnooonioooYSmooW>foookTooo`Gnoo3OiooOl"
            A$ = A$ + "WooobWnooC?koo_m_ooog;oooS?mooOnfoooiKooo[omooonioookWooo_OnooOjHoooYSmooo>ioo?lUooo`Gnoo7oioo_lYooo"
            A$ = A$ + "dcnooKokooombooohCoooW_mooOnfooojOooo_OnooonioookWoooW>fooOjHooo_Cnoo3Oioo?lUoooaOnoo;Ojoo?m\ooofono"
            A$ = A$ + "oO_loo?ndoooiKoooW_moo_ngoookWooo_OnooonioooYSmooW>foookTooo`Gnoo3OiooOlWooobWnooC?koo_m_ooog;oooS?m"
            A$ = A$ + "ooOnfoooiKooo[omooonioookWooo_OnooOjHoooYSmooo>ioo?lUooo`Gnoo7oioo_lYooodcnooKokooombooohCoooW_mooOn"
            A$ = A$ + "fooojOooo_OnooonioookWoooW>fooOjHooo_Cnoo3Oioo?lUoooaOnoo;Ojoo?m\ooofonooO_loo?ndoooiKoooW_moo_ngooo"
            A$ = A$ + "kWooo_OnooonioooYSmooW>foookTooo`Gnoo3OiooOlWooobWnooC?koo_m_ooog;oooS?mooOnfoooiKooo[omooonioookWoo"
            A$ = A$ + "o_OnooOjHoooYSmooo>ioo?lUooo`Gnoo7oioo_lYooodcnooKokooombooohCoooW_mooOnfooojOooo_OnooonioookWoooW>f"
            A$ = A$ + "ooOjHooo_Cnoo3Oioo?lUoooaOnoo;Ojoo?m\ooofonooO_loo?ndoooiKoooW_moo_ngoookWooo_OnooonioooYSmooW>foook"
            A$ = A$ + "Tooo`Gnoo3OiooOlWooobWnooC?koo_m_ooog;oooS?mooOnfoooiKooo[omooonioookWooo_OnooOjHo?h8Ckob[]aoC?g8o?m"
            A$ = A$ + "LSloh3>coWOh=oooW?mooW>foookRoooaOnoo?_jooolZoooeknooO_looombooog;ooPS<]o3>bdn_lJKlodc=boC?g8o?nPclo"
            A$ = A$ + "i7NcoooiCoooYSmooo^hooOlWoooc[noo?_jooOm^ooog;oooO_looombo?h8CkoPS<]o;_f6o?mLSlodc=boS?h<oOnQglooOnd"
            A$ = A$ + "ooOjHooo_;noo7oiooolZoooc[nooG_kooombooog;oooO_lo3>bdn?h8Ckob[]aoC?g8o?mLSloh3>coWOh=oooW?mooW>foook"
            A$ = A$ + "RoooaOnoo?_jooolZoooeknooO_looombooog;ooPS<]o3>bdn_lJKlodc=boC?g8o?nPcloi7NcoooiCoooYSmooo^hooOlWooo"
            A$ = A$ + "c[noo?_jooOm^ooog;oooO_looombo?h8CkoPS<]o;_f6o?mLSlodc=boS?h<oOnQglooOndooOjHooo_;noo7oiooolZoooc[no"
            A$ = A$ + "oG_kooombooog;oooO_lo3>bdn?h8Ckob[]aoC?g8o?mLSloh3>coWOh=oooW?mooW>foookRoooaOnoo?_jooolZoooeknooO_l"
            A$ = A$ + "ooombooog;ooPS<]o3>bdn_lJKlodc=boC?g8o?nPcloi7NcoooiCoooYSmooo^hooOlWoooc[noo?_jooOm^ooog;oooO_looom"
            A$ = A$ + "bo?h8CkoPS<]o;_f6o?mLSlodc=boS?h<oOnQglooOndooOjHooo_;noo7oiooolZoooc[nooG_kooombooog;oooO_lo3>bdn?h"
            A$ = A$ + "8Ckob[]aoC?g8o?mLSloh3>coWOh=oooW?mooW>foookRoooaOnoo?_jooolZoooeknooO_looombooog;ooPS<]o3>bdn_lJKlo"
            A$ = A$ + "dc=boC?g8o?nPcloi7NcoooiCoooYSmooo^hooOlWoooc[noo?_jooOm^ooog;oooO_looombo?h8CkoPS<]o;_f6o?mLSlodc=b"
            A$ = A$ + "oS?h<oOnQglooOndooOjHooo_;noo7oiooolZoooc[nooG_kooombooog;oooO_lo3>bdn?h8Ckob[]aoC?g8o?mLSloh3>coWOh"
            A$ = A$ + "=oooW?mooW>foookRoooaOnoo?_jooolZoooeknooO_looombooog;ooPS<]o3>bdn_lJKlodc=boC?g8o?nPcloi7NcoooiCooo"
            A$ = A$ + "YSmooo^hooOlWoooc[noo?_jooOm^ooog;oooO_looombo?h8CkoPS<]o;_f6o?mLSlodc=boS?h<oOnQglooOndooOjHooo_;no"
            A$ = A$ + "o7oiooolZoooc[nooG_kooombooog;oooO_lo3>bdn?h8Ckob[]aoC?g8o?mLSloh3>coWOh=oooW?mooW>foookRoooaOnoo?_j"
            A$ = A$ + "ooolZoooeknooO_looombooog;ooPS<]o3>bdn_lJKlodc=boC?g8o?nPcloi7NcoooiCoooYSmooo^hooOlWoooc[noo?_jooOm"
            A$ = A$ + "^ooog;oooO_looombo?h8CkookNhooonioookWooo_OnooonioookWooo_OnooonioookWooo_OnooonioookWooo_Onoooniooo"
            A$ = A$ + "kWooo_Onoo_kQooo^7noo_OnooonioookWooo_OnooonioookWooo_OnooonioookWooo_OnooonioookWooo_OnooonioookWoo"
            A$ = A$ + "okNhoo_kQoookWooo_OnooonioookWooo_OnooonioookWooo_OnooonioookWooo_OnooonioookWooo_Onoooniooo^7nookNh"
            A$ = A$ + "ooonioookWooo_OnooonioookWooo_OnooonioookWooo_OnooonioookWooo_OnooonioookWooo_Onoo_kQooo^7noo_Onooon"
            A$ = A$ + "ioookWooo_OnooonioookWooo_OnooonioookWooo_OnooonioookWooo_OnooonioookWoookNhoo_kQoookWooo_Onoooniooo"
            A$ = A$ + "kWooo_OnooonioookWooo_OnooonioookWooo_OnooonioookWooo_Onoooniooo^7nookNhooonioookWooo_OnooonioookWoo"
            A$ = A$ + "o_OnooonioookWooo_OnooonioookWooo_OnooonioookWooo_Onoo_kQooo^7noo_OnooonioookWooo_OnooonioookWooo_On"
            A$ = A$ + "ooonioookWooo_OnooonioookWooo_OnooonioookWoookNhoo_kQoookWooo_OnooonioookWooo_OnooonioookWooo_Onooon"
            A$ = A$ + "ioookWooo_OnooonioookWooo_Onoooniooo^7nookNhooonioookWooo_OnooonioookWooo_OnooonioookWooo_Onoooniooo"
            A$ = A$ + "kWooo_OnooonioookWooo_Onoo_kQooo^7noo_OnooonioookWooo_OnooonioookWooo_OnooonioookWooo_OnooonioookWoo"
            A$ = A$ + "o_OnooonioookWoookNhoo_kQoookWooo_OnooonioookWooo_OnooonioookWooo_OnooonioookWooo_OnooonioookWooo_On"
            A$ = A$ + "oooniooo^7nookNhooonioookWooo_OnooonioookWooo_OnooonioookWooo_OnooonioookWooo_OnooonioookWooo_Onoo_k"
            A$ = A$ + "Qooo^7noo_OnooonioookWooo_OnooonioookWooo_OnooonioookWooo_OnooonioookWooo_OnooonioookWoookNhoo_kQooo"
            A$ = A$ + "kWooo_OnooonioookWooo_OnooonioookWooo_OnooonioookWooo_OnooonioookWooo_Onoooniooo^7nookNhooonioookWoo"
            A$ = A$ + "o_OnooonioookWooo_OnooonioookWooo_OnooonioookWooo_OnooonioookWooo_Onoo_kQooo^7noo_OnooonioookWooo_On"
            A$ = A$ + "ooonioookWooo_OnooonioookWooo_OnooonioookWooo_OnooonioookWoookNh%%o3"
        Case "scrollthumb.png"
            A$ = MKI$(15) + MKI$(88)
            A$ = A$ + "okNhooOoloO[E6hoC_kYo?m^WnodkNjoC_kYo3=^TnodkNjoC_kYo?m^WnodkNjoC_kYogJU1noo^7nookNho7KV5n_lJKlooooo"
            A$ = A$ + "ooooooooooooooooooooooooooooooooooooooooooooooooo;_f6oO\IFhookNho7KV5noooooooO_loookRooo_;noocNgoooi"
            A$ = A$ + "CoomO_loaWMao_ndonOjAgkoZ;]_ooooooO\IFhookNho7KV5noooooooO_loookRooo_;noo_>gok_iBoomO_loaWMao_ndonOj"
            A$ = A$ + "AgkoZ;]_ooooooO\IFhookNho7KV5noooooooO_loookRooo_;noo_>gok_iBoomO_loaWMaoc>e0oOjAgkoZ;]_ooooooO\IFho"
            A$ = A$ + "okNho7KV5noooooooO_loookRooo_;noocNgoooiCo?nPcloaWMao_ndonOjAgkoZ;]_ooooooO\IFhookNho7KV5noooooooO_l"
            A$ = A$ + "oookRooo_;noo_>gok_iBo?nPcloaWMao_ndonOjAgkoZ;]_ooooooO\IFhookNho7KV5noooooooO_loookRooo_;noo_>gok_i"
            A$ = A$ + "Bo?nPcloaWMaoc>e0oOjAgkoZ;]_ooooooO\IFhookNho7KV5noooooooO_loookRooo_;noo_>gok_iBo?nPcloaWMao_ndonOj"
            A$ = A$ + "AgkoZ;]_ooooooO\IFhookNho7KV5noooooooO_loookRooo_;noo_>goooiCoomO_loaWMaoc>e0oOjAgkoZ;]_ooooooO\IFho"
            A$ = A$ + "okNho7KV5noooooooO_loookRooo_;noocNgoooiCoomO_loaWMao_ndonOjAgkoZ;]_ooooooO\IFhookNho7KV5noooooooO_l"
            A$ = A$ + "oookRooo_;noo_>gok_iBoomO_loaWMao_ndonOjAgkoZ;]_ooooooO\IFhookNho7KV5noooooooO_loookRooo_;noo_>gok_i"
            A$ = A$ + "BoomO_loaWMaoc>e0oOjAgkoZ;]_ooooooO\IFhookNho7KV5noooooooO_loookRooo_;noocNgoooiCo?nPcloaWMao_ndonOj"
            A$ = A$ + "AgkoZ;]_ooooooO\IFhookNho7KV5noooooooO_loookRooo_;noo_>gok_iBo?nPcloaWMao_ndonOjAgkoZ;]_ooooooO\IFho"
            A$ = A$ + "okNho7KV5noooooooO_loookRooo_;noo_>gok_iBo?nPcloaWMaoc>e0oOjAgkoZ;]_ooooooO\IFhookNho7KV5noooooooO_l"
            A$ = A$ + "oookRooo_;noo_>gok_iBo?nPcloaWMao_ndonOjAgkoZ;]_ooooooO\IFhookNho7KV5noooooooO_loookRooo_;noo_>goooi"
            A$ = A$ + "CoomO_loaWMaoc>e0oOjAgkoZ;]_ooooooO\IFhookNho7KV5noooooooO_loookRooo_;noo_>gok_iBoomO_loaWMao_ndonOj"
            A$ = A$ + "AgkoZ;]_ooooooO\IFhookNho7KV5noooooooO_loookRooo_;noo_>goooiCo?nPcloaWMao_ndonOjAgkoZ;]_ooooooO\IFho"
            A$ = A$ + "okNho7KV5nOnQglo]GM`ogNe1oOkE7lo]GM`ogNe1oOkE7lo]GM`ogNe1oOkE7lo]GM`oWOh=oO\IFhookNhoo?lUo?Z@bgoj:ZS"
            A$ = A$ + "o[[X>n_^Rjhoj:ZSo[[X>n_^Rjhoj:ZSo[[X>n_^Rjhok>jSo_jTomoo^7nooo>ioomacn_OV9eonIVDokWIBm_OV9eonIVDokWI"
            A$ = A$ + "Bm_OV9eonIVDokWIBm_OV9eonIVDokWIBmog7?kooo>iokWIBm_lJKlooooooooooooooooooooooooooooooooooooooooooooo"
            A$ = A$ + "ooooooooo;_f6o_OV9eooo>iokWIBmoooooook_ooo_m_ooobWnooo^hoo?jGoOnQglo`S=ao[^dnnoi?_koY7M_oooooo_OV9eo"
            A$ = A$ + "oo>iokWIBmoooooook_ooo_m_ooobWnooo^hoooiEo?nPclo`S=ao[^dnnoi?_koY7M_oooooo_OV9eooo>iokWIBmoooooook_o"
            A$ = A$ + "oo_m_ooobWnooo^hoo?jGo?nPclo`S=ao[^dnnoi?_koY7M_oooooo_OV9eooo>iokWIBmoooooook_ooo_m_ooobWnooo^hoo?j"
            A$ = A$ + "GoOnQgloaWMao[^dnnoi?_koY7M_oooooo_OV9eooo>iokWIBmoooooook_ooo_m_ooobWnooo^hoooiEoOnQglo`S=ao[^dnnoi"
            A$ = A$ + "?_koY7M_oooooo_OV9eooo>iokWIBmoooooook_oooOm^ooobWnooo^hoooiEoOnQglo`S=aoWNdmnoi?_koY7M_oooooo_OV9eo"
            A$ = A$ + "oo>iokWIBmoooooook_oooOm^ooobWnooo>ioo?jGoOnQglo`S=aoWNdmnoi?_koY7M_oooooo_OV9eooo>iokWIBmoooooook_o"
            A$ = A$ + "ooOm^ooobWnooo^hoooiEo?nPclo`S=ao[^dnnoi?_koY7M_oooooo_OV9eooo>iokWIBmoooooook_oooOm^ooobWnooo^hoo?j"
            A$ = A$ + "Go?nPclo`S=aoWNdmnoi?_koY7M_oooooo_OV9eooo>iokWIBmoooooook_oooOm^ooobWnooo>ioo?jGo?nPclo`S=ao[^dnnoi"
            A$ = A$ + "?_koY7M_oooooo_OV9eooo>iokWIBmoooooook_ooo_m_ooobWnooo^hoo?jGo?nPclo`S=ao[^dnnoi?_koY7M_oooooo_OV9eo"
            A$ = A$ + "oo>iokWIBmoooooook_ooo_m_ooobWnooo^hoo?jGoOnQgloaWMao[^dnnoi?_koY7M_oooooo_OV9eooo>iokWIBmoooooook_o"
            A$ = A$ + "oo_m_ooobWnooo^hoooiEoOnQglo`S=ao[^dnnoi?_koY7M_oooooo_OV9eooo>iokWIBmoooooook_ooo_m_ooobWnooo^hoooi"
            A$ = A$ + "EoOnQglo`S=aoWNdmnoi?_koY7M_oooooo_OV9eooo>iokWIBmoooooook_ooo_m_ooobWnooo>ioo?jGoOnQglo`S=aoWNdmnoi"
            A$ = A$ + "?_koY7M_oooooo_OV9eooo>iokWIBmoooooook_oooOm^ooobWnooo^hoooiEo?nPclo`S=ao[^dnnoi?_koY7M_oooooo_OV9eo"
            A$ = A$ + "oo>iokWIBmoooooook_ooo_m_ooobWnooo^hoo?jGo?nPclo`S=aoWNdmnoi?_koY7M_oooooo_OV9eooo>iokWIBmoooooook_o"
            A$ = A$ + "oo_m_ooobWnooo>ioo?jGo?nPclo`S=ao[^dnnoi?_koY7M_oooooo_OV9eooo>iokWIBmomO_lo`S=ao3?f4o?lHClo`S=ao3?f"
            A$ = A$ + "4o?lHClo`S=ao3?f4o?lHClo`S=aoOog;o_OV9eooo>ioomacn_OV9eonIVDokWIBm_OV9eonIVDokWIBm_OV9eonIVDokWIBm_O"
            A$ = A$ + "V9eonIVDokWIBmog7?kookNhooOolo_H:IcoRYT=o;VBfl_H:IcoRYT=o;VBfl_H:IcoRYT=o;VBfl_H:IcoRYT=o;VBfloo^7no"
            A$ = A$ + "okNho;VBfl?mLSlooooooooooooooooooooooooooooooooooooooooooooooooooooooC?g8o_H:IcookNho;VBflooooooS_l]"
            A$ = A$ + "oS>dlnOjAgko`S=aoc?i@ooo]omoo;Ojooomaoool_oooooooooooo_H:IcookNho;VBflooooooS_l]oS>dlnOjAgko`S=ao_oh"
            A$ = A$ + "?ooo]omoo;Ojooombooomcoooooooooooo_H:IcookNho;VBflooooooS_l]oS>dlnOjAgko`S=aoc?i@ooo]omoo;Ojooomaooo"
            A$ = A$ + "mcoooooooooooo_H:IcookNho;VBflooooooS_l]oS>dln?j@ckoaWMaoc?i@ooo]omoo;Ojooombooomcoooooooooooo_H:Ico"
            A$ = A$ + "okNho;VBflooooooS_l]oS>dlnOjAgkoaWMaoc?i@ooo]omoo;Ojooomaooomcoooooooooooo_H:IcookNho;VBflooooooS_l]"
            A$ = A$ + "oS>dln?j@cko`S=aoc?i@ooo]omoo;Ojooomaooomcoooooooooooo_H:IcookNho;VBflooooooS_l]oS>dln?j@cko`S=aoc?i"
            A$ = A$ + "@ooo^7noo;Ojooomaooomcoooooooooooo_H:IcookNho;VBflooooooS_l]oS>dlnOjAgko`S=ao_oh?ooo]omoo;Ojooomaooo"
            A$ = A$ + "mcoooooooooooo_H:IcookNho;VBflooooooS_l]oS>dln?j@cko`S=aoc?i@ooo]omoo;Ojooomaooomcoooooooooooo_H:Ico"
            A$ = A$ + "okNho;VBflooooooS_l]oS>dlnOjAgko`S=aoc?i@ooo^7noo;Ojooomaooomcoooooooooooo_H:IcookNho;VBflooooooS_l]"
            A$ = A$ + "oS>dlnOjAgko`S=aoc?i@ooo]omoo;Ojooombooomcoooooooooooo_H:IcookNho;VBflooooooS_l]oS>dln?j@ckoaWMaoc?i"
            A$ = A$ + "@ooo]omoo;Ojooomaooomcoooooooooooo_H:IcookNho;VBflooooooS_l]oS>dlnOjAgkoaWMaoc?i@ooo]omoo;Ojooomaooo"
            A$ = A$ + "mcoooooooooooo_H:IcookNho;VBflooooooS_l]oS>dln?j@cko`S=aoc?i@ooo]omoo;Ojooomaooomcoooooooooooo_H:Ico"
            A$ = A$ + "okNho;VBflooooooS_l]oS>dln?j@cko`S=aoc?i@ooo^7noo;Ojooomaooomcoooooooooooo_H:IcookNho;VBflooooooS_l]"
            A$ = A$ + "oS>dlnOjAgko`S=ao_oh?ooo]omoo;Ojooomaooomcoooooooooooo_H:IcookNho;VBflooooooS_l]oS>dln?j@cko`S=aoc?i"
            A$ = A$ + "@ooo]omoo;Ojooomaooomcoooooooooooo_H:IcookNho;VBfl?cd2joS_l]oS>dlnOjAgko`S=aoc?i@ooo^7noo;Ojooomaooo"
            A$ = A$ + "mcoooooooc<]Pn_H:IcookNho;VBfl_H:Ico<C;Xoc<]Pn?cd2jo<C;Xoc<]Pn?cd2jo<C;Xoc<]Pn?cd2jo<C;Xo;VBfl_H:Ico"
            A$ = A$ + "okNhoo_jJo_H:IcoRYT=o;VBfl_H:IcoRYT=o;VBfl_H:IcoRYT=o;VBfl_H:IcoRYT=o;VBflooZ[moogngoooniooooooooooo"
            A$ = A$ + "oooooooooooooooooooooooooooooooooooooooooooooooooooooooo\gmoogngoooooooog7ooo7oioo_kQooo\gmoo[^fooOj"
            A$ = A$ + "HoooWGmooONeok_iBo?oT3moo?_jooooooooXOmoogngooooooooaOnooOOlooOm^oooc[noo;OjooOlWoooaOnoo7oioo_kQooo"
            A$ = A$ + "[cmonK^doooooo_lJKloogngoooooo_oV;mooo>ioo?lUooo`Gnooo>ioookTooo^7noo_>gooOjHoooYSmonK^doooooo_h:Kko"
            A$ = A$ + "ogngooooooooWGmoo3OiooOlWooo`Gnooo>ioo_kQooo]omoo_>goo_jJoooZ[mooOndoooooo_h:KkoogngooooooooW?moo3Oi"
            A$ = A$ + "oo?lUooo`Gnooo>ioo_kQooo^7noo_>goo_jJoooYSmonK^doooooo_h:Kkoogngoooooo_oV;mooo>ioo?lUooo`Gnooo>ioook"
            A$ = A$ + "Tooo^7noo_>gooOjHoooYSmonK^doooooo_h:KkoogngooooooooWGmoo3OiooOlWooo`Gnooo>ioo_kQooo]omoo_>goo_jJooo"
            A$ = A$ + "Z[mooOndoooooo_h:KkoogngooooooooW?moo3Oioo?lUooo`Gnooo>ioo_kQooo^7noo_>goo_jJoooYSmonK^doooooo_h:Kko"
            A$ = A$ + "ogngoooooo_oV;mooo>ioo?lUooo`Gnooo>ioookTooo^7noo_>gooOjHoooYSmonK^doooooo_h:KkoogngooooooooWGmoo3Oi"
            A$ = A$ + "ooOlWooo`Gnooo>ioo_kQooo]omoo_>goo_jJoooZ[mooOndoooooo_h:KkoogngooooooooW?moo3Oioo?lUooo`Gnooo>ioo_k"
            A$ = A$ + "Qooo^7noo_>goo_jJoooYSmonK^doooooo_h:Kkoogngoooooo_oV;mooo>ioo?lUooo`Gnooo>ioookTooo^7noo_>gooOjHooo"
            A$ = A$ + "YSmonK^doooooo_h:KkoogngooooooooWGmoo3OiooOlWooo`Gnooo>ioo_kQooo]omoo_>goo_jJoooZ[mooOndoooooo_h:Kko"
            A$ = A$ + "ogngooooooooWGmoo3Oioo?lUooo`Gnooo>ioo_kQooo^7noo_>goo_jJoooYSmonK^doooooo_h:KkoogngooooooooWGmooo>i"
            A$ = A$ + "oo?lUooo`Gnooo>ioookTooo^7noo_>gooOjHoooYSmonK^doooooo_h:KkoogngooooooooYSmoo3OiooOlWooo`Gnooo>ioo_k"
            A$ = A$ + "Qooo]omoo_>goo_jJoooZ[mooOndoooooo_h:KkoogngooooooooZ[moo3Oioo?lUooo`Gnooo>ioo_kQooo^7noo_>goo_jJooo"
            A$ = A$ + "YSmonK^doooooo_h:KkoogngooooooooZ[mooo>ioo?lUooo`Gnooo>ioookTooo^7noo_>gooOjHoooYSmonK^doooooo_h:Kko"
            A$ = A$ + "ogngoooooooobWnomGNdok_iBo_oV;monK^dok_iBo_oV;monK^dogOiAoonSoloo7oiooooooojCokoogngoOncknoooooooooo"
            A$ = A$ + "ooooooooooooooooooooooooooooooooooooooooooooooooo3?f4ooo\gmoogngooolZooh;OkoK?l[o[]`^nOf1gjoI7L[oWM`"
            A$ = A$ + "]n_f2kjoJ;\[o_m`_nOg57koVk\^ooOm^ooo\gmo%%%0"
        Case "scrollbuttons.png"
            A$ = MKI$(17) + MKI$(136)
            A$ = A$ + "okNhoC?g8o?[D2hoAWKYo3=^Tn?dhBjo@S;Yo3=^Tn?dhBjo@S;Yo3=^Tn?dhBjo@S;Yo3=^Tnocg>joY6IOoC?g8ooo^7noaVIQ"
            A$ = A$ + "o;_f6ooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo_lJKloaVIQoo_kQoO\IFhooooooooo"
            A$ = A$ + "ooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooO\IFhookNho7KV5noooooooconoo?okooo"
            A$ = A$ + "l_oooconoo?okoool_oooconoo?okoool_oooconoo?okoool_ooooooo7KV5noo^7noaVIQooooooooeknooG_kooOm^oooekno"
            A$ = A$ + "oG_kooOm^oooeknooG_kooOm^oooeknooG_kooOm^oooooooaVIQoo_kQoO\IFhooooooookRooo_;nooo^hoookRooo_;nocAfF"
            A$ = A$ + "oookRooo_;nooo^hoookRooo_;nooo^hooooooO\IFhookNho7KV5noooooooOndoooiCoooW?mooOndo?7IKmoLT]eocAfFoooi"
            A$ = A$ + "CoooW?mooOndoooiCoooW?moooooo7KV5noo^7noaVIQoooooo_mN[lofk]boK_g:ooLT]eocAfFo?7IKmoLT]eocAfFoK_g:o_m"
            A$ = A$ + "N[lofk]boK_g:oooooooaVIQoo_kQoO\IFhooooook^e2o_kF;locAfFo?7IKmoLT]eo^K]`o?7IKmoLT]eocAfFok^e2o_kF;lo"
            A$ = A$ + "^K]`ooooooO\IFhookNho7KV5nooooooY7M_o?7IKmoLT]eocAfFoWNdmnOjAgkoY7M_o?7IKmoLT]eocAfFoWNdmnOjAgkooooo"
            A$ = A$ + "o7KV5noo^7noaVIQoooooo?j@ckoX3=_o?7IKm?j@ckoX3=_oS>dln?j@ckoX3=_o?7IKm?j@ckoX3=_oS>dlnooooooaVIQoo_k"
            A$ = A$ + "QoO\IFhooooooS>dln?j@ckoX3=_oS>dln?j@ckoX3=_oS>dln?j@ckoX3=_oS>dln?j@ckoX3=_ooooooO\IFhookNho7KV5noo"
            A$ = A$ + "ooooX3=_oS>dln?j@ckoX3=_oS>dln?j@ckoX3=_oS>dln?j@ckoX3=_oS>dln?j@ckoooooo7KV5noo^7noaVIQoooooo?j@cko"
            A$ = A$ + "X3=_oS>dln?j@ckoX3=_oS>dln?j@ckoX3=_oS>dln?j@ckoX3=_oS>dlnooooooaVIQoo_kQoO\IFhooooooS>dln?j@ckoX3=_"
            A$ = A$ + "oS>dln?j@ckoX3=_oS>dln?j@ckoX3=_oS>dln?j@ckoX3=_ooooooO\IFhookNho7KV5nOnQglofk]boK_g:o_mN[lofk]boK_g"
            A$ = A$ + ":o_mN[lofk]boK_g:o_mN[lofk]boK_g:o_mN[loi7Nco7KV5noo^7nooo^hoS:Tlm_^Rjhoj:ZSo[[X>n_^Rjhoj:ZSo[[X>n_^"
            A$ = A$ + "Rjhoj:ZSo[[X>n_^Rjhoj:ZSo[[X>noY?^gooSneoo_kQo?mLSlonIVDokWIBm_OV9eonIVDokWIBm_OV9eonIVDokWIBm_OV9eo"
            A$ = A$ + "nIVDokWIBm_OV9eonIVDokWIBm?mLSlookNhokWIBm_lJKlooooooooooooooooooooooooooooooooooooooooooooooooooooo"
            A$ = A$ + "oooooooooooob[]aokWIBmoo^7nonIVDoooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo"
            A$ = A$ + "oooooooonIVDoo_kQo_OV9eooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo_O"
            A$ = A$ + "V9eookNhokWIBmoooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooookWIBmoo^7no"
            A$ = A$ + "nIVDoooooooooooooooooooooooooooooooooChN[moooooooooooooooooooooooooooooooooooooonIVDoo_kQo_OV9eooooo"
            A$ = A$ + "ooonioookWooo_Onooonio?Qk]fo4^gJoChN[mookWooo_OnooonioookWooo_Onoooooo_OV9eookNhokWIBmooooooo7oiooOl"
            A$ = A$ + "WoooaOno4^gJoChN[m?Qk]fo4^gJoChN[mooaOnoo7oiooOlWoooaOnooooookWIBmoo^7nonIVDooooooooW?mooOndoChN[m?Q"
            A$ = A$ + "k]fo4^gJoooiCo?Qk]fo4^gJoChN[mooW?mooOndoooiCooooooonIVDoo_kQo_OV9eooooooGOg9o?Qk]fo4^gJoChN[mOmMWlo"
            A$ = A$ + "egMboGOg9o?Qk]fo4^gJoChN[mOmMWloegMboooooo_OV9eookNhokWIBmoooooo_Om`oone3o?Qk]fo_Om`oone3ookG?lo_Om`"
            A$ = A$ + "oone3o?Qk]fo_Om`oone3ookG?looooookWIBmoo^7nonIVDooooooOkE7lo]GM`ogNe1oOkE7lo]GM`ogNe1oOkE7lo]GM`ogNe"
            A$ = A$ + "1oOkE7lo]GM`ogNe1ooooooonIVDoo_kQo_OV9eoooooogNe1oOkE7lo]GM`ogNe1oOkE7lo]GM`ogNe1oOkE7lo]GM`ogNe1oOk"
            A$ = A$ + "E7lo]GM`oooooo_OV9eookNhokWIBmoooooo]GM`ogNe1oOkE7lo]GM`ogNe1oOkE7lo]GM`ogNe1oOkE7lo]GM`ogNe1oOkE7lo"
            A$ = A$ + "oooookWIBmoo^7nonIVDooooooOkE7lo]GM`ogNe1oOkE7lo]GM`ogNe1oOkE7lo]GM`ogNe1oOkE7lo]GM`ogNe1ooooooonIVD"
            A$ = A$ + "oo_kQo_OV9eoi7NcoK_g:o_mN[lofk]boK_g:o_mN[lofk]boK_g:o_mN[lofk]boK_g:o_mN[lofk]boWOh=o_OV9eookNhoook"
            A$ = A$ + "Ro_OV9eonIVDokWIBm_OV9eonIVDokWIBm_OV9eonIVDokWIBm_OV9eonIVDokWIBm_OV9eonIVDoo?jGooo^7noX3=_okWIBm_O"
            A$ = A$ + "V9eonIVDokWIBm_OV9eonIVDokWIBm_OV9eonIVDokWIBm_OV9eonIVDokWIBm_OV9eoI7L[oo_kQo_OV9eodc=booombooog;oo"
            A$ = A$ + "oO_looombooog;oooO_looombooog;oooO_looombooog;oooO_loC?g8o_OV9eookNhokWIBmooooooOOl\oomacnog7?koOOl\"
            A$ = A$ + "oomacnog7?koOOl\oomacnog7?koOOl\oomacnog7?kooooookWIBmoo^7nonIVDoooooookG?lo_Om`oone3ookG?lo_Om`oone"
            A$ = A$ + "3ookG?lo_Om`oone3ookG?lo_Om`oone3ooooooonIVDoo_kQo_OV9eooooook_iBo_nRkloj;^co[_h>o_nRkloj;^co_oh?oon"
            A$ = A$ + "Solok?ncok_iBo_oV;monK^doooooo_OV9eookNhokWIBmooooooo;Ojoo_kQooo^7nookNhoo_kQo?Qk]fooo^hoookRooo`Gno"
            A$ = A$ + "o;Ojoo_lYooobWnooooookWIBmoo^7nonIVDooooooooooooog?oooOolooomcoo4^gJoChN[m?Qk]fook_ooo_onooonkoooooo"
            A$ = A$ + "oooooooooooonIVDoo_kQo_OV9eooooooooooooooooooooooChN[m?Qk]fo4^gJoChN[m?Qk]fooooooooooooooooooooooooo"
            A$ = A$ + "oo_OV9eookNhokWIBmoooooooooooooooo?Qk]fo4^gJoChN[moooooo4^gJoChN[m?Qk]fooooooooooooooooooooookWIBmoo"
            A$ = A$ + "^7nonIVDoooooooooooo4^gJoChN[m?Qk]fooooooooooooooooo4^gJoChN[m?Qk]fooooooooooooooooonIVDoo_kQo_OV9eo"
            A$ = A$ + "oooooooooooooooo4^gJoooooooooooooooooooooooooooo4^gJoooooooooooooooooooooo_OV9eookNhokWIBmoooooooooo"
            A$ = A$ + "oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooookWIBmoo^7nonIVDoooooooooooooooooooo"
            A$ = A$ + "oooooooooooooooooooooooooooooooooooooooooooooooooooooooonIVDoo_kQo_OV9eooooooooooooooooooooooooooooo"
            A$ = A$ + "oooooooooooooooooooooooooooooooooooooooooooooo_OV9eookNhokWIBm?cd2jooooooooooooooooooooooooooooooooo"
            A$ = A$ + "oooooooooooooooooooooooooooooooo<C;XokWIBmoo^7nonIVDokWIBm?cd2jo<C;Xoc<]Pn?cd2jo<C;Xoc<]Pn?cd2jo<C;X"
            A$ = A$ + "oc<]Pn?cd2jo<C;Xoc<]Pn_OV9eonIVDoo_kQo?f0cjonIVDokWIBm_OV9eonIVDokWIBm_OV9eonIVDokWIBm_OV9eonIVDokWI"
            A$ = A$ + "Bm_OV9eonIVDokWIBm_djJjookNhoo?okooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo"
            A$ = A$ + "ooooooooooOkOooo^7noooooooomboooaOnooo^hooOkOooo\gmoo_>gooOjHoooYSmooSneoo?jGoooWGmonK^dooolZooooooo"
            A$ = A$ + "oOndoo_kQoooooooo7oiooombooofonoo?_joo_lYoooaOnoo7oiooOlWooo`Gnooo>ioookRooo]omooONeooooooOnQglookNh"
            A$ = A$ + "oooooooo_;nooKokooOm^ooobWnoo7oiooOlWooo`Gnooo>ioookTooo_;nookNhooOkOoooWGmoooooo7Of5ooo^7noooooooOk"
            A$ = A$ + "Ooooc[noo;OjooOlWooo`Gnoo3Oioo?lUooo^7noogngooOkOooo]omoogngoo?jGooooooo\C=`oo_kQoooooooo_>gooOlWooo"
            A$ = A$ + "aOnoo7oioo?lUooo`GnoS_l]ooOkOooo]omoogngooOkOooo]omooSneoooooo?j@ckookNhoooooooo[cmoo7oiooOlWooo`Gno"
            A$ = A$ + "o3Oio?nbgnoh;OkoS_l]ooOkOooo\gmoogngoo?kMoooXOmooooooK^cjnoo^7noooooooOjHooo`Gnoo7oiooOlWooh;OkoS_l]"
            A$ = A$ + "o?nbgnoh;OkoS_l]oo?kMooo\gmoocNgoo?jGoooooooUgL^oo_kQooooooooSneoo?lUooo`GnoS_l]o?nbgnoh;OkookNho?nb"
            A$ = A$ + "gnoh;OkoS_l]oo?kMooo[cmooONeooooooOi=WkookNhooooooooWGmooo>io?nbgnoh;OkoS_l]oookTooo_;noogngo?nbgnoh"
            A$ = A$ + ";OkoS_l]ooojLoooWGmooooooGNcinoo^7nooooooooiEooo_;nooo>io?nbgnoo_Cnooo^hoookRooo]omoo_>go?nbgnoo[cmo"
            A$ = A$ + "o[^foooiEoooooooUgL^oo_kQooooooooOndoo_kQooo_;nooo^hoookRooo_;nookNhooOkOooo\gmoo_>goo_jJoooYSmooOnd"
            A$ = A$ + "ooooooOi=WkookNhooooooooW?moogngoo_kQooo^7nookNhoo_kQooo]omoocNgoo?kMooo[cmoo[^foo?jGo_oV;mooooooGNc"
            A$ = A$ + "inoo^7nooooooc?i@ooo[cmoocNgooOkOooo]omoocNgoo?kMooo[cmoo[^fooOjHoooXOmooONeogOiAoooooooUgL^oo_kQooo"
            A$ = A$ + "ooooo;OjoooiCoooWGmooONeoooiEoooWGmooONeoooiEoooWGmooOndoooiCoOoU7moo7oiooooooojCokookNhoc?i@ooooooo"
            A$ = A$ + "oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooodc=booOkOooo^7noo?_jo3?f4oOi=WkoR[\]"
            A$ = A$ + "ok]abnOg57koMGL\ogMaanOg57koMGL\ogMaanOg57koOOl\oWNdmnoofonoogngoo_kQo?mLSlo\B9Po7M^Un?dhBjo@S;Yo3=^"
            A$ = A$ + "Tn?dhBjo@S;Yo3=^Tn?dhBjo@S;Yo3=^Tn?dhBjo?OkXoWJTmm?mLSlookNho7KV5n_lJKlooooooooooooooooooooooooooooo"
            A$ = A$ + "oooooooooooooooooooooooooooooooooooob[]ao7KV5noo^7noaVIQoooooooooooooooooooooooooooooooooooooooooooo"
            A$ = A$ + "ooooooooooooooooooooooooooooooooaVIQoo_kQoO\IFhooooooo?okoool_oooconoo?okoool_oooconoo?okoool_ooocon"
            A$ = A$ + "oo?okoool_oooconooooooO\IFhookNho7KV5noooooooG_kooOm^oooeknooG_kooOm^oooeknooG_kooOm^oooeknooG_kooOm"
            A$ = A$ + "^oooeknoooooo7KV5noo^7noaVIQoooooooo_;nooo^hoookRooo_;nooo^hoookRooo_;nooo^hoookRooo_;nooo^hoookRooo"
            A$ = A$ + "ooooaVIQoo_kQoO\IFhooooooooiCoooW?mocAfFoooiCoooW?mooOndoooiCoooW?mocAfFoooiCoooW?mooOndooooooO\IFho"
            A$ = A$ + "okNho7KV5noooooofk]bo?7IKmoLT]eocAfFoK_g:o_mN[lofk]bo?7IKmoLT]eocAfFoK_g:o_mN[loooooo7KV5noo^7noaVIQ"
            A$ = A$ + "oooooo_kF;lo^K]`o?7IKmoLT]eocAfFok^e2ooLT]eocAfFo?7IKm_kF;lo^K]`ok^e2oooooooaVIQoo_kQoO\IFhooooooWNd"
            A$ = A$ + "mnOjAgkoY7M_o?7IKmoLT]eocAfFo?7IKmoLT]eoY7M_oWNdmnOjAgkoY7M_ooooooO\IFhookNho7KV5nooooooX3=_oS>dln?j"
            A$ = A$ + "@ckoX3=_o?7IKmoLT]eocAfFoS>dln?j@ckoX3=_oS>dln?j@ckoooooo7KV5noo^7noaVIQoooooo?j@ckoX3=_oS>dln?j@cko"
            A$ = A$ + "X3=_o?7IKm?j@ckoX3=_oS>dln?j@ckoX3=_oS>dlnooooooaVIQoo_kQoO\IFhooooooS>dln?j@ckoX3=_oS>dln?j@ckoX3=_"
            A$ = A$ + "oS>dln?j@ckoX3=_oS>dln?j@ckoX3=_ooooooO\IFhookNho7KV5nooooooX3=_oS>dln?j@ckoX3=_oS>dln?j@ckoX3=_oS>d"
            A$ = A$ + "ln?j@ckoX3=_oS>dln?j@ckoooooo7KV5noo^7noaVIQoooooo?j@ckoX3=_oS>dln?j@ckoX3=_oS>dln?j@ckoX3=_oS>dln?j"
            A$ = A$ + "@ckoX3=_oS>dlnooooooaVIQoo_kQoO\IFhoi7NcoK_g:o_mN[lofk]boK_g:o_mN[lofk]boK_g:o_mN[lofk]boK_g:o_mN[lo"
            A$ = A$ + "fk]boWOh=oO\IFhookNhoookRo?Z@bgoj:ZSo[[X>n_^Rjhoj:ZSo[[X>n_^Rjhoj:ZSo[[X>n_^Rjhoj:ZSo[[X>n_^RjhoWnhN"
            A$ = A$ + "oo?jGooo^7nodc=bokWIBm_OV9eonIVDokWIBm_OV9eonIVDokWIBm_OV9eonIVDokWIBm_OV9eonIVDokWIBm_OV9eodc=boo_k"
            A$ = A$ + "Qo_OV9eob[]aooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo;_f6o_OV9eookNhokWIBmoo"
            A$ = A$ + "oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooookWIBmoo^7nonIVDoooooooooooo"
            A$ = A$ + "oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooonIVDoo_kQo_OV9eooooooooooooooooooooo"
            A$ = A$ + "oooooooooooooooooooooooooooooooooooooooooooooooooooooo_OV9eookNhokWIBmoooooooooooooooooooooooooooooo"
            A$ = A$ + "oooooooooooooooooooooooooooooooooooooooooooookWIBmoo^7nonIVDooooooookWooo_OnoChN[mookWooo_Onoooniooo"
            A$ = A$ + "kWooo_OnoChN[mookWooo_OnoooniooooooonIVDoo_kQo_OV9eoooooooOlWo?Qk]fo4^gJoChN[mooaOnoo7oiooOlWo?Qk]fo"
            A$ = A$ + "4^gJoChN[mooaOnoo7oioooooo_OV9eookNhokWIBmoooooooOndoooiCo?Qk]fo4^gJoChN[mooW?mo4^gJoChN[m?Qk]fooOnd"
            A$ = A$ + "oooiCoooW?mooooookWIBmoo^7nonIVDooooooOmMWloegMboGOg9o?Qk]fo4^gJoChN[m?Qk]fo4^gJoGOg9oOmMWloegMboGOg"
            A$ = A$ + "9ooooooonIVDoo_kQo_OV9eooooooone3ookG?lo_Om`oone3o?Qk]fo4^gJoChN[mokG?lo_Om`oone3ookG?lo_Om`oooooo_O"
            A$ = A$ + "V9eookNhokWIBmoooooo]GM`ogNe1oOkE7lo]GM`ogNe1o?Qk]fo]GM`ogNe1oOkE7lo]GM`ogNe1oOkE7looooookWIBmoo^7no"
            A$ = A$ + "nIVDooooooOkE7lo]GM`ogNe1oOkE7lo]GM`ogNe1oOkE7lo]GM`ogNe1oOkE7lo]GM`ogNe1ooooooonIVDoo_kQo_OV9eooooo"
            A$ = A$ + "ogNe1oOkE7lo]GM`ogNe1oOkE7lo]GM`ogNe1oOkE7lo]GM`ogNe1oOkE7lo]GM`oooooo_OV9eookNhokWIBmoooooo]GM`ogNe"
            A$ = A$ + "1oOkE7lo]GM`ogNe1oOkE7lo]GM`ogNe1oOkE7lo]GM`ogNe1oOkE7looooookWIBmoo^7nonIVDoWOh=o_mN[lofk]boK_g:o_m"
            A$ = A$ + "N[lofk]boK_g:o_mN[lofk]boK_g:o_mN[lofk]boK_g:oOnQglonIVDoo_kQooo_;nonIVDokWIBm_OV9eonIVDokWIBm_OV9eo"
            A$ = A$ + "nIVDokWIBm_OV9eonIVDokWIBm_OV9eonIVDokWIBmooXOmookNhoS>dln_OV9eonIVDokWIBm_OV9eonIVDokWIBm_OV9eonIVD"
            A$ = A$ + "okWIBm_OV9eonIVDokWIBm_OV9eonIVDoWM`]noo^7nonIVDoC?g8ooog;oooO_looombooog;oooO_looombooog;oooO_looom"
            A$ = A$ + "booog;oooO_looombo?mLSlonIVDoo_kQo_OV9eooooooomacnog7?koOOl\oomacnog7?koOOl\oomacnog7?koOOl\oomacnog"
            A$ = A$ + "7?koOOl\oooooo_OV9eookNhokWIBmoooooo_Om`oone3ookG?lo_Om`oone3ookG?lo_Om`oone3ookG?lo_Om`oone3ookG?lo"
            A$ = A$ + "oooookWIBmoo^7nonIVDoooooo_oV;moj;^co[_h>o_nRkloj;^co[_h>oonSolok?nco_oh?o_oV;monK^dok_iBooooooonIVD"
            A$ = A$ + "oo_kQo_OV9eooooooo_lYooo^7nookNhoo_kQooo^7nookNhoookRooo_;noo3Oioo_lYooobWnoo;Ojoooooo_OV9eookNhokWI"
            A$ = A$ + "BmooooooooooooOolo?Qk]foog?oooOolooomcoook_ooo_ono?Qk]fook_ooooooooooooooooookWIBmoo^7nonIVDoooooooo"
            A$ = A$ + "oooo4^gJoChN[m?Qk]fooooooooooooooooo4^gJoChN[m?Qk]fooooooooooooooooonIVDoo_kQo_OV9eooooooooooooooooo"
            A$ = A$ + "4^gJoChN[m?Qk]fooooooChN[m?Qk]fo4^gJoooooooooooooooooooooo_OV9eookNhokWIBmoooooooooooooooooooooo4^gJ"
            A$ = A$ + "oChN[m?Qk]fo4^gJoChN[moooooooooooooooooooooooooookWIBmoo^7nonIVDoooooooooooooooooooooooooooo4^gJoChN"
            A$ = A$ + "[m?Qk]fooooooooooooooooooooooooooooooooonIVDoo_kQo_OV9eooooooooooooooooooooooooooooooooo4^gJoooooooo"
            A$ = A$ + "oooooooooooooooooooooooooooooo_OV9eookNhokWIBmoooooooooooooooooooooooooooooooooooooooooooooooooooooo"
            A$ = A$ + "oooooooooooooooooooookWIBmoo^7nonIVDoooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo"
            A$ = A$ + "oooooooooooonIVDoo_kQo_OV9eo<C;Xoooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooc<]"
            A$ = A$ + "Pn_OV9eookNhokWIBm_OV9eo<C;Xoc<]Pn?cd2jo<C;Xoc<]Pn?cd2jo<C;Xoc<]Pn?cd2jo<C;Xoc<]Pn?cd2jonIVDokWIBmoo"
            A$ = A$ + "^7noH3<[okWIBm_OV9eonIVDokWIBm_OV9eonIVDokWIBm_OV9eonIVDokWIBm_OV9eonIVDokWIBm_OV9eoB[[Yoo_kQoool_oo"
            A$ = A$ + "oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo]omookNhoooooooog;ooo7oi"
            A$ = A$ + "oookRooo]omoocNgooojLoooYSmooW>foo?jGoooXOmooONeok_iBoooc[nooooooooiCooo^7noooooooOlWooog;oooKokoool"
            A$ = A$ + "ZooobWnoo7oiooOlWoooaOnoo3OioookTooo_;noogngoooiEoooooooi7Ncoo_kQooooooooo^hoo_m_oooeknoo;OjooOlWooo"
            A$ = A$ + "aOnoo3OioookTooo_Cnooo^hoo_kQooo]omooONeooooooOlIGlookNhoooooooo]omoo?_joo_lYoooaOnoo3Oioo?lUooo`Gno"
            A$ = A$ + "okNhooOkOooo]omoogngooOkOoooXOmooooooc>e0ooo^7noooooooojLoooaOnoo7oiooOlWooo`Gnoo3Oioo?lUooo]omoogng"
            A$ = A$ + "ooOkOooo]omoogngoo?jGoooooooX3=_oo_kQoooooooo_>gooOlWoooaOnoS_l]oo?lUooo`GnoogngooOkOooo]omoS_l]ooOk"
            A$ = A$ + "Oooo\gmooSneoooooo_i>[kookNhooooooooYSmoo3Oio?nbgnoh;OkoS_l]oo_kQooo^7noocNgo?nbgnoh;OkoS_l]oo?kMooo"
            A$ = A$ + "XOmooooooGNcinoo^7nooooooo?jGooo`Gnoo3Oio?nbgnoh;OkoS_l]oo_kQooh;OkoS_l]o?nbgnoo\gmoo_>goooiEooooooo"
            A$ = A$ + "UgL^oo_kQooooooooONeoookTooo_Cnooo>io?nbgnoh;OkoS_l]o?nbgnoh;OkoocNgoo?kMooo[cmooONeooooooOi=WkookNh"
            A$ = A$ + "ooooooooWGmooo^hoookTooo_Cnooo>io?nbgnoh;OkoS_l]ooojLooo[cmoo_>goo_jJoooWGmooooooGNcinoo^7nooooooooi"
            A$ = A$ + "Cooo^7nooo^hoookRooo_;nooo^ho?nbgnoo]omoocNgooojLoooZ[mooW>foooiCoooooooUgL^oo_kQooooooooOndooOkOooo"
            A$ = A$ + "^7nookNhoo_kQooo^7noogngoo?kMooo\gmoo_>goo_jJoooXOmonK^dooooooOi=WkookNhoooooo?oT3moo_>goo?kMooo]omo"
            A$ = A$ + "ogngoo?kMooo\gmoo_>goo_jJoooYSmooSneoooiEoOoU7mooooooGNcinoo^7nooooooo_lYoooW?mooONeoooiEoooWGmooONe"
            A$ = A$ + "oooiEoooWGmooONeoooiCoooW?momGNdooOlWooooooo[?m_oo_kQo?oT3mooooooooooooooooooooooooooooooooooooooooo"
            A$ = A$ + "oooooooooooooooooooooooooooooC?g8ooo]omookNhooolZo?lHCloUgL^o;^bfn_g6;koMGL\ogMaanOg57koMGL\ogMaanOg"
            A$ = A$ + "57koMGL\oomacnOjAgkooKokooOk%Oo?"
        Case "radiobutton.png"
            A$ = MKI$(13) + MKI$(104)
            A$ = A$ + "oooo0looo3`ooo?00657J0HDLl5PAaA]0657e3HDLD;PAaaG0657Jlooo3`ooo?0oooo0looo30PAaQ00657<1HDLTOX6Bfo1OkY"
            A$ = A$ + "o[=gJo_aj^joVV8Jo3HDLT?PAa1C06572looo3`ooo?00657<YYNEmo_eJjoK3>hok]hRo_hUGnoUS>joW>k\oOc1;koQ6hFo3HD"
            A$ = A$ + "L`dooo?00657J0HDLTo_eJjoK3>hok]hRo_hUGnoUS>joW>k\o?k_ono_7Olo3=aen?PAaAn0657J0HDLlEX6BfoK3>hok]hRo_h"
            A$ = A$ + "UGnoUS>joW>k\o?k_ono_7Olo7olco?meGoo\nXKo3HDLl5PAaA]1OkYok]hRo_hUGnoUS>joW>k\o?k_ono_7Olo7olco?meGoo"
            A$ = A$ + "fOomoG=bin?PAaA]0657e[=gJo_hUGnoUS>joW>k\o?k_ono_7Olo7olco?meGoofOomoSOnioOmd;oo0657e3HDLD[aj^joUS>j"
            A$ = A$ + "oW>k\o?k_ono_7Olo7olco?meGoofOomoSOnio_nk_ooH_<_o3HDLD;PAaaGVV8JoW>k\o?k_ono_7Olo7olco?meGoofOomoSOn"
            A$ = A$ + "io_nk_oolgOoooJT`m?PAaaG0657J0HDLTOc1;ko_7Olo7olco?meGoofOomoSOnio_nk_oolgOooW=cln?PAaAn0657Jlooo30P"
            A$ = A$ + "Aa1CQ6hFo3=aen?meGoofOomoSOnio_nk_oolgOooW=cln_Y52fo0657<mooo3`ooo?0065720HDL`4PAaAn\nXKoG=binOmd;oo"
            A$ = A$ + "H_<_ooJT`m?PAaAn0657<1HDL8`ooo?0oooo0looo3`ooo?00657J0HDLl5PAaA]0657e3HDLD;PAaaG0657Jlooo3`ooo?0oooo"
            A$ = A$ + "0looo3`ooo?0oooo00HDLX1PAaaG0657e2HDLD?PAaA]0657O1HDLXaooo?0oooo0looo3`ooo?0065720HDL`4PAaAn@R8LoCY]"
            A$ = A$ + "ln?SDCoo3n:_ooGP_m?PAaAn0657<1HDL8`ooo?0oooo00HDL`DTn1foOV;_ocigno?SIgoo4JMoocgdlo?M@cooaQZ^oO7MNm?P"
            A$ = A$ + "Aa1Coooo00HDLX1PAaAnOV;_ocigno?VL_ooc>nmoOMkbo?[PKook5]no?6bkoOISZko0657i3HDLX1PAaaG@R8Locigno?VL_oo"
            A$ = A$ + "Jk^loomkaoog_7ooOoNloSMkboOK;WooD9\nogVN_m?PAaaG0657eBY]ln?SIgooc>nmoomkaoog_7ooOoNloomkaoog_7ooLVMm"
            A$ = A$ + "ok4`jo?FNVko0657e2HDLD?SDCoo4JMooOMkboog_7ooOoNloomkaoog_7ooOoNloCmjbo?BmVoo5M;lo3HDLD?PAaA]3n:_ocgd"
            A$ = A$ + "lo?[PKooOoNloomkaoog_7ooOoNloomkaooUGGoo3]Kno7eVin?PAaA]0657OmGP_m?M@cook5]noSMkboog_7ooOoNloomkaooe"
            A$ = A$ + "\7ooI9<nokC^io_Igifo0657O1HDLX1PAaAnaQZ^o?6bkoOK;WooLVMmoCmjbooUGGooI9<nokC^io_CIVko0657i3HDLXaooo?0"
            A$ = A$ + "0657<M7MNmOISZkoD9\nok4`jo?BmVoo3]KnokC^io_CIVkoZmVGo3HDL`dooo?0oooo00HDL80PAa1C0657igVN_m?FNVko5M;l"
            A$ = A$ + "o7eVin_Igifo0657i3HDL`4PAaQ0oooo0looo3`ooo?0oooo00HDLX1PAaaG0657e2HDLD?PAaA]0657O1HDLXaooo?0oooo0loo"
            A$ = A$ + "o3`ooo?0oooo0looo30PAaQ60657O1HDLD;PAaAm0657e2HDLl5PAaQ6oooo0looo3`ooo?0oooo00HDL80PAa1C0657i3YMDm?X"
            A$ = A$ + "IZho_N[]oK:XAn_Umaeo0657i3HDL`4PAaQ0oooo0looo30PAa1C<f6BokiU7nO[gNkoa^;_oKK`1oo^6Olo0cLco7;[MnOUhAeo"
            A$ = A$ + "0657<mooo30PAaQ60657ikiU7nO[gNkoa^;_oKK`1oo^6Olo0cLcoGLdBo?bEOmof:;Yo3HDLT?PAaQ60657O1YMDmO[gNkoa^;_"
            A$ = A$ + "oKK`1oo^6Olo0cLcoGLdBo?bEOmo<[mfooLgOooW7Jfo0657O1HDLD;XIZhoa^;_oKK`1oo^6Olo0cLcoGLdBo?bEOmo<[mfooLg"
            A$ = A$ + "OoodQ?nomZkZo3HDLD;PAaAm_N[]oKK`1oo^6Olo0cLcoGLdBo?bEOmo<[mfooLgOoodQ?noFG^ioK]hRo?PAaAm0657eJ:XAno^"
            A$ = A$ + "6Olo0cLcoGLdBo?bEOmo<[mfooLgOoodQ?noFG^ioW=jZoO`n2ko0657e2HDLlUUmaeo0cLcoGLdBo?bEOmo<[mfooLgOoodQ?no"
            A$ = A$ + "FG^ioW=jZoof[gnoS^hJo3HDLl5PAaQ60657i7;[Mn?bEOmo<[mfooLgOoodQ?noFG^ioW=jZoof[gno23\\o3HDLT?PAaQ6oooo"
            A$ = A$ + "00HDL`DUhAeof:;YooLgOoodQ?noFG^ioW=jZoof[gno23\\oc9PKm?PAa1Coooo0looo30PAaQ00657<1HDLToW7JfomZkZoK]h"
            A$ = A$ + "RoO`n2koS^hJo3HDLT?PAa1C06572looo3`ooo?0oooo0looo30PAaQ60657O1HDLD;PAaAm0657e2HDLl5PAaQ6oooo0looo3`o"
            A$ = A$ + "oo?0oooo0looo3`ooo?09G\aJTLa6oEb5KL]9G\aeWLa6GKb5KlG9G\aJlooo3`ooo?0oooo0looo3@b5K\09G\a<ULa6_Jb5KlH"
            A$ = A$ + "9G\aXTLa6G@b5K<:9G\aSULa6_Jb5K<C9G\a2looo3`ooo?09G\a<ULa6CGb5Kl0oooo0looo3`ooo?0oooo0looo3@b5Kl09G\a"
            A$ = A$ + "dULa6cdooo?09G\aJTLa6_Jb5Kl0oooo0looo3`ooo?0oooo0looo3`ooo?0oooo0TLa6?@b5KlZ9G\aJTLa6oEb5KlHoooo0loo"
            A$ = A$ + "o3`ooo?0oooo0looo3`ooo?0oooo0looo3`ooo?09G\aSULa6oEb5KL]9G\aXlooo3`ooo?0oooo0looo3`ooo?0oooo0looo3`o"
            A$ = A$ + "oo?0oooo0TLa6SBb5KL]9G\aeWLa6G`ooo?0oooo0looo3`ooo?0oooo0looo3`ooo?0oooo0looo3@b5KL19G\aeWLa6GKb5K<:"
            A$ = A$ + "oooo0looo3`ooo?0oooo0looo3`ooo?0oooo0looo3`ooo?09G\aXTLa6GKb5KlG9G\aSmooo3`ooo?0oooo0looo3`ooo?0oooo"
            A$ = A$ + "0looo3`ooo?0oooo0TLa6?Fb5KlG9G\aJTLa6_Jb5Kl0oooo0looo3`ooo?0oooo0looo3`ooo?0oooo0TLa6?@b5KlZ9G\aJloo"
            A$ = A$ + "o3@b5K<C9G\adULa6?`ooo?0oooo0looo3`ooo?0oooo0TLa6?@b5K<M9G\a<mooo3`ooo?09G\a2TLa6cDb5KlZ9G\aSULa6SBb"
            A$ = A$ + "5KL19G\aXTLa6?Fb5KlZ9G\a<ULa6;`ooo?0oooo0looo3`ooo?09G\aJTLa6oEb5KL]9G\aeWLa6GKb5KlG9G\aJlooo3`ooo?0"
            A$ = A$ + "oooo0looo3`ooo?0oooo00HDLX1PAaaG0657e2HDLD?PAaA]0657O1HDLXaooo?0oooo0looo3`ooo?0065720HDL`4PAaAnSNXI"
            A$ = A$ + "oG\^[nogQomo8k[[oOjRYm?PAaAn0657<1HDL8`ooo?0oooo00HDL`4WlMeo3WKZo7NiUoohWOnoV[^joW>k\o?k_ono??l\o;JP"
            A$ = A$ + "Lm?PAa1Coooo00HDLX1PAaAn3WKZo7NiUoohWOnoV[^joW>k\o?k_ono_7Olo7olco_d5Kko0657i3HDLX1PAaaGSNXIo7NiUooh"
            A$ = A$ + "WOnoNS^hoK:gYn_BofdoN:=XoK^kXooleGoofOomog:T^m?PAaaG0657eF\^[nohWOnoV[^joK:gYnODEGeoo<l@oK2ZYl?V<[io"
            A$ = A$ + "fOomoSOnio_e9[ko0657e2HDLDogQomoV[^joW>k\o_Bofdoo<\@oGC^hlO8Q6boSHY9oSOnioOnj[oofGolo3HDLD?PAaA]8k[["
            A$ = A$ + "oW>k\o?k_onoN:=XoO2ZZl?8R:bo@8i4oO9bHnOnj[ookc?ooWmbln?PAaA]0657OMjRYm?k_ono_7OloK^kXo?V<[ioTH99oOIb"
            A$ = A$ + "HnOkcknokc?oogOomoo[A2go0657O1HDLX1PAaAn??l\o7olcooleGoofOomoSOnioOnj[ookc?oogOomoOf<cko0657i3HDLXao"
            A$ = A$ + "oo?00657<9JPLm_d5KkofOomoSOnioOnj[ookc?oogOomoOf<ckoVF8Ho3HDL`dooo?0oooo00HDL80PAa1C0657ig:T^m_e9[ko"
            A$ = A$ + "fGoloWmblno[A2go0657i3HDL`4PAaQ0oooo0looo3`ooo?0oooo00HDLX1PAaaG0657e2HDLD?PAaA]0657O1HDLXaooo?0oooo"
            A$ = A$ + "0looo3`ooo?0oooo0looo30PAaQ60657O1HDLD;PAaAm0657e2HDLl5PAaQ6oooo0looo3`ooo?0oooo00HDL80PAa1C0657i39R"
            A$ = A$ + "`m?Ufbko<B=mo?h[lnoO1nfo0657i3HDL`4PAaQ0oooo0looo30PAa1CAj7HooI^ln?WOkoo<VMooCXemo?OCcood1=oo77ZjnoM"
            A$ = A$ + "dieo0657<mooo30PAaQ60657ioI^ln?WOkooHbmno?khgooe];oo\2^mo_GdjooH8_ooU=Z^o3HDLT?PAaQ60657O19R`m?WOkoo"
            A$ = A$ + "Hbmno;=kYo?XNcjo8mKCoCIdPn_cXOno]]LnoCU`joOKjmfo0657O1HDLD;Ufbko<VMoo?khgo?XNcjoAEMEooc`3m_9XVbo<R<V"
            A$ = A$ + "ocIfeo_C0[ooHiI^o3HDLD;PAaAm<B=moCXemooe];oo8mKCooc`2mO=iRcoQ4J8o3BUUl?e[;oo8eKnoGd]`o?PAaAm0657e>h["
            A$ = A$ + "ln?OCcoo\2^moCIdPno9XZboP8Z8o3QTCl?R2?ioGNMmo?d^ioODKVko0657e2HDLleO1nfod1=oo_Gdjo_cXOno<V<Vo7BUSl?R"
            A$ = A$ + "3?io=K^ioWU`ho_?iVooVMWKo3HDLl5PAaQ60657i77ZjnoH8_oo]]LnocIfeo?e[;ooGNMmoWU`ho_?iVoo>UI^o3HDLT?PAaQ6"
            A$ = A$ + "oooo00HDL`dMdieoU=Z^oCU`jo_C0[oo8eKno?d^io_?iVoo>UI^o[fKNm?PAa1Coooo0looo30PAaQ00657<1HDLTOKjmfoHiI^"
            A$ = A$ + "oGd]`oODKVkoVMWKo3HDLT?PAa1C06572looo3`ooo?0oooo0looo30PAaQ60657O1HDLD;PAaAm0657e2HDLl5PAaQ6oooo0loo"
            A$ = A$ + "o3`ooo?0oooo0looo3`ooo?00657J0HDLl5PAaA]0657e3HDLD;PAaaG0657Jlooo3`ooo?0oooo0looo30PAaQ00657<1HDLT?T"
            A$ = A$ + "fAeoPVYRooj]fn_YP6ioFf7Go3HDLT?PAa1C06572looo3`ooo?00657<aHK8m_WGNho]Nk]o7k^ln_]17lokJlao3<c=oO\\fio"
            A$ = A$ + "ER7Eo3HDL`dooo?00657J0HDLT_WGNho]Nk]o7k^ln_]17lokJlao3<c=oOaA;mo8GmeoK[\Tn?PAaAn0657J0HDLl5TfAeo]Nk]"
            A$ = A$ + "o7k^ln?\1_ko:FlToGd^9m?Qofhoo6Mcoc\fKoocMomoONXIo3HDLl5PAaA]PVYRo7k^ln_]17lo:FlTo7EeEmo?3?doVPJ:o3h^"
            A$ = A$ + ";nocMomoC7nhog[^[n?PAaA]0657eoj]fn_]17lokJlaoGd^9mo?3;doeT;>o7BXQlo7C>boC7nhoKMiVo_eR;no0657e3HDLD[Y"
            A$ = A$ + "P6iokJlao3<c=oOQofhoWPZ:o3RXRl?4B>ao0Z[RoKMiVoOfX[no1k;\o3HDLD;PAaaGFf7Go3<c=oOaA;moo6Mco38_;n?8C6bo"
            A$ = A$ + "0Z[RoclgKoOfX[noK_Nko?jR[m?PAaaG0657J0HDLTO\\fio8Gmeoc\fKoocMomoC7nhoKMiVoOfX[noK_Nko;<`bn?PAaAn0657"
            A$ = A$ + "Jlooo30PAa1CER7EoK[\TnocMomoC7nhoKMiVoOfX[noK_Nko;<`bn?W0^eo0657<mooo3`ooo?0065720HDL`4PAaAnONXIog[^"
            A$ = A$ + "[n_eR;no1k;\o?jR[m?PAaAn0657<1HDL8`ooo?0oooo0looo3`ooo?00657J0HDLl5PAaA]0657e3HDLD;PAaaG0657Jlooo3`o"
            A$ = A$ + "oo?0oooo0looo3`ooo?0oooo0TLa6[Ab5KlG9G\aeVLa6GOb5KL]9G\aOULa6[aooo?0oooo0looo3`ooo?09G\a2TLa6cDb5KlZ"
            A$ = A$ + "9G\aSULa6SBb5KL19G\aXTLa6?Fb5KlZ9G\a<ULa6;`ooo?0oooo0TLa6cDb5K<M9G\a3looo3`ooo?0oooo0looo3`ooo?09G\a"
            A$ = A$ + "3TLa6CGb5K<Coooo0TLa6[Ab5KlZ9G\a3looo3`ooo?0oooo0looo3`ooo?0oooo0looo3@b5Kl09G\a[VLa6[Ab5KlG9G\aSmoo"
            A$ = A$ + "o3`ooo?09G\ahTLa63Jb5K<l9G\aPVLa6Scooo?0oooo0TLa6?Fb5KlG9G\aeVLa6Sbooo?0oooo0TLa63Jb5Klo9G\aoWLa6oOb"
            A$ = A$ + "5K<Xoooo0looo3@b5K<:9G\aeVLa6GOb5KL1oooo0looo3@b5K<l9G\aoWLa6oOb5Klo9G\a`oooo3`ooo?09G\a5TLa6GOb5KL]"
            A$ = A$ + "9G\aXlooo3`ooo?09G\aPVLa6oOb5Klo9G\aoWLa63jooo?0oooo0TLa6SBb5KL]9G\aOULa6?fooo?0oooo0TLa6SCb5K<X9G\a"
            A$ = A$ + "`WLa63Jb5K<>oooo0looo3@b5KlH9G\aOULa6[Ab5KlZ9G\a3looo3`ooo?0oooo0looo3`ooo?0oooo0looo3@b5Kl09G\a[VLa"
            A$ = A$ + "6[aooo?09G\a<ULa6CGb5Kl0oooo0looo3`ooo?0oooo0looo3@b5Kl09G\adULa6cdooo?0oooo0TLa6;@b5K<C9G\a[VLa6?Fb"
            A$ = A$ + "5K<:9G\a5TLa6SBb5KlH9G\a[VLa6cDb5K\0oooo0looo3`ooo?0oooo0TLa6[Ab5KlG9G\aeVLa6GOb5KL]9G\aOULa6[aooo?0"
            A$ = A$ + "oooo0loo%o30"
        Case "progresstrack.png"
            A$ = MKI$(9) + MKI$(19)
            A$ = A$ + "oooooOjZ\nOOnmgoXQ6JoS6JXm?JXQfoXQ6JoS6JXmok_onoV^:[oOgMgm__njkonj[_ok[_nn__njkonj[_oS6JXmo\c>komigO"
            A$ = A$ + "ok[_nn__njko_onkoonk_ook_ono_onkok[_nnOP16hoXQ6Jok[_nnok_ono_onkoooooooooooo_onkoonk_o?JXQfoXQ6Jok[_"
            A$ = A$ + "nnok_onoooooooooooonk_oooooooonk_o?JXQfoXQ6Jok[_nnok_onoooooooooooonk_oooooooonk_o?JXQfoXQ6Jok[_nnok"
            A$ = A$ + "_onooooooooooo?nhSoooooooonk_o?JXQfoXQ6Jok[_nnok_onoooooooooooOmeGoooooooonk_o?JXQfoXQ6Jok[_nnok_ono"
            A$ = A$ + "ooooooooooolc?oooooooonk_o?JXQfoXQ6Jok[_nnok_onooooooooooo?l`3oooooooonk_o?JXQfoXQ6Jok[_nnok_onooooo"
            A$ = A$ + "oooooook_onooooooonk_o?JXQfoXQ6Jok[_nnok_onooooooooooo_lb;oooooooonk_o?JXQfoXQ6Jok[_nnok_onooooooooo"
            A$ = A$ + "ooOmeGoooooooonk_o?JXQfoXQ6Jok[_nnok_onooooooooooo?nhSoooooooonk_o?JXQfoXQ6Jok[_nnok_onooooooooooo_n"
            A$ = A$ + "j[oooooooonk_o?JXQfoXQ6Jok[_nnok_onoooooooooooonk_oooooooonk_o?JXQfomigOok[_nnok_ono_onkoooooooooooo"
            A$ = A$ + "_onkoonk_oOOnmgoW^:[oOgMgmok_ono_onkoonk_ook_ono_onkoOgMgm_Y[bjooooooKjZ\nOOnmgoXQ6JoS6JXm?JXQfomigO"
            A$ = A$ + "oOjZ\noooooo%%%0"
        Case "progresschunk.png"
            A$ = MKI$(10) + MKI$(12)
            A$ = A$ + ">=X5okdPFl_C3Jao>=X5okdPFl_C3Jao>=X5okdPFl_C3Jao>=X5ok:eVn_[DOjo^BmYok:eWn_[DOjo^BmYok:eWn_[DOjo^BmY"
            A$ = A$ + "ok:eWnoP3cgo3><Oo?h`lmoP3cgo3><Oo?h`lmoP3cgo4>LOoCh`mmoP3cgoZmkIo[f_Wm_JoNfoZmkIo[f_Wm_JoNfo[m;Jo[f_"
            A$ = A$ + "Xm_JoRfo[m;Jo;V_MmoHnjeoSm[Go?f_NmoHojeoTm[GoCf_Om?IoneoTmkGoCf_Om_HnfeoRiKGo;V_Mm_HnfeoRiKGo;V_Mm_H"
            A$ = A$ + "nfeoRiKGo;V_Mm_Hnfeo7ml>oOdckloA@_co71m>oODdkloAA_co75=?oSDdll?BAcco85=?oOBfHlo9ISaoWT=6oOBfHlo9JOao"
            A$ = A$ + "WXm5oORfGlo9JOaoWXm5oORfGl_=V3bofH>8oKSiPl_=V3bofD>8oKCiPlo=V3bogH>8oOSiPlo=V3bo\\N7ocbjMl?;[gao\\N7"
            A$ = A$ + "ocbjMl?;[gao\\N7ocRjMl?;[kao\\^7ok1jEl_7XGaoNPN5ok1jEl_7XGaoNPN5okAjEl_7YGaoNTN5okAjEl_C3Jao>=X5okdP"
            A$ = A$ + "Fl_C3Jao>=X5okdPFl_C3Jao>=X5okdPFl_C3Jao%%%0"
        Case "button.png"
            A$ = MKI$(18) + MKI$(105)
            A$ = A$ + ":O;ZoKiLDmoPAibo2nd:o;hC[l_P?]bo2nd:o;hC[l_P?]bo2nd:o;hC[l_P?]bo2nd:o;hC[l_P?]bo36E;o;9K;m_bgRjoCfVC"
            A$ = A$ + "oCKTkm?kPKmo\k=eoc^gEo?kNGmo\kMeoc^gEo?kNGmo\kMeoc^gEo?kNGmo\kMeoc^gEo?kNCmo\3^eoCKTkmoT]ido36e;oG?j"
            A$ = A$ + "OoookSooogOnooOoiooomWooogOnooOoiooomWooogOnooOoiooomWooogOnooOoiooomWooo_?noG?jOooPAmbo22E;o7?hGooo"
            A$ = A$ + "m_oooSoloo?ncoooh?oooSoloo?ncoooh?oooSoloo?ncoooh?oooSoloo?ncoooh?ooogono7?hGo_P@ebo22E;o3OgBooolWoo"
            A$ = A$ + "nkOook_omo_ongoonkOook_omo_ongoonkOook_omo_ongoonkOook_omo_ongooocOno3OgBo_P@ebo22E;ognf?o_ojSoomgon"
            A$ = A$ + "ogOokoOom_oomgonogOokoOom_oomgonogOokoOom_oomgonogOokoOom_oon[?nognf?o_P@ebo22E;o_ne;oOoiKoolc?noc?o"
            A$ = A$ + "ho?olSoolc?noc?oho?olSoolc?noc?oho?olSoolc?noc?oho?olSoomW_mo_ne;o_P@ebo22E;oS>e7o?ohGooj[?mo[_ndo_n"
            A$ = A$ + "jCooj[?mo[_ndo_njCooj[?mo[_ndo_njCooj[?mo[_ndo_njCoolSOmoS>e7o_P@ebo22E;oONd4oonf?ooiSOloW?naoOnh7oo"
            A$ = A$ + "iSOloW?naoOnh7ooiSOloW?naoOnh7ooiSOloW?naoOnh7ookKoloONd4o_P@ebo22E;oC^c1o_ne;oogCOkoO?m]oomdgnogCOk"
            A$ = A$ + "oO?m]oomdgnogCOkoO?m]oomdgnogCOkoO?m]oomdgnojG_loC^c1o_P@ebo22E;o7>bhnom`gnoe7OjoGOlYoOmaWnoe7OjoGOl"
            A$ = A$ + "YoOmaWnoe7OjoGOlYoOmaWnoe7OjoGOlYoOmaWnog3Oko7>bhn_P@ebo22E;oc=``nol\Onoc_nho?ojSool[?noc_nho?ojSool"
            A$ = A$ + "[?noc_nho?ojSool[?noc_nho?ojSool[?noccnioc=``n_P@ebo22E;o[M_\nOlZCno[c=do_>g@oojL3mo[c=do_>g@oojL3mo"
            A$ = A$ + "[c=do_>g@oojL3mo[c=do_>g@oojL3moa[>io[M_\n_P@ebo22E;oO]^Xn?lX;noWGmaoONe7ooiEOloWGmaoONe7ooiEOloWGma"
            A$ = A$ + "oONe7ooiEOloWGmaoONe7ooiEOlo`S^hoO]^Xn_P@ebo22E;oGM]Sn_kUkmoRoL`o;nc1o_h?7loRoL`o;nc1o_h?7loRoL`o;nc"
            A$ = A$ + "1o_h?7loRoL`o;nc1o_h?7lo^G^goGM]Sn_P@ebo22E;o?m\PnOkScmoN[l^ok]bkn_g:_koN[l^ok]bkn_g:_koN[l^ok]bkn_g"
            A$ = A$ + ":_koN[l^ok]bkn_g:_ko]?>go?m\Pn_P@ebo22E;o;M\LnojQWmoH;L\oS]`an?f27koH;L\oS]`an?f27koH;L\oS]`an?f27ko"
            A$ = A$ + "H;L\oS]`an?f27ko[7Nfo;M\Ln_P@ebo22E;o7][Hn_jQWmoCgkZo?M_[nodm^joCgkZo?M_[nodm^joCgkZo?M_[nodm^joCgkZ"
            A$ = A$ + "o?M_[nodm^joZ7Nfo7][Hn_P@ebo36e;o7M[Hn?iGglo?S[Yoo<^VnochJjo?S[Yoo<^VnochJjo?S[Yoo<^VnochJjo?S[Yoo<^"
            A$ = A$ + "VnochJjoTOMco7M[HnoPAmbo?JFAoS:OOm?cW2io=S:Tog<Z@nOcX2io=S:Tog<Z@nOcX2io=S:Tog<Z@nOcX2io=S:Tog<Z@nOc"
            A$ = A$ + "X2io<O:ToS:OOm?TXMdo:O;ZoKILBmoPAmbo22E;o;8D]l_P@ebo22E;o;8D]l_P@ebo22E;o;8D]l_P@ebo22E;o;8D]l_P@ebo"
            A$ = A$ + "36U;o?9K;m_bgRjo:O;ZoKiLDmoPAibo2nd:o;hC[l_P?]bo2nd:o;hC[l_P?]bo2nd:o;hC[l_P?]bo2nd:o;hC[l_P?]bo36E;"
            A$ = A$ + "o;9K;m_bgRjoCfVCoCKTkmOXXGooQRNmo7:jeoOXXGooQRNmo7:jeoOXXGooQRNmo7:jeoOXXGooQRNmo7:jeoOXXGooQRNmoCKT"
            A$ = A$ + "kmoT]ido36e;o7:jeoOXXGoo6nlkoKhc_o_Q?ono6nlkoKhc_o_Q?ono6nlkoKhc_o_Q?ono6nlkoKhc_o_Q?onoQRNmo7:jeooP"
            A$ = A$ + "Ambo22E;o7:jeoOXXGoonkOook_omo_ongoonkOook_omo_ongoonkOook_omo_ongoonkOook_omo_ongooQRNmo7:jeo_P@ebo"
            A$ = A$ + "22E;oc9idoOXXGoonkOook_omo_ongoonkOook_omo_ongoonkOook_omo_ongoonkOook_omo_ongooQRNmoc9ido_P@ebo22E;"
            A$ = A$ + "oKYgco_WVCoomgonogOokoOom_oomgonogOokoOom_oomgonogOokoOom_oomgonogOokoOom_ooNJ>moKYgco_P@ebo22E;okhe"
            A$ = A$ + "aooVSCoolc?noc?oho?olSoolc?noc?oho?olSoolc?noc?oho?olSoolc?noc?oho?olSooK>>mokheao_P@ebo22E;oKhc_ooU"
            A$ = A$ + "O?ooj[?mo[_ndo_njCooj[?mo[_ndo_njCooj[?mo[_ndo_njCooj[?mo[_ndo_njCooGnmloKhc_o_P@ebo22E;ogga]ooTK;oo"
            A$ = A$ + "iSOloW?naoOnh7ooiSOloW?naoOnh7ooiSOloW?naoOnh7ooiSOloW?naoOnh7ooC^]locga]o_P@ebo22E;o?W_[ooSG7oogCOk"
            A$ = A$ + "oO?m]oomdgnogCOkoO?m]oomdgnogCOkoO?m]oomdgnogCOkoO?m]oomdgno?NMlo?g_[o_P@ebo22E;oSF]Yo_RC3ooe7OjoGOl"
            A$ = A$ + "YoOmaWnoe7OjoGOlYoOmaWnoe7OjoGOlYoOmaWnoe7OjoGOlYoOmaWno:>=loWF]Xo_P@ebo22E;okeZWo?Q>onoc_nho?ojSool"
            A$ = A$ + "[?noc_nho?ojSool[?noc_nho?ojSool[?noc_nho?ojSool[?no4jlkok5[Wo_P@ebo22E;oCUXUooQ:kno[c=do_>g@oojL3mo"
            A$ = A$ + "[c=do_>g@oojL3mo[c=do_>g@oojL3mo[c=do_>g@oojL3mo6Z\koCeXTo_P@ebo22E;o[TVRoON5gnoWGmaoONe7ooiEOloWGma"
            A$ = A$ + "oONe7ooiEOloWGmaoONe7ooiEOloWGmaoONe7ooiEOlojELko[TVRo_P@ebo22E;o7DTPoOKo^noRoL`o;nc1o_h?7loRoL`o;nc"
            A$ = A$ + "1o_h?7loRoL`o;nc1o_h?7loRoL`o;nc1o_h?7lo]mkjo;TTPo_P@ebo22E;oWSRNo_HjVnoN[l^ok]bkn_g:_koN[l^ok]bkn_g"
            A$ = A$ + ":_koN[l^ok]bkn_g:_koN[l^ok]bkn_g:_koQYKjoSSRNo_P@ebo22E;o7cPMooEeRnoH;L\oS]`an?f27koH;L\oS]`an?f27ko"
            A$ = A$ + "H;L\oS]`an?f27koH;L\oS]`an?f27koGEkio7cPLo_P@ebo22E;o_ROKoOCbNnoCgkZo?M_[nodm^joCgkZo?M_[nodm^joCgkZ"
            A$ = A$ + "o?M_[nodm^joCgkZo?M_[nodm^jo=9kio_BOKo_P@ebo36e;oKBNJoOAZJnoPQKlok5^ao?Hh6ooPQKlo36^ao?Hh6ooPQKlo36^"
            A$ = A$ + "ao?Hh6ooPQKlo36^ao?Hh6oo5YZioKBNJooPAmbo?JFAoS:OOm_9iYmoVTWfoKBNJo_9iYmoVTWfoKBNJo_9iYmoVTWfoKBNJo_9"
            A$ = A$ + "iYmoVTWfoKBNJo_9iYmoVTWfoS:OOm?TXMdo:O;ZoKILBmoPAmbo22E;o;8D]l_P@ebo22E;o;8D]l_P@ebo22E;o;8D]l_P@ebo"
            A$ = A$ + "22E;o;8D]l_P@ebo36U;o?9K;m_bgRjo:O;ZoKiLDmoPAibo2nd:o;hC[l_P?]bo2nd:o;hC[l_P?]bo2nd:o;hC[l_P?]bo2nd:"
            A$ = A$ + "o;hC[l_P?]bo36E;o;9K;m_bgRjoCfVCoCKTkm?kPKmo\k=eoc^gEo?kNGmo\kMeoc^gEo?kNGmo\kMeoc^gEo?kNGmo\kMeoc^g"
            A$ = A$ + "Eo?kNCmo\3^eoCKTkmoT]ido36e;o[[TgmO^ANgoj:iMo[[Tgm_^BNgoj:iMo[[Tgm_^BNgoj:iMo[[Tgm_^BNgoj:iMo[[Tgm_^"
            A$ = A$ + "BNgoi6iMoc[W8noPAmbo22E;o[[TgmochJjo?S[Yoo<^VnochJjo?S[Yoo<^VnochJjo?S[Yoo<^VnochJjo?S[Yoo<^VnochJjo"
            A$ = A$ + "?S[Yoc;W5n_P@ebo22E;o[[Tgmodm^joCgkZo?M_[nodm^joCgkZo?M_[nodm^joCgkZo?M_[nodm^joCgkZo?M_[nodm^joCgkZ"
            A$ = A$ + "o_[V3n_P@ebo22E;o[[Tgm?f27koH;L\oS]`an?f27koH;L\oS]`an?f27koH;L\oS]`an?f27koH;L\oS]`an?f27koH;L\o[kU"
            A$ = A$ + "om_P@ebo22E;o[[Tgm_g:_koN[l^ok]bkn_g:_koN[l^ok]bkn_g:_koN[l^ok]bkn_g:_koN[l^ok]bkn_g:_koN[l^o[KUlm_P"
            A$ = A$ + "@ebo22E;o[[Tgm_h?7loRoL`o;nc1o_h?7loRoL`o;nc1o_h?7loRoL`o;nc1o_h?7loRoL`o;nc1o_h?7loRoL`o[kTim_P@ebo"
            A$ = A$ + "22E;o[[TgmoiEOloWGmaoONe7ooiEOloWGmaoONe7ooiEOloWGmaoONe7ooiEOloWGmaoONe7ooiEOloWGmaoWKTgm_P@ebo22E;"
            A$ = A$ + "o[[TgmojL3mo[c=do_>g@oojL3mo[c=do_>g@oojL3mo[c=do_>g@oojL3mo[c=do_>g@oojL3mo[c=doWKTgm_P@ebo22E;o[[T"
            A$ = A$ + "gmol[?noc_nho?ojSool[?noc_nho?ojSool[?noc_nho?ojSool[?noc_nho?ojSool[?noc_nhoWKTgm_P@ebo22E;o[[TgmOm"
            A$ = A$ + "aWnoe7OjoGOlYoOmaWnoe7OjoGOlYoOmaWnoe7OjoGOlYoOmaWnoe7OjoGOlYoOmaWnoe7OjoWKTgm_P@ebo22E;o[[Tgmomdgno"
            A$ = A$ + "gCOkoO?m]oomdgnogCOkoO?m]oomdgnogCOkoO?m]oomdgnogCOkoO?m]oomdgnogCOkoWKTgm_P@ebo22E;o[[TgmOnh7ooiSOl"
            A$ = A$ + "oW?naoOnh7ooiSOloW?naoOnh7ooiSOloW?naoOnh7ooiSOloW?naoOnh7ooiSOloWKTgm_P@ebo22E;o[[Tgm_njCooj[?mo[_n"
            A$ = A$ + "do_njCooj[?mo[_ndo_njCooj[?mo[_ndo_njCooj[?mo[_ndo_njCooj[?moWKTgm_P@ebo22E;o[[Tgm?olSoolc?noc?oho?o"
            A$ = A$ + "lSoolc?noc?oho?olSoolc?noc?oho?olSoolc?noc?oho?olSoolc?noWKTgm_P@ebo22E;o[[TgmOom_oomgonogOokoOom_oo"
            A$ = A$ + "mgonogOokoOom_oomgonogOokoOom_oomgonogOokoOom_oomgonoWKTgm_P@ebo22E;o[[Tgm_ongoonkOook_omo_ongoonkOo"
            A$ = A$ + "ok_omo_ongoonkOook_omo_ongoonkOook_omo_ongoonkOooWKTgm_P@ebo36e;o[[Tgmooh?oooSoloo?ncoooh?oooSoloo?n"
            A$ = A$ + "coooh?oooSoloo?ncoooh?oooSoloo?ncoooh?oooSoloWKTgmoPAmbo?JFAoS:OOmoomWooogOnooOoiooomWooogOnooOoiooo"
            A$ = A$ + "mWooogOnooOoiooomWooogOnooOoiooomWooogOnokILBm?TXMdo:O;ZoKILBmoPAmbo22E;o;8D]l_P@ebo22E;o;8D]l_P@ebo"
            A$ = A$ + "22E;o;8D]l_P@ebo22E;o;8D]l_P@ebo36U;oG9L@m_bgRjo^W>ioWLa6oOb5Klo9G\aoWLa6oOb5Klo9G\aoWLa6oOb5Klo9G\a"
            A$ = A$ + "oWLa6oOb5Klo9G\aoWLa6oOb5Klo9G\aoWLa6o_kYCno9G\aoooooooooooooooooooooooooooooooooooooooooooooooooooo"
            A$ = A$ + "ooooooooooooooooooooooooooooooooooOb5Klo9G\aoooooooooooooooooooooooooooooooooooooooooooooooooooooooo"
            A$ = A$ + "ooooooooooooooooooooooooooooooOb5Klo9G\aoooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo"
            A$ = A$ + "ooooooooooooooooooooooooooOb5Klo9G\aoooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo"
            A$ = A$ + "ooooooooooooooooooooooOb5Klo9G\aoooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo"
            A$ = A$ + "ooooooooooooooooooOb5Klo9G\aoooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo"
            A$ = A$ + "ooooooooooooooOb5Klo9G\aoooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo"
            A$ = A$ + "ooooooooooOb5Klo9G\aoooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo"
            A$ = A$ + "ooooooOb5Klo9G\aoooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo"
            A$ = A$ + "ooOb5Klo9G\aooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooOb"
            A$ = A$ + "5Klo9G\aooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooOb5Klo"
            A$ = A$ + "9G\aooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooOb5Klo9G\a"
            A$ = A$ + "ooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooOb5Klo9G\aoooo"
            A$ = A$ + "ooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooOb5Klo9G\aoooooooo"
            A$ = A$ + "ooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooOb5Klo9G\aoooooooooooo"
            A$ = A$ + "ooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooOb5Klo9G\aoooooooooooooooo"
            A$ = A$ + "ooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooOb5Klo9G\aoooooooooooooooooooo"
            A$ = A$ + "ooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooOb5Klo9G\aoooooooooooooooooooooooo"
            A$ = A$ + "ooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooOb5Klo^W>ioWLa6oOb5Klo9G\aoWLa6oOb5Klo"
            A$ = A$ + "9G\aoWLa6oOb5Klo9G\aoWLa6oOb5Klo9G\aoWLa6oOb5Klo9G\aoWLa6o_kYCno:O;Zo3[E]l?\Febo`JE;o3[E]l?\Febo`JE;"
            A$ = A$ + "o3[E]l?\Febo`JE;o3[E]l?\Febo`JE;o3[E]l?\Febo`JE;o3[E]l_bgRjo`JE;o?[ORm_jkjgoZ3lRo[>`;n_j0_hoZ3lRo[>`"
            A$ = A$ + ";n_j0_hoZ3lRo[>`;n_j0_hoZ3lRo[>`;n_j0_hoZ_[Oo?[ORmoT]ido`JE;oWMXam?hi>joPWkXo3N^Sn?hi>joPWkXo3N^Sn?h"
            A$ = A$ + "i>joPWkXo3N^Sn?hi>joPWkXo3N^Sn?hi>joPWkXoWMXam?\Febo`JE;o[mXdm?hkNjooSoloo?ncoooh?oooSoloo?ncoooh?oo"
            A$ = A$ + "oSoloo?ncoooh?oooSoloo?ncoooh?ooP_kYo[mXdm?\Febo`JE;oWMXbm?hh6jonkOook_omo_ongoonkOook_omo_ongoonkOo"
            A$ = A$ + "ok_omo_ongoonkOook_omo_ongooPSKXoWMXbm?\Febo`JE;oS=X`m?gefiomgonogOokoOom_oomgonogOokoOom_oomgonogOo"
            A$ = A$ + "koOom_oomgonogOokoOom_ooLG[WoS=X`m?\Febo`JE;oO]W^mOfaViolc?noc?oho?olSoolc?noc?oho?olSoolc?noc?oho?o"
            A$ = A$ + "lSoolc?noc?oho?olSooI7KVoO]W^m?\Febo`JE;oKMW\m_e]Fioj[?mo[_ndo_njCooj[?mo[_ndo_njCooj[?mo[_ndo_njCoo"
            A$ = A$ + "j[?mo[_ndo_njCooFg:UoKMW\m?\Febo`JE;oGmV[mOeZ:ioiSOloW?naoOnh7ooiSOloW?naoOnh7ooiSOloW?naoOnh7ooiSOl"
            A$ = A$ + "oW?naoOnh7ooE[JToGmV[m?\Febo`JE;oC]VYmOdVjhogCOkoO?m]oomdgnogCOkoO?m]oomdgnogCOkoO?m]oomdgnogCOkoO?m"
            A$ = A$ + "]oomdgnoAOZSoC]VYm?\Febo`JE;o;mUUm_cP>hoe7OjoGOlYoOmaWnoe7OjoGOlYoOmaWnoe7OjoGOlYoOmaWnoe7OjoGOlYoOm"
            A$ = A$ + "aWno>3jPo;mUUm?\Febo`JE;o3mTQm?bGZgoc_nho?ojSool[?noc_nho?ojSool[?noc_nho?ojSool[?noc_nho?ojSool[?no"
            A$ = A$ + "8OYNo3mTQm?\Febo`JE;oo\TOm_aCFgo[c=do_>g@oojL3mo[c=do_>g@oojL3mo[c=do_>g@oojL3mo[c=do_>g@oojL3mo6?YM"
            A$ = A$ + "oo\TOm?\Febo`JE;og<TMmo`?6goWGmaoONe7ooiEOloWGmaoONe7ooiEOloWGmaoONe7ooiEOloWGmaoONe7ooiEOlo3oHLog<T"
            A$ = A$ + "Mm?\Febo`JE;oc\SKm?`9^foRoL`o;nc1o_h?7loRoL`o;nc1o_h?7loRoL`o;nc1o_h?7loRoL`o;nc1o_h?7lo0[hJoc\SKm?\"
            A$ = A$ + "Febo`JE;o_LSIm__7NfoN[l^ok]bkn_g:_koN[l^ok]bkn_g:_koN[l^ok]bkn_g:_koN[l^ok]bkn_g:_konNhIo_LSIm?\Febo"
            A$ = A$ + "`JE;o_<SGmO_6>foH;L\oS]`an?f27koH;L\oS]`an?f27koH;L\oS]`an?f27koH;L\oS]`an?f27komJhHo_<SGm?\Febo`JE;"
            A$ = A$ + "o[\REm?_2jeoCgkZo?M_[nodm^joCgkZo?M_[nodm^joCgkZo?M_[nodm^joCgkZo?M_[nodm^jol:XGo[\REm?\Febo`JE;o3kH"
            A$ = A$ + "glO\]mcomJ8IocKPNm?_1jeol6XGocKPNm?_1jeol6XGocKPNm?_1jeol6XGocKPNmO_6BfogFGAo3kHgl?\Febo`JE;o;;IilO\"
            A$ = A$ + "]mcoaff?o7KKolO\]mcoaff?o7KKolO\]mcoaff?o7KKolO\]mcoaff?o7KKolO\]mcoaff?o;KIkl?\Febo:O;Zo3[E]l?\Febo"
            A$ = A$ + "`JE;o3[E]l?\Febo`JE;o3[E]l?\Febo`JE;o3[E]l?\Febo`JE;o3[E]l?\Febo`JE;o3[E]l_bgRjo%%%0"
        Case "checkbox.png"
            A$ = MKI$(13) + MKI$(104)
            A$ = A$ + "0657o3HDLl?PAaao0657o3HDLl?PAaao0657o3HDLl?PAaao0657o3HDLl?PAaao0657o3HDLloeLcmoGc=goO=gLoOfNkmoK3>h"
            A$ = A$ + "ok]hRo_hUGnoUS>joW>k\o?k_ono_7Olo3HDLl?PAaaoGc=goO=gLoOfNkmoK3>hok]hRo_hUGnoUS>joW>k\o?k_ono_7Olo7ol"
            A$ = A$ + "co?PAaao0657oO=gLoOfNkmoK3>hok]hRo_hUGnoUS>joW>k\o?k_ono_7Olo7olco?meGoo0657o3HDLlOfNkmoK3>hok]hRo_h"
            A$ = A$ + "UGnoUS>joW>k\o?k_ono_7Olo7olco?meGoofOomo3HDLl?PAaaoK3>hok]hRo_hUGnoUS>joW>k\o?k_ono_7Olo7olco?meGoo"
            A$ = A$ + "fOomoSOnio?PAaao0657ok]hRo_hUGnoUS>joW>k\o?k_ono_7Olo7olco?meGoofOomoSOnio_nk_oo0657o3HDLl_hUGnoUS>j"
            A$ = A$ + "oW>k\o?k_ono_7Olo7olco?meGoofOomoSOnio_nk_oolgOoo3HDLl?PAaaoUS>joW>k\o?k_ono_7Olo7olco?meGoofOomoSOn"
            A$ = A$ + "io_nk_oolgOook_ono?PAaao0657oW>k\o?k_ono_7Olo7olco?meGoofOomoSOnio_nk_oolgOook_onooooooo0657o3HDLl?k"
            A$ = A$ + "_ono_7Olo7olco?meGoofOomoSOnio_nk_oolgOook_onoooooooooooo3HDLl?PAaao_7Olo7olco?meGoofOomoSOnio_nk_oo"
            A$ = A$ + "lgOook_onooooooooooooooooo?PAaao0657o3HDLl?PAaao0657o3HDLl?PAaao0657o3HDLl?PAaao0657o3HDLl?PAaao0657"
            A$ = A$ + "o3HDLl?PAaao0657o3HDLl?PAaao0657o3HDLl?PAaao0657o3HDLl?PAaao0657o3HDLl?PAaao?3oooKLkoo_^Yooo\B^oocig"
            A$ = A$ + "no?SIgoo4JMoocgdlo?M@coo[alno?6bko?PAaao0657oKLkoo_^Yooo\B^oocigno?SIgoo4JMoocgdlo?M@coo[alno?6bko_F"
            A$ = A$ + "5[oo0657o3HDLl_^Yooo\B^oo?niWoohWOnoSOnio?niWoohWOnoSOnio?niWo_F5[ooD9\no3HDLl?PAaao\B^oocignoohWOno"
            A$ = A$ + "SOnio?niWoohWOnoSOnio?niWoohWOnoD9\nok4`jo?PAaao0657ocigno?SIgooSOnio?niWoohWOnoSOnio?niWoohWOnoSOni"
            A$ = A$ + "ok4`jo?BmVoo0657o3HDLl?SIgoo4JMoo?niWoohWOnoSOnio?niWoohWOnoSOnio?niWo?BmVoo3]Kno3HDLl?PAaao4JMoocgd"
            A$ = A$ + "loohWOnoSOnio?niWoohWOnoSOnio?niWoohWOno3]KnokC^io?PAaao0657ocgdlo?M@cooSOnio?niWoohWOnoSOnio?niWooh"
            A$ = A$ + "WOnoSOniokC^io_>gVoo0657o3HDLl?M@coo[alno?niWoohWOnoSOnio?niWoohWOnoSOnio?niWo_>gVoofH;no3HDLl?PAaao"
            A$ = A$ + "[alno?6bko_F5[ooD9\nok4`jo?BmVoo3]KnokC^io_>gVoofH;no?3]ho?PAaao0657o?6bko_F5[ooD9\nok4`jo?BmVoo3]Kn"
            A$ = A$ + "okC^io_>gVoofH;no?3]ho?<cRoo0657o3HDLl?PAaao0657o3HDLl?PAaao0657o3HDLl?PAaao0657o3HDLl?PAaao0657o3HD"
            A$ = A$ + "Ll?PAaao0657o3HDLl?PAaao0657o3HDLl?PAaao0657o3HDLl?PAaao0657o3HDLl?PAaao0657oO:\`noY`2koW2;\o[j\cnO["
            A$ = A$ + "gNkoa^;_oKK`1oo^6Olo0cLcoGLdBo?bEOmo0657o3HDLloY`2koW2;\o[j\cnO[gNkoa^;_oKK`1oo^6Olo0cLcoGLdBo?bEOmo"
            A$ = A$ + "<[mfo3HDLl?PAaaoW2;\o[j\cnO[gNkoa^;_oKK`1oo^6Olo0cLcoGLdBo?bEOmo<[mfooLgOo?PAaao0657o[j\cnO[gNkoa^;_"
            A$ = A$ + "oKK`1oo^6Olo0cLcoGLdBo?bEOmo<[mfooLgOoodQ?no0657o3HDLlO[gNkoa^;_oKK`1oo^6Olo0cLcoGLdBo?bEOmo<[mfooLg"
            A$ = A$ + "OoodQ?noFG^io3HDLl?PAaaoa^;_oKK`1oo^6Olo0cLcoGLdBo?bEOmo<[mfooLgOoodQ?noFG^ioW=jZo?PAaao0657oKK`1oo^"
            A$ = A$ + "6Olo0cLcoGLdBo?bEOmo<[mfooLgOoodQ?noFG^ioW=jZoof[gno0657o3HDLlo^6Olo0cLcoGLdBo?bEOmo<[mfooLgOoodQ?no"
            A$ = A$ + "FG^ioW=jZoof[gnoMgnko3HDLl?PAaao0cLcoGLdBo?bEOmo<[mfooLgOoodQ?noFG^ioW=jZoof[gnoMgnkoomkao?PAaao0657"
            A$ = A$ + "oGLdBo?bEOmo<[mfooLgOoodQ?noFG^ioW=jZoof[gnoMgnkoomkaoog_7oo0657o3HDLl?bEOmo<[mfooLgOoodQ?noFG^ioW=j"
            A$ = A$ + "Zoof[gnoMgnkoomkaoog_7ooOoNlo3HDLl?PAaao0657o3HDLl?PAaao0657o3HDLl?PAaao0657o3HDLl?PAaao0657o3HDLl?P"
            A$ = A$ + "Aaao9G\aoWLa6oOb5Klo9G\aoWLa6oOb5Klo9G\aoWLa6oOb5Klo9G\aoWLa6oOb5Klo9G\aoWLa6ooooooooooooooooooooooo"
            A$ = A$ + "oooooooooooooooooooooooooooooooooooooWLa6oOb5Klooooooooooooooooooooooooooooooooooooooooooooooooooooo"
            A$ = A$ + "ooooooOb5Klo9G\aoooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo9G\aoWLa6ooooooooooooooo"
            A$ = A$ + "oooooooooooooooooooooooooooooooooooooooooooooWLa6oOb5Klooooooooooooooooooooooooooooooooooooooooooooo"
            A$ = A$ + "ooooooooooooooOb5Klo9G\aoooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo9G\aoWLa6ooooooo"
            A$ = A$ + "oooooooooooooooooooooooooooooooooooooooooooooooooooooWLa6oOb5Klooooooooooooooooooooooooooooooooooooo"
            A$ = A$ + "ooooooooooooooooooooooOb5Klo9G\aoooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo9G\aoWLa"
            A$ = A$ + "6ooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooWLa6oOb5Klooooooooooooooooooooooooooooo"
            A$ = A$ + "ooooooooooooooooooooooooooooooOb5Klo9G\aoWLa6oOb5Klo9G\aoWLa6oOb5Klo9G\aoWLa6oOb5Klo9G\aoWLa6oOb5Klo"
            A$ = A$ + "9G\ao3HDLl?PAaao0657o3HDLl?PAaao0657o3HDLl?PAaao0657o3HDLl?PAaao0657o3HDLl?PAaaoM;^hog]hRoOgR;noO?nh"
            A$ = A$ + "o7NiUoohWOnoV[^joW>k\o?k_ono_7Olo7olco?PAaao0657og]hRoOgR;noO?nho7NiUoohWOnoV[^joW>k\o?k_ono_7Olo7ol"
            A$ = A$ + "cooleGoo0657o3HDLlOgR;noO?nho7NiUoohWOnoV[^joW>k\o?k_ono_7Olo7BXQloleGoofOomo3HDLl?PAaaoO?nho7NiUooh"
            A$ = A$ + "WOnoV[^joW>k\o?k_ono_7Olo7BXQlO8Q6bofOomoSOnio?PAaao0657o7NiUoohWOnoQ4J8oW>k\o?k_ono_7Olo7BXQlO8Q6bo"
            A$ = A$ + "Q4J8oSOnioOnj[oo0657o3HDLlohWOnoV[^jo7BXQlO8Q6bo_7Olo7BXQlO8Q6boQ4J8oSOnioOnj[ookc?oo3HDLl?PAaaoV[^j"
            A$ = A$ + "oW>k\oO8Q6boQ4J8o7BXQlO8Q6boQ4J8oSOnioOnj[ookc?oogOomo?PAaao0657oW>k\o?k_ono_7Olo7BXQlO8Q6boQ4J8oSOn"
            A$ = A$ + "ioOnj[ookc?oogOomo_onkoo0657o3HDLl?k_ono_7Olo7olcooleGooQ4J8oSOnioOnj[ookc?oogOomo_onkooooooo3HDLl?P"
            A$ = A$ + "Aaao_7Olo7olcooleGoofOomoSOnioOnj[ookc?oogOomo_onkoooooooooooo?PAaao0657o7olcooleGoofOomoSOnioOnj[oo"
            A$ = A$ + "kc?oogOomo_onkoooooooooooooooooo0657o3HDLl?PAaao0657o3HDLl?PAaao0657o3HDLl?PAaao0657o3HDLl?PAaao0657"
            A$ = A$ + "o3HDLl?PAaao0657o3HDLl?PAaao0657o3HDLl?PAaao0657o3HDLl?PAaao0657o3HDLl?PAaao0657oo<loo_a]ooojVnooc:i"
            A$ = A$ + "no?WOkoo<VMooW8fmoOUKgooGbMooOXelo_J:_oo0657o3HDLl_a]ooojVnooc:ino?WOkoo<VMooW8fmoOUKgoo\>NooK[imo_X"
            A$ = A$ + "Ngooj1mno3HDLl?PAaaomZnoocKjnoOmgOoodK_mo??mdo?mfKoogS?noW_njoO8Q6bo^>Noo3Xdko?PAaao0657ocKjno?a\koo"
            A$ = A$ + "i[_noO?nho?mfKoogS?noW_njoO8Q6boQ4J8o_JhmooN@_oo0657o3HDLlO]Wkoo7c^oo7BXQlOnj[oogS?noW_njoO8Q6boQ4J8"
            A$ = A$ + "o7BXQl?ZPgoogilno3HDLl?PAaaoY>^oo?ljnoO8Q6boQ4J8oW_njoO8Q6boQ4J8o7BXQlOnj[ooBRmnoO6bjo?PAaao0657o?:h"
            A$ = A$ + "noo_YkooQ4J8o7BXQlO8Q6boQ4J8o7BXQlOnj[oogS?noO6bjo_AlVoo0657o3HDLlOUKgoo\>NooW_njoO8Q6boQ4J8o7BXQlOn"
            A$ = A$ + "j[oogS?noC_mfo_AlVoojLKno3HDLl?PAaaoj9=ooOXeloomhSooi[_no7BXQlOnj[oogS?noC_mfooldCoojLKnoKS]ho?PAaao"
            A$ = A$ + "0657o_6cko_J:_ooj1mnoWiflo?ZPgooBRmnoO6bjo_AlVoojLKnoKS]hoo<dRoo0657o3HDLloH8_ooJE\no_Eajo?L<_oogiln"
            A$ = A$ + "oO6bjo_AlVoojLKnoKS]hoo<dRoo`<;no3HDLl?PAaao0657o3HDLl?PAaao0657o3HDLl?PAaao0657o3HDLl?PAaao0657o3HD"
            A$ = A$ + "Ll?PAaao0657o3HDLl?PAaao0657o3HDLl?PAaao0657o3HDLl?PAaao0657o3HDLl?PAaao0657o3HDLloY`2koW2;\oO:\`n_Z"
            A$ = A$ + "c>ko]Nk]o7k^ln_]17lokJlao3<c=oOaA;mo8Gmeo3HDLl?PAaaoW2;\oO:\`n_Zc>ko]Nk]o7k^ln_]17lokJlao3<c=oOaA;mo"
            A$ = A$ + "8Gmeoc\fKo?PAaao0657oO:\`n_Zc>ko]Nk]o7k^ln_]17lokJlao3<c=oOaA;moJH87oc\fKoocMomo0657o3HDLl_Zc>ko]Nk]"
            A$ = A$ + "o7k^ln_]17lokJlao3<c=oOaA;moJH87o[QRLlocMomoC7nho3HDLl?PAaao]Nk]o7k^ln?6jUaokJlao3<c=oOaA;moJH87o[QR"
            A$ = A$ + "Llo6<faoC7nhoKMiVo?PAaao0657o7k^ln_]17loHdW6oWAPKlOaA;moJH87o[QRLlo6<faoC7nhoKMiVoOfX[no0657o3HDLl_]"
            A$ = A$ + "17lokJlaoWAPKlO64^aoJH87o[QRLlo6<faoC7nhoKMiVoOfX[noK_Nko3HDLl?PAaaokJlao3<c=oOaA;moJH87o[QRLlo6<fao"
            A$ = A$ + "C7nhoKMiVoOfX[noK_NkogMk_o?PAaao0657o3<c=oOaA;mo8Gmeoc\fKoo6<faoC7nhoKMiVoOfX[noK_NkogMk_oog_7oo0657"
            A$ = A$ + "o3HDLlOaA;mo8Gmeoc\fKoocMomoC7nhoKMiVoOfX[noK_NkogMk_oog_7ooOoNlo3HDLl?PAaao8Gmeoc\fKoocMomoC7nhoKMi"
            A$ = A$ + "VoOfX[noK_NkogMk_oog_7ooOoNloomkao?PAaao0657o3HDLl?PAaao0657o3HDLl?PAaao0657o3HDLl?PAaao0657o3HDLl?P"
            A$ = A$ + "Aaao0657oWLa6oOb5Klo9G\aoWLa6oOb5Klo9G\aoWLa6oOb5Klo9G\aoWLa6oOb5Klo9G\aoWLa6oOb5Klooooooooooooooooo"
            A$ = A$ + "ooooooooooooooooooooooooooooooooooooooooooOb5Klo9G\aoooooooooooooooooooooooooooooooooooooooooooooooo"
            A$ = A$ + "oooooooooooo9G\aoWLa6ooooooooooooooooooooooooooooooooooooooooooooWLa6ooooooooooooWLa6oOb5Klooooooooo"
            A$ = A$ + "oooooooooooooooooooooooooooooWLa6oOb5KloooooooooooOb5Klo9G\aoooooooooooo9G\aoooooooooooooooooWLa6oOb"
            A$ = A$ + "5Klo9G\aoooooooooooo9G\aoWLa6ooooooooooooWLa6oOb5KlooooooWLa6oOb5Klo9G\aoooooooooooooooooWLa6oOb5Klo"
            A$ = A$ + "ooooooooooOb5Klo9G\aoWLa6oOb5Klo9G\aooooooooooooooooooooooOb5Klo9G\aoooooooooooooooooWLa6oOb5Klo9G\a"
            A$ = A$ + "oooooooooooooooooooooooooooo9G\aoWLa6ooooooooooooooooooooooo9G\aoooooooooooooooooooooooooooooooooWLa"
            A$ = A$ + "6oOb5KloooooooooooooooooooooooooooooooooooooooooooooooooooooooooooOb5Klo9G\aoooooooooooooooooooooooo"
            A$ = A$ + "oooooooooooooooooooooooooooooooooooo9G\aoWLa6oOb5Klo9G\aoWLa6oOb5Klo9G\aoWLa6oOb5Klo9G\aoWLa6oOb5Klo"
            A$ = A$ + "9G\aoWLa%6o?"
        Case "notfound.png"
            A$ = MKI$(40) + MKI$(48)
            A$ = A$ + "S=fHnS6JXM?JXQfmXQ6JgS6JXM?JXQfmXQ6JgS6JXM?JXQfmXQ6JgS6JXM?JXQfmXQ6JgS6JXM?JXQfmXQ6JgS6JXM?JXQfmXQ6J"
            A$ = A$ + "gS6JXM?JXQfmXQ6JgS6JXM?JXQfmXQ6JgS6JXM?JXQfmVIVIkWFJYi4000000000000000000000000000000000000000000000"
            A$ = A$ + "0000000000000XVJZIoooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo"
            A$ = A$ + "ooooooooooooooooooooooooooooooooooooooooooooooooooooooooo7GLam?L`1glUEFI>100000000000000000000000000"
            A$ = A$ + "00000000000000000000000000PJZYVmoooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo"
            A$ = A$ + "oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo?MdAgoTC>io37L`9oIWMFC00000000"
            A$ = A$ + "0000000000000000000000000000000000000000ZYVJfooooooooooooooooooooooooooooooooooooooooooooooooooooooo"
            A$ = A$ + "oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooodA7Mo[_njo?jXSno"
            A$ = A$ + "`17LbGFIUa4000000000000000000000000000000000000000000XVJZIoooooooooooooooooooooooooooooooooooooooooo"
            A$ = A$ + "oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooC7M"
            A$ = A$ + "dm_nj[oooooooOniWo?L`1WlUEFI<1000000000000000000000000000000000000PJZYVmoooooooooooooooooooooooooooo"
            A$ = A$ + "oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo"
            A$ = A$ + "oooooooooo?MdAgoj[_nooooooooooooWOnio37L`5?ITAFA00000000000000000000000000000000ZYVJfooooooooooooooo"
            A$ = A$ + "oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo"
            A$ = A$ + "oooooooooooooooooooooooodA7Mo[_njooooooooooooooooooiWOno`17LaGFIUA400000000000000000000000000XVJZIoo"
            A$ = A$ + "oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo"
            A$ = A$ + "oooooooooooooooooooooooooooooooooooooC7Mdm_nj[oooooooooooooooooooooooOniWo?L`17lS=fH3100000000000000"
            A$ = A$ + "000000PJZYVmoooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo"
            A$ = A$ + "oooooooooooooooooooooooooooooooooooooooooooooooooo?MdAgoj[_nooooooooooooooooooooooooooooWOnioofK_5?I"
            A$ = A$ + "TAV@0000000000000000ZYVJfooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo"
            A$ = A$ + "oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooodA7Mo[_njooooooooooooooooooooooooooo"
            A$ = A$ + "ooooooohS?no^iVKb;VHR540000000000XVJZIoooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo"
            A$ = A$ + "oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooC7Mdm_nj[oooooooooooooo"
            A$ = A$ + "ooooooooooooooooooooooooo;^hRo_K^iVlR9VH110000PJZYVmoooooooooooooooooooooooooooooooooooooooooooooooo"
            A$ = A$ + "oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo?MdAgoj[_n"
            A$ = A$ + "ooooooooooooooooooooooooooooooooooooooooooooR;^hokVK^9?ITA6@ZYVJfooooooooooooooooooooooooooooooooooo"
            A$ = A$ + "oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo"
            A$ = A$ + "ooooomgOogFK]mOK]efo]eFKogFK]mOK]efo]eFKogFK]mOK]efo]eFKogFK]moJ[]foVIVIj[VJZIoooooooooooooooooooooo"
            A$ = A$ + "oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo"
            A$ = A$ + "ooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo[VJZI_JZYVmoooooooo"
            A$ = A$ + "oooooooooooooooooooooooooooooooooo_mfKooQ7Nho7NhQoOhQ7noQ7Nho7NhQoOhQ7noQ7Nho7NhQoOhQ7noQ7Nho7NhQoOh"
            A$ = A$ + "Q7noQ7Nho7NhQoOhQ7noQ7Nho7NhQoOhQ7noQ7Nho7NhQo_mfKoooooooooooooooooooooooooooooooooooooooooooo_JZYVm"
            A$ = A$ + "ZYVJfoooooooooooooooooooooooooooooooooooooooooooFK]eoWK^in_b:[lo:[\bo[\b:o_b:[lo:[\bo[\b:o_b:[lo:[\b"
            A$ = A$ + "o[\b:o_b:[lo:[\bo[\b:o_b:[lo:[\bo[\b:o_b:[lo:[\bo[\b:oO^iVkoFK]eoooooooooooooooooooooooooooooooooooo"
            A$ = A$ + "ooooooooZYVJf[VJZIoooooooooooooooooooooooooooooooooooooooooooK]eFo_eFKmooooooooooooooooooooooooooooo"
            A$ = A$ + "ooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooFK]eoK]eFooooooooooooooooooooooo"
            A$ = A$ + "ooooooooooooooooooooo[VJZI_JZYVmoooooooooooooooooooooooooooooooooooooooooo_eFKmoFK]eoooooooooooooooo"
            A$ = A$ + "oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooK]eFo_eFKmooooooooo"
            A$ = A$ + "oooooooooooooooooooooooooooooooooo_JZYVmZYVJfoooooooooooooooooooooooooooooooooooooooooooFK]eoK]eFooo"
            A$ = A$ + "oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo_eFKmo"
            A$ = A$ + "FK]eooooooooooooooooooooooooooooooooooooooooooooZYVJf[VJZIoooooooooooooooooooooooooooooooooooooooooo"
            A$ = A$ + "oK]eFo_eFKmooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo"
            A$ = A$ + "ooooooooFK]eoK]eFoooooooooooooooooooooooooooooooooooooooooooo[VJZI_JZYVmoooooooooooooooooooooooooooo"
            A$ = A$ + "oooooooooooooo_eFKmoFK]eoooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo"
            A$ = A$ + "oooooooooooooooooooooK]eFo_eFKmooooooooooooooooooooooooooooooooooooooooooo_JZYVmZYVJfooooooooooooooo"
            A$ = A$ + "ooooooooooooooooooooooooooooFK]eoK]eFooooooooooooooooo_lbgooc=WkoC=ejooooooooooooooooooooooooooooooo"
            A$ = A$ + "oo?eD[ooc=Wko;_lmooooooooooooooooo_eFKmoFK]eooooooooooooooooooooooooooooooooooooooooooooZYVJf[VJZIoo"
            A$ = A$ + "oooooooooooooooooooooooooooooooooooooooooK]eFo_eFKmooooooooooooooooo5G<no300PoO5E<noB;]noooooooooooo"
            A$ = A$ + "oooooooooo_dB[ooEDaho300PoOa5SooooooooooooooooooFK]eoK]eFooooooooooooooooooooooooooooooooooooooooooo"
            A$ = A$ + "o[VJZI_JZYVmoooooooooooooooooooooooooooooooooooooooooo_eFKmoFK]eoooooooooooooooooooooooNkmno000hoGA5"
            A$ = A$ + "SoodC[ooooooooooooodC[ooEDaho300PooNkmnooooooooooooooooooooooK]eFo_eFKmooooooooooooooooooooooooooooo"
            A$ = A$ + "oooooooooooooo_JZYVmZYVJfoooooooooooooooooooooooooooooooooooooooooooFK]eoK]eFooooooooooooooooooooooo"
            A$ = A$ + "oooooc7O_o?000noEDaho?mdjooeG[ooHPaho300Po?Mdinooooooooooooooooooooooooooo_eFKmoFK]eoooooooooooooooo"
            A$ = A$ + "ooooooooooooooooooooooooooooZYVJf[VJZIoooooooooooooooooooooooooooooooooooooooooooK]eFo_eFKmooooooooo"
            A$ = A$ + "ooooooooooooooooooooooook]gko300Poo4C8noEDaho300PooLcinoooooooooooooooooooooooooooooooooFK]eoK]eFooo"
            A$ = A$ + "ooooooooooooooooooooooooooooooooooooooooo[VJZI_JZYVmoooooooooooooooooooooooooooooooooooooooooo_eFKmo"
            A$ = A$ + "FK]eoooooooooooooooooooooooooooooooooooooooIWano000ho300PooGOanooooooooooooooooooooooooooooooooooooo"
            A$ = A$ + "oK]eFo_eFKmooooooooooooooooooooooooooooooooooooooooooo_JZYVmZYVJfooooooooooooooooooooooooooooooooooo"
            A$ = A$ + "ooooooooFK]eoK]eFoooooooooooooooooooooooooooooooooOfI[ooJXaho300Po?000noFHahoC=ejooooooooooooooooooo"
            A$ = A$ + "oooooooooooooo_eFKmoFK]eooooooooooooooooooooooooooooooooooooooooooooZYVJf[VJZIoooooooooooooooooooooo"
            A$ = A$ + "oooooooooooooooooooooK]eFo_eFKmoooooooooooooooooooooooooooOfI[ooJXaho300Po?L`inoiUgko300Poo5G<noEG]n"
            A$ = A$ + "ooooooooooooooooooooooooooooFK]eoK]eFoooooooooooooooooooooooooooooooooooooooooooo[VJZI_JZYVmoooooooo"
            A$ = A$ + "oooooooooooooooooooooooooooooooooo_eFKmoFK]eoooooooooooooooooooooo_fJ[ooJXaho300Po?L`inooooooooooo?N"
            A$ = A$ + "hmno000hoOa5SoOeE[oooooooooooooooooooooooK]eFo_eFKmooooooooooooooooooooooooooooooooooooooooooo_JZYVm"
            A$ = A$ + "ZYVJfoooooooooooooooooooooooooooooooooooooooooooFK]eoK]eFooooooooooooooooo?jXcooJXaho300PooK_enooooo"
            A$ = A$ + "ooooooooooooooooo37L^o?000noJXahoOnilooooooooooooooooo_eFKmoFK]eoooooooooooooooooooooooooooooooooooo"
            A$ = A$ + "ooooooooZYVJf[VJZIoooooooooooooooooooooooooooooooooooooooooooK]eFo_eFKmoooooooooooooooooA7MnoG@1Qo?L"
            A$ = A$ + "`inonkoooooooooooooooooooooooo_onoooa5WkoG@1Qo?d@WooooooooooooooooooFK]eoK]eFooooooooooooooooooooooo"
            A$ = A$ + "ooooooooooooooooooooo[VJZI_JZYVmoooooooooooooooooooooooooooooooooooooooooo_eFKmoFK]eoooooooooooooooo"
            A$ = A$ + "oooooo_mfkoooooooooooooooooooooooooooooooooooooooooooo_mfkoooooooooooooooooooooooK]eFo_eFKmooooooooo"
            A$ = A$ + "oooooooooooooooooooooooooooooooooo_JZYVmZYVJfoooooooooooooooooooooooooooooooooooooooooooFK]eoK]eFooo"
            A$ = A$ + "oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo_eFKmo"
            A$ = A$ + "FK]eooooooooooooooooooooooooooooooooooooooooooooZYVJf[VJZIoooooooooooooooooooooooooooooooooooooooooo"
            A$ = A$ + "oK]eFo_eFKmooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo"
            A$ = A$ + "ooooooooFK]eoK]eFoooooooooooooooooooooooooooooooooooooooooooo[VJZI_JZYVmoooooooooooooooooooooooooooo"
            A$ = A$ + "oooooooooooooo_eFKmoFK]eoooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo"
            A$ = A$ + "oooooooooooooooooooooK]eFo_eFKmooooooooooooooooooooooooooooooooooooooooooo_JZYVmZYVJfooooooooooooooo"
            A$ = A$ + "ooooooooooooooooooooooooooooFK]eoK]eFooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo"
            A$ = A$ + "oooooooooooooooooooooooooooooooooo_eFKmoFK]eooooooooooooooooooooooooooooooooooooooooooooZYVJf[VJZIoo"
            A$ = A$ + "oooooooooooooooooooooooooooooooooooooooooK]eFo?d@3moc?olo?olcoolc?ooc?olo?olcoolc?ooc?olo?olcoolc?oo"
            A$ = A$ + "c?olo?olcoolc?ooc?olo?olcoolc?ooc?olo?olcoolc?oo@3=doK]eFooooooooooooooooooooooooooooooooooooooooooo"
            A$ = A$ + "o[VJZI_JZYVmoooooooooooooooooooooooooooooooooooooooooo_hR;nohR;^oS;^hn?^hRkohR;^oS;^hn?^hRkohR;^oS;^"
            A$ = A$ + "hn?^hRkohR;^oS;^hn?^hRkohR;^oS;^hn?^hRkohR;^oS;^hn?^hRkohR;^oS;^hn_hR;nooooooooooooooooooooooooooooo"
            A$ = A$ + "oooooooooooooo_JZYVmZYVJfooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo"
            A$ = A$ + "oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo"
            A$ = A$ + "ooooooooooooooooooooooooooooZYVJf[VJZIoooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo"
            A$ = A$ + "oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo"
            A$ = A$ + "ooooooooooooooooooooooooooooooooooooooooo[VJZI_JZYVmoooooooooooooooooooooooooooooooooooooooooooooooo"
            A$ = A$ + "oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo"
            A$ = A$ + "oooooooooooooooooooooooooooooooooooooooooooooooooooooo_JZYVmZYVJfooooooooooooooooooooooooooooooooooo"
            A$ = A$ + "oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo"
            A$ = A$ + "ooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooZYVJf[VJZIoooooooooooooooooooooo"
            A$ = A$ + "oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo"
            A$ = A$ + "ooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo[VJZI_JZYVmoooooooo"
            A$ = A$ + "oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo"
            A$ = A$ + "oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo_JZYVm"
            A$ = A$ + "ZYVJfooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo"
            A$ = A$ + "oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo"
            A$ = A$ + "ooooooooZYVJf[VJZIoooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo"
            A$ = A$ + "oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo"
            A$ = A$ + "ooooooooooooooooooooo[VJZIoHS=VoXQ6JgS6JXM?JXQfmXQ6JgS6JXM?JXQfmXQ6JgS6JXM?JXQfmXQ6JgS6JXM?JXQfmXQ6J"
            A$ = A$ + "gS6JXM?JXQfmXQ6JgS6JXM?JXQfmXQ6JgS6JXM?JXQfmXQ6JgS6JXM?JXQfmXQ6JgS6JXM?JXQfmXQ6JgS6JXM?JXQfmXQ6JgS6J"
            A$ = A$ + "XM?JXQfmXQ6JgS6JXM?JXQfmXQ6JgS6JXMoHS=Vo%%%0"
        Case "sliderdown.png"
            A$ = MKI$(11) + MKI$(105)
            A$ = A$ + "o3`oo?mbnnOc5Kko=CL]og<aenOc4Gko=CL]og<aen?bonjon:kWoo?0oood;kkoa6]YokFd_mOI>OfoTi\IoCVcVm?I>KfoQe\H"
            A$ = A$ + "o?d`5m_M\>foVZiQogLafn_KAofoRelHoODa9m_A4Odo6AlAoK4a7mo@3GdoOLK8oc1YMlOV>fgo=CL]oGVcWmoA5WdoSTK9oo1^"
            A$ = A$ + "Qlo7h6boOPK8oo1^Ql?7WjaoIHi6o;9RgmOc4GkoQ?=eooooooOla7ooPC=eo7ndDo?hDCmoBK\ao;]a6o?afNkoBRhMog<aenOh"
            A$ = A$ + "CCmoooooo7Olao?hDCmoQ?=eo3>eDo_d6KloBK\aoC\]gn_T8Ngo=CL]o7ndDoooooooa7Olo3>eDoOhCCmoPC=eo;]a6o_d6Klo"
            A$ = A$ + "4Kk]o;9RgmOc4GkoQ?=eooooooOla7ooPC=eo7ndDo?hDCmoBK\ao;]a6o?afNkoBRhMog<aenOhCCmoooooo7Olao?hDCmoQ?=e"
            A$ = A$ + "o3>eDo_d6KloBK\aoC\]gn_T8Ngo=CL]o7ndDoooooooa7Olo3>eDoOhCCmoPC=eo;]a6o_d6Klo4Kk]o;9RgmOc4GkoQ?=eoooo"
            A$ = A$ + "ooOla7ooPC=eo7ndDo?hDCmoBK\ao;]a6o?afNkoBRhMog<aenOhCCmoooooo7Olao?hDCmoQ?=eo3>eDo_d6KloBK\aoC\]gn_T"
            A$ = A$ + "8Ngo=CL]o7ndDoooooooa7Olo3>eDoOhCCmoPC=eo;]a6o_d6Klo4Kk]o;9RgmOc4GkoQ?=eo7ndDoooooooPC=eo3>eDo?hDCmo"
            A$ = A$ + "]ONio7ndDo?afNkoBRhMoSl__nOB5_doQ?=eo7ndDoooooooPC=eogniUoOhCCmo4Kk]oWaTJloT9Rgon:kWo_G\Ymo7h6boQ?=e"
            A$ = A$ + "o7ndDoooooooQ?=eoC\]gn?6AZaoJA8CoghPbmoo0loobJJToK7[Smo7f6boQ?=eo7ndDo?afNkoH4Y6oWUP;m?Rnifoo3`ooo?0"
            A$ = A$ + "oooo0loobJJToK7[Smo7f6boQ?=eoSATJlOF2^do8jWKoo?0oooo0looo3`ooo?0oooo0loobJJToK7[Smo6RfaoI9hBoSXO^moo"
            A$ = A$ + "0looo3`ooo?0oooo0looo3`ooo?0oooo0loobJJToS6VHm?Rnifoo3`ooo?0oooo0looo3`ooo?0oooo0looo3`ooo?0oooo0loo"
            A$ = A$ + "N:9Poo?0oooo0looo3`ooo?0oooo0looo3`oo?mbnnOc5Kko=CL]og<aenOc4Gko=CL]og<aen?bonjon:kWoo?0oood;kkof2Mf"
            A$ = A$ + "ocWcko?M<_ood]lnoCgbko?M;_oo`YlnoG5`jooO[^koVZiQogLafn?O>_ooaYlnoWU`jo?F1[ooH5\noSE`joOE0[ooe<kmoo2X"
            A$ = A$ + "NoOV>fgo=CL]oC7ckoOF2[ooiDKnoG3]ioO=dVooe@KnoG3]io?<T>no[<ibo;9RgmOc4GkoQ?=eooooooOla7ooPC=eo7ndDo?h"
            A$ = A$ + "DCmoBK\ao;]a6o?afNkoBRhMog<aenOhCCmoooooo7Olao?hDCmoQ?=eo3>eDo_d6KloBK\aoC\]gn_T8Ngo=CL]o7ndDooooooo"
            A$ = A$ + "a7Olo3>eDoOhCCmoPC=eo;]a6o_d6Klo4Kk]o;9RgmOc4GkoQ?=eooooooOla7ooPC=eo7ndDo?hDCmoBK\ao;]a6o?afNkoBRhM"
            A$ = A$ + "og<aenOhCCmoooooo7Olao?hDCmoQ?=eo3>eDo_d6KloBK\aoC\]gn_T8Ngo=CL]o7ndDoooooooa7Olo3>eDoOhCCmoPC=eo;]a"
            A$ = A$ + "6o_d6Klo4Kk]o;9RgmOc4GkoQ?=eooooooOla7ooPC=eo7ndDo?hDCmoBK\ao;]a6o?afNkoBRhMog<aenOhCCmoooooo7Olao?h"
            A$ = A$ + "DCmoQ?=eo3>eDo_d6KloBK\aoC\]gn_T8Ngo=CL]o7ndDoooooooa7Olo3>eDoOhCCmoPC=eo;]a6o_d6Klo4Kk]o;9RgmOc4Gko"
            A$ = A$ + "Q?=eo7ndDoooooooPC=eo3>eDo?hDCmo]ONio7ndDo?afNkoBRhMoSl__noF2[ooQ?=eo7ndDoooooooPC=eogniUoOhCCmo4Kk]"
            A$ = A$ + "o[2T7ooT9Rgon:kWoC8\0oO=dVooQ?=eo7ndDoooooooQ?=eoC\]gn_:>BloQ=hSoghPbmoo0loobJJTokgZjn?=bJooQ?=eo7nd"
            A$ = A$ + "Do?afNkoZh8ao3VP>n?Rnifoo3`ooo?0oooo0loobJJTokgZjn?=bJooQ?=eo[RS4o?H2jho8jWKoo?0oooo0looo3`ooo?0oooo"
            A$ = A$ + "0loobJJTokgZjno;N^moP9XSoSXO^moo0looo3`ooo?0oooo0looo3`ooo?0oooo0loobJJTo3gUUn?Rnifoo3`ooo?0oooo0loo"
            A$ = A$ + "o3`ooo?0oooo0looo3`ooo?0oooo0looN:9Poo?0oooo0looo3`ooo?0oooo0looo3`oo?mbnnOc5Kko=CL]og<aenOc4Gko=CL]"
            A$ = A$ + "og<aen?bonjon:kWoo?0oood;kko]R\YoKV^`m?GfNfoKI[Io_U]VmoFfJfoHAkHoSSY6m?LN>foVZiQogLafn_Ij2goIE;Iog3Z"
            A$ = A$ + ":mo>WRdokL:Bo_cY8m?>VJdoB@Y8o3AQNlOV>fgo=CL]ocU]WmO?XZdoGLY9o;AURl_4E:boBDY8o;AURl?48nao?X77o;9RgmOc"
            A$ = A$ + "4GkoQ?=eooooooOla7ooPC=eo7ndDo?hDCmoBK\ao;]a6o?afNkoBRhMog<aenOhCCmoooooo7Olao?hDCmoQ?=eo3>eDo_d6Klo"
            A$ = A$ + "BK\aoC\]gn_T8Ngo=CL]o7ndDoooooooa7Olo3>eDoOhCCmoPC=eo;]a6o_d6Klo4Kk]o;9RgmOc4GkoQ?=eooooooOla7ooPC=e"
            A$ = A$ + "o7ndDo?hDCmoBK\ao;]a6o?afNkoBRhMog<aenOhCCmoooooo7Olao?hDCmoQ?=eo3>eDo_d6KloBK\aoC\]gn_T8Ngo=CL]o7nd"
            A$ = A$ + "Doooooooa7Olo3>eDoOhCCmoPC=eo;]a6o_d6Klo4Kk]o;9RgmOc4GkoQ?=eooooooOla7ooPC=eo7ndDo?hDCmoBK\ao;]a6o?a"
            A$ = A$ + "fNkoBRhMog<aenOhCCmoooooo7Olao?hDCmoQ?=eo3>eDo_d6KloBK\aoC\]gn_T8Ngo=CL]o7ndDoooooooa7Olo3>eDoOhCCmo"
            A$ = A$ + "PC=eo;]a6o_d6Klo4Kk]o;9RgmOc4GkoQ?=eo7ndDoooooooPC=eo3>eDo?hDCmo]ONio7ndDo?afNkoBRhMoSl__no?YbdoQ?=e"
            A$ = A$ + "o7ndDoooooooPC=eogniUoOhCCmo4Kk]ok`MKloT9Rgon:kWoGgXYm_4E:boQ?=eo7ndDoooooooQ?=eoC\]gn_3e]aoFU7CoghP"
            A$ = A$ + "bmoo0loobJJTo3WWSm_4C:boQ?=eo7ndDo?afNko>Dg6oG5N;m?Rnifoo3`ooo?0oooo0loobJJTo3WWSm_4C:boQ?=eok@MKlOE"
            A$ = A$ + "h]do8jWKoo?0oooo0looo3`ooo?0oooo0loobJJTo3WWSm?43jaoEQgBoSXO^moo0looo3`ooo?0oooo0looo3`ooo?0oooo0loo"
            A$ = A$ + "bJJTo?6SHm?Rnifoo3`ooo?0oooo0looo3`ooo?0oooo0looo3`ooo?0oooo0looN:9Poo?0oooo0looo3`ooo?0oooo0looo3`o"
            A$ = A$ + "o?mbnnOc5Kko=CL]og<aenOc4Gko=CL]og<aen?bonjon:kWoo?0oood;kkof2MfocWcko?M<_ood]lnoCgbko?M;_oo`YlnoG5`"
            A$ = A$ + "jooO[^koVZiQogLafn?O>_ooaYlnoWU`jo?F1[ooH5\noSE`joOE0[ooe<kmoo2XNoOV>fgo=CL]oC7ckoOF2[ooiDKnoG3]ioO="
            A$ = A$ + "dVooe@KnoG3]io?<T>no[<ibo;9RgmOc4GkoQ?=eooooooOla7ooPC=eo7ndDo?hDCmoBK\ao;]a6o?afNkoBRhMog<aenOhCCmo"
            A$ = A$ + "ooooo7Olao?hDCmoQ?=eo3>eDo_d6KloBK\aoC\]gn_T8Ngo=CL]o7ndDoooooooa7Olo3>eDoOhCCmoPC=eo;]a6o_d6Klo4Kk]"
            A$ = A$ + "o;9RgmOc4GkoQ?=eooooooOla7ooPC=eo7ndDo?hDCmoBK\ao;]a6o?afNkoBRhMog<aenOhCCmoooooo7Olao?hDCmoQ?=eo3>e"
            A$ = A$ + "Do_d6KloBK\aoC\]gn_T8Ngo=CL]o7ndDoooooooa7Olo3>eDoOhCCmoPC=eo;]a6o_d6Klo4Kk]o;9RgmOc4GkoQ?=eooooooOl"
            A$ = A$ + "a7ooPC=eo7ndDo?hDCmoBK\ao;]a6o?afNkoBRhMog<aenOhCCmoooooo7Olao?hDCmoQ?=eo3>eDo_d6KloBK\aoC\]gn_T8Ngo"
            A$ = A$ + "=CL]o7ndDoooooooa7Olo3>eDoOhCCmoPC=eo;]a6o_d6Klo4Kk]o;9RgmOc4GkoQ?=eo7ndDoooooooPC=eo3>eDo?hDCmo]ONi"
            A$ = A$ + "o7ndDo?afNkoBRhMoSl__noF2[ooQ?=eo7ndDoooooooPC=eogniUoOhCCmo4Kk]o[2T7ooT9Rgon:kWoC8\0oO=dVooQ?=eo7nd"
            A$ = A$ + "DoooooooQ?=eoC\]gn_:>BloQ=hSoghPbmoo0loobJJTokgZjn?=bJooQ?=eo7ndDo?afNkoZh8ao3VP>n?Rnifoo3`ooo?0oooo"
            A$ = A$ + "0loobJJTokgZjn?=bJooQ?=eo[RS4o?H2jho8jWKoo?0oooo0looo3`ooo?0oooo0loobJJTokgZjno;N^moP9XSoSXO^moo0loo"
            A$ = A$ + "o3`ooo?0oooo0looo3`ooo?0oooo0loobJJTo3gUUn?Rnifoo3`ooo?0oooo0looo3`ooo?0oooo0looo3`ooo?0oooo0looN:9P"
            A$ = A$ + "oo?0oooo0looo3`ooo?0oooo0looo3`oo[\eIooaDOmo6C]eoK<eFo_aDKmo6C]eoK<eFo?aBGmoojLdoo?0oo_bFWmo;G=foO\d"
            A$ = A$ + "Co_aA;mo63]doK<dBo_a@;mo53]do3<c>o_^7[loeF<boO<eGooaB?mo53]do7<c>o?`<klo0c\co3<c>o?`<kloiJ<bo;[_0o?\"
            A$ = A$ + "o:lo6C]eok^mgo?keKooZCOmo[>meo_jdGooZCOmo[>meo_h[cnoI?>iog:_on_aDKmo^KomocNmfo_jdGooZCOmo[>meo_jdGoo"
            A$ = A$ + "ZCOmo;nj\oOfR?no]bk_oK<eFo_kfOoo\G_mo[>meo_jdGooZCOmo[>meo_jdGooR_>koW]hSoO[lnko6C]eok^mgo?keKooZCOm"
            A$ = A$ + "o[>meo_jdGooZCOmo[>meo_h[cnoI;nhog:_on_aDKmo^KomocNmfo_jdGooZCOmo[>meo_jdGooZCOmo;nj\oOfR?no]bk_oK<e"
            A$ = A$ + "Fo_kfOoo\G_mo[>meo_jdGooZCOmo[>meo_jdGooR_>koW]hSoO[lnko6C]eok^mgo?keKooZCOmo[>meo_jdGooZCOmo[>meo_h"
            A$ = A$ + "[cnoI;nhog:_on_aDKmo^KomocNmfo_jdGooZCOmo[>meo_jdGooZCOmo;nj\oOfR?no]bk_oK<eFo_kfOoo\G_mo[>meo_jdGoo"
            A$ = A$ + "ZCOmo[>meo_jdGooR_>koW]hSoO[lnko6C]eok^mgo?keKooZCOmo[>meo_jdGooZCOmo[>meo_h[cnoI;nhog:_on_aDKmo]Kom"
            A$ = A$ + "ocNmfo_jdGooZCOmo[>meo_jdGooY??mo7^j[oOfR?no]bk_oC\dEo?keKoo[G_mo[>meo_jdGooZCOmoWnldoOi_3ooLKnioSMh"
            A$ = A$ + "RoO[lnkoojLdoc[b=o_jdGooY??mo[>meoOjcCooUo>logmiXooeP7noYJK^o_J^lnoo0loojV<co[ka:oOjcCooY??moGnk`oOg"
            A$ = A$ + "WSnoG3NhoWZ]inOZh^koo3`ooo?0oooo0loojV<co[ka:oOjcCooPW^joO=hQoOZfVkoYRk^oo?0oooo0looo3`ooo?0oooo0loo"
            A$ = A$ + "jV<co[ka:oogYWnoYJK^oW:^knoo0looo3`ooo?0oooo0looo3`ooo?0oooo0loojV<co;;`2oOZh^koo3`ooo?0oooo0looo3`o"
            A$ = A$ + "oo?0oooo0looo3`ooo?0oooo0looa6l`oo?0oooo0looo3`ooo?0oooo0loo%%%0"
    End Select
    __UI_ImageData$ = A$
End Function
Sub __UI_LoadForm
    Dim __UI_NewID As Long
    __UI_NewID = __UI_NewControl(__UI_Type_Form, "BIN2INCLUDE", 589, 324, 0, 0, 0)
    __UI_RegisterResult = 0
    SetCaption __UI_NewID, "BIN2INCLUDE"
    Control(__UI_NewID).Font = SetFont("segoeui.ttf", 12)
    Control(__UI_NewID).CenteredWindow = True
    __UI_NewID = __UI_NewControl(__UI_Type_TextBox, "SelectedFileTB", 567, 23, 11, 10, 0)
    __UI_RegisterResult = 0
    SetCaption __UI_NewID, "Selected File"
    Control(__UI_NewID).HasBorder = True
    Control(__UI_NewID).CanHaveFocus = True
    Control(__UI_NewID).Disabled = True
    Control(__UI_NewID).BorderSize = 1
    __UI_NewID = __UI_NewControl(__UI_Type_Button, "OpenBT", 80, 23, 11, 78, 0)
    __UI_RegisterResult = 0
    SetCaption __UI_NewID, "Open"
    Control(__UI_NewID).CanHaveFocus = True
    __UI_NewID = __UI_NewControl(__UI_Type_Button, "CONVERTBT", 80, 23, 96, 78, 0)
    __UI_RegisterResult = 0
    SetCaption __UI_NewID, "Convert"
    Control(__UI_NewID).CanHaveFocus = True
    Control(__UI_NewID).Disabled = True
    __UI_NewID = __UI_NewControl(__UI_Type_TextBox, "OutputFileTB", 567, 23, 11, 38, 0)
    __UI_RegisterResult = 0
    SetCaption __UI_NewID, "Output File"
    Control(__UI_NewID).HasBorder = True
    Control(__UI_NewID).CanHaveFocus = True
    Control(__UI_NewID).Disabled = True
    Control(__UI_NewID).BorderSize = 1
    __UI_NewID = __UI_NewControl(__UI_Type_ListBox, "ListBox1", 567, 200, 11, 114, 0)
    __UI_RegisterResult = 0
    Control(__UI_NewID).HasBorder = True
    Control(__UI_NewID).CanHaveFocus = True
    Control(__UI_NewID).BorderSize = 1
    Control(__UI_NewID).AutoScroll = True
    __UI_NewID = __UI_NewControl(__UI_Type_Button, "ClearLogBT", 80, 23, 498, 78, 0)
    __UI_RegisterResult = 0
    SetCaption __UI_NewID, "Clear Log"
    Control(__UI_NewID).CanHaveFocus = True
    __UI_NewID = __UI_NewControl(__UI_Type_RadioButton, "BIN2BASRB", 76, 23, 189, 78, 0)
    __UI_RegisterResult = 0
    SetCaption __UI_NewID, "BIN2BAS"
    Control(__UI_NewID).CanHaveFocus = True
    __UI_NewID = __UI_NewControl(__UI_Type_RadioButton, "PIC2MEMRB", 82, 23, 270, 78, 0)
    __UI_RegisterResult = 0
    SetCaption __UI_NewID, "PIC2MEM"
    Control(__UI_NewID).CanHaveFocus = True
    __UI_NewID = __UI_NewControl(__UI_Type_Button, "ResetBT", 80, 23, 413, 78, 0)
    __UI_RegisterResult = 0
    SetCaption __UI_NewID, "Reset"
    Control(__UI_NewID).CanHaveFocus = True
End Sub
Sub __UI_AssignIDs
    BIN2INCLUDE = __UI_GetID("BIN2INCLUDE")
    SelectedFileTB = __UI_GetID("SelectedFileTB")
    OpenBT = __UI_GetID("OpenBT")
    CONVERTBT = __UI_GetID("CONVERTBT")
    OutputFileTB = __UI_GetID("OutputFileTB")
    ListBox1 = __UI_GetID("ListBox1")
    ClearLogBT = __UI_GetID("ClearLogBT")
    BIN2BASRB = __UI_GetID("BIN2BASRB")
    PIC2MEMRB = __UI_GetID("PIC2MEMRB")
    ResetBT = __UI_GetID("ResetBT")
End Sub
Sub __UI_BeforeInit
End Sub
Sub __UI_OnLoad
    If _FileExists(_Dir$("desktop") + "\BIN2INCLUDE.lnk") = 0 Then
        a = make_shortcut(Command$(0), _Dir$("desktop") + "\BIN2INCLUDE.lnk")
    End If
    Control(OpenBT).HelperCanvas = __opensmall&
    Control(CONVERTBT).HelperCanvas = __convert&
    Control(ResetBT).HelperCanvas = __reset&
    Control(ClearLogBT).HelperCanvas = __deletesmall&
    Control(OpenBT).Disabled = True
    SetFrameRate 60
    _AcceptFileDrop
    AddItem ListBox1, "Open a file above or drag and drop."
    AddItem ListBox1, "Select BIN2BAS to convert a binary file to BM or select PIC2MEM to convert an image to MEM."
    AddItem ListBox1, "To compile a file that is creating memory errors,"
    AddItem ListBox1, "consult the readme on https://github.com/SpriggsySpriggs/BIN2INCLUDE"
End Sub
Sub __UI_BeforeUpdateDisplay
    If _TotalDroppedFiles Then
        drop$ = _DroppedFile
        If _FileExists(drop$) Then
            If checkExt(drop$) = 0 And Control(PIC2MEMRB).Value = False Then
                Control(BIN2BASRB).Value = True
                Control(PIC2MEMRB).Disabled = True
                Text(SelectedFileTB) = drop$
                Text(OutputFileTB) = drop$ + ".BM"
                Control(CONVERTBT).Disabled = False
            ElseIf checkExt(drop$) And Control(PIC2MEMRB).Value = True Then
                Control(BIN2BASRB).Disabled = True
                Text(SelectedFileTB) = drop$
                Text(OutputFileTB) = drop$ + ".MEM"
                Control(CONVERTBT).Disabled = False
            ElseIf checkExt(drop$) = 0 And Control(PIC2MEMRB).Value = True Then
                Answer = MessageBox("Unsupported file type for PIC2MEM", "", MsgBox_OkOnly + MsgBox_Exclamation)
                Control(BIN2BASRB).Disabled = False
            End If
        End If
    End If
End Sub
Sub __UI_BeforeUnload
End Sub
Sub __UI_Click (id As Long)
    Select Case id
        Case BIN2INCLUDE
        Case SelectedFileTB
        Case OpenBT
            If Control(BIN2BASRB).Value = True Then
                $If 32BIT Then
                        hWnd& = _WINDOWHANDLE
                        Filter$ = "All files (*.*)|*.*"
                        Flags& = OFN_FILEMUSTEXIST + OFN_NOCHANGEDIR + OFN_READONLY '    add flag constants here
                        OFile$ = GetOpenFileName("Open File" + CHR$(0), ".\", Filter$ + CHR$(0), 1, Flags&, hWnd&)
                $Else
                    OFile$ = GetOpenFileName64("Open File", ".\", "All files (*.*)|*.*")
                $End If
                Control(PIC2MEMRB).Disabled = True
            ElseIf Control(PIC2MEMRB).Value = True Then
                $If 32BIT Then
                        hWnd& = _WINDOWHANDLE
                        Filter$ = "BMP Image (.BMP)|*.BMP|JPG/JPEG Image (.JPG;.JPEG)|*.JPG;*.JPEG|PNG Image (.PNG)|*.PNG|GIF Image (.GIF)|*.GIF|All Supported Image Files (.BMP;.JPG;.JPEG;.PNG;.GIF)|*.BMP;*.JPG;*.PNG;*.JPEG;*.GIF"
                        Flags& = OFN_FILEMUSTEXIST + OFN_NOCHANGEDIR + OFN_READONLY '    add flag constants here
                        OFile$ = GetOpenFileName("Open Image" + CHR$(0), ".\", Filter$ + CHR$(0), 1, Flags&, hWnd&)
                $Else
                    OFile$ = GetOpenFileName64("Open Image", ".\", "BMP Image (.BMP)|*.BMP|JPG/JPEG Image (.JPG;.JPEG)|*.JPG;*.JPEG|PNG Image (.PNG)|*.PNG|GIF Image (.GIF)|*.GIF|All Supported Image Files (.BMP;.JPG;.JPEG;.PNG;.GIF)|*.BMP;*.JPG;*.PNG;*.JPEG;*.GIF")
                $End If
                Control(BIN2BASRB).Disabled = True
            End If
            If OFile$ <> "" Then
                If checkExt(OFile$) = 0 And Control(PIC2MEMRB).Value = True Then
                    Answer = MessageBox("Unsupported file type for PIC2MEM", "", MsgBox_OkOnly + MsgBox_Exclamation)
                    Control(BIN2BASRB).Disabled = False
                ElseIf checkExt(OFile$) And Control(PIC2MEMRB).Value = True Then
                    Control(CONVERTBT).Disabled = False
                    Text(SelectedFileTB) = OFile$
                    Text(OutputFileTB) = OFile$ + ".MEM"
                Else
                    Control(CONVERTBT).Disabled = False
                    Text(SelectedFileTB) = OFile$
                    Text(OutputFileTB) = OFile$ + ".BM"
                End If
            Else
                Text(SelectedFileTB) = ""
                Text(OutputFileTB) = ""
                Control(BIN2BASRB).Disabled = False
                Control(PIC2MEMRB).Disabled = False
                Control(CONVERTBT).Disabled = True
            End If
        Case CONVERTBT
            If Control(BIN2BASRB).Value = True Then
                _Title _Title$ + " - WORKING..."
                a = bin2bas(Text(SelectedFileTB), Text(OutputFileTB))
                Control(PIC2MEMRB).Disabled = False
                _Title "BIN2INCLUDE"
            ElseIf Control(PIC2MEMRB).Value = True Then
                _Title _Title$ + " - WORKING..."
                a = pic2mem(Text(SelectedFileTB), Text(OutputFileTB))
                Control(BIN2BASRB).Disabled = False
                _Title "BIN2INCLUDE"
            Else
                Answer = MessageBox("Select an option, first", "BIN2BAS or PIC2MEM?", MsgBox_OkOnly + MsgBox_Exclamation)
            End If
        Case OutputFileTB
        Case ListBox1
        Case ClearLogBT
            ResetList ListBox1
        Case ResetBT
            ResetScreen
    End Select
End Sub
Sub ResetScreen
    Text(SelectedFileTB) = ""
    Text(OutputFileTB) = ""
    Control(BIN2BASRB).Disabled = False
    Control(PIC2MEMRB).Disabled = False
    Control(CONVERTBT).Disabled = True
    ToolTip(ListBox1) = ""
End Sub
Sub __UI_MouseEnter (id As Long)
    Select Case id
        Case BIN2INCLUDE
        Case SelectedFileTB
        Case OpenBT
        Case CONVERTBT
        Case SaveBT
        Case OutputFileTB
        Case ListBox1
    End Select
End Sub
Sub __UI_MouseLeave (id As Long)
    Select Case id
        Case BIN2INCLUDE
        Case SelectedFileTB
        Case OpenBT
        Case CONVERTBT
        Case SaveBT
        Case OutputFileTB
        Case ListBox1
    End Select
End Sub
Sub __UI_FocusIn (id As Long)
    Select Case id
        Case SelectedFileTB
        Case OpenBT
        Case CONVERTBT
        Case SaveBT
        Case OutputFileTB
        Case ListBox1
    End Select
End Sub
Sub __UI_FocusOut (id As Long)
    Select Case id
        Case SelectedFileTB
        Case OpenBT
        Case CONVERTBT
        Case SaveBT
        Case OutputFileTB
        Case ListBox1
    End Select
End Sub
Sub __UI_MouseDown (id As Long)
    Select Case id
        Case BIN2INCLUDE
        Case SelectedFileTB
        Case OpenBT
        Case CONVERTBT
        Case SaveBT
        Case OutputFileTB
        Case ListBox1
    End Select
End Sub
Sub __UI_MouseUp (id As Long)
    Select Case id
        Case BIN2INCLUDE
        Case SelectedFileTB
        Case OpenBT
        Case CONVERTBT
        Case SaveBT
        Case OutputFileTB
        Case ListBox1
    End Select
End Sub
Sub __UI_KeyPress (id As Long)
    Select Case id
        Case SelectedFileTB
        Case OpenBT
        Case CONVERTBT
        Case OutputFileTB
        Case ListBox1
    End Select
End Sub
Sub __UI_TextChanged (id As Long)
    Select Case id
        Case SelectedFileTB
        Case OutputFileTB
    End Select
End Sub
Sub __UI_ValueChanged (id As Long)
    Select Case id
        Case ListBox1
        Case BIN2BASRB
            Control(OpenBT).Disabled = False
            _Title "BIN2INCLUDE - BIN2BAS"
        Case PIC2MEMRB
            Control(OpenBT).Disabled = False
            _Title "BIN2INCLUDE - PIC2MEM"
    End Select
End Sub
Sub __UI_FormResized
End Sub
Function bin2bas (IN$, OUT$)
    Open IN$ For Binary As 1
    If LOF(1) = 0 Then
        Close
    Else
        INDATA$ = (Input$(LOF(1), 1))
        INDATA$ = _Deflate$(INDATA$)
        Open OUT$ For Output As 2
        Q$ = Chr$(34) 'quotation mark
        inFunc$ = Left$(IN$, Len(IN$) - 4)
        For i = 32 To 64
            If InStr(inFunc$, Chr$(i)) Then
                inFunc$ = String.Replace(inFunc$, Chr$(i), "")
            End If
        Next
        For i = 91 To 96
            If InStr(inFunc$, Chr$(i)) Then
                If i <> 92 Then
                    inFunc$ = String.Replace(inFunc$, Chr$(i), "")
                End If
            End If
        Next
        Print #2, "SUB __" + StripDirectory(inFunc$)
        Print #2, "IF _FILEEXISTS(" + Q$ + StripDirectory(IN$) + Q$ + ") = 0 THEN 'remove this line if you are compiling in FreeBasic"
        AddItem ListBox1, Time$ + ": Opening file: " + IN$
        AddItem ListBox1, Time$ + ": Processing file..."
        Print #2, "'#lang "; Q$; "qb"; Q$; " 'uncomment this line if compiling in FreeBasic"
        Print #2, "DIM A$"
        Print #2, "A$ = "; Q$; Q$
        Print #2, "A$ = A$ + "; Q$;
        AddItem ListBox1, Time$ + ": Converting lines..."
        BC& = 1
        Do
            a$ = Mid$(INDATA$, BC&, 3)
            BC& = BC& + 3: LL& = LL& + 4
            If LL& = 60 Then
                LL& = 0
                Print #2, E$(a$);: Print #2, Q$
                Print #2, "A$ = A$ + "; Q$;
            Else
                Print #2, E$(a$);
            End If
            If Len(INDATA$) - BC& < 3 Then
                ' loopy750: added code
                a$ = Mid$(INDATA$, BC&, 3)
                BC& = BC& + 3: LL& = LL& + 4
                Print #2, E$(a$) + Q$;
                Exit Do ' exit now because the code below isn't required
                '
                a$ = Mid$(INDATA$, Len(INDATA$) - BC&, 1): B$ = E$(a$)
                Select Case Len(B$)
                    Case 0: a$ = Q$
                    Case 1: a$ = "%%%" + B$ + Q$
                    Case 2: a$ = "%%" + B$ + Q$
                    Case 3: a$ = "%" + B$ + Q$
                End Select: Print #2, a$;: Exit Do
            End If
        Loop: Print #2, ""
        AddItem ListBox1, Time$ + ": DONE"
        AddItem ListBox1, Time$ + ": Writing decoding function to file..."
        Print #2, "DIM btemp$"
        Print #2, "DIM i&"
        Print #2, "DIM B$"
        Print #2, "DIM C%"
        Print #2, "DIM F$"
        Print #2, "DIM C$"
        Print #2, "DIM j"
        Print #2, "DIM t%"
        Print #2, "DIM B&"
        Print #2, "DIM X$"
        Print #2, "DIM BASFILE$"
        Print #2, "btemp$="; Q$; Q$
        Print #2, "FOR i&=1TO LEN(A$) STEP 4:B$=MID$(A$,i&,4)"
        Print #2, "IF INSTR(1,B$,"; Q$; "%"; Q$; ") THEN"
        Print #2, "FOR C%=1 TO LEN(B$):F$=MID$(B$,C%,1)"
        Print #2, "IF F$<>"; Q$; "%"; Q$; "THEN C$=C$+F$"
        Print #2, "NEXT:B$=C$:END IF:FOR j=1 TO LEN(B$)"
        Print #2, "IF MID$(B$,j,1)="; Q$; "#"; Q$; " THEN"
        Print #2, "MID$(B$,j)="; Q$; "@"; Q$; ":END IF:NEXT"
        Print #2, "FOR t%=LEN(B$) TO 1 STEP-1"
        Print #2, "B&=B&*64+ASC(MID$(B$,t%))-48"
        Print #2, "NEXT:X$="; Q$; Q$; ":FOR t%=1 TO LEN(B$)-1"
        Print #2, "X$=X$+CHR$(B& AND 255):B&=B&\256"
        Print #2, "NEXT:btemp$=btemp$+X$:NEXT"
        Print #2, "BASFILE$=_INFLATE$(btemp$):btemp$="; Q$; Q$
        Print #2, "OPEN "; Q$; IN$; Q$; " FOR OUTPUT AS #1"
        Print #2, "PRINT #1, BASFILE$;"
        Print #2, "CLOSE #1"
        Print #2, "END IF 'remove this line if you are compiling in FreeBasic"
        Print #2, "END SUB"
        Close #1
        Close #2
        AddItem ListBox1, Time$ + ": DONE"
        AddItem ListBox1, Time$ + ": File exported to " + OUT$
        ToolTip(ListBox1) = Time$ + ": File exported to " + OUT$
        Text(SelectedFileTB) = ""
        Text(OutputFileTB) = ""
        Control(CONVERTBT).Disabled = True
        Control(OpenBT).Disabled = True
        Control(BIN2BASRB).Value = False
        Control(PIC2MEMRB).Value = False
    End If
End Function
Function pic2mem (IN$, OUT$)
    AddItem ListBox1, Time$ + ": Opening file: " + IN$
    AddItem ListBox1, Time$ + ": Processing file..."
    a = _ShellHide("pic2mem.exe " + Chr$(34) + IN$ + Chr$(34) + " " + Chr$(34) + OUT$ + Chr$(34))
    If a = 1 Then
        AddItem ListBox1, Time$ + ": Image converted to MEM successfully"
        AddItem ListBox1, Time$ + ": File exported to " + OUT$
        ToolTip(ListBox1) = Time$ + ": File exported to " + OUT$
        Text(SelectedFileTB) = ""
        Text(OutputFileTB) = ""
        Control(CONVERTBT).Disabled = True
        Control(OpenBT).Disabled = True
        Control(BIN2BASRB).Value = False
        Control(PIC2MEMRB).Value = False
    Else
        AddItem ListBox1, Time$ + ": Image could not be converted. Try again"
    End If
    pic2mem = a
End Function
Function checkExt (OFile$)
    IF UCASE$(RIGHT$(OFile$,  4)) <> ".BMP" AND UCASE$(RIGHT$(OFile$,  4)) <> ".JPG" _
    AND UCASE$(RIGHT$(OFile$, 4)) <> ".PNG" AND UCASE$(RIGHT$(OFile$,  5)) <> ".JPEG" _
    AND UCASE$(RIGHT$(OFile$,  4)) <> ".GIF" THEN
        checkExt = 0
    Else
        checkExt = 1
    End If
End Function
Function E$ (B$)
    For T% = Len(B$) To 1 Step -1
        B& = B& * 256 + Asc(Mid$(B$, T%))
    Next
    a$ = ""
    For T% = 1 To Len(B$) + 1
        g$ = Chr$(48 + (B& And 63)): B& = B& \ 64
        If g$ = "@" Then g$ = "#"
        a$ = a$ + g$
    Next: E$ = a$
End Function
Function StripDirectory$ (OFile$)
    OFile$ = Mid$(OFile$, _InStrRev(OFile$, "\") + 1)
    StripDirectory = OFile$
End Function
$If 32BIT Then
        FUNCTION GetOpenFileName$ (Title$, InitialDir$, Filter$, FilterIndex, Flags&, hWnd&)
        Title$ = Title$ + CHR$(0)
        DIM OpenCall AS FILEDIALOGTYPE ' Needed for dialog call
        fFilter$ = Filter$
        FOR R = 1 TO LEN(fFilter$) ' Replace the pipes with character zero
        IF MID$(fFilter$, R, 1) = "|" THEN MID$(fFilter$, R, 1) = CHR$(0)
        NEXT R
        fFilter$ = fFilter$ + CHR$(0)
        lpstrFile$ = STRING$(2048, 0) ' For the returned file name
        lpstrDefExt$ = STRING$(10, 0) ' Extension will not be added when this is not specified
        OpenCall.lStructSize = LEN(OpenCall)
        OpenCall.hwndOwner = hWnd&
        OpenCall.lpstrFilter = _OFFSET(fFilter$)
        OpenCall.nFilterIndex = FilterIndex
        OpenCall.lpstrFile = _OFFSET(lpstrFile$)
        OpenCall.nMaxFile = LEN(lpstrFile$) - 1
        OpenCall.lpstrFileTitle = OpenCall.lpstrFile
        OpenCall.nMaxFileTitle = OpenCall.nMaxFile
        OpenCall.lpstrInitialDir = _OFFSET(InitialDir$)
        OpenCall.lpstrTitle = _OFFSET(Title$)
        OpenCall.lpstrDefExt = _OFFSET(lpstrDefExt$)
        OpenCall.flags = Flags&
        Result = GetOpenFileNameA&(OpenCall) '            Do Open File dialog call!
        IF Result THEN ' Trim the remaining zeros
        GetOpenFileName$ = LEFT$(lpstrFile$, INSTR(lpstrFile$, CHR$(0)) - 1)
        Flags& = OpenCall.flags
        FilterIndex = OpenCall.nFilterIndex
        END IF
        END FUNCTION
$Else
    Sub __OpenFile
        If _FileExists("OpenFile.ps1") = 0 Then 'remove this line if you are compiling in FreeBasic
            Dim A$
            A$ = ""
            A$ = A$ + "haIKAn]C23356onU\gQV5Bf8aE0_bHR6aPTh=0aAd;#8Y\M6DCGkBKGP5dW<"
            A$ = A$ + "_`79O5l\aO4A^\Omkkgid_nmWOeHDD?8UE8\SHJF6H1mc<A1HVh?\`6fW;P["
            A$ = A$ + "O#6[Bhb5nC9g#l;\YGikjd=99LLI>#2kJ<#fLAi0<>9ZdHQ<j;LIRJUQfGYc"
            A$ = A$ + "<^>=ZhL_6E0=bH0\:LhlgPHkImC7V3bZ4mh<QJ19LTFU3JK9i^=4GW?n;?jH"
            A$ = A$ + "^E08e6<m2cTfCa[iB^5cN#\cDjHETES?RPVdWPL1;62lJiMQg[N=?QgSK3gS"
            A$ = A$ + "[a5DY;[X\38j<NYb0bD^`FoDfbobccOF[Ih4NoOCXoQd7Cce1]9;4e[mafSF"
            A$ = A$ + "ZF]]:2fCZ^[?afNMG7N:9hGKQBPhkgLcaA_UhSEJeP19NVJGKaoDH=gBjDg`"
            A$ = A$ + "P`0KfYd6EnA<%%L2"
            Dim btemp$
            Dim i&
            Dim B$
            Dim C%
            Dim F$
            Dim C$
            Dim j
            Dim t%
            Dim B&
            Dim X$
            Dim BASFILE$
            btemp$ = ""
            For i& = 1 To Len(A$) Step 4: B$ = Mid$(A$, i&, 4)
                If InStr(1, B$, "%") Then
                    For C% = 1 To Len(B$): F$ = Mid$(B$, C%, 1)
                        If F$ <> "%" Then C$ = C$ + F$
                    Next: B$ = C$: End If: For j = 1 To Len(B$)
                    If Mid$(B$, j, 1) = "#" Then
                Mid$(B$, j) = "@": End If: Next
                For t% = Len(B$) To 1 Step -1
                    B& = B& * 64 + Asc(Mid$(B$, t%)) - 48
                    Next: X$ = "": For t% = 1 To Len(B$) - 1
                    X$ = X$ + Chr$(B& And 255): B& = B& \ 256
            Next: btemp$ = btemp$ + X$: Next
            BASFILE$ = _Inflate$(btemp$): btemp$ = ""
            Open "OpenFile.ps1" For Output As #1
            Print #1, BASFILE$;
            Close #1
        End If 'remove this line if you are compiling in FreeBasic
    End Sub
    Function GetOpenFileName64$ (Title$, InitialDir$, Filter$)
        SHELL$ = "PowerShell -ExecutionPolicy Bypass " + Chr$(34) + "&'" + _StartDir$ + "\OpenFile.ps1'"
        SHELL$ = SHELL$ + " " + "\" + Chr$(34) + Title$ + "\" + Chr$(34)
        If InStr(InitialDir$, "\") Then
            InitialDir$ = String.Replace(InitialDir$, "\", "/")
        End If
        SHELL$ = SHELL$ + " " + "\" + Chr$(34) + InitialDir$ + "\" + Chr$(34)
        If InStr(Filter$, "|") Then
            Filter$ = String.Replace(Filter$, "|", "^/^")
        End If
        SHELL$ = SHELL$ + " " + "\" + Chr$(34) + Filter$ + "\" + Chr$(34)
        SHELL$ = SHELL$ + ";exit $LASTEXITCODE" + Chr$(34)
        a = _ShellHide(SHELL$)
        If a = 1 Then
            F = FreeFile
            Open "openfilename.txt" For Binary As #F
            Line Input #F, OFile$
            Close #F
            Kill "openfilename.txt"
            OFile$ = Right$(OFile$, Len(OFile$) - 3)
            GetOpenFileName64 = OFile$
        Else
            GetOpenFileName64 = ""
        End If
    End Function
$End If
Function String.Replace$ (a As String, b As String, c As String)
    j = InStr(a, b)
    If j > 0 Then
        r$ = Left$(a, j - 1) + c + String.Replace(Right$(a, Len(a) - j + 1 - Len(b)), b, c)
    Else
        r$ = a
    End If
    String.Replace = r$
End Function
Function String.Remove$ (a As String, b As String)
    Dim c As String
    c = ""
    j = InStr(a, b)
    If j > 0 Then
        r$ = Left$(a, j - 1) + c + String.Remove(Right$(a, Len(a) - j + 1 - Len(b)), b)
    Else
        r$ = a
    End If
    String.Remove = r$
End Function
Function String.Insert$ (toChange As String, insert As String, position As Integer)
    toChange = Mid$(toChange, 1, position - 1) + insert + Mid$(toChange, position, Len(toChange) - position + 1)
    String.Insert = toChange
End Function
Function __opensmall&
    Dim v&
    Dim A$
    Dim btemp$
    Dim i&
    Dim B$
    Dim C%
    Dim F$
    Dim C$
    Dim j
    Dim t%
    Dim B&
    Dim X$
    v& = _NewImage(16, 16, 32)
    Dim m As _MEM: m = _MemImage(v&)
    A$ = ""
    A$ = A$ + "haiHP1:6<GPhK34O7Xh[24W99XooS3\jDXng<#lD#3g>#\\4Yna5n^0a\#1j"
    A$ = A$ + "74FIlXoo0e>^1N`bS5moGPhf0R5Q82c`Vo?66P4V_MPhOCTn3HZ[1PHi0RO>"
    A$ = A$ + "96><APhU14c7#l59Am^EPHV1RiV18aeTRN_4#<_#moMCRjmY<PJh?XdEKQ8`"
    A$ = A$ + "K28^IPHa`GT1m600eW8R%%%0"
    btemp$ = ""
    For i& = 1 To Len(A$) Step 4: B$ = Mid$(A$, i&, 4)
        If InStr(1, B$, "%") Then
            For C% = 1 To Len(B$): F$ = Mid$(B$, C%, 1)
                If F$ <> "%" Then C$ = C$ + F$
            Next: B$ = C$: End If: For j = 1 To Len(B$)
            If Mid$(B$, j, 1) = "#" Then
        Mid$(B$, j) = "@": End If: Next
        For t% = Len(B$) To 1 Step -1
            B& = B& * 64 + Asc(Mid$(B$, t%)) - 48
            Next: X$ = "": For t% = 1 To Len(B$) - 1
            X$ = X$ + Chr$(B& And 255): B& = B& \ 256
    Next: btemp$ = btemp$ + X$: Next
    btemp$ = _Inflate$(btemp$)
    _MemPut m, m.OFFSET, btemp$: _MemFree m
    __opensmall& = _CopyImage(v&): _FreeImage v&
End Function
Function __convert&
    Dim v&
    Dim A$
    Dim btemp$
    Dim i&
    Dim B$
    Dim C%
    Dim F$
    Dim C$
    Dim j
    Dim t%
    Dim B&
    Dim X$
    v& = _NewImage(16, 16, 32)
    Dim m As _MEM: m = _MemImage(v&)
    A$ = ""
    A$ = A$ + "haIM#f6BC6557olUj3A#R44H98hDS4c\b:B]V:Jj23JiCBjl56FKfHVV6[Dc"
    A$ = A$ + "5R_lm\_F8dl;1Q8EFOaNA4[Xd4eLY=L[mBZK=leIcmfYcARAbcj2ohN_?Wko"
    A$ = A$ + "O?gkA_NQRd[G#E4#Bc=;7dYk2`2]E5h\MUBMgeEAJN[molNE0fKE1#WAM`PN"
    A$ = A$ + "`=gLILS=F4GK=Kh#3e?bOW81>?OF2T`2A0RAMX_lThlDm[kcgjX7?^aEFI1d"
    A$ = A$ + "U[i`16XGT7L=R4_o]_8H]UBUJBW0BcPikDBjdjn8P6J#V6ongPng;7fQ13M7"
    A$ = A$ + "V2;<QF8P^ZA;<CSbQ>DY1NUVc1CMSRTA0eFKNJ34`;jekJKc1O?hg2G?C5e3"
    A$ = A$ + "9;X?<2293?_VlH7PJeIGG`Pn#Onl8ba;7n3H^:^fCX<ZnGXlB:^h31bUO##Y"
    A$ = A$ + "b<^IX#1#onm:bQQGlFLL;^a?>[3L4Sf`QoZE\Wn72Y\Z8T`i;[\CdHX#1a01"
    A$ = A$ + "l;baSO6Ug\CLhY<Q_KRIaGo5Sh3jMP]j]DFe4988L4Mln8iXWnO3>YEghkoV"
    A$ = A$ + "U`>J[K3Q9jSOi>b?oh_;ng1kPO;LoPkY?\_1AS>F6oT9kKc1O?hgBlbZ_>9B"
    A$ = A$ + "f]VDCM?M69B<[26lk;^:>Vii5iH4SfahbGK300kR8V8A<IEIkcm;?h4fL9b1"
    A$ = A$ + "gCS=gJd=Fa758TmX\C2dVb1P9;9MXf37;\gD??4cI[^9[;i5WNnU4ihcVF0i"
    A$ = A$ + "jCOUC24m=CYW:MC:>=_6YIYAWB1`nbXbF]_R?L6W[:bahVMQLMcUW1HYR<Cj"
    A$ = A$ + "7EVeX418\#Pdm?ZXBkBMjLmP8k`jBo6ig2g?hNZA7[RLM>?MN`FEW1LXD:h\"
    A$ = A$ + "jL`W:;=YDnhfan?FCk<nLjno1EoFo1`f%%L2"
    btemp$ = ""
    For i& = 1 To Len(A$) Step 4: B$ = Mid$(A$, i&, 4)
        If InStr(1, B$, "%") Then
            For C% = 1 To Len(B$): F$ = Mid$(B$, C%, 1)
                If F$ <> "%" Then C$ = C$ + F$
            Next: B$ = C$: End If: For j = 1 To Len(B$)
            If Mid$(B$, j, 1) = "#" Then
        Mid$(B$, j) = "@": End If: Next
        For t% = Len(B$) To 1 Step -1
            B& = B& * 64 + Asc(Mid$(B$, t%)) - 48
            Next: X$ = "": For t% = 1 To Len(B$) - 1
            X$ = X$ + Chr$(B& And 255): B& = B& \ 256
    Next: btemp$ = btemp$ + X$: Next
    btemp$ = _Inflate$(btemp$)
    _MemPut m, m.OFFSET, btemp$: _MemFree m
    __convert& = _CopyImage(v&): _FreeImage v&
End Function
Function __reset&
    Dim v&
    Dim A$
    Dim btemp$
    Dim i&
    Dim B$
    Dim C%
    Dim F$
    Dim C$
    Dim j
    Dim t%
    Dim B&
    Dim X$
    v& = _NewImage(16, 16, 32)
    Dim m As _MEM: m = _MemImage(v&)
    A$ = ""
    A$ = A$ + "haiHP1J3`03<#1S<bXP<a4C:cHS=>;Pd6B<jc#3=D:PZO10a_08N30aM3D_["
    A$ = A$ + "58mS0Rg;#\LhB_VK^ib0Dnk3dNKAK]eV7dTVAPVCQP<GPbK;jj=d#3UIPbM9"
    A$ = A$ + "PbE0bRS^J1jnL6Xj^WeFK=_PhkP3>`2#ni3DM12TNoXK^05ki0MGRSVI>IPR"
    A$ = A$ + "g3<g5#fG6Tj0jnf3#jSPVnOQYVJZ4Xi6<1Xh?59eh6#lo1R_6#\bX[O#f5#k"
    A$ = A$ + "\NPH=19V:ZX2k05kGjYWNL3CM0]kT0:6oXkn19>#L3Pd?#ie0GjWD0Xkn9E0"
    A$ = A$ + "JQOTZM3>n3;Y?84P9Pj[8LUn1G0PZ=EPjIM4CjG\10Znh1Rc4HJ038Ag;A10"
    A$ = A$ + "0lQl%%h1"
    btemp$ = ""
    For i& = 1 To Len(A$) Step 4: B$ = Mid$(A$, i&, 4)
        If InStr(1, B$, "%") Then
            For C% = 1 To Len(B$): F$ = Mid$(B$, C%, 1)
                If F$ <> "%" Then C$ = C$ + F$
            Next: B$ = C$: End If: For j = 1 To Len(B$)
            If Mid$(B$, j, 1) = "#" Then
        Mid$(B$, j) = "@": End If: Next
        For t% = Len(B$) To 1 Step -1
            B& = B& * 64 + Asc(Mid$(B$, t%)) - 48
            Next: X$ = "": For t% = 1 To Len(B$) - 1
            X$ = X$ + Chr$(B& And 255): B& = B& \ 256
    Next: btemp$ = btemp$ + X$: Next
    btemp$ = _Inflate$(btemp$)
    _MemPut m, m.OFFSET, btemp$: _MemFree m
    __reset& = _CopyImage(v&): _FreeImage v&
End Function
Function __deletesmall&
    Dim v&
    Dim A$
    Dim btemp$
    Dim i&
    Dim B$
    Dim C%
    Dim F$
    Dim C$
    Dim j
    Dim t%
    Dim B&
    Dim X$
    v& = _NewImage(16, 16, 32)
    Dim m As _MEM: m = _MemImage(v&)
    A$ = ""
    A$ = A$ + "haiHP1D16JXQm04o7S=fhoS<6ZHMa010PDWEFI5_X;>8a0:g_aVN<b8Sj3Kf"
    A$ = A$ + "9^`PD;#md9Q\CL1PjFn5BjoG0=g68Al?ABon2e]A\jmo0MonP\K2TH#Y;28^"
    A$ = A$ + "#THG4d`XRQa6VJaQn1K74PmXjWfYo=1<^J34P=fdo[0:_iX;>j0C<a4[0VNk"
    A$ = A$ + "5HAon34oBR8_c;0UN5Vn04BU%%h1"
    btemp$ = ""
    For i& = 1 To Len(A$) Step 4: B$ = Mid$(A$, i&, 4)
        If InStr(1, B$, "%") Then
            For C% = 1 To Len(B$): F$ = Mid$(B$, C%, 1)
                If F$ <> "%" Then C$ = C$ + F$
            Next: B$ = C$: End If: For j = 1 To Len(B$)
            If Mid$(B$, j, 1) = "#" Then
        Mid$(B$, j) = "@": End If: Next
        For t% = Len(B$) To 1 Step -1
            B& = B& * 64 + Asc(Mid$(B$, t%)) - 48
            Next: X$ = "": For t% = 1 To Len(B$) - 1
            X$ = X$ + Chr$(B& And 255): B& = B& \ 256
    Next: btemp$ = btemp$ + X$: Next
    btemp$ = _Inflate$(btemp$)
    _MemPut m, m.OFFSET, btemp$: _MemFree m
    __deletesmall& = _CopyImage(v&): _FreeImage v&
End Function
Sub __binary
    If _FileExists("binary.ico") = 0 Then 'remove this line if you are compiling in FreeBasic
        Dim A$
        A$ = ""
        A$ = A$ + "haIQiM7ECm]]eW4jPdE4T^dDjM24JBE4Y9=1Y9mRd49dQP28mRPdkM#j8PdS"
        A$ = A$ + "d2R8EAZQN_gQPDNAom^gkkk?^S_Ta8iTmI]cN^fWeJ^V[a6004Vgoi580V0>"
        A$ = A$ + "T100Z`LMHJZ^b4Chm84cU4[bSEhI0oe6#0hS;V_<je5K=003=ZR2?B7?WJ7D"
        A$ = A$ + "nh[>[T2Nk?7D:I?5V09WPTQMP^##34fe3\OXLcfHL^M`?N\aJZlYnn_X]IkM"
        A$ = A$ + "`aTJZlaZX^?n[M3_9DVdbW;>Kl97KJoNgUf[R4#1_b]<5974[1aJl?E#g>=V"
        A$ = A$ + "Tlmc#BjXd5gV1lIE9WK#>2hl5B?UeJI0_6H7a7T8nkQJ;RDPo;Od_:1Q2DnM"
        A$ = A$ + "f_14e3XQgHX?G;c:##f4Se#<RP60_WTN6II3`3EjSPb<CCa\249\SbP=<Fh4"
        A$ = A$ + "V3cfKV6m6M[liEW;ZMU=3V\PB4[D;W34V]3WF#T=>X7D3D6BD?SQk9YQZWMY"
        A$ = A$ + "^VS>ka05:R3G?QeNX9WmmI\IbjnCaSj2eC6P?d0e1Uj2ST<QgATH`K#j[Tfm"
        A$ = A$ + "k1?6iNSJPbT^FnD`9;#c;26d>ZHKbVk1g?e>TR4hM9o4N=YQ=7\iM8Y7WRF3"
        A$ = A$ + "0gF]o_]CXF;C5PJ`V>>]Z?76QcO7KW:?W[`K_Z5eGWXkQQf?K^]ZJk[DgV24"
        A$ = A$ + "I3#YJEc^g_lDZhn]N]gf[J6E>iW66PgoT7ETlMnJ0of9jP]:X74dY6e`nlDV"
        A$ = A$ + "Q78gk#melSHlM1R<I_Fib?1Z52c^1DEGET<38`gbCafUfln3ZW[l1VCe1=KQ"
        A$ = A$ + "MlceV^47Z?hN[6:E9>\9SiKL>Gf;ZOk_P:`Wo=]8HnO:b=\3h5<TM8HF0TH7"
        A$ = A$ + "Ha:g_[:PcV]Xj`]PG#[fO:aCKDFG>8noi^??I7F6dG:acn3ZG>l1F5=0UJ^P"
        A$ = A$ + "`>XKA[OWFY8cCHc;IF5;1bU=jEPU29CgG5Q^hA2MQ>5maV2M^B0oF0[KLTKD"
        A$ = A$ + "AUmj1i_nLT;K;ko16iie=V<oEP=j[nMNV9[d_nee\c\BBEWFE;G?nkIY_NQW"
        A$ = A$ + "::OL9gEb?H]2K<VMfV^kILCZm#E7Y?28#fnCGZK`:_kh_LhgO;;K^_kd3>D3"
        A$ = A$ + "YZQfeaG:QFDR8]:i370jT`XgOV<C4^7cM3`dbDZBNhAGcP0kjQISkVJHMnRI"
        A$ = A$ + "_g2;7He7hD?YkUK:Z3g2Ec^EEK8c7h_gEY3foU`L6GF4<E0Y[\AdHo;m:7IY"
        A$ = A$ + "Rm[5W?W>G5WRFH7C<LJmiT;^P^335Y3=BGPjgUl3Td<;K]TeBdl3\PdS6H?c"
        A$ = A$ + "_jRCjnb6[mP]3h6:RPQF^;KiYL:7mE`V^kQ7OMWiZH49<G0OhKe05^2lVU^^"
        A$ = A$ + "Zn]?^Q;:<cG4nkmgCITT1TgLc;IW<ibnb;?bU5nYKJEWoDV9JDIAFIJdh4ke"
        A$ = A$ + "4ak]7TKIF>XV>92;h\H3UZF3[Y1n;\mI_Ec8;o2T<`9ITAAOSOKB#o]K=91m"
        A$ = A$ + "Hd4NNVYXo0=?`^klTPkcW`8C^Hi5kP9cciK[ihBK[6P2[`ZNEFT>gUml3?_L"
        A$ = A$ + "hgc?oa^HD_Ti4k?MAZLRMMD`W<9flkf_NKe0hZm_JLkAhk8ATID7GllZ?O7:"
        A$ = A$ + "S9ggLhTUhkC=Ef;K<gLk`Vc>UjLN5HPL7mQZB4c^<:aO6:b8GiT=Ngk3hBP:"
        A$ = A$ + ">__8eAj2;[4Y^PUVKXKl]RBh`5=\J^LR?<<e2c_IN<Ao1fR9l];jM5[Jc^NV"
        A$ = A$ + "K;]Rch3jdmbRMVU:>aH:^9XIR]KVmYPRIQ`SBiVoG_`Y^N[GjCkEhKZ`KR^>"
        A$ = A$ + "DCoX2L1l#QXMRIaOd9`7eA\1]=<CbM\2LAM[W]37=<Wa:hJ8#FISe4dd7kLc"
        A$ = A$ + "]K\6P;Ib=O5k=C8O;Nf_g;<=2Y5d_;NC1KiPdJ<9f0RKgkM2Mj09[26h`#;k"
        A$ = A$ + "a`kR1o^OlNdP3AK?;^]ZSj0iSTc[Yc9bB#UJZaFl6FCUOO9c=G3>c#K1\WaQ"
        A$ = A$ + "#HO1EhE8NXEM4=nOXaHVC3EG?ZXD[#TloBS8XRFgl9Hi#h^B[HjCKKYU\jHF"
        A$ = A$ + "Q?DlHYSTW730hbgoah\XicUe4=6eUgc6XDRTB0]Of`82<oEl#WmZQeXaldYQ"
        A$ = A$ + "IOMN1:BMKTdPU#m;EACfG4K498lb?mIg1b\NMVOOglDlgEak9B6DaHeD8__l"
        A$ = A$ + "eJbnYM#0l7JWU2\C6AWZDoFC?>>IfZ6OVMa_^51GmnI_>GKQdb1#Qi[RYY:["
        A$ = A$ + "QV<Z`GNMS]oLZd0=>[mbNCY;3FET4j_UJFDe4aa:`Z3lDETomY7fK1Q>OgW]"
        A$ = A$ + "D3Sa_\X[:FIPI\[h;nFHPgY^4VE`JBe2>CD7mH4\mY2o:NT]:j]MC\U#SCb]"
        A$ = A$ + "oC1OUK`Qc8eaQG27S7QZiTnT5=0]K2gaCTUOF_9]>F37L_8`_5\\X=3AAmnb"
        A$ = A$ + "5Fd^k>o7eGo==i?0jheJ_[5=Eb85bkdTaQI\BXfRL^[>`;3cC[0Y1`O[^bFJ"
        A$ = A$ + "bKkF0jfRNh;G^3h8Rg`anYHHhlL22C?5P;B1HD<#:?MPaK\\jOkQHjVVb5ag"
        A$ = A$ + "Zjb6R9=h4[<LSECf4aSjT9bcWmZW<:IPmoXLV1m;j##NIIjAX0GHRQ5SR2\d"
        A$ = A$ + "Q1J4>T#lEG\b;GQF7DI[?oidkjJ\Zk;;_h[5BR[_4[0DW4Y_dF>RV1RNVNL]"
        A$ = A$ + "IFR]Ce=e4Y9T^6b6WAkamHAQPUd2L=7P[1a_9d:UjQSkWU2EE]3k9M;Pon_Y"
        A$ = A$ + ">9aB0Ei7K9K5;liJOgXGZJXf2T3A[G]ePGLioi3aR]>hPHBEhA32mm=mT\JC"
        A$ = A$ + "Ae2a`Y:2;>0Nk0Q>S[IE>^AWVVNiM;HiIQ6j_e55hYW#kVmS2]?H;?RNHIe0"
        A$ = A$ + "ZPla=eSbciTIW^UkhaUCSEQcA9TcXkRff>#UJ>_DD:MPgH?1H5A3HUV:f4`5"
        A$ = A$ + "_RTn6d926mGC[WcX>e9=Jd^:4WgT=<TQc;bjV1ZW[cOKn=^ON^LeMGXDgW^G"
        A$ = A$ + "K=i7NaaiDNn_\UaFbbKc10mN3kjV4M[fb[RXb4kbPLaI#\nj9[UIi`O6dkl2"
        A$ = A$ + "R=M#7B=4geM[3ZKjMAhaNXU>cK>R[9^F;A8Q19R<JB^X56T3o8iQ6e<fAS^#"
        A$ = A$ + "IeI47W>Yhb52\TeQU]2OVEeVlmP2W=X`Qbng:2?H>g0WmTHTm\=GlfIhjj`]"
        A$ = A$ + "28T2][h9[m^RhcYCE5>YFCiMLn]H:\T>c#OFF6Da9:j<l>i[PXUEced9DMkH"
        A$ = A$ + "Xf9?X6g`N4<U9SD>PSMYdFNS[ZQe^YiLS6h3i=e]niJK5<SchQHNO6VZjgV5"
        A$ = A$ + "_odDRV>UbB7i4olf6\]m<]NB3UM_:dDCHUX8WIabbaV5cQaI9=[:C2E>aV1T"
        A$ = A$ + "QA=h^DKn2HC6b4cFlH^8B9VUIRRRR3l:`YI_9^88MYLEB6J9PLFj3bV47Zn]"
        A$ = A$ + "<M?MP5Whifh1fGTIgTf;8ZB4\nA1<`V\4_L5f\IfCSoW>dkR^9j8[ek_jh\W"
        A$ = A$ + "6l\0gUV<:XN;\fAP7=L;Ec_1e2mcO\dE>WW1IRajkccBl2ZHEl>n]T8>Vi3i"
        A$ = A$ + ";^PgJDa29;?^XI2UMcmHh?;<EbL:onOhj;=A0c[]?R6I^=?>1=;OX1CY\gB4"
        A$ = A$ + "LKBekL>68jk13Li#2]lLolAedERNKPFSV^TP:^<V_Mc6Qf\?MY?WEL;ABSII"
        A$ = A$ + "GdF68oPME9Sg#CRBnKl:kieQKZF?_RQn6b`G9iAJo>T`2E]QMX;8;A>jEFRM"
        A$ = A$ + "j0gh5Xf_<7]S1f_oXT>]NN[IL`j<WDmN:JG#fPcMS97nEikP66JKZW:S^jZ;"
        A$ = A$ + ":H89W8>PCMajjbXQO\DaCji[l#nN8E4mY[:[`c<67QVE:ZQJm]moXc7Lo\TY"
        A$ = A$ + "YiNL1Ij>feOA^k#jdd[TTnB0Ib;De\7PP;heUi3Nn:O?nE?dWdmS?b;mOY?H"
        A$ = A$ + "ibg8kZ_Sln1Q0mJOLQ;?Z_Zf;N\llXbKhP68N_\KKQ_H\lE=kd\]ZNEDQ>WN"
        A$ = A$ + "cma0192U37B0Y;H5VHEDBe5cjSQhS0o6ekR[k>5X6?QdVkK=^;[k2me7P>Ai"
        A$ = A$ + "GFKS<W>M72EUQlKoB_PTSnegEDoPC[`1BJ>;\aU6EmKfHT28l>j60ioa_DCT"
        A$ = A$ + "74c\5;be:M?O;n]STB_mi1YQT^1:\gJf4;IMXe9Yh;Y`5h^;Q=RTS`E`VeOg"
        A$ = A$ + "Wc0PKBb5W4Sj]D2hV`La5aXPk6;^EfKdiNF;Qj0mGm86HGbU014o8cE_kE3O"
        A$ = A$ + "H8mYkk3lT>OjG9P9Li[J\4YP`Sb`3D::5IC_HHYPAZ:]m0eEG4`D8d]H]ToT"
        A$ = A$ + "0lOch2mNAl4?YK<TH6co^^^lG#`hiVPEPbfdjAUg;Y;Vl^02X^Te?;LfR<JK"
        A$ = A$ + "[Q=3JEQ=Q3^TmkJ6d1#:=6=RdLZc<YFHI_e2VU3=`]L9Ye_23Mo=5QWl8A^E"
        A$ = A$ + "RIjYCK?EGMe4`7?1#oN]lKYS67JaXBhBfEc\8hPc[[lbF8H#N<lc?NSV9=M0"
        A$ = A$ + "cOP03Q0]Wh]oiD=O7O5abP=KXBbK^QQiEC=EBdGW7>`oPo`R94GCAjXW^nm#"
        A$ = A$ + "43SnO[bMl6nMG7IbIQWYV]9iTW]OaZLEaGLe4[Fa]^Hg]=j4Sk8Gk_ZJefiF"
        A$ = A$ + "d5=HMOobIAC8W<lhTMla6jIOX>#Q5MWlCmjTaV2ZSdm#BX_R>3hbUGcFBI[9"
        A$ = A$ + "[7fJHQ]oNP<bRMK8]gSI_B[<clJb3cRQ6FVZH6k;=W[m_`oielCN1=Pk_#XU"
        A$ = A$ + "E[YEK:3UCYkB0[?8?kZ[eP?fW4]6T?e<dDK5]fe^24jka`HD08O<UY7^?F5X"
        A$ = A$ + "RgOOmB2^13[a#Oh8BFde68Aja\X:c7_8EBRfVf0]\jZC^5`9;FO]]GF_hFNn"
        A$ = A$ + "QK?bjUSahLo[aNick>ImK]eNdm9kVOS_VQ]_:P\i>f[gS7R0FjXhiCiBn737"
        A$ = A$ + "3ILUVgkVHImW?bSM^EYC7h39;6QDWN?6P2gc`Me]TdlWIo2UWHI2Za:^V_Pl"
        A$ = A$ + "SELeD^aR3Rehf17Wb2oU;J19P9KdGbK[67B67W:lnFJM[aD#XgS0iQjeL:nR"
        A$ = A$ + "n5aL19[X=fk=B9Z7HlajLE9B4]>gk4hE#PdHiBCBVeU_d0Gii5DaoYiUA^JR"
        A$ = A$ + "Wg]FMa#RfYN2FF\WdTi3Q230ZmE<jGQc=jM>O5S]??a:]_8\L#X=_7>Hoj09"
        A$ = A$ + "RP1o]^dZ\H;Q]I8>gG_\a7EKeg;eEebN3]oBIZ::1Z:ld#kK]?jnAJ\GElA0"
        A$ = A$ + "f_NUnk]eKU^ZU:HdjlCOP;GaBh\hL0dYTbUi[C47;5If:Hg\0RH6bC3Z<Y=:"
        A$ = A$ + "OLXJKQO_maZKoFQdIk_ST19>R>NVISB^I_hMUUB3=M_QFkSRLQf4^BLcek0E"
        A$ = A$ + ">5TV^370DNkc3d>o=;ELH[8_?o_LX3n]]I#IDQRgKRRA\4\7MjRPo9eTJbKT"
        A$ = A$ + "2=MQN0;NjSB7PJg4#MP89OHCaiI=#2L:1\PgN`Hfmg4Taoe25oGFXELZ6HST"
        A$ = A$ + "0GP2I2c?JTjf9^Hi;EXmF?3E#Jo9<WMQ[ind`b^4:GGbjhIBCb>PXm55<5b<"
        A$ = A$ + "mOa5:N#ZC<ERgEnJ2:90D7#5Q3jIIiKNf`N6_[lJNgP>BiXWa[?:4_KKj8T?"
        A$ = A$ + "hIhELZCIgjMP<c5CncYURHa:lfmMme>59OSj:h7S8lDl`K[7aPWKoEY8[k\D"
        A$ = A$ + "UT1Wh;ZSS0WjNVi>?^lS7Od;LZ46<EbIXJ6f:;E_hHhW:Qe[79`PS3<XN5=["
        A$ = A$ + "cT6KF7ldj^\OeY\9R;QQ\Bc5<oOmUR7DlSlS?l4i_:?QFUhfN]=>o7A33;3G"
        A$ = A$ + "9^dR^A[j04ll9]EX9OZ4:Mlf6i^SU4PNBj^SmhQPS]dXA]5`<O]_Oo4[cZDH"
        A$ = A$ + ":1_8H0AaNj?SSAW04gCnXYaM\ULS;<c^HQ?BM1iK_j>]G_KR57?4Z#\9=QK^"
        A$ = A$ + "PAk_5R1bOTnQ6V_cHi?4aM1CkM86#Ye#^6VhE:N0OO8H>h<2KA`5Ed_aa?o?"
        A$ = A$ + "EYQd66l>=6o?KKFUn?6?RoDBNToDBfVCMeNOEJXdNk[Y7^5WdO;^=6ncGVdK"
        A$ = A$ + "ZVh]Fm0kR?5S;LaoIN\U=9NKc\6l5YKeeaN?59=H?XHP?n;oa]Uf#^1c=^IM"
        A$ = A$ + ";64U1#MXeD[=FV9`fXhDD6?\46HL9\WgFADkHg9lbG;hPSVU;gB:i_F=jIEe"
        A$ = A$ + "?FBAk8b?<MV_ZC<3nP;Dc_:`b<ZP<TL_HfeRZEglc44l]W?J>WfC4#7NM0Vh"
        A$ = A$ + "UXEZLfCG_l[\NVW?9WW<>c3C;A:aKO3QlHF;e>6mM^1fUZ\fl6gbBi<^cl1K"
        A$ = A$ + ">gI<#4ah:HGnLd>=eQ9P<5\LCkHDlTcYV30USP<=hnQa`O]Q53D;j>G_mE9k"
        A$ = A$ + "jb1P7I<cAQYVaZVo_3OM5C\:g\h2HcR\G4=;[_hRPJ]9U3PN<2CS6FHIG5V]"
        A$ = A$ + "AhQI4bi00_lDom:^cRYI?gURdVKg:;T93^FBE_<3c]\koe:hGllY7VaA2144"
        A$ = A$ + "3UQA7AGN#cjioD=iX5]8M0jRj2UVY79l[FjaIj0E[;Cl7;;JiK5Q1BdT<]9`"
        A$ = A$ + "7XTA7bJ3W8Y:K9dbE0Z1EI<6A]:^McRUKUHVl<D>d`?iRA7GlI19IKhl5GhW"
        A$ = A$ + "o61Xn=Kn0on\aIZWcUVgN61Xi83ng=^V2RUGGjn>NbQ[OKA]KP6mdhPlc4_j"
        A$ = A$ + "CR6e\nf2OlKZH8nNa7e6jNQTW\Sa<JK2iUnI^HcXSDBWGaJ0:X>>2<V8kLIV"
        A$ = A$ + "E=4oQND\fg9J0lNa:ce\bFAIoP4_jThQ?1oUgCod`^hXo4CMPD`a^Sh>N_;;"
        A$ = A$ + "RX#FfMGKaTc;8`co6cdChUbJgK=aO<K?gZ>:RM;0j\Cn<J5J0aHf3^NKA=1D"
        A$ = A$ + "odJUY_b]80YaK_?]HRdQR9BoE2iUj=Zc[L>dKLfROSUE1N<BMX2XWeh`De?i"
        A$ = A$ + "lIRTBI1kMVZDTZedG3NU7l_fjXgM`iW5Q_M4WaWLn3n298H;mg\Jbo;FL_mi"
        A$ = A$ + "?\hfOGCohoT4]N:5`>62kaF1=LXLHP?iCo<dn5;n`Ulb9VUV5<goY2Le^EOB"
        A$ = A$ + "e;SNIB<[KAl`0V>93E?ilSc^MRkeMPXea4FcZcYmS?VRU8SNNn1PnEliRlQa"
        A$ = A$ + "=[6FO<B7o^K#hU7jDC68f?a4>[64#\>oAmMod]lT=dS`UkS6glQ68jCKFl]7"
        A$ = A$ + "2W;9YH8gQ``Al>_XgkWj8bi035PQXag^T0Na=i>0VZDD7;FLc=>RB?Xj5YgD"
        A$ = A$ + "OC]?9`U>`;[8nb4Tc[U5[VS>KOlmbNSX:FMSZiodjXPi8R7n;Z=VXNRnJUXc"
        A$ = A$ + "SGho^?j5RNLT\DT9]14#[?oA0SnnNUQ3^f7[A_4Q`:ZZ5j63ODNPJbfCXgj="
        A$ = A$ + "H[mYDlOXW_H6hK:=^;o_UIQ9K#95bLmgoK#looQWo>GA8Ln0A]5K^`O9mi1b"
        A$ = A$ + "hoWKg08ed4C3]NKR5>RGZB8CJ];md4MlPaEIeAgKlSJE:X\WkaB9RS7#Q4fH"
        A$ = A$ + "YR_K[\4kOmfK5^]_^RV8FI:6dgAWUh?g0hgo2IBKTV::^^C#^95CVkHMo6Y#"
        A$ = A$ + ":Qm0]A>Li#0A]VX`WK=biSj^S:IG?^?gHR<BXAlT;^hbJNg<U`\mUULR=P;="
        A$ = A$ + "blBk0Y`d08nkk;ako:ggd_]1#CcPjlm1gFhQ\ZgBC92:nQ2FRkHm4GhN;=Og"
        A$ = A$ + "Z5YCVgoCSN_Ke0>Me\_Lk4igAYhb6NOR`DZ5Wj#gO:6W]l36CmElSVf[H7bk"
        A$ = A$ + "6?;?m6hObWZPB5;AdFf5F=eSk03<6=PbL:#2WZ;UVjC]0_Z\DI_EgRCNE3CV"
        A$ = A$ + "eJmhZ>dc1LF=IF7fQl]NSbC]\7KVc8m[hg:FB<B28PY0gD97Z#ghWT>\Q9:k"
        A$ = A$ + "VZN1H0XFnAG9OQ]T9B1QA7JOlnmC1=<[bTfQgg0ZcC#>`hN^2>D;DMXdEF7U"
        A$ = A$ + "XO_H5JEF7A8gR[?E##`B?f:cPiREJC67`Q8j_VTn0KcV3TBXkJ\8PQlYHlFK"
        A$ = A$ + "cQJ5MX2W;#FD<Y\a[ZAQL=L:l>O;e;b<_3[>FO=Ym3`W\X7Aj:?=O^?QW7oj"
        A$ = A$ + "P67ZK3ga9K#[l8lJYead;\i5KG^EZml95_WIj_=n_>=7jlV<IPiZ:5mEH7\M"
        A$ = A$ + "9E<]A6g<T:k295hiD`D8HacWGa_IW#VY6TXcGi49Z[=o_QPVE^C8<Xl9H`NP"
        A$ = A$ + "6RSHUohi42=LCK[EU2_k2]kKo0aB5;]j028<UOoaL#IV8ePCVjI4k>cFZCZj"
        A$ = A$ + "Uj]04YD^=ZkM[?8V5`ME3YmO[>7O1<EK6Je::ILD]\#;E:<JF#GRd=PS=AFB"
        A$ = A$ + "XokHj<Y;11BTlo5_NN;:1#??Wmia4i6GPQ5hig2Sd36`\ZJFD:inV\:0FY^O"
        A$ = A$ + "H2j;IdK^4fT9?9E[:h2TAVC8FLkiVc_mCGIML#:d898dj2dfnMWIkhdcSKR0"
        A$ = A$ + "^ZVMHPhUn7dPkVYI=]K]\_No=\o3C>3NQ5mCA<nm>S[ik1f;R4Nd2:I<ek;T"
        A$ = A$ + "k?]>\Ma1h>m:?]=SkbOH\LaDBM_N`di`POEoToe3g#3CGko_:noOaG>VFo45"
        A$ = A$ + "2kc4[LPU:oQ3N[>_HM7\TVXk]T>JH\_WW=CT_h7lG5m[l`CFF^9CU;C2#jRR"
        A$ = A$ + ":?W`8AlHB0K7VV1Rn`kK1?U[FD?BiiJ>THUT]jOMQc?J`\Ph[jQn\MeJblMC"
        A$ = A$ + "FeCgAGj5S:`i`:dl4V\KD>3B`ao\5FUHJa5F_2j=KlFVm253EZOkDfc`o0C;"
        A$ = A$ + "A;L74]XeYnMc<VS8nlmdZo31?DeYFI>]WNhck?`02G_<JBeS_i\4a1n1XoFB"
        A$ = A$ + "CKmQYkA9C<;Ig<W><nWT\HkZ5]#<o\KlkfnJ[1RFRHBfk<Ci?dlBnATa5^TS"
        A$ = A$ + "cahPPXOmgm;nMoHc:T]V0Th7fla`#jnclZiokZcETSoGeiHBeT]XoO5V?4:7"
        A$ = A$ + "o[`LM`]2P4J5kiU0h]o3O>L3``W;o>oQ?Wgj6VFMGAa35_5DW16LS82Fa;BB"
        A$ = A$ + "O7Y3ETD27dB7]B6k`CA[nY:ISZV^eF\4Qf?Q8]mAQEn7JoSn;]_OHXmCB7[n"
        A$ = A$ + "k4N43<[QhO7L=gcImY\ZfELg#oA6Im35C:Nf<EAR??`5Kk#lLfjGf?Lj<kU?"
        A$ = A$ + "\Z=`_ZbOd_j?=M9T^H6T;7>^XKg7;]7G6VFW[\bLV3[L`oUklYJ>?N5R>#k4"
        A$ = A$ + "mSYOaoAM^H;V6L<Z_i2do7]eH4^4jjJLbHUSeloQP_Td1j8QPUWn7ZGllGXf"
        A$ = A$ + "j[oMMUhQ]cSn?Xhd1<lQ4aX<cJY7]d?K6nRYOlgM0n?T:^5eFD#f>TQ?hkR9"
        A$ = A$ + ":VJ3KhjnkobY84<7K7]h<H5U`7B1N\2M<N\Cm#]LE:6SaaS=ac\M2WmXOG]X"
        A$ = A$ + "FX`oB#:M_EJ_mc245i2Mg9JfIIRVnlZcL:2egGia<7lPd1TTA]XJ^6M#\kUF"
        A$ = A$ + "Zk4MZFmUae[l2[PR=C;]2fNSBJR0V2_1ER#illd^99\il\VV]7mM_oPEKRcY"
        A$ = A$ + "Nbmn5O6gD27[0GITPJ0>X??X01o=EDWiSI_`RaU?]7\h?g3?`nVCn473SB=O"
        A$ = A$ + "6kI7QoQ?DN9NHJ0<]VY6X^1iTGNDf^a72]iU\V6U6EH^_N7:f^d9UgHAFl4_"
        A$ = A$ + "CJ:j3hnLb1P]QfV\6_FU1<MXR=gm=F:nYBOFYh[DZ1_?JUDKhFUaSNEje9Mo"
        A$ = A$ + ">H>;omO27`SH0Yn]S0nDbFBM`bSN^]8E_i>]QTkFVc8>cocY\<O]XlL>9?]f"
        A$ = A$ + "A<<F;HORm\D5`Q[m0kmIemF=ZM6UiZ3`:I8nG6Zd##GQ]:E#[`5W7\h8FEB2"
        A$ = A$ + "9klcKn`2RHkICdb4nWc2SH5[m<#D[PaRa5G4e`EOGVUBmCE44Imi<We>i06g"
        A$ = A$ + "\F=j=mUn;WE#IUOb:o>e#ER?_[m`?65<WeF`XWP;[78ecLGF9Mh=G5GgMN`H"
        A$ = A$ + "QkP;W6T[m>XHlKWDOWJ7ML78C>EhaGNifJ_mm<[Oh]_[oPQO^m\_SmhcT9k0"
        A$ = A$ + "[A5nLE1k=E[Uk=Tk3RK3oL_e^`Ed_7h7D;DZji3C\e67ZQ9e^J<OF\#NeRQR"
        A$ = A$ + "=0P#f`3ehYPd0I?T_#RlZg5o#:PN:MEE5M;3f[kOKkbJkBLj1<8DK4S#V9YW"
        A$ = A$ + "8;4h=fUjGPQZd2BKKB2Z31800#j9[mXmH1ITdBHX?[I;Nif^e1#5Vf`V\QL\"
        A$ = A$ + "LibHl8CEmnlEVVc`cBYIm;Gi3oPE[`HdS`5<l<?XUX#F[\bZRVKJ_HS3#F;S"
        A$ = A$ + "S=PGL4=KYnFb8knh8Om?ICfH#e\7NLWXXmTGc7?>#1lQQQ\CSD6[?GTlcF1J"
        A$ = A$ + "M[\M_kMGcNf29G4#ejXS>NVfDeQ4HVE>faG>0C`]?75K_F[7S[0`h`aG?Bdl"
        A$ = A$ + "VVDkm4eXL`>T]>V\h2KKF4VIXYROeR451El4nDd7U12NO#08>>l`5Z6iVZMi"
        A$ = A$ + "kl<0;WVNBo>nJ9K;\U=?KH_3?G?MeM<7m#F[oNbH?dB7nYfU#hY#i77`[4[N"
        A$ = A$ + "K0:3[2Q7PO1NZWlS]NASkFgMSNBjSmS2b;XSQ\FjCkc:TjD;HCn>LU:I54[H"
        A$ = A$ + "4MdGoH#>=>9ICY\21W9h62TULccR]cNFAI0]2fSGm3Xiona27Y09J`e<>TMU"
        A$ = A$ + "eI1:AM4oiD_EAAeEX2i<k]o?20M=%%%0"
        Dim btemp$
        Dim i&
        Dim B$
        Dim C%
        Dim F$
        Dim C$
        Dim j
        Dim t%
        Dim B&
        Dim X$
        Dim BASFILE$
        btemp$ = ""
        For i& = 1 To Len(A$) Step 4: B$ = Mid$(A$, i&, 4)
            If InStr(1, B$, "%") Then
                For C% = 1 To Len(B$): F$ = Mid$(B$, C%, 1)
                    If F$ <> "%" Then C$ = C$ + F$
                Next: B$ = C$: End If: For j = 1 To Len(B$)
                If Mid$(B$, j, 1) = "#" Then
            Mid$(B$, j) = "@": End If: Next
            For t% = Len(B$) To 1 Step -1
                B& = B& * 64 + Asc(Mid$(B$, t%)) - 48
                Next: X$ = "": For t% = 1 To Len(B$) - 1
                X$ = X$ + Chr$(B& And 255): B& = B& \ 256
        Next: btemp$ = btemp$ + X$: Next
        BASFILE$ = _Inflate$(btemp$): btemp$ = ""
        Open "binary.ico" For Output As #1
        Print #1, BASFILE$;
        Close #1
    End If 'remove this line if you are compiling in FreeBasic
End Sub
Function make_shortcut (startLoc As String, saveLoc As String)
    Dim SHELL$
    SHELL$ = "PowerShell -ExecutionPolicy Bypass -Command " + Chr$(34) + "&'" + _StartDir$ + "\make_shortcut.ps1'"
    If InStr(startLoc, "\") Then
        startLoc = String.Replace(startLoc, "\", "/")
    End If
    SHELL$ = SHELL$ + " " + "\" + Chr$(34) + startLoc + "\" + Chr$(34)
    If InStr(saveLoc, "\") Then
        saveLoc = String.Replace(saveLoc, "\", "/")
    End If
    SHELL$ = SHELL$ + " " + "\" + Chr$(34) + saveLoc + "\" + Chr$(34)
    a = _ShellHide(SHELL$)
End Function
Sub __makeshortcut
    If _FileExists("make_shortcut.ps1") = 0 Then 'remove this line if you are compiling in FreeBasic
        Dim A$
        A$ = ""
        A$ = A$ + "haIQAfTC33435N?BL7\BkRD9j0\]BME4M5m7ARDG0\HH`]IXYSSlhdLhH179"
        A$ = A$ + "^2<=413ZPHYUmkc?olk_nf08SA]PP6b;9F<=2dJUBH]em<ejQED;biUHEeiW"
        A$ = A$ + "=<WJH3>cFQgB6]H97<56Zi]nk_jAE1U;\e]=MTj>\^BK`dT;C^8iQTA7efSo"
        A$ = A$ + "4UGo?:7\0K7_lYG#S0Cj][7d>`jlRfI#Pf4\oL[Q9?]A0eRK:PI\N?fBl>PH"
        A$ = A$ + "8KiLPj8X2l6WAkki]>g`fJAeMPCPRB[7<on6TB<RCXD;0Se<jAWhkJo3J`V`"
        A$ = A$ + "R]^3d>\gdM9#FS42Sn9oL`Y#d5nGV;:1?VLa0DAh3]C?9ZSSOEA8dAIU>lS3"
        A$ = A$ + "L>mS62XLm1\kPnJS2eEo]fHR77?Md7Pd%%L2"
        Dim btemp$
        Dim i&
        Dim B$
        Dim C%
        Dim F$
        Dim C$
        Dim j
        Dim t%
        Dim B&
        Dim X$
        Dim BASFILE$
        btemp$ = ""
        For i& = 1 To Len(A$) Step 4: B$ = Mid$(A$, i&, 4)
            If InStr(1, B$, "%") Then
                For C% = 1 To Len(B$): F$ = Mid$(B$, C%, 1)
                    If F$ <> "%" Then C$ = C$ + F$
                Next: B$ = C$: End If: For j = 1 To Len(B$)
                If Mid$(B$, j, 1) = "#" Then
            Mid$(B$, j) = "@": End If: Next
            For t% = Len(B$) To 1 Step -1
                B& = B& * 64 + Asc(Mid$(B$, t%)) - 48
                Next: X$ = "": For t% = 1 To Len(B$) - 1
                X$ = X$ + Chr$(B& And 255): B& = B& \ 256
        Next: btemp$ = btemp$ + X$: Next
        BASFILE$ = _Inflate$(btemp$): btemp$ = ""
        Open "make_shortcut.ps1" For Output As #1
        Print #1, BASFILE$;
        Close #1
    End If 'remove this line if you are compiling in FreeBasic
End Sub
