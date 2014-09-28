#! /bin/bash


xfce4-panel &

sleep 2

wmctrl -r xfce4-panel -b add,below &

sleep 4

ipager &

sleep 1

wmctrl -r ipager -b add,below &


