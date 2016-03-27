if ENV['SSH_CLIENT'] || ENV['FORCE_TMUX_NOTIFICATION']
  if ENV['TMUX']
    notification :tmux,
      display_message: true,
      timeout: 5,
      default_message_format: '%s >> %s',
      line_separator: ' > ',
      color_location: 'status-left-bg',
      default_message_color: 'black',
      success: 'colour150',
      failure: 'colour174',
      pending: 'colour179',
      display_on_all_clients: true
  else
    notification :off
  end
end
