# What Is Pub/Sub?



==Pub/Sub is an asynchronous messaging service that decouples services that produce events from services that process events.==

You can use Pub/Sub as messaging-oriented middleware or event ingestion and delivery for streaming analytics pipelines.

Pub/Sub offers durable message storage and real-time message delivery with high availability and consistent performance at scale. Pub/Sub servers run in all [Google Cloud regions](https://cloud.google.com/about/locations) around the world.

To get started right away, try the [Quickstart using Cloud Console](https://cloud.google.com/pubsub/docs/quickstart-console). For a more comprehensive introduction, see [Building a functioning Pub/Sub system](https://cloud.google.com/pubsub/docs/quickstart-py-mac).

## Core concepts

- ==**Topic**: A named resource to which messages are sent by publishers.==
- ==**Subscription**: A named resource representing the stream of messages from a single, specific topic, to be delivered to the subscribing application.== For more details about subscriptions and message delivery semantics, see the [Subscriber Guide](https://cloud.google.com/pubsub/subscriber).
- ==**Message**: The combination of data and (optional) attributes that a publisher sends to a topic and is eventually delivered to subscribers.==
- ==**Message attribute**: A key-value pair that a publisher can define for a message.== For example, key `iana.org/language_tag` and value `en` could be added to messages to mark them as readable by an English-speaking subscriber.

## Publisher-subscriber relationships

A publisher application creates and sends messages to a *topic*. Subscriber applications create a *subscription* to a topic to receive messages from it. Communication can be one-to-many (fan-out), many-to-one (fan-in), and many-to-many, as the following diagram shows.

![Publishers A and B deliver messages to the same subscriber while Publisher C delivers messages to multiple subscribers.](C:\Users\ajitg\Notes\InterviewQuestions\Architecture\PubSub.assets\many-to-many.svg)

## Pub/Sub message flow

The following diagram is an overview of the components in the Pub/Sub system and how messages flow between them:

![The main components in the Pub/Sub system include messages, topics, and subscriptions.](C:\Users\ajitg\Notes\InterviewQuestions\Architecture\PubSub.assets\pub_sub_flow.svg)

1. A [*publisher* application](https://cloud.google.com/pubsub/docs/overview#endpoints) creates a *topic* in the Pub/Sub service and sends *messages* to the topic. A message contains a payload and optional *attributes* that describe the payload content.
2. The service ensures that published messages are retained on behalf of subscriptions. A published message is retained for a subscription until it is acknowledged by any subscriber consuming messages from that subscription.
3. Pub/Sub forwards messages from a topic to all of its subscriptions, individually.
4. A subscriber receives messages either by Pub/Sub *pushing* them to the subscriber's chosen endpoint, or by the subscriber *pulling* them from the service.
5. The subscriber sends an acknowledgement to the Pub/Sub service for each received message.
6. The service removes acknowledged messages from the subscription's message queue.

### Publisher and subscriber endpoints

Publishers can be any application that can make HTTPS requests to pubsub.googleapis.com: an App Engine app, a web service hosted on Google Compute Engine or any other third-party network, an app installed on a desktop or mobile device, or even a browser.

![HTTP requests are made by publishers such as services, apps, or IoT devices, and subscribers such as microservices or data apps.](C:\Users\ajitg\Notes\InterviewQuestions\Architecture\PubSub.assets\publishers_subscribers.svg)

Pull subscribers can also be any application that can make HTTPS requests to pubsub.googleapis.com.

Push subscribers must be Webhook endpoints that can accept POST requests over HTTPS.

## Common use cases

- **Balancing workloads in network clusters.** For example, a large queue of tasks can be efficiently distributed among multiple workers, such as Google Compute Engine instances.
- **Implementing asynchronous workflows.** For example, an order processing application can place an order on a topic, from which it can be processed by one or more workers.
- **Distributing event notifications.** For example, a service that accepts user signups can send notifications whenever a new user registers, and downstream services can subscribe to receive notifications of the event.
- **Refreshing distributed caches.** For example, an application can publish invalidation events to update the IDs of objects that have changed.
- **Logging to multiple systems.** For example, a Google Compute Engine instance can write logs to the monitoring system, to a database for later querying, and so on.
- **Data streaming from various processes or devices.** For example, a residential sensor can stream data to backend servers hosted in the cloud.
- **Reliability improvement.** For example, a single-zone Compute Engine service can operate in additional zones by subscribing to a common topic, to recover from failures in a zone or region.

## Pub/Sub integrations

The following diagram shows how Pub/Sub can integrate many components of Google Cloud.

![Pub/Sub can integrate input from Cloud Logging and Compute Engine with endpoints such as Dataflow and App Engine.](C:\Users\ajitg\Notes\InterviewQuestions\Architecture\PubSub.assets\cps_integration.svg)