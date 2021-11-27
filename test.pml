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

/* The lock process keeps track of the water levels */
/* This process should check the state of the valves and update the water levels */
proctype lock(){
/* Your code modeling the lock water level goes here */
}

/* The following two processes handle the valves.
The valve listens to the inlet_valve_action, and outlet_valve_action channels
If they see the "Open" message, they will open.
When the water levels match the valve will close.
They will notify the doors when they close by sending true using the valve_ready channel */
proctype inlet_valve(){
/* Your code modeling the inlet valve goes here */
}

proctype outlet_valve(){
{
/* Your code modeling the outlet valve goes here */
}

/* The following two processes handles the doors.
The doors open their valves after they close
they can use the channels downstream_door_action and upstream_door_action to see what they need to do.
The boat will send them a command to 'Open' or 'Close'. 

inlet_valve_action and outlet_valve_action channels can be used to communicate with the valves.
When the door is open they will send a message to the boat using the door_ready channel (door_ready ! true).
*/
proctype downstream_door() {
/* Your code modeling the downstream door goes here */
}

proctype upstream_door() {
/* Your code modeling the upstream door goes here */
}

/* Process for the boat. Will keep running forever*/
proctype boat(mtype:loc current_location; mtype:heading destination_in) {
destination = destination_in;
my_location = current_location;

/* Your code modeling the boat goes here */
/* to request the downstream_door to open you can send a msg in the downstream_door_action channel (downstream_door_action ! Open) */
/* to check if the door has sent a message indicating it is ready you can use the commmand - door_ready ? true */

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