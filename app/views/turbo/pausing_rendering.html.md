# Pausing rendering

You can pause the rendering of the next page to make additional preparations (like exit animations) before continuing. This pauses _after_ the request has been made.

- Use the `turbo:before-render` event to detect when rendering is about to start
- Pause using `event.preventDefault()`
- Continue using `event.detail.resume()`

This link pauses for a 5 second animation before continuing to the next page.

---

Code:

```html
<a href="/examples/seven"
     data-turbo="true"
     data-turbo-stream="true"
     data-action="advance">Pausing rendering</a>

<script>
  const animateOut = resolve => new Promise(resolve => setTimeout(resolve, 5000));

  document.addEventListener("turbo:before-render", async (event) => {
    event.preventDefault()
    console.log("pausing")
    await animateOut(event.srcElement.animate([ { opacity: 1 }, { opacity: 0 } ], 5000));
    console.log("resuming")

    event.detail.resume()
  })
</script>
```

Example:

<a href="/examples/seven"
     data-turbo="true"
     data-turbo-stream="true"
     data-action="advance">Pausing rendering</a>

<script>
  const animateOut = resolve => new Promise(resolve => setTimeout(resolve, 5000));

  document.addEventListener("turbo:before-render", async (event) => {
    event.preventDefault()
    console.log("pausing")
    await animateOut(event.srcElement.animate([ { opacity: 1 }, { opacity: 0 } ], 5000));
    console.log("resuming")

    event.detail.resume()
  })
</script>
