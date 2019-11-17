if (!is_channel_registered('BungeeCord'), register_channel('BungeeCord'))
 
bind('plugin_message_received',null,null,@e){
    @debug = false;
    if (@debug){
        broadcast('Array Keys in event [plugin_message_recieved]: '.array_keys(@e),'jwtest');
        broadcast('Channel: '.@e['channel'],'jwtest');
        broadcast('event_type: '.@e['event_type'],'jwtest');
        broadcast('macrotype: '.@e['macrotype'],'jwtest');
        broadcast('player: '.@e['player'],'jwtest');
        broadcast('Event Bytes undecoded: '.@e['bytes'],'jwtest');
    }
}
 
bind('plugin_message_received',null,array(Channel: 'BungeeCord'),@e){
    @debug = false;
    if (@debug){
        console('Array Keys in event [plugin_message_recieved]: ',array_keys(@e));
        broadcast('Array Keys in event [plugin_message_recieved]: '.array_keys(@e),'devtest');
            
        console('Channel: '.@e['channel']);
        broadcast('Channel: '.@e['channel'],'devtest');
            
        console('event_type: '.@e['event_type']);
        broadcast('event_type: '.@e['event_type'],'devtest');
            
        console('macrotype: '.@e['macrotype']);
        broadcast('macrotype: '.@e['macrotype'],'devtest');
            
        console('player: '.@e['player']);
        broadcast('player: '.@e['player'],'devtest');
            
        console('Event Bytes undecoded: '.@e['bytes']);
        broadcast('Event Bytes undecoded: '.@e['bytes'],'devtest');
        
        @bytearray = @e['bytes'];
        ba_rewind(@bytearray);
        @request = ba_get_string(@bytearray);
    
        # console('Request: '.@request)
        # broadcast('Request: '.@request,'devtest')
        
        switch (@request){
            case 'IP':  #get the real ip from the player
                @ipofplayer = ba_get_string(@e['bytes']);
                @portofplayer = ba_get_int(@e['bytes']);
                console('IP: '.@ipofplayer.':'.@portofplayer);
                broadcast('IP: '.@ipofplayer.':'.@portofplayer,'devtest');
                break();
                
            case 'PlayerCount': #shows the player count of server
                @server = ba_get_string(@bytearray);
                @playercount = ba_get_int(@bytearray);
                console('server: '.@server);
                broadcast('server: '.@server,'devtest');
                
                console('NumberOfPlayers: '.@playercount);
                broadcast('NumberOfPlayers: '.@playercount,'devtest');
                break();

            case 'PlayerList': #shows every player in the server
                @server = ba_get_string(@bytearray);
                @players = split(',',ba_get_string(@bytearray));
                console('server: '.@server);
                broadcast('server: '.@server,'devtest');
                
                console('players: '.@players);
                broadcast('players: '.@players,'devtest');
                break();

            case 'GetServers': #shows all servers
                @servers = split(',',ba_get_string(@bytearray));
                console('Servers: '.@servers);
                broadcast('Servers: '.@servers,'devtest');
                break();

            case 'GetServer': #shows current server
                @servername = ba_get_string(@bytearray);
                console('Servername: '.@servername);
                broadcast('Servername: '.@servername,'devtest');
                break();

            case 'Forward': #recieve incoming message         
                @channel = ba_get_string(@e['bytes']);
                @message = ba_get_string(@e['bytes']);
                console('Channel: '.@channel);
                broadcast('Channel: '.@channel,'devtest');
                
                console('Message: '.@message);
                broadcast('Message: '.@message,'devtest');
                break();

            case 'Developer': #recieve incoming message     
                @message = ba_get_string(@e['bytes']);
                console(colorize('CHAT: '.@message));
                broadcast(colorize(@message),developer);
                break();

            case 'UUID':  #shows Unique User ID of currentplayer
                @UUID = ba_get_string(@e['bytes']);
                console('UUID: '.@UUID);
                broadcast('UUID: '.@UUID,'devtest');
                break();

            case 'UUIDOther':  #shows Unique User ID of otherplayer     
                @uuidplayer = ba_get_string(@e['bytes']);
                @uuid = ba_get_string(@e['bytes']);
                console('UUID of player: '.@uuidplayer.' = '.@uuid);
                broadcast('UUID of player: '.@uuidplayer.' = '.@uuid,'devtest');
                break();

            default: # nothing found, throw exception
                throw(PluginInternalException,'No correct request found, are you sure BungeeCord did not change the plugin msg format?');
        }
    }
}

 
