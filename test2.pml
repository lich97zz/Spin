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
again:	if :: (upstream_door_open==1 || inlet_valve_open==1) -> atomic{
				if :: lock_water_level<upstream_level -> {
					lock_water_level=lock_water_level+1;
					printf("lock water level increased, now %d\n", lock_water_level);
				}
				   :: skip;
				fi;
				}
		   :: (downstream_door_open==1 || outlet_valve_open==1) -> atomic{
		   		if :: lock_water_level>downstream_level -> {
					lock_water_level=lock_water_level-1;
					printf("lock water level decreased, now %d\n", lock_water_level);
				}

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
		if :: (action==Open) -> atomic{
				inlet_valve_open=1;
				printf("Inlet valve has opened\n");
				}
		   :: (inlet_valve_open==1 && upstream_level==lock_water_level) -> atomic{
		   		inlet_valve_open=0;
				printf("Inlet valve has closed\n");
				upstream_door_action ? Open;
		   		}
		   :: end==1 -> goto end_func;
		fi;

		goto again	
end_func:

}

proctype outlet_valve(){
mtype action;
again:	outlet_valve_action?action;
		if :: (action==Open) -> atomic{
				outlet_valve_open=1;
				printf("Outlet valve has opened\n");
				}
		   :: (downstream_level==lock_water_level) -> atomic{
		   		outlet_valve_open=0;
				printf("Outlet valve has closed\n");
				valve_ready ! true;
		   		}
		   :: end==1 -> goto end_func;
		fi;
		goto again	
end_func:

}

proctype downstream_door(){
mtype action;
again:	downstream_door_action ? action;
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
		   :: end==1 -> goto end_func;
		fi;
		goto again	
end_func:

}


proctype upstream_door() {
mtype action;
again:	upstream_door_action ? action;
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
		goto again	
end_func:

}

proctype boat(mtype:loc current_location; mtype:heading destination_in) {
destination = destination_in;
my_location = current_location;

mtype action;
again:	printf("again...\n");
		
		if :: end==1 -> {printf("Arrived the end with correct direction\n");
						goto end_func;}
		   :: (my_location==up_gate && destination==Upstream) -> end=1;
		   :: (my_location==down_gate && destination==Downstream) -> end=1;
		   :: (my_location==up_gate && destination==Downstream) -> {
				if :: upstream_door_open==0 -> atomic{
						downstream_door_action ! Close;
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
		   				downstream_door_action!Open;
		   				printf("Boat sent msg to require downstream door open\n");
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
						downstream_door_action!Open; 
						printf("Boat sent msg to require downstream door open\n");
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
		   				upstream_door_action!Open;
		   				printf("Boat sent msg to require upstream door open\n");
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
		   //:: skip;
		fi;
		goto again	

random_destination:
	if :: 1==1 -> {destination==Downstream;printf("Boat now heading downstream\n");}
	   :: 1==1 -> {destination==Upstream;printf("Boat now heading upstream\n");}
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
            run boat(up_gate, Downstream)
    }
}