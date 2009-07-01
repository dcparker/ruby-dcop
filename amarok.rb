require 'dcop'
# Automatically builds the Amarok library based on everything available in amarok through dcop!
DCOP.build!('amarok', 'user' => 'jukeman', 'session' => '.DCOPserver_jukeman-elkhart__0')

# Begin the process!
# 1) Download the updates
  journals = Journal.from_server
# 2) Apply them to the database
  journals.each {|j| j.apply }
# 3) Apply database to Amarok
  Playlist.active.apply_to_amarok
