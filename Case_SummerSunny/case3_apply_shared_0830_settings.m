function cfg = case3_apply_shared_0830_settings(cfg)

cfg.system.n_ahu = 80;
cfg.system.n_representative_branches = 2;
cfg.load.sensible_heat_ratio = 0.85;
cfg.load.latent_heat_ratio = 1.0-cfg.load.sensible_heat_ratio;
cfg.coordination.n_ahu = cfg.system.n_ahu;

cfg.constraint.flow.reheat_dev_max_kg_s = 4.0;
cfg.constraint.flow.reheat_abs_max_kg_s = ...
    cfg.nominal.flow.reheat_kg_s+cfg.constraint.flow.reheat_dev_max_kg_s;

cfg.control.pid.precooling = struct('block','Subsystem3/PID Controller2', ...
    'P',5.0,'I',0.0030,'D',0.0,'N',50);
cfg.control.pid.recooling = struct('block','Subsystem3/PID Controller1', ...
    'P',7200,'I',0.35,'D',0.0,'N',50);
cfg.control.pid.reheat = struct('block','Subsystem3/PID Controller', ...
    'P',0.38,'I',0.0024,'D',0.004,'N',60);

cfg.air.fresh_air_ratio_min = 0.05;
cfg.air.fresh_air_ratio_max = 0.60;
cfg.air.ratio_projection_gain = 0.35;
cfg.air.fresh_air_ratio_bias = 0.00;
cfg.air.ratio_smoothing_enable = false;
cfg.air.ratio_smoothing_tau_s = 0;
cfg.air.ratio_max_rate_per_h = 0;
cfg.air.return_state_filter_enable = false;
cfg.air.return_T_filter_tau_s = 0;
cfg.air.return_W_filter_tau_s = 0;
cfg.air.startup_return_T_hold_enable = false;
cfg.air.startup_return_T_hold_s = 0;
cfg.air.startup_return_T_transition_s = 0;
cfg.air.startup_inlet_disturbance_ramp_s = 0;
cfg.air.startup_inlet_ramp_min_s = 0;
cfg.air.startup_inlet_ramp_max_s = 0;
cfg.air.startup_load_disturbance_ramp_enable = false;
cfg.profile.load_deviation_amplification = 1.00;

cfg.optimization.lb = [10,5,0.04,255,255,255,430,430,430,315,225];
cfg.optimization.ub = [15,9,0.58,850,850,850,1290,1290,1290,3150,2250];
cfg.optimization.number_cou = 60;
cfg.optimization.Max = 50;
cfg.optimization.n_country = 5;
cfg.optimization.w = 0.5;
cfg.optimization.header_flow_min_low_m3h = 0.30*850;
cfg.optimization.header_flow_min_mid_m3h = 0.30*1290;
cfg.optimization.run_seed = 8;
cfg.optimization.use_previous_effective_solution = true;
cfg.optimization.startup_first_optimized_solution_enable = true;
cfg.optimization.startup_operating_point_enable = true;
cfg.optimization.startup_operating_point_hold_s = 0;
cfg.optimization.startup_coordination_transition_enable = false;
cfg.optimization.startup_coordination_transition_s = 0;
cfg.optimization.warm_start_enable = false;
cfg.optimization.rate_limit_enable = false;
cfg.optimization.water_temperature_rate_limit_enable = false;
cfg.optimization.water_flow_rate_limit_enable = false;
cfg.optimization.max_delta_per_update = inf(1,11);
cfg.optimization.condition_sensitive_near_optimal_enable = false;
cfg.optimization.condition_cross_time_constraint_enable = false;
cfg.optimization.condition_trend_weight = 0;
cfg.optimization.condition_original_solution_weight = 0;
cfg.optimization.condition_fitness_weight = 0;
cfg.optimization.condition_precooling_weight = 0;
cfg.optimization.condition_recooling_weight = 0;
cfg.optimization.condition_global_load_weight = 0;
cfg.optimization.condition_daily_load_weight = 0;
cfg.optimization.condition_temperature_weight = 0;
cfg.optimization.condition_humidity_weight = 0;
cfg.optimization.condition_flow_step_soft_weight = 0;
cfg.optimization.condition_flow_step_deadband_kg_s = inf;
cfg.optimization.startup_reheat_temperature_hold_enable = false;
cfg.optimization.startup_reheat_temperature_hold_s = 0;
cfg.optimization.startup_reheat_temperature_transition_s = 0;
cfg.optimization.cop_min = 3.0;
cfg.optimization.cop_max = 9.5;
cfg.optimization.cop_penalty_weight_kw = 0;
cfg.optimization.load_trend_adjustment_enable = true;
cfg.optimization.load_trend_gain = struct( ...
    'mid_temperature_C',0.90,'low_temperature_C',1.10, ...
    'mid_flow_kg_s',100.0,'low_flow_kg_s',120.0, ...
    'load_distribution_factor',0.08);

cfg.control.startup_state_trim_enable = true;
cfg.control.startup_mv_preload_enable = true;
cfg.control.startup_room_state_trim_enable = true;
cfg.control.startup_equilibrium_preserve_enable = false;
cfg.control.startup_room_state_release_fraction = 0.25;
cfg.control.startup_room_temperature_offset_C = 0;
cfg.control.startup_room_humidity_ratio_offset_kg_kg = 0;
cfg.control.startup_state_trim_regularization = 1e-10;
cfg.control.startup_trim_temperature_scale_C = 0.20;
cfg.control.startup_trim_humidity_ratio_scale_kg_kg = 0.00015;
cfg.control.startup_invalid_upper_fallback_s = 10;
cfg.control.startup_state_water_boundary_mode = 'optimized';
cfg.control.startup_state_water_max_offset_C = 0;

cfg.energy.air_process_load_scale = 1.0;
cfg.energy.reheat_energy_weight = 1.0;
cfg.energy.reheat_energy_bias_kw = 0.0;
cfg.energy.aux_reheat_cop = 8.0;
cfg.energy.chiller_power_scale = 0.6635;
cfg.energy.chilled_pump_power_scale = 1.0;
cfg.energy.cooling_pump_power_scale = 1.0;
cfg.energy.cooling_tower_power_scale = 1.0;
cfg.energy.power_reporting_scale = 1.0;
cfg.energy.service_equivalent_power_enable = false;
cfg.energy.force_chillers_on_enable = false;
cfg.energy.low_uac_scale = 1.0;
cfg.energy.low_chiller_a1 = [0.7000 0.7000 0.4984];
cfg.energy.low_chiller_a2 = [0.7545 0.7545 0.5877];
cfg.energy.mid_chiller_a1 = [0.1587 0.1694];
cfg.energy.mid_chiller_a2 = [0.1787 0.1954];
cfg.energy.coil_water_deltaT_max_C = 10.0;
cfg.energy.coil_water_deltaT_cost_kw = 1.0;
cfg.energy.fixed_operation_x = [12.0,7.0,0.32,256,256,256,431,431,431];
cfg.energy.reheat_water_nominal_C = cfg.nominal.water_in.reheat_C;

cfg.baseline.fixed_x = cfg.energy.fixed_operation_x;
cfg.baseline.water_in.precooling_C = cfg.nominal.water_in.precooling_C;
cfg.baseline.water_in.recooling_C = cfg.nominal.water_in.recooling_C;
cfg.baseline.water_in.reheat_C = cfg.nominal.water_in.reheat_C;
cfg.baseline.coordinator_flow.precooling_total_kg_s = ...
    cfg.nominal.flow.precooling_kg_s*cfg.system.n_ahu;
cfg.baseline.coordinator_flow.recooling_total_kg_s = ...
    cfg.nominal.flow.recooling_kg_s*cfg.system.n_ahu;
cfg.baseline.coordinator_flow.reheat_total_kg_s = ...
    cfg.nominal.flow.reheat_kg_s*cfg.system.n_ahu;
end
