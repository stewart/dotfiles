function redis_up
  redis-server $FISH/redis/redis.conf > /dev/null &
end

function redis_down
  killall redis-server
end
