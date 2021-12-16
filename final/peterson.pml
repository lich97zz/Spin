/**
 * Peterson Mutual Exclusion for 2 processes
 */
ltl prop1 { !<> (mutex[0]@critical && mutex[1]@critical)}
ltl prop2 { [] ((mutex[0]@trying || mutex[1]@trying) -> <>(mutex[0]@critical || mutex[1]@critical)) }
ltl prop3 { [] (((([] (<>mutex[0]@trying)) || _last==0) && (([] (<>mutex[1]@trying)) || _last==1)) -> (mutex[0]@trying -> mutex[0]@critical) || (mutex[1]@trying -> mutex[0]@critical))}
//both run infinitely often
// (([] (<>mutex[0]@trying)) || _last==0)
//  &&
// (([] (<>mutex[1]@trying)) || _last==1)
//a process enter the trying section
//mutex[0]@trying -> mutex[0]@critical

//((([] (<>mutex[0]@trying)) || _last==0) && (([] (<>mutex[1]@trying)) || _last==1)) -> (mutex[0]@trying -> mutex[0]@critical)
bool turn;
bool flag[2];
byte ncrit;

active [2] proctype mutex()
{
    pid i, j;
    i = _pid;
    j = 1 - _pid;

trying:
    flag[i] = true;
    turn = i;
    !(flag[j] && turn == i) ->

critical:
    ncrit++;
    assert(ncrit == 1);
    ncrit--;

    flag[i] = false;
    goto trying
}
