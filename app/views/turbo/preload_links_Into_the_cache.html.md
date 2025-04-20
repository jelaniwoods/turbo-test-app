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

