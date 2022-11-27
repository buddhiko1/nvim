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
    return
  }

  ; CapsLock to Esc
  #HotIf WinActive("ahk_exe qutebrowser.exe") or WinActive("ahk_exe alacrrity.exe") or WinActive("ahk_exe sioyek.exe")
CapsLock::
  {
    Send "{Esc}"
    return
  }
  #HotIf

  ; search
#m::
  {
    Send "#s"
    return
  }

  ; task manager
#i::
  {
    Run "taskmgr"
    return
  }

  ; close process
#Space::
  {
    Send "!{F4}"
    return
  }

  ; direction
CapsLock & j::
  {
    Send "{Down}"
    return
  }
CapsLock & k::
  {
    Send "{Up}"
    return
  }
CapsLock & h::
  {
    Send "{Left}"
    return
  }
CapsLock & l::
  {
    Send "{Right}"
    return
  }
CapsLock & u::
  {
    Send "{PgUp}"
    return
  }
CapsLock & d::
  {
    Send "{PgDn}"
    return
  }

  ; explorer
#f::
  {
    Run "explorer"
    return
  }

  ; alacrrity
#Enter::
  {
    Run ALACRITTY_DIR . "\start.bat"
    return
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
    return
  }

  ; nvim
#n::
  { 
    if WinExist("NVIM") {
      WinActivate("NVIM")
    } else {
      Run NEOVIM_DIR . "\start.bat"
    }
    return
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
    return
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
    return
  }

  ; wireguard
#PgUp::
  {
    Run "*RunAs wireguard.exe /installtunnelservice " . WIREGUARD_CONF
    return
  }

#PgDn::
  {
    Run "*RunAs wireguard.exe /uninstalltunnelservice client"
    return
  }

  #HotIf WinActive("Yuris Revenge")
RButton::
  {
    Loop 5
    {
      Click
      Sleep 100
    }
  }
  #HotIf