#/usr/bin/env bash

GREEN="#[fg=colour35]"
RED="#[fg=colour9]"

segment_cwd=$(dirname $0)
source "$segment_cwd/../lib.sh"

COLOR=$([[ $(pgrep -l httpd) ]] && echo $GREEN || echo $RED)
echo -n "${COLOR}httpd"

echo -n " "

COLOR=$([[ $(pgrep -l mysqld) ]] && echo $GREEN || echo $RED)
echo -n "${COLOR}mysqld"

echo -n " "

COLOR=$([[ $(ps aux | grep java | grep jamm) ]] && echo "$GREEN" || echo "$RED")
echo -n "${COLOR}cassandra"

echo -n " "

COLOR=$([[ $(pgrep -l redis-server) ]] && echo "$GREEN" || echo "$RED")
echo -n "${COLOR}redis"

echo -n " "

COLOR=$([[ $(pgrep -l beam.smp) ]] && echo "$GREEN" || echo "$RED")
echo -n "${COLOR}rabbitmq"
