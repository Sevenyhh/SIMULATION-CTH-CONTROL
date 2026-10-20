function run_summersunny_full()
root=fileparts(mfilename('fullpath'));
case_dir=fullfile(root,'Case_SummerSunny');
old_path=path;old_dir=pwd;old_dictionary_mode=getenv('CASE3_DICTIONARY_READ_ONLY');
cleanup=onCleanup(@() restore_session(old_path,old_dir,old_dictionary_mode));
setenv('CASE3_DICTIONARY_READ_ONLY','1');
restoredefaultpath;
addpath(root,'-end');addpath(fullfile(case_dir,'model'),'-end');
addpath(case_dir,'-begin');addpath(fullfile(case_dir,'functions'),'-begin');
cd(case_dir);rehash;
assert(endsWith(which('TIEO_run'),'.p'),'ProtectedPackage:TIEONotProtected','Expected packaged TIEO P-code.');
assert(endsWith(which('CAC_AHU_block_reheat_0715'),'.p'),'ProtectedPackage:EnergyNotProtected','Expected packaged energy-model P-code.');
evalin('base','run_case3_all;');
end

function restore_session(old_path,old_dir,old_dictionary_mode)
setenv('CASE3_DICTIONARY_READ_ONLY',old_dictionary_mode);
path(old_path);cd(old_dir);
end
