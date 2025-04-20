# Preloading links into the cache

Preload links into Turbo Drive’s cache using the `data-turbo-preload` boolean attribute.

This will make page transitions feel lightning fast by providing a preview of a page even before the first visit. Use it to preload the most important pages in your application. Avoid over usage, as it will lead to loading content that is not needed.

The `data-turbo-preload` attribute won’t have any effect on links that:
- navigate to an external domain
- have a `data-turbo-frame` attribute that connects to a `<turbo-frame>` element
- are within a `<turbo-frame>` element
- have or inherit `data-turbo="false"`
- have `data-turbo-stream` attribute
- have or inherit `data-turbo-prefetch="false"`

Works nice with eager/lazy-loading frames.

Preloaded `<a>` elements will dispatch `turbo:before-fetch-request` and `turbo:before-fetch-response` events. 

You can identify 

>  a preloading turbo:before-fetch-request initiated event from an event initiated by another mechanism, check whether the request’s X-Sec-Purpose header (read from the event.detail.fetchOptions.headers["X-Sec-Purpose"] property) is set to "prefetch":

```js
addEventListener("turbo:before-fetch-request", (event) => {
  if (event.detail.fetchOptions.headers["X-Sec-Purpose"] === "prefetch") {
    // do additional preloading setup…
  } else {
    // do something else…
  }
})
```
not entirely sure how this is useful or what the other case could be
