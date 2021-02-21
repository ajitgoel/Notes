**<u>Improving bulk insert performance:</u>**

**Set:**
yourContext.Configuration.AutoDetectChangesEnabled = false;
yourContext.Configuration.ValidateOnSaveEnabled = false;
**Do `SaveChanges()` in packages of 100 inserts...** or you can try with packages of 1000 items and see the changes in performance.
Since during all this inserts, the context is the same and it is getting bigger, you can **rebuild your context object every 1000 inserts.** `var yourContext = new YourContext();`