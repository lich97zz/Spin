mtype {Open, Close};
chan inlet_valve_action = [1] of {mtype}

proctype inlet_valve(){
mtype action;
{do::	
	0<1;
	inlet_valve_action?action;
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