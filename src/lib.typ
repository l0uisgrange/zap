// Export dependencies
#import "dependencies.typ": cetz
#import cetz: draw

// Export circuit
#import "circuit.typ": circuit

// Export utils
#import "utils.typ": set-style

// Export styles
#import "styles.typ"

// Export core
#import "component.typ": component, interface

// Export components
#import "components/antenna.typ": antenna
#import "components/transformer.typ": transformer
#import "components/stub.typ": estub, nstub, sstub, stub, wstub
#import "components/wire.typ": swire, wire, zwire
#import "components/circulator.typ": circulator
#import "components/node.typ": node
#import "components/capacitor.typ": capacitor, pcapacitor
#import "components/diode.typ": diode, led, photodiode, schottky, tunnel, zener
#import "components/switch.typ": switch
#import "components/fuse.typ": afuse, fuse
#import "components/supply.typ": earth, frame, ground, vcc, vee
#import "components/inductor.typ": inductor
#import "components/logic.typ": aand, abuffer, alogic, anand, anor, anot, aor, axnor, axor, land, lnand, lnor, lnot, lor, lxnor, lxor
#import "components/resistor.typ": heater, potentiometer, resistor, rheostat
#import "components/source.typ": acvsource, disource, dvsource, isource, vsource
#import "components/motor.typ": acmotor, dcmotor
#import "components/transistors/bjt.typ": bjt, npn, pnp
#import "components/transistors/mosfet.typ": mosfet, nmos, nmos_simple, nmosd, pmos, pmos_simple, pmosd
#import "components/integrated/opamp.typ": opamp
#import "components/integrated/mcu.typ": mcu
#import "components/integrated/converter.typ": adc, dac
#import "components/instruments/round-meter.typ": ammeter, ohmmeter, round-meter, voltmeter, wattmeter
#import "components/button.typ": button, ncbutton, ncibutton, nobutton, noibutton
#import "components/integrated/flipflop.typ": dflipflop, flipflop, jkflipflop, srlatch

//new
#import "components/integrated/multiplexer.typ": dmux, dmux2, dmux4, dmux8, mux, mux2, mux4, mux8
#import "components/integrated/decoder.typ": dec1to2, dec2to4, dec3to8, decoder
#import "components/integrated/flipflop_top.typ": dff_enable, dff_enable_inv, dff_reset, dff_reset_inv, dflipflop_top, dlatch_top, flipflop_top
#import "components/integrated/register.typ": reg2bit, reg3bit, reg4bit, reg5bit, reg6bit, reg7bit, reg8bit, register
#import "components/integrated/adder.typ": full_adder, half_adder
#import "components/integrated/zero_extend.typ": sign_extend, zero_extend
#import "components/integrated/shifter.typ": shifter, shiftla, shiftll, shiftra, shiftrl

