import "libs/utils"

' Meta information.
print "Starting with: ", _current_file;
print "CPU cores: ", cpu_core_count;

' Data sequence.
print ;
print "Data sequence test...";

data 1, 2, 3
read a, b, c
print a; b; c;

' Coroutine test.
print ;
print "Coroutine test...";

co0 = coroutine(
    lambda (x, y) (
        print x / y;
        for i in list(1 to 3)
            yield i
        next
        yield lambda () (print "I = " + str(i);)
        yield list()
        yield coroutine(lambda () (print "NESTED";))
        return "CO"
    ),
    22, 7
)
while move_next(co0)
    t = get(co0)
    if t is type("NUMBER") then
        print t;
    elseif t is type("STRING") then
        print t;
    elseif t is type("LIST") then
        print "LIST";
    elseif t is type("ROUTINE") then
        t()
    else
        while move_next(t)
        wend
    endif
wend

co1 = coroutine(
    lambda () (
        for i in list(1 to 3)
            print "1 ", i;
            yield i
        next
    )
)
start(co1)
while move_next(co1)
    ' Do nothing.
wend

' Exception test.
print ;
print "Exception test...";

try(
    lambda () (
        print "Try.";
        for i in list(1 to 3)
            print i;
        next
    ),
    lambda (_) (
        print "Catch: ", _, ".";
    ),
    lambda () (
        print "Finally.";
    )
)

co2 = coroutine(
    lambda () (
        try(
            lambda () (print "Try.";),
            lambda (_) (print "Catch: ", _, ".";),
            lambda () (print "Finally.";)
        )
    )
)
while move_next(co2)
    ' Do nothing.
wend

' Async work queue test.
print ;
print "Async test...";

task = async(sleep(0.5), lambda (_) (print "Done.";))
await(task)
print get(task);
print task;

' Graphics test.
print ;
print "Graphics test...";

drv = driver()
print drv;

x = 0
y = 0
dx = 500
dy = 500
while valid(driver())
    x = x + dx * delta
    y = y + dy * delta
    if x > 500 then
        x = 500
        y = 500
        dx = -dx
        dy = -dy
    elseif x < 0 then
        x = 0
        y = 0
        dx = -dx
        dy = -dy
    endif
    circ 101 + x, 201 + y, 100, true, rgba(0, 0, 255)
    col rgba(0, 255, 0, 127)
    circ 101 + x, 101, 100, true
    circ 201, 201 + y, 100, rgba(255, 0, 0)
    delta = sync
wend
