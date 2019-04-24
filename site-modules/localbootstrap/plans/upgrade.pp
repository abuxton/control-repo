plan localbootstrap::upgrade(
  TargetSpec $nodes,
){
  run_task('localbootstrap::puppet_download', $nodes)
}
