; variables
HOME := "C:\Users\adhip"
ALACRITTY_DIR := HOME . "\AppData\Roaming\alacritty"
QUTEBROWSER_DIR := HOME . "\AppData\Local\qutebrowser"
NEOVIM_DIR := HOME . "\AppData\Local\nvim"
SIOYEK_DIR := HOME . "\Documents\Software\sioyek-release-windows"
WIREGUARD_CONF := HOME . "\Documents\client.conf"
CHROME_DIR := "C:\Program Files\Google\Chrome"

; switch input method
^Space::
  {
    Send "^{Shift}"
  }

  ; CapsLock to Esc
  #HotIf WinActive("ahk_exe qutebrowser.exe") or WinActive("ahk_exe alacrrity.exe") or WinActive("ahk_exe sioyek.exe")
CapsLock::
  {
    Send "{Esc}"
  }
  #HotIf

  ; search
#m::
  {
    Send "#s"
  }

  ; close process
#Space::
  {
    Send "!{F4}"
  }

  ; direction
CapsLock & j::
  {
    Send "{Down}"
  }
CapsLock & k::
  {
    Send "{Up}"
  }
CapsLock & h::
  {
    Send "{Left}"
  }
CapsLock & l::
  {
    Send "{Right}"
  }
CapsLock & u::
  {
    Send "{PgUp}"
  }
CapsLock & d::
  {
    Send "{PgDn}"
  }

  ; explorer
#f::
  {
    Run "explorer"
  }

  ; alacrrity
#Enter::
  {
    Run ALACRITTY_DIR . "\start.bat"
  }

  ; qutebrowser
#q::
  {
    if WinExist("ahk_exe qutebrowser.exe") {
      WinActivate("ahk_exe qutebrowser.exe")
    } else {
      Run QUTEBROWSER_DIR . "\qutebrowser.exe"
      Sleep 3000
      WinActivate("ahk_exe qutebrowser.exe")
      Send "{F11}"
    }
  }

  ; nvim
#n::
  { 
    if WinExist("NVIM") {
      WinActivate("NVIM")
    } else {
      Run NEOVIM_DIR . "\start.bat"
    }
  }

  ; PDF
#p::
  {
    if WinExist("ahk_exe sioyek.exe") {
      WinActivate("ahk_exe sioyek.exe")
    } else {
      Run SIOYEK_DIR . "\sioyek.exe"
      Sleep 2000
      WinActivate("ahk_exe sioyek.exe")
      Send "{F11}"
    }
  }

  ; chrome
#g::
  {
    if WinExist("ahk_exe chrome.exe") {
      WinActivate("ahk_exe chrome.exe")
    } else {
      Run CHROME_DIR . "\Application\chrome.exe"
      Sleep 3000
      WinActivate("ahk_exe chrome.exe")
    }
  }

  ; wireguard
#PgUp::
  {
    Run "*RunAs wireguard.exe /installtunnelservice " . WIREGUARD_CONF
  }

#PgDn::
  {
    Run "*RunAs wireguard.exe /uninstalltunnelservice client"
  }