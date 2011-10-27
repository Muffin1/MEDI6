  require'md5'
  digest = MD5.hexdigest("Hello World\n")
  digest1 = MD5.hexdigest("Hello World\n")
  puts digest
    puts digest1