Same as HelloWorld sample except HelloService (interface) is separated into different jar file from HelloServiceImpl (implementation). Now we have three bundles that must be deployed. This allows us the flexibility of adding/removing different HelloService implementations dynamically.

1. Build all four projects.
2. Install spec.jar, service.jar and client.jar
3. Start each of the bundles.
4. As an exercise, stop client.jar and notice the message. Start client.jar.
5. Install service2.jar.
6. Stop service.jar
7. Start service2.jar.
8. Stop client.jar. Notice the message. Cool!
