proc add_wave_zoom {stime num} {
  echo "Bookmarking wave $num"
  bookmark add wave "bk$num" "[expr $stime - 100] [expr $stime + 50]" 0
}

add wave -r /*
radix -hex -showbase
when {clk'event and clk="1"} {
  echo "Count is [exa count]"
  if {[examine count] == "8'h27"} {
    add_wave_zoom $now 1
  } elseif {[examine count] == "8'h47"} {
    add_wave_zoom $now 2
  }
}
