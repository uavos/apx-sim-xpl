# APX aircraft models and files for X-Plane

This repository contains the aircraft models and files for the [X-Plane flight simulator](https://www.x-plane.com/).

Models are developed by `UAVOS` and are used in the [APX Autopilot](https://docs.uavos.com/) for simulation and testing purposes.

> The minimum X-Plane version required is 12. All models are saved in the X-Plane 12 Plane Maker format.

## Models

| Model | Description |
|---|---|
| [FW10](models/FW10) | Fixed wing (flying wing) UAV, 10 kg MTOW, electric, catapult launch. |
| [LR70](models/LR70) | UAV helicopter, 25 kg MTOW, diesel engine, electric tail rotor. |
| [S1B](models/S1B) | Fixed wing MALE UAV, 120 kg MTOW, piston engine. |
| [S1C](models/S1C) | Fixed wing MALE UAV, 1200 kg MTOW, piston engine. |

## Installation

Download the repository and copy the desired model folders to the `X-Plane/Aircraft` directory.

X-Plane writes a `<model>_prefs.txt` file next to each aircraft at runtime (Hobbs time, avionics display preferences, ATC tail number). These files are not part of the models and are ignored by git.

## Running APX simulations

To run the APX simulations, install the [APX GCS](https://docs.uavos.com/) and configure the aircraft parameters.

The [conf](conf) directory contains unit configuration examples exported from GCS for the `sim` node (firmware 11.2.24), one per model:

- [SIM-FW10.unit](conf/SIM-FW10.unit)
- [SIM-LR70.unit](conf/SIM-LR70.unit)
- [SIM-S1B.unit](conf/SIM-S1B.unit)
- [SIM-S1C.unit](conf/SIM-S1C.unit)

Import a configuration in GCS from the unit menu: `Share` → `Import unit configuration`.
