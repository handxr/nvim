# Neovim Frontend Minimalista

Setup minimalista de Neovim para desarrollo frontend (JS/TS, HTML, CSS), ideal para aprender y expandir.

## Características
- Theme: Catppuccin Macchiato
- Syntax highlight: nvim-treesitter
- LSP: JS/TS, HTML, CSS, Tailwind CSS (IntelliSense)
- Autocompletado: nvim-cmp
- Lint/Format: Prettier, ESLint, Biome (auto-detección por proyecto)
- Atajo para formatear: `<leader>f` (por defecto, \f)

## Instalación
1. Instala Neovim (v0.8+ recomendado)
2. Clona esta config en `~/.config/nvim`
3. Abre Neovim y espera a que se instalen los plugins

## Uso de linters/formatters
- Si tu proyecto tiene `.prettierrc`, `.eslintrc` o `biome.json`, Neovim usará el formateador/linter correspondiente automáticamente.
- Usa `<leader>f` para formatear el archivo actual.

## Expansión
Puedes agregar más plugins fácilmente editando `lua/config/lazy.lua`. 