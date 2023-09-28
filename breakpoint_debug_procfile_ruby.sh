#!/bin/bash

# Run Foreman and filter out lines containing "rdbg@puma: cluster worker"
# This will make the output of rdbg much cleaner.

# foreman start -f Procfile.debug.dev 2>&1 | grep -v "rdbg@puma: cluster worker"

#!/bin/bash

# Run Foreman and capture its output, then pipe through the necessary filters
foreman start --no-timestamp -f Procfile.debug.dev 2>&1 | tee >(grep "rdbg@puma: cluster worker" > cluster_worker.log) | sed 's/(rdbg)//g'

