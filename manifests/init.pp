class xtables_yum_rebuild (
  $noop_value 		= lookup('xtables_yum_rebuild::noop_value'),
  $packages 		= lookup('xtables_yum_rebuild::packages'),
  $file_defaults 	= lookup('xtables_yum_rebuild::file_defaults', 'Hash'),
  $action_file 		= lookup('xtables_yum_rebuild::action_file', 'Hash', {"strategy" => "deep", "merge_hash_arrays" => true} ),
  $action_script 	= lookup('xtables_yum_rebuild::action_script', 'Hash[String]'),
) {
  package { $packages:
    noop   	=> $noop_value,
    ensure 	=> 'present'
  } # end packages
  file { 'xtables_action_file':
    noop   	=> $noop_value,
    path	=> $action_file['path'],
    source	=> $action_file['source'],
    ensure 	=> $file_defaults['ensure'],
    owner  	=> $file_defaults['owner'],
    group  	=> $file_defaults['group'],
    mode   	=> $file_defaults['mode'],
  } # end file xtables_action_file
  file { 'xtables_install_script':
    noop   	=> $noop_value,
    path	=> $action_script['path'],
    source	=> $action_script['source'],
    ensure 	=> $file_defaults['ensure'],
    owner  	=> $file_defaults['owner'],
    group  	=> $file_defaults['group'],
    mode   	=> $action_script['mode'],
  } # end file xtables_action_file
}
