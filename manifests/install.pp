class nscd::install (
  $pkg_ensure = $nscd::pkg_ensure
) {
  ensure_packages('nscd', { ensure => $pkg_ensure, })
}
