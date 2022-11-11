#!/bin/bash

docker run  -v your-notebook-folder:/notebooks \
            -v /home/stephen/Github/PGAM/tests/config:/config \
            -v /home/stephen/Github/PGAM/tests/input:/input \
            -v /home/stephen/Github/PGAM/tests/output:/output \
            -v /home/stephen/Github/PGAM/tests/scripts:/scripts \
            -ti -p 8888:8888 edoardobalzani87/pgam:1.0
