SELECT events._id as 'Eintrag',
datetime(events.timestamp/1000, 'UNIXEPOCH', 'localtime') as 'Zeitstempel in lokaler Zeit',

CASE
when events.type=0 THEN 'NONE'
when events.type=1 THEN 'ACTIVITY_RESUMED'
when events.type=2 THEN 'ACTIVITY_PAUSED'
when events.type=5 THEN 'CONFIGURATION_CHANGE'
when events.type=7 THEN 'USER_INTERACTION'
when events.type=8 THEN 'SHORTCUT_INVOCATION'
when events.type=10 THEN 'NOTIFICATION PANEL'
when events.type=11 THEN 'STANDBY_BUCKET_CHANGED'
when events.type=12 THEN 'NOTIFICATION'
when events.type=15 THEN 'SCREEN_INTERACTIVE -> "Screen turned on for full user interaction, not ambient display or other non-interactive state")'
when events.type=16 THEN 'SCREEN_NON_INTERACTIVE -> "Screen completely turned off or turned on only in a non-interactive state like ambient display")'
when events.type=17 THEN 'KEYGUARD_SHOWN -> "Lockscreen" wird gezeigt, egal, ob der Bildschirm ein- oder ausgeschaltet ist'
when events.type=18 THEN 'KEYGUARD_HIDDEN -> "Lockscreen wird ausgeblendet" - passiert typischerweise, wenn das Gerät entsperrt wird'
when events.type=19 THEN 'FOREGROUND_SERVICE START'
when events.type=20 THEN 'FOREGROUND_SERVICE_STOP'
when events.type=23 THEN 'ACTIVITY_STOPPED'
when events.type=26 THEN 'DEVICE_SHUTDOWN'
when events.type=27 THEN 'DEVICE_STARTUP'
else 'UNBEKANNTER EVENTTYP'
END as 'EventTyp-Beschreibung',
packages.package_name as 'laufendes Paket',
events.package_id as 'Paket-ID',
events.type as EventTyp
FROM events
INNER JOIN packages
ON events.package_id = packages._id;

