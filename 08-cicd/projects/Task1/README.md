# Task 1 — CI Pipeline: Lint and Test

## What I Built

An automated CI pipeline using GitHub Actions that runs code quality checks
on every push to the repository — specifically linting and unit testing a
simple Python application.

## How It Works

1. Code is checked out from the repository
2. Python 3.8 is set up on the runner
3. `flake8` and `pytest` are installed
4. `flake8` lints `app.py`, checking for style violations and syntax issues
5. `pytest` runs `test_app.py`, verifying that `say_hello()` returns the
   correct value

If either the lint check or the test fails, the pipeline stops and reports
a failure — catching problems before they can reach later stages like
deployment.

## Files

- `app.py` — the simple Python application being tested
- `test_app.py` — a unit test verifying `say_hello()` returns
  `"Hello, World!"`
- the workflow itself lives at `.github/workflows/task1-ci.yaml`

## Screenshots

![Task 1 lint and test pipeline succeeding](image.png)

## What I Learned

- How to set up a Python environment inside a GitHub Actions runner using
  `actions/setup-python`
- How `flake8` enforces PEP 8 style rules automatically, including things
  as small as blank-line spacing and trailing newlines
- How to structure a `pytest` test by importing a function directly from
  the application file
- That `working-directory` in a workflow step changes where a command runs
  from, which matters when files reference each other by relative import

## Issues I Solved

- **E305 blank line spacing**: flake8 failed with
  `expected 2 blank lines after function definition, found 1`. Fixed by
  adding a second blank line between the function definition and the
  `if __name__ == "__main__":` block, matching PEP 8 convention.
- **W292 missing newline at end of file**: flake8 requires every file to
  end with a newline character. Fixed by adding a trailing blank line
  after the last line of code.
- **W293 blank line contains whitespace**: after adding the newline, the
  new blank line accidentally contained invisible trailing spaces
  (inserted automatically by the editor's auto-indent). Fixed by clearing
  the line completely so it was truly empty, and enabled VS Code's
  "trim trailing whitespace" and "insert final newline" settings to
  prevent this recurring.
- **Silent failed commit**: a `git add .` picked up an unrelated modified
  file instead of the actual fix, so `git commit` reported "no changes
  added to commit" and the real fix was never pushed. Fixed by staging
  the specific file path directly (`git add path/to/app.py`) instead of
  using a blanket `git add .`.