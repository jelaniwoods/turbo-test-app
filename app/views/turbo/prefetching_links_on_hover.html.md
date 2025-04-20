# Prefetching links on hover

Prefetching links is enabled by default since Turbo v8, but you can disable it by adding this meta tag to your page:

```html
<meta name="turbo-prefetch" content="false">
```

You can disable prefetching on a per-element basis by annotating the element or any of its ancestors with `data-turbo-prefetch="false"`.

```html
<html>
  <head>
    <meta name="turbo-prefetch" content="true">
  </head>
  <body>
    <a href="/articles">Articles</a> <!-- This link is prefetched -->
    <a href="/about" data-turbo-prefetch="false">About</a> <!-- Not prefetched -->
    <div data-turbo-prefetch="false">
      <!-- Links inside this div will not be prefetched -->
    </div>
  </body>
</html>
```

This attribute respects ancestry as well

```html
<html>
  <body data-turbo-prefetch="false">
    <nav id="header" data-turbo-prefetch="true">
      <a href="/articles">Articles</a> <!-- This link is prefetched -->
      <a href="/about">About</a> <!-- This one as well -->
    </nav>
    <div id="body">
      <!-- Links inside this div will not be prefetched -->
    </div>
    <footer id="footer" data-turbo-prefetch="true">
      <!-- Links inside this footer will be prefetched -->
    </footer>
  </body>
</html>
```

You can also disable this behavior with JavaScript

```js
document.addEventListener("turbo:before-prefetch", (event) => {
  if (isSavingData() || hasSlowInternet()) {
    event.preventDefault()
  }
})

function isSavingData() {
  return navigator.connection?.saveData
}

function hasSlowInternet() {
  return navigator.connection?.effectiveType === "slow-2g" ||
         navigator.connection?.effectiveType === "2g"
}
```
