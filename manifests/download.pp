# Installs XHGui
class xhgui::download(
  $dir,
  $version,
  $user       = undef,
  $repository = 'https://github.com/perftools/xhgui.git'
) {
  # Don't use composer create-project, as it doesn't support installing a
  # specific commit hash.
  vcsrepo { $dir:
    ensure   => present,
    provider => git,
    source   => $repository,
    revision => $version,
    user     => $user,
  }

  # Disabling this until https://github.com/alcaeus/mongo-php-adapter/issues/30 is fixed
  # Install vendors
  #composer::exec { 'xhgui':
  #  cmd       => 'install',
  #  cwd       => $dir,
  #  user      => $xhgui::params::www_user,
  #  scripts   => true,
  #  logoutput => on_failure, # So the more detailed Composer error message is shown
  #  require   => Vcsrepo[$dir],
  #}
}
