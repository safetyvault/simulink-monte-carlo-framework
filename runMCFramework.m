% runMCFramework.m  —  SafetyVault Monte Carlo Framework (FREE VERSION)
% -------------------------------------------------------------------------
% MAIN ENTRY POINT — run this script to execute the full framework.
%
% FREE VERSION:
%   - Max 2 parameters, 4 input/output signals (upgrade for unlimited)
%   - parsim parallel execution (configurable)
%   - Fast restart disabled (recommended for param safety)
%   - 1 combined PNG per test case (inputs + outputs + params)
%   - Self-contained HTML report with embedded plots
%   - Multiple distributions: Uniform, Normal, Truncated_Normal, Fixed
%   - Seed-based reproducibility
% -------------------------------------------------------------------------

clc
fprintf('================================================\n');
fprintf('  SafetyVault Monte Carlo Framework\n');
fprintf('  FREE VERSION — v1.0\n');
fprintf('  https://safetyvault.gumroad.com\n');
fprintf('================================================\n\n');

% ═══════════════════════════════════════════════════════════════════
% ONE-TIME MODEL SETUP (run setupModelWorkspace.m once, then comment out)
% Required for parsim + param perturbation to work correctly.
% Parameters must be in Model Workspace, not Base Workspace / PreLoadFcn.
% See setupModelWorkspace.m for instructions.
% ═══════════════════════════════════════════════════════════════════

% ── USER CONFIGURATION — edit these ──────────────────────────────────────
modelName      = 'tModel';
rbtFile        = 'RBT_Tests.xlsx';
valFile        = 'Values_Sheet.xlsx';
resultsDir     = fullfile(pwd, 'MC_Results');

% Execution flags
useParsim      = true;   % true = parsim (parallel) | false = sequential sim
useFastRestart = false;  % false = full restart (recommended)

% Report color theme — choose one:
%   midnight | obsidian | arctic | forest | crimson | slate | aurora | solar
reportTheme    = 'midnight';
% Note: Report branding is fixed to SafetyVault in FREE version.
% Upgrade to PAID version for custom branding.
% ─────────────────────────────────────────────────────────────────────────

fprintf('Configuration:\n');
fprintf('  Model        : %s\n', modelName);
fprintf('  RBT File     : %s\n', rbtFile);
fprintf('  Values File  : %s\n', valFile);
fprintf('  Results Dir  : %s\n', resultsDir);
fprintf('  parsim       : %s\n', mat2str(useParsim));
fprintf('  FastRestart  : %s\n\n', mat2str(useFastRestart));

% Step 1 — Read Excel definitions
[testMaster, inputDefs, paramDefs] = readExcelDefinitions(rbtFile, valFile);

% Step 2 — Expand test cases + apply MC perturbation
expandedCases = mcWrapper(testMaster, paramDefs);

% Step 3 — Build SimulationInputs + run + store outputs
expandedCases = buildAndRun(modelName, expandedCases, inputDefs, resultsDir, useParsim, useFastRestart);

% Step 4 — Generate 1 combined PNG per test case
plotFiles = plotResults(expandedCases, inputDefs, paramDefs, resultsDir);

% Step 5 — Build report object + generate
rpt        = SafetyVaultReport(expandedCases, inputDefs, paramDefs, plotFiles, resultsDir, modelName);
reportPath = rpt.generate(reportTheme);

fprintf('\n[SafetyVault] All done!\n');
fprintf('  Results : %s\n', resultsDir);
fprintf('  Report  : %s\n', reportPath);
fprintf('\n  To regenerate with a different theme (no rerun):\n');
fprintf('    rpt.generate(''arctic'')\n');
fprintf('    rpt.generate(''obsidian'')\n');
fprintf('    rpt.previewThemes()   %% generates all 8 themes\n\n');

if bdIsLoaded(modelName)
    bdclose(modelName)
end