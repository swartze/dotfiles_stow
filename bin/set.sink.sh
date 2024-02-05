#! /bin/env bash

pactl list short sinks

echo "Enter Sink":
read sinks

pactl set-default-sink $sinks
