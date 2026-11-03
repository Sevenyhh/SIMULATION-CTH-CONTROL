function parameters = case3_empirical_parameters()
parameters.empirical_corrections.load_dispatch.enabled = true;
parameters.empirical_corrections.load_dispatch.medium_temperature_gain_C = 0.90;
parameters.empirical_corrections.load_dispatch.low_temperature_gain_C = 1.10;
parameters.empirical_corrections.load_dispatch.medium_flow_gain_kg_s = 100.0;
parameters.empirical_corrections.load_dispatch.low_flow_gain_kg_s = 120.0;
parameters.empirical_corrections.load_dispatch.allocation_factor_gain = 0.08;
parameters.empirical_corrections.chiller_power_multiplier = 0.6635;
parameters.empirical_corrections.auxiliary_reheat_effective_cop = 8.0;
parameters.initialization.room_state_adjustment_fraction = 0.25;
parameters.controller_tuning.pid.precooling = struct( ...
    'block','Subsystem3/PID Controller2','P',5.0,'I',0.0030,'D',0.0,'N',50);
parameters.controller_tuning.pid.recooling = struct( ...
    'block','Subsystem3/PID Controller1','P',7200,'I',0.35,'D',0.0,'N',50);
parameters.controller_tuning.pid.reheat = struct( ...
    'block','Subsystem3/PID Controller','P',0.38,'I',0.0024,'D',0.004,'N',60);
end
