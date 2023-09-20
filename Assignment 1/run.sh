<<<<<<< HEAD
#!/bin/bash

docker build -t image/shortlived-container .

docker run \
  -d --rm \
  --name shortlived-container \
  --volume "$(pwd)/assignment":/usr/src/assignment\
  --network assignment-1-network\
  shortlived-container
=======
#!/bin/bash

docker build -t image/shortlived-container .

docker run \
  -d --rm \
  --name shortlived-container \
  --volume "$(pwd)/assignment":/usr/src/assignment\
  --network assignment-1-network\
  shortlived-container
>>>>>>> 131ea354a20034e3061a3247d9116179a7cd4f5f
  