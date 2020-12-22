unit newComboBox;

{$mode objfpc}{$H+}

interface

uses
  jwawindows, windows, Classes, SysUtils, stdctrls, controls, messages, lmessages,
  Win32Extra, LCLClasses,LCLProc, graphics;

type
  TNewComboBox=class(TComboBox)
  private
    creatingBrush: boolean;
  protected
    procedure CreateBrush; override;
  public
  end;

var
  OriginalComboboxListHandler: ptruint;
  comboBoxdefaultBrush: TBrush;

function ComboboxListSubClass(wnd:HWND; msg:UINT; _wparam:WPARAM; _lparam:LPARAM):LRESULT; stdcall;

implementation

uses Menus, Win32WSMenus, betterControls;


function ComboboxListSubClass(wnd:HWND; msg:UINT; _wparam:WPARAM; _lparam:LPARAM):LRESULT; stdcall;
begin
  if msg=WM_CTLCOLORLISTBOX then
  begin
    SetTextColor(_wparam, ColorSet.FontColor);
    exit(comboBoxdefaultBrush.handle);
  end;

  result:=CallWindowProc(WNDPROC(OriginalComboboxListHandler), wnd, msg, _wparam, _lparam);
end;

procedure TNewComboBox.CreateBrush;
var
  cbi: TCOMBOBOXINFO;
begin
  if creatingBrush then
  begin
    inherited createbrush;
    exit;
  end;

  creatingBrush:=true;
  cbi.cbSize:=sizeof(cbi);
  if GetComboBoxInfo(handle, @cbi) then
  begin

    AllowDarkModeForWindow(cbi.hwndCombo,1);
    AllowDarkModeForWindow(cbi.hwndItem,1);
    AllowDarkModeForWindow(cbi.hwndList,1);

    SetWindowTheme(cbi.hwndCombo, 'cfd', nil);
    SetWindowTheme(cbi.hwndItem, 'cfd', nil);
    SetWindowTheme(cbi.hwndList, 'explorer', nil);

    if OriginalComboboxListHandler=0 then
      OriginalComboboxListHandler:=SetWindowLongPtr(cbi.hwndCombo, GWLP_WNDPROC, UINT_PTR(@ComboboxListSubClass))
    else
      SetWindowLongPtr(cbi.hwndCombo, GWLP_WNDPROC, UINT_PTR(@ComboboxListSubClass));

  end;

  inherited CreateBrush;


  brush.color:=ColorSet.EditBackground;
  font.color:=colorset.FontColor;

  if comboboxdefaultBrush=nil then
  begin
    comboboxdefaultBrush:=TBrush.Create;
    comboboxdefaultBrush.Assign(brush);
  end;
  creatingbrush:=false;
end;



end.

