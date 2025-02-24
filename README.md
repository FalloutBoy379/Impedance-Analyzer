# Bioimpedance Measurement System

## Overview
This project involves a wearable bioimpedance measurement system using the **AD5941** and **STM32F411CEU6**. The system is designed to measure impedance using a flexible electrode configuration while maintaining low power consumption for extended battery life.

## Features
- **AD5941 for impedance measurement**
- **Wearable PCB form factor** (4cm × 4cm)
- **Low-power voltage regulator (AP7215)**
- **Battery-powered operation with power optimization**
- **Flexible electrode configuration through switch matrix**
- **Custom driver implementation for dynamic electrode switching**
- **Conforms to IEC 60601 standards for safe bioimpedance measurement**

---

## Hardware Components
### AD5941
- Onboard **DFT (Discrete Fourier Transform)** engine
- **Programmable switch matrix** for flexible electrode selection
- **Calibration features** for accurate impedance measurement
- **Wide frequency output range**

### STM32F411CEU6
- Chosen for **readily available hardware** for testing
- Supports **SWD programming via edge connector**

### AP7215 Voltage Regulator
- Provides **3.3V power supply**
- Low quiescent current: **55μA (no load)** vs **5mA (AMS1117)**
- Ideal for **wearable battery-powered applications**

### Other Key Components
- **Solder bridges** to disable LED and configure boot mode
- **1mm square pads** for flexible electrode placement
- **Dedicated Li-ion battery slot** (supports **100mAh battery**)

---

## Battery Life Estimation
Using the formula:
\[ \text{Battery Life} = \frac{\text{Battery Capacity (mAh)}}{\text{Current Consumption (mA)}} \]

| Mode                  | Current Draw | Battery Life (100mAh) |
|----------------------|-------------|----------------------|
| Active Measurement  | ~40mA       | **2.5 hours**       |
| Mixed Usage         | ~22.5mA     | **4.4 hours**       |
| Mostly Idle         | ~5mA        | **20 hours**        |

*A battery charging circuit was considered but not implemented due to time constraints.*

---

## Switch Matrix Configuration
### Measurement Pairs
| Pair | Excitation (CE0) | Positive Input (V+) | Negative Input (V-) | Return Path |
|------|----------------|-------------------|-------------------|-------------|
| 1    | CE0            | AIN1             | AIN2             | AIN3        |
| 2    | CE0            | AIN1             | AIN3             | AIN2        |
| 3    | CE0            | AIN2             | AIN3             | AIN1        |

### Calibration Configuration
| Excitation | V+ Input | V- Input | Return Path |
|-----------|---------|---------|-------------|
| CE0       | RCAL+   | RCAL-   | AIN3        |

---

## Testing and Validation
### Communication Verification
1. Read register **0x0404** to verify AD5941 response.
2. Expected response: **0x5502**.
3. Debug **SPI/power connections** if verification fails.

### Calibration with RCAL
1. Use **1kΩ reference resistor**.
2. Measure impedance at **1 kHz**.
3. Compute **gain factor** and **phase offset**.
4. Store correction values.

### Accuracy Testing
- Connect test resistances: **500Ω, 1kΩ, 10kΩ**
- Measure across **100 Hz – 50 kHz**
- Compare with expected values

### Expected Impedance Readings
| Frequency | Expected Magnitude | Expected Phase |
|-----------|-------------------|---------------|
| 100 Hz    | 1000 Ω           | ~0°          |
| 1 kHz     | 1000 Ω           | ~0°          |
| 10 kHz    | 1000 Ω           | ~0°          |
| 50 kHz    | 1000 Ω           | Small phase shift |

### Human Body Validation
1. Attach electrodes to the body.
2. Measure **bioimpedance at multiple sites**.
3. Check for **phase shift due to tissue capacitance**.

---

## Development Process
- **Custom driver implementation** due to AD5941 library limitations.
- **Thorough datasheet review** to understand the chip.
- **Sequencer & FIFO buffer** planned but not implemented.
- **USB interface** considered but not implemented due to time constraints.
- **Programming access issue resolved** with an **SWD edge connector** in revision 2.

---

## Compliance and Safety
- Designed to **IEC 60601 medical device standards**.
- Ensures **DC current into the human body ≤10μA**.

---

## Future Improvements
- Implement **low-power mode with FIFO buffering**.
- Integrate **USB communication for real-time data transfer**.
- Add **battery charging circuit for standalone operation**.
