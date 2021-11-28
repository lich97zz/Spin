/* File: hw5.pml */

/* We will use the following types to keep track of the direction the
boat is heading and the current location of the boat */
mtype:heading = {Downstream, Upstream};
mtype:loc = {down_gate, up_gate, inlock};

/* The boat can use the following message type to send commands to the doors */
mtype {Open, Close};

// Following 4 channels are used to send commands to the doors and valves
chan upstream_door_action = [1] of {mtype}
chan downstream_door_action = [1] of {mtype}
chan inlet_valve_action = [1] of {mtype}
chan outlet_valve_action = [1] of {mtype}

// Synchronization between the doors and the boat
chan door_ready = [0] of {bool}

// Synchronization between the doors and the valves
chan valve_ready = [0] of {bool}

/* Stores the destination direction and the current location of the boat */
mtype:heading destination;
mtype:loc my_location;

/* Status of the valves */
bool inlet_valve_open = 0;
bool outlet_valve_open = 0;

/* Status of the doors */
bool upstream_door_open = 0;
bool downstream_door_open = 1;

/* Two water level constants */
int upstream_level = 5;
int downstream_level = 0;

// Current water level in the lock
int lock_water_level = 0;
// end state
bool end = 0;

proctype lock(){
again:	if :: (upstream_door_open==1 || inlet_valve_open==1) -> {
				if :: lock_water_level<upstream_level -> {
					lock_water_level=lock_water_level+1;
					printf("lock water level increased, now %d\n", lock_water_level);
				}
				   :: skip;
				fi;
				}
		   :: (downstream_door_open==1 || outlet_valve_open==1) -> {
		   		if :: lock_water_level>downstream_level -> {
					lock_water_level=lock_water_level-1;
					printf("lock water level decreased, now %d\n", lock_water_level);
				}
				   :: skip;
				fi;
		   		}
		   :: end==1 -> goto end_func;
		fi;

		goto again	
end_func:

}

proctype inlet_valve(){
mtype action;
again:	inlet_valve_action?action;
		if :: (action==Open) -> {
				inlet_valve_open=1;
				printf("Inlet valve has opened\n");
				}
		   :: (upstream_level==lock_water_level) -> {
		   		inlet_valve_open=0;
				printf("Inlet valve has closed\n");
				valve_ready ! true;
		   		}
		   :: end==1 -> goto end_func;
		   :: skip;
		fi;

		goto again	
end_func:

}

proctype outlet_valve(){
mtype action;
again:	outlet_valve_action?action;
		if :: (action==Open) -> {
				outlet_valve_open=1;
				printf("Outlet valve has opened\n");
				}
		   :: (downstream_level==lock_water_level) -> {
		   		outlet_valve_open=0;
				printf("Outlet valve has closed\n");
				valve_ready ! true;
		   		}
		   :: end==1 -> goto end_func;
		   :: skip;
		fi;
		goto again	
end_func:

}

proctype downstream_door(){
mtype action;
again:	downstream_door_action ? action;
		if :: (action==Open) -> {
				downstream_door_open=1;
				printf("Down gate has opened\n");
				door_ready ! true;
				printf("Down gate sending msg to boat, informing it has opened\n");
				}
		   :: (action==Close) -> {
		   		downstream_door_open=0;
		   		printf("Down gate has closed\n");
		   		outlet_valve_action ? Open;
				printf("Down gate sending msg to outlet valve, asking it to open\n");
		   		}
		   :: end==1 -> goto end_func;
		   :: skip;
		fi;
		goto again	
end_func:

}


proctype upstream_door() {
mtype action;
again:	upstream_door_action ? action;
		if :: (action==Open) -> {
				upstream_door_open=1;
				printf("Up gate has opened\n");
				door_ready ! true;
				printf("Up gate sending msg to boat, informing it has opened\n");
				}
		   :: (action==Close) -> {
		   		upstream_door_open=0;
		   		printf("Up gate has closed\n");
		   		inlet_valve_action ? Open;
				printf("Up gate sending msg to inlet valve, asking it to open\n");
		   		}
		   :: end==1 -> goto end_func;
		   :: skip;
		fi;
		goto again	
end_func:

}

proctype boat(mtype:loc current_location; mtype:heading destination_in) {
destination = destination_in;
my_location = current_location;

mtype action;
again:	upstream_door_action ? action;
		if :: end==1 -> goto end_func;
		   :: (my_location==up_gate && destination==Upstream) -> end=1;
		   :: (my_location==down_gate && destination==Downstream) -> end=1;
		   :: (my_location==up_gate && destination==Downstream) -> {
				if :: upstream_door_open==0 -> {upstream_door_action!Open; my_location=inlock;}
				   :: upstream_door_open==1 -> my_location=inlock;
				fi;
				}
		   :: (my_location==inlock && destination==Downstream) -> {
		   		if :: downstream_door_open==0 -> {
		   				downstream_door_action!Open;
		   				my_location=down_gate;
		   				goto random_destination;
		   				}
				   :: downstream_door_open==1 -> {
				   		my_location==down_gate;
				   		goto random_destination;
				   		}
				fi;
		   		}
		   :: (my_location==down_gate && destination==Upstream) -> {
				if :: downstream_door_open==0 -> {downstream_door_action!Open; my_location=inlock;}
				   :: downstream_door_open==1 -> my_location=inlock;
				fi;
				}
		   :: (my_location==inlock && destination==Upstream) -> {
		   		if :: upstream_door_open==0 -> {
		   				upstream_door_action!Open;
		   				my_location=up_gate;
		   				goto random_destination;
		   				}
				   :: upstream_door_open==1 -> {
				   		my_location==up_gate;
				   		goto random_destination;
				   		}
				fi;
		   		}
		   //:: skip;
		fi;
		goto again	

random_destination:
	if :: 1==1 -> destination==Downstream;
	   :: 1==1 -> destination==Upstream;
	fi;
	goto again
end_func:

}




init {
     atomic {
            run lock();
            run upstream_door();
            run downstream_door();
            run outlet_valve();
            run inlet_valve();
            //run boat(up_gate, Downstream)
    }
}