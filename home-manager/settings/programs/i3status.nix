{
  enable = true;
  enableDefault = false;
  general = {
    interval        = 1;
    colors          = true;
    color_good      = "#88b090";
    color_degraded  = "#ccdc90";
    color_bad       = "#e89393";
  };
  modules = {
    #"wireless wlo1" = {
    #  settings = {
    #    format_up = " %essid (%quality)";
    #    format_down = "";
    #  };
    #};
    
    #"ethernet enp8s0" = {
    #  settings = {
    #    format_up = "%ip (%speed)";
    #    format_down = "";
    #  };
    #};
    
    "battery 0" = {
      position = 2;
      settings = {
        format = "%status%percentage %remaining";
        format_down = "";
        last_full_capacity = true;
        integer_battery_capacity = true;
        low_threshold = 11;
        threshold_type = "percentage";
        hide_seconds = true;
        status_chr = " ";
        status_bat = " ";
        status_unk = " ";
        status_full = " ";
      };
    };
    
    "battery 1" = {
      position = 3;
      settings = {
        format = "%status%percentage %remaining";
        format_down = "";
        last_full_capacity = true;
        integer_battery_capacity = true;
        low_threshold = 11;
        threshold_type = "percentage";
        hide_seconds = true;
        status_chr = " ";
        status_bat = " ";
        status_unk = " ";
        status_full = " ";
      };
    };
    
    "tztime local" = {
      position = 6;
      settings.format = " %a %e.%b %H:%M:%S";
    };
    
    #"load" = {
    #  settings.format = " %1min";
    #};
    
    "cpu_usage" = {
      position = 5;
      settings.format = " %usage";
    };
    
    "cpu_temperature 0" = {
      position = 4;
      settings.format = " %degrees°C";
    };
    
    "disk /" = {
      position = 1;
      settings = {
        format = " %avail";
        prefix_type = "custom";
        low_threshold = 20;
        threshold_type = "percentage_avail";
      };
    };
    
    #"volume master" = {
    #  settings = {
    #    format = " %volume";
    #    format_muted = " ";
    #    device = "default";
    #    mixer = "Master";
    #    mixer_idx = 0;
    #  };
    #};
  };
}
