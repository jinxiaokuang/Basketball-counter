# ----------------------------------------
# Created on: Wed May 31 08:34:57 2023
# Auto generated by Pango
# ----------------------------------------

vsim  -voptargs="+acc" -L work -L usim tb_top usim.GTP_GRS
add wave *
view wave
view structure
view signals

run 1000ns

# ----------------------------------------
