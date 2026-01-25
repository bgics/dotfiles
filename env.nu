$env.config.shell_integration.osc133 = false

$env.config.show_banner = false
$env.config.edit_mode = 'vi'

def zj [] {
  let sessions = (zellij ls -s -n)
  let num_sessions = (zellij ls | lines | length)

  if ($env.ZELLIJ? | is-empty) {
    if $num_sessions >= 2 {
      let choice = ($sessions | fzf)
      if ($choice | is-not-empty) {
        zellij attach $choice
      }
    } else {
      zellij attach -c            
    }
  } 
}
