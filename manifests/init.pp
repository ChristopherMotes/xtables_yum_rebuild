class xtables_yum_rebuild (
  $noop_value = lookup('xtables_yum_rebuild::noop_value'),
  $packages = lookup('xtables_yum_rebuild::packages'),
) {
  package { $packages:
    noop   => $noop_value,
    ensure => 'present'

}
