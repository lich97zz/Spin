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
int lock_water_level = 3;


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
		   ::skip;
		fi;

		goto again	

}

init {
     atomic {
            run lock();
    }
}