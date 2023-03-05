
Asking price reasoningThe product has very strong annual revenue growth and a very low churn rate for established customers. It has a core base of happy customers that have been using it for years. The product is mature and battle-tested with thousands of PDFs. A lot of time and effort has been invested into the software over many years, so the IP is also worth quite a lot.

Date founded

Oct 2017

Startup team size

2

SaaS startup

United States(Delaware)

Tool designed for developers to fill out PDFs with an API request

Profitable SaaS with $246,000 in TTM revenue that is a PDF generation service with an API that can be used to fill out PDF form templates, such as contracts, tax forms, immigration forms, etc. A visual PDF template editor allows users to upload their PDFs and drag-and-drop fields on top of the form. PDF form fields are automatically imported, and the form can be edited in the template editor. ✅ $246,000 in TTM revenue ✅ Competitors: Pdffiller, Useanvil, Pdfgeneratorapi Please note: P&L reports are only accurate up to October 2022. (Bookkeepers are still working on Dec and Jan, and fixing a problem with spam invoices in November 2022.) Q&A: --------------------------------------------- > What are the costs of the business? The main costs are my salary (around $106k USD), AWS hosting costs (around $2k/mo), and bookkeeping / insurance / accounting. > How are you acquiring customers? I have not very done much marketing. I am really only acquiring customers through search at the moment. There is also a little bit of content marketing through blog posts and release notes. > Do you have anyone else working on the code and or any employees? It is just me at the moment, and a part-time support agent monitoring the Intercom inbox. > Is the code documented? We have a public documentation site (https://docspring.com/docs) and an internal wiki in Notion. The code is generally well commented, but it’s extremely well tested with a very good CI setup (CircleCI) and lots of unit/integration tests. > And how old is the stack? It’s quite an old codebase. The first commit is on the 27th of July, 2017. However, we’re on a semi-recent version of Ruby (2.7) and Rails (6.x). A Ruby 3 and Rails 7 upgrade shouldn’t take too much effort. > How many API requests are you handling right now and how many more could it scale to with your current config? We generated 184,668 PDFs over the last 30 days (and 59,626 test PDFs.) The current config might actually be overkill, but it can scale up pretty much indefinitely. I’m using Convox.com to manage Kubernetes clusters on AWS (EKS). This provides autoscaling, zero-downtime deploys, etc. It costs around $2k/mo to run two regions in the US and EU. It could be worth looking at some alternatives to reduce hosting costs. > How GDPR / CPA ready is the product? Have you investigated going for SOC2 or ISO27001? I have looked into SOC2 and ISO27001 but have not made any progress in this area due to the high costs and effort. I’ve heard about some services that make SOC2 compliance much easier now, so that would be a great investment. > Have you ever operated a security bug bounty for it? Not officially, but we have paid a few bug bounties when security researchers sent us emails about a vulnerability. > Have you ever done any security reviews of the code by an external party? No, only some automated scans and static analysis tools (e.g. brakeman, bundler-audit.)

Company overview

Business model and pricingB2B SaaS with monthly subscriptions for PDF quotas. Overage charges for additional PDFs. We also have a number of enterprise customers who run the software on their own servers via Docker.

Tech stack this product is built onReact, Ruby on Rails, Sidekiq, Postgres, Redis, AWS, Convox.com, Kubernetes (EKS). The application is deployed to multiple regions (US and EU.)

Product competitors

https://www.pdffiller.com
https://www.useanvil.com/products/pdf-filling-api
https://pdfgeneratorapi.com

Growth opportunityGrowth could be improved by working on SEO, marketing, and sales. I am not very strong in these areas as a technical solo founder, so there is a lot of room for improvement here.

Increase content marketingAdd new product featuresFocus on SEOHire a B2B sales teamSocial media marketingExpand to new marketsImprove conversion rates

Key assets

Codebase and IPWebsiteSocial media accountsDomainCustomersBrand

Acquisition details

Reason for sellingI'm a solo founder and I've been working on this product for a long time. I would like to take a break and then start working on something else in the future. However, I would be happy to stick around for a while and continue helping with development as a contractor.

FinancingSeed funding from Calm Fund (formerly Earnest Capital)

-----------------
https://help.syncfusion.com/file-formats/pdf/working-with-pdf-templates
https://www.syncfusion.com/forums/180906/couple-of-questions-about-syncfusion-pdf-library

![[screenshot-app.useanvil.com-2023.03.04-12_39_48.png]]