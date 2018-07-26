# Uplink

This directory contains two programs supporting the Columbia Scientific
Balloon Facility (CSBF) simple uplink capability.

## uplink

uplink is a driver that runs on the Ground Support Equipment (GSE)
computer. It reads single-byte commands from the local command server,
formats them according to the CSBF protocol, and writes them out
to the serial port.

The CSBF systems transmit the command to the balloon payload, where
the RF signal is demodulated by the CIP and decoded by the MaCaPs
board, and the single byte of uplink data is then written to the
a serial port connected to the instrument.

uplink_rcvr is the driver that runs on the instrument computer on
the balloon. It reads single-byte codes from the serial port and
forwards them as software status instructions to the command
server.

