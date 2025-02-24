/**
 * @file main.c
 * @brief Main application code for interfacing with AD5941 and performing impedance measurements.
 *
 * This file contains the main application code for initializing system peripherals, configuring the AD5941,
 * performing impedance measurements, and logging the results to flash memory.
 *
 * @details
 * The application initializes GPIO, SPI, and resets the AD5941. It verifies communication with the AD5941,
 * configures the system for high-performance mode, enables the DAC and waveform generator, and configures
 * the TIA and ADC. It then performs impedance measurements at various frequencies and logs the results to flash memory.
 *
 * @note
 * The code includes functions for setting clock divisions, enabling/disabling ADC, DAC, and TIA, configuring
 * the waveform generator, and reading/writing to flash memory. It also includes calibration functions to correct
 * the measured impedance values.
 *
 * @section Functions
 * - GPIO_Init: Initializes GPIO pins for AD5941 control.
 * - SPI_Init: Initializes SPI1 for communication with AD5941.
 * - AD5941_Reset: Resets the AD5941.
 * - AD5941_VerifyCommunication: Verifies communication with AD5941.
 * - AD5941_WriteRegister: Writes data to a specified AD5941 register.
 * - AD5941_ReadRegister: Reads data from a specified AD5941 register.
 * - AD5941_StartupSequence: Performs the startup sequence for AD5941.
 * - setADCClockDivision: Sets the ADC clock division.
 * - getADCClockDivision: Gets the current ADC clock division.
 * - setSystemClockDivision: Sets the system clock division.
 * - getSystemClockDivision: Gets the current system clock division.
 * - setADCCLKSource: Sets the ADC clock source.
 * - getADCCLKSource: Gets the current ADC clock source.
 * - setSystemCLKSource: Sets the system clock source.
 * - getSystemCLKSource: Gets the current system clock source.
 * - lowPowerMode: Configures the system for low power mode.
 * - highPowerMode: Configures the system for high power mode.
 * - AD5941_ReadFIFO: Reads data from the AD5941 FIFO.
 * - Flash_Unlock: Unlocks the flash memory for writing.
 * - Flash_EraseSector: Erases a sector of flash memory.
 * - Flash_WriteWord: Writes a word to flash memory.
 * - Log_Impedance_Flash: Logs impedance data to flash memory.
 * - Flash_ReadImpedance: Reads impedance data from flash memory.
 * - enableADC: Enables the ADC.
 * - disableADC: Disables the ADC.
 * - enableHSDAC: Enables the high-speed DAC.
 * - disableHSDAC: Disables the high-speed DAC.
 * - enableHSTIA: Enables the high-speed TIA.
 * - disableHSTIA: Disables the high-speed TIA.
 * - enableWaveformGenerator: Enables the waveform generator.
 * - AD5941_GetImpedanceData: Gets impedance data from AD5941.
 * - AD5941_CalculateImpedance: Calculates impedance from raw data.
 * - StartSineWaveform: Starts a sine waveform with a specified frequency.
 * - TIAConfig: Configures the TIA.
 * - ADCConfig: Configures the ADC.
 * - AD5941_SetPair: Sets the electrode pair for measurement.
 * - AD5941_SetRCAL: Sets the RCAL configuration.
 * - AD5941_Calibrate: Calibrates the AD5941 using a known resistance.
 * - AD5941_CorrectImpedance: Corrects the measured impedance using calibration data.
 *
 * @section Main
 * The main function initializes the system peripherals, resets the AD5941, verifies communication, configures
 * the system for high-performance mode, enables the DAC and waveform generator, configures the TIA and ADC,
 * and performs impedance measurements at various frequencies. The results are logged to flash memory.
 */
#include "stm32f411xe.h"
#include <stdbool.h>
#include <math.h>

#define AD5941_CS_PIN 10   // PB10
#define AD5941_RST_PIN 2   // PA2
#define AD5941_GPIO0_PIN 4 // PA4
#define SPI1_SCK_PIN 5     // PA5
#define SPI1_MISO_PIN 6    // PA6
#define SPI1_MOSI_PIN 7    // PA7

#define AD5941_CS_LOW() (GPIOB->BSRR = (1 << (AD5941_CS_PIN + 16)))
#define AD5941_CS_HIGH() (GPIOB->BSRR = (1 << AD5941_CS_PIN))

#define AD5941_RESET_LOW() (GPIOA->BSRR = (1 << (AD5941_RST_PIN + 16)))
#define AD5941_RESET_HIGH() (GPIOA->BSRR = (1 << AD5941_RST_PIN))



#define FLASH_LOG_ADDRESS 0x0800C000 // Start of logging sector
/*
 * This section defines various memory-mapped register addresses and bit masks
 * used for configuring and controlling different hardware components of a system.
 * 
 * - AFECON: Address for Analog Front-End Control register.
 * - PMBW: Address for Power Management Bandwidth register.
 * - PWRMOD: Address for Power Mode register.
 * 
 * - CLKSEL: Address for Clock Select register.
 * - CLKCON0: Address for Clock Control 0 register.
 * - HSOSCCON: Address for High-Speed Oscillator Control register.
 * - CLKEN1: Address for Clock Enable 1 register.
 * - CLKEN0: Address for Clock Enable 0 register.
 * - OSCCON: Address for Oscillator Control register.
 * - OSCKEY: Address for Oscillator Key register.
 * - RSTCONKEY: Address for Reset Control Key register.
 * - LOSCTST: Address for Low-Speed Oscillator Test register.
 * 
 * - PWRKEY: Address for Power Key register.
 * - LPMODEKEY: Address for Low Power Mode Key register.
 * - LPMODECON: Address for Low Power Mode Control register.
 * - LPMODECLKSEL: Address for Low Power Mode Clock Select register.
 * 
 * - WGCON: Address for Waveform Generator Control register.
 * - WGFCW: Address for Waveform Generator Frequency Control Word register.
 * - WGAMPLITUDE: Address for Waveform Generator Amplitude register.
 * - WAVEGENEN: Bit mask for enabling the waveform generator.
 * 
 * - SWCON: Address for Switch Control register.
 * 
 * - HSRTIACON: Address for High-Speed RTIA Control register.
 * - HSTIACON: Address for High-Speed TIA Control register.
 * - DE0RESCON: Address for DE0 Resistance Control register.
 * 
 * - DFTCON: Address for Discrete Fourier Transform Control register.
 * - ADCCON: Address for ADC Control register.
 * - ADCBUFCON: Address for ADC Buffer Control register.
 * - ADCFILTERCON: Address for ADC Filter Control register.
 */
#define SPICMD_READFIFO 0x5F
#define DFTREAL_REG 0x2078
#define DFTIMAG_REG 0x207C

#define AFECON 0x00002000
#define PMBW 0x000022F0
#define PWRMOD 0x00000A00

#define CLKSEL 0x00000414
#define CLKCON0 0x00000408
#define HSOSCCON 0x000020BC
#define CLKEN1 0x00000410
#define CLKEN0 0x00000A70
#define OSCCON 0x00000A10
#define OSCKEY 0x00000A0C
#define RSTCONKEY 0x00000A5C
#define LOSCTST 0x00000A6C

#define PWRKEY 0x00000A04
#define LPMODEKEY 0x0000210C
#define LPMODECON 0x00002114
#define LPMODECLKSEL 0x00002110

#define WGCON 0x00002014
#define WGFCW 0x00002030
#define WGAMPLITUDE 0x0000203C
#define WAVEGENEN 14

#define SWCON 0x0000200C

#define HSRTIACON 0x000020F0
#define HSTIACON 0x000020FC
#define DE0RESCON 0x000020F8

#define DFTCON 0x000020D0
#define ADCCON 0x000021A8
#define ADCBUFCON 0x0000238C
#define ADCFILTERCON 0x00002044

#define fACLK 16000000
typedef struct
{
    int32_t real;
    int32_t imag;
} ImpedanceData_t;

typedef struct
{
    float magnitude;
    float phase;
} ImpedanceResult_t;

void GPIO_Init(void);
void SPI_Init(void);
void AD5941_Reset(void);
bool AD5941_VerifyCommunication(void);
void AD5941_WriteRegister(uint16_t regAddr, uint16_t data);
uint16_t AD5941_ReadRegister(uint16_t regAddr);
void AD5941_StartupSequence(void);
void setADCClockDivision(uint16_t division);
uint16_t getADCClockDivision(void);
void setSystemClockDivision(uint16_t division);
uint16_t getSystemClockDivision(void);
void setADCCLKSource(uint16_t source);
uint16_t getADCCLKSource(void);
void setSystemCLKSource(uint16_t source);
uint16_t getSystemCLKSource(void);
void lowPowerMode(void);
void highPowerMode(void);
uint32_t AD5941_ReadFIFO(void);
void Flash_Unlock(void);
void Flash_EraseSector(void);
void Flash_WriteWord(uint32_t address, uint32_t data);
void Log_Impedance_Flash(ImpedanceData_t data);
ImpedanceData_t Flash_ReadImpedance(uint32_t address);
void enableADC(void);
void disableADC(void);
void enableHSDAC(void);
void disableHSDAC(void);
void enableHSTIA(void);
void disableHSTIA(void);
void enableWaveformGenerator(void);
ImpedanceData_t AD5941_GetImpedanceData(void);
ImpedanceResult_t AD5941_CalculateImpedance(void);
void StartSineWaveform(uint32_t frequency);
void TIAConfig(void);
void ADCConfig(void);
void AD5941_SetPair(uint8_t pos, uint8_t neg, uint8_t return_path);



//------------------------------------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------------------------------------
// main
//------------------------------------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------------------------------------
int main(void)
{
    // Initialize system peripherals and reset AD5941
    GPIO_Init();
    SPI_Init();
    AD5941_Reset();

    // Ensure AD5941 is communicating before proceeding
    while (!AD5941_VerifyCommunication());

    // Configure system for high-performance mode
    highPowerMode();

    // Enable DAC and Waveform Generator
    enableHSDAC();  // Enable High-Speed DAC
    enableWaveformGenerator(); // Enable waveform generator in AFECON
    
    // Configure TIA and ADC
    TIAConfig();
    ADCConfig();

    // List of measurement frequencies (in Hz)
    uint32_t frequencies[] = {100, 500, 1000, 5000, 10000, 20000, 50000};  
    uint8_t num_frequencies = sizeof(frequencies) / sizeof(frequencies[0]);

    // Electrode measurement pairs (pos, neg, return_path)
    uint8_t pairs[][3] = {
        {1, 2, 3},
        {1, 3, 2},
        {2, 3, 1}
    };
    uint8_t num_pairs = sizeof(pairs) / sizeof(pairs[0]);
    
    float rcal_value = 1000.0f; // RCAL = 1kΩ
    AD5941_Calibrate(rcal_value);

    while (1)
    {
        for (uint8_t i = 0; i < num_pairs; i++)
        {
            AD5941_SetPair(pairs[i][0], pairs[i][1], pairs[i][2]); // Set electrode pair

            for (uint8_t j = 0; j < num_frequencies; j++)
            {
                StartSineWaveform(frequencies[j]); // Set excitation frequency

                ImpedanceResult_t impedance = AD5941_CalculateImpedance(); // Get measurement
                impedance = AD5941_CorrectImpedance(impedance); // Apply calibration

                ImpedanceData_t logData;
                logData.real = (int32_t)(impedance.magnitude * cosf(impedance.phase * (M_PI / 180.0f)));
                logData.imag = (int32_t)(impedance.magnitude * sinf(impedance.phase * (M_PI / 180.0f)));

                Log_Impedance_Flash(logData); // Store in flash
            }
        }
    }
}

//------------------------------------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------------------------------------
// Function Definitions



void setADCClockDivision(uint16_t division)
{
    if (division != 1 && division != 2)
    {
        // Invalid division value
        return;
    }

    uint16_t currentRegisterValue = AD5941_ReadRegister(CLKCON0);
    currentRegisterValue &= ~(0xF << 6);             // Clear bits 9:6
    currentRegisterValue |= ((division & 0xF) << 6); // Set new division value to bits 9:6
    AD5941_WriteRegister(CLKCON0, currentRegisterValue);
}

uint16_t getADCClockDivision()
{
    uint16_t currentRegisterValue = AD5941_ReadRegister(CLKCON0);
    return (currentRegisterValue >> 6) & 0xF;
}

void setSystemClockDivision(uint16_t division)
{
    uint16_t currentRegisterValue = AD5941_ReadRegister(CLKCON0);
    currentRegisterValue &= ~(0x3F);           // Clear bits 5:0
    currentRegisterValue |= (division & 0x3F); // Set new division value to bits 5:0
    AD5941_WriteRegister(CLKCON0, currentRegisterValue);
}

uint16_t getSystemClockDivision()
{
    uint16_t currentRegisterValue = AD5941_ReadRegister(CLKCON0);
    return currentRegisterValue & 0x3F;
}

void setADCCLKSource(uint16_t source)
{
    if (source != 0 && source != 1 && source != 2 && source != 3)
    {
        // Invalid source value
        return;
    }

    uint16_t currentRegisterValue = AD5941_ReadRegister(CLKSEL);
    currentRegisterValue &= ~(0x3 << 2);         // Clear bits 3:2
    currentRegisterValue |= (source & 0x3) << 2; // Set new source value to bits 3:2
    AD5941_WriteRegister(CLKSEL, currentRegisterValue);
}

uint16_t getADCCLKSource()
{
    uint16_t currentRegisterValue = AD5941_ReadRegister(CLKSEL);
    return (currentRegisterValue >> 2) & 0x3;
}

void setSystemCLKSource(uint16_t source)
{
    if (source != 0 && source != 1 && source != 2 && source != 3)
    {
        // Invalid source value
        return;
    }

    uint16_t currentRegisterValue = AD5941_ReadRegister(CLKSEL);
    currentRegisterValue &= ~(0x3);         // Clear bits 1:0
    currentRegisterValue |= (source & 0x3); // Set new source value to bits 1:0
    AD5941_WriteRegister(CLKSEL, currentRegisterValue);
}

uint16_t getSystemCLKSource()
{
    uint16_t currentRegisterValue = AD5941_ReadRegister(CLKSEL);
    return currentRegisterValue & 0x3;
}

void lowPowerMode()
{
    // Set PMBW register to low power mode
    AD5941_WriteRegister(PMBW, 0x0000);

    // Set system clock source to low power oscillator
    setSystemCLKSource(0);

    // Set system clock division to 1
    setSystemClockDivision(1);

    // Disable high-speed oscillator
    AD5941_WriteRegister(HSOSCCON, (1 << 2));
}

void highPowerMode()
{
    AD5941_WriteRegister(PMBW, (1 << 0));
    setSystemCLKSource(0);
    setSystemClockDivision(1);
    AD5941_WriteRegister(HSOSCCON, 0x0000);
}

uint32_t AD5941_ReadFIFO(void)
{
    uint32_t data;

    AD5941_CS_LOW();
    while (!(SPI1->SR & SPI_SR_TXE))
        ;
    SPI1->DR = SPICMD_READFIFO;
    while (!(SPI1->SR & SPI_SR_RXNE))
        ;
    (void)SPI1->DR; // Dummy read

    // Six dummy bytes before valid data
    for (int i = 0; i < 6; i++)
    {
        SPI1->DR = 0x00;
        while (!(SPI1->SR & SPI_SR_RXNE))
            ;
        (void)SPI1->DR;
    }

    // Read 32-bit data
    SPI1->DR = 0x00;
    while (!(SPI1->SR & SPI_SR_RXNE))
        ;
    data = SPI1->DR;
    data <<= 8;

    SPI1->DR = 0x00;
    while (!(SPI1->SR & SPI_SR_RXNE))
        ;
    data |= SPI1->DR;
    data <<= 8;

    SPI1->DR = 0x00;
    while (!(SPI1->SR & SPI_SR_RXNE))
        ;
    data |= SPI1->DR;
    data <<= 8;

    SPI1->DR = 0x00;
    while (!(SPI1->SR & SPI_SR_RXNE))
        ;
    data |= SPI1->DR;

    AD5941_CS_HIGH();
    return data;
}

void Flash_Unlock(void)
{
    FLASH->KEYR = 0x45670123; // First unlock key
    FLASH->KEYR = 0xCDEF89AB; // Second unlock key
}

void Flash_EraseSector(void)
{
    Flash_Unlock();

    while (FLASH->SR & FLASH_SR_BSY)
        ;                                 // Wait for Flash to be ready
    FLASH->CR |= FLASH_CR_SER;            // Enable sector erase
    FLASH->CR |= (3 << FLASH_CR_SNB_Pos); // Select Sector 3
    FLASH->CR |= FLASH_CR_STRT;           // Start erase

    while (FLASH->SR & FLASH_SR_BSY)
        ;                       // Wait for completion
    FLASH->CR &= ~FLASH_CR_SER; // Clear erase flag
}

void Flash_WriteWord(uint32_t address, uint32_t data)
{
    Flash_Unlock();

    while (FLASH->SR & FLASH_SR_BSY)
        ;                     // Wait for Flash to be ready
    FLASH->CR |= FLASH_CR_PG; // Enable programming

    *(__IO uint32_t *)address = data; // Write data

    while (FLASH->SR & FLASH_SR_BSY)
        ;                      // Wait for completion
    FLASH->CR &= ~FLASH_CR_PG; // Clear programming flag
}

void Log_Impedance_Flash(ImpedanceData_t data)
{
    static uint32_t write_address = FLASH_LOG_ADDRESS;

    if (write_address >= (FLASH_LOG_ADDRESS + 16 * 1024))
    {
        Flash_EraseSector(); // Erase if sector full
        write_address = FLASH_LOG_ADDRESS;
    }

    Flash_WriteWord(write_address, data.real);
    write_address += 4;
    Flash_WriteWord(write_address, data.imag);
    write_address += 4;
}

ImpedanceData_t Flash_ReadImpedance(uint32_t address)
{
    ImpedanceData_t data;
    data.real = *(__IO uint32_t *)address;
    data.imag = *(__IO uint32_t *)(address + 4);
    return data;
}






//---------------------------------------------------------
// Function Definitions

void enableADC()
{
    uint16_t currentRegisterValue = AD5941_ReadRegister(AFECON);
    AD5941_WriteRegister(AFECON, currentRegisterValue | (1 << 7));
}

void disableADC()
{
    uint16_t currentRegisterValue = AD5941_ReadRegister(AFECON);
    AD5941_WriteRegister(AFECON, currentRegisterValue & ~(1 << 7));
}

void enableHSDAC()
{
    uint16_t currentRegisterValue = AD5941_ReadRegister(AFECON);
    AD5941_WriteRegister(AFECON, currentRegisterValue | (1 << 6));
}

void disableHSDAC()
{
    uint16_t currentRegisterValue = AD5941_ReadRegister(AFECON);
    AD5941_WriteRegister(AFECON, currentRegisterValue & ~(1 << 6));
}

void enableHSTIA()
{
    uint16_t currentRegisterValue = AD5941_ReadRegister(AFECON);
    AD5941_WriteRegister(AFECON, currentRegisterValue | (1 << 11));
}

void disableHSTIA()
{
    uint16_t currentRegisterValue = AD5941_ReadRegister(AFECON);
    AD5941_WriteRegister(AFECON, currentRegisterValue & ~(1 << 11));
}

void enableWaveformGenerator()
{
    uint16_t currentRegisterValue = AD5941_ReadRegister(AFECON);
    AD5941_WriteRegister(AFECON, currentRegisterValue | (1 << WAVEGENEN));
}

ImpedanceData_t AD5941_GetImpedanceData(void)
{
    ImpedanceData_t data;
    data.real = AD5941_ReadRegister(DFTREAL_REG);
    data.imag = AD5941_ReadRegister(DFTIMAG_REG);
    return data;
}

ImpedanceResult_t AD5941_CalculateImpedance(void)
{
    ImpedanceData_t rawData = AD5941_GetImpedanceData();
    ImpedanceResult_t result;

    result.magnitude = sqrtf((rawData.real * rawData.real) + (rawData.imag * rawData.imag));
    result.phase = atan2f(rawData.imag, rawData.real) * (180.0f / M_PI); // Convert to degrees

    return result;
}

void SPI_Init(void)
{
    // Enable SPI1 and GPIOA clocks
    RCC->AHB1ENR |= (1 << 0);  // GPIOA
    RCC->APB2ENR |= (1 << 12); // SPI1

    // Set PA5, PA6, PA7 to Alternate Function (AF5)
    GPIOA->MODER &= ~((3 << (SPI1_SCK_PIN * 2)) | (3 << (SPI1_MISO_PIN * 2)) | (3 << (SPI1_MOSI_PIN * 2)));
    GPIOA->MODER |= ((2 << (SPI1_SCK_PIN * 2)) | (2 << (SPI1_MISO_PIN * 2)) | (2 << (SPI1_MOSI_PIN * 2)));
    GPIOA->AFR[0] |= (5 << (SPI1_SCK_PIN * 4)) | (5 << (SPI1_MISO_PIN * 4)) | (5 << (SPI1_MOSI_PIN * 4));

    // Configure SPI1
    SPI1->CR1 = (1 << 2) | (1 << 9);             // Master mode, Software NSS
    SPI1->CR1 |= (1 << 8) | (1 << 6);            // SSM=1, SPE=1
    SPI1->CR1 &= ~(SPI_CR1_CPOL | SPI_CR1_CPHA); // Ensure Mode 0
    SPI1->CR1 |= (0b001 << 3);                   // fPCLK/4 for ~10.5MHz speed
}

bool AD5941_VerifyCommunication(void)
{
    uint16_t chipID = AD5941_ReadRegister(0x0404);
    if (chipID == 0x5502)
    {
        return true; // Successful communication
    }
    else
    {
        return false; // Communication error
    }
}

void GPIO_Init(void)
{
    // Enable GPIOA and GPIOB clock
    RCC->AHB1ENR |= (1 << 0) | (1 << 1);

    // Configure PB10 as Output (CS)
    GPIOB->MODER &= ~(3 << (AD5941_CS_PIN * 2));  // Clear mode
    GPIOB->MODER |= (1 << (AD5941_CS_PIN * 2));   // Output mode
    GPIOB->OTYPER &= ~(1 << AD5941_CS_PIN);       // Push-Pull
    GPIOB->OSPEEDR |= (3 << (AD5941_CS_PIN * 2)); // High speed
    GPIOB->PUPDR &= ~(3 << (AD5941_CS_PIN * 2));  // No Pull-up/down

    // Configure PA2 as Output (Reset)
    GPIOA->MODER &= ~(3 << (AD5941_RST_PIN * 2));
    GPIOA->MODER |= (1 << (AD5941_RST_PIN * 2));
    GPIOA->OTYPER &= ~(1 << AD5941_RST_PIN);
    GPIOA->OSPEEDR |= (3 << (AD5941_RST_PIN * 2));
    GPIOA->PUPDR &= ~(3 << (AD5941_RST_PIN * 2));

    // Configure PA4 as Input (GPIO0 Interrupt)
    GPIOA->MODER &= ~(3 << (AD5941_GPIO0_PIN * 2)); // Input mode
    GPIOA->PUPDR &= ~(3 << (AD5941_GPIO0_PIN * 2)); // No Pull-up/down
}

void AD5941_Reset(void)
{
    AD5941_RESET_LOW();
    for (volatile int i = 0; i < 10000; i++); // Small delay
    AD5941_RESET_HIGH();

    AD5941_StartupSequence(); // Perform startup sequence
}

uint16_t AD5941_ReadRegister(uint16_t regAddr)
{
    uint16_t data = 0;
    AD5941_CS_LOW();

    SPI1->DR = 0x20; // Set register address command
    while (!(SPI1->SR & SPI_SR_TXE));
    (void)SPI1->DR;

    SPI1->DR = (regAddr >> 8) & 0xFF;
    while (!(SPI1->SR & SPI_SR_TXE));
    (void)SPI1->DR;

    SPI1->DR = regAddr & 0xFF;
    while (!(SPI1->SR & SPI_SR_TXE));
    (void)SPI1->DR;

    SPI1->DR = 0x6D; // Read command
    while (!(SPI1->SR & SPI_SR_TXE));
    (void)SPI1->DR;

    SPI1->DR = 0x00; // Dummy byte
    while (!(SPI1->SR & SPI_SR_RXNE));
    data = SPI1->DR;

    AD5941_CS_HIGH();
    return data;
}

void AD5941_WriteRegister(uint16_t regAddr, uint16_t data)
{
    AD5941_CS_LOW();

    while (!(SPI1->SR & SPI_SR_TXE));
    SPI1->DR = 0x00; // Write command
    while (!(SPI1->SR & SPI_SR_RXNE));
    (void)SPI1->DR; // Dummy read

    SPI1->DR = (regAddr >> 8) & 0xFF;
    while (!(SPI1->SR & SPI_SR_RXNE));
    (void)SPI1->DR;

    SPI1->DR = regAddr & 0xFF;
    while (!(SPI1->SR & SPI_SR_RXNE));
    (void)SPI1->DR;

    SPI1->DR = (data >> 8) & 0xFF;
    while (!(SPI1->SR & SPI_SR_RXNE));
    (void)SPI1->DR;

    SPI1->DR = data & 0xFF;
    while (!(SPI1->SR & SPI_SR_RXNE));
    (void)SPI1->DR;

    AD5941_CS_HIGH();
}

void AD5941_StartupSequence(void) //As specified in the datasheet
{
    AD5941_WriteRegister(0x0908, 0x02C9);
    AD5941_WriteRegister(0x0C08, 0x206C);
    AD5941_WriteRegister(0x21F0, 0x0010);
    AD5941_WriteRegister(0x0410, 0x02C9);
    AD5941_WriteRegister(0x0A28, 0x0009);
    AD5941_WriteRegister(0x238C, 0x0104);
    AD5941_WriteRegister(0x0A04, 0x4859);
    AD5941_WriteRegister(0x0A04, 0xF27B);
    AD5941_WriteRegister(0x0A00, 0x8009);
    AD5941_WriteRegister(0x22F0, 0x0000);
}

void StartSineWaveform(uint32_t frequency)
{
    uint32_t sinefcw = frequency * pow(2, 30) / fACLK;

    enableHSDAC();
    

    sinefcw &= 0xFFFFFF; // Mask to 24 bits
    AD5941_WriteRegister(WGFCW, sinefcw);

    double amplitude_mv = 600; // 600mV p-p
    uint16_t amplitude_code = (amplitude_mv * 2047) / 1800; // 1.8V Full Scale
    AD5941_WriteRegister(WGAMPLITUDE, amplitude_code);
    
    uint16_t currentRegisterValue = AD5941_ReadRegister(WGCON);
    currentRegisterValue &= ~(0x3 << 1); // Clear bits 2:1
    currentRegisterValue |= (0x2 << 1);  // Set bits 2:1 to 10
    AD5941_WriteRegister(WGCON, currentRegisterValue);
    enableWaveformGenerator();
}


void TIAConfig(){
    enableHSTIA();  // Ensure HSTIA is enabled in AFECON
    AD5941_WriteRegister(HSRTIACON, (1<<0)); //1kOhm RTIA
}

void ADCConfig(){
    AD5941_WriteRegister(ADCFILTERCON, (1<<7)); //Enable Averaging
    AD5941_WriteRegister(DFTCON, (2<<20) | (1<<0) | (8<<4)); //Select raw data, Enable Hanning window and do 1024 point DFT
    AD5941_WriteRegister(ADCCON, (1<<8) | (1<<0)); //TIA as input for impedance measurement
}


void AD5941_SetPair(uint8_t pos, uint8_t neg, uint8_t return_path)
{
    uint16_t swcon_value = 0;

    // Enable excitation via CE0
    swcon_value |= (5 << 0); 
    swcon_value |= (1<<17); //Connect RTIA
    // Configure selected electrodes for voltage measurement
    if (pos == 1) swcon_value |= (2 << 4);
    if (pos == 2) swcon_value |= (3 << 4);
    if (pos == 3) swcon_value |= (4 << 4);

    if (neg == 1) swcon_value |= (2 << 8);
    if (neg == 2) swcon_value |= (3 << 8);
    if (neg == 3) swcon_value |= (4 << 8);

    // Set return path using Nx or Tx switches
    if (return_path == 1) swcon_value |= (2 << 12);  // AIN1 as current return
    if (return_path == 2) swcon_value |= (3 << 12);  // AIN2 as current return
    if (return_path == 3) swcon_value |= (4 << 12); // AIN3 as current return

    AD5941_WriteRegister(SWCON, swcon_value);
}


typedef struct
{
    float gain_factor; // Scale factor for magnitude
    float phase_offset; // Offset to correct phase
} CalibrationData_t;

CalibrationData_t calibrationData = {1.0f, 0.0f}; // Default values

void AD5941_SetRCAL()
{
    uint16_t swcon_value = 0;
    swcon_value |= (5 << 0);  // Excitation via CE0
    swcon_value |= (1 << 17); // Connect RTIA
    swcon_value |= (4 << 12); // Connect AIN3 as current return

    swcon_value |= (10 << 8);  // Connect RCAL in the negative path
    swcon_value |= (1 << 4);  // Connect RCAL in the positive path
    AD5941_WriteRegister(SWCON, swcon_value);
}

void AD5941_Calibrate(float known_resistance)
{
    AD5941_SetRCAL(); // Switch to measure RCAL

    // Set a fixed frequency for calibration
    uint32_t calibration_frequency = 1000; // 1 kHz
    StartSineWaveform(calibration_frequency);

    // Measure impedance
    ImpedanceResult_t measured_impedance = AD5941_CalculateImpedance();

    // Compute gain correction factor
    calibrationData.gain_factor = known_resistance / measured_impedance.magnitude;

    // Compute phase offset
    calibrationData.phase_offset = -measured_impedance.phase;
}

ImpedanceResult_t AD5941_CorrectImpedance(ImpedanceResult_t raw_data)
{
    ImpedanceResult_t corrected;

    // Apply calibration factors
    corrected.magnitude = raw_data.magnitude * calibrationData.gain_factor;
    corrected.phase = raw_data.phase + calibrationData.phase_offset;

    return corrected;
}