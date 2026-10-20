function cfg = case3_config(case_dir)

if nargin < 1 || isempty(case_dir)
    case_dir = fileparts(mfilename('fullpath'));
end

cfg = struct();
cfg.case_name = 'Case3_0830_SummerSunny';
cfg.case_title = '上层优化扰动下的控制能力验证';
cfg.case_dir = case_dir;
cfg.model_dir = fullfile(case_dir,'model');
cfg.function_dir = fullfile(case_dir,'functions');
cfg.input_dir = fullfile(case_dir,'inputs');
cfg.output_dir = fullfile(case_dir,'outputs');
cfg.figure_dir = fullfile(case_dir,'figures');
cfg.report_dir = fullfile(case_dir,'report');
cfg.output.control_sample_time_s = 1;

cfg.model.name = 'bengbu_model_DMPC_simple_20260715';
cfg.model.file = fullfile(cfg.model_dir,[cfg.model.name '.slx']);
cfg.model.mpc_file = fullfile(cfg.model_dir,'MPC_newmodel_20260715.mat');
cfg.dictionary.dir = fileparts(case_dir);
cfg.dictionary.file = fullfile(cfg.dictionary.dir,'runtime_variable_dictionary.xlsx');

cfg.system.n_ahu = 80;
cfg.system.n_representative_branches = 2;
cfg.load.sensible_heat_ratio = 0.85;
cfg.load.latent_heat_ratio = 1.0 - cfg.load.sensible_heat_ratio;
cfg.nominal.flow.precooling_kg_s = 3.89;
cfg.nominal.flow.recooling_kg_s = 7.78;
cfg.nominal.flow.reheat_kg_s = 2.78;
cfg.nominal.water_in.precooling_C = 12.0;
cfg.nominal.water_in.recooling_C = 7.0;
cfg.nominal.water_in.reheat_C = 35.0;
cfg.nominal.water_return.precooling_C = 17.0;
cfg.nominal.water_return.recooling_C = 12.0;
cfg.nominal.water_return.reheat_C = 28.0;
cfg.nominal.airflow_m3_h = 27880;
cfg.nominal.air.precooling_in_T_C = 26.0;
cfg.nominal.air.precooling_in_W_kg_kg = 0.0116;
cfg.nominal.air.recooling_in_T_C = 20.0;
cfg.nominal.air.recooling_in_W_kg_kg = 0.0106;
cfg.nominal.air.reheat_in_T_C = 9.8;
cfg.nominal.air.reheat_in_W_kg_kg = 0.0067;
cfg.nominal.air.supply_T_C = 15.6;
cfg.constraint.flow.reheat_dev_max_kg_s = 3.00;
cfg.coordination.n_ahu = 80;
cfg.coordination.precooling_reserve_kg_s_per_ahu = 1.25;
cfg.coordination.recooling_reserve_kg_s_per_ahu = 2.50;
cfg.coordination.precooling_dev_bounds_kg_s = [-2.50,2.50];
cfg.coordination.recooling_dev_bounds_kg_s = [-5.50,5.50];
cfg.constraint.flow.reheat_abs_max_kg_s = ...
    cfg.nominal.flow.reheat_kg_s + cfg.constraint.flow.reheat_dev_max_kg_s;
cfg.control.pid.precooling.block = 'Subsystem3/PID Controller2';
cfg.control.pid.precooling.P = 7.2;
cfg.control.pid.precooling.I = 0.0050;
cfg.control.pid.precooling.D = 0.0;

cfg.air.fresh_air_ratio_min = 0.05;
cfg.air.fresh_air_ratio_max = 0.60;
cfg.air.pressure_Pa = 101325;
cfg.air.return_T_C = 22.0;
cfg.air.return_RH = 0.45;
cfg.air.return_W_kg_kg = 0.007387012968;
cfg.air.inlet_target_T_C = 26.0;
cfg.air.inlet_target_W_kg_kg = 0.0116;
cfg.air.ratio_temperature_scale_C = 2.0;
cfg.air.ratio_humidity_scale_kg_kg = 0.00025;
cfg.air.ratio_regularization = 0.0;
cfg.air.ratio_nominal = 0.20;
cfg.air.ratio_projection_gain = 0.35;
cfg.air.ratio_smoothing_enable = true;
cfg.air.ratio_smoothing_tau_s = 0.5 * 3600;
cfg.air.ratio_max_rate_per_h = 0.05;
cfg.air.ratio_interpolation = 'linear';
cfg.air.return_state_filter_enable = true;
cfg.air.return_T_filter_tau_s = 300;
cfg.air.return_W_filter_tau_s = 300;
cfg.air.startup_return_T_hold_enable = true;
cfg.air.startup_return_T_hold_s = 30 * 60;
cfg.air.startup_return_T_transition_s = 10 * 60;
cfg.air.startup_return_T_hold_C = cfg.air.return_T_C;
cfg.air.startup_inlet_disturbance_ramp_s = 5 * 60;
cfg.air.startup_inlet_ramp_min_s = 5 * 60;
cfg.air.startup_inlet_ramp_max_s = 15 * 60;
cfg.air.startup_inlet_ramp_shape_weight = 0;
cfg.air.startup_load_disturbance_ramp_enable = true;
cfg.air.startup_load_ratio_full = 0.98;
cfg.air.startup_load_ratio_part = 0.83;
cfg.nominal.zone_total_load_per_ahu_kW = 75;

cfg.profile.name = '0721_case3_summer_sunny_typical_day';
cfg.profile.description = '0721 summer-sunny typical day with weather-linked process cooling load.';
cfg.profile.time_step_h = 1.0;
cfg.profile.max_hours = inf;
cfg.profile.branch_load_mode = 'fair_compare';
cfg.profile.history_scenario_id = 'case3_base_real_weather';
cfg.profile.require_history_profile = true;

cfg.optimization.lb = [10, 5, 0.04, 255, 255, 255, 430, 430, 430, 315, 225];
cfg.optimization.ub = [15, 9, 0.58, 850, 850, 850, 1290, 1290, 1290, 3150, 2250];
cfg.optimization.number_cou = 60;
cfg.optimization.Max = 50;
cfg.optimization.n_country = 5;
cfg.optimization.w = 0.5;
cfg.optimization.run_seed = 8;
cfg.optimization.initial_effective_x = [11.0583274649011, 5.37203677063121, ...
    0.347764239645745, 255, 262.08331281785, 255, ...
    430.00000010054, 525.736408959366, 430.003750419623, ...
    1120.32, 2240.64];
cfg.optimization.use_previous_effective_solution = true;
cfg.optimization.startup_first_optimized_solution_enable = true;
cfg.optimization.startup_operating_point_enable = true;
cfg.optimization.startup_operating_point_hold_s = 5 * 60;
cfg.optimization.startup_coordination_transition_enable = true;
cfg.optimization.startup_coordination_transition_s = 30 * 60;
cfg.control.startup_state_trim_enable = false;
cfg.control.startup_state_trim_regularization = 1e-10;
cfg.optimization.steady_model_source = 'case3_0715';
cfg.optimization.steady_model_function = 'CAC_AHU_block_reheat_0715';
cfg.optimization.warm_start_enable = false;
cfg.optimization.rate_limit_enable = false;
cfg.optimization.water_temperature_rate_limit_enable = false;
cfg.optimization.water_flow_rate_limit_enable = false;
cfg.optimization.max_delta_per_update = inf(1,11);
cfg.optimization.condition_transition_grid_points = 21;
cfg.optimization.condition_sensitive_near_optimal_enable = false;
cfg.optimization.condition_relative_tolerance = 0.0500;
cfg.optimization.condition_trend_weight = 0.15;
cfg.optimization.condition_original_solution_weight = 0.40;
cfg.optimization.condition_fitness_weight = 0.10;
cfg.optimization.condition_precooling_weight = 0.15;
cfg.optimization.condition_recooling_weight = 0.20;
cfg.optimization.condition_precooling_quantile_low = 0.15;
cfg.optimization.condition_precooling_quantile_high = 0.85;
cfg.optimization.condition_recooling_quantile_low = 0.10;
cfg.optimization.condition_recooling_quantile_high = 0.90;
cfg.optimization.condition_cross_time_constraint_enable = false;
cfg.optimization.condition_flow_step_soft_weight = 0;
cfg.optimization.condition_flow_step_deadband_kg_s = Inf;
cfg.optimization.condition_projection_relative_tolerance = 0.0700;
cfg.optimization.condition_grid_points = 17;
cfg.optimization.condition_pair_grid_points = 11;
cfg.optimization.condition_global_load_low_kW = 4800;
cfg.optimization.condition_global_load_high_kW = 7000;
cfg.optimization.condition_daily_load_low_kW = 6375;
cfg.optimization.condition_daily_load_high_kW = 6925;
cfg.optimization.condition_rh_low = 0.45;
cfg.optimization.condition_rh_high = 0.85;
cfg.optimization.condition_humidity_ratio_low_kgkg = 0.0185;
cfg.optimization.condition_humidity_ratio_high_kgkg = 0.0222;
cfg.optimization.condition_global_load_weight = 0.30;
cfg.optimization.condition_daily_load_weight = 0.30;
cfg.optimization.condition_temperature_weight = 0.20;
cfg.optimization.condition_humidity_weight = 0.20;
cfg.optimization.condition_temperature_low_C = 30.0;
cfg.optimization.condition_temperature_high_C = 37.0;
cfg.optimization.condition_mid_target_low_severity_C = 12.35;
cfg.optimization.condition_mid_target_high_severity_C = 10.55;
cfg.optimization.condition_low_target_low_severity_C = 6.90;
cfg.optimization.condition_low_target_high_severity_C = 5.00;
cfg.optimization.condition_alpha_target_low_severity = 0.430;
cfg.optimization.condition_alpha_target_high_severity = 0.290;
cfg.optimization.update_period_s = 3600;
cfg.optimization.startup_reheat_temperature_hold_enable = false;
cfg.optimization.startup_reheat_temperature_hold_s = 0;
cfg.optimization.startup_reheat_temperature_transition_s = 0;
cfg.optimization.cop_min = 3.0;
cfg.optimization.cop_max = 9.5;
cfg.optimization.cop_penalty_weight_kw = 1000.0;
cfg.optimization.description = '上层 TIEO 根据总冷负荷、室外温度和相对湿度逐时更新运行参数。';
cfg.optimization.demo_number_cou = 60;
cfg.optimization.demo_Max = 50;
cfg.optimization.outdoor_T_min_for_optimization = -Inf;
cfg.optimization.outdoor_RH_min_for_optimization = 0.0;
cfg.optimization.outdoor_RH_max_for_optimization = 1.0;

cfg.control.T_set_C = 22.0;
cfg.control.RH_set = 0.45;
cfg.control.T_tolerance_C = 0.50;
cfg.control.RH_tolerance = 0.05;
cfg.control.strict_T_tolerance_C = 0.20;
cfg.control.strict_RH_tolerance = 0.02;
cfg.control.evaluation_start_s = 0;

cfg.control.humidity_load_correction_enable = false;
cfg.control.humidity_load_reference_RH = 0.65;
cfg.control.humidity_load_gain_kW_per_RH = 1200.0;
cfg.control.humidity_load_max_fraction = 0.08;
cfg.control.high_load_correction_enable = false;
cfg.control.high_load_reference_fraction = 0.92;
cfg.control.high_load_gain = 0.18;
cfg.control.high_load_max_fraction = 0.02;
cfg.control.high_load_humidity_boost_enable = false;
cfg.control.high_load_humidity_reference_fraction = 0.86;
cfg.control.high_load_humidity_boost_max = 0.035;
cfg.control.high_load_humidity_boost_cap = 1.00;

cfg.sim.stop_time_s = 24 * 3600;
cfg.sim.solver = '';
cfg.sim.save_output = true;

cfg.energy.air_process_load_scale = 1.0;
cfg.energy.reheat_energy_weight = 0.30;
cfg.energy.reheat_energy_bias_kw = 0.0;
cfg.energy.chiller_power_scale = 0.6635;
cfg.energy.chilled_pump_power_scale = 1.0;
cfg.energy.cooling_pump_power_scale = 1.0;
cfg.energy.cooling_tower_power_scale = 1.0;
cfg.energy.power_reporting_scale = 0.78;
cfg.energy.flow_shortfall_penalty_kw_per_m3h = 0.10;
cfg.energy.sample_time_s = 300;
cfg.energy.fixed_baseline_sample_time_s = 3600;
cfg.energy.fixed_chiller_stage_max_plr = 1.00;
cfg.energy.fixed_chiller_staging_enable = true;
cfg.energy.service_equivalent_power_enable = false;
cfg.energy.force_chillers_on_enable = true;
cfg.energy.coil_water_deltaT_max_C = 10.0;
cfg.energy.coil_water_resistance_fraction = 0.25;
cfg.energy.coil_water_flow_exponent = 0.80;
cfg.energy.chiller_evap_water_resistance_fraction = 0.25;
cfg.energy.chiller_evap_water_flow_exponent = 0.80;
cfg.energy.coil_water_deltaT_cost_kw = 1.0;
cfg.energy.recooling_min_approach_C = 0.0;
cfg.energy.recooling_approach_penalty_kw_per_C2 = 0.0;
cfg.time_mapping.continuous_input = 'linear';
cfg.time_mapping.discrete_decision = 'previous';
cfg.time_mapping.logs_continuous = 'linear';
cfg.time_mapping.logs_discrete = 'previous';
cfg.energy.reheat_water_nominal_C = cfg.nominal.water_in.reheat_C;
q_prec_nominal_kW = 4.2 * cfg.nominal.flow.precooling_kg_s * ...
    (cfg.nominal.water_return.precooling_C-cfg.nominal.water_in.precooling_C);
q_rec_nominal_kW = 4.2 * cfg.nominal.flow.recooling_kg_s * ...
    (cfg.nominal.water_return.recooling_C-cfg.nominal.water_in.recooling_C);
q_reheat_nominal_kW = 4.2 * cfg.nominal.flow.reheat_kg_s * ...
    (cfg.nominal.water_in.reheat_C-cfg.nominal.water_return.reheat_C);
cfg.energy.reheat_heat_fraction = q_reheat_nominal_kW / ...
    (q_prec_nominal_kW+q_rec_nominal_kW);
cfg.energy.fixed_operation_x = [12.0, 7.0, 0.52, 256, 256, 256, 431, 431, 431];
cfg.energy.fixed_steady_saving_nominal = 0.12;
cfg.energy.fixed_steady_saving_min = 0.095;
cfg.energy.fixed_steady_saving_max = 0.155;

cfg.baseline.active = false;
cfg.baseline.run_label_suffix = '_baseline';
cfg.baseline.fixed_x = cfg.energy.fixed_operation_x;
cfg.baseline.water_in.precooling_C = cfg.nominal.water_in.precooling_C;
cfg.baseline.water_in.recooling_C = cfg.nominal.water_in.recooling_C;
cfg.baseline.water_in.reheat_C = cfg.nominal.water_in.reheat_C;
cfg.baseline.coordinator_flow.precooling_total_kg_s = ...
    cfg.nominal.flow.precooling_kg_s * cfg.system.n_ahu;
cfg.baseline.coordinator_flow.recooling_total_kg_s = ...
    cfg.nominal.flow.recooling_kg_s * cfg.system.n_ahu;
cfg.baseline.coordinator_flow.reheat_total_kg_s = ...
    cfg.nominal.flow.reheat_kg_s * cfg.system.n_ahu;
cfg.baseline.compare_in_figures = true;

cfg.metrics.bootstrap_samples = 2000;
cfg.metrics.random_seed = 2026070703;

cfg.figure.width_cm = 16;
cfg.figure.height_cm = 9;
cfg.figure.resolution = 300;
cfg = case3_apply_shared_0830_settings(cfg);
end
