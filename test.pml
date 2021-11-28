mtype {Open, Close};
chan inlet_valve_action = [1] of {mtype}

proctype inlet_valve(){
mtype action;
{do::	
	
	if :: (inlet_valve_action?action) -> action=Close;
	   :: skip;
	fi
:: timeout -> goto end_func
od}	
end_func:
	printf("reaching end at pos5\n");
}

init {
     atomic {
            run inlet_valve();
    }
}