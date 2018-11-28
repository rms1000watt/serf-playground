# Serf Playground

## Introduction

Playground for Serf

## Contents

- [Start](#start)

## Start

```bash
vagrant up --parallel

vagrant ssh n1
nohup serf agent -bind=172.20.20.10 -event-handler=user:cmd=/home/vagrant/event.cmd.sh -log-level=debug &
exit

vagrant ssh n2
nohup serf agent -bind=172.20.20.11 -event-handler=user:cmd=/home/vagrant/event.cmd.sh -log-level=debug &
serf join 172.20.20.10
serf members
serf event cmd "echo 123"
serf event cmd "echo 345"
serf event cmd "curl https://raw.githubusercontent.com/rms1000watt/serf-playground/master/test.sh -o /home/vagrant/test.sh"
serf event cmd "bash /home/vagrant/test.sh"
serf event cmd "cat /home/vagrant/test.txt"

cat nohup.out
exit
```
