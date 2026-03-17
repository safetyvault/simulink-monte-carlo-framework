% svTheme.m  —  SafetyVault Report Color Themes
% -----------------------------------------------
% Usage in runMCFramework.m:
%   reportTheme = svTheme('midnight');   % set your theme here
%
% Available themes:
%   DARK:
%   'midnight'    — Deep navy + electric blue  (DEFAULT, professional)
%   'obsidian'    — Near-black + gold accents  (premium dark)
%   'forest'      — Deep green + lime          (nature dark)
%   'crimson'     — Dark red + rose gold       (bold dark)
%   'slate'       — Charcoal + teal            (modern neutral)
%   'aurora'      — Deep purple + violet       (creative dark)
%   'solar'       — Dark amber + orange        (warm energy)
%
%   LIGHT:
%   'arctic'      — Ice blue on white          (clean light)
%   'pearl'       — Navy on pure white         (ultra clean)
%   'cloud'       — Indigo on soft grey        (minimal light)
%   'mint'        — Emerald on white           (fresh light)
%   'dusk'        — Dusty rose on warm cream   (elegant light)

function t = svTheme(name)
if nargin < 1, name = 'midnight'; end

switch lower(strtrim(name))

    case 'midnight'   % Deep navy + electric blue — DEFAULT
        t.navy     = '#0d1f3c';
        t.blue     = '#1a4a8a';
        t.accent   = '#2e7bcf';
        t.accent2  = '#5ba3e8';
        t.light    = '#e8f0fb';
        t.grey     = '#eef1f7';
        t.border   = '#d0d8e8';
        t.text     = '#1a1a2e';
        t.logoSpan = '#7eb8f7';

    case 'obsidian'   % Near-black + gold — premium dark
        t.navy     = '#111111';
        t.blue     = '#1c1c1c';
        t.accent   = '#c9a84c';
        t.accent2  = '#e2c97e';
        t.light    = '#2a2a2a';
        t.grey     = '#242424';
        t.border   = '#3a3a3a';
        t.text     = '#f0ead8';   % fixed: was too light, now warm cream
        t.logoSpan = '#e2c97e';

    case 'arctic'     % Crisp white + ice blue — clean light
        t.navy     = '#1b3a5c';
        t.blue     = '#2d6a9f';
        t.accent   = '#00a8cc';
        t.accent2  = '#4dc8e0';
        t.light    = '#e0f4f9';
        t.grey     = '#f7fbfd';
        t.border   = '#b8dce8';
        t.text     = '#0d2233';
        t.logoSpan = '#4dc8e0';

    case 'forest'     % Deep green + lime
        t.navy     = '#0d2b1a';
        t.blue     = '#145c30';
        t.accent   = '#2e9e50';
        t.accent2  = '#5cbf77';
        t.light    = '#e0f4e8';
        t.grey     = '#f0f9f2';
        t.border   = '#b8dfc4';
        t.text     = '#0d2010';
        t.logoSpan = '#7ed99a';

    case 'crimson'    % Dark red + rose gold — bold
        t.navy     = '#2b0a0a';
        t.blue     = '#6b1515';
        t.accent   = '#c0392b';
        t.accent2  = '#e07b6a';
        t.light    = '#fce8e6';
        t.grey     = '#fdf4f3';
        t.border   = '#e8c4c0';
        t.text     = '#1a0808';
        t.logoSpan = '#f0a090';

    case 'slate'      % Charcoal + teal — modern neutral
        t.navy     = '#1c2833';
        t.blue     = '#2e4057';
        t.accent   = '#17a589';
        t.accent2  = '#48c9b0';
        t.light    = '#d5f5ef';
        t.grey     = '#f0f4f4';
        t.border   = '#b2d8d4';
        t.text     = '#1a2530';
        t.logoSpan = '#48c9b0';

    case 'aurora'     % Deep purple + violet — creative
        t.navy     = '#1a0a2e';
        t.blue     = '#2d1b6b';
        t.accent   = '#7b2fe8';
        t.accent2  = '#a86cf0';
        t.light    = '#ede0ff';
        t.grey     = '#f5f0ff';
        t.border   = '#cbb8e8';
        t.text     = '#15082a';
        t.logoSpan = '#c09cff';

    case 'solar'      % Dark amber + orange — warm energy
        t.navy     = '#1f0f00';
        t.blue     = '#4a2200';
        t.accent   = '#e07b00';
        t.accent2  = '#f0a830';
        t.light    = '#fff0d0';
        t.grey     = '#fff8ee';
        t.border   = '#e8d0a0';
        t.text     = '#1a0c00';
        t.logoSpan = '#f0c060';

    case 'pearl'      % Pure white + navy text — ultra clean light
        t.navy     = '#1a3a5c';
        t.blue     = '#2563a8';
        t.accent   = '#1d7fd4';
        t.accent2  = '#5ba8e8';
        t.light    = '#ddeeff';
        t.grey     = '#ffffff';
        t.border   = '#c8ddf0';
        t.text     = '#0d1f33';
        t.logoSpan = '#5ba8e8';

    case 'cloud'      % Soft grey-white + indigo — minimal
        t.navy     = '#2c3e6b';
        t.blue     = '#3a5298';
        t.accent   = '#5c6bc0';
        t.accent2  = '#7986cb';
        t.light    = '#e8eaf6';
        t.grey     = '#f5f5f8';
        t.border   = '#c5cae9';
        t.text     = '#1a1f3a';
        t.logoSpan = '#7986cb';

    case 'mint'       % White + emerald green — fresh light
        t.navy     = '#0d3b2e';
        t.blue     = '#1a6b4a';
        t.accent   = '#00897b';
        t.accent2  = '#4db6ac';
        t.light    = '#e0f2f0';
        t.grey     = '#f4faf9';
        t.border   = '#b2dfdb';
        t.text     = '#0a2820';
        t.logoSpan = '#4db6ac';

    case 'dusk'       % Warm cream + dusty rose — elegant light
        t.navy     = '#4a2040';
        t.blue     = '#7b3f6e';
        t.accent   = '#b06090';
        t.accent2  = '#d4a0c0';
        t.light    = '#f8e8f4';
        t.grey     = '#fdf5fb';
        t.border   = '#e8c8e0';
        t.text     = '#2a0f24';
        t.logoSpan = '#d4a0c0';

    otherwise
        warning('[SafetyVault] Unknown theme ''%s''. Using midnight.', name);
        t = svTheme('midnight');
end
end
