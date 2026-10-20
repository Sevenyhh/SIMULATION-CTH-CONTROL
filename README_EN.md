# Protected Single-Case HVAC Simulation Example

This package is an illustrative implementation for one summer-sunny operating scenario. It is not the complete set of manuscript cases or an independently field-validated system.

## Run

Use a fresh MATLAB session with MATLAB R2022a or later, Simulink, Model Predictive Control Toolbox, Control System Toolbox, and Statistics and Machine Learning Toolbox (used by TIEO's `kmeans` call). P-code does not remove these license requirements. Set the current folder to this package root and execute:

```matlab
run_summersunny_full
```

The entry point isolates the package's search paths. It runs the fixed-parameter baseline and then the upper-layer optimization strategy, each for 24 hours, with MPC/PID terminal control. Outputs are written to the case folder's `inputs`, `outputs`, and `figures` directories. The base workspace is cleared by the case-level script; save unrelated work before running.

## Included Files

- `Case_SummerSunny/model`: the active Simulink model, MPC parameters, initialization matrices, and required input template.
- Case-level and `functions` P-files: optimization, energy calculations, model preparation, controller integration, logging, evaluation, and plotting.
- `case3_config.m` and `case3_apply_shared_0830_settings.m`: readable configuration, including the existing numerical settings, calibration factors, controller tuning, and load-dependent adjustments. The shared settings override matching case-level settings.
- `history_weather_profiles.csv`: processed weather/load inputs; full historical measurement workbooks are not included.
- `runtime_variable_dictionary.xlsx`: a single-sheet dictionary of 28 required variable definitions, values, and units, retained for startup checks. Historical development logs are not included. Use the root entry point, which enables read-only dictionary mode for the duration of the run and restores the prior setting on exit.
- `protected_files_sha256.csv`: checksums for this protected distribution, replacing the original source-file lock.

Unused historical models, maintenance scripts, backups, old results, and previously generated caches are omitted. Standalone comments are removed from the readable MATLAB files; code-generation-required source and model interfaces remain available where necessary.

## Protection and Transparency

Core MATLAB functions, including TIEO and the energy model, are supplied as executable P-code rather than readable M-files. Existing algorithms and numerical treatments are retained; encoding does not constitute a new model calibration or validation.

P-code obscures source text. It does not encrypt the CSV inputs, MAT parameter files, or the Simulink block diagram and embedded block code. Full Simulink protected-model conversion was not attempted because the current workflow modifies model blocks at runtime.

This distribution format does not replace scientific disclosure of methods and performance-affecting settings.

### Protected Components

The package contains 66 executable MATLAB P-files. Protected implementations include:

- `TIEO_run.p` and `TIEO_run_wrapper_reheat_0715.p`: the optimization algorithm and its upper-layer integration.
- `CAC_AHU_block_reheat_0715.p`, `CAC_AHU_block_reheat_0704.p`, `CAC_AHU_block_fixed.p`, and `bengbu_realtime_energy_0715.p`: packaged energy-model implementations, compatibility functions, and quasi-steady energy evaluation.
- Other P-files: simulation preparation, initialization, coordination integration, logging, metrics, plotting, and runtime checks. The file inventory is recorded in `Case_SummerSunny/protected_files_sha256.csv`.

These are source-obscured executable implementations, not cryptographically encrypted files. No MEX or Simulink protected-model (`.slxp`) conversion is included. Source protection preserves the existing computations; it does not establish the correctness of the model or its calibration.

### Inspectable Components and Reproducibility Limits

The entry point, `case3_config.m`, `case3_apply_shared_0830_settings.m`, the mixed-air source function, and the input template remain readable. Shared settings override matching case-level values. The CSV inputs, MAT parameter files, runtime dictionary, and SLX block diagram and embedded code are not encrypted. Some internal calculations and coefficients remain inside P-files; this package therefore does not provide complete source-level inspectability.

This is one illustrative summer-sunny case, not the full four-case study, raw measurement archive, or complete source release. The weather/load CSV contains processed simulation inputs. The runtime dictionary contains only current startup-check definitions, not the author development log or raw measurements. Removing private development logs does not remove the obligation to disclose performance-affecting calibration, numerical adjustments, controller settings, and input processing in the manuscript and supporting methods.

The intended use is execution and inspection of the supplied single-case example under the stated MATLAB/toolbox requirements. The protected format must be disclosed to the editor and reviewers. Acceptance of P-code depends on the journal's code and data policy; this package must not be described as open-source or fully independently reproducible. If inspectable source, underlying measurements, or all reported cases are required, additional material or an access arrangement accepted by the journal is necessary. No private-source access arrangement is established by this README.

### Verification Scope

Before the directory rename, the baseline and optimized strategies each completed a 60-second dynamic test. Fixed-input energy evaluations at three boundaries and a seeded TIEO toy test matched the readable implementation exactly. The reduced runtime dictionary subsequently passed variable checks and 24-hour input-profile loading. These checks do not constitute a full 24-hour dynamic rerun.

The short optimized test produced only one upper-history record, while the original plotting routine requires at least two for interpolation. Full-duration figure generation remains unverified. Consult `VALIDATION_STATUS.json` for test scope and limitations; do not infer full-duration or field validation from the short tests.

### Comment Removal

The five distributed readable `.m` files contain no percent-sign comments in the current package. This statement does not apply to the SLX contents: its nine embedded MATLAB scripts retain 37 standalone comment lines, and the model contains 20 annotation nodes. Embedded comments may include code-generation directives and model explanations; they have not been indiscriminately removed. P-files do not expose readable MATLAB source comments, but P-code is not a strong-encryption guarantee.
