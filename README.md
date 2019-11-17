### CHBungeeCord
#####*BungeeCord Procs for CommandHelper*

|_GetIP()
|-
|Get a player's real IP from BungeeCord*
|**arguments:** _string_ player

|_PlayerCount()
|-
|Get a server's player count from BungeeCord*
|**arguments:** _string_ server

|_PlayerList()
|-
|Get a server's player list from BungeeCord*
|**arguments:** _string_ server

|_GetServers()
|-
|Get a list of servers from BungeeCord*
|**arguments:** _none_

|_Message()
|-
|Send a player a message through BungeeCord
|**arguments:** _string_ player, _string_ message

|_GetServerName()
|-
|Get this server's name according to BungeeCord*
|**arguments:** _none_

|_Broadcast()
|-
|Broadcast a message through BungeeCord
|**arguments:** _string_ channel, _string_ message

\* - Getting information from bungeecord requires listening for a response by binding the 'plugin_message_received' event. Examples can be found in main.ms.