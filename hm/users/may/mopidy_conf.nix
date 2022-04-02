''
    [core]
    cache_dir = $XDG_CACHE_DIR/mopidy
    config_dir = $XDG_CONFIG_DIR/mopidy
    data_dir = $XDG_DATA_DIR/mopidy
    max_tracklist_length = 10000
    restore_state = false
    
    [logging]
    verbosity = 0
    format = %(levelname)-8s %(asctime)s [%(process)d:%(threadName)s] %(name)s\n  %(message)s
    color = true
    config_file =
    
    [audio]
    mixer = software
    mixer_volume = 
    output = autoaudiosink
    buffer_time = 
    
    [proxy]
    scheme = 
    hostname = 
    port = 
    username = 
    password = 
    
    [file]
    enabled = true
    media_dirs = 
      $HOME/Music/flac/|Music
    excluded_file_extensions = 
      .directory
      .html
      .jpeg
      .jpg
      .log
      .nfo
      .pdf
      .png
      .txt
      .zip
    show_dotfiles = false
    follow_symlinks = false
    metadata_timeout = 1000
    
    [http]
    enabled = false
    hostname = 127.0.0.1
    port = 6680
    zeroconf = Mopidy HTTP server on $hostname
    allowed_origins = 
    csrf_protection = true
    default_app = mopidy
    
    [m3u]
    enabled = true
    base_dir = $XDG_MUSIC_DIR
    default_encoding = latin-1
    default_extension = .m3u8
    playlists_dir =
    
    [softwaremixer]
    enabled = true
    
    [stream]
    enabled = true
    protocols = 
      http
      https
      mms
      rtmp
      rtmps
      rtsp
    metadata_blacklist = 
    timeout = 5000
    
    [mpd]
    enabled = true
    hostname = 127.0.0.1
    port = 6600
    password = 
    max_connections = 20
    connection_timeout = 60
    zeroconf = Mopidy MPD server on $hostname
    command_blacklist = 
      listall
      listallinfo
    default_playlist_scheme = m3u
    
    [local]
    enabled = true
    media_dir = ~/Music/flac/
    scan_timeout = 1000
    scan_flush_threshold = 100
    scan_follow_symlinks = false
    excluded_file_extensions = 
      .directory
      .html
      .jpeg
      .jpg
      .log
      .nfo
      .pdf
      .png
      .txt
      .zip
    directories = 
      Albums                  local:directory?type=album
      Artists                 local:directory?type=artist
      Composers               local:directory?type=artist&role=composer
      Genres                  local:directory?type=genre
      Performers              local:directory?type=artist&role=performer
      Release Years           local:directory?type=date&format=%25Y
      Tracks                  local:directory?type=track
      Last Week's Updates     local:directory?max-age=604800
      Last Month's Updates    local:directory?max-age=2592000
    timeout = 10
    use_artist_sortname = false
    album_art_files = 
      *.jpg
      *.jpeg
    
    [spotify]
    enabled = true
    bitrate = 320
    volume_normalization = true
    private_session = false
    timeout = 10
    allow_cache = true
    allow_network = true
    allow_playlists = true
    search_album_count = 20
    search_artist_count = 10
    search_track_count = 50
    toplist_countries = 
''
