rule dev_null_rm : notable {
  strings:
    $dev_null_rm = /[ \w\.\/\&\-%]{0,32}\/dev\/null\;rm[ \w\/\&\.\-\%]{0,32}/
  condition:
    any of them
}


rule sleep_rm : notable {
  strings:
    $dev_null_rm = /sleep;rm[ \w\/\&\.\-\%]{0,32}/
  condition:
    any of them
}