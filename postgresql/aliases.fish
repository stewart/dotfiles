function pg_up
  pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start
end

function pg_down
  pg_ctl -D /usr/local/var/postgres stop -s -m fast
end
