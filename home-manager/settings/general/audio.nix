{ ... }: {
  # Makes bluetooth not use dogshit microphone standards that reduce the bitrate
  # of the audio to single digits >:((((((
  xdg.configFile."wireplumber/wireplumber.conf.d/kill-dogwater-bt-audio.conf" = {
    enable = true;
    # please fucking die
    text = ''
monitor.bluez.properties = {
   bluez5.roles = [ a2dp_sink a2dp_source bap_sink bap_source ]
}
    '';
  };
} 

