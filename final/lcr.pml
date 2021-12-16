/**
 * File: lcr.pml
 */

ltl prop1 {<> (num_leaders==1)}
ltl prop2 {!<> (num_leaders>1)}
ltl prop3 {((leader_id==0 && num_leaders==1) -> <>([] leader_id==0)) || ((leader_id==1 && num_leaders==1) -> <>([] leader_id==1)) || ((leader_id==2 && num_leaders==1) -> <>([] leader_id==2)) || ((leader_id==3 && num_leaders==1) -> <>([] leader_id==3)) || ((leader_id==4 && num_leaders==1) -> <>([] leader_id==4))}
//((leader_id==0 && num_leaders==1) -> <>([] leader_id==0)) ||
//((leader_id==1 && num_leaders==1) -> <>([] leader_id==1)) ||
//((leader_id==2 && num_leaders==1) -> <>([] leader_id==2)) ||
//((leader_id==3 && num_leaders==1) -> <>([] leader_id==3)) ||
//((leader_id==4 && num_leaders==1) -> <>([] leader_id==4))
#define N 5
#define BUFSIZE 10

mtype = { candidate, leader };

// Messages are made up of mtype combined with a byte for the id
chan c[N] = [BUFSIZE] of { mtype, byte };

byte num_leaders = 0;

proctype node(chan prev, next; byte my_id)
{
    byte in_id;
    byte leader_id;

    // init: pass the node id to its neighbour
    next!candidate(my_id);

    // wait for a msg from the neighbor in the ring
    do
        :: prev?candidate(in_id) ->
            if
                // if there is a process with bigger id 
                // propose that as the leader
                :: in_id > my_id -> 
                    next!candidate(in_id);
                :: in_id < my_id ->
                    skip;
                // if you receive your own pid then it has 
                // travelled around the ring
                :: else -> 
                    num_leaders++; // you can appoint yourself as the leader
elected:
                    printf("I am the leader! (id: %d)\n", my_id);
                    next!leader(my_id);
            fi
        :: prev?leader(leader_id) -> // send msg announcing the leader
            if
                :: leader_id > my_id ->
                    next!leader(leader_id);
                    break;
                :: else ->
                    assert(my_id == leader_id);
                    break;
            fi
    od;
    assert(num_leaders == 1); // NOTE: if more than one node
                              // declares itself as leader, then
                              // this assertion will fail for
                              // at least one node!
}

init {
    byte proc;
    byte i;

    // Launches N nodes
    // The nodes are fixed in a logical ring based on the launch order.
    atomic {
        chan prev, next;
        byte id;
        do 
            :: i < N -> i++;
            :: true -> break; 
        od; 
        do
            :: proc < N ->
            // Setting up the ring. 
                prev = c[proc];
                next = c[(proc+1)%N];
                id = (N+i-proc)%N;
                printf("Starting process with id %d.\n", id);

                // The previous and next channels are used 
                // to communicate with the neighbors on the ring 
                run node(prev, next, id);
                proc++;
            :: else ->
                break;
        od
    }
}
