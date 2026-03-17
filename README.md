# SafetyVault Monte Carlo Framework — FREE VERSION v1.0
**Upgrade to Paid:** https://safetyvault.gumroad.com

> **Monte Carlo Simulation Framework for Simulink — Free Edition**  
> Seed-based parameter perturbation | HTML reports | Per-repetition plots

---

## Free vs Paid

| Feature | Free v1.0 | Paid v1.7 |
|---------|-----------|-----------|
| Parameters per test case | **Max 2** | Unlimited |
| Input signals plotted | **Max 4** | Unlimited |
| Output signals plotted | **Max 4** | Unlimited |
| Report branding | SafetyVault (locked) | **Fully customisable** |
| Color themes | All 12 included | All 12 included |
| Parallel execution (parsim) | ✅ | ✅ |
| HTML reports | ✅ | ✅ |
| Per-rep PNG plots | ✅ | ✅ |
| Distributions | All 4 | All 4 |

---

## Requirements

- MATLAB R2019b or later
- Simulink
- Parallel Computing Toolbox *(optional — for parsim)*

---

## Quick Start

'''matlab
% 1. Configure runMCFramework.m
modelName   = 'YourModel';
rbtFile     = 'RBT_Tests_v1.0.xlsx';
valFile     = 'Values_Sheet_v1.7.xlsx';
reportTheme = 'midnight';

% 2. Run
runMCFramework
'''

---

## What You Need to Provide

### 1. Your Simulink Model ('.slx')
- Must have **Inport blocks** for input signals
- Parameters must be **Constant blocks** with variable names (e.g. 'ANGLE_1')
- **One-time setup**: run 'setupModelWorkspace.m' once before first use

### 2. 'RBT_Tests_v1.0.xlsx' — Test Master File

Data starts at **Row 4**:

| Column | Description | Example |
|--------|-------------|---------|
| Seed_Identifier | Random seed | '42' |
| Test_Case_Name | Unique test name | 'MC_Nominal' |
| Repetitions | Number of random runs | '5' |
| Input_Sheet | Sheet name in Values file | 'TC1' |
| Input_Signals | Comma-separated signal names | 'FLAP_01, SPOILER_02' |
| Parameters | Comma-separated param names *(max 2)* | 'ANGLE_1, ANGLE_2' |
| Expected_Output | Pass/fail label | 'Within_Limits' |
| Tolerance% | Tolerance for output check | '5' |
| Notes | Optional notes | — |

> **Free limit**: Only first 2 parameters will be perturbed.

### 3. 'Values_Sheet_v1.7.xlsx' — Signal + Parameter Definitions

#### TC Sheets ('TC1', 'TC2', ...)
'''
Time  | FLAP_01 | SPOILER_02 | RUDDER_03
0     |    0    |     0      |     0
0.1   |    5    |     0      |     2
'''
> **Free limit**: Only first 4 signals plotted in PNGs.

#### Params Sheet
'''
Param_ID | Description   | Lower% | Upper% | Distribution | Units | Values | Notes
ANGLE_1  | Control angle |  -10   |   10   |   Uniform    |  deg  |   2    |
ANGLE_2  | Surface angle |   -5   |    5   |   Uniform    |  deg  |   1    |
'''

**Distributions:**
| Type | Use when |
|------|----------|
| 'Uniform' | Only range known — equal probability across bounds |
| 'Normal' | Values cluster near nominal — bell curve |
| 'Truncated_Normal' | Bell curve, hard-clamped to bounds — safety-critical |
| 'Fixed' | No perturbation — freeze this parameter |

> See the **Distribution Guide** tab in 'Values_Sheet_v1.7.xlsx' for full explanations with examples.

---

## One-Time Model Setup

'''matlab
% Run once before first use — saves model automatically
setupModelWorkspace
'''

This moves your parameters from 'PreLoadFcn' / base workspace to **Model Workspace**, which is required for 'parsim' + 'setBlockParameter' to work correctly.

---

## Output — Where Results Are Stored

All outputs saved to 'MC_Results/' (configurable):

'''
MC_Results/
├── SafetyVault_MC_Report.html       ← Open in browser
├── plots/
│   ├── TC1_42_rep01.png             ← Per-rep plot
│   ├── TC1_42_rep02.png
│   └── TC1_42_plots.html            ← Tabbed viewer
└── TC1_42.mat                       ← Raw MATLAB results
'''

### HTML Report Contains:
- Input signal table per test case
- Per-iteration parameter values
- Output signal table
- Links to per-repetition plots

### Each PNG Plot Contains:
- Input signals — all overlaid with legend + min/max
- Output signals — all overlaid with legend + min/max
- Parameter table — Nominal / Perturbed / Dev% / Distribution

---

## Configuration ('runMCFramework.m')

'''matlab
modelName      = 'YourModel';
rbtFile        = 'RBT_Tests_v1.0.xlsx';
valFile        = 'Values_Sheet_v1.7.xlsx';
resultsDir     = fullfile(pwd, 'MC_Results');
useParsim      = true;    % parallel execution
useFastRestart = false;   % keep false
reportTheme    = 'midnight';
'''

### Themes (all 12 available in free version)
'midnight' | 'obsidian' | 'arctic' | 'forest' | 'crimson' | 'slate' | 'aurora' | 'solar' | 'pearl' | 'cloud' | 'mint' | 'dusk'

---

## Regenerate Report Without Rerunning

'''matlab
rpt.generate('arctic')    % different theme — no rerun needed
rpt.generate('obsidian')
rpt.previewThemes()       % all 12 themes at once
'''

---

## Files Included

| File | Purpose |
|------|---------|
| 'runMCFramework.m' | **Start here** |
| 'readExcelDefinitions.m' | Reads Excel input files |
| 'mcWrapper.m' | MC perturbation engine *(max 2 params)* |
| 'buildAndRun.m' | Runs simulations via parsim/sim |
| 'plotResults.m' | Generates PNG plots *(max 4 signals)* |
| 'generateReport.m' | Generates HTML report |
| 'SafetyVaultReport.m' | Report class for theme switching |
| 'svTheme.m' | 12 colour themes |
| 'setupModelWorkspace.m' | One-time model setup |
| 'Values_Sheet_v1.7.xlsx' | Template with Distribution Guide |

---

## Upgrade to Paid

Need unlimited params, unlimited signals, and custom branding?

**https://safetyvault.gumroad.com**

---

*SafetyVault Monte Carlo Framework — built for safety-critical engineers.*
