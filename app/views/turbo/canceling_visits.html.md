
## Canceling requests

- The server log _does_ record a request to the `href`.
- The page from the visit **is not rendered**.

Code:

```html
<a href="/examples/five"
     data-turbo="true"
     data-turbo-stream="true"
     data-action="advance">Visit will be cancelled</a>

<script>
  document.addEventListener("turbo:before-visit", async (event) => {
    console.log(event.detail.url)
    if (event.detail.url.includes("/examples/five")) {
      event.preventDefault()
      console.log("cancelled")
    }
  })
</script>
```

Example:

<a href="/examples/five"
     data-turbo="true"
     data-turbo-stream="true"
     data-action="advance">Visit will be cancelled</a>

<script>
  document.addEventListener("turbo:before-visit", (event) => {
    console.log(event.detail.url)
    if (event.detail.url.includes("/examples/five")) {
      event.preventDefault()
      console.log("cancelled")
    }
  })
</script>
