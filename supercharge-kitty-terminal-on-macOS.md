# Supercharge Kitty Terminal on macOS: Starship, fzf, and Autosuggestions

While Kitty handles high-performance GPU rendering, window layouts, and terminal multiplexing, Zsh manages the interactive workflow: informative prompts, fuzzy history navigation, and inline command autosuggestions.

---

## 1. Install Dependencies

Install all core components using Homebrew in a single command:

```bash
brew install starship fzf zsh-autosuggestions zsh-syntax-highlighting

```

* **Starship** — Ultra-fast, minimal cross-shell prompt written in Rust (displays git branch, repo state, package versions, and exit codes).
* **fzf** — General-purpose command-line fuzzy finder for history, files, and directories.
* **zsh-autosuggestions** — Suggests commands as you type based on your shell history.
* **zsh-syntax-highlighting** — Provides real-time syntax checking (green for valid commands, red for syntax errors).

---

## 2. Configure `~/.zshrc`

Open your shell configuration file:

```bash
nano ~/.zshrc

```

Append the following configuration block to the very end of the file:

```bash
# ==========================================
# fzf: Interactive search (Ctrl+R for history, Ctrl+T for files)
# ==========================================
eval "$(fzf --zsh)"

# Clean floating window styling for fzf
export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border --inline-info"

# ==========================================
# Zsh Autosuggestions: Inline history completion
# ==========================================
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Accept full suggestion with Right Arrow or Ctrl+F
bindkey '^[[C' forward-word
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=244' # Subtle muted gray

# ==========================================
# Syntax Highlighting (Must load after autosuggestions)
# ==========================================
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ==========================================
# Starship Prompt (Must remain at the very end of ~/.zshrc)
# ==========================================
eval "$(starship init zsh)"

```

Apply the changes immediately:

```bash
source ~/.zshrc

```

---

## 3. Configure Starship (Optional)

Create the configuration file for the Starship prompt:

```bash
mkdir -p ~/.config && nano ~/.config/starship.toml

```

Minimal, noise-free developer preset:

```toml
# Display order: directory -> git branch -> git status -> prompt character
format = "$directory$git_branch$git_status$character"

[directory]
truncation_length = 3
truncate_to_repo = true
style = "bold cyan"

[git_branch]
symbol = " "
style = "bold purple"

[git_status]
style = "red"

[character]
success_symbol = "[➜](bold green)"
error_symbol = "[✗](bold red)"

```

---

## 4. Daily Workflow Shortcuts

| Shortcut / Action | Tool | Description |
| --- | --- | --- |
| **`Right Arrow`** or **`Ctrl + F`** | `zsh-autosuggestions` | Complete current command with the suggested gray text |
| **`Ctrl + R`** | `fzf` | Interactive fuzzy search across full command history |
| **`Ctrl + T`** | `fzf` | Search and paste relative file paths into the prompt |
| **`Alt + C`** | `fzf` | Fuzzy search and instantly `cd` into any directory |
| **`Ctrl + Shift + F`** | Kitty | Full-text search within current screen and log output |
| **`Ctrl + Shift + H`** | Kitty | Pipe complete terminal scrollback directly into `less` |
