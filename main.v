module main

import dariotarantini.vgram
import rand
import time

fn main(){
    println('Telegram Bot is working...')
    mut data := ""
    bot := vgram.new_bot('5073564393:AAExwmeciquyG4ZPr6M2bBXDbvPLuLaQEBc')
    for {
          x := bot.get_updates(vgram.ConfigGetUpdates{0,4,0,''})
          for i := 0; i < x.len; i++ {
	     mut msg := x[i].message.chat.id
	     if "$msg" == data { continue }
	     data = "$msg"	
	     bot.send_message(vgram.ConfigSendMessage{chat_id: "$msg", text: 'Welcome to Hoster-Finder! Your Chat ID is:'})
	     bot.send_message(vgram.ConfigSendMessage{chat_id: "$msg", text: "$msg"})
          }
          time.sleep(time.second * rand.int_in_range(2,13))
    }
}
