import { Socket } from 'phoenix'

const socket = new Socket('/socket', { params: { token: window.userToken } })

socket.connect()

// Now that you are connected, you can join channels with a topic:
const channel = socket.channel(`js:${window.userToken}`, {})

// Clear the value of an input field
channel.on('clear_input', payload => {
  if (payload.id) {
    const input = document.getElementById(payload.id)
    input.value = ''
    input.focus()
    console.log('input value cleared')
  }
})

channel.on('focus_input', payload => {
  if (payload.id) {
    document.getElementById(payload.id).focus()
  }
})

channel.join()
  .receive('ok', resp => { console.log('Joined successfully', resp) })
  .receive('error', resp => { console.log('Unable to join', resp) })

export default socket
