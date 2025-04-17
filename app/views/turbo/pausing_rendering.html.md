
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
