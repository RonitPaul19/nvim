# Debugging in Neovim — How to Actually Use It

This pairs with `dap.lua`. Drop that file into `lua/plugins/dap.lua`, restart
Neovim, run `:Lazy sync`, then `:Mason` and confirm `codelldb`, `debugpy`,
and `js-debug-adapter` show as installed (they'll auto-install on first
load, just give it a minute).

## The mental model

A debugger session has four moving parts, and every debugger in every
language works the same way once you get this:

1. **Breakpoints** — lines where execution will pause.
2. **A running session** — you "launch" your program under the debugger,
   or "attach" to one already running.
3. **Stepping** — once paused, you move forward one line/function at a time.
4. **Inspection** — while paused, you look at variables, the call stack,
   and can evaluate expressions.

Everything below is just those four things per language.

## Keymaps (from the config)

| Key                        | Action                                                             |
| -------------------------- | ------------------------------------------------------------------ |
| `<F9>` / `<leader>db`      | Toggle breakpoint on current line                                  |
| `<leader>dB`               | Conditional breakpoint (e.g. `i == 10`)                            |
| `<leader>dl`               | Log point (prints a message, doesn't pause)                        |
| `<F5>` / `<leader>dc`      | Start debugging / continue to next breakpoint                      |
| `<F10>` / `<leader>do`     | Step over (run this line, don't enter functions)                   |
| `<F11>` / `<leader>di`     | Step into (enter the function call on this line)                   |
| `Shift+F11` / `<leader>dO` | Step out (finish current function, pop up a level)                 |
| `<leader>dj`               | Run to cursor                                                      |
| `<leader>dL`               | Re-run the last debug config (fast iteration)                      |
| `<leader>dt`               | Terminate session                                                  |
| `<leader>du`               | Toggle the DAP UI panels                                           |
| `<leader>de`               | Evaluate expression under cursor / selection                       |
| `<leader>dr`               | Toggle the REPL (type expressions, run code in the paused context) |

## Basic workflow (same for every language)

1. Open the file you want to debug.
2. Put your cursor on a line and press `<F9>` to set a breakpoint — you'll
   see a red dot `●` in the gutter.
3. Press `<F5>`. The first time, nvim-dap will ask you which configuration
   to run (e.g. "Launch file"). Pick it.
4. The UI opens automatically: left panel shows **Scopes** (local
   variables), **Breakpoints**, **Call Stack**, **Watches**; bottom panel
   shows the **REPL/Console**.
5. Execution runs until it hits your breakpoint and pauses. The line is
   highlighted and a `▶` shows in the gutter.
6. Now step through with `<F10>` (over) and `<F11>` (into). Hover variables
   or check the Scopes panel to see values. Virtual text will also show
   values inline next to variables on the current line.
7. Press `<F5>` again to continue to the next breakpoint, or `<leader>dt`
   to stop entirely.

That loop — breakpoint, launch, step, inspect, continue — is 90% of
debugging. Everything else is refinements on it.

## Language-specific notes

### C / C++ (codelldb)

- You need a binary compiled **with debug symbols**: `gcc -g main.c -o main`
  or `cmake -DCMAKE_BUILD_TYPE=Debug`. Without `-g`, the debugger can't map
  machine code back to your source lines — stepping will look broken.
- On `<F5>`, "Launch file" will prompt you for the path to the compiled
  executable (not the `.c`/`.cpp` source file). Point it at your binary.
- It'll also prompt for program arguments — leave blank and hit enter if
  your program takes none.
- "Attach to process" is for debugging something already running (e.g. a
  server) — it'll show a process picker.

### Python (debugpy)

- Works out of the box on the currently open `.py` file via "Launch file".
- If you're in a virtualenv, nvim-dap-python detects it automatically as
  long as it's activated in the shell Neovim was started from, or you can
  point it explicitly — see `:help dap-python`.
- Use "Launch file with arguments" (added in the config) if your script
  takes CLI args.
- `nvim-dap-python` also gives you `:lua require('dap-python').test_method()`
  to debug the pytest/unittest test under your cursor directly — very
  useful, bind it to a key if you write a lot of tests:
  ```lua
  vim.keymap.set("n", "<leader>dm", function()
    require("dap-python").test_method()
  end, { desc = "Debug Python test method" })
  ```

### TypeScript / JavaScript (js-debug-adapter)

This one has the most moving parts because of transpilation, so a bit more
detail:

- **Plain Node file**: "Launch file (node)" just runs `node <file>` under
  the debugger. Works for `.js` files directly.
- **TypeScript file**: "Launch file (ts-node)" runs it through `ts-node`,
  so you need `ts-node` installed in the project (`npm i -D ts-node`).
  Source maps are enabled so breakpoints on your `.ts` lines work correctly
  even though Node actually executes transpiled JS.
- **A dev server / npm script**: "Debug npm script (npm run dev)" launches
  `npm run dev` under the debugger — good for Next.js/Express apps. Edit
  the script name in the config to match your `package.json`.
- **Already-running process** (e.g. you started `node --inspect server.js`
  yourself): use "Attach to process".
- If breakpoints show as unfilled/greyed out circles, it usually means
  source maps didn't line up — double check `sourceMaps: true` is on and,
  for bundlers (webpack/esbuild/vite), that source maps are actually being
  generated in dev mode.

## Tips once you're comfortable

- **Conditional breakpoints** (`<leader>dB`) are the single biggest time
  saver — instead of stepping through a loop 500 times, set a breakpoint
  that only fires when `i == 499`.
- **The REPL** (`<leader>dr`) lets you evaluate arbitrary expressions in
  the paused scope — call functions, mutate variables, check assumptions —
  without editing and re-running your code.
- **`<leader>dL`** (run last) is the fast-iteration key: fix something,
  hit it, and you're back at the same breakpoint without reselecting a
  config every time.
- **Watches**: in the DAP UI Watches panel, add expressions you want
  tracked continuously across every step (e.g. `head->next->val`).
- If a session ever gets stuck, `<leader>dt` to terminate, then `:DapTerminate`
  as a hard fallback, or just restart Neovim.
