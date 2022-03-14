# Load Balancing Algorithms and Techniques

### Load Balancing Techniques:

#### Round Robin

[==Round-robin==](https://kemptechnologies.com/load-balancing/round-robin-load-balancing/) load balancing is one of the simplest and most used load balancing algorithms. ==Client requests are distributed to application servers in rotation==. For example, if you have three application servers: the first client request to the first application server in the list, the second client request to the second application server, the third client request to the third application server, the fourth to the first application server and so on.

This load balancing algorithm does not take into consideration the characteristics of the application servers i.e. it assumes that all application servers are the same with the same availability, computing and load handling characteristics.

#### Weighted Round Robin

==Weighted Round Robin== builds on the simple Round-robin load balancing algorithm to ==account for differing application server characteristics. The administrator assigns a weight to each application server based on criteria of their choosing to demonstrate the application servers traffic-handling capability.== If application server #1 is twice as powerful as application server #2 (and application server #3), application server #1 is provisioned with a higher weight and application server #2 and #3 get the same weight. If there five (5) sequential client requests, the first two (2) go to application server #1, the third (3) goes to application server #2, the fourth (4) to application server #3 and the fifth (5) to application server #1.

#### Least Connection

==Least Connection load balancing is a dynamic load balancing algorithm where client requests are distributed to the application server with the least number of active connections at the time the client request is received.== In cases where application servers have similar specifications, an application server may be overloaded due to longer lived connections; this algorithm takes the active connection load into consideration.

#### Weighted Least Connection

==Weighted Least Connection builds on the Least Connection load balancing algorithm to account for differing application server characteristics==. The administrator assigns a weight to each application server based on criteria of their choosing to demonstrate the application servers traffic-handling capability. The LoadMaster is making the load balancing criteria based on active connections and application server weighting.

#### Resource Based (Adaptive)

Resource Based (Adaptive) is a load balancing algorithm requires an agent to be installed on the application server that reports on its current load to the load balancer. The installed agent monitors the application servers availability status and resources. The load balancer queries the output from the agent to aid in load balancing decisions.

#### Resource Based (SDN Adaptive)

[SDN Adaptive](https://kemptechnologies.com/sdn-adaptive-load-balancing/) is a load balancing algorithm that combines knowledge from [Layers 2, 3, 4 and 7](https://kemptechnologies.com/load-balancing/layer-7-load-balancing/) and input from an SDN Controller to make more optimized traffic distribution decisions. This allows information about the status of the servers, the status of the applications running on them, the health of the network infrastructure, and the level of congestion on the network to all play a part in the load balancing decision making.

#### Fixed Weighting

==**Fixed Weighting** is a load balancing algorithm where the administrator assigns a weight to each application server based on criteria of their choosing to demonstrate the application servers traffic-handling capability. The application server with the highest weigh will receive all of the traffic. If the application server with the highest weight fails, all traffic will be directed to the next highest weight application server.==

#### Weighted Response Time

==**Weighted Response Time** is a load balancing algorithm where the response times of the application servers determines which application server receives the next request.== The application server response time to a health check is used to calculate the application server weights. The application server that is responding the fastest receives the next request.

#### Source IP Hash

Source IP hash load balancing algorithm that combines source and destination IP addresses of the client and server to generate a unique hash key. The key is used to allocate the client to a particular server. As the key can be regenerated if the session is broken, the client request is directed to the same server it was using previously. This is useful if it’s important that a client should connect to a session that is still active after a disconnection.

#### URL Hash

URL Hash is a load balancing algorithm to distribute writes evenly across multiple sites and sends all reads to the site owning the object.

------

# Load balancing: Round robin may not be the right choice
When it comes to load balancing, round robin may not be the best algorithm to choose from. If auto-scaling is instrumented, it is even worse. In this article, see a simple example explaining why this is so, how the round robin algorithm works, and which load balancing algorithm you should potentially pick instead for even traffic distribution.

Based on our experience, we believe round robin may not be an effective load balancing algorithm, because it doesn’t equally distribute traffic among all nodes.

You might wonder how this is possible? Yes, it is possible! 😊

## How does the round robin load balancing algorithm work?

Round robin algorithm sends requests among nodes in the order that requests are received. Here is a simple example. Let’s say you have 3 nodes: node-A, node-B, and node-C.

- First request is sent to node-A.
- Second request is sent to node-B.
- Third request is sent to node-C.

The load balancer continues sending requests to servers based on this order. It might seem that traffic would get equally distributed among the nodes. But that isn’t true.

## What is the problem with round robin algorithm?
Let’s pick up a simple example. Let’s say you launched your web application with a load balancer, and it has two nodes (node-A, node-B) behind it. The load balancer is configured to run with round robin algorithm, and sticky-session load balancing is enabled. Let’s say 200 users are using your application currently.

**SEE ALSO: [The new ValueType in Java](https://jaxenter.com/java-value-type-163446.html)**

Since the round robin algorithm is enabled in the load balancer, each node will get 100 users’ requests.

A few minutes later, you add node-C. Let’s say now additional 100 users start using the application. Since it’s round robin algorithm, the load balancer will distribute new users’ requests equally to all 3 nodes (i.e., 33 users request to each node).

But remember node-A and node-B is already processing 100 users requests each. So now node-A and node-B will end up processing 133 users requests each (i.e., 100 original users requests + 33 new users requests), whereas node-C will process only 33 (new) users requests. Now, do you see why round robin isn’t equally distributing the traffic?

==In the round robin algorithm, older nodes in the pool will always end-up processing more requests. Newly added nodes will end up processing less amount of traffic. The load is never evenly distributed.== For maintenance, patching & installation purposes, you have to continually keep adding and removing nodes from the load balancer pool.

If you instrumented auto-scaling in place, the problem gets even worse. In auto-scaling nodes are more dynamic. They get added and removed even more frequently.

## What algorithm to use?

There are a variety of load balancing algorithms: Weighted Round Robin, Random, Source IP, URL, least connections, least traffic, and least latency.

Given the shortcoming in round robin, you can consider trying other choices.

One choice you may consider is: ==‘**least connections**‘ algorithm. As per this algorithm, the node which has the least number of connections will get the next request.== Thus, as per our earlier example, when new 100 users start to use the application, all new users’ requests will be sent to node-C. Thus, the load will be equally distributed among all nodes

------