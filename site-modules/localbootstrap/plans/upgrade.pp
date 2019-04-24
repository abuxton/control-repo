plan localbootstrap::upgrade(
  TargetSpec            $nodes,
  String                $tmpdir,
  Optional[Boolean]     $debug = false,
){
  $r = run_task('localbootstrap::puppet_download', $nodes, 'debug' => $PT_debug )
  $r.each |$result| {
  $node = $result.target.name
  if $result.ok {
    notice("${node} returned a value: ${result.value}")
  } else {
    notice("${node} errored with a message: ${result.error.message}")
  }
}
  #run_task('localbootstrap::upgrade',$nodes, pe_version =>,tmpdir=>,'_run_as'=> 'root')
}
