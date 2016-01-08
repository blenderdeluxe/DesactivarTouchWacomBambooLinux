#!/bin/bash
id=$(xinput --list --id-only 'Wacom Bamboo 2FG 6x8 Finger touch')
devEnabled=$(xinput --list-props $id | awk '/Device Enabled/{print !$NF}')

xinput --set-prop $id 'Device Enabled' $devEnabled
case "$devEnabled" in

	0)  notify-send --icon computer 'Touch de tu Wacom fue desactivado'
	    ;;
	1)  notify-send --icon computer 'Touch de tu Wacom fue activado'
	    ;;
	*)  notify-send --icon computer 'Hubo un problema'
	   ;;
	esac
