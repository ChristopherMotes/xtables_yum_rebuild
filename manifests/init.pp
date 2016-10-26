class xtables_yum_rebuild (
  $noop_value = lookup('xtables_yum_rebuild::noop_value'),
  $packages = lookup('xtables_yum_rebuild::packages'),
  $file_defaults = lookup('xtables_yum_rebuild::file_defaults', 'Hash'),
  $action_file = lookup('xtables_yum_rebuild::action_file', 'Hash'),
  $action_script = lookup('xtables_yum_rebuild::action_script', 'Hash'),
) {
  package { $packages:
    noop   => $noop_value,
    ensure => 'present'
  }
}
