# auto-shutdown
This script will open a command line prompt after a 2 hour timeout and ask the user for a random character, a-z, to prevent shutdown of the machine.  I add this script to MS Task Scheduler to be run at startup and on an event id 1 from the application source I created.  To do the same you will need to do a one time creation of the new application source event log by running the following command:

```powershell
New-EventLog -LogName Application -Source AutoShutdown
```

You can use whatever `-Source` you want but that will be the place you are grabbing event logs from to trigger a restart of the script if the user gives the correct input within the 2 minute window given to supply input to prevent shutdown.