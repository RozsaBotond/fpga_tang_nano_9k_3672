# Tang Nano 9K – LED chaser

A small Verilog project for the Sipeed Tang Nano 9K (Gowin GW1NR-9): the six
onboard LEDs bounce a lit LED back and forth, stepping every 0.5 s (27 MHz clock).

## Files

- `led.v` – the design (top module `top`)
- `conf.cst` – pin constraints (clock on pin 52, LEDs on pins 10–16)
- `fpga.lushay.json` – project file for the Lushay Code VS Code extension
- Board schematic: not included here (Sipeed's copyright). It is
  `Tang_Nano_9k_3672_Schematic.pdf`, listed under *Hardware Resources → Schematic*
  on Sipeed's Tang Nano 9K wiki page
  ([GitHub](https://github.com/sipeed/sipeed_wiki/blob/main/docs/hardware/en/tang/Tang-Nano-9K/Nano-9K.md),
  [wiki.sipeed.com](https://wiki.sipeed.com/hardware/en/tang/Tang-Nano-9K/Nano-9K.html)).
