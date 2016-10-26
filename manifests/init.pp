class xtables_yum_rebuild (
  $noop_value = lookup('xtables_yum_rebuild::noop_value'),
  $packages = lookup('xtables_yum_rebuild::packages'),
  $file_defaults = lookup('xtables_yum_rebuild::file_defaults', 'Hash'),
  $file_defaults = lookup('xtables_yum_rebuild::file_defaults', 'Hash'),
  $file_defaults = lookup('xtables_yum_rebuild::file_defaults', 'Hash'),
) {
  package { $packages:
    noop   => $noop_value,
    ensure => 'present'
  }
}
