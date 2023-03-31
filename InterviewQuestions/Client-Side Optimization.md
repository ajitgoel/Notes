==- Limit the number of HTTP requests==
==- Combine all JavaScript resources into one==
- **Use CSS Sprites:** CSS sprites what is a technique to combine several images into a single image called a sprite sheet.
==- **Minify Resources (such as HTML, CSS, and JavaScript)**==
==- **File Compression:** All modern browsers support Gzip.==
==- Place JavaScript at the bottom of the HTML page==
==- Place stylesheets at the top==
==- Use CDN to cache all static data==
- Caching
There are various methods that can be used for cache validation as follows.
	-   **Last modified**. The server tells the browser what version of the file it is sending.
	-   **ETag**. This is a unique identifier given to every file. It’s like a hash, every file gets a unique hash, and if you change the file, the hash changes as well.
	-   **Expires**. This technique tells the client when the img.png will expire that keep using it until that date.
	-   **Max-Age.** In the max-age header, we can write “This file expires 1 week from today”.
-**Image Guidelines**
There are some good guidelines for image processing.
==-   It is good to reduce the size of an image without compromising the quality to a large extent by using various image compression utilities.==
-   Never set the dimension of an image using the width and height attributes of the HTML image element for dynamic resizing.
-   You should replace vector graphics with resolution-independent raster graphics.
-   PNG format is preferred.
- **DNS Lookups:** Since DNS Lookups increase the response time and bring latency, we should resolve the domain name before a user click a link.