import "@working"

print "Starting with: ", current_file;
print "CPU cores: ", cpu_core_count();

task = async(delay(1.0), lambda () (print "done";))
wait(task)

input
