{ pkgs, config }: {
  enable = true;
  package = pkgs.mpd;
  musicDirectory = "${config.home.homeDirectory}/Music";
  network = {
    startWhenNeeded = true;
    listenAddress = "127.0.0.1";
  };
  extraConfig = ''
audio_output_format "44100:16:2"

audio_output {
      type  "pulse"
      name  "PulseAudio"
      mixer_type  "hardware"
      buffer_time "1000"
}

audio_output {
      type               "fifo"
      name               "toggle_visualizer"
      path               "/tmp/mpd.fifo"
      buffer_time        "100"
}
  '';
}
