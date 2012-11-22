@set   connection_string=rene/rene

@rem   --------------------------------
@rem   start four sessions

@start session_blue.bat
@start session_blue.bat
@start session_blue.bat
@start session_blue.bat



@rem   --------------------------------
@rem   start another session to stop the
@rem   executions of the other four 
@rem   sessions:

@start session_green.bat
