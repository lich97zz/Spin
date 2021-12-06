/* File: hw5.pml */

ltl p3 { [] ( ( ((my_location==up_gate)&&(lock_water_level==upstream_level)) ||   ((my_location==down_gate)&&(lock_water_level==downstream_level)))  U (my_location==inlock) )}
mtype:heading = {Downstream, Upstream};
mtype:loc = {down_gate, up_gate, inlock};
mtype {Open, Close};

chan upstream_door_action = [1] of {mtype}
chan downstream_door_action = [1] of {mtype}
chan inlet_valve_action = [1] of {mtype}
chan outlet_valve_action = [1] of {mtype}
chan door_ready = [0] of {bool}
chan valve_ready = [0] of {bool}

mtype:heading destination;
mtype:loc my_location;

bool inlet_valve_open = 0;
bool outlet_valve_open = 0;
bool upstream_door_open = 0;
bool downstream_door_open = 1;

int upstream_level = 5;
int downstream_level = 0;


int lock_water_level = 0;
bool end = 0;

proctype lock(){
{do::	
	0<1;
	if :: (upstream_door_open==1 || inlet_valve_open==1) -> atomic{
			if :: lock_water_level<upstream_level -> {
				lock_water_level=lock_water_level+1;
				printf("lock water level increased, now %d\n", lock_water_level);
			}
			   ::skip;
			fi;

			}
	   :: (downstream_door_open==1 || outlet_valve_open==1) -> atomic{
	   		if :: lock_water_level>downstream_level -> {
				lock_water_level=lock_water_level-1;
				printf("lock water level decreased, now %d\n", lock_water_level);
			}
			   ::skip;
			fi;
	   		}
	   :: end==1 -> goto end_func;
	   :: timeout -> goto end_func;
	   :: skip;
	fi;
:: timeout -> goto end_func
od}	
end_func:
	//printf("pos1 released lock\n");
}

proctype inlet_valve(){
mtype action;
{do
    :: !timeout;
    if :: inlet_valve_action?action -> {
			if :: (action==Open) -> atomic{
				inlet_valve_open=1;
				printf("Inlet valve has opened\n");
				upstream_level==lock_water_level;
				inlet_valve_open=0;
				printf("Inlet valve has closed\n");
				upstream_door_action ! Open;
				}
		   :: end==1 -> goto end_func;
		   :: timeout -> goto end_func;
			fi;
    	 }
       :: skip;
    fi
    :: timeout -> goto end_func
od}

end_func:
	//printf("pos2 released lock\n");
}

proctype outlet_valve(){
mtype action;
{do
    :: !timeout;
    if :: outlet_valve_action?action -> {
			if :: (action==Open && outlet_valve_open==0) -> atomic{
				outlet_valve_open=1;
				printf("Outlet valve has opened\n");
				downstream_level==lock_water_level;
				outlet_valve_open=0;
				printf("Outlet valve has closed\n");
				downstream_door_action ! Open;
				}
		   		:: end==1 -> goto end_func;
		   		:: timeout -> goto end_func;
			fi;
    	 }
       :: skip;
    fi
    :: timeout -> goto end_func
od}

end_func:
	//printf("pos3 released lock\n");
}

proctype downstream_door(){
mtype action;
{do
    :: !timeout;
    if :: downstream_door_action ? action -> {
			if :: (action==Open) -> atomic{
				downstream_door_open=1;
				printf("Down gate has opened\n");
				printf("Down gate sending msg to boat, informing it has opened\n");
				door_ready ! true;
				}
		   :: (action==Close) -> atomic{
		   		downstream_door_open=0;
		   		printf("Down gate has closed\n");
		   		printf("Down gate sending msg to outlet valve, asking it to open\n");
		   		outlet_valve_action ! Open;
		   		}
		   :: timeout -> goto end_func
		   :: end==1 -> goto end_func;
			fi;
    	 }
       :: skip;
    fi
    :: timeout -> goto end_func
od}

end_func:
	//printf("pos4 released lock\n");
}


proctype upstream_door() {
mtype action;

{do
    :: !timeout;
    if :: upstream_door_action ? action -> {
			if :: end==1 -> goto end_func;
			   :: (action==Open) -> atomic{
					upstream_door_open=1;
					printf("Up gate has opened\n");
					printf("Up gate sending msg to boat, informing it has opened\n");
					door_ready ! true;
					}
			   :: (action==Close) -> atomic{
			   		upstream_door_open=0;
			   		printf("Up gate has closed\n");
			   		printf("Up gate sending msg to inlet valve, asking it to open\n");
			   		inlet_valve_action ! Open;
				   	}
			fi;
    	 }
       :: timeout -> goto end_func
       :: skip;
    fi
    :: timeout -> goto end_func
od}

end_func:
	//printf("pos5 released lock\n");
}

proctype boat(mtype:loc current_location; mtype:heading destination_in) {
destination = destination_in;
my_location = current_location;

mtype action;
again:	
		if :: end==1 -> {printf("Arrived the end with correct direction\n");
						goto end_func;}
		   :: (my_location==up_gate && destination==Upstream) -> {end=1; /*printf("pos* set end 1\n")*/}
		   :: (my_location==down_gate && destination==Downstream) -> {end=1;/*printf("pos* set end 1\n")*/}
		   :: (my_location==up_gate && destination==Downstream) -> {
				if :: upstream_door_open==0 -> atomic{
						downstream_door_open = 0;
						printf("Downstream door closed\n");
						inlet_valve_action ! Open;
						door_ready?true;
						
						my_location=inlock;
						printf("Boat went from upstream to inlock\n");

						}
				   :: upstream_door_open==1 -> atomic{
				   		my_location=inlock;
				   		printf("Boat went from upstream to inlock\n");
				   		}
				fi;
				}
		   :: (my_location==inlock && destination==Downstream) -> {
		   		if :: downstream_door_open==0 -> atomic{
		   				upstream_door_open = 0;
						printf("Upstream door closed\n");
						outlet_valve_action ! Open;

		   				door_ready?true;
		   				my_location=down_gate;
		   				printf("Boat went from inlock to down gate\n");
		   				goto random_destination;
		   				}
				   :: downstream_door_open==1 -> atomic{
				   		my_location==down_gate;
				   		printf("Boat went from inlock to down gate\n");
				   		goto random_destination;
				   		}
				fi;
		   		}
		   :: (my_location==down_gate && destination==Upstream) -> {
				if :: downstream_door_open==0 -> atomic{
						upstream_door_open = 0;
						printf("Upstream door closed\n");

						outlet_valve_action ! Open;
						door_ready?true;
						my_location=inlock;
						printf("Boat went from down gate to inlock\n");
						}
				   :: downstream_door_open==1 -> atomic{
				   		my_location=inlock;
				   		printf("Boat went from down gate to inlock\n");
				   		}
				fi;
				}
		   :: (my_location==inlock && destination==Upstream) -> {
		   		if :: upstream_door_open==0 -> atomic{
		   				downstream_door_open = 0;
						printf("Downstream door closed\n");
						inlet_valve_action ! Open;

		   				door_ready?true;
		   				my_location=up_gate;
		   				printf("Boat went from inlock to upgate\n");
		   				goto random_destination;
		   				}
				   :: upstream_door_open==1 -> atomic{
				   		my_location==up_gate;
				   		printf("Boat went from inlock to upgate\n");
				   		goto random_destination;
				   		}
				fi;
		   		}
		fi;

		goto again	

random_destination:
	if :: true -> {destination=Downstream;printf("Boat now heading downstream\n");}
	   :: true -> {destination=Upstream;printf("Boat now heading upstream\n");}
	fi;
	goto again
end_func:
	//printf("pos6 released lock\n");
}




init {
     atomic {
            run lock();
            run upstream_door();
            run downstream_door();
            run outlet_valve();
            run inlet_valve();
            run boat(up_gate, Downstream)
    }
}