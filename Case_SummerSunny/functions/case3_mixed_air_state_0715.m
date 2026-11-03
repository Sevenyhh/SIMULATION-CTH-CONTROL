function [t_mix,w_mix,h_mix,w_outdoor] = case3_mixed_air_state_0715( ...
    t_outdoor,rh_outdoor,t_return,w_return,fresh_air_ratio,p_atm)

if nargin < 6 || isempty(p_atm)
    p_atm = 101325;
end

rh_outdoor = min(max(rh_outdoor,0),1);
fresh_air_ratio = min(max(fresh_air_ratio,0),1);

p_ws = 611.2 .* exp(17.67 .* t_outdoor ./ (t_outdoor + 243.5));
p_v = min(rh_outdoor .* p_ws,0.98 .* p_atm);
w_outdoor = 0.62198 .* p_v ./ max(p_atm - p_v,eps);

return_air_ratio = 1 - fresh_air_ratio;
t_mix = fresh_air_ratio .* t_outdoor + return_air_ratio .* t_return;
w_mix = fresh_air_ratio .* w_outdoor + return_air_ratio .* w_return;
h_mix = 1.005 .* t_mix + w_mix .* (2501 + 1.86 .* t_mix);
end
