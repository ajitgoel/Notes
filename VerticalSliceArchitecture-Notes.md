# Why vertical slice architecture is better—if you know these few things

==***Vertical slice architecture is becoming the preferred method for refactoring legacy systems (“vertical slice” being a crossection of code that runs from the front-end deep down to the data layer).== Our 
Many years back, we started a long term project by building an “onion” architecture. Within a couple of months, the cracks started to show in this style. So we moved towards a Command Query Responsibility Segregation (CQRS) pattern (before it had that name) and began building in vertical slices instead of layers (whether flat or concentric, layers are layers). Since then, we’ve almost exclusively built around vertical slice architectures for applications and systems and I can’t imagine going back to the constraints of layered architectures.

## What’s wrong with a layered architecture?

A layered architecture like the onion or “clean” pattern we started with is monolithic in nature:

<img src="https://mlclehz1uim6.i.optimole.com/zGhTKgw.n_tq~264a/w:772/h:567/q:90/https://headspring.com/wp-content/uploads/2019/11/CleanArchitecture.jpg" alt="img" style="zoom:50%;" />



This approach/architecture is really only appropriate for a minority of the typical requests in a system. These architectures also tend to be mock-heavy, with rigid rules around dependency management. In practice, I’ve found these rules rarely useful, and you start to get many abstractions around concepts that really shouldn’t be abstracted (Controller MUST talk to a Service that MUST use a Repository).

A more tailored approach to the system would enable you to treat each request as a distinct use case for how to approach its code. Because my system breaks down neatly into “command” requests and “query” requests (GET vs POST/PUT/DELETE in HTTP-land), moving towards a vertical slice architecture gives me CQRS out of the gate.

## So what is vertical slice architecture?

In this style, my architecture is built around distinct requests, encapsulating and grouping all concerns from front-end to back. You take a normal “n-tier” or hexagonal/whatever architecture and remove the gates and barriers across those layers, and couple along the axis of change:

<img src="https://mlclehz1uim6.i.optimole.com/zGhTKgw.n_tq~264a/w:955/h:596/q:90/https://headspring.com/wp-content/uploads/2019/11/Vertical-Slice-Architecture-1.jpg" alt="Vertical Slice Architecture" style="zoom:50%;" />

When adding or changing a feature in an application, I’m typically touching many different “layers” in an application. I’m changing the user interface, adding fields to models, modifying validation, and so on. Instead of coupling across a layer, we couple vertically along a slice. The goal is to **minimize coupling between slices and maximize coupling within a slice.**

With this approach, most abstractions melt away and we don’t need any kind of “shared” layer abstractions like repositories, services, controllers. Sometimes these are still required by our tools (like controllers or ORM units-of-work) but we keep our cross-slice logic sharing to a minimum.

In this way, each of our vertical slices can decide for itself how to best fulfill the request:

<img src="https://mlclehz1uim6.i.optimole.com/zGhTKgw.n_tq~264a/w:955/h:336/q:90/https://headspring.com/wp-content/uploads/2019/11/Vertical-Slice-Architecture-2-e1572925954236.jpg" alt="Vertical Slice Architecture requests" style="zoom:50%;" />

The old [Domain Logic patterns](https://martinfowler.com/eaaCatalog/) from the Patterns of Enterprise Architecture book no longer need to be an application-wide choice. Instead, we can start simple ([Transaction Script](https://martinfowler.com/eaaCatalog/transactionScript.html)) and simply refactor to the patterns that emerge from code smells we see in the business logic. New features only add code—you’re not changing shared code and worrying about side effects. Very liberating!

## What do you need to succeed with vertical slice architecture?

This approach assumes that your team understands code smells and refactoring. If your team doesn’t understand when a “service” is doing too much to push logic to the domain, this pattern is likely not for you.

You need a team that understands refactoring and can recognize when to push complex logic into the domain, into what DDD services *should* have been. They should also be familiar with other Fowler/[Kerievsky](https://industriallogic.com/xp/refactoring/) refactoring techniques. If you’ve got this knowledge in place, you’ll find this style of architecture able to scale far past the traditional layered, “onion” architectures.