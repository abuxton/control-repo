plan localbootstrap::upgrade(
  TargetSpec $nodes,
){
  run_task('localbootstrap::puppetdownload', $nodes)
}
