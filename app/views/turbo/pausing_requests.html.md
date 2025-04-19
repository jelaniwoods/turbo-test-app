# Pausing requests

You can pause the sending of the request to do things (like setting the `Authorization` header).

---

The following link pauses for 5 seconds and then continues to the next page.

Code:

```html
<a href="/examples/seven"
     data-turbo="true"
     data-turbo-stream="true"
     data-action="advance">Pausing request</a>

<script>
  const pauseFor5 = resolve => new Promise(resolve => setTimeout(resolve, 5000));

  document.addEventListener("turbo:before-fetch-request", async (event) => {
    event.preventDefault()
    console.log("pausing")
    await pauseFor5(console.log("gathering important data required for request"));
    console.log("resuming")

    event.detail.resume()
  })
</script>
```

Example:

<a href="/examples/seven"
     data-turbo="true"
     data-turbo-stream="true"
     data-action="advance">Pausing request</a>

<script>
  const pauseFor5 = resolve => new Promise(resolve => setTimeout(resolve, 5000));

  document.addEventListener("turbo:before-fetch-request", async (event) => {
    event.preventDefault()
    console.log("pausing")
    await pauseFor5(console.log("gathering important data required for request"));
    console.log("resuming")

    event.detail.resume()
  })
</script>
